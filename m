Return-Path: <linux-arm-msm+bounces-56104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB1AA08EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24692189C06A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166482C108D;
	Tue, 29 Apr 2025 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ew3LVzrR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AF020F066
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923923; cv=none; b=AXkEyVwbM2w4zUn5fVQe8cBZD2q/1e0amZqtz57uZc1IFnTSrGz86c6Yztl60sB4KgnNGNf50MWvBVXbK0aVQmIJR5PMPsnKJXdm+Nk0pW+FF4KUrZ7R7Qkpi+J5yAqxgnoPK0sMZdX/nnx+dV+Jeg9RMivk0QQ1UpPg1xEsgvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923923; c=relaxed/simple;
	bh=1WCmgyxNki9ViUDLOicGwtgd49yw1FxS9L57KJq4vGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5JgXedizMJ8bZWDG6mfvQbEc2qxms5CxqlL2LslIdEKcvegvJUCanaYdetLzAaYsF3wlCVlFl2YJ8tNBjoA2dcivUDK9wUqD4PZRz5TiFxT95Igwm7rxCFc09TC6WRqtQqaI+EZ4PnLXxfQCy5cs1Ap9RUX2OwUL+vp1v9vFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ew3LVzrR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA28xx015278
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTRzGhSg5MlZSKJHgUS2LB4fHsRaKP9Q0pvSFNNeMoE=; b=Ew3LVzrR2lth11ab
	BODcPHM3KlJ29eNgNCZ2Z1jdqbzu61MvUGfXOPxSVUbDMRy/n2R9yS/CvptOdZ/y
	B68lk8emIMZ8SQ9KgpYWf7GJF9v+VwodMRao2/PeekQC2iquA+cb/PrDNqdyxSmf
	jLl1JTb1skRReWPawc7qbA7pbAFKq8YFtveIpXZB7/k9YuTUsLeL5EPvnW6OTgU6
	BbMYG/HswLSFDk7C3II0iAKlzpEW1ydFeXj8phNWBcXi3KCGZp+P0lFeUXqyKGOG
	UcSvKge+gEojM8vXChDRaAzTgR/yjyQh+DBmm3mFOBZHHGoZyXfqvE7QKQifxa7g
	EUGYJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwv7a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:51:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so19938626d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745923918; x=1746528718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTRzGhSg5MlZSKJHgUS2LB4fHsRaKP9Q0pvSFNNeMoE=;
        b=Tj5t9cTav32ghvk3/kh6q4+xlCV0YzOc5YW8qqqsgCskl56l9cglvptrznNdurmkqK
         fcWtYVpz0r5SB7OsfLu1H/RDhH4SYRph1OPZYFMBn4J14oaJyihzL3Fqt9CkgmTvdxDr
         b/Gjgiqwn1HjHvj/qXWmod9QwBo0YXId918Vl2Jt0FpFmc59DzQy9+UUBR1Ud8+znkDD
         O4/6MfSuvwelRcFWTxrACM4IILK03CooygI8CVEoSNYq11HDGTODeuQH4R8z9rcXeGwE
         3lDc60kxw0WQRAzENfw1PpXZvY925iKsktcXXnfUC3prewpJl0ICQssD7GTfvk6ZVatq
         TpSA==
X-Forwarded-Encrypted: i=1; AJvYcCVSxMqhjbViMEdHw38HJpGrYqvRTTC5NIBORmIEY5Mhbjzo8sWDDTvkvaz/y2RRL87X+HJMBchj+jtZKIV8@vger.kernel.org
X-Gm-Message-State: AOJu0YwhH4DjMAldXXnSvPdQdIju/tAAG+Y7L9zQwxY4Hv09mEACdIQW
	RQIrWW4Medp8X9hiFmYa0EmPvWp34/e4eCNQUSZN0oLK50HTVPN5LRE2RyEmfHd2h9o0VwM4zC6
	AZqp01STyN4YaYi5gbthJ3U+Kclq33jHwpW7/OfroSskFX1nig9Z9PT12j34KV3Zl
