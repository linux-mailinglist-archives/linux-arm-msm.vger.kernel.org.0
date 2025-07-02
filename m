Return-Path: <linux-arm-msm+bounces-63334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C77DAF0E82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50770179319
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 08:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A4723C518;
	Wed,  2 Jul 2025 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WsRJ9VkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4F21EDA12;
	Wed,  2 Jul 2025 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446549; cv=none; b=HZCfMsdeGc+jdYIu/INbqKe9Lf4EDAghwipKBPGQG6unI5AUqBzRGcJx3+N42p8AojkiPjuhZx13C1OWM2ga/+MJXIVBbCjh96GihfSxhLxL8SaHi6iKomSOeChCNGon428bbSLbaAJS6XElE2IaZNOY4ZYh6Fq164XbuV7BjhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446549; c=relaxed/simple;
	bh=KXcZ5MjsVv5FeDklT4gL8kshsupdk4JCRhhPSMegWL8=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=h4wHFePbX/yHXavU1yq/EuQ0obVSv6R8yzTqrRGOKZLM0lShN3LHloytBnVaVrRMsCgmVb33HVwRJ6C/iU9KpHEQ/3mgG9cFZd5K97s3BD3Z7we2m9YixChLWpJcdudfvUZ62qnqTQDfqJiNZ+qdMWPzeQ9Y8RB395HRn02Z9QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WsRJ9VkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625ZQwv000438;
	Wed, 2 Jul 2025 08:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SyHeFQpq79+duYg+ExgYRUkwNCKuH7zD/DRcxP0QkiQ=; b=WsRJ9VkZGLGOq4SN
	aQlHcAQc8vHKICA1sP0HMxOlzC3wu0qagzS3tQxUvjz2AB942hcEZM94PYzbHcU6
	sVBjrQxsIbJyQ/cY/0ymk/6Et9N9tIKag/6AS1yMSLsN1djOIr2WbUSBAVxTurOj
	EqIcfvXYBRuwg8mrOQ52LEr2Pbpg/IiDA5sw5QExC8kH6yVCQOIeoBbsasZ6rWXK
	XwmbyK/kDLt1X3SGMSFYo/qjCCAzSvaJnKJuaSJn0g3mETc3ZUq1SDtwv5Zrur/N
	iRfGCpuMPosldYjPV+pbSMXdpYg6YhfHFdTWUYvBSOYf5DqLIpmHvKh1eohZmMoe
	H2QJxw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmbu81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:55:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5628thfG015431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 08:55:43 GMT
Received: from [10.217.217.75] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 2 Jul
 2025 01:55:40 -0700
Subject: Re: [PATCH V2 1/2] arm64: dts: qcom: Add eMMC support for qcs8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250619070224.23428-1-quic_sayalil@quicinc.com>
 <20250619070224.23428-2-quic_sayalil@quicinc.com>
 <d3309e0d-d751-44c4-845c-e05eec4ac75d@oss.qualcomm.com>
From: Sayali Lokhande <quic_sayalil@quicinc.com>
Message-ID: <70bb267f-ba06-2b96-dcf6-875a046f1d87@quicinc.com>
Date: Wed, 2 Jul 2025 14:25:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <d3309e0d-d751-44c4-845c-e05eec4ac75d@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6864f410 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=Uk8Cs81tDJDf_XBjPLYA:9 a=i_Q9kORXkQvSbDlD:21 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qwoh2jbI9q_2ISO1dCk7MgResB_wv59z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MiBTYWx0ZWRfX1JcNOmlH/kpq
 gMIbfWXTS2FJ9W+vs7iPkzGzcaZ3OCTHnT+erj0sNiomI3ZoGWspK/zhGA3bgS4c2+JJ/wvD4Il
 ZMdmbL1bu79nsJCQJam9PeL4tqKqsY7PcP2u6H4NSaXe/bTm2mucEfFgY6xPz90q1HC4PHuHMwY
 YkHT0odW8RGHhOx2tufr+O1R6jO77ySIi7IxI9prfQW2/DZ9N0mQVQAMpZEKUQWCtQwvnphZHpL
 3RRXypneqBRCUZTkF5oKvYuaKaSK26UkyzZNksi+qrt2LPlFP6WWkTNw+mgKdaMqA6hw7ne1t5q
 ybEaQIMJHhfUpKSn9mJtULF3lbNrrDNh6yGX4IId3pgt0kHAwlqTYgz9AxUSETbAa90juNotIqT
 vqMQJA6vwLAmUD8ANq7oiLXy5b+krzr/BVZmaDJzGEcwJwZ3BKw7+e0PRXDLmb9357JE8dyn
X-Proofpoint-GUID: qwoh2jbI9q_2ISO1dCk7MgResB_wv59z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020072


On 6/23/2025 7:39 PM, Konrad Dybcio wrote:
> On 6/19/25 9:02 AM, Sayali Lokhande wrote:
>> Add eMMC support for qcs8300 board.
>>
>> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
>> ---
> It's customary to split board and SoC changes into separate commits
>
> [...]
>
>> +		sdhc_1: mmc@87C4000 {
> Please use lowercase hex across DT, in all places
>
>> +			compatible = "qcom,qcs8300-sdhci", "qcom,sdhci-msm-v5";
>> +			reg = <0x0 0x87C4000 0x0 0x1000>,
> To make it easier to compare by eye, we tend to pad the address
> values to 8 hex digits with leading zeroes, please do so as well


Sure will do


>> +			      <0x0 0x87C5000 0x0 0x1000>;
>> +			reg-names = "hc",
>> +				    "cqhci";
>> +
>> +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hc_irq",
>> +					  "pwr_irq";
>> +
>> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
>> +				 <&gcc GCC_SDCC1_APPS_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "xo";
>> +
>> +			resets = <&gcc GCC_SDCC1_BCR>;
>> +
>> +			power-domains = <&rpmhpd RPMHPD_CX>;
>> +			operating-points-v2 = <&sdhc1_opp_table>;
>> +			iommus = <&apps_smmu 0x0 0x0>;
> In case anyone's wondering, this is actually the correct value
>
>> +			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "sdhc-ddr",
>> +					     "cpu-sdhc";
> [...]
>
>> +			sdc1_state_on: sdc1-on-state {
>> +				clk-pins {
>> +					pins = "sdc1_clk";
>> +					bias-disable;
>> +					drive-strength = <16>;
> Please move bias properties under drive-strength for consistency


Will do


>
>> +				};
>> +
>> +				cmd-pins {
>> +					pins = "sdc1_cmd";
>> +					bias-pull-up;
>> +					drive-strength = <10>;
>> +				};
>> +
>> +				data-pins {
>> +					pins = "sdc1_data";
>> +					bias-pull-up;
>> +					drive-strength = <10>;
>> +				};
>> +
>> +				rclk-pins {
>> +					pins = "sdc1_rclk";
>> +					bias-pull-down;
>> +				};
>> +			};
>> +
>> +			sdc1_state_off: sdc1-off-state {
>> +				clk-pins {
>> +					pins = "sdc1_clk";
>> +					bias-bus-hold;
> Is bus-hold what we want here? Other platforms do a pull-up/down
> or disable bias altogether


Yes we want bias-bus-hold, same as other qc platforms for example like 
sc7280.dtsi


>
> Konrad

