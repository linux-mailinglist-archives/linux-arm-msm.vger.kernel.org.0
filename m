Return-Path: <linux-arm-msm+bounces-1020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF087EFC76
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 01:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F9FC2813A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 00:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C64D376;
	Sat, 18 Nov 2023 00:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Thn8FfCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401C910C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 16:08:39 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5435336ab0bso3822346a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 16:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700266118; x=1700870918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2nwpOE763xNMRQa+zeSB+8/G6OMMU3oC8obNn/im3SM=;
        b=Thn8FfCfvOZgfKRNxPP3bXjJRpuJfPJPZT3+YCjU9S3jYT26N9USjQiIK49Ik5SC8S
         kOQIJWyM27aYX1LON4MaNq9GZP5vy0GhW1/TWiJAFcrgCKdzDN6+Rt1ANbuDCs5KIxmb
         qKl5t0SAIPSlK3G4hFYBiF6a2SDOpEfaYs2s34WfHz/p6GZ+ZPugaLq+qvdHn+C0pQAS
         qxaY3XfrKdjPPEPtSk0q93liPRY+E11o5ie4nTa2rQQI/g7ZzasK/57hl3j4BB0UHYNO
         8hO2WDC5pxCVEgszO4SE/XTHIhhsRgOyas2XX01hBFjZRT1LxANUUqD/rHFiTQCKFG6x
         lJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700266118; x=1700870918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2nwpOE763xNMRQa+zeSB+8/G6OMMU3oC8obNn/im3SM=;
        b=NHjXftTeA/7/UPA4LkINTmm9yqM7eSL8AgBx3TVqVM0kB6huMzGAnj3ENLQipFHsta
         6lhY2u74Jd3bFMLZ4wrRhacPdICc8Elk7iTsxNSiy/HnIYeLAeKiHuAZlJPvTmLXgdmW
         WMglwb7bqm3cCd3iLbSuNNR+IMs7gu0pAIaFK3/BohQE7NgCDvG97btQWRFg1tWRLgpL
         CPUXmg+2hBKS87re6FX4jMuhQQeU02YclJimG8vjH3767NfLUOb39QJCa+Z83xmXiaMk
         pK8OkcfKjDJXAf4QSIIB7cbT862ye99XgrAbiy4jKwd69iKcbnTO4/Dd7dgS0k0MqhNt
         W7wQ==
X-Gm-Message-State: AOJu0YwP9/DMj/dvN2ekEjM/7FwT8G4gi7XwMl10s9Z2ZLtR+AJYe57X
	PUMJJ7FfQQXFc62JkmY9zSVRKQ==
X-Google-Smtp-Source: AGHT+IG421y36aItmwl9ECsNxuvFSHfk2KFYMVAs3T5gUuhnwOlUwBqCiV7eaM48Z10vFIZ5E28sjw==
X-Received: by 2002:a05:6402:1a54:b0:53b:3225:93c2 with SMTP id bf20-20020a0564021a5400b0053b322593c2mr498037edb.8.1700266117740;
        Fri, 17 Nov 2023 16:08:37 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id q1-20020aa7da81000000b0053e625da9absm1173383eds.41.2023.11.17.16.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 16:08:37 -0800 (PST)
Message-ID: <1ae2da80-77e8-487a-a94d-b329e6f48360@linaro.org>
Date: Sat, 18 Nov 2023 01:08:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] arm64: dts: qcom: sm8550-aim300: add PCIe0
Content-Language: en-US
To: neil.armstrong@linaro.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Tengfei Fan <quic_tengfan@quicinc.com>,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, -cc=kernel@quicinc.com
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-8-quic_tengfan@quicinc.com>
 <37a3a407-07e7-49d8-bbce-b1dac8cfcf5a@linaro.org>
 <247f4654-ec65-4857-8b35-1a79088e8b87@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <247f4654-ec65-4857-8b35-1a79088e8b87@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.11.2023 11:41, neil.armstrong@linaro.org wrote:
> On 17/11/2023 11:29, Dmitry Baryshkov wrote:
>> On 17/11/2023 12:18, Tengfei Fan wrote:
>>> Add PCIe0 nodes used with WCN7851 device.  The PCIe1 is not connected,
>>> thus skip pcie_1_phy_aux_clk input clock to GCC.
>>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8550-aim300.dts | 32 ++++++++++++++++++++++
>>>   1 file changed, 32 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>>> index 202b979da8ca..3aca0a433a00 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>>> @@ -393,6 +393,38 @@
>>>       };
>>>   };
>>> +&gcc {
>>> +    clocks = <&bi_tcxo_div2>, <&sleep_clk>,
>>> +         <&pcie0_phy>,
>>> +         <&pcie1_phy>,
>>> +         <0>,
>>> +         <&ufs_mem_phy 0>,
>>> +         <&ufs_mem_phy 1>,
>>> +         <&ufs_mem_phy 2>,
>>> +         <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>>> +};
>>
>> NAK, this should go to sm8550.dtsi unless there is a good reason.
> 
> Actually this is how QRD8550 was designed, so it's fine to mimic.
Does CCF not handle this gracefully?

Konrad

