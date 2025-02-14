Return-Path: <linux-arm-msm+bounces-48006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3130A35B44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67B21188FAA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 10:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE78F2566D9;
	Fri, 14 Feb 2025 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ig/d4Os0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBF2255E42;
	Fri, 14 Feb 2025 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527982; cv=none; b=lybahHBi63qi6kk6by0iT0eDBswflluMwE56r4M6BMl2gM6lpSBmnFYHKkS/yCeGC52/51mA8fNt/8U0fAt6UZgK6PgdYKVba2CT8ZsB7CIN1QHrEAH29IHCWKj41DScsrYBeS+7wteKK0jAYOf8LVFQolHYP0CQj34Nm1pYYOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527982; c=relaxed/simple;
	bh=pxpiYfZv31zutehboVWwkeju5rHBzsL+CtSIwS3St1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Hxq11Pwne04ijSiN+aaOptSoYXxxnlPsfGKHJRBF4Qqz0F5GMsoR8NKRGIEOZhDnbqYgg4oGApH0ec+b85e3dX5D7e/RUQnbIehIThqRbxa8SeOUJQO1fmj3gnGqgnjPGqQ+y2eiZnPqhGJyRBex/dyk7HP8JUdUxPNPygT0TCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ig/d4Os0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E6VcCr008940;
	Fri, 14 Feb 2025 10:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYinXaF99zRQg7NRz8Nwdk4kzEWdtAqGFelV12sh3sM=; b=ig/d4Os0NexEiyve
	MV8nA9NbdhPVcXbOw08CO2/UYrE1ZBIcHNSTCw3Qf/sL1vfxECXPTsL6sPqB8bdp
	DadrIlQnSXkBFiUbqCf9ergfRzbeYzGl0HL4DimvpHdZmZxppJ+IkW/49zokcCNg
	DPFcXuVf4QOlwWQ1Wm6Cxwzf+Xmagn6WXYjDgOn1Rrr5k3ms4XBAry1WAl/J63/+
	tatmufoC7oqBsmBFIZWwEpYUuswPc/QaLdpJnD1bBjVWE2pfI1uyoJo25ceLSPbl
	QgG8UPVehbkAnQTVkbbDoySPICYQjZVz8wZxDxQtwzHXS6qZaId1NUJPV0+31Yew
	2aOrcA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qxvgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 10:12:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51EACvbo004153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 10:12:57 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 02:12:53 -0800
Message-ID: <57601672-2f97-4bf4-a258-4cb12ee45abc@quicinc.com>
Date: Fri, 14 Feb 2025 15:42:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20250213071912.2930066-1-quic_mmanikan@quicinc.com>
 <20250213071912.2930066-3-quic_mmanikan@quicinc.com>
 <rikpqwgeitxengmlhahnl5nzk2skityqmgurjx65fjq4q3nejq@6pqmbvaqkcz7>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <rikpqwgeitxengmlhahnl5nzk2skityqmgurjx65fjq4q3nejq@6pqmbvaqkcz7>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8sst31wenre3MX27ba_YKa0jSgAbDyuY
X-Proofpoint-ORIG-GUID: 8sst31wenre3MX27ba_YKa0jSgAbDyuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=781 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140073



On 2/13/2025 6:47 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 13, 2025 at 12:49:12PM +0530, Manikanta Mylavarapu wrote:
>> Enable the PCIe controller and PHY nodes corresponding to RDP466.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>> Changes in V4:
>> 	- Added a new line before status in pcie2 and pcie3 nodes.
>> 	- Dropped 'output-low' property from pcie2-default-state and
>> 	  pcie3-default-state nodes.
>>
>>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>>  1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> index b6e4bb3328b3..e73f61266012 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> @@ -53,6 +53,32 @@ &dwc_1 {
>>  	dr_mode = "host";
>>  };
>>  
>> +&pcie2 {
>> +	pinctrl-0 = <&pcie2_default_state>;
>> +	pinctrl-names = "default";
>> +
>> +	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
> 
> Don't you also need wake-gpios? Here and in pcie3.
> 

Hi Dmitry,

Thank you for reviewing the patch.

The wake gpio is dropped because the PCIe on the IPQ5424
doesn't support low power mode.

Thanks & Regards,
Manikanta.

