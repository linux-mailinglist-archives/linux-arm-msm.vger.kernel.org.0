Return-Path: <linux-arm-msm+bounces-106765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBeUJP+m/mlDugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 05:16:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 334944FDD4D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 05:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB29930071F4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 03:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C8628851F;
	Sat,  9 May 2026 03:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxngzWGO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aaolyrTj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A6B274B2B
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2026 03:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778296571; cv=pass; b=crfOwArWWJivitkjjBegMVHBZZvRPTYpBhje95w/pjPTojWOtBPh2JFdvMdCZAuyuzLHoI1LeM4x0lXVTPvSH0I+BtTKgWWvLK/be9pd2nB7r1soVXDeRR7g1sHwWUJ482NDKk+ZjbVkkFZb47mhb8pkitafnvjFABp7tvDgcJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778296571; c=relaxed/simple;
	bh=iycAiiOzBlvvHwBW8cQsDiVxW5Pp1tObCCKfH4KZhw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVJr8giGk7A/kKGtZs8WDsSGRaYUvFt158GEt7AG4KkofqIqGx4iqcB0g9VJy74EXwrkgZZuHB9zstwsVqWM5GM0RjH5+AppQI5cjTSG0V8vdBF7r9eFhbSE+7TiTRcachUVb0JqyukRKwP0BeI7Si5PsoDGMvXZXq28qVo1wow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxngzWGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aaolyrTj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6490hhpF2208755
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 May 2026 03:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPGv++bVJSB3zXFP2t+WPVXGM9RIW9lIFp4uRM2nOWU=; b=lxngzWGOx5fJa8hR
	a8n5EPOfx5pm68O7+abtDbYJ6sVTcNWkNcjkSQJht8J4Gqc1Tn4Tb3SEbzbipKPF
	o1zdBS1w3KqyWu68hystnj88s8b+FiR+IW1f3uw0elT3NmU9P74znYMjq4Y3Iv8m
	dosI5WNEl8ltP9zDCDG8R0OSS3bJ3iUfcpNcbh0D163YZ1sSdirsciJmHroXmIfD
	J3ZmDtbO0uuMlCwa10yh/61K9dhPLMpMaBQZW+XZRnpNmfYeKRhiMCs59fp3T4EJ
	xMnHEp+iQMFswqh+EZCPViDxm8M0z79ZcNw+OSObjBvkE02JHdNdXGwfy/ugzBbf
	WOFKng==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1tmd0axx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 03:16:09 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd726a9569so56889227b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 20:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778296569; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4zkpVJW1HL/yRaqPxGK1LBR7Q84E2f4oCvy829l3/3m3/6aqBf6hhDwqcjjB05Ckq
         fqfxRgWu4Uj7dQaKEISfS1/BhdkV3CZ0eYpIz4dvtB25ha6QvUms7fTOMDp1rP83Zwl5
         QBjfQFaSYBn/Iy467FEmldrbK/Qhfz7ClIYSNeiSvS7GPpUlgnGrLw2zCPEn4I1y8EBi
         bo1nXmIIvQ7qJmnLcOFb0QuB23O7+kqYXlLvDhm7/WY36eSF9ADmlVhP6pqsb5WV970z
         men6PYAK0x5bcVYj2OQHG+75YT17FEPwmqnTLX6hYc5M3yzE9xeaYWisFBFvGrhB1nxI
         HVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qPGv++bVJSB3zXFP2t+WPVXGM9RIW9lIFp4uRM2nOWU=;
        fh=bomCu8L5KsozVcM4IYUz9cMx1Y8rZ6UkGiu65RzLrZI=;
        b=CdkkO+N7S+0gcR1RCEoHInHdvp+JWDnTGWrg1NYrrAlcCfEo6sTHQ52Rx7XmOWYAOu
         E2MsgRGBq+vjT21yGgBvQbywpVpf7DPDb515gPDerUD8CXSPyGj7MlEXu+zI9LxQm9L4
         57N6GWf1lrq1qHPeCYLfbY1866WKCRUIov3xKt7S/YkyBGuqdjwl6h5DYkXQF1Dw/Iyy
         0b15Mwpn+YLprFuVutvhuacD01KKXYf2SknWmOBBY/u8/WeV7/6L0b+hloln73uIZ+e2
         e0PcG1ERquxNJjYvQCd19+uKx8T7dNkyetV7S8U6cQUSorUUlvi5RQVhBx3AOTQ5mD02
         VNiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778296569; x=1778901369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPGv++bVJSB3zXFP2t+WPVXGM9RIW9lIFp4uRM2nOWU=;
        b=aaolyrTjVrgqwz031ExrsLE5C8NgerS+Q1WEP8nfIJko7IP8WvFsaAqvzAi6kJPwpw
         NF2bpzLaZyhJA+E6rl7YQ7QDw4ofhEz+BDb2Tqio+TacbdQdbHw3b7Tc18YErYQSqQNF
         t/7+lqMeVMZ+EikxN0ptjqKLSozZ0P4UAVLLCd1DGzVarj+g+n4ZzGhG3gGgaK3JwozT
         BF7cNn7SqJ105J7mHFZw7UetaJ+aZ4Q6nYMXW/znFz+iqBFs4tMTVzA04DrohjmRmPsC
         5Es1nA/Gu85lqRGFH9MlI8DFcJzxIeWS+1QSabw0+7rcEkU6HaOuNzrAzSNE9YLVescx
         +McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778296569; x=1778901369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPGv++bVJSB3zXFP2t+WPVXGM9RIW9lIFp4uRM2nOWU=;
        b=JElGPczpv+woC8xv+BDE0aYIKyoBs91/K7slKMYTxu7dsLXimZBY9OAAxOVYJBneE8
         i8FY1QYAvhWkURdF6F2cOIowhMTgtz7oJWWSFcR7FnWQhdPzCEnGGsUtoJCS6CT7Jw8V
         NH8+zdZYl1r5AG89/8t04c27l73W/MICWXsDBOCwXAl/CMr7GxOfHfcT5ELNqausfuBA
         MYyT5gFp9Xn587paTjXa7hPS6FuaRf5s3wTWVecXAD+vBjAmOYNjlsGf8ahJtP5Z8zjd
         TZ87BBAvuV0xHjZ18ELruML2ndxVmd1bVxKVKPhuoC3u6raWyXv6AF2064Y4wi2/AQRV
         Mpaw==
