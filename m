Return-Path: <linux-arm-msm+bounces-117992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bCucGHOeT2qulAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:13:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1DA731734
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:13:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iCWIkrb3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jCr2BiDV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117992-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117992-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFF753077D49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C47E262FFC;
	Thu,  9 Jul 2026 13:10:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C7A264617
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:10:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602633; cv=none; b=kn/y9FuwFcGgXKStkfNwlKEQtWjPflghbRwzwBKnHjLnyYhW1rmUU36AMZzSw2xssge0awoa1PLEGSkSVhudRvHpp+PVVOxItTWyIXK0P4iE9XrErzxwyCQAzA6oy0pqdyUnkVOMJA1Pa9j2d/WbHBWlYTiG30+TLw/YCRwViyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602633; c=relaxed/simple;
	bh=Dsq3lEQKe/H1TDvpwIi8p3lkCA8eeKfJkYNghRMhTCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIsL9X4g5+xdS2q04yC0Ttlzpo98kZkuSXkR+8HOwVDmc/VBI8HFsUfNHl5oJfHLYtUDMKPv39Wf+uWhTvU++Q45pLj0Z8vRhUwPUEEPp+MtWckvIJXlItHx+BLzWc1IAAiXNS/Rvtc+pLbYmEwLQf6ssU7XoSn1rF1LLQPml4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCWIkrb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCr2BiDV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN10D1656975
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UDWMTGf7KjZRGusHUDteshd4
	8q+Vr4jRLBjONU3KsoI=; b=iCWIkrb37PF266Ll3VPm3Lwu03ymhFV0Ruct3V3R
	GA26/ju0bPQeN6Ojo9NlDVVz5FNBs1ih+eJTSquZIXOcTR05UYGG+Kqq5RwAzc4X
	ZovTlkq8DnJ0apRPykWox8tdWNArujDMWABNaZvEZSG6DElnHq0PrFamAWuf2a9X
	IjUtmTEIEyTp/nv0kqYFSL+sHRvhUFNIWQb/23+2tKZIvBfyfTbUUmvYllQPTMYC
	0FBx+AtugCPwb5Pic48xqpCCU4RSVAmNYw5UnVVjPt8N91uw4r7Z1khgmkKJr5mU
	U6ajA0fv/96xVkgGzAvakX2hircCWvK3ORWWk4tfaQs29A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3sqpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:10:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96dacd0abfdso356449241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602631; x=1784207431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDWMTGf7KjZRGusHUDteshd48q+Vr4jRLBjONU3KsoI=;
        b=jCr2BiDVlnR7luWyR7V9NWO9e3uXohFj6v5W7a3SvqztjM7UL7t/0t2JocKGUub4l+
         68WYO5XwyFzjUzuzaxUhI3WPyZxO4tpMJmRkGPRAjWGhxOcdjIMbyxNLVQkCT4k9gNj6
         PhHRfrr6Z9GZYfm/vX+LYzVfARisKBVMnmzzoSeUuCN/QpdlPe3FPdkl+GAs9cAGyn7B
         HWyFK9I7DNdB3QQ6Mv2yFTEBRUBaf8MmOV4V263B55IRKnl05K4ADthCNqLz0Xv0Eqkj
         tvQeuEEMRqjOc5i8zsgb5U0GhIqvvQ7ZI4xb0iMYzuGrCVKB2aHmCt+47rTY0QhjDJM/
         96fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602631; x=1784207431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDWMTGf7KjZRGusHUDteshd48q+Vr4jRLBjONU3KsoI=;
        b=Q+q2mL0AteZRtetUdW1hDyY6ZkGBZ21006GaVF2dmaz3VQ0dCdioKEWVhTI1GdX9js
         e+ykSIwVOD6USAcaFc7LNL1An4FthTLrHGHTltStsyDwwlXKMxJpZnO2Md2PrZv85NBo
         L2OLGNojeg8A16dAjp32/1pDlCsTMQN9FqTwLcuu6y07RleJuN1M8k0xD8I88nV/nGRD
         dxKo6Pda6q7kfVptJKOAse3G4MQOSBVfE8rwd690a13YdevqHl3jRHWZFgZ9x+OzxGAg
         AHJVkdqR9cZ+lP48/TMQT9dfTJIjj1ZYaxqkmyMjtu4yW9mrrNZlN80xXl/bdc1AczgZ
         iYJA==
