Return-Path: <linux-arm-msm+bounces-41665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D558A9EE047
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCE991886ACE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C4313BADF;
	Thu, 12 Dec 2024 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oJHx7D44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40AF25949C;
	Thu, 12 Dec 2024 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733988760; cv=none; b=fcRh87e6SESjNOnwLWLyBeue/u+DncMw5GZjBe/WEDPJ/nYGH1bwl5wAB57CiQUI8eFmZgqcnPvYtEdIRbdz6V2pCLAgT+qCeOM36HmQ/aNmpDYcuexZS7oJF+yrs/XHmxYrIyLVGbBEPJ2A7NWaHXneyEMIUUVv/mcCi6qFqaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733988760; c=relaxed/simple;
	bh=oDmEwOA7NnlTYU3w/OUVCU8Azx5QSIL2S65+a4MxZeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dUAWTbo6VjEOT3apZ2s6GzOAncwc6x/ETrrU0hC6c/b2JCoKJSoGsnZAwHt/AHC88q1dJXieBQ/47XqW5+kzyBCiWnIH1zhGCv0CvCQrzey8I9Dkqdt8PUEUfCX7rlrxrpuu4+0nWIj4yNon1SNkuHrvBVAWxt9McwELY00Blxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oJHx7D44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD0WY028100;
	Thu, 12 Dec 2024 07:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3UoYyua5pcw40DVZlwapk0NVIYn4sDifJJJMf9sbKc=; b=oJHx7D44zrwOZrM9
	J8lbtIL3LbjnfBuRJQvEMw02542Ui6+vmdFiL5i+3CrvHNM6hktHNjdw/3r3Z6le
	V3oDf8EkfF+esQRlPwmdrAlLY1L9LtHyxF/d4Rw/Ii6HnmGf/wuuOtzXlgaeDiut
	OmPrpOBJUHHbSFEIyV4lHeGoyF2jRHjmjdLbDPjXbKanlXoXvtfxy7MPwPEhxsMN
	z9mU/jWDinQgigWBcVmFko3EDY2Dg0RU6HMeZImN69nY1cXSBUJFim4s+CJqh/PO
	h39feqra+2/aKFGyXywmNKXl8SJI7Lwp9tOm5jpF1B/v2tzUoAgf2YRQYCP6FUwa
	18G0TQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xt484-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 07:32:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC7WVVe019439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 07:32:31 GMT
Received: from [10.253.8.225] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 23:32:26 -0800
Message-ID: <89bc05c4-dc84-4e1b-892e-87a959c72556@quicinc.com>
Date: Thu, 12 Dec 2024 15:32:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs615: add pcie phy max current
 property
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <abel.vesa@linaro.org>, <neil.armstrong@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_qianyu@quicinc.com>
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
 <20241204105249.3544114-4-quic_ziyuzhan@quicinc.com>
 <20241211062645.3eut7ibjqymm6ayt@thinkpad>
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
In-Reply-To: <20241211062645.3eut7ibjqymm6ayt@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EN54WgX6_ZLXk-e3PsC4QFIX0HtBGR_b
X-Proofpoint-GUID: EN54WgX6_ZLXk-e3PsC4QFIX0HtBGR_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120050


在 12/11/2024 2:26 PM, Manivannan Sadhasivam 写道:
> On Wed, Dec 04, 2024 at 06:52:49PM +0800, Ziyue Zhang wrote:
>> Add vdda-pll-max-microamp for vdda-pll-supply. The value of this property
>> is from the power grid guide. It is the maximum current the regulator can
>> provide. The property will be parsed by PCIe PHY driver to set the current
>> load.
>>
>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 18f131ae9e07..6d93ef0d886b 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -215,6 +215,7 @@ &pcie {
>>   &pcie_phy {
>>   	vdda-phy-supply = <&vreg_l5a>;
>>   	vdda-pll-supply = <&vreg_l12a>;
>> +	vdda-pll-max-microamp = <165000>;
>>   
> Min uV of this regulator is 1800000:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/tree/arch/arm64/boot/dts/qcom/qcs615-ride.dts?h=for-next#n151
>
> How can you set 165000?
>
> - Mani

Hi Mani
the 165000 cames from the power grid guide, and it is 165000uA not uV
BRs
Ziyue

>

