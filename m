Return-Path: <linux-arm-msm+bounces-33906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD6998D6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 18:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C28A1C220AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB331CEACC;
	Thu, 10 Oct 2024 16:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j3GP7Tz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F1F1CEACD;
	Thu, 10 Oct 2024 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728577711; cv=none; b=clzLrObygOvRry7vY72ukJti6DHrH7SlhgEFSIpedEopixWgEA5q32H7PJjvKMC/7lii3opGsZGSsiIQOTaDX0nXCr5bIXnekkezjpS4n5vwpBchQ6A+h4foEySS6UC+mCtrIdWXteERkZw1olaYH1MonkYkO2dhDPz/kImy+3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728577711; c=relaxed/simple;
	bh=ngun9D5Yp2e7B8X+M0L8iXWRACZ/E1FeXrBG41QWGOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZrjN8noCpQi9rpYGPh3MN4mOJw1kcVr0ubHIrlXnnFEDbx+tgDUKaa6miZowCe702lbVFn9022Djjk63GAd0ZwMWYKrOFN9V1bzbMZ6/WMDoYbAKi8cZlOpDhC/JApgv6GDMUykH2drD2mpTZZpfmMAspHGd/dc+mJXp1qjO2g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j3GP7Tz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ACUnSi032608;
	Thu, 10 Oct 2024 16:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlWe1y5O7OS1OLlCeztHxFnchJruyxVV4CDNEWEx1ec=; b=j3GP7Tz4365J8Ezz
	qsipXG5vAcdxYw9jtVlC+RybjW3QpldgpG50zf4xz8yIYJnv7TB12B8moTZJkbg0
	8MEiBct5T8KTBVPI+e3IwrXFxslnNiS4FFtsiCsbOBev8pWLNHn3tOR+f1oKIH2Z
	y7qrKi+IcAJK1bwFL7aEtb7KnqvbajNy5RK0a1EyTdLv/cZW9KYy0Hso/lRDMbx0
	ixVfEsRT5F/8IpNjd0wjvCse40+DD9KajkMRgqOG+L0PIXpthWh5HkTrtK6cujNY
	SHYT7C6xlAKbEA1GS6hcctWFmZ+arm/Zh1zNqgt2OxVHWbp5H1dGOd1YkSXqFp0O
	JQM3FQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy7knrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 16:28:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AGSNhs017381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 16:28:23 GMT
Received: from [10.216.26.125] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 09:28:19 -0700
Message-ID: <41f436be-e75b-41aa-ae75-ab6337a6e51a@quicinc.com>
Date: Thu, 10 Oct 2024 21:57:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Enable USB controllers for QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>
References: <20241009195636.2649952-1-quic_kriskura@quicinc.com>
 <20241009195636.2649952-3-quic_kriskura@quicinc.com>
 <iycqvw5ztqufcu3hgtpvrrir2anurjeckgmj6ll6twwsmotxhf@v72pwnmvq6yx>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <iycqvw5ztqufcu3hgtpvrrir2anurjeckgmj6ll6twwsmotxhf@v72pwnmvq6yx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0PR9oqf_vmNNMznDcmEPIzk8ItqFE0Dt
X-Proofpoint-GUID: 0PR9oqf_vmNNMznDcmEPIzk8ItqFE0Dt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=601 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100109



On 10/10/2024 9:34 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 10, 2024 at 01:26:36AM GMT, Krishna Kurapati wrote:
>> Enable primary USB controller on QCS8300 Ride platform and
>> set the dr mode to peripheral mode.
>>
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> index 7eed19a694c3..3e925228379c 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> @@ -265,3 +265,26 @@ &ufs_mem_phy {
>>   	vdda-pll-supply = <&vreg_l5a>;
>>   	status = "okay";
>>   };
>> +
>> +&usb_1_hsphy {
>> +	vdda-pll-supply = <&vreg_l7a>;
>> +	vdda18-supply = <&vreg_l7c>;
>> +	vdda33-supply = <&vreg_l9a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy {
>> +	vdda-phy-supply = <&vreg_l7a>;
>> +	vdda-pll-supply = <&vreg_l5a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
> 
> Is it actually USB peripheral only? Or USB-C which isn't handled yet?
> 

It is DRD capable. This platform has Type-A ports. I didn't see any way 
of role switching. So I hardcoded it to peripheral like on SA8775P and 
SA8540P ride platforms.

Regards,
Krishna,

>> +};
>> -- 
>> 2.34.1
>>
> 

