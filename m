Return-Path: <linux-arm-msm+bounces-78870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D48F5C0D22A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4AA724EF331
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 11:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D722F6904;
	Mon, 27 Oct 2025 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDfdDeu2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FD92F690D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761564087; cv=none; b=BNJxO61gqSUyT/JDJ0mh1mQRsYKTY6f70IanKwn/ivK7swEdIJzvyycTCbnqmQ9LwRdbDIjKH0ianWLLyGmr8DLloDLTpqmm2gKttBtHdYYgBVTW/1nrOgncdt+PlfqX6cWlnk66S6B1Sk9KrsP2myrwGynxZLJMy8I7q3q+4Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761564087; c=relaxed/simple;
	bh=JlLCjaPPh0XvqCGOxp2vOnr+N9mFDWWjCBAvtWR26GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txyWxKLyImyg8pwlqYY53Q6q3do1TNcKGtCLGPnVasIgk/N0nuim4k8NSxf842/lhvqiX43e0covHyHjJQ3UaBibi2J1OAorV3vE8YLM7OXs5kqSNwHV+7l7CxV82moCVGXaF0G/OyTgJ6W7h94EqurUj+C8RMGnl/MsoSL6Ms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDfdDeu2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7K6aj2059552
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVvtHevChTjRcEf/R4PrdHh8FUUsCzlToSPrj6WpnT8=; b=eDfdDeu2SlH/Td6j
	3RFRWL4JT8SrnXNk/GbhcEq1Yk5Sg+Bo1Pbsx6x1Gi4pPQeRa19PK6iL3n3wXB8I
	Dtljid1N6RT8HKxmEaDI13+s7JYIFK1bN2Brxg3cZlkARePC/V2FP5+jGOCM4m1K
	a2BbCNAWSnSfrgWKEk/8jQGOBXHPNZU6uQA3APDryPH9rpHDQfyVc0g87qX5KJQ4
	K5jM51pjmkYchMH1oI+SAOYGBysly2Fhep1p6UORN2Fl8jLl9eViTgEMnQBBfb6a
	+8zOUE03PkUw1UcRlVjypKViDMvHezvshLGjskutgzXgiO/y1iX50ccbZoEnuwjF
	0Gv3Jw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a248p8ndf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:21:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27356178876so29230525ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 04:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761564083; x=1762168883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVvtHevChTjRcEf/R4PrdHh8FUUsCzlToSPrj6WpnT8=;
        b=XQtKUjZAk8pRQTjqbFFVcKgrrudkg91ygzUkf1U5tVdnyYSZcYCRlJBaVsHAsPqM9f
         TEslv6H+rnSNuZDjfyikHqTWcY0eD9cMcTWEwCj/J7LVuwZRWC7t9cl7aPMyWypDBQ/q
         tXgJimzREuCeQmt3LHWfLLNevRU7/3SO6I50nN25e51RKqtwglGyB2TEu7KaVRWnpecg
         8ntI7LUIMGjT7iTg3OKDAn0leLcwhZJ8y7v4aubU4X3a9rZ/cBUtdcHtNjRU0uQkLjMx
         XH9HQQIfdUouqa0awyPUDzRlzuQm4L19c4s/WQhRG1sZaozTjh+MI6d8PSrWXMPTtIRI
         JU1Q==
X-Gm-Message-State: AOJu0YwBz+Iw4QK7qYKU00+Mq4hQeYZF3G7n04WupMZIAAmVxqt9rxQd
	wjNXM6QUqOMdGOPdLOCvD6u88ksHzf7pba4c8ieGXuOzS6yYam6R2kSvBLwBQC/vVBVCGZtVGtj
	Twq3L/uv7rPKTBBtdeSPwSIPxaGJbvHW4C7RVTM51i9VVMY0D5ZKJm+d5FlKWKYVe+q1i
X-Gm-Gg: ASbGncvyp8UXbBfoBn1hVlc0wQ+5LiRDpL7jcntxYG5igckLUV/hCmsgzixtx3urstJ
	zKBSKoTz5K5t0QYml7zQ0GNPmHtgtdGNI8syLe4g9ZACfUArthzVeRauEi2HYa0LEetXE0xGQcj
	/r+gCcDm1x8s53tVoDZCqxrNGYgPEp/GSZo3PG9Wt36rsmdBlD6rRX5i7WS9CZ+5Z1CWHM1i6kY
	pepOX+RaIr9KNqSaBUT623K4Krx11LY9hM+W+RBaDxnCBb5574Q8k52CcbTKrmcLe2v5jbe08it
	cy6hjzf+/nsmpZVSRFSh6f4zmR+LxnnFvpQ6h0IRUB9qeR0z0/9YOmJWo3BMDSz0jTQs/GrH1Ye
	9rCzC306AZcqJZfzTfXHw2gSK3h5QNO6xG88=
