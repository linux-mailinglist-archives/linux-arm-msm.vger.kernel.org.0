Return-Path: <linux-arm-msm+bounces-87794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1120CFC519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 08:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C9CF03005001
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 07:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B47E192D97;
	Wed,  7 Jan 2026 07:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uh1riQky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8xyRfwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3909242D95
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 07:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767770571; cv=none; b=KFKRW2OOq/ikfIRZDpGcuxsMWgz+FLTf8TzIs4HNW9HBSUs9RTEM6kIUowjS3RIYpXcO9Qq9mfjDldrWxVUmFTR5RBGfwoF7lx66WKgPd3RFwiZMrxHpJdNVIy77EcAYZ8zL/X8lmxbU5CsdDwtlknFPhTmyM8ytYE/SAaZxMy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767770571; c=relaxed/simple;
	bh=0s5ogU8Ny3BDFLf2wTMWEaevVMGi4VfIETTjQfVCaYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGfu8NTM6FwytYguzolOHHlLcy9b3Mv9Vj0vkHj5oj4l4pn21JiGTQNBA85OTCz1SsBOpGeVxmtV5HAsirBu3LOc4wR8ijm28A69QqWfUf7pD1oGo1T0GlCHDpxrqARUb17CIzISy8MYDAwEvpZKqaRrKEIQkhAN+aAW8P01MSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uh1riQky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8xyRfwO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60733APH4138123
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 07:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=92GOvSiSagmOah1XPds7iS/X
	gOGbNOfvvHXLtuXx0iw=; b=Uh1riQkyjL0TZYimzBwPjHxSEK6xzQAOpYCF9hG+
	OrT5CVZm6CwiA6OIwQlqMVXCAflYsoUUduTbt/XvsHLoWmgf3eHcZo+LjZnptkdv
	JNHiW3ZJdmiUwQyDFwMe816gosqgNJwbjEwEAlxAGYrKmdR452BXqoInpmLGG0MI
	27TI+EgBvaZgwQKTVb6W+qnaPj06VVznpVhvN96snSGYDHcsn20jA/LnjUFb4+ca
	6ABiH7ltNiU3oQ2Vgf3U0/MOpVoyUP05OEtFwnTuJDvL/V6twW6GwWMez9Ne2Vw/
	pgTsLlwjswJ0NyeIP4bCZMGgrMskKCEq+uVdRlzpJVJhpg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e2b90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 07:22:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ab459c051so4468347a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 23:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767770568; x=1768375368; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=92GOvSiSagmOah1XPds7iS/XgOGbNOfvvHXLtuXx0iw=;
        b=J8xyRfwONQMtDdZwA7JAYEs1UdsKhQ9L9LGq8+YFfVAZD2zX6KgOrAb5KDF6Ftnw87
         6M0I5qr1l+reCQmc8eiRPpG8z1va6cKV91OOaxBNS6pgRvUhThGqRdh7DmiSNm9+tsDg
         n406HThCffL/5ogs3pwc/SITpUmBtBdK+Pz6qqQygO7cFN4XA0oEV4YIWbkE6bCmxby7
         Is8IV3PYDlhXRjWx/LZdbFwdKg9068nbUeuxJLSqfBZbUPl6hgUdOQ1LyWdrCkcYfpv/
         wHiqci3BdmII7GAXl5D5zEpmVxFMfcSUOhRfdVDyD0XP5TfTKoM3wMUP0GKfCbnr8kCI
         8Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767770568; x=1768375368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92GOvSiSagmOah1XPds7iS/XgOGbNOfvvHXLtuXx0iw=;
        b=KHo8z1ya2PFTMzKLkh3BNijk1WtEBy9xRqDtGYnM3h2Avimc7Xm7h6Oo/8VdRVfy8Y
         jijgjKZ5TydeiCjyrGLGxxOgilSC1BLuQA6wgXr7znLO3shpIk20ijb/3FDgyypshbnl
         AZ2S/DUZpkCY/6h+OMsTYebbBhRISe7gP4EL3y9kwaBijj4OSuzL96cRybkRK9Jl72lA
         kGyYBN/43fCy1Ro3n/Luaruz74k8nieQmsSqVGC3X3HBlR1KOqNSSlwrx9p4x/4WR2o4
         L3wMpg88qGUZl5skdrn20vN680v/6mP/SV2izwysaHrcIIYV1ZWITRxuf3xo/xn1yVdP
         9KHA==
X-Forwarded-Encrypted: i=1; AJvYcCXvuQSOpwkIJYTFEZekkAkWJwB/WgakhBE7cHCZfPWleDe5gBcTRP0LpsOr1Aq7LF8pAPMa4Yzn0GWBVpwE@vger.kernel.org
X-Gm-Message-State: AOJu0YwCCBzZlYMj1FxP9qwTppLyic4uQiU8GqKpL2CoIi4A4nMzN4lQ
	uF73XvjiB24SDBHCgT2E1XIoX4qPxs6iaLLj9Zj/RonF+LqF871EDZtSUncgDwPSh4uDrntGScN
	p9iSl6txoCww6dwpd+C3rxz1J9LDvuVSm7fqdNz2iWn8MxIeptOE/MjoAWq7E66RTfOp8uQKD6j
	Z+0REXhlTDRrHrqUjPWs1WLDoBi//pzgVyU4j8uZN/qY4=
