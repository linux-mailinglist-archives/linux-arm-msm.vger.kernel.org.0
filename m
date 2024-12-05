Return-Path: <linux-arm-msm+bounces-40603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B622F9E5D1D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 431021882E8B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A799922259C;
	Thu,  5 Dec 2024 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmpzgA3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E984221465
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419816; cv=none; b=T76l9355UiRiKDvneWiLOd/f7GaNDR1yeT0PYc1d0/rScl9gBg/+xsjgpExDcSJr09Zpw4N8sQOSA+TAdmI1bDGLqHhmW0DgA+dJKPvqIkVyzk+VuaG1V6ZsSPJd6BIabbUC3ihOIDeFhJyeGQmAcNqyDzCIsAsjH56RPL+4AJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419816; c=relaxed/simple;
	bh=oRA1uXnvpsmjJQDCBwr+QMnYjfUCn926pHr/Oj5VxTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTDoxICBdj0ErezNlELuwfENhoiM8HUVIwjeI5j9zU9UY+zScLwGVEEmCRM/mcKIWpoXOCa/0lz8Yy+ovspKtvznEjtto4QjzuxstZ9FePJdwNem/ahXAiE+JGt3wzado9T5x9TIHlHEtHMCNRhuHChgQOQd55KigXG85V3nXP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmpzgA3p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B582F0f031005
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 17:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AaqtZOlfrn0s5WOa1v+zVEs6LfsFYydrC3W6W40E/bI=; b=LmpzgA3pcNpMy9CB
	VYfrvB4ziiUIsaFs8JBWG9lYuCr7+OwNUciD5v0+/eezBK+gojEkd3HIrm9zaKv6
	MXDnun4k4pl3frdE1wtTMNevPdyio6F0HBDykcdjGMQai96Nw6zwLG8P2nsBA1kR
	PbGZz9Xuy17upHmQHlHiuypX1fbpiS5kPPIjZOlwJO/1VH8O41pbHUwx6RkjrFcj
	j625YK4XgCUppXvS14a2dTo3Jjmwph0tBzX3n/e7Gof9FqhQ7cSugDvxEQjqgS6S
	pz9rT990eBnVrEbb/dl0FliNRMJifYdhAXbSSWe4zw34qboPVPZFOx82ZkQ9kLON
	lwZHmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w910dhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 17:30:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4668a6d41a5so3226001cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419813; x=1734024613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AaqtZOlfrn0s5WOa1v+zVEs6LfsFYydrC3W6W40E/bI=;
        b=FabHG+ngzUINKuwgu5ip1hve6+ZG6HT9rAhpZeVniTYue/P/c5AtDmE1Qa8KpFXUqf
         5rE19Aqg8qTiT6lvxAsM//8qBt99YUpWa8bjwhw86EtfNZ8lZw2KOLXW5O6alCYU/TJL
         DJGCe3aeslBrsJqiCTMK9ECsiOWrFiJLs+l3FgoaxOHnUlpOmIZV4nvoFXO9pFkkLnxH
         ttHgP+m/YbYXLBAzgGly+G5Z+WykjGNNJ0W3b7Kg+e6dHIsjTfR3S3ADarXOFg/iWZJL
         XKciWCTEIrY0RWoiRYkFlGMPRMKgPqL1GB5ildRo4hqmKURyOxb128Mj+JT7BZ6yO9iD
         fYgw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Ma5xFmUBlrN56VVLaaSnCSu2RJMVEvoD/XvF7kcE1b9yHDaWi/BCLQFI4JG2A36Hx+5SCvbWSaXTZ6Lg@vger.kernel.org
X-Gm-Message-State: AOJu0YzztteYmS53ChH93AwLZSgk3NPsc+yO4JS8ImsZUVO8vF9tAfAN
	5tPgWNCfWCnWwsLnEUbYYy6dsVv2RZGI8RYcSme1EzwgHLVQeL4+ixMypRF7MXtmXIY0YFbh1bw
	GyRFr8Z7pn3IF/4josneeYLD1W9FsC86t8aC5wQLopTRKlK70wBGmJ8dXec220+PUwhTPoY7u
X-Gm-Gg: ASbGncvpZPRsFk8eFGbtbzD7E2ayrq1s058DiBopsFaKgGe+8sbQTXGe/CNx7Tdt32/
	sL/z7c95UcteIVCgUTERKQ58yJPVhLjtrVWDSeryCJ8knqxNYeJoBKLbBm1ehGwcHs2WLm94ryX
	67k742ArIV3JEtkKgpPCy7H0fXWWCsEiDhFtU26yIknU3wz+UlATWnxO++Kc807kJa0jKQkBCM4
	CrfSK68etMuTULJmN/D+sltd3szQ39VV3ReZz1q2+oP6BnnL9KAEe38xArnsDwSLeUx/X5n6jBc
	bi5tH09df2NPjtxEN5A5xOTeGFlkT8A=
X-Received: by 2002:ac8:7f07:0:b0:458:2619:45b4 with SMTP id d75a77b69052e-46734ce0fe0mr99871cf.7.1733419812719;
        Thu, 05 Dec 2024 09:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVXY2uZ+6FfU3SZe7AmGKYUL4OMFBVbnlBIZtVhOo7V9MP+Fxh/D8gWbwDaEuRWz8DmAjjtw==
X-Received: by 2002:ac8:7f07:0:b0:458:2619:45b4 with SMTP id d75a77b69052e-46734ce0fe0mr99491cf.7.1733419812145;
        Thu, 05 Dec 2024 09:30:12 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c799181sm1074740a12.70.2024.12.05.09.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:30:10 -0800 (PST)
Message-ID: <249fb0aa-5624-41cb-8a3b-c2e54dba87df@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:30:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: ipq5424: configure spi0 node for
 rdp466
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241122124505.1688436-1-quic_mmanikan@quicinc.com>
 <20241122124505.1688436-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241122124505.1688436-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jEV7yV-zaTuc-joo2ZTKu89QlJogZAVJ
X-Proofpoint-GUID: jEV7yV-zaTuc-joo2ZTKu89QlJogZAVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050128

On 22.11.2024 1:45 PM, Manikanta Mylavarapu wrote:
> Enable the SPI0 node and configure the associated gpio pins.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 45 +++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index d4d31026a026..6256216ca764 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -23,6 +23,36 @@ &sleep_clk {
>  };
>  
>  &tlmm {
> +	spi0_default_state: spi0-default-state {
> +		clk-pins {
> +			pins = "gpio6";
> +			function = "spi0_clk";
> +			drive-strength = <8>;
> +			bias-pull-down;
> +		};
> +
> +		cs-pins {
> +			pins = "gpio7";
> +			function = "spi0_cs";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		miso-pins {
> +			pins = "gpio8";
> +			function = "spi0_miso";
> +			drive-strength = <8>;
> +			bias-pull-down;
> +		};
> +
> +		mosi-pins {
> +			pins = "gpio9";
> +			function = "spi0_mosi";
> +			drive-strength = <8>;
> +			bias-pull-down;
> +		};
> +	};
> +
>  	sdc_default_state: sdc-default-state {
>  		clk-pins {
>  			pins = "gpio5";
> @@ -57,3 +87,18 @@ &xo_board {
>  	clock-frequency = <24000000>;
>  };
>  
> +&qupv3 {
> +	spi0: spi@1a90000 {

&spi0 {
	pinctrl-0 = <..
	...
};

KonraD

