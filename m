Return-Path: <linux-arm-msm+bounces-58024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0A2AB7A9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6028E4C2FE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 00:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A779817C91;
	Thu, 15 May 2025 00:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyRGtW8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD6961FCE
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 00:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747269170; cv=none; b=guZsQ5/dtH8tYyw2KSxhEkc0Ea71BolBRWQxmWkH4VClA1dz7ua+Yl4RAppfhPAs1vKI4MLzXncDFpl/86tkbl25rY+aZ5bfFmIO/ZKPrWjChHvJDhaj3eIixhsZgj/XpYRIV9+TbQRtyvca90yH1X+txzOO6s9guZIHNP5+AVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747269170; c=relaxed/simple;
	bh=UiIcXEy6ta617p/Qw33fSBKI/YQF/+25YRRnXBxysL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izzivdvcVsw5GSisjyAk/g8fxDoYAHKfN2snOvV4R6KsdL/0gs2OrXNt9+lVEFsJWcnqY5AJy1MSUaKahcSwvx7iAI/m7jjyJVH2CB4eLv7INFLlNteOlnzsOScVbBcYsnp5E4aqEuvW98SiHI3FPxBaa2jtAQHAOypfJMY1NSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyRGtW8F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKpmfH025457
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 00:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jMX8MEuNbqB8c/F1/VjebPfy
	Bmoob4q2DgIFRmEpoZY=; b=FyRGtW8FJBxPZRuJS3HpFlnhHAVvxQb6Cx0f+4Du
	KvVR/9+TUAAOJnv8aVF0fjOfElZ4ooF1XRaPdjZkjATsKe+GNPdpORQgr/WocG8m
	Lmo6jOa6DcSqNGWLdeDbC/11ukij0qsmCpBk5gKZTaCNtTOb1w4+DaLWoD7+oFDN
	ZLxnVcAA6fr7HtQunJ1uKjd2386a2oqaS2FHRGEkOlszFw4yWRHDF5ae6sV2Ur4r
	OcNGUEsOhkiCEvyPWYTK8yBFPNnmWfJYD+Btnq6dzXmHL8rH4NZEkq7c//+CrN7V
	cEs/slPKYsALcfbzXVHc8Vqm6fdNpVUvwGhR/gKiRI9+zA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew4cm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 00:32:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so92908485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 17:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747269167; x=1747873967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMX8MEuNbqB8c/F1/VjebPfyBmoob4q2DgIFRmEpoZY=;
        b=tlc7oyn+j5iHoaOQ6UXt7iS0Hr2q+f7pF0kIV/bKv5jOPja1sGMaS9yCsTheDZIFFO
         tCKavQIa5wAI3fwC/fQgwA5KHa3vGRatdBIrLRWxJMwIIO9cltBzeustxifgGhpg01b/
         94jx5eafaHKEVdENMQ4R8miHGPw8VZERYcvNDGg12Jz1fNSdD7p2iotVY18ybQHissL9
         uXCqtWL7OSGJdH8rCHg6hkEEkvYhk684UxkFKWu5QvtE7rxu/WRcFez8NrEgKcD5gJiR
         OXUz2p1EaY//OrSfk+ODT3ufwrzob1nzOTwlHzOpLAtkKXo/uqsBVndGEz6HrU73+b2w
         tkMA==
X-Forwarded-Encrypted: i=1; AJvYcCUKz4zsxRvXNvieNDczi6BiWrMiPEgUifRNRcKS1S/xzinwdQdT6oMY4uhLws9ILiV3i5syTrLklWyB6zfu@vger.kernel.org
X-Gm-Message-State: AOJu0YyAp8UvyOpWyezMcMTz5a4J1kj2ijcd1ponNaFqOofO8kng2VYY
	+2p149bR77J1lW5Wdt999U46HUOItOnRx185+lxbSaFuCSZGFHDFdEXv6lF9i/gZbOZeDYxDyhB
	JuVkYaLUImV9v7ppxJnuy1dlHdSl7E/E8YIMRu558gmDrjTyeEkrgBjEXaqvKHkVp
X-Gm-Gg: ASbGncsTbbQfDlv0lct0CId9LR6uHN6CTT+nXSAM6rPItl0JtA7EsVFSP5f2Zj0lQZw
	gobJuKRld7z94fDuMlkbQg+LlYLkdC0wY/RHN6psRX40GMAWN6N1HrpYwFuvhI3Hmx0iikPlLOi
	5j+rTNUh5FW4OpU5hEfyvXRLjXqFbBUKt9Sisq55JT8dHeRoRTXWw/aKQiMxHdkHOLNJaiV9M2i
	F5mWhaRCAcNqYT0cb9TPX+WWimZNDRcRFNPCfn6w1V1b0cfiEIV/oGqaFrVGpyIulEqqKdvYgSE
	Qi3Cs8N/zjz3vv/hQWX3bPoMFfD/2Qn2zjrWRKont50u6ckkhS6j/GZxXhsKmX0ARGDxU8nnXjs
	=
X-Received: by 2002:a05:620a:404d:b0:7c9:6d26:91b9 with SMTP id af79cd13be357-7cd3c80a6cbmr61022485a.36.1747269166826;
        Wed, 14 May 2025 17:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1frL1HZd5yd5hFRUBJhSomzVm57HGiu4Y7gzv+uda4Y1bA5fiAlWFerS/koCTLMIP76ifNg==
X-Received: by 2002:a05:620a:404d:b0:7c9:6d26:91b9 with SMTP id af79cd13be357-7cd3c80a6cbmr61018085a.36.1747269166342;
        Wed, 14 May 2025 17:32:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cf90sm2401020e87.71.2025.05.14.17.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 17:32:45 -0700 (PDT)
Date: Thu, 15 May 2025 03:32:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks
 struct
Message-ID: <2x3wyi2pfyax236zuixmk6xi2agooy77cn4goaejirlms4f7l5@7bhybz5llqtt>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-GUID: fMGeJB3PkBPLF9qex09HiWNm4SNUk77X
X-Proofpoint-ORIG-GUID: fMGeJB3PkBPLF9qex09HiWNm4SNUk77X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMyBTYWx0ZWRfX33O2vb90T0iP
 y9fZ4bwGzceW9r9hz7cBIXrsk9Ywm5iGKwmcuycOwiXUX+2GoFCGDh2XVmjgnYTmlKYCfDk/QtD
 eK3dTc0L6cvErZmSWYHAWkbdNu3bI8IH8vJUOeko3bPtDGxfohd+eDw7TOrQDufHP2jOIKVFaWW
 tices6fZCgjwTRGOu5weMqjZsQ4b1geZbcW4cwrbvgZecpp4F1z9vbNSDF4n/y8S9CxwUkPEaWt
 6ADzv3dtmCPTA71ciBs2w8ruyVDsBdwReoX1vjN5qvG3dB2cjdoAeeV60EKmt41t2MkMXoxPo4E
 dLQ8SBXIyWFurS5KnQUKEPZ4v88SlcpwSrJ7sfjRrAGgHkTEYjo2C+b1D3IqpTm+l9VHlCQwzHv
 hGrxVwORw9Q+S0yTcpH46R1yBbrt7sAtpRhrv9/RStTYq3tLVYHfnCSSJcgvOYqvyZpN57GT
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6825362f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ABbDsRMl8xt5kB7kq2cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=707 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150003

On Wed, May 14, 2025 at 04:52:29PM -0700, Jessica Zhang wrote:
> Drop the unused maxwidth field from the dpu_lm_sub_blks struct
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 -
>  2 files changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

