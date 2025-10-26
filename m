Return-Path: <linux-arm-msm+bounces-78802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A1AC0A57D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 10:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CDAD94E56AA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 09:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B359F246797;
	Sun, 26 Oct 2025 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSmOR86j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223FB1F4CAE
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761471244; cv=none; b=rrD+8Pi1wwJcbElZ5M9yxk1QzAF6It/90crL70XFDFPim7xYor34Kr8bEDbhPpIBU92/MIOfSXk2ZuP11z1WJbgyctnSmdLtZjWnjmecJOcGhbn7fJHs+7ZyXAkZVloysZrZU0m3Zu8dUcu44744ZtcoG/yHsr7iPD2/Hq8AiZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761471244; c=relaxed/simple;
	bh=Mh6NpoOEODASCpA92pc1qeYToNd8lzNHa+S4ChO1X40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBDQD4I789VgafaQ/xoH5M2AOulI/2xSAkQPwtjumJJt3G1HjgUpAwsn8mxhzgVZXzUNlHWOCwiwOtrXj2h0XrE6apsuilM292ySaIWv5kC1swwAlC86Luuc4i3dHhLRJw0gUyvYcOIgXqTUluNIpPHYJnNGk4weVXZMrpLvUNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSmOR86j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59Q5b16u3236077
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 09:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56dn96aHf3hXKKzsHWNkw3ffdRMIjdiQ0e3RFj+hds4=; b=WSmOR86j5uftPdxW
	3UzSKr0k4OppNZN2fibBusBMXBB4Oke+ZM3IQj9RVQCH08YrViqE3tnpC1QsQfU6
	E8pPYX6oe+CADvPwTN5jZFcUvELuMqL2cJD7mAL9nDUFbMH5u6+p3/cp0/5iD3EK
	NuNxCVaSWvk26osFNXGu2vqQRk7SQQ1gTpqBqHGZUef/C8CCTPOtMjdjoXbvZZ3F
	U4UvNWIMRHf0KzpqIXUy/JEPIcbYGbWwB296VpqQmPdGrIA0qj76dj3/Aqi70IlI
	uF6+HB8pissZAAllccPZX2t9GpOkCZKFux6wzq3br7ITbWsN90hzqbp99LmAeEov
	cD8LGA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnxswcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 09:34:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290950e7b1bso6538365ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 02:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761471240; x=1762076040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56dn96aHf3hXKKzsHWNkw3ffdRMIjdiQ0e3RFj+hds4=;
        b=Z2TS3FcZGrCC3pE71Er67DoNfTTgWqlDukytJxS0bZS+Bp6uOEhBiN4hR5BCLt7A1f
         7+Q0fTEh3MCXwSrFLYw+MzXzqfczCDvZLXfHkQ/YNDMbUB3pVwf9KnVCKfh8Y6T3lYkL
         I87q33FVgkS90F5Coxa1wY/AY+TN54fbylUttCu/x9W5mjrow4HrwCeSn+4R9YlGG3EC
         KMEGsxGphLTmPTsVdzPFHIrvvW6QYAjl7xWX/Qov6rpGJ+YlTR1KVBJyk5GpSsVVXxEm
         meBUmZNIfTpf4UyHr+wFdJXi/CwbSUajXgcllZS9zlfhdpna8OFZ29bV+G4Z4DbWO+G4
         SDpg==
X-Forwarded-Encrypted: i=1; AJvYcCVHd4U5oYuba2vYCGDA32bmdRvhvtMKfILG2dI3ohuJ1K0D9QOIqOoI0nqHgwV8PwPHDGbOJAwEcWty/Z6c@vger.kernel.org
X-Gm-Message-State: AOJu0YyqdvsirTINBfA6Coc8kiJSH1vp7dFIgvSlv+CvSroUJTVBdqFE
	iO/9mrAm0eNV0brvlHHz/wJWJ+YfidDfWP0+kKRvIoh/nkzGU6GznrGUOl2WbBC2QvAVL+9vu64
	SKjlXRRKdichr1pSZ8MxVYEpauW9TyNfmqItxu4KiYo2wfn5WT3nTH5u71IyNxBVpEKWh92LQWR
	0=
X-Gm-Gg: ASbGncvGsMJvKha75NIaURF+b635ObKZ5w95BVf9ewrwyrEzZAs02Df/qf1n9DXJQcz
	CsKTQTsxz140uOuIC+d5xAMRWfTjEpsfDCgLIv5TDuRCHkq7DIAF73GIHYd/7lHsraLN5hcf9Fn
	lQSYfTecFYVLjP6ncoFD1/GX8ICBkjNLb4UHqqI6wIzP7CvF0XLH2XrENswUAZzT5fqPK50IE3c
	OvxUOvJmJp2DXPs+vvKDjjO4jXFAnmKP6GHXcAOtnvuN5deyzd4SmZOIgxGS2SOCAcju/xVEam4
	I/KG1lJq1Q3TtW32XLIOeK9zoVdmlAT0DRBUb9ZwL3d72Zc77H+L3u/rwTbToSlKbIqZfMAxYmO
	/bpK4EtVQW4ZbGmlrFWyFd1dEGQ==
X-Received: by 2002:a17:903:2a8d:b0:27e:eee6:6df2 with SMTP id d9443c01a7336-292d3fb7f47mr128134345ad.7.1761471239579;
        Sun, 26 Oct 2025 02:33:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQBERQ6dlt5UHcYOlT6Y1tPbrDH52NPHs0vo71kb86ovM01aE0uB9o33e/ODR94nDiuD9/HA==
