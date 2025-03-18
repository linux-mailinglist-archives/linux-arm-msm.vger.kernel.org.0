Return-Path: <linux-arm-msm+bounces-51773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC17EA678C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF4B23B759D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66C020FABC;
	Tue, 18 Mar 2025 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjgqsM2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEC220F075
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314300; cv=none; b=tTvGk1wVGeQrBX677jvrkWH2zjm0GfkwX393W+F6+7vT8Y4A/ed0CleAPV6NoQNbwktow15ci7PpMCO+Ja4LulYNnWcFp5L9sFfEP1dLNr+obwu/4U7/8aikEAqikrmBPzullQhFf6LwbgzP6ued19Q0uY/YRU//oWb/hRQhFnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314300; c=relaxed/simple;
	bh=eyFDJE4YRl3b2EEj6y8xT7rbh/9hzJ7Y5/dRWTDk1b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvRIFN6v80sgXkeEAof4oJOVD/s6lFxBnz9OBWhAiOZT1f/bIcnxYyEyujoXeaVRzljlaej2dax5SuhrIbwjTfCuOeLlavB3qxF0hsK4ntSsj1ajNjclMVpz0NG2IdSuV3YEZxgym4jrCtqdFBax+4kq+UOJIHZQZNYcfqspOCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjgqsM2r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ICeG2e030606
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cM8AZCQm2iZ9HJ9wuCI4b2L0bxljhZ1yX+T89jHuzZQ=; b=RjgqsM2rFGN8p1tD
	DxdRLIoVkkaqG6ZgaIm2Mh7xMj8shM0hA75hwi6vy5Zh6Q9PIoCoyf/9PA6aBw3l
	eawJVpn/KwKbQpTcAwiWXxjAgLSnPJ8260Q07KKzl1JQNH+sHgE4sAIBgGwu86RD
	OJIHUwI1ZapnnJHgMXadRiXYTZSpN1nuVaY5US2eXSEMzEt/ftAN9VUN/0jvsg6i
	nRTI1Wwy00/zNY3vnz/uWB00eyJwY0B/TMB5rqn6aLcvPv8JbPQiLOeOcdsMTvLI
	5qbn+8ZCfG9zkOn3/VS8Igzr4nAisFqW1UXQ7QToFXyB+X9JezysHhcmp5B/KNFA
	hA/CPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f91t0kfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:11:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-223f3357064so86140055ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314293; x=1742919093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cM8AZCQm2iZ9HJ9wuCI4b2L0bxljhZ1yX+T89jHuzZQ=;
        b=TqE4ZvhicQVTnTrx2YDGOtULqXB9mSjkwL67k8Y7jC0EYYeef4xKyBns/VxOwcWwVy
         pwHGwVx5ych+0GNcL2ozGqComnMM6sIPZ7j4XiUc993voLRwFxb2AZWrlXytI+z16m9y
         ZeH0n6aT+0cHVsk7bxgVNU5O9XPmMp2aEnS6uQjsqYPH2OQjtJYPzVmq9af3H5i96Wpg
         V1XlYMyzN5P1SyzjQrDARAqOfegeRi+WVD9+QmKQD/dM3Jal27vCAnERhaEJVo7NmI/e
         1UOiQ1R9Et1506iIVNVPb7JY2t2QNQT3sjnS441qLo0x7Y+Nza/UGG5nlKEVOEKksHpe
         7mDw==
X-Forwarded-Encrypted: i=1; AJvYcCWO18bYhy7QdKaGyZUyz407o/Dcq2DXm1eV6ZYQEl0uncDoUe63w6e/fBXU4iZrubDbBkmf9kwwmtws/VUI@vger.kernel.org
X-Gm-Message-State: AOJu0YzTVu4RbABEJPxK4O/EPHoEwChkPFhb7RWa1jaLn6e68CBLBXbv
	dfUMVSLltOuvlp2PzBZQpg6iytwzi62J0hcQ3rVAMWgMCQ4lbbyyLnhGwMyPGLhjENrJ/0X6/9V
	6cIijXcSmrJHh5tv7rzlo82A2KVPv2MP0PGeothRVKkXYtu0mx2SHZ/49c83gTOpE
