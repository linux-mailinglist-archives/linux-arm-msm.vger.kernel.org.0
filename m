Return-Path: <linux-arm-msm+bounces-79392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E6449C19558
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 219F54EC07F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908CD248176;
	Wed, 29 Oct 2025 08:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+BRj58l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hG1L/gJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3064A311951
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761728255; cv=none; b=fneusgeIwm2kqLrY4pLsoeGNHwZLOLELE9/AGizaU2qheDgwa5eXk8Sv/R+9j+0cohi96qC7JwbVROhqFZs+A1bK2mIWIrTQ0kRa/IPrIauDjoGjDBi7P9kGZzBWjUxJDdPEZ3nF5sOCBc2YPUTtuprOw/1sKT6FcArzSQs9saM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761728255; c=relaxed/simple;
	bh=uyHyRRG0c7hcckE1qTKToAlpAamGl2bD+HNV/uRUeHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYevzd/3r5n0nKVxc+NCBOEbBun60CchC3119Pp2exWjkhlhlRM3/AfsvLbzm13Xx90Ff31CIVYDaLd9gVLruCBsEkbRbQwoRK10mLHwWS7pWKOHMdOzMGh130eEAz98bEUcoYpEBPo2XjJv5/jjeGS25+2gMTqJmnMrUd7S8gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+BRj58l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hG1L/gJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v1Vw3664632
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7a63mCSv+A9JvgWMq7Ieh7NT
	4tLcXzk9s+x47dKyuJQ=; b=F+BRj58lP+5eA/marruZFwnwCtmJMHkHj9YBDlBt
	qD9/cqIHj3w0TOZC3VGj94+on44sKfGeB1ku3OsYgjmuMLrniZYwqZPakT77gk1S
	WJMDmgrMtLFGrJEYoH4LCDorZG7yPw1ytbv6PC5nSAKio3Zhag1CHBJv0M4WQ5h6
	rR5Tm8cu01/aVD0/i6QaG7Bczau0v/jh+8MBkCXc6uf3UwB/gLwiCeRJP1I/J/ip
	pQwkLf9+NvB2m7Z5qall3khhRJCgtXJxYYZ1gkYc9OED1v5EyWeBLGjqh6KoL5OY
	O+6DaLmmJPzOI/NiK+/ABnInhgv6PpIn63B7kHSpETm+8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3svqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:57:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso172969911cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761728251; x=1762333051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7a63mCSv+A9JvgWMq7Ieh7NT4tLcXzk9s+x47dKyuJQ=;
        b=hG1L/gJbzHcW0WbZKOXLVKs+LjD6oHH4W8U3cBqKqsoggOA5G0m6sa1MLWV+bkQWhi
         zWMzN60KPisufr+NsaszKV+AanYNtjeCQSLWB6hnn4OskAykvV0o69cA9siNrle9VnUJ
         pBwMPx1L7D++9ayb4LtOEzf9lEE5Vvu73pYevkDD922v8tU6xiJwqsVm7Cz8KZ44Zt6j
         Tl/nqW8UcnazJyjCij9vIJkJvkMfsL6MFz9mfX/6oPs68KJc9XROmd7/2FXGmg9WaDEp
         sMdl+dmpiNRd2zPoXr67/FLdxkOg4SPHUo/YleZaa/HdHzL0S95hp9UP3Jdumabblh5F
         ZPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761728251; x=1762333051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7a63mCSv+A9JvgWMq7Ieh7NT4tLcXzk9s+x47dKyuJQ=;
        b=EkhmAG5+2+9i4owlJHocDJcMIjvHa3JRdQcKMb1c+DzgKtU8JQWTpTIBDe47B82RTr
         ioMtnJBtMUFTTqKbbiXmX+izAGZuzYA9E0epyDjS46gO44Iq531muDd9kHtEjjkHLWS1
         UdYqAF5u6l4gFU6uVxA11NsSOqeKGWxusTrQdIPsVXUDr04OSH0bxHBS5lPAop6bkRKe
         BRv6TL4FORcmIqq7SgSUDAEox2jsmZYwO14+OSk+xacEZFv9V15ds1V4NaO5D7jO6+ox
         FDO2o8ENQRsWMFqQZMCasHYmMPCqhBYkf2r86GK3n2LmiTWfwj6SlvDuyiUPK/b4SBsK
         2DVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL6r5sCWILxp7FTANpDrC1qfQkr7gp/pG6Og1EpQacPdBDDpCOdzyBVyk+OTjdZSPpKmHfz1ix+YASmFAf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+X21Ps6lBw6mlXxVvawNpQ06Q/W4wL/ec+sZQneJz7WRWIFc
	QXrUOKD1nGUIt7+ZkXPuzFUEU/zPXJkJ/bDGtffhrfmcklunf+6ufds+43FO3BFjd7ZviwOyjIY
	kMRm4IRyqeckjVujbU/iAQ8HcXbBEcOpwfUwbFJTCQMOMtB4o/lKig4U2ixn6X4hmk6uI
