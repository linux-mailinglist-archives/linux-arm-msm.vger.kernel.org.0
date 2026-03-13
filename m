Return-Path: <linux-arm-msm+bounces-97528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIArJYActGlLhQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:17:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B513284C4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48D6A3085325
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD9E390989;
	Fri, 13 Mar 2026 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fv2upVZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpFVzG2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DC239659B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411097; cv=pass; b=BmmSgJxEJUAMydlFdu+kQUt5p75IALDtUMJIanDcd8EK/8JOszWXgQxWj9tNHNr2p+6mZeUXPAtRZ6mRH6MGJAKhOQWdkRx3leo8nQFPljidDdobp1ccYih0aYudBSIEpe+RpJ4SSFGeqwL60nenJufUstvu9NrDLNrr8NS5qeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411097; c=relaxed/simple;
	bh=lIHC5mCGeMIBWM+ohk9me1sHNw5PHfnOaMc/pd7qgYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQPzk0ZbZOxGoF3+CrjkGyoeTHHtiu6r6vI98PNNVm98klp5qZWh4bfV1Zv2RYdMqqpD6lh+2rEYOiXGvkw+42NkK7ThTdczfEwrJkAVOzsAJK1KaQrGHz2nG53XfIZ7cP6coW5PqUeeF5FezQdKbZj5Hn0A2U5Rx5snh6/LqoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fv2upVZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpFVzG2Z; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCTtJi3230183
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88Q2lXi+p8bfm20EO7ryFSHZtMv6TFqczovYFZbzFLI=; b=fv2upVZQ6l2U0tfC
	/zCKhpSrOc6NAQN8TFsmdChFsYuXTU6OLa59A7Xx+wo2fBO3s/cDDM6d01ZGVakg
	eGc4B4INJ4EzQIv7ET0SlgRYxQKPaKhE8u7cXHu7OglAXkuM6SVmnz75QY62DYBC
	ZWYw+KuroC991jYursb+Ti0il1HIvHKDB/Kw6qaDeSE9T7ne8w2jswR+Re6uY+Qx
	J9FjvjLFfo7m1K58Oc3mLRr0tVjXJ0TNDqzGTbbrazMqJVTxh45lGk6JAAJcuoaK
	DuZDfZ5WCRXDFSRGNLOnLXek15fubrThpiE3HZVawpApTI2d+GCtERlKz5xxA5mn
	d6BhCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7jfme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:11:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd39bso1614041485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773411094; cv=none;
        d=google.com; s=arc-20240605;
        b=Doy0bFrXtziPbgILN7uv5DldwY6yOfh715JbLapnslAr3MuU4SkT5wSoLdKlM48B3C
         JJypd9ySuNrRKYt0ZFuP/9pk3hIvBt4Tu/RlXFmLMc/JJH4Y4Uo2vpNMuouL7EJiAu/d
         kZlhM1+NR9yHXiPrsyTE28Gwdi+zAoatYmEngXeyiIOLCyAwVeVKJabwgXhbzAMeLgFX
         eFyU87EJRo/31Ib8X022J19/LzVvf/8+m7KPJiMMu9B2e2mpFBocsxEt32JKr+jFoDGz
         L+DwDG2paiUlQH2Fw3lzAAoE2YCDu7KFDz1FskKLbHuT3AkA5jAB9zioeL2J+ndApUc+
         FAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=88Q2lXi+p8bfm20EO7ryFSHZtMv6TFqczovYFZbzFLI=;
        fh=R8qh3iCZy9tS5H2cXivV7K/LE7P+Gi7t2trF0cgMLc4=;
        b=YW9iOSv+W4r7xXYmbazi/aLn7pq6aYetT4xC49IF5Dsl2SLsbVroflK5uY7+cGFJgb
         wb2NAJ6t8sVRdvQ5+qQOY0UR9bqqmml6c27N6reznaLjICUnDN75nhBRvyu3htl7v2bB
         z4/KidtL0ewib0W9Gywz+FOn7lqHhdyy2SBgLKtiQ9/QtPiBkbhwhKI28jkwGxeLop+h
         G9TNcfNL2QxyLqPrszn8ieYL25JSec3KdKFGXGIqjXH34fPFjWwIGCG0r2MpTt71fLSU
         pkQW77kT0Iz3rOUXj7Ss6lWY0xcax2kLYcwHyN5feXyfO870dPzTnsUi8In0hogEk6Hc
         FfDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411094; x=1774015894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88Q2lXi+p8bfm20EO7ryFSHZtMv6TFqczovYFZbzFLI=;
        b=KpFVzG2ZMOcQReJTzKSZX8W371ygOjqHPCm4HRxib3WB/Sr02DcBs1ymKs87HuTYUg
         7pIMFVsaT4V59jZhpmyluEDgHDdmxG+cwjPzmODJ2fwSW3Vs9JPCPqMou29rJq87Q/ys
         NYg8QZZnX/aa1CxGcNtTrk9DSHdJGvH99tUOmaV18ZtRm63WipE2iHilf+JHo0UMmjnk
         QrDyYuqxBOpS3BR+5qOKJJ8Dg8FYvMedyG5fZE+hGn4sPSPsgQRwP9BqYBRVmmSEIbhh
         6U+chp0vjWrosl3GC7FvN6AgeARTJMiJEJ+KxwTpLQyk20HPxq2DSGIRf16WuUi1KesE
         sl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411094; x=1774015894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88Q2lXi+p8bfm20EO7ryFSHZtMv6TFqczovYFZbzFLI=;
        b=YE2eU84QhXff8oIz4NrEO+FZ6LQhAV1cFj2hPoUVZLN8SVWngfTNVl0v+HLqZZlG6k
         /4ISwZhCFoBwa8UXT0PwpawMgZBrSCffvEi9qwN9yh1MAu7/Jqmo6fjpUfF2OoFw6t/P
         E0G5XwzRfa0epS5liSEVroVleYeXD3RDJtixCdr3s4rJHkvNPmnqYdFAtXrIwwFv1kS4
         nc1M3LZh+Dpb8Dnq6KdA51U/SQkWuTiuLoGHFnZmXT+MO87h1oCkYytYZHA5l0VkLze9
         Zh4M460yVrs4oNP8l2W5g4ofSbFxeuIf1+q6SKqhoDEOnoVKUukmBVp0bB81SpbddXR+
         YAXg==
