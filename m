Return-Path: <linux-arm-msm+bounces-75476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 219FDBA8269
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFC63173F61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 06:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1513E2BE635;
	Mon, 29 Sep 2025 06:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gm3nAOaX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476B239E63
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128096; cv=none; b=Mv0AzIaADDdQLB5GExNUPaqNy+PXpAAJTg8raMuG4cuXGm+iM+9ORORex6NYKQTAsANtN393pJdlJABkx2bJdrydV0aSTATWcUe53JamSBvjoFmDr0umGxmm0VRPpEv6oKGxP5dhLTcLjR0bIJr1zxwb0TJ6yt7UG1YtS35HqmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128096; c=relaxed/simple;
	bh=Prpla/VA5xYWtT2jo46RGuKNSAxJ9MlDb3GsI1jGACk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rf+44DoyRdV9nqrtFYU/BT8GK2gvGwf7WYCFUql79P8sLNJ4sYpr/wEzo/5oCUSCtvbeIBQGfGXKwNtb9fCt5UOPc+e7P+7D2SJlZwFPNFEvDgdUK9ILEOaWjbouT0w84g+vqC82q9XWKpzr6H4lul8PuJPWtRKuEZPEGumJ8Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gm3nAOaX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T0RHrY012671
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OhaaerqbjvD3FVRgeewGN83h7Xm6Pvn+9D5rt7zkX/w=; b=gm3nAOaXe+kLbyQv
	DrjW8WT3AlIIg3oRu1fZJCUNJyDUcA6khqIQqsYtYxmF3NS5xH4BDjV4B9VfGjOg
	tCG56ed2KrYxLAjqTTUU2w6CZzwzZeqzOLlHjFs3M8mrqpeezF4Wh8/9xhUkgPo0
	LZ9Pb66lMWCLJWr8YBkJNT/v5LZUejUnkiz2cDFj65Xa5tBtB5o4P0pAup26c3MA
	0EqQX8YW6yu6tmEGBEh3lDbHMn/bGpTdjPwXQMFZj/0RiqswKRhpnGee8dsu6L6D
	ph6O0hUKOCMTmZM6DhyF7g/+zxDZO/UXX9gekkFB1yA4ZmJOXdv0NzOPidLUBNO2
	ZBBUkw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcmcur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:41:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2748e6c45b0so15648445ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 23:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128093; x=1759732893;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhaaerqbjvD3FVRgeewGN83h7Xm6Pvn+9D5rt7zkX/w=;
        b=v/INhMqe355YaKZGwNYTkRho3f5IUiNwwQEsDPIEZdf08zb5w+GmnZnr8j7G6COWst
         RhFZxoQzVpiIkoNTRN5864StCAkOEEECQfnmzAJU8PWVMgFAX9SFmVke4wUGgmgx99n2
         hLS3QsZ4qw8SALOUrYyrADN7uPfvctF9BaziU2+TVzgOzAsZljy83ahW0Rh8U2Cnwyn8
         RqRTUoi6NMxmybDL+duz+gMqVkpvOy5GuIo0v1e/PhwTZn+ODwistYHe3frUhdLAZVVh
         NkorwG8TuiiVBAc4DgTMQO3XCvdgxU1/lxfv9bXCzlu/98iVP8VaeEt0PXO2jSqNcow+
         1KKQ==
X-Gm-Message-State: AOJu0YzTteJtI0EqGMS+NakEgtAAi97GFAY+QlIRNG4URgIOLGIrgeCB
	SuHUNku/3nwrADyw1dqDoYpcMbSNlhFe3ndeNQWutmIy/52uqzDN2GXUlaRqqY/zH8Uen+3FXIp
	PETYMnJFX3u6RfhqwiKxk0liU9untI7OM73bkXt9YLf2gWrmQrDEm2OHjV7Khr6SIeWrr
X-Gm-Gg: ASbGncsrNtoIG4q4KFknPsUaMEpMCnOH7JK4Z51KUtQebkTUbskABm3rrScgF+YP3Co
	rdh3177O3QjWZSdTvAT+ZqdMhdWpuzI8De+k4e86Y7bzx5Mqz0VhCn77kw+rAMCMQdRc0cbbP8w
	WpTdufDwidabx7GX1IuS6aQPwH0m61zddIZTDJQVZ7TEoapXO9tR/GFFIc4G8X2tNnIm00Ddm78
	yt2JLklMqor9PZeMx59GJFCvNfzz1dITTFLC8y/uCm0ATlE8FawqEq0SrJ3V5n9feEzCogK/Fn+
	E+T5vpribwf847ddz2czq6Lyklv1WyV8RzlJmsaXtIT0JxktfJ2LDN8OFcd6KUrLwyb2a4GuLAM
	ZWvwYAx4wFc7c4FIlgigEoqRIN0eMMc4=
