Return-Path: <linux-arm-msm+bounces-47241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242CA2D7E6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 18:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D3727A1E66
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 17:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CBA1F3B9D;
	Sat,  8 Feb 2025 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hK/SfdIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DB91F30D0;
	Sat,  8 Feb 2025 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739037469; cv=none; b=FrZwp+CUwB7XZsPr5FcrxiniBPSZrGLoyDWp2OM8dssml+xMUS2eEVcTD4wKkBwIh5kb3M61SC2XnKWfip9tZxdF+DyKHbdNXMKcKNW0W69bCwESUvwii0qfLifULGDaJ+qjh0HARzl8brh0aH06Nazx4etFdiXHh3WrRDqjH04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739037469; c=relaxed/simple;
	bh=ElqcLqmLknVps6zvvVp3V7cJeS2Mj3MvkQT4oWJKbwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cn6nwtaer+DsrVNdhNXWbA1mPkTEoHOEw1IY8wNqvoU2sDoCsyZOds8LCd1393XE81y7OU76iA3VhzUFy4znNQzJNwZTUkjxoR73986OJ8jWZVL3Qkz7Vc0I5iBf1ReGq6cot0rZYkRitsj71lBT20FOuVAtFqyVmP6vl/aueZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hK/SfdIK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5186CvrO013680;
	Sat, 8 Feb 2025 17:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NpWrkCiwW3pvwybb8EHr3au7Ie54oZ1lUb2xxHuPEb0=; b=hK/SfdIK3eQ+Jmea
	L7suKLvJSg/5SZcnllLqc4v4GtbcKem2SVmMUf64yPNL5k2lIh8xzBQCe1Dl2HvT
	e4SZQ5W+kuNYMj3XQHLpZfbnRzmv4oPnpv86ZvoSpmsl9uRQ55vn9yydSWQfKaUM
	Q3PugeFpDU/tC16jopnwDDrt8dmRgvBhfJ4CtStqtKPi13gMqM2G5zpLXR+O5P0K
	Yy8uEu2yXSwov6dBFYjXFKqxx0K8ZEwPOtupN8jlgOROdAbNLcSHXLY/ZCvq/ZPM
	EyfLHM8sffSuzN/02fWO6toADPgklBLgdnC4XxMAoSY/qyNIrmxRJKBNrqyqnpsd
	ykIc0A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0g8ryv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 17:57:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 518HvU4D011878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 8 Feb 2025 17:57:30 GMT
Received: from [10.216.46.73] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 8 Feb 2025
 09:57:22 -0800
Message-ID: <e21cd976-11dd-4a52-9134-fd06c11c0de7@quicinc.com>
Date: Sat, 8 Feb 2025 23:27:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add UFS support for SM8750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay
 Abraham I" <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche
	<bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross
	<agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, Manish Pandey <quic_mapa@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <c6352263-8329-4409-b769-a22f98978ac8@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <c6352263-8329-4409-b769-a22f98978ac8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: emLGHLQnAEIdVywC6tNbc8LHtI-kOvLI
X-Proofpoint-ORIG-GUID: emLGHLQnAEIdVywC6tNbc8LHtI-kOvLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502080152



On 2/8/2025 4:17 AM, Konrad Dybcio wrote:
> On 13.01.2025 10:46 PM, Melody Olvera wrote:
>> Add UFS support for SM8750 SoCs.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>> Nitin Rawat (5):
>>        dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the SM8750 QMP UFS PHY
>>        phy: qcom-qmp-ufs: Add PHY Configuration support for SM8750
>>        dt-bindings: ufs: qcom: Document the SM8750 UFS Controller
>>        arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC
>>        arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 QRD and MTP boards
> 
> You still need the same workaround 8550/8650 have in the UFS driver
> (UFSHCD_QUIRK_BROKEN_LSDBS_CAP) for it to work reliably, or at least
> that was the case for me on a 8750 QRD.

Hi Konrad,

The LSDBS workaround is only applicable for SM8650 and SM8550.
SM8750 and onwards doesn't need this WA anymore as it is fixed in HW.

Thanks,
Nitin
> 
> Please check whether we can make that quirk apply based on ctrl
> version or so, so that we don't have to keep growing the compatible
> list in the driver.
> 
> Konrad


