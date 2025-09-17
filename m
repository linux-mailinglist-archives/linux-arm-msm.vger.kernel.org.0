Return-Path: <linux-arm-msm+bounces-73952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 469AFB7FF99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D66F354541A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210832EA494;
	Wed, 17 Sep 2025 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OF/geLdg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FA24678C;
	Wed, 17 Sep 2025 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118621; cv=none; b=XqG6n+qx3PHFahjXnIrrlLbItY1cGqpG5dVu8B/g7/oRRJVCswsxUEWFEqLpdLePpWFFlRp8e1uLhoqgc7ZRpLv3IOk2tnicT2rMgDk8hMqm55nSV7UWm8LD4p8IwWLAl84vNGbD/fOroNCsq3lbMxWMn9WCOQ5jr7Y41L4zCOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118621; c=relaxed/simple;
	bh=pxWR+XPHwD8u/H+d81MIQ85y4IZyi6VrdGE5+beQLjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mwq0XuXvdvCcwfOqQKfw6RFYpoFuwVhKEY/Stw/92QRo6JlpbjDmKnDY3ZGNI1qxabVgVPk8m7LcLSX81WaWJakTVtagVk8e68T/3PJZaGJcanBEH6ZQ0Z+wlQV1ltqLQRm9OEURo0Bx3qBU4LE7mpGqukrLYSDJMS0igt1oh2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OF/geLdg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HBLC0T027215;
	Wed, 17 Sep 2025 14:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoj+wlQ+uNG8xDFI8Wrni2NVdSZoIYaSH4Z2x4VJjLo=; b=OF/geLdgnz34Hcig
	5Gm/sHkZ/0CwOS3vnYvbkItunet24AY5KMo72PI6hT2slWNEjkfYzHJeqVo6WH0M
	2wiwBU7BehJPuIG98w9/1/P7QbllPUj95TqYB0mgUoBWFR0eB7dTovEnloPsxNEI
	LF1Uawzfix38sPG1klZntD/D0ftye90JwiUlcCe+qnp+maie0e5db5SByrI8cIV4
	DQ7V5CNre3GwpVTpltLvY+2bvf3Mo7kiBCxiW+6L5wukbPSwS/vjxa2eEuVxULGu
	9mGK3hLktMdoBEQjdAMFklGPqd1aH4z1VWnuWjXUlqfTpMTmFKhDqI+XSBvJ2er1
	ICoEwg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1j8hhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:14:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HEEiY1011851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:14:44 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 17 Sep
 2025 07:14:40 -0700
Message-ID: <3b2d0e8b-8d19-474d-91f8-d9195e1284fa@quicinc.com>
Date: Wed, 17 Sep 2025 19:44:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/4] ufs: pltfrm: Allow limiting HS gear and rate via
 DT
To: Alim Akhtar <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        "'Nitin
 Rawat'" <quic_nitirawa@quicinc.com>
References: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
 <CGME20250902164940epcas5p47c93faf63a98377e97f3f6d06fe23f96@epcas5p4.samsung.com>
 <20250902164900.21685-4-quic_rdwivedi@quicinc.com>
 <3a9001dc1c8b$2d303c40$8790b4c0$@samsung.com>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <3a9001dc1c8b$2d303c40$8790b4c0$@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Jk8kpkBeWsuSf4L5jRtZcnWVEEAGFYdC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX9Fmfx4o5xpAF
 M8C+6W6RO7mC/xD0Y2ug78XBZCFH8FjJS2EbinfIHW5u1dnGjvhFqcfmRVirUOJlLUTDpG2IeGd
 PJQRnh3hWxuzY1b3hjqcPSlkqUUPS5LrEvC3QXCHaUD8PNeRaZp7ls7UdQ1VxvhelfCQvzZDL1u
 pxG50KfiL3YMyQ/WX1URgGpawgdraFxq09E6KIq5wwfrZA1foWzNPZaNp4cJyLShep600VB8a07
 QdfdJr8Fb81aSFDJ22OUfwEaM+PM8114G4rghPPlV82GndCykMdxUAfcOSOcN34KH8TOoX30v5Z
 ZuJ9PApaSKZbbu5Pyuo+l5a1wkR6zOEON9Ik+CeLmjr5gqflOLkbUjsJbRSd+zr0h3tMeY9MZWb
 snAeII7e
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cac255 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=hD80L64hAAAA:8 a=JF9118EUAAAA:8 a=N54-gffFAAAA:8 a=VwQbUJbxAAAA:8
 a=bLk-5xynAAAA:8 a=yPCof4ZbAAAA:8 a=tQ2u9OearRdf7qOKD1cA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=xVlTc564ipvMDusKsbsT:22 a=zSyb8xVVt2t83sZkrLMb:22
X-Proofpoint-GUID: Jk8kpkBeWsuSf4L5jRtZcnWVEEAGFYdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110



