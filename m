Return-Path: <linux-arm-msm+bounces-67959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B2B1D1DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 07:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8AE4627D31
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 05:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D2C8F6E;
	Thu,  7 Aug 2025 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqrs9qkh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DFC1E285A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 05:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754543402; cv=none; b=TeixUkM9fQipsjF1gTjqUd7v0w9CYugQtJnqbo0nYcSc0frcFAjeUVnWZCDMoQ/8mQJVjTJ4pVqdlYLO5QimhLH5Gf+S9Kwy8CY+1nlcocMtEcjGv+rDDqJ0Da3t2X8Kl9w+GnccMfrh74CaJ5NW05ty4J1CbziWO1yAzCGlO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754543402; c=relaxed/simple;
	bh=Tlr/AsUjBkz+xny+/rpFl7o+Ey8YWX6po2IM+lvkxEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2RVyJJ5M+6ow0Drh1aLpYLZLJD+Jv+te8EBcceu8GTiJHZNN6ibpYLnDZ/Neu3zhnPSPRTVaE24Lae/BZcAAi/F5h2qHpPP5gJDMtDMmxiN/Iguk8wTl3tB/Gzg5OvV28D1E3n8kVTd9QPbvFhykk+wiSkcXTnLWFZAibvgKJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqrs9qkh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5770KGbd011200
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 05:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bmXjPpDHd0Cgpzu9CL46gO7J
	+euneT5LSuqRLfgfzJA=; b=aqrs9qkhORFhgqiUNUP0pYhKt1VB6oMXbtys+wIJ
	lllsaCtVARHRehkk2xlv/zI5+koVePpz1iNe+b2INzZibBh7Yi7rE/W7pjymGhR7
	olOL9jaES0sYiNoNsYhRTjye27XU/mHsU5fhF7dRyn0dkcHHIhRCoJrUaPVv7qb/
	tBhJGP+3QysAA9t6Kf1KVZdqSLrMWD+pb/tsoIbJdXvKYlEBGlIP7iGNNxnLE1UA
	pIqUSY5LiyjCS8JsZSwEqXI9TEezGgVPisDefxobZ0i3s846grVh7fBJ5dJhaGCW
	P7MKmhrcytNa2AbShQ8+93IFOZJRLiCohcH8Pl5/C9esvg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw3537h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 05:09:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3214765a5b9so1246852a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 22:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754543399; x=1755148199;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmXjPpDHd0Cgpzu9CL46gO7J+euneT5LSuqRLfgfzJA=;
        b=qK6mNQSwU29BB6WJu2cMWSplvDyDThJMRZavlyJsGprupVCvS2SsE9qH3JCMJB8v4/
         jLZHgKKuTBS3OmYSaEdnXAPMz4Cklf+cwFMq0GJUZqws0LtHfd+1t+Lk9duw9xSeFHFh
         0RFY8ByRrvWvqbwA8mlh4QtLkvt60H/9fz48TUbUIuzPfxk+3xPCDU80n+EEtUGDcwAU
         fd6dkHJ4+mMWkrQNwP7vYUn7EeiesNTRRHVeFRVOTQ/7+nc6lefWjD9GKncIIzppVG4H
         6idrWKKTmt0O3h7TVcNX8LfFLvjcMmRqM5+vUoCtAihMuCfP2WuzeIiLbOW327cbj2v4
         Dv6g==
X-Forwarded-Encrypted: i=1; AJvYcCUcF36K7cZW5I/Xoaia94VcSDINJpscNTIT7NOv+z2c2EZYf+xqrlEDOPbJBSZGY8FzYzXTKALebIkEJVEG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0i5lr0si5/ZZ8jqypICqjqrDVxr9++z5HpgwTYPkMZG26sFMh
	XiLSfEsK/pQplPOjsyAZHV4TXEH/vtWNPh5afjPRGOSZ0rEFpDARjLlp/0SPZD2CoELmZGm9rDX
	7L9Dv+yr+BAr7StxR/avxxjANrs3OuOCyb32ZKeZAwsQpck45II8nATf/xKM0m6+QG+Vy
