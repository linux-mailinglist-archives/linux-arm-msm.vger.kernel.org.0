Return-Path: <linux-arm-msm+bounces-77464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BC0BE0587
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CE261A2081A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 19:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CABC303A08;
	Wed, 15 Oct 2025 19:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3PiPsOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9DF2FD7C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 19:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556021; cv=none; b=ARTXRlcgAmWX6qMFEYbmIgOfj8Mt6LWbE3jZ2h2vmrwt2AsDHSjLoXyGzV6WnBGeKACrvsty6Hj+YXg9Y/jZTZeZgkAR3uhGzUoE0TBoeg2xjpHK1C9DfQ4v586bM88P5m+a6AKvRnd60eksZtg+SdX/1m3G8/AO11ipZw1p718=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556021; c=relaxed/simple;
	bh=ep33UcssLfRjc51oBeoQ2Wt7olaU3sFvDFA0ufe3ojQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzs08AZPvQ1iM+TTOWuUnCVgGMoreCBHyTc6yoEfwI4tOUwRWEhx2OSllzp28bpOCzNmb/GNCqjaWGfYThHy81OxLcMnjWsTAmF/IfiGGtxD78G2euMSAjkxSvST+gxSZyByjteDf7WuZQzPdfBMRowRiP3A5G9bfuAzUCqnePQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E3PiPsOa; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5848a2b3c8aso945196e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760556017; x=1761160817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8mjpeIrj5Li1/mScwEA3BsQSOlfS1kTZ1a40z447tpk=;
        b=E3PiPsOaV9wRYQPcEuSfhVaFQJpjVUCf+1DcvZMDPzyaYo7JA5KkQhN8Qbx+fBQied
         9sjZmNJqfr+YDKCzcpyc34lJkXV2lRTwjYEYvceEGUX7t0y1SrHCCKf4yFr8HY/qeZmK
         FbziR1SIKyrxyD3R2MPOYU6J2dXjF5uSZtTOQh8OwuwScwHLTW1udbazj0r0B5eodUjq
         2HxJScN1pdHiPfQLuBJC8F+QJgr3mKV+MNZgzGTW1pLSurAApQkupHRaRvnbJ4mJO2UX
         NFwf1YRdwdBhhwitug8w/kAQPuC5E3WdyMrjId4r5cAzdPMpSz2+RA8hC9WjpsCnrhmz
         y0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556017; x=1761160817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mjpeIrj5Li1/mScwEA3BsQSOlfS1kTZ1a40z447tpk=;
        b=bF9hM34KbgWbnBRf6Dv/9sNkW7WDaLAGvouUR72SNTa+W9iUmqhVNzE/fPoHPDqr9t
         Juq+R0HfziihZsTyq50V+P/SdW24vV6KegbkDy7Kkcm+59vhigJ4D9uT+fdHAMmZsjeL
         qT3fPqNuNu4PtRGy7m4WgcaD9Q7kl0k/wXhKsM0qfwyZk0y4jVkjo42Tz+mzVMPBqUmf
         DmLkVf05XfCDmWkMRI7knR59OZ4bXi8+Jlm659EuJyuehv/xr6x9SML2XK4EYX9Krrm5
         XpCQYXluVo3r91nyQTWnNuGnhr1tD55qtHAkuSY/S6hTZJ+8Iz4WjHgsQ1TrCdRi9Qtd
         cylg==
X-Forwarded-Encrypted: i=1; AJvYcCUAs/76n5l2xlrVUf4/4k8u94QMtM9bap0ZuqULsruIGATDnq7/BHtP3FQPbmJy0GIsqT1SBMpCNvfG0Q2M@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy/EJKKOiwSr9hhDGpUD5KQtKVA+UrjHRz7dkLLmUGFY4y6e/u
	NcQXELZSigylwSnEa3udHkZwdxJloVdPdKn/4vID6jF4WYqkgunHHLpqp4iVQgpzcl8=
X-Gm-Gg: ASbGncveHCwKrIOz6D/yxr0n59NY5wejyLlHBo8jJpVY+kgVm9XYzY69psJ1FWCklXh
	75lrRqvvxlngAfGPdsRGZTUrnIyazOrqEVYy8c7EUTztvS2PtfWdz2c5wt29kM0Zl6R1fKrkmtk
	LrQ2k9Uwfa+ESPhttVGIHdRa7WXgxFdhX0B6EGhYJbmrBccRPIlUEQ+4sgznhy2JPbXTYkJIiPb
	//40rbPhXQPCxSsfMhv4kIZrX05lt6sPM8yYL+sB1/Y9jKOaYfmBRhafhnwsYO83R1kp5wCTa2H
	2nq/NmyNqSjW8DrUSzZytZ1xYozwFZi5H20EZlzSPaA93JhLdQ1+ks4Y1DicaAoYDzmGd7T5Fud
	lpQTMKvhen5NzoMlx1KBItU55/ds32tvZxUTWsKvlg1Dtn7cSQmgOIThJrmKjHsDxJw14MB6jyw
	w8aVpHlM+bNpyYiUUy2t4KU6AEag1a9mKwrS0k0FKa/3vwlYB1rzfJ1RAab6U=
X-Google-Smtp-Source: AGHT+IGIsRWmI5ge5lUIdUu2k73q0laJqSFh/LT9P2c/QCskl/jxZ4XreU8Hx9BrNbAPGj0+NboZdw==
X-Received: by 2002:a05:651c:41d6:b0:377:78cd:e917 with SMTP id 38308e7fff4ca-37778cdeb32mr7411751fa.0.1760556017299;
        Wed, 15 Oct 2025 12:20:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762eb6a963sm49042991fa.57.2025.10.15.12.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:20:16 -0700 (PDT)
Message-ID: <4eb4bb48-a8b1-4e58-a41b-b9277fbff6e9@linaro.org>
Date: Wed, 15 Oct 2025 22:20:15 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
 <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
 <15b35191-eaff-4971-bae5-2d5a8cb9f864@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <15b35191-eaff-4971-bae5-2d5a8cb9f864@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/25 22:12, Bryan O'Donoghue wrote:
> On 15/10/2025 19:41, Vladimir Zapolskiy wrote:
>> On 10/15/25 16:01, Vikram Sharma wrote:
>>> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
>>> CAMSS binding to reflect camera sensor hardware requirements.
>>
>> What are "camera sensor hardware requirements"? You do add properties
>> to the ISP.
>>
>>>
>>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> ---
>>>    .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-
>>> camss.yaml
>>> index 80a4540a22dc..dce0a1fcb10c 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>>> @@ -120,6 +120,14 @@ properties:
>>>        items:
>>>          - const: top
>>> +  vdda-phy-supply:
>>> +    description:
>>> +      Phandle to a regulator supply to PHY core block.
>>
>> What is "PHY core block" here?
> 
> I mean come on, I think the meaning is clear.
> 

The meaning is clear, the expressed concern that the given description
of the property is very unlikely match the meaning, as well as the
description of "PHY refclk pll block" below is the mismatch to the
meaning.

The misleading information shall be removed.

>>> +
>>> +  vdda-pll-supply:
>>> +    description:
>>> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>
>> This is a copy-paste example of a known to be wrong pattern.
> 
> You're right about the name, please align with this commit
> 
> git show cba308979b012664c7fe7c5baa818fcb68e86363
> 
> Thanks for spotting.
> 

-- 
Best wishes,
Vladimir