X-Forwarded-Encrypted: i=1; AFNElJ/p31oI2j3qTBPMGMOFkmuxzQ1rWnv3YVYZe8VTCMCNLVHj5gpJfTFMuOa8zvpQQ9pu4ewPAGIgIcxMcL+T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ZSPW+BkooarzwmHBpWKDrt0CTeDJDLfTDqdLBE5ZH1kndQHR
	twMvvH754qVGhbbpd3IiOawakoJ+yDaxM2zmElyYIMaYo/sccCFhoTGxyhvsTbor2yH9+VMSQ3i
	7aLA6RsN04veQknuhiBbI6vXtN2Gwxo+deDWaXPBjS8mwQedOUTIP2z44MQn8DE+iEkSiOWFRbn
	Dh/A9vteIVXkcYuMKHfKFj8ZmFZpdr+/vfxiETsqEjog8=
X-Gm-Gg: Acq92OFLG9ZM4DVDxRnoFIn6IFZSEjEMLxQao3l9YHv6oiOoB4ca1b5ah1O9aHh9LVR
	DNQ8xGZ4zatyhrBwX7+OGzK93jhCojr53WnZsfY8g1zpPZEmcqM5txFffD8bDevtefqO620bozP
	dNfHqie4dqVMl4O9jPM8pdO0lWqLphojYiJhT9hk0b+btpFXC2RtGBvj3kbyd1jxoV6zT079PjS
	uxglHA=
X-Received: by 2002:a05:690c:102:b0:7ba:f6b4:358b with SMTP id 00721157ae682-7bdf5efa71dmr161075797b3.43.1778296568979;
        Fri, 08 May 2026 20:16:08 -0700 (PDT)
X-Received: by 2002:a05:690c:102:b0:7ba:f6b4:358b with SMTP id
 00721157ae682-7bdf5efa71dmr161075487b3.43.1778296568576; Fri, 08 May 2026
 20:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501051918.1990713-1-qian.zhang@oss.qualcomm.com> <afyYaCSFXy-Fm7DR@baldur>
