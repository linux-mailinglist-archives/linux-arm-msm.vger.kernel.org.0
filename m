Return-Path: <linux-arm-msm+bounces-36521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10C9B728F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 03:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA201F23F19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 02:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9D57581F;
	Thu, 31 Oct 2024 02:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElM02GhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4969E85656
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 02:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730342276; cv=none; b=OP5CMw6fiQWZldhCuTKhtPIuICKtViYzf8bj3p/d5bd2wuhLTQQLHXFffDjUSYEH5/suMetMH/tlVlH27bO5ob2KtMGdNx8AXu3FxI9HeAi56pLMod0H4K37Y25zyv62vCF8vVgg+8n0a41jfZrW/ze3hZUSKbaVKpEg4TrEFmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730342276; c=relaxed/simple;
	bh=3wlJ4WYEWLeICusG89vq4fKj2EstA6rn36oo+NmkyZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fek62fpX1Q82qBfiz4ZO7E3Mwa4eEg4yuSRpNi4xFYH0GvI44sk0wOGB4GUHlM986AV6+y0qUTRvCRoUOVosIvmxkMFFdPr5IWy4Vcm9H4JwzVT7LbMpDm4JmlmfQHwr4Ym5nyWOBtTR9scfk/fZ0/LyWSdxlW62qkcljwBaNok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElM02GhI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UL5lqM006026
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 02:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UVicVPbOPvmlNYl6KOV/QcaU
	Rfasslr7taJrI75SLl8=; b=ElM02GhIkKBpB/GxxG76mHlZa4+6YhgpFLT8Ktq6
	b2RZ3uO5oHlCzd+FsnsQyDY/A4q/2oKYkKCK5ZjiwHMCg6/MDQwhw/r7T/OkicIq
	YZz1W9VWM6DE/ed5+cO4vGfFS6Wme29hZjNF56E3xr6iMrxePkU4KoVuBmyCz4eW
	bK05fouQBjaTRoTjDlmfUuRpNsg2+RAtkLqINJZjGrQJixYfoIMvody83APuKidY
	OVDm7Or5e4dKCcbV0upFu/22FzWiRwdXd/Ay8nrqrHPI1kijHDdp2RDUcI3No/Hl
	kJ8wrhDAFELivRIDx8jm7aoxti24enU+Dx5fcndBfSyq+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grgup0yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 02:37:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-20e6dc85472so4397725ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 19:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730342271; x=1730947071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVicVPbOPvmlNYl6KOV/QcaURfasslr7taJrI75SLl8=;
        b=qkXAMvAdIguQUqgW6MmdNyJ+UjogYmli6jzBcfdhVyGfJgfFKy6fHZYFivgAoYxqGB
         iLsWNKU6UBykBlhixI/2tAtSVU9JTBXdlFa4sEyhTEyTOsXwVvrmnkUWm5/kHBLBxRRO
         YvciRRPOBnOzf6Ad3STD4nDTLBD//W/PJ7syvQbJYvmuBh+c/9HhoLaGiSEwUzpxRRi8
         r54WpEeeMEdz9qPIhCbeaAekDp36vy8M9nRne26DTzEIdjiB7Y0lxewIXOqtHNiDSoxc
         mnLIp/XPouZPaBpB4XgDIlIGBeBOKQZBP9NX1oBM47WIkarRFTlaw4+INZNyWogOE8iF
         Ui/g==
X-Forwarded-Encrypted: i=1; AJvYcCWsNQigx+8pooKWcs2f5Z2jPDkW2kr7fyq511O3t1IzoPUu+RR3dOvZpi1pMO6NHQHPYaw/WyD5oNobyYxC@vger.kernel.org
X-Gm-Message-State: AOJu0YyG6oFtXpbm/qYcdOBSrSgyfRKCar8jt01LtPGbsQaucR5nWGMM
	Dsx+trLyJWsL3HS//KskjftYqV6WiAPPMXB+s9J0FMUsuit90pmZOzBWXr6f0NKlaCkHZON9k5V
	ov3iUPtAO2omU1I3F3yeY2xeFHL40X+LBVNygRjbGVMotcVaVJq624lX1Er+Pn2kq
