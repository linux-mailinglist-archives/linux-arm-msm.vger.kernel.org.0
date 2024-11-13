Return-Path: <linux-arm-msm+bounces-37733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 813949C692C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 07:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FA891F2307C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 06:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF7C17624D;
	Wed, 13 Nov 2024 06:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JmPaLwcc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AF3BA34;
	Wed, 13 Nov 2024 06:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731478684; cv=none; b=BsmV2zkFJg4H4rfpSWXUSApqjuro4ps0rZJdl3q2ohFnvV9FRl6fxMAsDLGpHg9Q/doOYwm+tAAzw/IxyCTdNdRcjgJJHXHqPKfFTntMzNDEyklkwJwmsRVw9Yd7+sKtnYHGLQ0TGaKo1diXoiSX3TPbd24/lREKi8gPpXxt9NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731478684; c=relaxed/simple;
	bh=oH4gZoo7mwCGWFAe7cFM89qhuBHOgLcspDSUNrRRlCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IvVC/DvA14C3hxKjE7OuM1y7Bo6QW6D/ZojtLzUw0/e/i6EB01VWiwaDUAXbvY5yyfMl6VDlQtFSD64HlQm59KMZKJDbFsR5Vc9LZ53kd+cCq0lOiekBCaHSsP0w0D8l5JQhKGRr71bH7pAY+avH3f+D5nXfo40F7jCiIIndWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JmPaLwcc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRc3R014688;
	Wed, 13 Nov 2024 06:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNiLsFKGcSj1VQJjShYJZtoGL6TDCOkSDxYym/BorRE=; b=JmPaLwccJytwV5rW
	iJmaOHn5gRaa7iXvJXn65vinH0IB3N+1luSRGGmUP4Ea7kQ7PCRNyeM5L6XwPgEH
	wK72BMgeI35l7kT7E5Sn5Vb69wIN0bIP1RLToJYpfoue3ILVI0VzwjLyP7ir8vlt
	42vtIupS104xEbq3/MgSE89upWrlG1RNAnbc39GmAoThRm3chlOuR8B+ESf/ChLq
	QOY2jM1ewAimkIKSnESMK6WKJOPPBh6hBUyxFeEaIw4CSbuLkPSRNWFNFZHh0WW1
	t11iNeI4bp5sld8A5EUB8yc0ZF+L0Nb6QlBjFzvB4qDId1BVxve+I7tO3J/W8dvp
	ibwiGA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v47y31mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 06:17:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD6HtVi012838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 06:17:55 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 22:17:50 -0800
Message-ID: <c1f0e56b-b489-4370-99e3-0973641410b8@quicinc.com>
Date: Wed, 13 Nov 2024 11:47:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Make ADSP a secure fastrpc
 domain
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <srinivas.kandagatla@linaro.org>, <quic_bkumar@quicinc.com>,
        <quic_chennak@quicinc.com>
References: <20241113050042.181028-1-quic_ekangupt@quicinc.com>
 <5oqzxppquoeppt6xnjfm2rdwm23hbui5k3caz5v5ffqzizepob@dz5ikvzgbd4x>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <5oqzxppquoeppt6xnjfm2rdwm23hbui5k3caz5v5ffqzizepob@dz5ikvzgbd4x>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6zg-f6qcQYFj_xIQisU3DSOZH0jIAFou
X-Proofpoint-GUID: 6zg-f6qcQYFj_xIQisU3DSOZH0jIAFou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=738 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130055



On 11/13/2024 11:13 AM, Dmitry Baryshkov wrote:
> On Wed, Nov 13, 2024 at 10:30:42AM +0530, Ekansh Gupta wrote:
>> FastRPC framework treats ADSP as a secure domain on sc7280 SoC
>> which means that only secure fastrpc device node should be
>> created for ADSP remoteproc. Remove the non-secure-domain
>> property from ADSP fastrpc node.
> If this prevents the non-secure devices from being created, isn't that a
> regression from the userspace point of view?
The actual intention of having secure and non-secure domains is to utilize signed(high privilege)
and unsigned(low privilege) DSP processes properly.

Non-secure device node is intended to be used by untrusted/generic applications which needs to
offload tasks to DSP as unsignedPD. Only unsigned PD is expected to be allowed if the process is
using non-secure node.

Secure device is intended to be used by trusted processes like daemons or any application
which needs to offload as signed PD to DSP.

The ideal expectation from userspace is to first try to open secure device node and fall back to
non-secure node if the secure node is not accessible or absent.

I understand your concerns, can you please suggest how this can be improved/corrected?

--ekansh
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 3d8410683402..c633926c0f33 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -3852,7 +3852,6 @@ fastrpc {
>>  					compatible = "qcom,fastrpc";
>>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>  					label = "adsp";
>> -					qcom,non-secure-domain;
>>  					#address-cells = <1>;
>>  					#size-cells = <0>;
>>  
>> -- 
>> 2.34.1
>>