In-Reply-To: <afyYaCSFXy-Fm7DR@baldur>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Sat, 9 May 2026 11:15:32 +0800
X-Gm-Features: AVHnY4JRNYyNdgV-BrokPZ8M3cAiS1CkwObBGsuROTFKDePN2XI0KmATtKyrv-4
Message-ID: <CALC2J1NG1CqbEcTOEGebEmH_3R0TSfPYJ3SRQ4-pwfW3DDdGtA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: Add fixed regulators for WLAN supplies
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: yd7GzM7rQPFqpxyINpUR2RPeyUKl-xSg
X-Proofpoint-ORIG-GUID: yd7GzM7rQPFqpxyINpUR2RPeyUKl-xSg
X-Authority-Analysis: v=2.4 cv=aZlRWxot c=1 sm=1 tr=0 ts=69fea6f9 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9BAixFXi0OziPwoLFDEA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAzMSBTYWx0ZWRfX4owQ7h2Ugu2i
 +vGhHqSoUcVWi0zz2Ckw/knz/Q0wv7HtLoYnQ9c2VEzrB66myysCx3DAGWBGsLPwaphG45q+cJq
 T/cHVE686WMhpUbCeAIwxxcfmEtEJqaNoQOitPzxWMPVqihmtGOs1pzG7upSbQjFOTbuC9t4gMZ
 psB5vwlELfiXO6urxzg4+SyOkBJhnD6Spoh3BenRDx3r/drLm23N4VbqLoUEFulpiGwaOJaFwxk
 qPFu5uThrT2h6cNrHfISeC9+SVafDrbUf5A8RCMOgpSj1phr2L9MYe2oFKj5ZvQJEe0xwvnPf3q
 VPdChMXhnHhXSfSJxn+3urij7vnNCud37SQoORVfTd2SXxvClR5fyYBl6ARUu+D32Y3bFW2Y3pV
 CrCnZzz5eiCEvvb/li1Z1O/12imAWQntchsWpx4qwTMmSRVM7auxPvbVGCc6059GSU3yCOgTAKM
 995K8/3OdudoYKeRzcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090031
X-Rspamd-Queue-Id: 334944FDD4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-106765-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 9:58=E2=80=AFPM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
> On Fri, May 01, 2026 at 01:19:18PM +0800, Qian Zhang wrote:
>
> There shouldn't be a "v1" tag in your subject, and the subject prefix
> should be:
>
> arm64: dts: qcom: monaco-arduino-monza: ...
>
Thank you for the review. Apologies for the formatting issues.
The previous version (v1) can be found at:
   https://lore.kernel.org/all/20260425031712.3800662-1-qian.zhang@oss.qual=
comm.com/

> > Add GPIO-controlled fixed regulators for the WLAN power rails on the
> > Arduino VENTUNO Q board:
> >
> >   - wlan_reg_3v3: 3.3V supply controlled by GPIO54 (wlan_rf_kill)
> >   - wlan_reg_1v8: 1.8V supply controlled by GPIO56 (wlan_en)
>
> Those really sounds like gpios, rather than regulators. Why are they
> represented as regulators. Please start your commit message by
> describing the "problem" that you're solving.
>
> >
> > Both regulators are enabled at boot to support WLAN initialization.
> >
> > Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> > ---
> > Changes in v1:
>
> What do you mean? Changes since version 0?
>
> >   - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
> >   - Improved commit message readability with bullet list format
>
> It's impossible for me to know if the regulator vs gpio was already
> discussed, because you didn't include a link to the previous version.
>
> Use b4 instead of doing your own thing, it will handle the versioning
> for you and it will provide links to previous versions.
>
I will use b4 for future submissions to handle versioning and
automatically include links to previous versions.

Regarding the subject: I will fix it to:
    arm64: dts: qcom: monaco-arduino-monza: ...
and remove the "v1" tag from the subject line.

> >
> >  .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/a=
rm64/boot/dts/qcom/monaco-arduino-monza.dts
> > index ca14f0ea4dae..1a40ac5bb4bb 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > @@ -153,6 +153,27 @@ vreg_nvme: regulator-3p3-m2 {
> >               enable-active-high;
> >               startup-delay-us =3D <20000>;
> >       };
> > +
> > +     wlan_reg_3v3: wlan-3v3-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "wlan_3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpio =3D <&tlmm 54 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-boot-on;
> > +     };
> > +
> > +     wlan_reg_1v8: wlan-1v8-regulator {
>
> Shouldn't these two regulators be referenced from a WiFi or PMU node?
>
Regarding regulator vs gpio: you are correct. These two GPIOs serve
distinct purposes and regulator-fixed is not the right abstraction:

- GPIO54 (rfkill): controls the RF kill line. I will replace this
  with a rfkill-gpio node so the rfkill subsystem can properly
  manage RF state.

- GPIO56 (wlan_en):  must be asserted before PCIe enumeration so
  the WLAN module is detectable by the PCIe root complex.
  I will model it as a regulator-fixed and reference it from the PCIe node
  via vddpe-1v8-supply.

I will rework the patch in the next version with a corrected commit
message that describes the problem first.

> Regards,
> Bjorn
>
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "wlan_1v8";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +             gpio =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-boot-on;
> > +     };
> > +
> >  };
> >
> >  &ethernet0 {
> > --
> > 2.34.1
> >

