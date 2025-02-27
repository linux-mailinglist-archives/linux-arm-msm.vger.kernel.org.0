Return-Path: <linux-arm-msm+bounces-49607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA8A47439
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF1393B1779
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3F31E833C;
	Thu, 27 Feb 2025 04:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NlPO6rBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802041E5207;
	Thu, 27 Feb 2025 04:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740629579; cv=none; b=ezPN6aytkKAD9HNizceUqYK5b2N1ztBc+kLxqZWYDiNcUIjt059NMdrOZLsKqEZC5eVI8L3dqY02GGiGa3Z0P+BmTaBFJWyuL7YfumjqY2sf70sx8qf4Qb08yqHsga58fxIWzzaAr7Cg7nPqw4nQplLCbg6a+wlzdf+wj53xenw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740629579; c=relaxed/simple;
	bh=7hNfSdaBpAjAXL4fbQbkNnXkPgT70sZdShzH/VMIpGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Eo6BLaT7IJHMtIPeuiuD+vyWWF6m3VSt1wdULsa4Y2rsxvgNuk+8/p65KARHBlLb+45aNSyEonuk587RjCOlUj2vyzmGvrGaPKq0KMM+CoOt2dzeaSRN+W6//Xhbu7+MRRvv1CHY/6B/TIC1NaRa4zQPbXHQ0Sr6uetb4y3rXFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NlPO6rBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QKA2VA015807;
	Thu, 27 Feb 2025 04:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgoBpOnoOrfm1X3xouyNtXTVotFFxXtRzJZgZUINa78=; b=NlPO6rBTcG7IAcEX
	7dtDvvAmI9C/82B3NXFZ0zq+40hnSKBGFyGXunJhNvjaNiMtyWpCIn7ThULJ7lRV
	pj0Py/rIzHH6NRjWXUWgsSykL3sVjsaHMZypMCsjpWt6ykBImaUk9hrbUPLtf+Vz
	CxoykuRoMJ6eyhEZHp8vLpBXsNauceqJlT1/wKV8pVy8KZiYGV95geCiAFNhUFIl
	Xg+tIStdB01sv2ohoa/CWhlhSvGzrGhKNUiojL3HxV2AD6kn3UFTZ8YHS/mHgoJf
	BWnpZxR9KiWc2/tvMWQRVfAf0ZtQPRd2zrRXVsEJxoKVsVB7hy5BpYPFl1ka7kmZ
	ndgsEg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnm7u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:12:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R4Cjcm016903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:12:45 GMT
Received: from [10.217.216.53] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 20:12:42 -0800
Message-ID: <72cc2c52-1d0d-4a60-93da-14acd5947f1f@quicinc.com>
Date: Thu, 27 Feb 2025 09:42:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks
 list
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
 <j43f4wu6wgoho2tl4crckemnngyvek5mma6ghkdyqcivk65dcf@gfsimovfuqy5>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <j43f4wu6wgoho2tl4crckemnngyvek5mma6ghkdyqcivk65dcf@gfsimovfuqy5>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mxXmZeDxVKZnQT026c7BtIvJr_SkthBU
X-Proofpoint-ORIG-GUID: mxXmZeDxVKZnQT026c7BtIvJr_SkthBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270030



On 2/26/2025 10:12 AM, Bjorn Andersson wrote:
> On Thu, Feb 06, 2025 at 03:43:21PM +0530, Taniya Das wrote:
>> Certain clocks are not accessible on QCM6490-IDP board,
>> thus mark them as protected.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>> Mark few clocks as protected on IDP of QCM6490.
>>
>> This patchset is separated out from the series[1] to remove dependency from
>> the LPASS reset.
>> [1]: https://lore.kernel.org/all/20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com/
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 21 +++++++++++++++++++++
> 
> I merged the patch adding this board in November 2023, are you saying
> that for the last 15 months no one has actually booted it!?
> 

I am not sure, I had got request to help boot the board which was not
due to these clocks.

>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> index 9209efcc49b57a853c4dd55ac52cd4dc98d7fe86..346b9a377e611cd3e32cf00d44e87b363bada07a 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> @@ -759,3 +759,24 @@ &wifi {
>>  
>>  	status = "okay";
>>  };
>> +
>> +&gcc {
> 
> As you know, we sort nodes by address (if they have one), then
> alphabetically. So this does not belong here.
> 
> Regards,
> Bjorn
> 
>> +	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
>> +			   <GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
>> +			   <GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
>> +			   <GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
>> +			   <GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>> +			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>> +			   <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
>> +			   <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
>> +			   <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
>> +			   <GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
>> +			   <GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
>> +			   <GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
>> +			   <GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
>> +			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
>> +			   <GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
>> +			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
>> +			   <GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
>> +			   <GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
>> +};
>>
>> ---
>> base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
>> change-id: 20250206-protected_clock_qcm6490-4019e6a61d0b
>>
>> Best regards,
>> -- 
>> Taniya Das <quic_tdas@quicinc.com>
>>