X-Gm-Gg: ASbGnct90LPVfYzsz8LnlkUDOJUxaP3jwBCJHckDsAAY1fsmsa3VKY2Fdvctf+Tntpe
	9YjXIj+Pl633a6Py5f9oZ3SzTrtamItkr7X2rAjnVZhOrwcm2blTE4ZTqRcIPokeCfEPYgm4sFg
	A79wj0tgpLoACiKcg/IK2MQ7+CJVm7eegiqGF06JI+h2R9kQZZUPmi597528qiHtkClpKTe/5wj
	GYZztk+1n9My6XWMrwki0maQ1qxSbXj7m5WPX3Nm27/48zrb0as19W4iXexB2lXnKs8TQuVeF5X
	evtJ+nYJGRB92gycUBHZcnn00mxKaB9iZNTCbEkD4eZpQsqP/euGToYIcCS30Tdtuw==
X-Received: by 2002:ac8:5a12:0:b0:476:66fb:4df4 with SMTP id d75a77b69052e-4885fadd2c8mr15067271cf.0.1745923918434;
        Tue, 29 Apr 2025 03:51:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3JzNjbV3+PlqpydBQfX+3fP7408wC6Qg6TNd/6IYV9tyTw3iWCLqCkgU0oaTDWVeOMiCk5Q==
X-Received: by 2002:ac8:5a12:0:b0:476:66fb:4df4 with SMTP id d75a77b69052e-4885fadd2c8mr15067161cf.0.1745923918113;
        Tue, 29 Apr 2025 03:51:58 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec4fbc9c2sm126949366b.171.2025.04.29.03.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:51:57 -0700 (PDT)
Message-ID: <7bd9fd43-7159-48a2-bf0a-712de9cb2bc0@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:51:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-3-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-3-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u_4HChU1oKSpJ7SL63P7h8BZ8Sl0aEQV
X-Proofpoint-GUID: u_4HChU1oKSpJ7SL63P7h8BZ8Sl0aEQV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MSBTYWx0ZWRfX5OVGsRA7bb7T t+yY9Oy+idl4GdYNiJEkbYz8stsI71Yk8qrN8qpDVqtErNSZmrAgMESI005c3zEdFfJFnpQCySH N88DolMpdERLt4vOClMnKeDQteamuMXLN9vHwG2D+KlsrivslsTxOrzlr9L6JZT3vSlwV4s1zgI
 7tp5VVupYdP1gQuolgnrJAJN8mCHjVmVAjiyi9fMko4TOPmapRs/76ghqn7If2FWrmZZMYLROd1 LBp0rO8j645ikPWTvVOoidlo88aepEH1JKgnrUxH54oEF8aqvvhViN32Q3nN7obzrwzUX4YeeMz RVpF4AL68xXYEBFia7X5f45JcBqIIm84AS6ln6HAgaovfxBWvCB6CSP16Lc7IKbwE+6ecK4OPfU
 PA2sEXgIHZdYqsPk/BgwmxvXBZ5UCzSgcxcKhrU80WAUSrSAr0eh23/ZamUDyptsD2xfo0se
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=6810af4f cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=u0yWLgZLcdoHeyFTXL0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290081

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add WSA LPASS macro Codec along with SoundWire controller.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 68 ++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3453740c0d14..d4aacb97a18c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2601,6 +2601,64 @@
>  			status = "disabled";
>  		};
>  
> +		lpass_wsa_macro: codec@3240000 {
> +			compatible = "qcom,sc7280-lpass-wsa-macro";
> +			reg = <0x0 0x03240000 0x0 0x1000>;
> +
> +			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
> +				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
> +				 <&lpass_va_macro>;
> +			clock-names = "mclk", "npl", "fsgen";

Please make this a vertical list

> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;

property-n
property-names

across all changes, please

[...]

> +		swr2: soundwire@3250000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x03250000 0x0 0x2000>;
> +
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&lpass_wsa_macro>;
> +			clock-names = "iface";
> +
> +			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
> +			reset-names = "swr_audio_cgcr";
> +
> +			qcom,din-ports = <2>;

The computer tells me it should be 3


Konrad

