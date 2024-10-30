Return-Path: <linux-arm-msm+bounces-36384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D909B5E15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 09:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABA1C284A82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE5D1E130D;
	Wed, 30 Oct 2024 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LQqqRtlH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4E1990C5;
	Wed, 30 Oct 2024 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730277758; cv=none; b=fbwgrf2xy4HA3NLY67IacMHTNFfJpFfFXzeXPH3JbLt27JLXxkSneLbFqWD76bOrK51EzQkEN8OVrWzT1zwckTxbI5M8yjJcpsAIhTxjXIN4lE3NO9vvaLiJ6ru9jjYTIxThFGJc0f/IdEhPJzfQvjcQlLqN/BDgCv9HvpzKqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730277758; c=relaxed/simple;
	bh=rD045AXbDGXk5YlOnxuclO0/yqk4Mc2QaasO79S+fW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qzO42cJ4u9pOpDcNSBlIVaJl6nfyLRhcnQAri5Wi0heBB3uGWNJ6saxXtFvmvWn/2BedpoJtD5CkZMjHDCMzzBJTOec7OdHvNVbpanA4jwn6wXzBKRybeWizodPsRiJiWrpAbwWX3AZ5k8aiml5WJeaEL9/lQXk+qtxJfZ/VkHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LQqqRtlH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TKgrSQ025601;
	Wed, 30 Oct 2024 08:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSvP7/3RNM+CGuEImEY5eY8ngBdgWS6T4On0LyxkaKI=; b=LQqqRtlHGlHypp5b
	ybJK5HRvmQWDoLjBnmpPe9Myu8F8Uov9BmpVPBzJoM/ZAvpcWwTSCSZNz7jGa46U
	ehY08g2OeQkxz7IuC8N3iV90ut5f814W9vjC2MIt3pT2VGvY84imZ0GeyL+0fBBY
	yaEyVoNR8C3T9cXFliquLH6JpDgT+kOAYpnlnMqdWDK688bg2WDLLjEOWIzaMEXy
	teyODgZgyQjjZq/Ki1p4IKkxE1gy2pOwmOPLKKXklu5USEFphycJg510hyRkhH6g
	mHu+e/M80u+6F3Ec2VVN3kqdBsx3PW++SuTr0U5Cdoj4Wkbwm3aYczAud/oLLNou
	LVaOZQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grgukbjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 08:42:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U8gQ9R031549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 08:42:26 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 01:42:22 -0700
Message-ID: <645c9887-4df2-4ab2-a048-ba79a97b8d2f@quicinc.com>
Date: Wed, 30 Oct 2024 16:42:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: qcs615: add the SCM node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
 <20241025030732.29743-4-quic_qqzhou@quicinc.com>
 <flk7n534gfqyivlbl72qco4k5d3c6ravevumjfoh6464pe3qg4@r7ns6zr2i3bv>
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
In-Reply-To: <flk7n534gfqyivlbl72qco4k5d3c6ravevumjfoh6464pe3qg4@r7ns6zr2i3bv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rDhdqv0yAmW8i4-a-bXxV1gUrAbklpUy
X-Proofpoint-GUID: rDhdqv0yAmW8i4-a-bXxV1gUrAbklpUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300067



在 10/25/2024 2:02 PM, Dmitry Baryshkov 写道:
> On Fri, Oct 25, 2024 at 08:37:31AM +0530, Qingqing Zhou wrote:
>> Add the SCM node for QCS615 platform. It is an interface to
>> communicate to the secure firmware.
>>
>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index ac4c4c751da1..027c5125f36b 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -278,6 +278,13 @@
>>  		reg = <0 0x80000000 0 0>;
>>  	};
>>  
>> +	firmware {
>> +		scm {
>> +			compatible = "qcom,scm-qcs615", "qcom,scm";
>> +			qcom,dload-mode = <&tcsr 0x13000>;
> 
> No CRYPTO clock?
NO, response from Qualcomm clock team is "the current QCS615 RPMH code does not have the clock support for CE clock", so we don't configure clocks here.
> 
>> +		};
>> +	};
>> +
>>  	camnoc_virt: interconnect-0 {
>>  		compatible = "qcom,qcs615-camnoc-virt";
>>  		#interconnect-cells = <2>;
>> -- 
>> 2.17.1
>>
> 