X-Forwarded-Encrypted: i=1; AJvYcCX9e1oanoCuE6HJ+AxhlKD/tF9gOE+TAdE9J8mXZq4Fxk9JAOkicDFC9cB+aBxmvLAT/tOYkRa7/mrUDdtx@vger.kernel.org
X-Gm-Message-State: AOJu0YzwRP/zgHSZeYoufBBwmSv7OVJDnu5ZPbTRjoxgRKxPDN8YpZF2
	WSO1Z0wHnN0hSRifsw1qYAjiXOXGtIbs0YotJFYokqepWvtmReIoCc+ws0bua5brTdTmDBx7sfw
	TwX/s8UT8VbXtO7HLKd+DNTGQV6SMMF9Cli9G8cntu4I/H+uBwGjj9O2iICDAzev5j6abneSqj2
	U4LuGbzT7XngmXsvQuGuCL4JHj6oIcxg8XwEWFYmgiKsM=
X-Gm-Gg: ATEYQzxV9z5pr6G9FQP+TgXprpwwFMnaZrcCXBerEOrzbdEUfBPUxfMTAVAppbeD2DS
	1otFMbBD7iTQIOuC+2Gzrb63Inj2pz6Ts9JwSjiMneH7y9HKyMCnthTX2M6IQVBUHyfOa/rTnzK
	xXzJjeIpOF+ANZbj6Hr5cKLIKwu8M4y4T0+11N0818vy4V815xmFALciHDVHRfdg7vcOG+A20Fe
	slulMIwdJ7NXPObVCEf+LaCbMpEESnOP+OXOS9W
X-Received: by 2002:a05:620a:5350:b0:8cd:c02a:657b with SMTP id af79cd13be357-8cdc02a679amr85140085a.16.1773411093821;
        Fri, 13 Mar 2026 07:11:33 -0700 (PDT)
X-Received: by 2002:a05:620a:5350:b0:8cd:c02a:657b with SMTP id
 af79cd13be357-8cdc02a679amr85135185a.16.1773411093274; Fri, 13 Mar 2026
 07:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com> <d60503c9-0bf1-4cfc-ad18-66ee98a24d8e@oss.qualcomm.com>
