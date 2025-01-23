Return-Path: <linux-arm-msm+bounces-45901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78239A19F2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1DDB168425
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148D420B813;
	Thu, 23 Jan 2025 07:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cdT+ohas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729F020C016;
	Thu, 23 Jan 2025 07:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617970; cv=none; b=RaL2uLm1EkrZ0t7BFCY9l1BNBHsNesYJPsvf4DxK2cbzgfRha6mLB+bmTH2k6pg/RhGadETr9UoRBcGLwLRbqQ97bEE0dvdj4m/LkAnPjO68yYbHC7xBNuB9tvCMr6mzN3SfxCmYWVMgK5jkiJRJE/1wtWknzeyQC/RzVarusK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617970; c=relaxed/simple;
	bh=OlSuubC/ie4sOnePth67hffd92roA+7ctpVLzSpf7Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p/NDYOIiSqV2Kz0bFh56cbyyZvRu2b1lAp81hpcbnyd5cgP6Qfqf+8ye8Qdw67C1lGg5YVJSH14CmO4YNw8LYk+WPHRgJ7iKoCN7v1iOjjVgP2RoDQlQyd8fwQLi5gAgc7MRal19FomkJKwRzl/oz8tvGTNs/rQKF/6MLGBOXJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cdT+ohas; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N0cIE0031461;
	Thu, 23 Jan 2025 07:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	op6VepifsyS8BiiYpY37rIs2Tdx9EntEAx31dou72KY=; b=cdT+ohaskzzh98qE
	uZVY8l55PiBCwhKW19maDbUGCbWtvXVMqNBohH8GcRVXsoLf+ILHNIc7SJZJNOZj
	U+2xubki9UlWJCt2KbZxcych9KfVItYrcHvWwZHvtpkzChI9nXCPbJCHUdBt58PQ
	SZEhizPsaV31aPSeMjIEavBlGMEAMJ+wz6GHh0pNu9apw4y4pOumhXVU5jtNeNzu
	MR8nUU2jovAPscrHzr1n8+OjXrHXH/sNPAl2SKo6R7ZifxW/vgcyMd1fnFHC8OYy
	WMINRuN28sMdenVcsf7UciDxEiel4wDzA6gsb6MiXG/8L0psKR3T3SycAPSG3Hth
	hXWrdg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bbd2gs5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:39:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N7d3mK010097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:39:03 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 23:38:58 -0800
Message-ID: <d2ba254c-1a4c-4206-9d0d-bf7576c63766@quicinc.com>
Date: Thu, 23 Jan 2025 15:38:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] scsi: ufs: core: Add a vops to map clock frequency
 to gear speed
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Peter Wang
	<peter.wang@mediatek.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-4-quic_ziqichen@quicinc.com>
 <2f36f1c1-8fee-487d-94e0-0939368d3136@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <2f36f1c1-8fee-487d-94e0-0939368d3136@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jrQPBd0_0mpmOKZsyiIG0u-AS-wjggD-
X-Proofpoint-ORIG-GUID: jrQPBd0_0mpmOKZsyiIG0u-AS-wjggD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230057

Hi Bart,

Thanks for you review~

On 1/23/2025 2:22 AM, Bart Van Assche wrote:
> On 1/22/25 2:02 AM, Ziqi Chen wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> Add a vops to map UFS host controller clock frequencies to the maximum
> 
> Above and in the subject, please change "vops" into "vop" (variant
> operation).
> 

OK , will update it in next version.

>>   struct ufs_hba_variant_ops {
>>       const char *name;
>> @@ -387,6 +388,8 @@ struct ufs_hba_variant_ops {
>>                          unsigned long *ocqs);
>>       int    (*config_esi)(struct ufs_hba *hba);
>>       void    (*config_scsi_dev)(struct scsi_device *sdev);
>> +    int (*freq_to_gear_speed)(struct ufs_hba *hba, unsigned long freq,
>> +                    u32 *gear);
>>   };
> 
> Please keep the indentation consistent.

Sure, thanks~

> 
> Thanks,
> 
> Bart.
> 

