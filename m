Return-Path: <linux-arm-msm+bounces-70536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A51B33411
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 04:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA7493BF469
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 02:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57531C84C7;
	Mon, 25 Aug 2025 02:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAkcIalf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8E9A41
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 02:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756090054; cv=none; b=ntnq3uvtTWzhQAwqVr5pS72Ek9uCUumAk67OoMgwpohKN/ycdM8oWsNul1oODW0TYH2BJuO74RzFawbNLBlF7B1I1zQ2EdYGcPZ6ocQN7sS3ko6qMbpIsS9OJwkui2S8e8WbMNztbJwNglO2kv1iLZf5gxJWjBHmx2qA9NYuVFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756090054; c=relaxed/simple;
	bh=jQfOcv0qAZgmoBS52zIxnB5tEXBhDfuQ+QjUbe2iqG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0NiJFVAZDS+FLzKoTtIpOWT//+OrvNVbMX7VG9hTgWr9LnsCRHdJFmfOhk14doCXnpLJXiSlzfcsJtIVtGd2d/96yLINZuzkKfxBvbWEQiHkNx+Vu/OGMCVs0EurrwyaxbqxvsgclVofJADJb2y1aMUiKb8CN/5RVbLyctIu5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAkcIalf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P10LeT020343
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 02:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VfwCKQQQnYyOyRVHfRHX+KeL2RRlkeV3bTTxzNTzSBA=; b=HAkcIalfRFlYnUX8
	t9Gzy/Ods4IqfajOAUimn8GjZEAtfxRbSeDjKrGoOJ3z5YC2vfDmssj2vtntw1sa
	jiITs0f1QgvCFoUrddkM/1h8e04zxf0vn9xQjij1M0WIYWr/pi/tYbiEZj4myC+z
	Q77AtddiSuPE0nRaPBaXXhbCW2fAjeLHYFWZtsLI8/XZmrmHdvwTHqZMABJ53tV6
	Vgz7gDUf+/fQ7wuRLIbL9C2csNqtVt5DatRF4uTW9jybniGxBrZ8avLxM2OXPyFJ
	bJjDk7jGQsU7IfNvTN33cBB7ecPOyRFZMfKaU4Q3TwYZJZzHRngCDRtPmj8Jrjza
	fuHK/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thucqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 02:47:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-246cf6af2f4so11347025ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 19:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756090052; x=1756694852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfwCKQQQnYyOyRVHfRHX+KeL2RRlkeV3bTTxzNTzSBA=;
        b=YkLqN+QCa9r01Z0jzF1/cuA+xeczQYQ5OWEwdPRaRu+yE1nU2vru7wMSJycXKNovgG
         wGMR3AfvqTRCuuzG44JcXKjd4rWgBr+rMlGVwetd6SpJU6yZevLC13O4ShdcH6q8+cke
         1R0aNVVICq2QBci3H0wMV0lLHWyMb1FzPQeeYXtsbU/beAyDYKUhqw/r87C6vWAqScds
         E8dCe+o1t2ltle9teKu90uveTBMzwEqwRRzkL+3RABTMH5LTOj6UOCaUe90VjbgnnuLH
         An2GpeI1ZliY5FIHxyEAjswElj07k2FoVyXy2VVOFTSSTVCvK77Mb99fvnkcPMSz8yNZ
         ledA==
X-Forwarded-Encrypted: i=1; AJvYcCVy0KyzGhFzl/h8EkeIqbI4rbaeZ8OF9qucM3zj44Plx1Y1Wfx9MsHrgT1IxBUZBUeV0hTeIpsM4fG9NaEK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73foF3AislRnDdQqgaluI1CbBTaowQiZOEI8Lk0BM5fERJd7q
	9DjNTAhT6o74glEFUdWIXqnWgUbYAFPTwPmy1HOsdCYie7Y03TnC4Bm+CJ0J15yv7wLRi/oLC2d
	2jnRy4fAXUK8kPQ5bRC9snLpTuDIaAdIPXmpC13T8TNqcXZN4iQCIyPeGr1XUC+vqwRV2
X-Gm-Gg: ASbGncsX40EX3ZjVtT83iqs8v99iL6Ar9SRwpbHoK8vwo0k+Bd3n/2bIfno0DZJZRLc
	4dI8eIJE+HHIFqPcFcbVuLglFViKxC+ziE+2duJuxyMt8gOh8sfM1KSUnxqGpwcqtKf/rralDqc
	fukQutp8Fr6lPq1ObDCFem4WIx4iXxq2su3bJ8KbQtfTaKGCqPDAKclCMYTyJiz8V3VtcJVENgp
	lvYyJinSdyT+pHmgZKa7ovXfDcFPVNNb1Z8LnY7EPOH2XN9Rxt+Sclr72nIu4IdXFrZ3tBeK8TA
	+9b+iM/twVlpzmzXdoQsNeyamkgDgs5ffQAq9e4RgmmiUZ4KenFa0QyqA9VT/Yd9tZk2KgoTArz
	NVHR5yih0zpLDQQQYkuRgB67eSWYsHSX8Fg==