In-Reply-To: <d60503c9-0bf1-4cfc-ad18-66ee98a24d8e@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:11:22 +0100
X-Gm-Features: AaiRm50V3b_h8lfsd2NySoI7rkPHks6CNqCWZILD2Ve-j3L0ZVQPh4js3GvhhHA
Message-ID: <CAFEp6-1pd7Lw1V5cFFSxb-3sq-vPK4Gbmk+BVQCLbM8vO+uh2A@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: camss: Add per-format BPL alignment helper
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: PolU93cY-eZSO-v1OQahSNnZB1QW2zhm
X-Proofpoint-GUID: PolU93cY-eZSO-v1OQahSNnZB1QW2zhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMiBTYWx0ZWRfXwEW45hFoggWn
 zfyiSiH8q0aay92sFR7TY/vaMbN+g7U2yFAFXu/oMjjVUwZkLdtR9uIN+BFwWPRp0yWH7Yc9hN6
 swAOj5oH2HwM/QtOAVEt7XoGifKkYKyfStPNkeigFcVnMN7i2j6Giqw4WnK5Dq74ktQ+zUdQzdl
 E9Pc+QeQZuHFO3MAt+47emu+G1RsncNISxTlSCRGGomWr4QZJjwNSys1DV27Zy0WDHyc4Fi01fN
 5EX/Zw0hagN1ZdNYvzfojVpYsvxL7dzoI+QZDXIWkNNcVcbLrZnjWSH+NcyXSz8ZBTsynCIRphy
 QRspotgbQpRFOF5bOlSJRubdRqJLm5PsLxwQQDK/Rs1evbGdnP6cj2/orlExBqdxaZgaIwYMvJZ
 AUgQeS6lEzm9++AK6qXAPmXz433ealQwJiL7eol1LZ62xQhtSj6zeKw1jR6xHTFKQBQsIGAut9I
 +AdRj1Uni8F4ch37ETg==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b41b16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=YhxEC2p3OWTnAaHfYZMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97528-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 3B513284C4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/6/26 5:00 PM, Loic Poulain wrote:
> > Add camss_format_get_bpl_alignment(), a helper that returns the
> > bytes-per-line (BPL) alignment requirement for a given CAMSS format.
> >
> > Different RAW Bayer packing schemes impose different BPL alignment
> > constraints (e.g. RAW10 requires multiples of 5 bytes, RAW12 multiples =
of
> > 3 bytes, RAW14 multiples of 7 bytes, etc.). Centralizing this logic
> > makes the alignment rules explicit and avoids duplicating them across
> > the pipeline.
> >
> > This will allow PIX paths and buffer preparation code to correctly
> > round up BPL values to hardware-required boundaries.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../media/platform/qcom/camss/camss-format.c  | 28 +++++++++++++++++++
> >  .../media/platform/qcom/camss/camss-format.h  |  1 +
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers=
/media/platform/qcom/camss/camss-format.c
> > index 4a3d5549615c..2cd0f3a0bfac 100644
> > --- a/drivers/media/platform/qcom/camss/camss-format.c
> > +++ b/drivers/media/platform/qcom/camss/camss-format.c
> > @@ -33,6 +33,34 @@ u8 camss_format_get_bpp(const struct camss_format_in=
fo *formats, unsigned int nf
> >       return formats[0].mbus_bpp;
> >  }
> >
> > +
> > +/*
> > + * camss_format_get_bpl_alignment - Retrieve required BPL alignment fo=
r a given format.
> > + * @format: a pointer to the format
> > + *
> > + * Return the required alignment, in bytes.
> > + */
> > +unsigned int camss_format_get_bpl_alignment(const struct camss_format_=
info *format)
> > +{
> > +     switch (format->mbus_bpp) {
> > +     case 8: /* Plain 8-bit -> output must be a multiple of 1 pixel (1=
 byte) */
> > +             return 1;
> > +     case 10: /* Packed 10-bit -> output must be a multiple of 4 pixel=
s (5 bytes) */
> > +             return 5;
> > +     case 12: /* Packed 12-bit -> output must be a multiple of 2 pixel=
s (3 bytes) */
> > +             return 3;
> > +     case 14: /* Packed 14-bit -> output must be a multiple of 4 pixel=
s (7 bytes) */
> > +             return 7;
> > +     case 16: /* 16-bit -> output must be a multiple of 1 pixel (2 byt=
es) */
> > +             return 2;
> > +     default:
> > +             WARN(1, "Unsupported format/bpp (%u)", format->mbus_bpp);
> > +     }
>
> The intention behind this could be better expressed with:
>
> #include <linux/lcm.h>
>
> return lcm(BITS_PER_BYTE, bpp)/BITS_PER_BYTE
>
> "take as many bytes as we need so that we get k full pixels"

Yes, that works, and it should correctly reflect the hardware
constraints for all bpp formats we support today.

> There's probably an even smarter way to write this that doesn't require
> BITS_PER_BYTE to be present twice

A lcm() or gcd() based expression looks smart enough :-) I=E2=80=99m not aw=
are
of any simpler custom helper for this.

Thanks,
Loic

