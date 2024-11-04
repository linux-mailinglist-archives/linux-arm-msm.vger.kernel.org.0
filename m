Return-Path: <linux-arm-msm+bounces-36913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133CA9BB2C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 371D71C221A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70C31BE854;
	Mon,  4 Nov 2024 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xUeCDrBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13931BD014
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718158; cv=none; b=cIAYspDcTM0+2IREfP3IvjhHC2y6SqTad1Wzciy9E4iC/UdlJ8W8gtxvVmssqm57cQ009T7AIdLWxSTJQMZhDfe33vxN0sIgXHTOJgMpW9i3nIJBpxFtlTcpthjmHuBb+OifqqZz+L91R9tzKnGR43qWu21+mubhCel+Z+LOQJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718158; c=relaxed/simple;
	bh=RBYjW7yVX9xM0Qg6yXxocDSIv/aHgogAIqrvLDOLJ4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6ZaTzTidhvq+lWv2vvMfpjv1n19B375mCOF5e+B+A1aGGihIzCMmCWeSZIUwGkbEC8fW69+nMWxRKMIR1Zpd7FdcYUo02uCnQnJcs+GOSOcMkDQzP6dyDYzdcBZxopyHNuHryQmyyJzj/yiyDAl9Apu/nRqxzREQ3wte/JZd5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xUeCDrBI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4314c006fa4so3384505e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730718155; x=1731322955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4RuooknwPE+sNdCvDO29ZbiY4BE4Q37nhK+478FkDdE=;
        b=xUeCDrBItd9VW8Whw1gMYzn97e3Re4v3gD+XD2RuW8lOSGZonbG52RE017kBXwFjK2
         cFySzRFB+JjPCvw+II58fyQrKTPeBD+hTf5jmoBwi4l9heW7xZUeRVRKszEJJiCYziVa
         plTvPFI0G1iGCQg5rCuZe5ZZSUQdWpPdQUJ5peoHUBoIrqcLoREoQL2szVXsKXgJ/8Vv
         OUi3ZwUcHyBiPQYRciDzuBbbmcZ7iEIOiFx79C7w6ms4nJEyM3FaZZXh/s6G6rTbxp5c
         3dUFuSvb911CRhn0x78tA5CgsyVpGSCRHxU7qqbIxdqe98NNN8uDlTr5aVVKHYbZOpvf
         F31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718155; x=1731322955;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RuooknwPE+sNdCvDO29ZbiY4BE4Q37nhK+478FkDdE=;
        b=X+ecHZhr7kVYAiDPTVxckv4cQsbQ7xvmnpNphA8G6dO8hSb2tBEHU83Phf78SdMEWl
         mJAE23AIWFplbC1jVpbOhlWdtZTqIDH/sbtmR2X+SbXB/NqgGQCxff4bXcdgAIuAB3Tm
         z+lx2aXyTaoCEabcUWqPw/XoJGPkPKh+NrHN7V7ork6STk6J16ExQYv6sy/LI6a0J1ML
         7+u6m44pb08oudVAdudsX2zFyYW+l4hQAblYVDSHKaEA/dfV2eVQ/d9bCTll0Poito97
         zKkVk73JwmCGibSEPVPQvwKTkNjGUk+LPTlZbvjtnjqrLD7u89nqwSQIcAfKiXaunnIy
         rNJg==
X-Forwarded-Encrypted: i=1; AJvYcCXUwWgD3r8b4LyT6TKgmr9KHjyqjFHffWQemSCJ8nYngrO1QxKjR9y8C72ggkpwu7XLpmABJhKEb/BRdJYC@vger.kernel.org
X-Gm-Message-State: AOJu0YzyjzGPqIeg7cfn8TpPiU3xJI0l/nsL0fIJfwifTFL6+zezt8dy
	bVVQMViwVNWLREbJ/8zr1hAgXSvAArk2JvOfIysfbIf4go9Y5HEaeCoMbuInEIQ=
X-Google-Smtp-Source: AGHT+IGSmKqQj5f1CH0/IhQb8LEqQTVvZS0Z4iyrXfqoaMET7n2+5bVXlBbzd0FbtUDaDBbEyt24zg==
X-Received: by 2002:a05:600c:4455:b0:431:40ca:ce51 with SMTP id 5b1f17b1804b1-4319ad280e9mr124428435e9.5.1730718155229;
        Mon, 04 Nov 2024 03:02:35 -0800 (PST)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca8eesm178972965e9.43.2024.11.04.03.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:02:34 -0800 (PST)
Message-ID: <a05c4cb7-134b-41b8-8297-1d709735f27d@linaro.org>
Date: Mon, 4 Nov 2024 12:02:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sm8750: Add IPCC, SMP2P, AOSS and
 ADSP
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Melody Olvera <quic_molvera@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20241101-sm8750-audio-v1-0-730aec176459@linaro.org>
 <20241101-sm8750-audio-v1-1-730aec176459@linaro.org>
 <0782c956-361b-4109-a8a1-58b8ad396e0b@quicinc.com>
 <649f43d5-2d75-45eb-b13c-31fe88d99c8f@linaro.org>
 <kxpokionrgollof5yptnqnxgsi4v3g24iwdb67mznljzjzpxab@dnts7qgvu4vo>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <kxpokionrgollof5yptnqnxgsi4v3g24iwdb67mznljzjzpxab@dnts7qgvu4vo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2024 11:52, Dmitry Baryshkov wrote:
> On Mon, Nov 04, 2024 at 09:36:46AM +0100, Krzysztof Kozlowski wrote:
>> On 01/11/2024 19:14, Melody Olvera wrote:
>>>
>>>
>>> On 11/1/2024 10:19 AM, Krzysztof Kozlowski wrote:
>>>> Add nodes for IPCC mailbox, SMP2P for ADSP, AOSS and the ADSP remoteproc
>>>> PAS loader (compatible with SM8550).
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 140 +++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 140 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> index 98ab82caa007ee63c395a3ce0f517e2bbeb0aecb..eb826b154dcb2d8165426ba2225548efd7547da8 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> [...]
>>>>   
>>>> @@ -538,6 +566,17 @@ gcc: clock-controller@100000 {
>>>>   			#power-domain-cells = <1>;
>>>>   		};
>>>>   
>>>> +		ipcc: mailbox@406000 {
>>>> +			compatible = "qcom,sm8750-ipcc", "qcom,ipcc";
>>>> +			reg = <0 0x00406000 0 0x1000>;
>>>
>>> nit: unsure, but should thse be 0x0?
>>
>> No, all recent upstream DTSI files nodes use simplified 0, because it is
>> shorter. Maybe except few cases, but then these could be corrected instead.
> 
> I think most of the files (including x1e80100.dtsi) use a mixture of 0x0

Most recent files upstreamed by Linaro use 0, not 0x0.
git grep 'reg = <0' -- arch/arm64/boot/dts/qcom/sm8[56]50.dtsi | wc -l
384

git grep 'reg = <0x0' -- arch/arm64/boot/dts/qcom/sm8[56]50.dtsi | wc -l
30

git grep 'reg = <0' -- arch/arm64/boot/dts/qcom/x1e80100.dtsi | wc -l
234

git grep 'reg = <0x0' -- arch/arm64/boot/dts/qcom/x1e80100.dtsi | wc -l
65

And SM8750 builds on top of SM8650.
> and 0 here. I have been told several times to use 0x0 all the time.

I can't believe we have now long thread discussing this on this silly
patch, but sure, do you have reference to Konrad's or Bjorn's
preference? If want to be sure that before we start renaming everything
to one style, we actually agree on style.

Best regards,
Krzysztof