X-Received: by 2002:a17:903:1a2b:b0:242:9d61:2b60 with SMTP id d9443c01a7336-2462edac937mr157895065ad.6.1756090051604;
        Sun, 24 Aug 2025 19:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKKIMXe43+T6NFMjiAvVF6JqkUeNAVwNxuN1RJ80TidJr0d/oJGkVlSukrU1thyXtU+ftllA==
X-Received: by 2002:a17:903:1a2b:b0:242:9d61:2b60 with SMTP id d9443c01a7336-2462edac937mr157894865ad.6.1756090051160;
        Sun, 24 Aug 2025 19:47:31 -0700 (PDT)
Received: from [10.249.29.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f3c94c05sm4432718a91.3.2025.08.24.19.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 19:47:30 -0700 (PDT)
Message-ID: <33ac5fef-f855-46f3-acd3-daa8fc34d918@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 10:47:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Quill Qi <le.qi@oss.qualcomm.com>, Jie Zhang <quic_jiezh@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250821-hamoa_initial-v6-0-72e4e01a55d0@oss.qualcomm.com>
 <20250821-hamoa_initial-v6-3-72e4e01a55d0@oss.qualcomm.com>
 <jj3mvad27kdpfxo4p2c3jfpjq2icao6mltpx4uu3sretqgkfap@vpqgfwzl3sjs>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <jj3mvad27kdpfxo4p2c3jfpjq2icao6mltpx4uu3sretqgkfap@vpqgfwzl3sjs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX0Dv22jPg3NYd
 2cfGTLyLGmEYtZykmNAKC3fEIxIC5GVMyOT8aKL/WhXSoD5CmPMmA3fnk62nKbNkVwWMnfqZHow
 boe/jQd2JA81T90WWjfdCt1Vcc0hUzP3JhoyBV9SedsTAs2uZAVjTssxpjtNqlVS3RxDkCMbvpD
 roXeTXr8reyqvSsysq/Io5cSHkaGbX6IVaNyephFM5pgd6uW/J5Gh5VBhcxPXydjIGuNzLKftWf
 nGkieaF/8pnxopNeN5v4IWm5fsKjWGgOMp856NC1+Y+H0sPFMl/DbtiBicXFl/LBS+U801Oic3H
 wVgRubK9VBRrde6X+T+WjGSABO0p2bIEpXb2qMKWzybjrHOANEUaqNSsShno/z2SmdkWD76+235
 3AzGRdj9
X-Proofpoint-ORIG-GUID: 0uT6nM1RfjA9-LjeW3pWh14sNnZhKjlH
X-Proofpoint-GUID: 0uT6nM1RfjA9-LjeW3pWh14sNnZhKjlH
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68abcec4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=DkPH1XLGW4EbIkNXeAUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043



On 2025-08-22 19:56, Dmitry Baryshkov wrote:
> On Thu, Aug 21, 2025 at 04:20:24PM +0800, Yijie Yang wrote:
>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> This change enables the following peripherals on the carrier board:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>> - Bluetooth
>> - Graphic
>> - Audio
> 
> No WiFi?
It's in patch 2/3.>
>>
>> Co-developed-by: Quill Qi <le.qi@oss.qualcomm.com> # Audio
>> Signed-off-by: Quill Qi <le.qi@oss.qualcomm.com>
>> Co-developed-by: Jie Zhang <quic_jiezh@quicinc.com> # Graphic
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Co-developed-by: Shuai Zhang <quic_shuaz@quicinc.com> # Bluetooth
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> Co-developed-by: Yongxing Mou <quic_yongmou@quicinc.com> # USB DisplayPorts
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1247 ++++++++++++++++++++++++++++
>>   2 files changed, 1248 insertions(+)
>>
> 
>> +
>> +	vreg_edp_3p3: regulator-edp-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_EDP_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&edp_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-always-on;
> 
> Why? If it supplies the panel, then the panel should be able to control
> its power supplies.

You're right, I will fix.

> 
>> +		regulator-boot-on;
>> +	};
>> +
>> +		wcd-playback-dai-link {
>> +			link-name = "WCD Playback";
>> +
>> +			codec {
>> +				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
>> +			};
>> +			cpu {
> 
> MIssing empty line between nodes.

I'll update.

> 
>> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>> +
> 

-- 
Best Regards,
Yijie


