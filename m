Return-Path: <linux-arm-msm+bounces-78840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0EC0BBA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 04:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E08CC3B5585
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 03:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965272D4806;
	Mon, 27 Oct 2025 03:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FIeBylaI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35661AC88A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761535070; cv=none; b=Rn5Wh1FidAzhAQJWmkJl4lRLpJUja3QJAoltyewU0Hxhik7KlpXadRH3kQc8wcectaFiDWS+nYrByOhNQoihZG75BZSiKin1NQ39Cd/IRo8yXz8g1pPuODiooNoPnaSgbvTbBp1Iw6p0VJxOXMxHwXxOR3UodlYBa2oCV6P1D7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761535070; c=relaxed/simple;
	bh=RcNsLrNqaDct2SLCTPZbtlt/bTq7zf5bG55Uf5Vb1Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5odwDf8nPUTW4ljsCKw2X7XCww2u9okXKvN7DN/v/+VpXol7qkBJQDhvWgyS8WbxI9Wfy6qipGh/oddFkxvYHbW+ZdkOG9Ii39lvEFOGhHYqc/uDNleO86a6836G2elBdkFGhfyAsSMwSfBEGzSJ1c5QLgNt6ycwVQxkHiNr60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FIeBylaI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QMt3p91023953
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 03:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JO7Tw88if2zflMQMKJ+hg7JVLU1fFgiOs9+KVopxqFo=; b=FIeBylaItpydTNIx
	QA1UPRy+AP4sq/84YQlWUl96i3c4j+daupyZyEWWxKAyEkJU9O7sZgs3Ef4uHtc+
	Lor/0MDCS44o3oL3lZ9tyVQXmY69TRZ3X8v6q+Z3d/J/QHlIzG+yoLHo9p11OrOn
	I7zQUHdTwipfOaAk1BhtDMBjqwQFYqHpQZMl6fy8KFYSIsYFwYQSvz47DSkCG7Dd
	05/QkjsDdcj3WJatOBxH17iCElpKy0rP082NvxQ1yLZEuZ9gmpAh9OPCZHJuK6rQ
	KEgYf8bYyvyF0Wff42cusZXD0sX99/sMcaZtxf/8YxRNSR9mShGAB0fuzN2BxCjq
	CBuQpw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0px6k014-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 03:17:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27c62320f16so39336705ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 20:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761535066; x=1762139866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JO7Tw88if2zflMQMKJ+hg7JVLU1fFgiOs9+KVopxqFo=;
        b=lsuo+cAqfwCzW4FLwCom2Qpp2VcfL6AV8QRYZ4rQ5W5hiE5R8onUUvrUI93oSmMCBe
         I7/D0bk+kwwEkol+XK/SUsLt11+iYFg0p85V/YMtW3AyPQ+jpRdDxO8rgk1d0MDvaK8O
         XgtWh+W1hZotieWuAPNOKKcu0J2UNYPuVLzSYNTE47Qq/GV7iQWuJvZWKTVEKC9IXSAf
         fj0KlB7sSrknq0vwNpL7q85xD1wCcKkLfc3nSvtrmM4UxiA+rBJtFLgTfMKrBFiqapGa
         X+UI7yFYNZhyLgrgH7S3+z1qua/s/kYqBEyQ9mYlFj39vSbKdmVIM46T1F2dPVSCHyQN
         IQdw==
X-Gm-Message-State: AOJu0YyBHgdpLS90K3nNpflqM1kX6A6j1nVqTa/fbb8xN2kHrSXN1oOg
	jmZ+a1SQObw7qGjXZ7+V+2xhOKn+iCztf4NWpEzEbI+p/vZmoKii+WM0dZqhUNX7OA4B62HqnK7
	3tQq6RQRLhnlFHjtS/MgxkR2bK1a9M9qB7d6DIeufb7bWuF6GO0dKBW3HRDA7k/Jw0mEF4y34P1
	ZR
X-Gm-Gg: ASbGncuLUiUTYgcbtE+fUjSCLWSRHIsOU4eJYF7IaGsh53YZvFj3u0GeRP35h763YHy
	ybY7UybduSQLYoCZ18yYAFSKZ7CsbPInbJRnyiIvaFUcxtEi6ohBia4tg0fL+fa90hqzGx8vxQi
	Srj+ayZKgi5Co1TL1FhI5WshYqXmHw3ziUogJdjhe+GAf8yS8/mxKAT9HKT6SQpKUASXkl7gAQO
	zQw/yuxmP7sfcFR2iKVh72o716Np+wPxnQmd/4qvaz0ZSFu1CqU8R3jm7E2WdNGs4Px4gu84IU8
	GRMv4yLU6Uj/cRT5NnVkZbND5ZWX96/1QPiz3jircVQpFqkL75UbDMgvHGL/y79Dtdj5AAYUrZf
	Nwu/2qh/cYNAToId8fio2fdMQdvJRuD6udnROLciTkCXxY+wSQA==
X-Received: by 2002:a17:903:4b07:b0:288:5d07:8a8f with SMTP id d9443c01a7336-290c9cd4b60mr387050645ad.24.1761535066293;
        Sun, 26 Oct 2025 20:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWC4qQG9kVvhlPmWIkq/0n4oOKkhrgreGs8rf9+HeLIiS71LPMdzaS/kJ8l61Kckt2fliuyw==