X-Gm-Gg: ASbGnctjJ67IK5q6HncvbRU4j64lzdCP0Axry7lDHZX8cZ4Bw0eQXkXiC9xX0FDeM5N
	QKaDLRKuqZhyo577/0dDyzXJy2qQQg/BpM9rEXxvssx9KHrivAzp7HDkeJ/mBmVP2q1JHl0gAX5
	/SEqwRqpxp/4sR7mQgVyVwXdmFmfCI7EfUwreX7rDNpRbQJrET8pggLsRFXvp6iK/4HpxMwNmVJ
	odXHQxzRtuP8N125IflnF50ldkQocNRsMjxnnsskI9d46bdpvcmeQihZXNJf+uo214U69/MMDCE
	59QaNriAK6v2MLcCWcOXjebf1ArB56Z7xBvJgJ+UOuCQ9dgfRJyGNKG9Uv4XaLFU4rs=
X-Received: by 2002:a17:90b:5101:b0:31f:3c3:947c with SMTP id 98e67ed59e1d1-32166c2af67mr7690687a91.10.1754543398722;
        Wed, 06 Aug 2025 22:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG47kar2q36LtbPQN4NmJWmgREGO2dRSmwYDlKD0mRi6OR7+kX7FHIYLR3UKacYjpT+SbKlfg==
X-Received: by 2002:a17:90b:5101:b0:31f:3c3:947c with SMTP id 98e67ed59e1d1-32166c2af67mr7690645a91.10.1754543398204;
        Wed, 06 Aug 2025 22:09:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b77f33asm14674650a12.5.2025.08.06.22.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 22:09:57 -0700 (PDT)
Date: Thu, 7 Aug 2025 10:39:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: mdt_loader: Fix check
 mdt_header_valid()
Message-ID: <20250807050950.n76f4vtndgjnujbo@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bjorn Andersson <andersson@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <wgpgwf2yq4awig5cztgkgm32h6zjtqzv4irpxd277gwjydofzu@f3zb6t4iyahc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wgpgwf2yq4awig5cztgkgm32h6zjtqzv4irpxd277gwjydofzu@f3zb6t4iyahc>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX6nXimXlh+Dfk
 GOT5cPxF94Eg8iMc8BfvmWsmRRyYi7MWdIICKQgPkMJ3HG7pOx3hgnxrOVD5h/PkH6YDGP7Sqw5
 Vt13mrAXlN2AhYfFfYnWUMa0mRxMAmnPh+Lt5/+8gyI2I2hwnpKMAzIddpd1f6McatjPJIe0C/w
 T30crCR0aLbPvbu4q95M+Ugget+MiCI8pdqvSct0TF9nQdSfmu7IfM9vc5+rJSzh1q1twYrYMQm
 JQ852C5vAQO6pglxkxMpJTSXZHzeQZyE+AeHNZ1RV12ks6KMgGAG1y5T/3/u8jzP7BuD17weke/
 NIOK64qwcRmaX+NERLq4/nVxKaKMlys/2m6hC6RQg7aBfimeXw5CSDE3CGAkDSaBg7npXdTongo
 zcBM5RW+
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=68943528 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=OaSFCp3QGDZU0s8We4QA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ArzqZtY9ADvNxV6SAo6z3IXMRl0jvisA
X-Proofpoint-ORIG-GUID: ArzqZtY9ADvNxV6SAo6z3IXMRl0jvisA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On Wed, Aug 06, 2025 at 03:01:45PM -0700, Bjorn Andersson wrote:
> On Wed, Aug 06, 2025 at 10:55:28PM +0530, Mukesh Ojha wrote:
> > Firmware binaries may lack section headers, in which case
> > the e_shentsize field in the ELF header can be zero.
> > 
> > Update mdt_header_valid() to correctly handle this scenario
> > by adjusting the validation logic accordingly.
> > 
> 
> As I replied earlier today on v1 (probably after you sent this), I've
> applied the patch I sent out earlier for this problem.

Sure, thank you.

-Mukesh

