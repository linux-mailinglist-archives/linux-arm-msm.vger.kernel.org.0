Return-Path: <linux-arm-msm+bounces-73616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F5B586D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 23:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 756521895168
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 21:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E92627C150;
	Mon, 15 Sep 2025 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQxDCVFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C98627C842
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 21:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757972099; cv=none; b=JnEXVHizpqgE+hstRgCWJevtgNeqk3Rzxlc+W+Kmaj6lH5rMwlGzfpxGA5P6iwmTtjlUhOB0dijL1PmvGmQVAtlMA2xdld0rTHbXvianhz1ek34/Un+QfKQ9WECC7pTwGZoJfWxTbVgRiTUqGya4hUFwBmmBV8i1RUOENde5BRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757972099; c=relaxed/simple;
	bh=3rqDTno+y5MRlGA2j452QDWVWRduF3hvtfQ/koLMGZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4GZdcm3DN6zhOoWiFMYlrdssdVDJl1YvxBhK1Is7lA+K5Oq1CTiI1Om5UEQmknE9dNfhmSe6iIKnOYeREC2QGIPaMFWSsoplCOgn1T7urPRqhbkIMHgxHxsGu0VwBcqHSF7no4MYjp2u3lbRrmMQHX+96iNOklU9bEr67xrJrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQxDCVFS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FEUUHq027131
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 21:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0RWWNpLVbQn5FO67vcCLaQi1
	bT4s5vqNnyqBSJCo1Zo=; b=gQxDCVFSRaSielU22l7W80gE5l2ivv4B6rlulZmr
	oruCDEj6RDZQxhPA9U8wS2o9d+RM9fsQ8rXzoeXmlEEXZbG9+P3co6L7Br/4sQwf
	RqOi1HEhqPo/gAOsm5fSQ9eZAPWdAUI28usJucogm1eaXIBMxRHDPi5dsK9weOsc
	oFVIocDKtzh7ftRPEQf1FhGvVCHCWN6OT4EfvdugY8y4Z1xBtqtTSGVkOssUar0W
	mFq51uQUOLxHhWWIwgrbGwBTGcG3voWc6r35gOTtraH5VOSiTzJcaGefjArmwGZo
	Z0kpaeqPExEXSgIpwqSZrMDC9KObKhiNWULxGnh28qjgBw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072pewq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 21:34:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-777fb17fd83so43723486d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 14:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757972095; x=1758576895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RWWNpLVbQn5FO67vcCLaQi1bT4s5vqNnyqBSJCo1Zo=;
        b=gKifKVkotjCRrHuG+rOkB5jVabqIEAWvQ1/AVIGssU9i3bD8BJGRutTGFaK9m+0dbT
         9T9XQgaHSEUu/BpvSx1DKR18ssMdAfZC9tRwTrWTt0JtxSkbQm+wG7lAdabFNBpKdeWM
         V7QRkZ9gJz5ziNUU+0FFODXeJ9huMsELoiLy/DM2lYL2K8OdcraoElu2HUsnMa/6Kb1K
         cuvxpBEY4yRjWLbGd6q4kM/X0F7lmP9gCjPJJqLQFAQp/+hG+7Ti/3ahj8gA1dA8cbUq
         5eKDRkIvU5aODpBw7/Pzjq8tqLtuyOoF4TnLmY1r3pb0K5X1sahUbHFL0hkJcpIIxVmT
         meag==
X-Forwarded-Encrypted: i=1; AJvYcCXj65EmakQN8T+aybNhnMPYP7FsnK2329gmO4MrIb8CdgDLlOanLPPoSyP0LSM77csQclA2Wm+TR/Ci3MHu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3CO/n8TGtkmoVHJ1EaQqqhaUoG3FQ+YHtIBiUgfuuGcwmw3EA
	934OXpgSvCcHcq0FfzFcCXK5AelruNMMvzjRLh8V7VkJRXQ/mgQ1I5qjo9HvOnchqV0usYPXDeH
	UCfMD6ag70/SVtGnfkc+g9UxB9kofx4fsPaGwvulYthlx51Le5qfmCDbWpQ8B74U1skkc
