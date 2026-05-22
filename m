Return-Path: <linux-arm-msm+bounces-109359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OI8FlN/EGrdXwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:07:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 590BC5B75CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EA6F301F4F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C610239E80;
	Fri, 22 May 2026 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGjclDmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjYtmLA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A768339708
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463866; cv=pass; b=PNxdPALCTLoe2KINvzFugv5CzKH6Dw4fGHY273e3NT3jo/Qbvvj51ss3nduCbM6yABpk5J60WBue2Ro4sWSRnLMCvaaezeXgZI/FbhqcIrNGNK4Rg0FDtgBkvoKNv6qsOsdd7SlcFCV3umlURXQIxGtH9IqxXINrxemODxRLGVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463866; c=relaxed/simple;
	bh=qRaoRj7Z7epM8eNtDzoPZWmrKrcuuGtXDIX1NKORdns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWfmJ13eDwOuaJdWvFnK2L2KcTEmL4uZJSh1rkPX0G2QH9I2S2iaPZRv+tWEcGFUKLBDCI3ZNSzMxM7oTjDAleKZCIr8AAbfDj2yAb/6W7g2zKRlxKZcMBvUYUoR9jvX53D05i0wq4sYLauHbH4iEdaJ1jGQs6+rUHkcOajZasY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGjclDmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjYtmLA8; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAwZCo777328
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SJt7uXqKxxv9L0dYj6MneQW8VsUAWyiu/ky5nnWUBU=; b=TGjclDmdB7J2z2IA
	Hb2J02Cv0PknCa472LLNSPukhwIEEcnJCjPrMxlmR540+r22FDsAv1S0WQygWt1Q
	fJNJJdRJnInjncoYu60ZFbNEqd34F0olPBkwhZ83rVLzCqO6NnmxUVvhjVUwb1V8
	f44dd9lVVQQUllnDFSWNPULNTVHe/wbVsULn19MdP5bQuVL2lutgSLTJGK0Qlx7M
	1vqPpLhf1HeJBHctPu+0wZuziWB/BywrsORyxtGgxKtTTwUHQ60jpcd+TNpthGBJ
	+gw47Oo0P90AIaiDFlIohf5NVkvK2MMgJ6tuTN8rhWrdpRPavE6EkCX0zejEnCtR
	Qj9CYA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h46sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:31:02 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-484af6e4d26so5673269b6e.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779463862; cv=none;
        d=google.com; s=arc-20240605;
        b=cmLcZEdU0D3quTBLTuo8pqwBStVD964Zk0DsC8BdpOIPN4KuL4Tu4G54AmkeHqIwSA
         lIbWrfXUvHAJ0dxi7kl4wUQkDu7CscIHy2Ty9/sqrLp+LDWtRwOLyHh1V9kH/lZn/87O
         mmjDNsxvBQYNnfJhthgo6j4hjKJVx24XFHbHBH/n+lbeddL1WalMwdmHi72MX/SD61+Y
         gYKYqp9AEZKHc1217DTW9AcacDbOzomPm0snok1sIItNsi5BDwfdz9zQGA3J8HzgsWp7
         htUBwNxT3w9m/6wT5NkMDb/KpRjgzC0/rryVSB9c4GWB7pF+6pTPdHNC6uzNcGKWPpxh
         x6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4SJt7uXqKxxv9L0dYj6MneQW8VsUAWyiu/ky5nnWUBU=;
        fh=sTYv+Xbtm4GaOA7yqWGZKn1Grh1OiokXjXHIfAp1mLg=;
        b=IcQvmYkzdZIHguEPugaQDaRCaJgGp/CP/G6uwUsxy2qgKUBzP0hHCOFT+wgcz+Gj/C
         H0pbnH1dcKMn+5OlOtfZkCpVbZtKZ5jCFF8FWtvoledzTu+fzPJdizY98hPMrs1JmHXG
         Aj+Qz/+1Cz5hD1Obebdz2v45f/toJA1sfAFsOQ24tkh7SBhRiUwDP9A1ujexUeGHnPmC
         dBK0TTd5Ph1SPcIKfqw6YiPah1ndj/RGHmETEwnbv1XpVMX+oGq/WslKAfMnowONWdOZ
         IE8F0tgEgmrbKijfeDVagg3wLDleq7X6twBnqlamuP0PP0u0QgwvvOcCST7fuVYJUfdr
         gTGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779463862; x=1780068662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SJt7uXqKxxv9L0dYj6MneQW8VsUAWyiu/ky5nnWUBU=;
        b=MjYtmLA8UHt6M4rDyk4gj4VWmGpcNh47Or8L507w6LVX72EddAK1TQOPW7uMr+GV9O
         nzSXTuIvbuv9BvjxjQFA1UoaKirFb35BlRGTvFw13FPto53wCyBUU3JRrQg64zjntIAu
         UyarBKksES2F4LJ63kJ92KXsIkfjcYfGKRWzHmqmBZ/qU70z8gJUma1MJYk0b349uhK4
         N4aV6JUsA8qpdfiLyz/7WfynnI1HJVMIn5QDB9451J5XbMFbbefv0NvWIci7/Sfa5Wx1
         6Krt5H5md8FXDuEq0wi4Gnrel0bjiqEWgJoQ7TchnwEp4Y0+5pQYcndu5QOcD0i6utSy
         T2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463862; x=1780068662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4SJt7uXqKxxv9L0dYj6MneQW8VsUAWyiu/ky5nnWUBU=;
        b=V/ZmW3sp50MKS8Yn4sHPAIxRv4xTavTf8lhvqZaTJYGzsxSeE9nK9i7UTvEIYOcwtn
         msvUMTBuuWFgdvp0sJ16Sz4CLw5UmSM993/ug8UME3SsPcs+EBKAEJ2k7ugSO9uYRW/i
         SycZ7ZCd6JxKNZeoirmGbYtpTaZxFg8aQx5hnEORcySBwMHOxtIlF6Nc7qisM6P3iMh0
         HRO1bkW9OBshbXgWO9UQpO9ZI4n2HzlVe85WBbQEMMAzNbGl6Hpvo5b5iHzu7x58CgG/
         mevyecLS7TbZMqX6+GUjWE0EQHVtPDYQHEXr+GrKukPZihHKpMbRqu9YrUXFDY+ky4D9
         KqPg==
