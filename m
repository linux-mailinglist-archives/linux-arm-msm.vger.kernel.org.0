Return-Path: <linux-arm-msm+bounces-43186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6509FB97C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 06:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9960188472B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D38313E88C;
	Tue, 24 Dec 2024 05:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RtmeyNHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C004145B0C;
	Tue, 24 Dec 2024 05:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735017751; cv=none; b=KDh6LaFoVyi7nuyKLDju5PLyzW+qDvnkKkIJGdAdZH1ClHFvw3e1zGK1oWHqmRGgXKg2gHZGBnhFWktxXZyAUZin9lqtSfmTU3NL6v/74eR0hdh5cXw5IaU8vtHIcDt4ihOTR1A4lu3/RLEK7CHtD5mhwrhfCL+nJcc5ChHnXHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735017751; c=relaxed/simple;
	bh=XJTy4vpV4bQvotvdBAg7DqofTU44zBik/PEbnmfWBEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TkfY1dz1PVT22l+Uf0b8oTsO2x/F7DWZgHK2CS1CQ5caBb45oymYhr+SfRqDFZgxWhNyL/g2nwVYFG3KbkJ6tGmviAy5roJKZHHIbbY1OhqQezPl68F1iaL7jmrXZxKh/3e4fk6zzBIjFYiMREhv9kGtLcpcpwyqT72vq90TxGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RtmeyNHn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNI0bsw029776;
	Tue, 24 Dec 2024 05:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aR69xwtjfHdKTs0pN5wzidfUIIuH6Dzp2htNeRoFPqs=; b=RtmeyNHn74TxQeRE
	qH+YUb2cTvWQl5J3oEyaQpMHtvIn/4bEApRMtsqCUr8fecNqKzZcthf+Gs70X+Wy
	//QMDhahF8nRVAcQl22+JagrY3ApnWvjkhLqpD9UZwzg9qPtRkjfGGyYNEqARCks
	e9VLnDQOvX8E74kSP03UTXfYl0EENG28GQQ9ZvSoZrEmOGpxoX9yKQtYg9/xs/Wa
	Pf1uZsDBN7S6bTMsRrVSgA/jB4jzUHXN4ImuMfZc81VI+v45LDJQ8WfR/Ze8a4ja
	GWCoipY3DHSPa6eNvH8w1hCtD3JfZ7K25lXfdE11lcHlhAPsyCbMM1ZFrvvFuvfz
	zUCiNg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qcrxsg9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 05:22:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO5MA7X029574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 05:22:10 GMT
Received: from [10.50.31.100] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 21:22:06 -0800
Message-ID: <18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com>
Date: Tue, 24 Dec 2024 10:52:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <bbrezillon@kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_nainmeht@quicinc.com>, <quic_laksd@quicinc.com>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241220093029.z4zsr3owdnqll2vg@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20241220093029.z4zsr3owdnqll2vg@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tkWUcyWE1hEi6b855e7JPhe8Zie9bVGl
X-Proofpoint-ORIG-GUID: tkWUcyWE1hEi6b855e7JPhe8Zie9bVGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=942 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240041



On 12/20/2024 3:00 PM, Manivannan Sadhasivam wrote:
> On Fri, Nov 22, 2024 at 02:29:30PM +0530, Md Sadre Alam wrote:
>> v2:
>>   * Updated commit message
>>   * Added stable kernel tag
>>   * Added Fixes tag
>>   * Renamed the variable from offset_from_qpic to nandc_offset
>>   * Set buf_count to 512 in the parameter page read
>>   * Replaced the buf_count value of 512 with the len in bytes
>>
>> v1:
>>   * These patches will fix the following:
>>   * 1) onfi param page read which was broken by exec_op() patch.
>>   * 2) Fixed offset passed to BAM from QPIC base
>>
>> Md Sadre Alam (3):
>>    mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
>>    mtd: rawnand: qcom: Fix onfi param page read
>>    mtd: rawnand: qcom: Fix read len for onfi param page
>>
> 
> Do you plan to respin this series? FYI, these are regressions, so should go in
> early as possible.
Waiting for SPI NAND series patches [1] to be merged (raw nand change 
patch 2-5). On top of that will repost these patches.

Thanks,
Alam.

1. 
https://lore.kernel.org/linux-arm-msm/20241120091507.1404368-1-quic_mdalam@quicinc.com/

> 
> - Mani
> 
>>   drivers/mtd/nand/raw/qcom_nandc.c | 23 ++++++++++++++++++-----
>>   1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> -- 
>> 2.34.1
>>
> 

