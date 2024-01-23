Return-Path: <linux-arm-msm+bounces-7981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5188D8393B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA0BE1F22CD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFAD6086B;
	Tue, 23 Jan 2024 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tfKYRcwV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F148560894
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024699; cv=none; b=byzPhpay/s0wjj9xfbSqZcX/mfiFH1QnoqaR93osYrdcU2laG2bG9CGa7Q+6xiNRSvpICWyYdu6oRSZiu7oHygEBTYhLVRCWPUuwpad6qyuUg/2OKmwY5HDIxt/qPH2pa9ueRgCAYX1mPxUe6+yZtHT0B2QPdTlb940gZBfqPb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024699; c=relaxed/simple;
	bh=v66z/6SqbUGnxW01A6EAcko38iSDYwdZ7F36jFF1++U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxO8sjuaG4kzf89foiT7UfdnXMMAQImIdogbCFAijL2Snup4a9fk/j+y4MceNx5ifqifc8Wz/VGFyMVGF1iypY2xP4ehRCIujJE5vUu1djDeOSdzVoiRzQQbN0CI+cissRCLcgu5CxfwtgTsLpThRsHJ6Pv/m5IIJnKU6EVc3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tfKYRcwV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40ea5653f6bso41292295e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 07:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706024696; x=1706629496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fw8HiKqsvLnNZBoBe2w58hvINNLUyhw5JoLm2QBqfBU=;
        b=tfKYRcwVkixgLVqM/G50oFO0iCTzYv/qTx9PGl3Sq60FGUJVCQldd5HkMzGwmOlZNt
         CtzlDTkT10hgjA1D8B9Nh2gejBPlbJU0h444iLVmavBYgu2G0aoY2NJGAYPUOjjvPxpU
         SXAbfH6G+dE/Lj80MCv99xPCSLX3BIdYKDsZodyT6ibGF7Y10ge3Tp0WXWjL5yI+Q9zf
         12WZ/oHvTxYWRQdNoElprtKG3/eCzUyJmbfrd/CZ2/vM4PkeSdMMkS9kz8mlcVBvIAiN
         wGoa8ZUADrh/Hh0iVCjDd21S5ZwbCBtWs0S2h+TxcY5Vnaf9uBh5QrmpK8o5iN8Y0Uhd
         KSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706024696; x=1706629496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fw8HiKqsvLnNZBoBe2w58hvINNLUyhw5JoLm2QBqfBU=;
        b=lITt0YcdxPuAYu5TS2z7WiKe7ywSDCQcf4VQGG5Q+1NRrglkKDwwEKrQdKfKNXInF9
         ysP5t20QrT4Im6C2t3n6MmrNldPnBRyphYRs5Ekn8mbvMxAa9twUl++fir28tOlPAIe/
         Yx5KcHni5RnTgzoCdNnCqw9nXS2aRFyVDWZgr7dQbA/1V9LeYWdNDy+1+5dg5VdlQWJn
         mKoja3+z8TsJAMBDzQmtVn2d3caxbMElPiqxh4RP2cO4q5i5uOU8IK8b0Fb4Yd5/o0Hc
         NEqSjfHACzHiWO7CWGEHFEltv2yjqbjV4jtswA0lqd4jTyS6lVMf/6cTSvpWiPqm6K+q
         nwxA==
X-Gm-Message-State: AOJu0YwGM7MokHp5X9Y4OXs4vFqG/2JUqUBwiMCxB9j6Q5KFV6hcxNLn
	RAt/h3D5MXy4Oglotm7N/fVUBS3ij/eo4HBDikbtgnwuCyt2YRkaifkgdvfyAlQ=
X-Google-Smtp-Source: AGHT+IHLMgFndLZi5jz+e/VjdAkL90bxzQ3xFK2TXeY0BSXFOkpzbbQ3Qa4tKoIUoS/Mxa+Gmldvng==
X-Received: by 2002:a05:600c:2409:b0:40e:b177:8dd5 with SMTP id 9-20020a05600c240900b0040eb1778dd5mr241750wmp.228.1706024696177;
        Tue, 23 Jan 2024 07:44:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id w18-20020a05600c475200b0040d2d33312csm43415670wmo.2.2024.01.23.07.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 07:44:55 -0800 (PST)