X-Received: by 2002:a17:903:2a8d:b0:27e:eee6:6df2 with SMTP id d9443c01a7336-292d3fb7f47mr128134215ad.7.1761471239159;
        Sun, 26 Oct 2025 02:33:59 -0700 (PDT)
Received: from [192.168.0.3] ([49.205.244.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm45343295ad.11.2025.10.26.02.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 02:33:58 -0700 (PDT)
Message-ID: <6292dd07-0a74-4773-ad5f-b737b2f848dd@oss.qualcomm.com>
Date: Sun, 26 Oct 2025 15:03:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 soc
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
 <20251023112924.1073811-3-sarthak.garg@oss.qualcomm.com>
 <kbbebw2kr3hu6q3sb4z3i7yy7vv432rjx2ylp254cbifpcxe33@bhyldim36fff>
Content-Language: en-US
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <kbbebw2kr3hu6q3sb4z3i7yy7vv432rjx2ylp254cbifpcxe33@bhyldim36fff>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xc+EDY55 c=1 sm=1 tr=0 ts=68fdeb09 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=bVPtsstaAh+Xhvtfxu+pEg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sFmbwog37gvI7kGm1A4A:9 a=KKStjhyEKkBOW3-R:21
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 96iyPcjkAEJunDfJQtsnraZ5YgKtB4xL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI2MDA4OCBTYWx0ZWRfX+xSUyBU7hGlB
 RCBYK1zKfwbD0JOg2R+F0ecnn3W9KXR/7W5FX3AugB9K2ykDwAS1S58p2wKKZzzSd+xCD2Qcig9
 tuN1CRuYZ+0mQKWuYz2XKGmBctPsU0Z/glDpV88sVnyXZpaoFHAccU9rm1+dnMMheQoUxKNm+NM
 QmNXWGwHdOLPvLOiI1A9l/LVgPQEBVKAgZ/JZvOkFxFGF2fFepHTYGhswwcYcaOLZs/TvaC2bjt
 9mlE/fmKB3bgLfVAYvG/pmFrESgnsZhc3cXUJEyL75j1XvvouzBNh5qjBWbKwNnnyk6F30/jKrQ
 wNHf50C2I3rcKWWZ+PIzloBplWG72h08eAPf4mN8KXpQo1HXqNMYzL4+G5tUySQjbheKc71O13h
 1cfe9NurGvczgzWpvyO/m4V1lmPZbg==
X-Proofpoint-ORIG-GUID: 96iyPcjkAEJunDfJQtsnraZ5YgKtB4xL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510260088


On 10/23/2025 5:44 PM, Abel Vesa wrote:
> On 25-10-23 16:59:22, Sarthak Garg wrote:
>> Add SD Card host controller for sm8750 soc.
>>
>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 68 ++++++++++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index a82d9867c7cb..1070dc5ea196 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -2060,6 +2060,60 @@ ice: crypto@1d88000 {
>>   			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>>   		};
>>   
>> +		sdhc_2: mmc@8804000 {
>> +			compatible = "qcom,sm8750-sdhci", "qcom,sdhci-msm-v5";
>> +			reg = <0 0x08804000 0 0x1000>;
>> +
>> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hc_irq",
>> +					  "pwr_irq";
>> +
>> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
>> +				 <&gcc GCC_SDCC2_APPS_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "xo";
>> +
>> +			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
>> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					&config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "sdhc-ddr",
>> +					     "cpu-sdhc";
>> +
>> +			power-domains = <&rpmhpd RPMHPD_CX>;
>> +			operating-points-v2 = <&sdhc2_opp_table>;
>> +
>> +			qcom,dll-config = <0x0007442c>;
>> +			qcom,ddr-config = <0x80040868>;
>> +
>> +			iommus = <&apps_smmu 0x540 0x0>;
>> +			dma-coherent;
>> +
>> +			bus-width = <4>;
>> +			max-sd-hs-hz = <37500000>;
>> +
>> +			resets = <&gcc GCC_SDCC2_BCR>;
>> +
>> +			status = "disabled";
>> +
>> +			sdhc2_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-100000000 {
>> +					opp-hz = /bits/ 64 <100000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-202000000 {
>> +					opp-hz = /bits/ 64 <202000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>> +				};
>> +			};
>> +		};
>> +
>>   		cryptobam: dma-controller@1dc4000 {
>>   			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>>   			reg = <0x0 0x01dc4000 0x0 0x28000>;
>> @@ -3121,6 +3175,13 @@ data-pins {
>>   					drive-strength = <2>;
>>   					bias-pull-up;
>>   				};
>> +
>> +				card-detect-pins {
>> +					pins = "gpio55";
>> +					function = "gpio";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
> These are board specific, so move them to the board dts.


Sure will update in V3.


>>   			};
>>   
>>   			sdc2_default: sdc2-default-state {
>> @@ -3141,6 +3202,13 @@ data-pins {
>>   					drive-strength = <10>;
>>   					bias-pull-up;
>>   				};
>> +
>> +				card-detect-pins {
>> +					pins = "gpio55";
>> +					function = "gpio";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
> Ditto.


Sure will update in V3.

Regards,
Sarthak


>>   			};
>>   		};
>>   
>> -- 
>> 2.34.1
>>

