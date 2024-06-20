Return-Path: <linux-arm-msm+bounces-23315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0928A90FA6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 02:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FF83282C78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 00:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C53D184F;
	Thu, 20 Jun 2024 00:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Paz43CAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F1118E;
	Thu, 20 Jun 2024 00:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718844382; cv=none; b=HURIfbmulw7kiNRXxPR3tm4feVw1a+MRFaGmm8yJfGk1d8uOgkNWUwc4+u7+BG3SrtzJKNzSCjsoJlC/Q7UkNam+XvN4qWpD/miXP5wTXHd7igVdgZWudUlz6p2U2s1LWKA1t0Cdy52JT7m+dEc7UOCw3+jhvDVB0N0Ez+4or80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718844382; c=relaxed/simple;
	bh=Oe+CueodMhyXAAT3zVm/KoN3H449VGK1MN7mCKRitow=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WcRcqZKbHQGVNXZ/5wgj1AlgUTv4DPjSJRT3u1SWoebFzTz9QkyIPY5rPrAifPTFnOKtq1nMPdI06hEE5yk1qUyRXzPPamdi/KX3GDLzCHwXk5+Km/bLj+E5VyCRno9fzjDgESpLcTGp5fhk38wdJX2Y8Hpfb5UhJMV9ef2XhhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Paz43CAW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JLlgud031194;
	Thu, 20 Jun 2024 00:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tyw48aqYA3gCdB0J0LJP7goqQaUPXUvvK0gWp2XyaVA=; b=Paz43CAWJmCIUlTt
	HC6M66LbRS98h6xMnj3f6J8rF/bBjYOgnD7LKPCEABWVEosPcyo9UFimDJO7m90C
	RAIUW92RIR4kNMNAGw6++73MX8Jomn/3LnvoRqOEx0CwVx7yIn4c3PxlDWKLK5n6
	NC6Se8W+e8ZF2y7pHBI9j/wUH7HtD5DY6XHahkmywwWLs0XFnAiEowAdybMhkh+3
	XDMfhT+fiLA87XoOn09k83/Jn5NS/hEuuu9A4+e9xar4vF7fhlx0dvIgEINB+CSa
	pzye7z2Kc0Fh1FaIuDl9Gi5Zy5BITLDWHBNNdi1qMMmFWgnWzV3g3dkidySUuWr4
	XOryZA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv7jeg8t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 00:46:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45K0kGhs018017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 00:46:16 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 17:46:11 -0700
Message-ID: <04517096-38a0-465f-86f7-7e8c7de702a2@quicinc.com>
Date: Thu, 20 Jun 2024 08:46:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] arm64: dts: qcom: add base AIM300 dtsi
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Fenglin Wu
	<quic_fenglinw@quicinc.com>
References: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
 <20240618072202.2516025-4-quic_tengfan@quicinc.com>
 <7eb1c459-90d2-4b49-a226-0ced8216cee6@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <7eb1c459-90d2-4b49-a226-0ced8216cee6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h_Xi4y-Z7yZY-idzn1LXuK9V1mPXDwmP
X-Proofpoint-ORIG-GUID: h_Xi4y-Z7yZY-idzn1LXuK9V1mPXDwmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=763
 clxscore=1015 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406200004



On 6/19/2024 3:06 AM, Konrad Dybcio wrote:
> 
> 
> On 6/18/24 09:22, Tengfei Fan wrote:
>> AIM300 Series is a highly optimized family of modules designed to
>> support AIoT applications. It integrates QCS8550 SoC, UFS and PMIC
>> chip etc.
>> Here is a diagram of AIM300 SoM:
>>            +----------------------------------------+
>>            |AIM300 SoM                              |
>>            |                                        |
>>            |                           +-----+      |
>>            |                      |--->| UFS |      |
>>            |                      |    +-----+      |
>>            |                      |                 |
>>            |                      |                 |
>>       3.7v |  +-----------------+ |    +---------+  |
>>    ---------->|       PMIC      |----->| QCS8550 |  |
>>            |  +-----------------+      +---------+  |
>>            |                      |                 |
>>            |                      |                 |
>>            |                      |    +-----+      |
>>            |                      |--->| ... |      |
>>            |                           +-----+      |
>>            |                                        |
>>            +----------------------------------------+
>>
>> Co-developed-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
> 
> [...]
> 
>> +&ufs_mem_hc {
>> +    reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
>> +    vcc-supply = <&vreg_l17b_2p5>;
>> +    vcc-max-microamp = <1300000>;
>> +    vccq-supply = <&vreg_l1g_1p2>;
>> +    vccq-max-microamp = <1200000>;
>> +    vdd-hba-supply = <&vreg_l3g_1p2>;
> 
> These regulators should generally have:
> 
> regulator-allow-set-load;
> regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>                             RPMH_REGULATOR_MODE_HPM>;
> 
> although the current setup you have never lets them exit HPM
> 
> Konrad

I understand your point is that these settings need to be added to 
allthe child regulator nodes of regulators-0, regulators-1, 
regulators-2, regulators-3, regulators-4 and regulators-5. Is that correct?



-- 
Thx and BRs,
Tengfei Fan