On 03-Sep-25 9:58 AM, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Sent: Tuesday, September 2, 2025 10:19 PM
>> To: alim.akhtar@samsung.com; avri.altman@wdc.com;
>> bvanassche@acm.org; robh@kernel.org; krzk+dt@kernel.org;
>> conor+dt@kernel.org; mani@kernel.org;
>> James.Bottomley@HansenPartnership.com; martin.petersen@oracle.com
>> Cc: linux-scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org; Nitin Rawat
>> <quic_nitirawa@quicinc.com>
>> Subject: [PATCH V5 3/4] ufs: pltfrm: Allow limiting HS gear and rate via
> DT
>>
>> Add support for parsing 'limit-hs-gear' and 'limit-rate' device tree
> properties
>> to restrict high-speed gear and rate during initialization.
>>
>> This is useful in cases where the customer board may have signal
> integrity,
>> clock configuration or layout issues that prevent reliable operation at
> higher
>> gears. Such limitations are especially critical in those platforms, where
>> stability is prioritized over peak performance.
>>
>> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  drivers/ufs/host/ufshcd-pltfrm.c | 36
>> ++++++++++++++++++++++++++++++++  drivers/ufs/host/ufshcd-pltfrm.h
>> |  1 +
>>  2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-
>> pltfrm.c
>> index ffe5d1d2b215..4df6885f0dc0 100644
>> --- a/drivers/ufs/host/ufshcd-pltfrm.c
>> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
>> @@ -430,6 +430,42 @@ int ufshcd_negotiate_pwr_params(const struct
>> ufs_host_params *host_params,  }
>> EXPORT_SYMBOL_GPL(ufshcd_negotiate_pwr_params);
>>
>> +/**
>> + * ufshcd_parse_limits - Parse DT-based gear and rate limits for UFS
>> + * @hba: Pointer to UFS host bus adapter instance
>> + * @host_params: Pointer to UFS host parameters structure to be updated
>> + *
>> + * This function reads optional device tree properties to apply
>> + * platform-specific constraints.
>> + *
>> + * "limit-hs-gear": Specifies the max HS gear.
>> + * "limit-rate": Specifies the max High-Speed rate.
>> + */
>> +void ufshcd_parse_limits(struct ufs_hba *hba, struct ufs_host_params
> 
> May be s/ufshcd_parse_limits/ ufshcd_parse_gear_limits()
> 
> "Limits" is very generic and also not aligning with the property names.
> Also suggest to change limit-rate to limit-gear-rate.

Hi Alim,

I have addressed this in next patchset.

> 
>> +*host_params) {
>> +	struct device_node *np = hba->dev->of_node;
>> +	u32 hs_gear;
>> +	const char *hs_rate;
>> +
>> +	if (!np)
>> +		return;
> Probably a overkill here, please check if this will ever hit? 

I have addressed this in next patchset.

> 
>> +
>> +	if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {
>> +		host_params->hs_tx_gear = hs_gear;
>> +		host_params->hs_rx_gear = hs_gear;
>> +	}
>> +
>> +	if (!of_property_read_string(np, "limit-rate", &hs_rate)) {
>> +		if (!strcmp(hs_rate, "rate-a"))
>> +			host_params->hs_rate = PA_HS_MODE_A;
>> +		else if (!strcmp(hs_rate, "rate-b"))
>> +			host_params->hs_rate = PA_HS_MODE_B;
>> +		else
>> +			dev_warn(hba->dev, "Invalid limit-rate: %s\n",
>> hs_rate);
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(ufshcd_parse_limits);
>> +
>>  void ufshcd_init_host_params(struct ufs_host_params *host_params)  {
>>  	*host_params = (struct ufs_host_params){ diff --git
>> a/drivers/ufs/host/ufshcd-pltfrm.h b/drivers/ufs/host/ufshcd-pltfrm.h
>> index 3017f8e8f93c..1617f2541273 100644
>> --- a/drivers/ufs/host/ufshcd-pltfrm.h
>> +++ b/drivers/ufs/host/ufshcd-pltfrm.h
>> @@ -29,6 +29,7 @@ int ufshcd_negotiate_pwr_params(const struct
>> ufs_host_params *host_params,
>>  				const struct ufs_pa_layer_attr *dev_max,
>>  				struct ufs_pa_layer_attr *agreed_pwr);  void
>> ufshcd_init_host_params(struct ufs_host_params *host_params);
>> +void ufshcd_parse_limits(struct ufs_hba *hba, struct ufs_host_params
>> +*host_params);
>>  int ufshcd_pltfrm_init(struct platform_device *pdev,
>>  		       const struct ufs_hba_variant_ops *vops);  void
>> ufshcd_pltfrm_remove(struct platform_device *pdev);
>> --
>> 2.50.1
> 
> 