X-Gm-Gg: ASbGncuIHEIN2GKfjYDUUDmjQIILvguJdnmADyo1TINLQJn2OkzfWERIFZmW2PcwEMy
	1UdOItrMoVQbqy4/F9ubnGwhRW8Zw+Rw3Nofq7t9nwFv0hq1UAVTHRm4qr4t7oRYc9x7izJk/9h
	1wnIPulAIo/1q0byBSFSsFzWPrqORlraDhB0bzwlc9dSiLKyxoyNSedDWys91XmKRnaM2AROLU7
	Qcv2WqLyFkPvzf4cB1u8mAgCqlc1nCMrsJvdTYUUS9zc9vpp04EygWsJlcpY3kzqGCMfYQZQls/
	aa+0pAWJBUGSJqDiIE/cq5e7wSS/aoAEyfJEwmOoki9xhCgLW6+olK1L5GBy4keLnkNxWfsoSuz
	RR9rVXpAs/8b5MSa/Trz+LpzCPDGlr5EeJobTMw4sZhqmLIFOg+Ue
X-Received: by 2002:a05:6214:2586:b0:782:2aff:be65 with SMTP id 6a1803df08f44-7822affc5a7mr71332746d6.34.1757972094941;
        Mon, 15 Sep 2025 14:34:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtlDasC1ZQPCCjqNR+pgCjz0fr270/RvlCMQbVUAkHKkTOglxSSqOxCrnaXbiLVF7sx1pLSw==
X-Received: by 2002:a05:6214:2586:b0:782:2aff:be65 with SMTP id 6a1803df08f44-7822affc5a7mr71332406d6.34.1757972094375;
        Mon, 15 Sep 2025 14:34:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63d88sm3924118e87.87.2025.09.15.14.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 14:34:53 -0700 (PDT)
Date: Tue, 16 Sep 2025 00:34:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8150: Fix reg base of
 frame@17c27000
Message-ID: <kbmkr7r7qsymwsk2hkfldvjq5w7ubldvepe5qxzph3d6sn4q27@24aprkdxyj4u>
References: <20250915200132.774377-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915200132.774377-1-alok.a.tiwari@oracle.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX9jzSVXwF/E0t
 XIjgN/+f/9Tqm9NW2MXkPuhhQm5kRKuyfPsNp6U1tXHEzOa21YCNnafpVxtj5LTtfvwLdamOLSY
 tjPoJnDasGkxdwHK3qEhx4Htlvo+F3LyoThepoPv4oQCJD62jjR+hbUU6USUdV40k8/rI6e8jZZ
 ei5bnmkLXBJhC32rBFfstD1NNRGLe0L2Ib5a9G7BxqR6s8MBCAAEeHe4Tp/cJNO46OGIa+Xux+U
 4dsMTsGYj5XqjKjPAHPdAE5PjvZpCY8Mk/LZtsnWyHn8HgGsOnlUrAS2xrsu1/heKWwlAN/O8GV
 xnaAxwqdoNUz2qGiwWvLhCjv9E1pEaWjYAU7Qc4ZFPm+urKmVQZ+PWzq9VR5xYeCQPBLxcV/KHr
 1mVwpLCz
X-Proofpoint-GUID: mZl_s0XFXMhBM_j0HjaP5VW9UEqt-ne2
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c8867f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=EUspDBNiAAAA:8
 a=lAJItx95wPgQCyT0f4MA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mZl_s0XFXMhBM_j0HjaP5VW9UEqt-ne2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

On Mon, Sep 15, 2025 at 01:01:26PM -0700, Alok Tiwari wrote:
> The frame@17c27000 node uses the wrong base address 0x17c26000.
> This does not match the node name.
> 
> Update the reg property to use the correct base address 0x17c27000,
> which matches the node name and avoids the overlap.
> 
> Fixes: e13c6d144fa0 ("arm64: dts: qcom: sm8150: Add base dts file")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> Link: https://lore.kernel.org/all/20250913183018.4017208-1-alok.a.tiwari@oracle.com/

No random Link links, please. Use the links in the changelog to point to
the previous revisions.

> ---
> v1 -> v2
> fixed reg property as frame@17c27000 is correct.
> as suggested by Dmitry.
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