X-Received: by 2002:a17:902:dace:b0:20c:eb89:4881 with SMTP id d9443c01a7336-210c6c34819mr216011885ad.37.1730342271405;
        Wed, 30 Oct 2024 19:37:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMwtV2E8QO+5/HInTKTfmwtQs0DyYM8k+NPyg7a6285R0AAxM991MQhGdAvCZ2YmYW8IDUWg==
X-Received: by 2002:a17:902:dace:b0:20c:eb89:4881 with SMTP id d9443c01a7336-210c6c34819mr216011705ad.37.1730342271058;
        Wed, 30 Oct 2024 19:37:51 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c0e67sm2395875ad.203.2024.10.30.19.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 19:37:50 -0700 (PDT)
Date: Wed, 30 Oct 2024 19:37:48 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: shaojiedong <quic_shaojied@quicinc.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] um: Remove double zero check
Message-ID: <ZyLtfD7KUMRZ2H1t@hu-bjorande-lv.qualcomm.com>
References: <20241025-upstream_branch-v3-1-f6ec670e0206@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025-upstream_branch-v3-1-f6ec670e0206@quicinc.com>
X-Proofpoint-ORIG-GUID: WqMBG50K8h_-YDYd3y2vazlE5o8Ys_nU
X-Proofpoint-GUID: WqMBG50K8h_-YDYd3y2vazlE5o8Ys_nU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410310019

On Fri, Oct 25, 2024 at 02:45:37PM +0800, shaojiedong wrote:

Dmitry asked you to not send multiple versions of a patch within 24
hours, and you seem to have sent the next version 5 hours later...

Perhaps you are unaware that you are Cc'ing the public list
(linux-arm-msm@)? Please do get your patches reviewed on the internal
list before sending more.

> free_pages() performs a parameter null check inside
> therefore remove double zero check here.
> 

It seems correct that the check is unnecessary, but is the impact of
this change worth sending and getting four versions reviewed?

> Signed-off-by: Shaojie Dong <quic_shaojied@quicinc.com>

The author of the commit doesn't match the signed-off-by.

> ---
> Changes in v3:
> - EDITME: fit the git setup and simplify commit description

Drop the EDITME: from the changelog.

> - Link to v2: https://lore.kernel.org/r/20241025-upstream_branch-v2-1-072009bfa7d0@quicinc.com
> 
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

This wasn't updated at all.

Regards,
Bjorn

> - Link to v1: https://lore.kernel.org/r/20241025-upstream_branch-v1-1-4829506c7cdb@quicinc.com
> ---
>  arch/um/kernel/skas/mmu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/um/kernel/skas/mmu.c b/arch/um/kernel/skas/mmu.c
> index d3fb506d5bd6084046cf5903c629432cd42b5ab3..0eb5a1d3ba70134f75d9b2af18544fca7248c6d6 100644
> --- a/arch/um/kernel/skas/mmu.c
> +++ b/arch/um/kernel/skas/mmu.c
> @@ -46,8 +46,7 @@ int init_new_context(struct task_struct *task, struct mm_struct *mm)
>  	return 0;
>  
>   out_free:
> -	if (new_id->stack != 0)
> -		free_pages(new_id->stack, ilog2(STUB_DATA_PAGES));
> +	free_pages(new_id->stack, ilog2(STUB_DATA_PAGES));
>   out:
>  	return ret;
>  }
> 
> ---
> base-commit: fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
> change-id: 20241025-upstream_branch-06a9ea92948d
> 
> Best regards,
> -- 
> shaojiedong <quic_shaojied@quicinc.com>
> 

