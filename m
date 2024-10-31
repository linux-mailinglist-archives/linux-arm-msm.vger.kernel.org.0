Return-Path: <linux-arm-msm+bounces-36594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF929B824E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 19:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2624281807
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 18:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF201C9DF7;
	Thu, 31 Oct 2024 18:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fAaJ5huc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F33C1BC097
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730398151; cv=none; b=D6sDrqWuOf10OjGpRo4D5RVq7gx6ehApc8/k90ybXtCXFDjj9/XdocqOoe2+2FamIv/lf64+IfsbcORFJmDwTuyypyHw9IFKZd8xkWfWOp/+kPX2hwYdsGMDFMDXVgbBYHa3wCs+sHO2BSJTE1cVMe+BjA91yJ4BY6kIAM3SyP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730398151; c=relaxed/simple;
	bh=pnbU4m92rARoAQneTzD5Jf7lxArdrciMF5RdRrZAC90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pp3liKhrMORlV55vmIkPDRXZw5rxQsUqxy7ytpb2pGqgKsW40xpA2VC59pv2FDqGEnacEx+e07gaysW5pWBJl1fFJGGQRInUSR+T12iz6WqX4j/8Ji/TF6IOA66QNcM709UyOmEPCf7/ncsdCNM5bxAjpxQJqzT4y1wAnG1U3Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fAaJ5huc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so10762775e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730398147; x=1731002947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ww423lfHl3RJq60oXMLHUaPgCkzs8qQvv8BPeWX9FNU=;
        b=fAaJ5hucJLzb9BJ0BTeSBPSlS5JAPc1/GQ/iYI2MQTLAz54G3icBNlpUwSXt3trkOl
         LofHTRleJfPRqvxrGi2vOVvWEh7phBLqlq4CbFhs/qIT97IAk9ZOLtDEZhSGCnzj7LCC
         wygsc9SBMsnXEIRxByN0J2yVs50/MXi/1UM3W2epC2gaUGXPCzMWCXUkuSLKcG2qNxcX
         Fq4M9f1jq8siskRcrFfK0sf7e1Q1FAyR1FAATkrPNurKcnpD0j2ZW9L1DfN6wWYD+AqB
         AqjWH1ObbQseKhLERSS0PC6eDEaIMhWx9HWJNabqbr7ZZL/M3ds8piULfrY14rHx35o9
         aoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730398147; x=1731002947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ww423lfHl3RJq60oXMLHUaPgCkzs8qQvv8BPeWX9FNU=;
        b=utJXoxfO2tvEPO6F8YrKzH95xczYMuqLj7CL+1N5FjKMSNUzJj/PqOpfo4L/N5doHx
         ywP60ZAZ4N1mSGR6TJWJ1T3nxxTHYvE0ZHKiAs3dbbwJGZjnrGk2ns+wrsWV2TbeV9l8
         MNS5wotzG5H24FEycpu0gufLQ+vGuiVs5Zz9ZT0CMVl400d2RS54dDtwwQ5cIfq2pcWA
         vMrWLRHGvtkNDJPsdRWurqrq0gznRE6tA7kmzNGruyKX1Hss6+m63TEEEG5gtfn5Dm/O
         IkZSC0WYLWwu/ZsPnbBP1hxZqKQr1zkaE0doXkCFPTxTV10/dceL/M/n1optW6Y7I8GL
         HYeA==
X-Forwarded-Encrypted: i=1; AJvYcCVeAPG16bBwetRUPAvLBPwdy1vhffXn/DYJ3R5dAwN07h0J4CGg4lK9QavQGq6cY9KJvVbwIFyoGTVhxkbd@vger.kernel.org
X-Gm-Message-State: AOJu0YweLsgCV+qECDMyPJShlVMfdzH0aYHL++73d8/Pevcj97D12FBU
	+q1yj/xo8PCsz+3nfElgreLOtX+0i4dhbpPMpWtvOEZb8MJBWsnItfwJj3axj2E=
X-Google-Smtp-Source: AGHT+IGUTRQz69TQsAsuaTFQLcFekqsDLfAz6CitU1HfJ7lLbNV0dp4jvalOgtIpFWbq8+MW+JPV4w==
X-Received: by 2002:a05:600c:4f4a:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-4319ac70637mr167227885e9.4.1730398146724;
        Thu, 31 Oct 2024 11:09:06 -0700 (PDT)
Received: from [192.168.0.17] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d473bsm2833645f8f.35.2024.10.31.11.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 11:09:05 -0700 (PDT)
Message-ID: <299befa1-63f9-4fff-8d5a-0753ae620c11@linaro.org>
Date: Thu, 31 Oct 2024 18:09:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <20241030105347.2117034-6-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241030105347.2117034-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2024 10:53, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 175 +++++++++++++++++++++++++++
>   1 file changed, 175 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 55db1c83ef55..690051708dec 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4426,6 +4426,181 @@ cci1_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: camss@acaf000 {
> +			compatible = "qcom,sc7280-camss";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,


Order of declaration of the nodes needs to conform to

Documentation/devicetree/bindings/dts-coding-style.rst

i.e. reg should come first after compatible

---
bod

