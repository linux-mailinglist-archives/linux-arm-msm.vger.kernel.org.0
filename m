Return-Path: <linux-arm-msm+bounces-82441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 533E4C6D6B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6CFC64EFB46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167193254A9;
	Wed, 19 Nov 2025 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGbylInq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9JxYkdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CC726AA91
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763540493; cv=none; b=GUp1UzanDU2KjS2gtEY8mDTmOv26VIT3hA6oL+Cg0ji1FX1B+DA6esvEt54sURdb1wBXYscKlhqLbWL9xy2SB2IhyA1zJmsRARLh7DGHPus7lQwDlQ+sDVzeMyw5ArY27UQ9oJJaVB2usbZ8B6d4kPYNm8ZXh6Occ2k3eYOMDfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763540493; c=relaxed/simple;
	bh=SGwW4r5mjx2bwsfrVY30D26LHtxfAtTf3i3shZHSBNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYnmMYUaORP21RMoxNB7sPy//1oklH6afxORn5U2P4bRlYB9797ugBhPMRXt0kwL2LA+2Et2F6PAIvhQnf5ONPw8es7ie3SwcNVqws1gzWIfmqA133vyd1T2O+/rxOfNWSVHyQevTEgxtrIrpybIUKZ0xwAsuyLOqpkgaLtJGCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGbylInq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9JxYkdk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ1Uxf73412721
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xEAsUPywi8rUkrZqMBKpeI5/
	a9H3yBT33dG3WPief/Y=; b=MGbylInqBcS9kDYPoGzVXV3Z5mNjOfquuoXyPDMr
	7wFQPUiB+DV22cLuHIamnCr/zMvASUVMEnDgu6wnw9l7vRpomCEZwKnojz+ORXYV
	eA0U1PlG+xxtwkt5c9zUUJjX5hs9EGqoD+kqEAxpqetdRTZILr9QMyQUcVLtWue1
	2IqE4IGUv5JbQPQ30WVOzYMrq4tQhh1lwpK74LxywLsVJFdvhPafvixxEm/BRWys
	pVcFZOy1hgRx3iB7bt8njsfygidsOOY7ybqHfYRl3gRFofNZyvNesoGoWOYDwmU7
	ANzQIIKwMrxD3C04zYvavmRsxDxsYLnJASjUP+2M3b7fMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v2ht6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:21:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2657cfcdaso791081885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763540490; x=1764145290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xEAsUPywi8rUkrZqMBKpeI5/a9H3yBT33dG3WPief/Y=;
        b=A9JxYkdk9P7QogAYuR3OuObCHzXFAdDsAFWlVGd2JAqSw9poRZ3LAcd1s6XCYDwPUR
         aPc/+jW2QUjT8WAM+ZUJCx4G6xrPUTczBd5NI/596Stln8iWdmnbvkeKI7TW+9RoEUkY
         cPSyXTRQQTPumUB/zRBXK4Wku18f+91IqB7ipmAJwioiMrKYnUUpYj1cB/r+9Sndnq9c
         wBtFw9N23mLEGGOxLFXyPI2LWY8t/eGewx929mTHq50EdxTreTFTvjbpbZz+FmLjFSZ6
         q0LJESKDzsxctUl2KRlXOMD1Csb+YrKzk/ZqUTMSIqcDluKz/LF5ILxyN8V1CjSoMqnl
         XgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763540490; x=1764145290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEAsUPywi8rUkrZqMBKpeI5/a9H3yBT33dG3WPief/Y=;
        b=n1ePErODISRdcmeXD4JerUrowI7gwOfLoShMlvl9vBGgRMNs3be/mnsruEl1Iu3QNg
         Kgf+/Zd68O5yKRcO9JZ/Y38zNFScWpjI5d3fUyuw7bKKT/THpSVkF4pHko4RCgHzxGyw
         OSKM4TojRz+dN4Z4Pougu9fYAuD3ssypOIHpcYqC6F8qDKgOAdlOLSTGTqQ4e3nvX04s
         KJdenw4SlWOW96rqiG/O8QFGQjCfkTLt1sjglRd05EDNpOSVU27DeRDHfBsTGtBrJ9ew
         O9VG+QD/BsqK9x6uGbFKrJvQNlIS7UHSpgSFqdhIB8+chUhpIjOGlovVFEG9bgJyIsik
         Srhw==