X-Forwarded-Encrypted: i=1; AFNElJ/8T0RqDWmBwgACT3dvuAYrVYjFBAb+fz2FHQAaitSPka2lc9OEXUE/7iMaw7uk0keWLiq/mpOP5OdtG1Od@vger.kernel.org
X-Gm-Message-State: AOJu0YwrGcURQgoC+HjAXJOBY6y2Tr5OkE3uYmhwTPNbAd6MrOW2Br0O
	zQBkgmVsiqz/k7CG+O12X676zd30QuS7z6N9pRzJuy/ng6VcG6tegP5kAOGJCUS51P5Tdu7PmfP
	BNgRzOqPZglAhpnE6HObxdAbQaMdFtiuoNgWZV0/QaurHdoIKnwDDz1V27Oqic1VpDYi84DCUyx
	K87UgKUbPurr+1tPARdmMUusaVxoWyB4QpGxcnp2Z2epQ=
X-Gm-Gg: Acq92OEDHIzqMlhaij3h/3P3wFWu3bIzq5Yzz3C6jXKEmhdpa+/CEDRRCIvJSmJmE3M
	qwoeokSFE96iXBcfGOlSWs8d2Xzw2noCCfxbvCx2tJj2Jt0oF7vwlqBODAEMUb1R7ZWrqTj/VgU
	6429aP1u5RQtIHEsKU4mm2ftFP2CuKUOCJob3gtPvILr5AiQCyIWeTgePwKbDynyYsKonlhLece
	xbrviSfDjHiuX8H4tOl1PTwFCWQKfAxFv192Vk=
X-Received: by 2002:a05:6808:1703:b0:484:c3b5:9b0f with SMTP id 5614622812f47-4854a1810c9mr2093065b6e.23.1779463861929;
        Fri, 22 May 2026 08:31:01 -0700 (PDT)
X-Received: by 2002:a05:6808:1703:b0:484:c3b5:9b0f with SMTP id
 5614622812f47-4854a1810c9mr2093011b6e.23.1779463861165; Fri, 22 May 2026
 08:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 22 May 2026 17:30:48 +0200
X-Gm-Features: AVHnY4JKorVBG2q6rXdU9NlbUJ1CqApXXSCGWDNXeXL-zlZ965_vnWgLeQFHdps
Message-ID: <CAFEp6-3hxyFw8Mt67U7ayY-yUxHt78sZge4Epi7qrSHrXTSCyw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add Display Port audio on Arduino Monza
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: eVcRY2LWhCy1FwAb2PlyQ5bTK9giLQjt
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a1076b6 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=n4whdITNsZht4FXFeO8A:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: eVcRY2LWhCy1FwAb2PlyQ5bTK9giLQjt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1NCBTYWx0ZWRfX70tpea/kd2E3
 37S+duRED8Raa1XDjbWGWaw0Oj45abBm9Zq7uJYyNObMn+EmUGcVSaQxpAWBpGDdncNwItEJg2m
 13CwhF/o/X8yB8RodmhrIsZ2IylpDP4L5uq08vE0+ISR9N/RvE3NJ0K4WJUV9iatpRZaG2fW6X9
 lzTv2DfYWbVEASNvBf9iPu7XSgWQhE2M/Pp+J1y256+jhsnXUCyd3H2P60W2quvheX2gywSMhcW
 LZgkAdLNiUJGKKnGABzmCbjSX0yZ4rf3SpOm+AE7NagfsoYYc35+M7ykTNDzuk4vDUo2BWKd5st
 +/N3Dvc2h/h4B0iRcy7uEfa6YMYhQM49sgsGVyi8tksZTbphPd4rVizljN1RCqb8eG9SoTaVZIx
 cz3kK+YoQyCtly6ptVbgSFH3+fhHBx1pnUwTpe9gt3GCc8i4yL1/dghjqGPrycnX+lh0QuiGjwL
 9oX3e08cGQc/E9owPvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220154
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109359-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 590BC5B75CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 12:00=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> Add support for Display port Audio on Arduino VENTUNO-Q board.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> CC: Loic Poulain <loic.poulain@oss.qualcomm.com>

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> alsa tplg changes are:
>         https://github.com/linux-msm/audioreach-topology/pull/63
> Ucm changes are:
>         https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/ventuno=
-q
>
>
>  .../arm64/boot/dts/qcom/monaco-arduino-monza.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm=
64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae..01acc8363cbb 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -117,6 +117,22 @@ platform {
>                                 sound-dai =3D <&q6apm>;
>                         };
>                 };
> +
> +               displayport-0-dai-link {
> +                       link-name =3D "DisplayPort0 Playback";
> +
> +                       codec {
> +                               sound-dai =3D <&mdss_dp0>;
> +                       };
> +
> +                       cpu {
> +                               sound-dai =3D <&q6apmbedai DISPLAY_PORT_R=
X_0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6apm>;
> +                       };
> +               };
>         };
>
>         vdc_3v3: regulator-3v3 {
> --
> 2.47.3
>

