Return-Path: <linux-arm-msm+bounces-43327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6687D9FC762
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 02:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04644161CCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 01:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C70C8F0;
	Thu, 26 Dec 2024 01:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FW0grUOP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F85E211C;
	Thu, 26 Dec 2024 01:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735176269; cv=none; b=GiGJBQrry0WAEpF5j/y0Xepzyv7iZt5TqgVbeIK24sEP4M8xc/RHKNbuKccAsm7uvIUn475KlPZpasmOeJNA/gixv0ONiPnsDbhONFs1wmG0Gtvbrlcrk6t2h7JAGYhMK55telL3VF3BORiHygpt9qN9MxFhBSgqs2yM/mXA10o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735176269; c=relaxed/simple;
	bh=Taf48pM0CIF6n6xWrK9clLlhXq+JE7bxQtW1EstG7ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gEFN633fypUZh3i/sJQiLlrzjXi+t3zkzmcaTfVga+FAKUaHsIrIAEj5UEcYGkoJYsScabq3YKh/IXIKmyBAgvB+k7elinFOGKvKn4CbpCcrxyUzcYjIhQrEE8VdWWpt7rr9BoFzDcCgXcsRCHpNqC1GnmkfX+iqdWgvxSzpfzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FW0grUOP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ032d5010616;
	Thu, 26 Dec 2024 01:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZCworpZc1r9xzngnHefQQcjLWVhZMJcDMelwMm0iKg=; b=FW0grUOP/+EuzZXS
	A2oo0rokklCMrUk7MZqFluIbiDZubwNe0PHroRpXyNNp6O8yRk5dmbIRpj/BSpok
	XPnRFq7i7YOcKkMBU0SejjjfpkOGyeoF2wPBCMeCD6Jvz0AXhI8DUgLFOymLEVwj
	sGe4JcOWSiW5R0TbCrE62uuiv39Djk+IdfxC0gNQYKMX2HYqsUjZJv9jqJ7SjULj
	JOHQhXfHtQgTU+NQe5Tq1jxoAQD9/etQDx9sOKTlK08FSVSJA4LOdq3qeZm2Y+P8
	l9igfWhjkTBsP6PfeF67va8flQYikiMblVPXc0NXB4/ScyvFBVDg9SrqNoMWlK/4
	dRJWwQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rv8qr7pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 01:24:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ1O3e7012056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 01:24:03 GMT
Received: from [10.253.74.39] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 17:23:57 -0800
Message-ID: <5bdfcf46-6512-43f2-bf23-cd8e9a6e93f3@quicinc.com>
Date: Thu, 26 Dec 2024 09:23:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs615-ride: Enable RX programmable
 swap on qcs615-ride
To: Andrew Lunn <andrew@lunn.ch>
CC: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-3-4b52ef48b488@quicinc.com>
 <88bd11c6-e5f6-4c12-a009-5ec07fd1b873@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <88bd11c6-e5f6-4c12-a009-5ec07fd1b873@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6vu0-ulN7rekBbajdA858XOi0N5wHngj
X-Proofpoint-ORIG-GUID: 6vu0-ulN7rekBbajdA858XOi0N5wHngj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=866 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260009



On 2024-12-26 01:38, Andrew Lunn wrote:
> On Wed, Dec 25, 2024 at 06:04:47PM +0800, Yijie Yang wrote:
>> The timing of sampling at the RX side for qcs615-ride needs adjustment.
>> It varies from board to board.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index bfb5de4a0d440efece993dbf7a0001e001d5469b..f22a4a0b247a09bd1057b66203a34b666cd119a8 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -206,6 +206,7 @@ &ethernet {
>>   	phy-handle = <&rgmii_phy>;
>>   	phy-mode = "rgmii";
>>   	max-speed = <1000>;
>> +	qcom,rx-prog-swap;
> 
> I notice this board still has messed up rgmii delays, using phy-mode =
> "rgmii", not "rgmii-id". How does com,rx-prog-swap interact with rgmii
> delays? Is the sample point logic before or after the rgmii delay
> logic in the MAC clock pipeline?

This patch set relies on an earlier version that has RGMII issues. The 
latter is still undergoing coding and verification. I will update this 
patch set once the RGMII issues are resolved and uploaded.

> 
> I think i also questioned max-speed = <1000>. Has this
> arch/arm64/boot/dts/qcom/qcs615-ride.dts been merged?

This will also be updated in the next version.

> 
> 	Andrew

-- 
Best Regards,
Yijie


