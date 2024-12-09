Return-Path: <linux-arm-msm+bounces-40975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CFA9E8D7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 09:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42EB11643FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 08:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB01215716;
	Mon,  9 Dec 2024 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="flBhOtwv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E58812CDAE;
	Mon,  9 Dec 2024 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733733176; cv=none; b=tv9DSpM89DcDsM88/NjmomedVi8sLwoctJyTyaR+UP5aJFv5Uth4OraTW8hOvGAAOxNGhP/zh7muZg3JK4sZGuAeBf8yvO7HlbIsXoidh9q3yCLh8Ig6agNPQdz38rhExtIh0yrDzN6JbO8QwVi2KOsbEehT0fCbMpi8aAFZhO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733733176; c=relaxed/simple;
	bh=kWbSDc4zKYb7mqhta/tab0rzINa76RA67wW2nh2fj3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K9jOm2g9fDWzMWWlY/oY/r3Oz6pHOSOA1019Bxb02ZRpxCiBN9wXkBldAQxoxl0BT6mVByRQ7HkoZu8qCdhBZmlFR1cSZO5hggbX7lq70ki6xFHwkVfpgef2oC8BLs4Y1pGRYohyL4LGNxLk+Hr/aGk8GYx9Tcas9zgmEjR1lE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=flBhOtwv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NkfZg026266;
	Mon, 9 Dec 2024 08:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5JWJQeMuxVdd3PTedl0CqTUR7/F63JFS3DnJm9lmHvc=; b=flBhOtwvTAsTbQgk
	sBmsFgsMCA6vdmyTBxA/AxZGD5oWuXKoQfL4LMy/wG9ToUyfDMSl4odKNzkgLLhd
	b9L9Gp9klloOyU3EF/zRcJ5jA7C67RZ765h09eLWrJQPx7aFReglCN85nnG24hbS
	pzzquQcp50lQxjLw/3Q3yEt21YuKjLO/gUcZl2qk1uyaKZ+N00h7bAqxj9mEx7XV
	1vBhBVwOZ580RkZiydKLtNvSykXwyMC1FzSXVCLHtnyhpgUw9Wr1ZkKIsHcgQvNz
	PnrAxwoIrVR0V0FGhuTDnAna+Q7x1Suplj+sCfxY9IOamr428ztpjKsQvd5YJgK7
	rRriRA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdaqc07g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 08:31:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B98Vhib031537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 08:31:43 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 00:31:37 -0800
Message-ID: <66654b75-cfc2-470c-90e9-76da5e2a1f47@quicinc.com>
Date: Mon, 9 Dec 2024 16:31:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs615-ride: Enable UFS node
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche
	<bvanassche@acm.org>,
        "Andy Gross" <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <quic_jiegan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tingweiz@quicinc.com>, <quic_sayalil@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241122064428.278752-1-quic_liuxin@quicinc.com>
 <20241122064428.278752-4-quic_liuxin@quicinc.com>
 <20241202144844.erqdn5ltsblyhy27@thinkpad>
From: Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <20241202144844.erqdn5ltsblyhy27@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N23WULfSTj1uOtbJc5r9tM0RNtCt1BYi
X-Proofpoint-ORIG-GUID: N23WULfSTj1uOtbJc5r9tM0RNtCt1BYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090065



在 2024/12/2 22:48, Manivannan Sadhasivam 写道:
> On Fri, Nov 22, 2024 at 02:44:28PM +0800, Xin Liu wrote:
>> From: Sayali Lokhande <quic_sayalil@quicinc.com>
>>
>> Enable UFS on the Qualcomm QCS615 Ride platform.
>>
>> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> 
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> One question below.
> 
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index ee6cab3924a6..79634646350b 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -214,6 +214,22 @@ &uart0 {
>>   	status = "okay";
>>   };
>>   
>> +&ufs_mem_hc {
> 
> No 'reset-gpios' to reset the UFS device?
I will check it, and fix it next version.
> 
> - Mani
> 


