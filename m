Return-Path: <linux-arm-msm+bounces-71788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C96B41B1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3F0356549C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8212E1C7B;
	Wed,  3 Sep 2025 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EK60wmpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EB329CE1;
	Wed,  3 Sep 2025 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893973; cv=none; b=nHJ6DyMLjB7l8uu/DsfKZt0pd2egPUBoHMyzvxXW24GnGIQqTQbmwAkbmIpaVFftRglDUJQWD3MFDyhwAEcgCnBmprjDDcBjZAWTrxQgzLXjpf86KKeB6k37B6yVo6lqkoK43IZhKa8QkUgWbDxTMcBAYBw9MlkKXMm41eCBc8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893973; c=relaxed/simple;
	bh=EwLFEsEv6yhgm8roM6ERGbY+3d4evTqZa8IKRPdc3Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gykyz1a4W8PG8G8zjkiAiNOnIkGBEeZ6uNghfpSGkRd9tYWvh39f+0M6WEFoYOx0B5dXw7GnVc1qY23cQegxH6ECOphfiFFekoHAXxtEPN9grYQ2cKr+LKOmX9rhr+me99bpI9XimWGb+JhIBpn8/T3kRPx0H3ttzRe37k/UNFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EK60wmpc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832HQkC019818;
	Wed, 3 Sep 2025 10:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkFi+n7aMI1KT4RdaNh0sDzTdO6poYEtqn1r8C+ztrI=; b=EK60wmpcRHtcfbDs
	oyT0NFypXWLp39atw72V2BiOBfMtTqpclTkpu6uqKaiZhS6h1X4AlQVkAdll6388
	SnKuUXiASMibyfGCNeI0eiv/K/M+xlqFGznsiwYeeJHegjyX+29j1yj5EaoG2ICI
	0Vs9aqaxlqmBz2qDV4lH8PcntT1y1evKz9SHyAYwiRTSdLTGucYuO5lOk4uNL2/W
	vLD+kEC3p6sQEBRw/vBdbYg71sFak3CENPRb2tssiGcxUWjyYiH5BWiHqsJu4qW7
	vOBb4roaeLohDHFIC94ZUjDyYtnkKhuHCYvM1umqjjnN4aftyx6ZaF4IYWVn0Xni
	MgyJcA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0371g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 10:06:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 583A66Ub023849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 10:06:06 GMT
Received: from [10.216.53.8] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 03:06:00 -0700
Message-ID: <26faedb2-63ca-e2e0-aad6-49575a8c49bf@quicinc.com>
Date: Wed, 3 Sep 2025 15:35:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Monaco EVK initial board
 support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Umang Chheda
	<umang.chheda@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Rakesh Kota
	<rakesh.kota@oss.qualcomm.com>,
        Nirmesh Kumar Singh
	<quic_nkumarsi@quicinc.com>,
        Viken Dadhaniya
	<viken.dadhaniya@oss.qualcomm.com>,
        Mohd Ayaan Anwar
	<quic_mohdayaa@quicinc.com>,
        Arun Khannna <quic_arkhanna@quicinc.com>,
        "Monish Chunara" <quic_mchunara@quicinc.com>,
        Swati Agarwal
	<swati.agarwal@oss.qualcomm.com>
References: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
 <20250826181506.3698370-3-umang.chheda@oss.qualcomm.com>
 <ao3nb3xkeutqetqx7amlfbqtvhuyojfvzm4prsze2mhgb2rpnc@s2bsigcrlxzo>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <ao3nb3xkeutqetqx7amlfbqtvhuyojfvzm4prsze2mhgb2rpnc@s2bsigcrlxzo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ENJGJNe3HScFvRWRKsHHwgixtFHhjpmX
X-Proofpoint-ORIG-GUID: ENJGJNe3HScFvRWRKsHHwgixtFHhjpmX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXyx2B8ONB2Fbz
 P2+dLydudzqBsFk4o52GUr54gfuxswgi+/aLlrbpRRBXzqDR+Vhk3JnsC9Uk51Mh2RT1FhXQ8Od
 RXk0HMSA3fmWYqtFLV73gehtfFm7HCtozueoB3kGTe7iX4m5sNc4B0EQmd1iEblU6zDwNkGgbYp
 93mT29PWUef0vQqACHJloKQgYdKgIxzyjYdQ71re6CGytfFOGQbgE/o7H5g/Cqi0b9LgHii3ain
 84tGiQOl4NubGtIu4wUYTWKhnGDfE/OaDqIxeTVka0fHpaU3V68uFHZtuYJMduTVdYVRa0Z+kbG
 JMHKlbt5LxlbmL6uRgHUNYXuE6qDmZNNI2j2rDw7UwNy7nuYR5Sp/HRMlU8v6xCcRCnZ3kEujHa
 zLmG+LRl
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b8130f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Kz4NcLxJwtD7h-qgfgQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027


On 8/27/2025 7:12 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 26, 2025 at 11:45:06PM +0530, Umang Chheda wrote:
>> Add initial device tree support for Monaco EVK board, based on
>> Qualcomm's QCS8300 SoC.
>>
>> Monaco EVK is single board supporting these peripherals:
>>   - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
>>     and eMMC.
>>   - Audio/Video, Camera & Display ports.
>>   - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD.
>>   - PCIe ports.
>>   - USB & UART ports.
>>
>> On top of Monaco EVK board additional mezzanine boards can be
>> stacked in future.
>>
>> Add support for the following components :
>>   - GPI (Generic Peripheral Interface) and QUPv3-0/1
>>     controllers to facilitate DMA and peripheral communication.
>>   - TCA9534 I/O expander via I2C to provide 8 additional GPIO
>>     lines for extended I/O functionality.
>>   - USB1 controller in device mode to support USB peripheral
>>     operations.
> 
> Is it actually peripheral-only?
> 
>>   - Remoteproc subsystems for supported DSPs such as Audio DSP,
>>     Compute DSP and Generic DSP, along with their corresponding
>>     firmware.
>>   - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
>>     and other consumers.
>>   - QCA8081 2.5G Ethernet PHY on port-0 and expose the
>>     Ethernet MAC address via nvmem for network configuration.
>>     It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
>>   - Support for the Iris video decoder, including the required
>>     firmware, to enable video decoding capabilities.
> 
> I don't see firmware being declared here.

It would pick the default firmware from driver monaco platform data.
> 
>>
>> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
>> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
>> Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
>> Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
>> Co-developed-by: Arun Khannna <quic_arkhanna@quicinc.com>
>> Signed-off-by: Arun Khannna <quic_arkhanna@quicinc.com>
>> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
>> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
>> Co-developed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Co-developed-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
>> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 463 ++++++++++++++++++++++++
>>  2 files changed, 464 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk.dts
>>
> 