X-Received: by 2002:a17:902:e74b:b0:26c:3c15:f780 with SMTP id d9443c01a7336-27ed4a986b5mr100365225ad.8.1759128092844;
        Sun, 28 Sep 2025 23:41:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAZRUafuyxfPW7GOQPReY44bTe0BcA41/EX+hnlJtSzAbjufWF65p/s+g11Y9sNTMCcF/6Hw==
X-Received: by 2002:a17:902:e74b:b0:26c:3c15:f780 with SMTP id d9443c01a7336-27ed4a986b5mr100365005ad.8.1759128092292;
        Sun, 28 Sep 2025 23:41:32 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6adaf31sm121225275ad.145.2025.09.28.23.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:41:31 -0700 (PDT)
Message-ID: <5410dc83-0732-4b25-ba07-605e4956d840@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:41:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] arm64: dts: qcom: kaanapali: Add QUPv3
 configuration for serial engines
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-13-3fdbc4b9e1b1@oss.qualcomm.com>
 <9685e29d-bff3-4188-b878-230d0f161ce3@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9685e29d-bff3-4188-b878-230d0f161ce3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68da2a1d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_ltKwtvy-Tbn6v8TjEMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: mXjFio-42wDFZivm0I-MNaTWRUblFV3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfXwb6EngYlQw7A
 zgn2eaftq/UkdwIWfZAWJOdfLh+cUB74WoQ5iHCJUGx58b4lTLU43tnBfyYujkHsaWMBXNR6xbf
 /KF+AvKTBzxaeg0OJDFCS20G+E9smBk+blHe7BCnZSas2S8XQtwRck3cXeZ1VRtFE6UGXW7UIBn
 IuzEPKK0nOBQyfTr+coQ4EpfdKDBDL64qGq3TA8a2SPiaBkQzxg1qUR9eSWB+8tKo76Qp+5Mt6i
 SKSfFhJC9IlPDk9ryD/Uw+G6HyKNn+2tCA/XAHgJoVt5Fw//EN9YKTL15tv2YUGQVqH+0tCCIcr
 +0T+x5WJLi4CgCHOXZnmIT7OZXiD+wfHsoPjg4C3r4YFov/+L1/Hyi+JD5Cfv4gDZHQXJcwDSXY
 eQ+NcPqVmc4XgJum4mXYFanslSTwHQ==
X-Proofpoint-GUID: mXjFio-42wDFZivm0I-MNaTWRUblFV3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004

On 9/25/2025 8:28 PM, Konrad Dybcio wrote:
> On 9/25/25 2:17 AM, Jingyi Wang wrote:
>> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>
>> Add device tree support for QUPv3 serial engine protocols on Kaanapali.
>> Kaanapali has 24 QUP serial engines across 4 QUP wrappers, each with
>> support of GPI DMA engines, and it also includes 5 I2C hubs.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		gpi_dma2: dma-controller@800000 {
>> +			compatible = "qcom,kaanapali-gpi-dma", "qcom,sm6350-gpi-dma";
>> +			reg = <0x0 0x00800000 0x0 0x60000>;
>> +
>> +			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 850 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>;
> 
> odd indentation (on almost all gpi_dma instances)
> 
> [...]
> 
>> -		remoteproc_soccp: remoteproc-soccp@d00000 {
>> -			compatible = "qcom,kaanapali-soccp-pas";
>> -			reg = <0x0 0x00d00000 0x0 0x200000>;
>> +			i2c22: i2c@1a8c000 {
>> +				compatible = "qcom,geni-i2c";
>> +				reg = <0x0 0x01a8c000 0x0 0x4000>;
>>  
>> -			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
>> -					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
>> -					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
>> -					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
>> -					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
>> -					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>,
>> -					      <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>;
>> -			interrupt-names = "wdog",
>> -					  "fatal",
>> -					  "ready",
>> -					  "handover",
>> -					  "stop-ack",
>> -					  "pong",
>> -					  "wake-ack";
> 
> Please try to use git format-patch --patience


We’ve tried using git format-patch --patience, and it did help avoid the
deletion lines issue. However, when we send out patches using the B4
tool, the formatting still defaults to the standard behavior.
The challenge now is: how can we integrate the functionality of git
format-patch --patience into the B4 workflow?
Any ideas?>
> Konrad

-- 
Thx and BRs,
Aiqun(Maria) Yu

