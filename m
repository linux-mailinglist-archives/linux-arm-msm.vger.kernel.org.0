Return-Path: <linux-arm-msm+bounces-72049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2692AB43B9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6DD8580359
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147522EDD5F;
	Thu,  4 Sep 2025 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAocQBHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851CE2EBB83
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988984; cv=none; b=Jm8E2jy9wJfNLAKQPWPoqd1jJkf4voxTHi35nbA7yoBUlj3ZEdiA91HlMBPqrjdKwAFx27f0wrnyrP8H7L4ovzey9Zo0/7T/4FFhnvvlvGtxNqbuEEcks9vD37h67z4Iexd7BwNX54PomSmAdyuP2sZBumDbV+b637juLRGr46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988984; c=relaxed/simple;
	bh=prRAN2SiSAb/u9+OvVy7joIO67ql8BGArockTzY/cnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AG5xEabLmMKQOLk++Dm4o4hYUZpxHcG/yip0jIFNyQmq3ZU64SBIA8mGKMGTw42jdygmKi1PNOoNvR+5xg9bWhNKzSYo5f010c/gXr3fH3BbCCUg17bYqU3b4hhuCsQMLv8gUKJvMZYVJ/L8ZUSJExTEDFeSlsS+1PclJAzcL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAocQBHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7Tr012042
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 12:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MmD4u7VxkulDeDKbSghx2SZtMVKQSBEQjy2GAas2Xk=; b=KAocQBHdKoC0bMjx
	3LePPTQ6ynVfireF0lNP0G0tG8lCfhmYf8BYPJg4dViUSJcCAFS8bBudYXn69Tog
	pLl2Fjxuy3qXrRwWnnnSKR475Bs4w6c8lyGOAt8W8gxLedwAYBiic7/z3x/ntQs8
	OLVJgOoeb4ArqfSDKrFaDs9m8gLq5mwMXwsre45hJlb1w0Grc58HQuRTXgqqWUrQ
	zn1+ebex5KLaA/FFfeSGMLg5I2NxLNTruJf2syTc90AP+0uVlV7FsiD3SiJqMkka
	YOodrxh99zFwflk7Zw/QNCmDauegOOS0r9H/nFlRjxAi5cAHMxwwwv8+tiqcV7cU
	iRpu8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj3y9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 12:29:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b31f744865so1576111cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 05:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988980; x=1757593780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MmD4u7VxkulDeDKbSghx2SZtMVKQSBEQjy2GAas2Xk=;
        b=NdR2QWKtFRIAJfdJZJhlhcdeK3BcgFJV0lhuN6tQ6zAHs3nvYBrqMlXk1s68+WyNpp
         sgLysOExFCOZ27pfIq0d3KjBjkjPs/eUABwzr9p9Tk5rr3ZUgSiKKiLVDV3DFvclmVFP
         6wGDaZXj0rHfXq+mfFebla3xrcxwx3HHFSbqUg+2sEaYN/lnW2R7NQv2PMsQtOd0J5mu
         C0CO8dxbwbLZkIYxwJ3s8g95QXzcCVLGnqVvFEBMieU0fH+bqPU9PYzpd2Ybs4+yo+Ry
         PlZZ3pFo3590pfMO75VZNgYE2/VgBj5s8nJv8w1Z7TfjEIElNTlN4z3nGHn8j9JNs2mk
         eong==
X-Forwarded-Encrypted: i=1; AJvYcCVC89bpnvDbTw+RhN06kOQVW7rmfuEQNpbsDeKDv0YEOziy8yEz/bTx6EC1vz/yvNB/SRlHNeHKxwF97MUi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhjizq6jyTnq0Wda1+UUqMUuSvhFbOOek9rSmC0gLxclLwLiH8
	/AFXLL647VOFy3HXSsOxMAMB8UZcXdwcLn4HXLbDbBM+j8Ml4Zb1ThTZdIUv4x1LxMeuyDpCxdw
	8LXtX88nUv+ItoproFTEYxAYzGDRJcFLG2e6VILljsKPPumJuQZcq/FyFnYk04WepGiX0
