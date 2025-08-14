Return-Path: <linux-arm-msm+bounces-69111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A23B25C66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 816A83B89A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 06:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC4D25DB0D;
	Thu, 14 Aug 2025 06:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZD7Az6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4769925CC75
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154569; cv=none; b=li/4vYPRiJeyYLInV99isQOgheC98IiTHA0s25eGsdsRHLU9RpLb1Gx3rLOD7iRQmozwJG4JZg5og+CCy0tI5/Pu5M2VxotWL1Kwvc8u6/SapAH4rquW2+RyqEjgZA6JVS+LK9ZnBCoMW39i3/q6BnJs8u6ZKaa+0NqXGy4J3Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154569; c=relaxed/simple;
	bh=Z0U7PjtN+kG7WBV1dWh9tbgD5U+ORVUekeXfSD0DKxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvTyCR7qwxyrZAQtKstOz/QKYuI8qAKFcirY4zKxjXFeK3JGXSUPuZUGFulkza7/dB998sf8Vm5t9UAK4Avf/qsDkI/+j/2BRRxpAjN+CTeRCKv+OD8QT4omE6gadxGosl7c4OZp4cvuSqV9hw4ljhFBt2xFTejW0nOoXveTHfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZD7Az6h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMa2jK011060
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=446NGPC4IHTmfxm6TNEJ0F5d
	cdGOD5iAOKWcZQN3Tyk=; b=OZD7Az6hQdCV3hnFFaBeTxMouTOtSCMGZRTKyvfr
	CkcjX5ZJBlI46LCZnKcLbqGoMfGf1MGiKv6wkjzEPOgT7EhAaT7MG8oCsBwYI+kK
	VNe4AH22aVSyV2fw1q9ZbtrUbkSo6Y26Lm902j9Z1tbaR1tDeCylk4hXm/o9Fz6A
	Fgbr9adslP6BkVhiuRGFFKcQ4HeGxVkbICawX8v6TXxfPGgNybsIFe66VTBcXGh3
	KmZ4szc5c3TPmD9TXM7zcSn8ttke7uRRwT0cWGjXS5vHzBZaCX6KJcdRT4PE0ur/
	+pPJcGP0WQKqkC9B7P79HnhE/Zs0QE0NZPuYcVl3GftKEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbhu1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:56:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e8706a2bbfso66211385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755154566; x=1755759366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=446NGPC4IHTmfxm6TNEJ0F5dcdGOD5iAOKWcZQN3Tyk=;
        b=NnxrehfAYnx6hMtsc4n0cbJ2H70xoIAcSVo7EHCzJTEO+RUZF8EKHMb70g221tWh3B
         wEodgdxfheiib6KaxopkRTVq55680OHGK+n+477YlCERIZa986g/6aqk7FITKVHVz9Vz
         utUrjV0VuNm9PCMNoFe0nCX7tWRCiVc5wqNpAbXqvhHhX4xn0Sz9y+Ly9HPwgN1MbFNn
         U1rrvhm8U8A58aUt6R7fhigo7eUWsWaixTyzUGvf0JODuA6f1mndWz8b67lxvbHVD28I
         Crssbr58EeqJSa85mqRZ/gaNFY6CkYJjSX5YIIVNGttVvXZw+uMDep96FtPx551OfDNZ
         poKg==
X-Forwarded-Encrypted: i=1; AJvYcCWv9u6ATE6HQr0ZUsSJ3BElLZ2pH9r/OTElNdpXPNZkWemVb9tnNEDGDxrZILLnvVC366V+Bz4yg7SVtbue@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8VVKKVHUsU9Mv6mW7Tw1f9uRz9Ne3hRAvdgShNacGx5/lAreV
	UU1nMQNp/gFf42naEs7pkVLJz/j83UU+ZoFZEY/AIEIjs55KETis8IR2449xxzL7NdmkVifLs3Y
	riiz4fBh1oz85Sywl4ZZiKZyUK0kPF/Dw2LPpEfEjcV6ITYMCVJtUtLVvhk1E4jNkhz43