X-Gm-Gg: AY/fxX5HqzdfUajOqLL4ZUMuzkY1A8rdH3ZA14rnwwxoMVeKcGl7LNulbRP6s2SgyYy
	XgGQxCko5F0Hc+ytTGg8zJnAg9JbyZS5Db3nhL3IYlU+FR/E0RMUGAZlX8ZfVDcYjF6CJnirYg0
	1xQF8odNLrInBEzod8v3Xwh6XDIDRq+b4VAZZ0mkWHoIPoG6mP1rutaGB7QmFDgLNc5FmsCqm1j
	T4q496b
X-Received: by 2002:a17:90b:524c:b0:341:8ae5:fde5 with SMTP id 98e67ed59e1d1-34f68c4d71cmr1601847a91.18.1767770568192;
        Tue, 06 Jan 2026 23:22:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbklJFAR7CqffhtOd8lNYB1tmIhVU8vocv50mwZhpy3yHsHFyX1O1WbF11aHVp1CHGw2hWWc/72hVmhAdvqkU=
X-Received: by 2002:a17:90b:524c:b0:341:8ae5:fde5 with SMTP id
 98e67ed59e1d1-34f68c4d71cmr1601824a91.18.1767770567654; Tue, 06 Jan 2026
 23:22:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
 <CAO9ioeUsLwOs2RqGPcbeuOpHg4zuwwsstjJnTCH4-oRL=ss6kQ@mail.gmail.com> <be79091d-3b2d-41bd-9303-2c8a64dde9c4@oss.qualcomm.com>
In-Reply-To: <be79091d-3b2d-41bd-9303-2c8a64dde9c4@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 09:22:36 +0200
X-Gm-Features: AQt7F2oaorDosUmrR28h8cVfXVCANqFJ2_dE2kQiemlkxgxhdIevX-lBDHVeAug
Message-ID: <CAO9ioeW=7z=LchdOOfdtujCGJ5Yb3BxeLA_w=ktYQjgpyv2RaQ@mail.gmail.com>
Subject: Re: [PATCH v1] serial: qcom_geni: Fix BT failure regression on RB2 platform
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        bryan.odonoghue@linaro.org, andersson@kernel.org, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA1OCBTYWx0ZWRfX/dnfbQL/sWAe
 v4vs3UOk4wMp3h75giFbw8YJNOn3OIw80UgYROiUzKNi46s3Yp5TOoJBtQDudsNfJ9CKqkHvFHN
 f8/O4U49HP220+LzAQTQ4srfeIPs3/5P1PqXay/BujcPWVkivUJgFEJEKteZhCn66Ts9wVzJhkb
 m1VQRVXQWxQvwhYnKut0jjrnQi8YWOGv3ggz7sb4VMYQgC3YvVh0vR/XaBn2qJtI5yS6C+3aVZ4
 1NpUIYV2VX+qVWT96xCS6RebS/T+OQRn2uQgzSR/vfBBpl8Y5P0wqREviWXWx16U0z9VzxN1x3x
 9xrwyMFIKUU6MHzbPRP7LclcGJx+PXJM0OzzoWsuTVVG/hF1mksEqKA2BcT7g8LWWgtr2fCRbko
 7BH9ynK2a7p79txUJ5t2wY2/1anxJObeGNfxVLKjtIg/dW4e/GlHCVdn74xJARup2lfFvT6CHJv
 gPTnkD5TTSCuQv2kHng==
X-Proofpoint-GUID: OnzxSUsyGF_F9zqM0HUrO5p0FM5WbeVQ
X-Proofpoint-ORIG-GUID: OnzxSUsyGF_F9zqM0HUrO5p0FM5WbeVQ
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e09c8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=G_Ql_pMG0pO6KvxD_4sA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070058

On Wed, 7 Jan 2026 at 09:06, Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> Hi Dmistry,
>
> On 1/7/2026 12:24 PM, Dmitry Baryshkov wrote:
> > On Wed, 7 Jan 2026 at 08:48, Praveen Talari
> > <praveen.talari@oss.qualcomm.com> wrote:
> >>
> >> A regression in linux-next causes Bluetooth functionality to fail during
> >
> > linux-next is an ephemeral thing. Please reference the exact commit.
> >
> >> bootup on the RB2 platform, preventing proper BT initialization. However,
> >> BT works correctly after bootup completes.
> >>
> >> The issue occurs when runtime PM is enabled and uart_add_one_port() is
> >> called before wakeup IRQ setup. The uart_add_one_port() call activates the
> >> device through runtime PM, which configures GPIOs to their default state.
> >> When wakeup IRQ registration happens afterward, it conflicts with these
> >> GPIO settings, causing state corruption that breaks Bluetooth
> >> functionality.
> >
> > How does it "conflict with GPIO settings", what is "state corruption"?
>
> I mean the issue occurs because the GPIO state is being altered during
> the wakeup source registration process..

Altered how?

>
> Thanks,
> Praveen Talari
> >
> >
> >>
> >> Fix this by moving runtime PM enablement and uart_add_one_port() after
> >> wakeup IRQ registration, ensuring proper initialization order.
> >>
> >> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Closes:
> >> https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/
> >> Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial driver")
> >> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> >> ---
> >>   drivers/tty/serial/qcom_geni_serial.c | 12 ++++++------
> >>   1 file changed, 6 insertions(+), 6 deletions(-)
> >>
> >
> > Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> >
>


-- 
With best wishes
Dmitry

