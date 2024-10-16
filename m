Return-Path: <linux-arm-msm+bounces-34584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 313249A0860
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 13:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7FFC1F234CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 11:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963FD1D63E1;
	Wed, 16 Oct 2024 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bVe4/HHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E6118C33F;
	Wed, 16 Oct 2024 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729078258; cv=none; b=gAgFNRmTtDlajAVqldgJPXmLSV7gky+QqDW6BLsWoxxxVh/5bu18lgD07LTAAarpvxpuVRl/2hTXV64tR4SY45pmSMLeXI7Bfpu/5JBJL4K8a4cWT6eHueRJmyupJgbS6yptvjuTaZuat3ActMapLX5m8L+HAsGXw0ykFk6M09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729078258; c=relaxed/simple;
	bh=gj3PUT8+LJdHaIpnA8VwKdoAGoUZFkwFpjcgiW41sR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YyikYe8y+SxcZnLaQqn9LrnyobAweRbCXu8Th3jknLikOjz53woHceQutkxVjDrhKi4Rs5PWGkAln/Cuh7rpAWwPAumMBRdpMEjo9GjhjgzoNEurp4oPXeLjL3kO7i0ux1VveqFLFf8gng4fmow71VWtFLNewGmd90AkUkDlTFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bVe4/HHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GAIHat011617;
	Wed, 16 Oct 2024 11:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/Pdk1RM10rovtP45lZjk1phb37PYeRbY9dnf33ceyY=; b=bVe4/HHWUTCwK1j9
	w2C7VVgN/yEcm4svFU/7oQk7YthF8L1CSrFHkgs/9wEFd52A1mGzIkxQ19wPjixx
	egrkj9h8LpQ4evMZe/YO85J4dvbxaV7G/E0mJY8ytWceeBvYQEzKb3kZXk9Bbxfi
	fvGTFICeQhHsUsUMfxZRyl8lQ+aBGUZCxdwhyu+mTru/pRdKgp+ZFPyWScDipBLw
	a/yPm0Auq8jb8KjG14sB/62OpNK9Yte4xZW6gdAWH+NMluhule4FhzhEezCoBJzx
	iDn+kiL6MydcOu1YlDliE2lJk8+E4yH8JwbvQ+fISqrJeE6KkD9/4yXJUXNaVl3v
	GsERXQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5g69b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 11:30:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GBUpDk006906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 11:30:51 GMT
Received: from [10.217.216.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 04:30:47 -0700
Message-ID: <e7443137-925a-4fa9-916a-7481585ad4c6@quicinc.com>
Date: Wed, 16 Oct 2024 17:00:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators
 load/mode setting
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kamalw@quicinc.com>,
        <quic_jprakash@quicinc.com>
References: <20241016100511.2890983-1-quic_kotarake@quicinc.com>
 <2tunyupop2w7brm6adkdsrytvxbr4g3ixpbmuuqljedeaehze5@se3qsbf6tb6t>
Content-Language: en-US
From: Rakesh Kota <quic_kotarake@quicinc.com>
In-Reply-To: <2tunyupop2w7brm6adkdsrytvxbr4g3ixpbmuuqljedeaehze5@se3qsbf6tb6t>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GC4wYFh9Acohmr55fFUHf-hDeymCyVXu
X-Proofpoint-GUID: GC4wYFh9Acohmr55fFUHf-hDeymCyVXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=609 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160071



On 10/16/2024 3:54 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 16, 2024 at 03:35:11PM +0530, Rakesh Kota wrote:
>> The UFS driver expects to be able to set load (and by extension, mode)
>> on its supply regulators. Add the necessary properties to make that
>> possible.
>>
>> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
>> ---
>> Changes V3:
>>   - Somehow after fixing the compilation in last patch, i have missed to
>>     do git  --amend the change. apology for that, in this change i have
>>     fixed that compilation issue.
> 
> What actually was changed? The --amend doesn't describe changes. Nor
> does "fixed that compilation issue".
> 
Added missing semicolon (;) after regulator-allow-set-load prop for ldo9 
regulator.
>>   - Link V2 : https://lore.kernel.org/all/20241015132049.2037500-1-quic_kotarake@quicinc.com/
> 
> Where are changes between v1 and v2?
> 
i will add changes history in V4 patch.
> Where is the tag that was given to you for the v2?
> 
sorry, i missed adding the Reviewed-by tag and i will add it in V4 patch.
>> ---
>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> index 5f3d4807ac43..bfb1cdc238cc 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> @@ -258,6 +258,8 @@ vreg_l6b_1p2: ldo6 {
>>   			regulator-name = "vreg_l6b_1p2";
>>   			regulator-min-microvolt = <1140000>;
>>   			regulator-max-microvolt = <1260000>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>> @@ -265,6 +267,8 @@ vreg_l7b_2p952: ldo7 {
>>   			regulator-name = "vreg_l7b_2p952";
>>   			regulator-min-microvolt = <2400000>;
>>   			regulator-max-microvolt = <3544000>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>> @@ -279,6 +283,8 @@ vreg_l9b_1p2: ldo9 {
>>   			regulator-name = "vreg_l9b_1p2";
>>   			regulator-min-microvolt = <1200000>;
>>   			regulator-max-microvolt = <1304000>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>> @@ -467,6 +473,8 @@ vreg_l10c_0p88: ldo10 {
>>   			regulator-name = "vreg_l10c_0p88";
>>   			regulator-min-microvolt = <720000>;
>>   			regulator-max-microvolt = <1050000>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>> -- 
>> 2.34.1
>>
> 

