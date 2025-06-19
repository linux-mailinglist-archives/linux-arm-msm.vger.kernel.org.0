Return-Path: <linux-arm-msm+bounces-61839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA2AE0EC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 22:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F8061C206A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 20:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CABD25D558;
	Thu, 19 Jun 2025 20:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nCG28X/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5E82459FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 20:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366425; cv=none; b=Se/rnvX3mEoSdZ50ioWQfMNDvUJeklERTj2Clqz4FQQPCdU92ObTICOo0E6mTXdoA0k2QSyj1t4G8qsc9fwca7jLrIXW4sWv7nA9NlyhFj2HN4etHbLnqMTIHDdULa4ed5MPVHgPvOhyAKA+WlP5yGf/gmg6jePsll+tVIlCslo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366425; c=relaxed/simple;
	bh=O7SEft5ZodFpZ+NzpqfkPUaFRACFj8cIYOOxG4CF50o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtbaEGKwyg1oLyOkdPuVKBsuLaW5ugk2W4Ba7ulelyfArp0yKZiKXPZGzNQazMEYZZRIYhSkS7K0fTo8AVer9aLedOayh1kJc1VFtcj/d++Vla62dkHGagN+qDsxDaWB6KWGSFJJfQbNIaAm7+4tEes4+9fBcIbNOCGFG+noFfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nCG28X/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JFeT1K024471
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 20:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPu5zYQef5SPsWhI914gghzkM1C1M/oubhZ9KqWFCz4=; b=nCG28X/y+8bLLCch
	cgoo/nS7X0ykawRtavoUN0mXAl/l57jMpogrBWx717EJpHaFJijUGNhreGXe66+y
	7oYMMt4LevcUmjElsdUVbdUXXPgP2528WzktvhrfUI9uhmMcgoSvcDgPKdsUquL0
	PVwYusZb9BdvQW1mm03X0k3u5PFff5VK/0vjKn3ZWAIo0Mk2GyGQMQOOCd5wbID/
	4eW6H91i2tlJbMlGfo9x5oZs1LiANWL9905y5kHQvknjy9xXh0JmplLTF6nCPZA9
	ZsoNHCIXR4863zoAWjxjyseU7xL1cFl9y9UA81vCQPIrIeHy3179N567bB9DXKM5
	8bRZqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca9bm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 20:53:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6f89098cfso23925371cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 13:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750366421; x=1750971221;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPu5zYQef5SPsWhI914gghzkM1C1M/oubhZ9KqWFCz4=;
        b=RKPMAztvpxP67UhY9/QRXQoxFJ1y2yK3d0l8g9ZLsGCxL6+7SsyFOtMHGgYw0/uTMb
         qPAC8aWjFS14Cmz7FDWgq+6h3yeGUXQAu/rGCLMxZQ6c6AfrlRJIIbFvvJEtUthMwXk2
         ArXeiLx2oIBIY2rwu2wt2yeBE4sr36lwJM5gVMpKeQGylW3Nz0KAL77NRNUr7AbzVXfA
         u0lOkDHrNHzRhvDQZsaEch9cbIgHZPCqwQV2gjt/eDPcmnLrquVKPk18aVEmhSLBD+LH
         ouNP9OLqxxu7YnpL2Waff9/JnwdTVlKUwN2rILuTJwxk99RTeKUhwFugvxugvRFIrvG2
         pZLA==
X-Forwarded-Encrypted: i=1; AJvYcCWECeMxvvsDusnGuFjkB2tOUxASxm6brLIGnlpPPc6N/rKPH08ec817QTuUXi4da0dHTfd4/nwGxJ8cgLbU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/cWzgqebPmaV6tRp3QTHVZXpR5VHxyzxXpPjuK9P8gEDpQH2S
	p9ZyLTT/dqzRVUmWrYHjYlNtGgYK1PrxiX52MoK64YCGkVzekau9WqdwgHXo0F0M2/IkcP8okR8
	1hChsWz4KXcvpaBXFAMfEKfDwUDpetLTFww9IaYJ47ogjGdnW1ltmrtz7mssPeIyE7o36