X-Received: by 2002:a17:902:f691:b0:290:bd15:24ae with SMTP id d9443c01a7336-290c9cf34e6mr372400635ad.4.1761564082874;
        Mon, 27 Oct 2025 04:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExw90y1BtsPiKONU4IswMqcJENAejckfFy4OkOxXu7umr4qg5fdTyIbLw0rlv38LlnFk+GbA==
X-Received: by 2002:a17:902:f691:b0:290:bd15:24ae with SMTP id d9443c01a7336-290c9cf34e6mr372400445ad.4.1761564082387;
        Mon, 27 Oct 2025 04:21:22 -0700 (PDT)
Received: from [192.168.1.3] ([122.169.146.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2317csm78838865ad.48.2025.10.27.04.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:21:22 -0700 (PDT)
Message-ID: <aeec371a-ec8c-4a19-ab5f-1ea10f55d6bc@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 16:51:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: lemans-evk: Add OTG support for
 primary USB controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251024182138.2744861-1-krishna.kurapati@oss.qualcomm.com>
 <e83730a4-f270-47e6-9bea-336c142eed11@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <e83730a4-f270-47e6-9bea-336c142eed11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zvzg6t7G c=1 sm=1 tr=0 ts=68ff55b3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=os7cmxGP5G+7zi0Bb7vKnA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9kjh7eMwnbizjImSWngA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEwNSBTYWx0ZWRfX6rit0Ie2tYWs
 49XJJKC/EQSoumfxBY9KFDf2/tW9OGApQCs5GFq5jjKwNY6yEBe2XPweHaI4ENEALQ/UEuDBjP5
 b9rZN40ihLHxCXBF+cSgvCF5po+2SLPqdyLKFrwXlBeGE9Fn6rk9bsXPKFqdHM7p8XkaoLoGP49
 MeNUOPSp7CETcFqQ/lIfKRpqUwkCe3mk7qvI6tdn50eQ/N86/fqdskLdvoUrB5D1NTLfab09NWi
 /p710dveyisxsTMeGBrXXtfXCuwnjQgTdGycu1uPUW2FymIMxGC51GlgZaCLJPr3viF9eSkkxU2
 052y39U281hanoXvefz02EppdKTYTYBeiHvjFutMazK19jZ/qviakdouVv04Sh95jhMSISllXQv
 P7ItZYthCZc454GpZi+TiHPaGkvXaw==
X-Proofpoint-ORIG-GUID: g1fBmcwV38k4jAVRA5zdZkHoo9hBOsvH
X-Proofpoint-GUID: g1fBmcwV38k4jAVRA5zdZkHoo9hBOsvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270105



On 10/27/2025 2:06 PM, Konrad Dybcio wrote:
> On 10/24/25 8:21 PM, Krishna Kurapati wrote:
>> Enable OTG support for primary USB controller on EVK Platform. Add
>> HD3SS3220 Type-C port controller present between Type-C port and SoC
>> that provides role switch notifications to controller.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - Moved "usb-role-switch" to lemans dtsi file
>> - Moved vbus supply to connector node
>>
>> Link to v3 bindings and driver support:
>> https://lore.kernel.org/all/20251024181832.2744502-1-krishna.kurapati@oss.qualcomm.com/
>>
>> Link to v2:
>> https://lore.kernel.org/all/20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com/
>>
>>   arch/arm64/boot/dts/qcom/lemans-evk.dts | 122 +++++++++++++++++++++++-
>>   arch/arm64/boot/dts/qcom/lemans.dtsi    |   1 +
>>   2 files changed, 121 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> index c7dc9b8f4457..2baad2612b16 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> @@ -37,6 +37,35 @@ chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   
>> +	connector0 {
> 
> "connector-0"
> 
> [...]
> 

ACK.

>> +	vbus_supply_regulator_0: vbus-supply-regulator-0 {
> 
> Other regulators (as can be seen in the diff context below) are
> named regulator-xyz-abc, please follow
> 

ACK.

>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vbus_supply_0";
>> +		gpio = <&expander1 2 GPIO_ACTIVE_HIGH>;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		enable-active-high;
>> +	};
>> +
>>   	vmmc_sdc: regulator-vmmc-sdc {
>>   		compatible = "regulator-fixed";
> 
> [...]
> 
>>   &usb_0 {
>> -	dr_mode = "peripheral";
>> -
>>   	status = "okay";
>> +
>> +	ports {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		port@0 {
>> +			reg = <0>;
>> +
>> +			usb3_hs_ep: endpoint {
> 
> Please define these ports in the SoC DTSI and plumb them through &labels
> in this one
> 

ACK.

Will update in v4.

Regards,
Krishna,