X-Received: by 2002:a17:903:4b07:b0:288:5d07:8a8f with SMTP id d9443c01a7336-290c9cd4b60mr387050335ad.24.1761535065743;
        Sun, 26 Oct 2025 20:17:45 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d274aasm63274935ad.56.2025.10.26.20.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 20:17:45 -0700 (PDT)
Message-ID: <e19e3ff4-bee0-4c40-bb6d-76d25e324024@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 11:17:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: sm6150: Add gpr node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20251024023720.3928547-1-le.qi@oss.qualcomm.com>
 <20251024023720.3928547-2-le.qi@oss.qualcomm.com>
 <cc7399ed-db57-42cf-a944-6213a8df8491@oss.qualcomm.com>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <cc7399ed-db57-42cf-a944-6213a8df8491@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAyOCBTYWx0ZWRfXygp6e/CK8FXe
 S37Q5dXcgOzG0IfRgEdSYHyQSaaqJcBGhWQ81N9F/+hZpSVYHv44reUAOpKxJL1M+u1mp5E1YLN
 USIaSy6rs0ZlYM4Iv0rj/qPeRpZeFkhAGsUOlOjniTToTrEL18+SLWXlmND/hWy8GVt9mPXTl6P
 Jyr9Sd2DhZzfKU2m7b/Wb5DGEv5M5c03Qk/WKXY0jYKGAMQHu6Wqtbwu/tKTkIheRWZAtpZ38KC
 29p6VCkzYL96IQg7VaJIpbL5BnZ82MhhCztbUpZ9JxXd+MDf2gBiIxl+oBkTWxxsvRgP6lGDm12
 MgrYQZFxahNL9VsgLFErWGf/xJiHEvsQGtH/R6a0FgejCwRGowTfHVQ6/KJGOAUq9lg0Ad2fQ23
 CYpvrhRqp1dCAqJQUQBCE5OoG+OuZw==
X-Proofpoint-ORIG-GUID: UCtkIMwAzWcmALf_jmVpzdRb7ODCxy0k
X-Proofpoint-GUID: UCtkIMwAzWcmALf_jmVpzdRb7ODCxy0k
X-Authority-Analysis: v=2.4 cv=WqMm8Nfv c=1 sm=1 tr=0 ts=68fee45b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lSFguUpnHfwc5t4ioxcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270028

On 10/24/2025 4:13 PM, Konrad Dybcio wrote:
> On 10/24/25 4:37 AM, Le Qi wrote:
>> Add GPR(Generic Pack router) node along with
>> APM(Audio Process Manager) and PRM(Proxy resource
>> Manager) audio services.
> 
> This is a really weird
> way of breaking your message that makes
> it difficult to read
> 
> (stick to something more like 72 characters, please)

Thanks, will modify this in next patch.

> 
>>
>> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm6150.dtsi | 36 ++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> index 3d2a1cb02b62..ec244c47983e 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> @@ -16,6 +16,7 @@
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/power/qcom,rpmhpd.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/soc/qcom,gpr.h>
>>   
>>   / {
>>   	interrupt-parent = <&intc>;
>> @@ -4246,6 +4247,41 @@ compute-cb@6 {
>>   						dma-coherent;
>>   					};
>>   				};
>> +
>> +				gpr: gpr {
>> +					compatible = "qcom,gpr";
>> +					qcom,glink-channels = "adsp_apps";
>> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
>> +					qcom,intents = <512 20>;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					q6apm: service@1 {
>> +						compatible = "qcom,q6apm";
>> +						reg = <GPR_APM_MODULE_IID>;
>> +						#sound-dai-cells = <0>;
>> +
>> +						q6apmbedai: bedais {
>> +							compatible = "qcom,q6apm-lpass-dais";
>> +							#sound-dai-cells = <1>;
>> +						};
>> +
>> +						q6apmdai: dais {
>> +							compatible = "qcom,q6apm-dais";
>> +							iommus = <&apps_smmu 0x1721 0x0>;
> 
> I see that the documentation mentions a mask of 0x0 (like you did
> here), but downstream does something funny here:
> 
> iommus = <&apps_smmu 0x1721 0x0>;
> qcom,smmu-sid-mask = /bits/ 64 <0xf>;
> 
> with the latter value being consumed by the driver manually and when
> it binds some sort of DMA_BUFs, the effective SID (ID & mask -- notice
> there's no bitflipping of the mask part here unlike in the SMMU driver)
> is prepended to the address:
> 
> smmu->pa |= ((sid & mask) << 32);
> 
> We can then check that the SMMU driver reads the SMR mask as a 16b field,
> meaning the result is (sid & 0xffff) and not (sid & 0xf)..
> 
> If we take the hardcoded-downstream mask and compare it with the HSR,
> we can notice that all the streams in the 0x172X range correspond to
> LPASS_ADSP, so perhaps it's a design choice that the DSP end only cares
> about the least significant digit
> 
> TLDR this seems to be all OK
> 
> Konrad

Thank you so much for the detailed explanation.

-- 
Thx and BRs,
Le Qi