X-Gm-Gg: ASbGncsoh1YPAoaofGefWywppAjNKTNqpqFitwJLn6/AUAgIaJVFxvb+qoGGhDMpY36
	kpgXUYRG8JMxFStsi5KLZL1+M6Vsa0INNEY3IZBP17sQSgVK0p1CCFxQqTlw0Fm+ADW18kavM3W
	CtRgAgsPy8KBBrH0mLq2Z2XzAwf5gCXhujZJdsRMT9bv5ghc2WsNqWq4I9ZoN5EalCtb/Xm5Ksp
	m0XXZyX3lMCTQd2pQ4YNSYTS8Iy8Ghg1im5gms/iYxFVKgEYr6rEX53re+ADEc/atEWiz6q9Ycs
	fXJhH0vUVKRmWO0d+Vk6jwngISYSW7K6I7Ka/dq82YzE1R0+QDxI1ZrX2Q==
X-Received: by 2002:a05:620a:448e:b0:7c9:3085:f848 with SMTP id af79cd13be357-7d3f98dbe63mr92534485a.13.1750366420906;
        Thu, 19 Jun 2025 13:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlujupLgvSs5a5AyaIHRjZX3uRjpvevuHi2JVJwJp+anGxQJPJMrz4BjOqmrjUIgdSGcb3Jw==
X-Received: by 2002:a05:620a:448e:b0:7c9:3085:f848 with SMTP id af79cd13be357-7d3f98dbe63mr92532085a.13.1750366420525;
        Thu, 19 Jun 2025 13:53:40 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1192680sm301118f8f.95.2025.06.19.13.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:53:39 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 19 Jun 2025 22:53:38 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        stanimir.k.varbanov@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/7] media: venus: hfi_plat_v6_lite: Populate decode
 capabilities
Message-ID: <aFR40iuTd6BQfQBF@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-6-jorge.ramirez@oss.qualcomm.com>
 <85b2ade8-7283-46cf-9246-f441511ed7c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85b2ade8-7283-46cf-9246-f441511ed7c7@linaro.org>
X-Proofpoint-GUID: mEk919mmnjT9Pz9xlD58rtfAcMlQbwgO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE3MSBTYWx0ZWRfX/mlXQ4MWBMuS
 mgkHITkOzJzQzBtlzqr/E8r3QzJTwjKudWyRJfbIWFQjKzmfZabWGlrAZ3d3PURjfPROR5glzbN
 DtVCBEGIGbEbETKsBxfDxtVVaW/jruw6PQwgQQgWYngKTM9qvHBbmNMaRwvnvZ/+zdjV074dNQf
 mThwWaQYKm5oR0xPiIupKhcZR5NeevJc7atLFR2X0aNRcF4a+VTLuX+WJ4q3/J3pBi5tLs7Xysj
 vtr0pHnvIrRvuDjkqXirH2aiMCCsYxEdR64WOtep5LMvFnWDkAXS3IU8L0ksVdwr5lFw6kYMgaw
 tL5Ql+FwjI/UTJilwL47Q+F/Cxx4SNa7LztzDD7PH1/mLH6Fler4usTcjzUD4uX+Bgt2HVgNlRq
 eKTCfsBkRwsj4La2nBFxR7Ww0txngZh2k78B2rMOWMuwm2gp449HnPG9W5PRlvpozXIxn7WP
X-Proofpoint-ORIG-GUID: mEk919mmnjT9Pz9xlD58rtfAcMlQbwgO
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=685478d6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=znBxSAuDsvdLRzVMNjAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190171

On 19/06/25 20:47:50, Bryan O'Donoghue wrote:
> On 19/06/2025 15:20, Jorge Ramirez-Ortiz wrote:
> > +static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
> > +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +};
> 
> This looks off, why is there no TYPE_ENC ?

yes

> 
> You're declaring the encoder in patch 6/7 - what's going on here ?

right, so at this stage, only decode support is being enabled, as
mentioned in the cover letter and reflected in the series. Patch 6/7
acknowledges that the hardware does support encoding, but the driver is
not enabling it yet.

I'm currently investigating an issue that causes a reboot during
encoding, and I plan to submit encoder support once that is resolved —
likely in the coming weeks.

Splitting the series this way should allow decode support to land
without delay, while encoder enablement can follow as a separate,
self-contained update. I hope this is acceptable.

> 
> ---
> bod

