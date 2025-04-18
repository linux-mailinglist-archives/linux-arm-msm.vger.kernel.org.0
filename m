Return-Path: <linux-arm-msm+bounces-54695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F48CA93144
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 06:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB3AA1B65832
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 04:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5B12522A1;
	Fri, 18 Apr 2025 04:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M1mz5CpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F0922DFA7;
	Fri, 18 Apr 2025 04:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744951463; cv=none; b=FRJshpsdHmNEa/0D5AaJkvCKDOn0JSFUnSz4FX0/SsN8nJQt47GAcPR87ZDC76UOuX/ejQphIDp8pxR8o1s61OuwGZFmJVnwj9CLJTgtptWNf+R64bqT8uq0Rqb9sqZkp6OWf5AkdA6yVtp3QVJ4I1+ngqSWhVzXtTwG7wnC53M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744951463; c=relaxed/simple;
	bh=HvpDoFmE8C8Lfh7/meePgZTyKzQrDFh5ry62b5Wy9M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EZzr1PO4eZRAGqUHo6LFOByQiwv/t8UUYqBRRYwKLYWDcUSM2/Bu/ohrbkQsSecUalWJGAwXFJ8KKmEwRtn5+Euq0xiAhMcQGKS2U541bfFUQwrzqBq0Uv0aXc/DjzoKZM2H22XWINCeRBPjFG35bHHN74m/v7oncXnD32C3Z3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M1mz5CpV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I20ITf013014;
	Fri, 18 Apr 2025 04:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhTVCz7oFnQ85dTd3BSO8mwUPp42l8g6+QUPGTRqihY=; b=M1mz5CpVusGX7VBe
	6GWKq2xSphuPCPg8/UzX/KKrqQGcKGaaXT6tdXluG0AIwnykw9eGNX7cXoDOpvGm
	SMA0dEV8S9sdhJxdV0CoAcD4JsjXLyBCrH1aNvM//tkoOa67//jGM/4oMPjoif0W
	aVJsqFrfSzuF3A1uCFfqI00990lkbFsrLwJ3JqeMok9NKXrsnpKGoPlqqT0IHQfy
	+Z8wGbBwtf4Sydy4KsToNrIBPsK0e3xMXcWsqmehbHNLecJQf3OXMiHMApn41bLB
	Bzl30f58CwLwTWXFwProdFYYR8EnSj8Wbs4EbS9SByr0o3zD/WqBUORVlEi+D3p6
	2naHMw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjrvs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 04:43:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I4hrIH031764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 04:43:53 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 21:43:49 -0700
Message-ID: <0a121c0f-edcb-4d5d-8427-f1eddddcb9bc@quicinc.com>
Date: Fri, 18 Apr 2025 10:13:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] scsi: ufs: pltfrm: Add parsing support for disable
 LPM property
To: Nitin Rawat <quic_nitirawa@quicinc.com>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <krzk+dt@kernel.org>,
        <robh@kernel.org>, <mani@kernel.org>, <conor+dt@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <beanhuo@micron.com>, <peter.wang@mediatek.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
 <20250417124645.24456-3-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250417124645.24456-3-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V377Z0ZTJKasj_fyz_2PIJy5GvNWe9xW
X-Proofpoint-ORIG-GUID: V377Z0ZTJKasj_fyz_2PIJy5GvNWe9xW
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=6801d88a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=c46ZkW_Sk1zESUiFrnIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180032



On 4/17/2025 6:16 PM, Nitin Rawat wrote:
[...]
> +/**
> + * ufshcd_parse_lpm_support - read from DT whether LPM modes should be disabled.
> + * @hba: host controller instance
> + */
> +static void ufshcd_parse_lpm_support(struct ufs_hba *hba)
> +{
> +	struct device *dev = hba->dev;
> +
> +	hba->disable_lpm = of_property_read_bool(dev->of_node, "disable-lpm");
> +	if (hba->disable_lpm)
> +		dev_info(hba->dev, "UFS LPM is disabled\n");
How about keeping as debug ?
> +}
> +
[...]
> --
> 2.48.1
> 
> 