X-Gm-Gg: ASbGncs6rbctL+CiGe5dvdpFFCqahOmW6xye4lYWFvOBIk5TH1pY8hcqfkyxqxieopz
	gu1RsoIadt+IBn28E5B0OOKeDWCQBMdjyaQZuu1jjByDbOkSDTl07O54BfAx7A3h2C5ad3xA12M
	LKO4LKCS10tbYwIbUeXJJCKAY+wez7BjHyiUvGCeSdOOMengst8rL2cDHf3UvV5jWVWzZ0ZwPnc
	hZ7Wznmd08O14alyddmtD0bVFeydbNbpXgSE380FbUWFogASqX3FuFvH+n9shacZS6gGXrIOD7E
	v1Cr5kS+y+5obGt22Hp5mLTstdleGDXGxAoiKQXm9JPchRcdYg2jmVIK1Oqmi4UG0xxNABSFV5T
	7Z12rxDy1GBwf3Qv187ggbw==
X-Received: by 2002:ac8:7c55:0:b0:4b2:d981:9d4a with SMTP id d75a77b69052e-4b30e932ab7mr175134601cf.6.1756988980352;
        Thu, 04 Sep 2025 05:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTfxzsYnZYb0m5gz1tPNelxJIih7NJHAZeds3PRFC3JhLe9jDQapqBbetmcr0xmuOXgNFQcw==
X-Received: by 2002:ac8:7c55:0:b0:4b2:d981:9d4a with SMTP id d75a77b69052e-4b30e932ab7mr175134161cf.6.1756988979595;
        Thu, 04 Sep 2025 05:29:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b045e576edbsm537149666b.75.2025.09.04.05.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 05:29:39 -0700 (PDT)
Message-ID: <cf6b7766-0c67-42fd-a67e-ce349688d9a1@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250903151337.1037246-8-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903151337.1037246-8-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX9/saTQ92tjRC
 YQu1Ont/ti1hSt+OSgMIzBu0YsQDoPYfJCh00zqjnPcUGnV/qh4sZPuaZv9eN4FQidg13XzHyJ2
 0pzCiLyQPwOKdatCOOKn16Tc3iOsRqxo3qB0CKM6cmzIJ3wYGn5NuXEFQb9NhG2LlGUWHDlXlfo
 YyGfQHfUHQxKfxe7tu87FGk7qzZuAp2zu+J2UHtsaXFCq5Dgly8H2KUxRmJb8g0NvM8VyXoOQ4g
 RHeG5aoZs2u75Kstuzq5e3jUi2DhzJBPtKDrw9pEHDEFeCEX+Z2dBHPxwFkCgOJh0eRcqiYUYb+
 lIr/nV0BEmmXYDIaOZe/CwFzTSyE/cah0UDEeoSHjnf7jAh3q5SJ68/LiP/1cLBm45b4uH52yQW
 U6/sy+Rw
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b98635 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=q1CUbaEDzoJ2oNbkCL4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Z15mIrWNskGLfUY6nDm7cHsfHgYaWUUm
X-Proofpoint-ORIG-GUID: Z15mIrWNskGLfUY6nDm7cHsfHgYaWUUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On 9/3/25 5:13 PM, Mohammad Rafi Shaik wrote:
> Add nodes for WSA8830 speakers and WCD9370 headset codec
> on qcm6490-idp board and enable lpass macros along with
> audio support pin controls.
> 
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 123 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     |  12 +++
>  2 files changed, 135 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 8ed6e28b0c29..379ee346a33a 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -18,6 +18,7 @@
>  #include "pm7325.dtsi"
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
> +#include "qcs6490-audioreach.dtsi"
>  
>  /delete-node/ &ipa_fw_mem;
>  /delete-node/ &rmtfs_mem;
> @@ -169,6 +170,30 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-min-microvolt = <3700000>;
>  		regulator-max-microvolt = <3700000>;
>  	};
> +
> +	wcd9370: audio-codec-0 {

nit: the trailing -0 is unnecessary, as there's only one codec

Konrad