Message-ID: <07cb226c-19d6-41b4-9af8-a3bad0ba7a5b@linaro.org>
Date: Tue, 23 Jan 2024 16:44:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Alex Elder <elder@linaro.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240122182158.69183-1-brgl@bgdev.pl>
 <u5kvv3iip552yb5ykc4t2arfry2t7f34hwmemd7z6qfw677fs6@ldlwoycyacrm>
 <CAMRc=MeT08vUUqJmtVCP=kSUrbsoKFHP6gHgJPtqztC593oGpQ@mail.gmail.com>
 <2d36zymagbran5m7ggcmy2zmtpt7xpefgys7rebbwydz5bpux2@svlv75ctdow5>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2d36zymagbran5m7ggcmy2zmtpt7xpefgys7rebbwydz5bpux2@svlv75ctdow5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/01/2024 16:34, Bjorn Andersson wrote:
> On Tue, Jan 23, 2024 at 10:22:33AM +0100, Bartosz Golaszewski wrote:
>> On Tue, Jan 23, 2024 at 5:47 AM Bjorn Andersson <andersson@kernel.org> wrote:
>>>
>>> On Mon, Jan 22, 2024 at 07:21:58PM +0100, Bartosz Golaszewski wrote:
>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>
>>>> I'm limiting the audience of this compared to the PCI power sequencing
>>>> series as I wanted to run the DT part by the maintainers before I commit
>>>> to a doomed effort.
>>>>
>>>
>>> With linux-arm-msm and deviectree in there, you have a fairly big
>>> limited audience... I think if anything, your proposal is doomed by the
>>> lack of a proper commit message describing what this is.
>>>
>>
>> By limiting I meant compared to the PCI power sequencing series but
>> you're right, I should have linked that series in here. In any case -
>> this is not intended for upstream, I literally wanted input on whether
>> this representation is correct before I send a PoC of the pwrseq
>> subsystem using it.
>>
>>> Below you'll find some questions/feedback based on our previous
>>> discussions on the topic, although I'm not able to understand the
>>> motivations behind what you propose - or even fully what it is that
>>> you're proposing.
>>>
>>>> Here is the DT representation of the QCA6390's PMU with its inputs and
>>>> outputs. If I were to implement the pwrseq framework that would be able
>>>> to assign the relevant pwrseq data to the consumer based on the actual
>>>> regulators and not abstract bt-pwrseq or wlan-pwrseq properties - would
>>>> that fly with you?
>>>>
>>>
>>> Why do you need to make up this intermediate/fake "PMU" thing? The
>>> regulators are reference counted already.
>>>
>>
>> Dmitry insists that for QCA6490 we *do* need to implement a proper
>> power sequencing with delays between enabling WLAN and BT GPIOs.
>>
>> See: https://lore.kernel.org/netdev/CAA8EJpqyK=pkjEofWV595tp29vjkCeWKYr-KOJh_hBiBbkVBew@mail.gmail.com/
>>
> 
> I had not seen that comment before, would have been excellent to include
> in your "problem description".
> 
>> Even though the regulators are reference counted, this is not enough.
>> Dmitry tried to implement a power sequencing framework some time ago
>> but the main complaint was that explicit properties like bt-pwrseq are
>> not a right fit for DT as they don't represent hardware. We still need
>> to centralize the control over the shared resources though but what I
>> want to propose is doing that with a more realistic representation of
>> HW and just reusing phandle connections between DT nodes to retrieve
>> the correct pwrseq struct in the driver. But this is implementation
>> detail and before I want to clear the HW representation with DT
>> maintainers.
>>
> 
> In my view Dmitry had at least one proposal, that was rejected, where he
> represented the qca6390 package as a thing in DeviceTree.
> 
>> Dmitry is also correct in pointing out that It's also simply an
>> incorrect representation of what is on the board as the PMU is a
>> discrete module, has its inputs and outputs, even though they're
>> inside the package.
>>
> 
> I'm not sure what you're trying to say here. There's no "PMU module" on
> the board, it's a block within the QCA6390. But perhaps that's what
> you're also saying?

While the board does not have, the board schematics have it, e.g. RB5.
Also QCA datasheet (at least the one on RB5) describes relationships
between the external supplies, feeding PMU in my understanding, and
internal supplies, coming from PMU to specific blocks.

Best regards,
Krzysztof


