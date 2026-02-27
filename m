Return-Path: <linux-arm-msm+bounces-94384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BRlLCgyoWlPrAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:56:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CA01B2FF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E2E33124FB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0E83DA7F3;
	Fri, 27 Feb 2026 05:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QX8yR5E1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OISKjQRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9483921EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772171782; cv=pass; b=jI5TkEm4e/KImyARbFJ3EkWPieM4RJC93Z1/zaDlLg7+SKeaiQlTHQT+5KcZ7GX9/R+OcBzDdQ8LHmV7u2kDB4CbEE5a5ZREMEkNnDZR9haM/6BWoeEnNKXaqTJqnnFKaedDI757pz0uvPa6i3CWW2ch7fSWMtOtATjAkXNL3qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772171782; c=relaxed/simple;
	bh=tPy+mJULvArVYy9ljettpeNSWWhaski8vyVWxysNbIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1MtaoTgmlSV1CMu5puqIr6BTZy0xJwX4Volvj2jxUy9EwD7EEL0odOlZEy5Ndu6QKzXvj2e0xRYf/oDw2z2UXtCutKPZlnA8+0092GlGoKmL4m9JMnflvtLvI6TEmwx5ErJ2cd2zZI42CezIeHRmJZx4yvYSWSP3YEuz9nbHZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QX8yR5E1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OISKjQRq; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K0qe236028
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2HKahSZVL45qTnYxSZP+lUTurRww/HCTgif585aQvPo=; b=QX8yR5E11PNCtokq
	HpvauuMBqlP/UuvcCILHTKpf6pAEZSo9kNHdUvlr/0iwFG1/B+dAyHuXSxb6NvuN
	SKSMZeYROgww4aeHBuDiCdjkdheugU/a9Ebk9+YuCl73OCU9Na5wK4adpl9iT9f5
	Amm+U+MmelAwCW6fRXqddvBqJJTdl5Nrq5W8YFo9ePbSQwR1z/0AbTa95ufYS92p
	3OZevSg6LlBUVhF3O8eNfZpF2bEnz6n+N1pf3IXZo146cVnN+PaLUBMvsaMSuS20
	Z27LPjpC3QQQC+x6zeRQtt0yK5JQgXWFwe5cbt1S+S+MzplRZnf+C1nwdIpsCnFG
	+CgiDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xs9h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:56:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71500f274so173845085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 21:56:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772171778; cv=none;
        d=google.com; s=arc-20240605;
        b=Yl2bTLItGhlcfWkBkOFpCOCqRVbgSLZi3/NLV3StxgcVcw25ZOxFOtie+Y7L9X37rD
         haOi/PuTeuP9v5ZguiT8qCLcmRohmCkGuU5F9Uq5yq2pVpVsELdpFY3NVIxCbdrEP3Jq
         ttOsExBo3DKIpC+jhDy4wPcanwZHKX9xXUvcYOtZH75QDM2NFATdRPQDi6s3haluODTo
         WDNSgPV/mQXncJuQAtxSwtc7gWVw44N4X5epPfsMiiBHCgA+rDphNrOcbT//jZK/hoNz
         JfBXNbRIDxbjoSt5PbIyZVBRpjdjVK25KK3hB0+kkkILgYwxYYXTR5mvCM7vfbd6KzWc
         NiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2HKahSZVL45qTnYxSZP+lUTurRww/HCTgif585aQvPo=;
        fh=6q5GvaIefti6TZpxO0rnbL52Zi2HAKm9UcM4VAs9L/o=;
        b=Y5wMQxb5mLh4KqizGXotehS1J1PaGo5JPF/QPvgLgoyPs2POv5zWNrsItYoUYTpqQG
         a/RJITH2q6TBS6FZ2Mi8ng4uQoGhNaNYb0OsKLH5YBmd8QIbi3gW6tqjTmdcXQcycX5u
         KF0FB2vhAK70GNYIZwFIR5WBD2//BSxI+aUOilkN0/dmBQDNxfs1Q/JMM3KtHslOdqT2
         IPs9bYmNdSZwana0iwc+AvGTiuTzS6lBEZ6JDCaCgiyWV3gGzH96XFu3vzsplD/db7k2
         9I9RsYF65EuABdBpcSkDU/43lCJ91FXcCBqeX88TebIFlZupP6YFPNrqCyxH25lM/gVI
         5BYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772171778; x=1772776578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HKahSZVL45qTnYxSZP+lUTurRww/HCTgif585aQvPo=;
        b=OISKjQRqBZKD/wC4BCmrT2QKINV8WiKCzsITFwxxSiindrq1WIrHb88pMXX2NnfKVV
         wIE+9rG3+VvTDXIsY55ZVf0FSHEt4p7bwdTYjqmtLWIYC93cYBidWAP6RLN6T/DX/8Do
         j0Cs9pLPleRoTPdyjIxmD7ryLvXGTy9qHvVbRugJuaYAYoE14hCXKFpmrKy1oAY2OvdG
         MsXc6cJjpjc/+DwNraIEs7uEXZeDwj46zROGgJdWCZWt6IPG7euDPZQxZty9LMHM6R4p
         W5ShRzYnBBy8+MNx9sqGx7at18N8QmCimU1KojS0y6URNuX1dpAr9x7tVKBMrUk8n6ma
         Aq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772171778; x=1772776578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2HKahSZVL45qTnYxSZP+lUTurRww/HCTgif585aQvPo=;
        b=o+wQ1mMdJdPprUhUL7SJqzg2DGlZ2PEnBy+gxDHJ9WBajmtVRDIO5Kh5MOtAB5O2J7
         yv08X+06nGeZNK+/5TGQGZcZTHk6ymoZQVTentwyx1dzM+RrTUaw6qOqIOkZujWZIAeC
         /QGHzzYD6jWPRcvW9BWHPmlGQvjrbxErXXGY/RtF5xsIwW+/N/3baAo/xOwfvNv10w/O
         IzBH3v8avEtb7WZP5tz090S2hMHRym6qW1arn1WIL5BDxwLz/MS6YzD7z2ZwJlailuLC
         G/HPbg9eDg/ZXchIehyKpeka5/2hmqbnmiFoAKoU8/GcceK3ITDY8yqLjfMx8g8PvWhP
         t3fw==
