Return-Path: <linux-arm-msm+bounces-44531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08202A070C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 060397A1A37
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBF1215186;
	Thu,  9 Jan 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MsBuGz8f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5678E21517F;
	Thu,  9 Jan 2025 09:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413466; cv=none; b=WYOhkBkdiuMEy6wZojfs+aXOu92hszysf+7cwq5MpmLVG/TajTYNHlcGwWOtH6JzLARVjYVFHMaVt6VkGZB5jWk5SSP+5qoEWXqnoWEVSJjsOu5GBgQgcL5bdiEymxO89kpmYjmFete4cs5auUlqwpGSm3i+qIDSpPt7fjLUBlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413466; c=relaxed/simple;
	bh=3ZlZq+e28dP9bYiozf7Hf0GyRzEUqMuMv00wr3YFt/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z6IoUFjJz9ZYedHqaVOu/7G2D4Bi2ITpoxDjwdHwGKiAAq/w4fFCV3RxcAkxw0uFuDV+w7PFfrN+TRxQ0VqBsVW++ZgIQS+er3svIwvcnjsDSkOmfRne3THvVZDJwCf4Z8/C5jTKyMjIrBgiHU6x1fE9/y94FeRh6Nww9Bw51y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MsBuGz8f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094Btml018275;
	Thu, 9 Jan 2025 09:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HcAiSqfaGfNzmOVruZuRF3/EsWOl4sIqGTNDb09Dbnc=; b=MsBuGz8fjNoZ/nIM
	4Xn8sgWOwba7u5B36LjVzkF9DmbwNVqvfsWfgmFj0hnRcf53aOD4fqOv2ZY/8seX
	OvQducuVSZwVNfFaoxEjqgOMgd1NyzWezMUPaOZTJPACI5Y39MNOXD5Jx8lNNemJ
	1Vh2aqozDDt107k5GKZ9gC5CzsqdkzdI1olXuFhyvdmQfntgXcatbxzN7yLPp3p0
	YcUN98FQ2p6d28qY1gt7tT8u9z3PUXETdL6Kla2p11YcsS5vQniJuGpOmnNwnDdE
	26VA+q7aqXGvaUMabHkCnY2av+z1sSmVG8j0Rfk9OmQhju38s7c/3zoQ1atfpWEF
	qoKh4w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44277e0mht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 09:04:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50994M3L008657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 09:04:22 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 01:04:17 -0800
Message-ID: <d649eac7-c9bb-48f9-a5d7-758688b85107@quicinc.com>
Date: Thu, 9 Jan 2025 14:34:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add support to scale DDR and L3 on SA8775P
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Shivnandan
 Kumar" <quic_kshivnan@quicinc.com>
References: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>
 <ww3t3tu7p36qzlhcetaxif2xzrpgslydmuqo3fqvisbuar4bjh@qc2u43dck3qi>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <ww3t3tu7p36qzlhcetaxif2xzrpgslydmuqo3fqvisbuar4bjh@qc2u43dck3qi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pGMOvzEebmCniBmQLX6s3o8MlZ5YHgdJ
X-Proofpoint-GUID: pGMOvzEebmCniBmQLX6s3o8MlZ5YHgdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=732 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090074



On 12/27/2024 10:05 AM, Bjorn Andersson wrote:
> On Tue, Nov 12, 2024 at 06:14:10PM +0530, Jagadeesh Kona wrote:
>> Add support to scale DDR and L3 frequencies
>> based on CPU frequencies on Qualcomm SA8775P
>> platform. Also add LMH interrupts in cpufreq_hw
>> node to indicate if there is any thermal throttle.
>>
>> The changes in this series are dependent on below series changes:
>> https://lore.kernel.org/all/20241112075826.28296-1-quic_rlaggysh@quicinc.com/
> 
> This dependency didn't materialize, so I can only guess that this patch
> will have to be changed accordingly. As such, I'm dropping your series
> from my queue as well.
> 
> It would be much appreciated if you send such tightly dependent 
> patches together in the same series in the future.
> 

Thanks Bjorn for your review!

Sure, will send the DDR & L3 scaling change along with the dependent patch series,
and will post the LMH interrupt patch separately as it is independent. 

Thanks,
Jagadeesh

> Regards,
> Bjorn
> 
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>> Changes in v2:
>> - Squashed 1st and 2nd patches into a single patch as per review
>>   comments.
>> - Alinged the & properly for ICC phandles in CPU DT nodes.
>> - Updated the commit text for LMH interrupts patch.
>> - Link to v1: https://lore.kernel.org/r/20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com
>>
>> ---
>> Jagadeesh Kona (2):
>>       arm64: dts: qcom: sa8775p: Add CPU OPP tables to scale DDR/L3
>>       arm64: dts: qcom: sa8775p: Add LMH interrupts for cpufreq_hw node
>>
>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 215 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 215 insertions(+)
>> ---
>> base-commit: c38b541e924a8c5494db67b0ebf04cbcd84ca767
>> change-id: 20241112-sa8775p-cpufreq-l3-ddr-scaling-e10b3d71a80b
>>
>> Best regards,
>> -- 
>> Jagadeesh Kona <quic_jkona@quicinc.com>
>>

