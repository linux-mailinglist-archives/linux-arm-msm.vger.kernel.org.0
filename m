Return-Path: <linux-arm-msm+bounces-27426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D76941DBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 19:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B0D3B23B80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 17:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8E11A76AE;
	Tue, 30 Jul 2024 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CnN/oQnG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378361A76A4;
	Tue, 30 Jul 2024 17:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722359899; cv=none; b=jDy/ECTz+wS74cOaUArFPrB4GZmNLPs4E0NIsJtO631uNa2h9SgSgapLcHjTjPsLy1qnhwLFAgdFs9fkuT6YWr4ridDXhkQ2+mbGwWCIqXzVS418G3EpKE+gIQ0aLYtlmq2mDkKIUxtuxdHZXDGTIGFkJBrho9nzmS0DtquuF5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722359899; c=relaxed/simple;
	bh=f4i4xE+BfkRSnAyJYbOavl4rmSYFjTr6XuQKvpYEwvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uX/4h6HK0picHyFXPvW2F2FbprdqqlMB8W4uf8eb3vpuZhW2oOik75u/NQ5w12VCM4A9tz6fg2lDgj+yHiKAPwu2eOn0cBhimNmSbtHG2o6ENDYRPFJCNGt3lLqsP8ZBMSzEBqKSswtz0yQHMNE7dohVP6i5qcos6rw2gLmy+RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CnN/oQnG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UB2WKM022716;
	Tue, 30 Jul 2024 17:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48yGHuVSgox+ECw9IMmv63UkiH/YE0SBuryhRBz3Rg0=; b=CnN/oQnGIPuNZl7w
	kyeWjX7zlpapIlfND+PssZpKOWOgOx1YMTQLo7Ho+RJRJu9SGZI1rFgFQ/5uwipc
	yTaOY1otqySfxmNYcIEP0YeBXJdKOIgRfVQogUFut4eHAsh03Qk55CYCb9+q+tf1
	rmDCM+fEJmtzFZ9WzkxGRAByiFcpXWrUMyts2APGOXnxg5hxuifuJWkD44VDPYq7
	Y/8/miOKD0YsrRdY5iEXVrt4gb9Nn8ExRXlylPL5NwQa//uDG68qsxgIFk5/axQJ
	GbHWhNKT58lwS4PkPe+vFFawHGVAiHNYldcdHppLQg+d6hTKYMq18SiORUHiNYXu
	Ko7eAg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mpkf0fvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 17:16:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UHG2bp021722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 17:16:02 GMT
Received: from [10.110.9.42] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 10:16:01 -0700
Message-ID: <d766e2e8-9f3f-af3a-bb5e-633b11bce941@quicinc.com>
Date: Tue, 30 Jul 2024 10:16:00 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/
 16K pages
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konradybcio@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin
 Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
References: <20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org>
 <osxynb352ubxgcb5tv3u7mskkon23nmm3gxkfiiiqss5zp67jf@fv5d6bob2rgp>
 <CAF6AEGuWULwrJDWW37nQhByTpc-2bBYVv3b_Ac6OCwaJ83Ed9w@mail.gmail.com>
 <CAA8EJpp9zaQSKbis7J9kYTudTt=RFhfbzeayz3b-VbGQENtqeA@mail.gmail.com>
 <3332c732-4555-46bf-af75-aa36ce2d58df@gmail.com>
 <CAA8EJppZsNTqh_KxD=BWXjmedA1ogeMa74cA=vVbCWAU7A-qgQ@mail.gmail.com>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <CAA8EJppZsNTqh_KxD=BWXjmedA1ogeMa74cA=vVbCWAU7A-qgQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eSOi-WzErNBVgqrWVIIBQ-c3D6Mlfx4Y
X-Proofpoint-GUID: eSOi-WzErNBVgqrWVIIBQ-c3D6Mlfx4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_13,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=778 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300118

On 7/30/2024 1:50 AM, Dmitry Baryshkov wrote:
>>>>>> SDM845's Adreno SMMU is unique in that it actually advertizes support
>>>>>> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
> My question is about forbidding 16k pages for sdm845 only or for other
> chips too. I'd assume that it shouldn't also work for other smmu-v2
> platforms.

Yes, my understanding was that SMMUv2 based IPs doesn't have 16k support
and it is only starting from SMMUv3. 


-- 
---Trilok Soni