X-Forwarded-Encrypted: i=1; AHgh+RrPm0UqHEDyhwBIKw8w4fXmwhiNYV66RbF6fczXAYhNKY54MzKeoWi//tZSf8cIBoIk12FLAFnPBc5PztmH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1hgEl1aIfR2a/Zn5Ve7lUF341tSGScDFG/PiTwv4Ng83OTz8L
	rhl0sNBH6HVabiReVURRhglLOa5xoroSCqFyimxGVF8QAMWwa1V376bZyP7leRp4lT1piH2PINi
	FXS0IP/vl6xWlskYsewTyYpsAemRXtAd5jFRM5rkkZOAjdDuIZor7SdkjrRUpaFXnMFw7
X-Gm-Gg: AfdE7cnopnVa1ifwdvfZdnI1D1Gt1vuN8aY9cWPrxf1VFe+8lwv9cfREiKdHPkI6UKv
	QBADJPqlQDrJ8zk9hQXspl7aVBe1vre+aXPFe3tNk41hJGQfinX3v8T31pk7o/UefRmO41MiOra
	x8fpWsS1PTGQ1qniG8hp6X0nm+WnM98lbhOI14HhzDy7uR+FOH7QiPFDi1LOQadGDasTIkBF8uT
	7HXrfB0jZpZ83hRpHj5D7D6Ru3zB+9qfjh3fvez7svPCzCr84DdVH4W3Nbsn7eQap9NPRaCCgOe
	Bef7CGRWBrDORfpy32C27fDtb55s21JNjuWOq77RJRKIR7It3td+Zcu/clTM6IhjRFaECXBj2E7
	/sK2IgQpXU3yzeMomHQt9oYQPrURBqgsfDgWHMB5b88XYx7qnq9BZCPOb75GQGjGhpgAIM3P922
	3TmU57XJ2UlPBuT/m7YVSHmqHT
X-Received: by 2002:a05:6102:374d:b0:728:4383:c831 with SMTP id ada2fe7eead31-744dff87b7emr4186038137.10.1783602630533;
        Thu, 09 Jul 2026 06:10:30 -0700 (PDT)
X-Received: by 2002:a05:6102:374d:b0:728:4383:c831 with SMTP id ada2fe7eead31-744dff87b7emr4185807137.10.1783602625267;
        Thu, 09 Jul 2026 06:10:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839ccsm5284238e87.37.2026.07.09.06.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:10:24 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:10:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 05/11] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
Message-ID: <v7bvga2bnfqkqjqw2yz3u2jdkm3virvbmk53xpfs5podc7ulcc@m52gmkxxdife>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-5-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-5-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DJw3oidt20OEK0WQ0cbg5EmqfudRF3cP
X-Proofpoint-GUID: DJw3oidt20OEK0WQ0cbg5EmqfudRF3cP
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f9dc7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=F3pHQiHvqLgxLLu4WVwA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfXwjRWIGooj4Ec
 iBV2Gohh+2huso7f4bMBZi0s1eZxdrpzs0kLHrZ4XkDLn1iCLD9PtvjI8KFcj0tURR9jPEMh9PI
 jRCN63kMF8KYjzsPQY9A8QBLpBh2Qls=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX4xkJPnYA69JD
 qHXaZDDOCe+VCuQKqwAN6933kXTyxwTy0ffsKmNvps+VVq1YTT6DK+gyCaLySFW85a+rDs6mgDG
 +DV5uKK+nxxBgVvlFCLL6u5UVbQv4upC89GdqUCkBsqzNYUDzbZEyoQ81OgxPobIA2R1KMZhanf
 2FpO4Je7Rj8h1rX759FTZGoNurvU/BXHXipuUVO2lnm55bCGqo4C2BbF4g33iAf66qBBf0WKn49
 Z3m0Uy0EuVwGjYxpUiywWEfH9u1Xipk2NYCsoLdSrFZXhjEnRmstq3Xvl1CVv1jDsOz1KrYMLC9
 vLD/34KAwbJLiPq+yFWREsswwwVyxAhKQrwUY6XrbeNc5pyZyF/CpucRYAYNYkfkobv091tc57z
 WOIEmtHq20kBPcLzI6XAMKbftiHsP9pHh5hOZgikNFj5eCKKE+17HgiZ1dVKaU5ikvlWlryJYB/
 WvL7kasDCYBFiETUTbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117992-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[m52gmkxxdife:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF1DA731734

On Thu, Jul 09, 2026 at 06:05:51PM +0530, Vikash Garodia wrote:
> The non-pixel and pixel subnodes move the IOMMU streams away from the
> iris parent device. As a result, the core device may not have an IOMMU
> mapping, and setting its DMA mask is unnecessary.
> Legacy platforms that have not migrated to subnodes still associate the
> streams with the parent device and still need the DMA mask setup. Call
> dma_set_mask_and_coherent() only when an IOMMU is mapped to the iris
> core device.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