X-Forwarded-Encrypted: i=1; AJvYcCWRXlztnmBwnhc+btFwsW5Dk2Ee/Vjcv3v9Q5ht2n/akko9W57EdI3xDQPphAqA0/zur/FZ8zUlhRBzFqrt@vger.kernel.org
X-Gm-Message-State: AOJu0YxGP7EWBQLnP9liQ6JNHoz5lQIYGqe69LSzzqh4aHSFk64H4WbW
	e/vyO84xIpz4R1eD4uqLjjpAfgWSR2jifpBvEVmT0DL9Zmv8uHxMnKDyfT4lIODL4tDJVMCL8OB
	GAZASZjAREh+ii00gxFLoLxiLEAnFndBv/yTIhTVKLKb9OVxDmVQpDYFM8/0BHK70dDna
X-Gm-Gg: ASbGnct7GWWiXVB0q/78EX1fulOxxgUhVgpifTZE6CnY7SygLB5mRkmud2ZWZKj51QU
	iJka9ZJHdGG1bPkUTcx0opX8zRO773sXs1X7bPBmrNSrbOq7/jrdZNmW6sAa9kDZ/8Ziou20VZ7
	lpYnwVn+pAHw+MEZ8xkGf2JaEURZD1/GyrqStTsd40R+1bFEERDWoEQqAvtWpXp4Hm+Zn8QZ+It
	OFQMYl6sFRAayv2P1WcftBCL9pHN5r/VawV+tyYFOT+CjoVm/cww5VuQD8H7alWIXb7h7YUoc9n
	OOufE1cJyepeUTnJjfiwOm9uj6E+eN1WXmcIyBuestEHlfloAoTj1LGplM4eC110AZQGNBEO3hV
	8ljCq4r2f1DOqrw35TKU4hGlpqWkT7DW+0NxmIiCauoyWjUyh2vCL2EvjhoV0enaHt46U/tycDy
	9Sg75U8qO4l1NXoDt5rFSRHA8=
X-Received: by 2002:a05:620a:1788:b0:8b2:e8b5:1e9a with SMTP id af79cd13be357-8b2e8b521bfmr1425462385a.21.1763540489535;
        Wed, 19 Nov 2025 00:21:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRXc8k0vTH4YXhYm8Uq7SOvE23kdJYfiJ1GXMBzpPl0mZrGGhj8dQCLjyo0yHmskt2tOKZnA==
X-Received: by 2002:a05:620a:1788:b0:8b2:e8b5:1e9a with SMTP id af79cd13be357-8b2e8b521bfmr1425460885a.21.1763540489071;
        Wed, 19 Nov 2025 00:21:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040049fsm4560259e87.61.2025.11.19.00.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:21:28 -0800 (PST)
Date: Wed, 19 Nov 2025 10:21:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, quic_ahari@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 1/3] MAINTAINERS: broaden UFS Qualcomm binding file
 pattern
Message-ID: <bow74xfqthpcx53ncr766dcyqmij2ycy4xuigh5elg73jmwqcb@vpm43t27mbfj>
References: <20251114145646.2291324-1-ram.dwivedi@oss.qualcomm.com>
 <20251114145646.2291324-2-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114145646.2291324-2-ram.dwivedi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2NSBTYWx0ZWRfXzsB04AXfGAzd
 NeVbuGJR9gKKHWR3U+kSyDjjWEP2wZJ4/bjd8w6gNa10UpBNpQyl09KbJL3EkfHNyPn3F3ULS9h
 FtnzO0jzBC63snSZsrbVqsuDQe7EogZhnsj0P1f3E6FZ8TZUjM6/8bkFbMpfoWAsfwUpjn3LIso
 NhcLVfPdZhlnXZ+cmhX0xcU4yUsFLpymznbz9KAYRMoz20stYtsEGy+2bcMbTouDrdmm0ZD5Vh0
 Gpihn9ywDxU54p1ABQffPf4dclWlkHF2lQ8i/shBVpGhAxhX1rDe6M7rUDOpF5WvACrZAyUrNjm
 BZV+get5Y3RaAUzvr/YKQ7hWQdiHcqHle3NsC0hESQgn/wtwr1vM0dM2jdsyk033gBVSEtgeqLM
 PgbCkd+7Uzw+KSHoChMBjkNFAOwjuQ==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691d7e0a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qsePQymvRCq6VeTyyVoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4o9hrvmqhSEmFy7sDkS3Wi0qZLR0gf6h
X-Proofpoint-GUID: 4o9hrvmqhSEmFy7sDkS3Wi0qZLR0gf6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190065

On Fri, Nov 14, 2025 at 08:26:44PM +0530, Ram Kumar Dwivedi wrote:
> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> 
> Update the file pattern for UFS Qualcomm devicetree bindings to match
> all files under `Documentation/devicetree/bindings/ufs/qcom*` instead
> of only `qcom,ufs.yaml`. This ensures maintainers are correctly
> notified for any related binding changes.
> 
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

