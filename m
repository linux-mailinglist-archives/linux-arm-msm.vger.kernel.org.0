Return-Path: <linux-arm-msm+bounces-46980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD8EA29964
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 19:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B420C188499F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 18:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9771FDE2E;
	Wed,  5 Feb 2025 18:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD0Gr5fu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A607113D897
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781216; cv=none; b=WZQbIAaFW/HA0iu4/KWzmf7aMKpbjCf4bu7Df5V9Fin7kj1HQIZx44K+M4+4p92Lf9FI5Ku4/RpOq8KMHRlGsCtmh5wsnZnO31CNs8046Y7FR0j6qv5cJj8WHW2lquHI70dxReyyKGfbYMkNkM682sO/ervt5QYEXUnX6Aa5acs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781216; c=relaxed/simple;
	bh=xp+bFtd1+d1Q/RncsT/xwVATZTsyeMhuuWQul8yzh44=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Dy+IcvwCXAsV9MuxiOh4UzwhYYMoKSRaVcWBY6cbu0j/GrwSXicBKLcpy1omfhLrxJx/Il4/gwSliXbzZSu7GIYRLjR12eewqzrcBmbimViGfqmFqbPucmS8sQnVTTY4by9273qV7hDKDhCGWfTUsCxyVwyziprbWkrzUQGNFng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD0Gr5fu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515FDiZd030431
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Feb 2025 18:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sj6F6ZKeHJ6Mw/TnnxhIcej0HEyhyfkLEbgVCSDldek=; b=TD0Gr5fuE47Dvwb0
	L4QE6XzMn2Zi3Wxl2FJl3VZ6wyi5nBKabiHap/NpwmRuM8AN0d2fJc6US9EbRccp
	ok8ALioyexoRExxhKAGrRIuM83d28dwPzZzoscYsLthKIBOsHdbIoNcXJkIAmkxW
	S5fW0X+IofURjgNJ864IvEb74/qJsnvrkCrsjXjOCSLt0FyPT5qpOYYTgV9q3DDk
	XhMDiPZA++L47oPap9N50xvKM9omDQKuxit+kEElia8nIa7Ke9AznS8ZyDgecRZ2
	7fFRiQ6tvlh5wCSrOZHC9PrI0+hCQHLpYlTrZU+CUNcwv4qdD+u5vxKTvLPsHGlS
	xJdFMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44maep8j4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 18:46:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21f1e5c641aso3973775ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 10:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781213; x=1739386013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj6F6ZKeHJ6Mw/TnnxhIcej0HEyhyfkLEbgVCSDldek=;
        b=rA8KgG0eXQ8I5Zi+7MstPqKMUVvylF4NdeExUpCpHK9bOtYlHRt6voTf69goJXHdP1
         Ct0sGAG6A9G724dRyP7xOqMKTv37wGvIOMoEeuI1UHu9mDg+9oUEKMx+BoP+g7v/StPN
         DKTPfKLd7sb7QZTp7MDkwMGWaq4OsZz4ruNCZlLtdbdjJZM2aEsYIM0cfz+fKuzraFRM
         aqI5joubss3qWhEuT+4ZHIjVxBFWsiigR5d4HWBFtQMaQeArpqqzxM4raIerKUugQnCv
         R2yZyTqmH2lGMStGLPjEBGYMXMT7VN6dvkmP+bsBxo7594wtfaWiq+vpjdiNSUvH8d1y
         JeUw==
X-Forwarded-Encrypted: i=1; AJvYcCUioyr6LfhltX5ZWKU4/k3RtnsiZZgoe8AI66/3cJaRQCszqHe3LKt6O3RLdUjTEGJIIstf649UDQxVHhLN@vger.kernel.org
X-Gm-Message-State: AOJu0YyQFrFj8S910TfKGBrm58xMWlkwuzwTNzkkW5hzvyW5I1cTXpIn
	9JMC3V2muk9H1014ZE86uwhmAvWb0pxQSPY0/b1yrZdCwIlgDjzwOxmRmG5kaqGqBf4PckGFLVP
	3ynBWVpL0tK4U3fn7oEB95v+g0r/PX/MWzbZNEUJUO6mWPQ/BUP8hFGzrdQ+yZKEs
X-Gm-Gg: ASbGnctXuhYIc5ISECkGK/nNXT5p5sYWC4b252NfFQJuhIAFQBRpcwD/knTXUHWUxzL
	FfcG9t5jF34XPw1wrtrDk6f9e7O9NqaKRUO1n4devUjQhRGBlsiTPZETWDxhsP4Qpf7GOLfVenf
	iFQqL/cQFPQwerYVVcGwfvHf/QtoNqH4GC2BIvniI5CFYLBEbsUyICAPo0bHc20efzbY/VRYb9B
	AX895bIX7gcIoQhdI+z43K49T89Q4+qAU6Y5/R5e8gHXIUAELT//JttZUdp802uvAjc1C3WT0gT
	bPCkwgI0w4z2A4MU2cZq4nf+zlVKV+JTy1esMn1/Z7yQGrJlraTbzEXltPcY
X-Received: by 2002:a17:902:e54c:b0:21f:baa:80be with SMTP id d9443c01a7336-21f17f1169amr56628915ad.46.1738781212823;
        Wed, 05 Feb 2025 10:46:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwRK2NsYyM2JwSr4IHxg7W6Lo0NOBwpVwZ0wesGLqvrA2lJK8DZBsuuWlgLMZJNcdh4vSsdg==
X-Received: by 2002:a17:902:e54c:b0:21f:baa:80be with SMTP id d9443c01a7336-21f17f1169amr56628595ad.46.1738781212421;
        Wed, 05 Feb 2025 10:46:52 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad4fdb4bb86sm3530031a12.43.2025.02.05.10.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 10:46:52 -0800 (PST)
Message-ID: <f7818536-4aff-4320-a9eb-9d755b86d6d8@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 10:46:50 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF,
 v2
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, ath11k@lists.infradead.org,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
References: <CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iPVaa8sytBEWoL1LEb2I_VZRdqBaA_qV
X-Proofpoint-ORIG-GUID: iPVaa8sytBEWoL1LEb2I_VZRdqBaA_qV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=894 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050144

On 2/4/2025 3:05 PM, Dmitry Baryshkov wrote:
> Hello,
> 
> With the hopes of getting this into the February linux-firmware release:
> Please add the following BDF file to the archive.
> 
> Changes since v1: added regdb from the same archive
> 
> * description for what hardware this is
>   - Qualcomm Robotics RB3 gen2 platform
>   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
> * origin of the board file
>   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
> release, licenced under LICENSE.qcom
> * ids to be used with the board file
>   - WCN6750 / hw 1.0
>      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
> * md5sum of each new board file to add
> 
> 39b270f43cb6d733cde607bf2b23e2be
> bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> bfbd247fe961dffc4e7fb413703fb284
> regdb-bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> 
> 

staged...
https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/ae4407c02a434534590dec3e0ef26b371fd7888b