X-Gm-Gg: ASbGncv8PTgaO3gzr0nb8VIqH4WWFL7Rj69JM/yuAwFcnVYolrojWJRCKykoPfldO27
	nmI98Vsxf0rrP3L1BL+OPiY4JUC67Uq4hXZhRciWwgVk47oE1kaVVjy10W80Y87n4Pr807f7HLd
	UEmHHuefbPdcfbltx/p+YZ/+y1aMVY38aATembLAbXTstggC4Gaz2RuRb877l6+RDwLjzo54VaG
	eqq1CrX2krGxevKjZRYgcdhtA3AJ/keo1IS/qkYAssQRP+jnZrupDN7ziMfqtYi0O2CNYMcm2+I
	iY1xRZ9QKhOIHujW+GHemPdRmAo7VIFh9+1aAyEVUCBWbyJT/eaYS1HAhm/9cGB5E7p+cadLV59
	VE6lQGH2elwWdNC5aHPLwgGy8uvjaXkF2nQ4Y3/ZfkbSFgIHyICCG45E5r6zMVc2TjsmrtVz9o7
	iNZBucptihxInJ
X-Received: by 2002:a05:622a:1b87:b0:4b2:9cdc:6d52 with SMTP id d75a77b69052e-4ed15c9afcamr25245891cf.71.1761728251382;
        Wed, 29 Oct 2025 01:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHMxS9dJDlfut9jklaN1u7WjxrtXy+M4HfVu5cw7ucNDEH9oxaqvAGSpJbi0LaKmBBPdMe+A==
X-Received: by 2002:a05:622a:1b87:b0:4b2:9cdc:6d52 with SMTP id d75a77b69052e-4ed15c9afcamr25245721cf.71.1761728250874;
        Wed, 29 Oct 2025 01:57:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0bbfeasm32127811fa.25.2025.10.29.01.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:57:29 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:57:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        Jani Nikula <jani.nikula@intel.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
Message-ID: <jn7piiqfyeiiinpxu5ht7qza2la3cigdqlhtlvuvkbzqeyhcad@v5aypgcrcdok>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
X-Proofpoint-ORIG-GUID: GGlLSnzF4yFJE-cAoxKK7qZZehJzAcCw
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=6901d6fc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=rHtxkZaJ8jImS8H9yjEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NiBTYWx0ZWRfX1TW6svFCwh9E
 C0qe5GcKT5ZFSyM1RA89irwjGYVuwOAUSn2YuJm74JBNTfB4zdLIaB36DDhmkzXEJVk12DJytRX
 fhzPOFpRjfM3dXgnVXGjpiHoR1fT98JUbpkCPcsKss4ChZjN6H+7DjhRefsCKuewl+AoO64i9eI
 zMyl0OXacczlns+OMUR+nXKp6oP0kkWk6UpmoiCa7Bq/q39/2Y8S2BHJlr7wc4byFKFAqxA31aH
 ICL3+umtpe2KRskt1ueltTZjvFB6wc9aNbaXNo3vqMTBNEhlgQ/5oUztFOKWrufU4PCxZ5nSYBX
 YEm5cdBLZOVbABSl9E6lhDvFIOFT9SEwCyjwJlu5Rb7RO0WJ7b5+VDNMYqQy5SLXt/7KhL6lE7w
 ghMsnO52GYrkTmCG6SXqe+GelCrslg==
X-Proofpoint-GUID: GGlLSnzF4yFJE-cAoxKK7qZZehJzAcCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290066

On Tue, Oct 28, 2025 at 03:28:17PM -0700, Khaled Almahallawy wrote:
> The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3 spec.
> Update its name to align with the DP 2.1 definition and reflect its
> actual use in the code. No functional changes.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
>  include/drm/display/drm_dp.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Would you prefer to merge this through drm-misc-next or through msm-next?

-- 
With best wishes
Dmitry