X-Gm-Gg: ASbGnct1f85A4KOjve5YSOfQC0bfHkKs7LlwGsFrA1SoP7Arg69BVfzjuYuC7uVRLdk
	t7gwpV2ooBNXOCBIE1REXeDbBMZPAMKNXVw/srDLLGHogS5GiraQHn1ZU43mhCVZExc5ATbNQ1z
	Wr6esL90c1NxZWJ95hIFL+dOkcrdY7pFFIxGkTorP+ms1JJ+x55F0I/dvVVz4aZC8OwjNHKLsz/
	mEMNRXD92UlDJ5rm/hMglN7hWYZVOGM1OKIW4PJ4y2Wyf5kJeRkycClZhDd4bRaUTjgjQ4FmtNf
	DhNhrS0YW6ZvRZ+jBA6XAe0dQ63AVcVgCPprQr9DXpwgmw==
X-Received: by 2002:a17:903:40cb:b0:224:a74:28cd with SMTP id d9443c01a7336-225e0ab5216mr226833905ad.31.1742314292639;
        Tue, 18 Mar 2025 09:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDWxl7Dn7VJ/dGBJeY8Nm/beDoadgREWVQ+bpzZHWe/2JguBoReZYgna/7NMPu2dIQzrTEQA==
X-Received: by 2002:a17:903:40cb:b0:224:a74:28cd with SMTP id d9443c01a7336-225e0ab5216mr226833365ad.31.1742314292246;
        Tue, 18 Mar 2025 09:11:32 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.228.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d0asm96645755ad.130.2025.03.18.09.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 09:11:31 -0700 (PDT)
Message-ID: <8a2bce29-95dc-53b0-0516-25a380d94532@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 21:41:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 02/10] arm64: dts: qcom: qcs6490-rb3gen2: Add TC956x
 PCIe switch node
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-2-e08633a7bdf8@oss.qualcomm.com>
 <kao2wccsiflgrvq7vj22cffbxeessfz5lc2o2hml54kfuv2mpn@2bf2qkdozzjq>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <kao2wccsiflgrvq7vj22cffbxeessfz5lc2o2hml54kfuv2mpn@2bf2qkdozzjq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CY5S6oSzpVEPNvWPG5HocpDVDtgQ0S24
X-Authority-Analysis: v=2.4 cv=Xrz6OUF9 c=1 sm=1 tr=0 ts=67d99b36 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=gzHQz5DndFXDghOZWxpFUA==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=WTmwj_6TxTBwwd-b0B4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CY5S6oSzpVEPNvWPG5HocpDVDtgQ0S24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180119



On 3/17/2025 4:57 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 25, 2025 at 03:03:59PM +0530, Krishna Chaitanya Chundru wrote:
>> Add a node for the TC956x PCIe switch, which has three downstream ports.
>> Two embedded Ethernet devices are present on one of the downstream ports.
>>
>> Power to the TC956x is supplied through two LDO regulators, controlled by
>> two GPIOs, which are added as fixed regulators. Configure the TC956x
>> through I2C.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 116 +++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
>>   2 files changed, 117 insertions(+), 1 deletion(-)
>>
>> @@ -735,6 +760,75 @@ &pcie1_phy {
>>   	status = "okay";
>>   };
>>   
>> +&pcie1_port {
>> +	pcie@0,0 {
>> +		compatible = "pci1179,0623", "pciclass,0604";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +		#address-cells = <3>;
>> +		#size-cells = <2>;
>> +
>> +		device_type = "pci";
>> +		ranges;
>> +		bus-range = <0x2 0xff>;
>> +
>> +		vddc-supply = <&vdd_ntn_0p9>;
>> +		vdd18-supply = <&vdd_ntn_1p8>;
>> +		vdd09-supply = <&vdd_ntn_0p9>;
>> +		vddio1-supply = <&vdd_ntn_1p8>;
>> +		vddio2-supply = <&vdd_ntn_1p8>;
>> +		vddio18-supply = <&vdd_ntn_1p8>;
>> +
>> +		i2c-parent = <&i2c0 0x77>;
>> +
>> +		reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
>> +
> 
> I think I've responded here, but I'm not sure where the message went:
> please add pinctrl entry for this pin.
>
Do we need to also add pinctrl property for this node and refer the
pinctrl entry for this pin?

- Krishna Chaitanya.