X-Gm-Gg: ASbGncuy3jxUZ0VlateltOtOtjIXSLTbbH0gT56x0GKkrmAj6AYqs0VvdpVf7i7Aq6c
	fDnF71CLsTos7ZBrxuNqahrBArdUKqB6nobba8dWDC7GTRs3vTBVaVpy+MwzavrbSpDExwBE2sr
	f6TWkJMh7d7Oms0c28zsydnM+cfExn7OrWF28CncwYRBlQRToK7ZZJ5kA+C+UwP4x3fdVxZ71I+
	atZejvzVTgKQNP97yfKSDSR8Nu+RE6/7E5aaNMdeBCDu6a6dgVOQEkdlrlyXgeio5qvMaqETZKa
	HYsl5ZBdP0G2hIbwRflN7xyeAEW+k7lRe2YWfT02ujvCabqo9SQde4XP/BiO6vyBAf+TwS5Axq3
	3vgO1oxkzN4taDwz00FeTgFSzvjMzyossbVrMI5PZz/lw8LETdvUp
X-Received: by 2002:a05:622a:1887:b0:4a9:cff3:68a2 with SMTP id d75a77b69052e-4b10aa6271bmr31969001cf.37.1755154565828;
        Wed, 13 Aug 2025 23:56:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu4eE3QLS9jnWgL6hZSYfORd2c5h9kWoE1NL/aOYxfZybe6CsmPBNHqWg40mW34hJP+Uy4Ww==
X-Received: by 2002:a05:622a:1887:b0:4a9:cff3:68a2 with SMTP id d75a77b69052e-4b10aa6271bmr31968791cf.37.1755154565366;
        Wed, 13 Aug 2025 23:56:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc859266dsm2374101e87.38.2025.08.13.23.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 23:56:03 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:56:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: marcus@nazgul.ch, kirill@korins.ky, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, andersson@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: describe x1e80100 ufs
Message-ID: <iezjm5d5o7ec7jqweyip2vcqtjv3icidw34yq36k7blxuff2sf@ou7ub3cpwx2k>
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
 <20250814005904.39173-2-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814005904.39173-2-harrison.vanderbyl@gmail.com>
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689d8887 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=2WfLOqSWa4--05Z-PRIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX2IbvMUsh3w5/
 asnOMF+sdvSTz+iSAZPbNxyqg8RIULpxVf6UoSuQqBOaEMvoTTF1w6Bzf0qW5JYJKk7q7NE5sOt
 aLiMEzpyUsiPsr/hER9UaqTliqQhWZbr4GiMbCaAXtdJ8M/yKzZnp7EfTnPjS8a3wjxyiXA8d6r
 KTpzA7zzmIEGSF3UMQyniYtUw75R3rV+fhbtsIYauoshyhhfTp0RusSMf2NNW8lLFS1gmnaEYAs
 PNh57QRZfl8jjhpYwwpXyE1Lz1XusZDJj7ZaIp2XDEWtRDk9RQnyXuTTkpXRrPfMdKiOjxQRWhl
 rFncgJLiSZ0sHLI5+YVW/M/mjr5tUi8YWJXgEmIWDsXM2/JylMWMXmyAarfl80olOzzYCB8W1H/
 Eva9pb7t
X-Proofpoint-ORIG-GUID: 8y-PjHUAk3BM1P4bEoq2G9o1X6eoIypB
X-Proofpoint-GUID: 8y-PjHUAk3BM1P4bEoq2G9o1X6eoIypB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

On Thu, Aug 14, 2025 at 10:59:02AM +1000, Harrison Vanderbyl wrote:
> Describe dt-bindings entries for x1e80100 ufs device
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>

EMpty line before the SoB tag, UFS not ufs.

> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml             | 2 ++

These two files are going to be merged by different maintainers through
different trees. Please split into two patches.

>  2 files changed, 4 insertions(+)
> 

-- 
With best wishes
Dmitry

