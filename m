Return-Path: <linux-arm-msm+bounces-48791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6D8A3EB35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F5803A438A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19591F428D;
	Fri, 21 Feb 2025 03:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mAQx6Drp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885F1F4299;
	Fri, 21 Feb 2025 03:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107836; cv=none; b=oQz8nERYbZ+T59Czt7HTK9Foov9RANA6aU+ipLbbIScCOGEuvIAhX5340FFXsqDtkWC97+NC+wUCWcPEYtEF0haI9/oCqe3xqZxC+fOIxjAbKiS8YnUjJIZVi0nSPHGlASkJubn+VsmdeCZpXad0uWEE1ews5Jzg2y4GBn3Grho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107836; c=relaxed/simple;
	bh=iJDJch0SjMttKNbIuMAxM/QgbpgpGiUS5wxPD2nMqZ0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=MHf+/2kl7cB4eQ8Cn16+QhYJffrleH0zvfa51f3YDNs409fefBqK8m4DrgUuQa72+egQSFnpQo5dsWGscUDw5jfMFwboC6Nka/6h74YkJsuK3Zzz41yit9Sw1FPNVb6X9YBP8PDwdFE/T76M5vGWcd0pgTNv+Cbsj3fdmV4C2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mAQx6Drp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KH74XP015230;
	Fri, 21 Feb 2025 03:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	My5FZ8xkI5XrMJWsuxlfbUTUEoR46wnWNGCkHUDfsUA=; b=mAQx6DrpA66dAeYG
	JYVe8FbP9moH6UXrEQBvh+GTUhdre1NqYetxcWnt0NQehP10n9jkGdt+EukvQKC2
	W0jg0h5FRn6vVyjBztnWu1RNkH6qV0R9lbLKepw4P+FN4/1Osi+ItCcoNCM+e6dB
	z5QJVFU+tei+DRdEQPdg+2A3+8Xy9O9B4ziyFIaupi2T6/E4Q2+bvTBwgv8ChS30
	OR6fWV4eseC45O1Qx2iQ93KOSex0NoVKmBTDvgoAUTl4ok1RPAyJbpZWLAt9yHJa
	G+10jczMFxhynnITGYpNvCmWQaM4ZNNrVxC5ml6nSK3KAEn3hXz0q4hY9NzUS6nM
	aryysg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy4g9g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 03:16:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L3GrO7018531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 03:16:53 GMT
Received: from [10.71.115.190] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 19:16:52 -0800
Message-ID: <a1dbb65a-d437-46e1-80ac-8dff3c97b81c@quicinc.com>
Date: Thu, 20 Feb 2025 19:16:44 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
 <a42wtus7y72mt5adklbwg2hjbuayxkeucs7t4xuzmxyag2mx7b@6wlsomzj4gha>
Content-Language: en-US
In-Reply-To: <a42wtus7y72mt5adklbwg2hjbuayxkeucs7t4xuzmxyag2mx7b@6wlsomzj4gha>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZVVB3qF4A6r8HrSQR6WqZF-X_Cie_t9E
X-Proofpoint-ORIG-GUID: ZVVB3qF4A6r8HrSQR6WqZF-X_Cie_t9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210021

Hi Dmitry,

On 1/14/2025 2:12 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 01:52:08PM -0800, Melody Olvera wrote:
>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>
>> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
>> binding definition for the PHY driver.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 84 ++++++++++++++++++++++
>>  1 file changed, 84 insertions(+)
>>
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> 
> This a typical comment, please actually update your internal
> documentation: don't use GCC's and other clock controller's bindings in
> examples for other blocks.
> 

I can see that other examples also reference bindings from external
drivers, otherwise I think it would throw an error for not being able to
find the parents in properties such as, resets and clocks.  I tried to
update my dtschema to ensure that this failure was not missed.

I checked and made sure that no errors were not seen, so I started to
wonder if maybe when this series was submitted the qcom,sm8750-gcc.h wasn't
yet present on the kernel tree.  To confirm this, I removed the
aforementioned header file, and got the same error/issue.  Now that the
sm8750 gcc header has landed upstream, I believe that this error should be
resolved.

Thanks
Wesley Cheng

>> +
>> +    usb_1_hsphy: phy@88e3000 {
>> +        compatible = "qcom,sm8750-m31-eusb2-phy";
>> +        reg = <0x88e3000 0x29c>;
>> +
>> +        clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
>> +        clock-names = "ref";
>> +
>> +        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>> +
>> +        #phy-cells = <0>;
>> +
>> +        vdd-supply = <&vreg_l2d_0p88>;
>> +        vdda12-supply = <&vreg_l3g_1p2>;
>> +
>> +    };
>>
>> -- 
>> 2.46.1
>>
> 