X-Forwarded-Encrypted: i=1; AJvYcCVLK/y61Es0IppF7iROsC7rsSx8otm5mQ8HsEK1yiH1xfRaFSpEAn9dZSWHz5NN/sl9R7B0c+wCU1yj3JKJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwbwRh5m6RIPsnal6jCjaQdZfGeItwpMqONji2kTiuu3lxuts9g
	0s22WOJjhgfr0JZ7b9+RDN5cxbc3tPOxWMyMJ0wyPiPYtXPL/Dnt3UE5/tapQlQCekkNXPtVbsT
	DPzCC4X/gWXc3Fvpb47p0pjPafIFF8x5jd/RchNEdGuEX6eNYZlK8PF1oj8qQAe4umvfdJ+M5XD
	fqC07Vc8y67GO4osUzvXXpSjF6RKMy5Rxu0iLzPhd3mEs=
X-Gm-Gg: ATEYQzxiOV8pQLtBd/uOD6GdyNqddWyKdxGP4ut22TjW9y3SAS8fqXE8B2DrcGSBNCn
	38S1G5orPyLywjQkcbRakHYNoxztgN+TvReLjvGaz1MUCb69XjyJteraOhWHAS1+qQXWrXVEBmV
	XbSYlBw1h//7KiPAt/DF/59Of3muKR3PSxrUKDhzMI1wbtTTGRAc+ib2TaIJ/Na7HqFsaf52ihN
	hjcOKht
X-Received: by 2002:a05:620a:4102:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cbc8f159e9mr187399385a.51.1772171778534;
        Thu, 26 Feb 2026 21:56:18 -0800 (PST)
X-Received: by 2002:a05:620a:4102:b0:8cb:3fb3:7bee with SMTP id
 af79cd13be357-8cbc8f159e9mr187397885a.51.1772171778051; Thu, 26 Feb 2026
 21:56:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226060835.608239-1-swati.agarwal@oss.qualcomm.com>
 <20260226060835.608239-4-swati.agarwal@oss.qualcomm.com> <ogtehltf7onbtwnn7kvkjhjyfoh4zhjltgzq4gf3f3lwoyhkmt@le3lrprfdvgw>
In-Reply-To: <ogtehltf7onbtwnn7kvkjhjyfoh4zhjltgzq4gf3f3lwoyhkmt@le3lrprfdvgw>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 11:26:07 +0530
X-Gm-Features: AaiRm50cgygvA7tkrN4oukgDk8GfM53bqJdsvYR17D4fyhjsQ0DIwyI_r6h_9AA
Message-ID: <CAHz4bYuP6KnfEwvEucoE_50G1-CjhMHQXhxbK+jee1XyCKJDDg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans-evk: Enable the tertiary
 USB controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: npCnmi21gWkiUyBwOlByAAG5364cyAgt
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a13203 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=efcO10-dwCdNlKEi1SAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0NyBTYWx0ZWRfXwloOr9Eui4OW
 bdAiyZml8QpGI1vSz58HGI1PxHcHf6wlATzTwsvr7l7KBFsUGHJIMG3iUrY0CCzO1bjpb4d118y
 3f94Fj0JMs/VxUbUxPbu3m43KjDt8jE29WAutAwv78Ue6eE6vKxyVAy7xXZgPVR8XBXtw1hELSl
 b5Eth0F1ZbYQJBwjioiaW0z8vojyKGC2E1ugq9mZxIe2PQ8jy2nM6HCEREnZL1k1v4fXGXjZNzI
 FIAeCZyPuO4P/foO5HaXPTtDIAeyH81xi/zywnWyflZWa4cCkUy56ty3UO6DoB2LBy3KuK8XDzI
 eLQWQvlzp5AL3HCmRQf09A/YhVpHU7wm9lpCEEkyGJrpYuVnLG5+WlrUW+U5TyPpIDymol2Uat4
 /dknI5Vs7EgrzSoXyFyHzB2vLjA/NLuLRVDablhAwaw3w7/m9P9QtxIPHb3kS59h6WAU7PgeDMN
 0PpOuj/o6SDmmBHs75A==
X-Proofpoint-GUID: npCnmi21gWkiUyBwOlByAAG5364cyAgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94384-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 18CA01B2FF0
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Feb 26, 2026 at 11:38:35AM +0530, Swati Agarwal wrote:
> > Enable the tertiary usb controller connected to micro usb port in OTG m=
ode
> > on Lemans EVK platform.
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >
> > @@ -132,6 +151,15 @@ platform {
> >               };
> >       };
> >
> > +     usb2_vbus: regulator-usb2-vbus {
>
> What is the name (and the label) for the VBus regulator for the first
> connector? It's visible just under your chunk. Why your chunk doesn't
> use a similar name?
Hi Dmitry,

As per Bjorn previous comment on v2 patch, "use supply name as per
schematics" so that's the reason I followed that and created a label
as per regulator name.
For eg:- if the regulator name is vmmc_sdc then label vmmc_sdc:
regulator-vmmc-sdc.
In my case the regulator name in schematics is usb2_vbus, then the
label I used is usb2_vbus: regulator-usb2-vbus .

Regards,
Swati

