Return-Path: <linux-arm-msm+bounces-13583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B2874915
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 08:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26D61F23776
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 07:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C447C6311B;
	Thu,  7 Mar 2024 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPQUEE2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B5D6310B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 07:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709797941; cv=none; b=WOg6qz7nRJc01wb7icbEkdzOdXYegOtbVQ3mbZ1WEkSDHqFK4bmymzAJrHWz5PzNmINAcqp2qjRCCwmFMxKqPWrbpKOgDA4v3KAJ/Xl0RQ7muX0MlrWz+qIiO1u2N7GICJbZm9K4ChCvLVARJ3Zd89DaQXl9H0xZIrVQb2+GUSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709797941; c=relaxed/simple;
	bh=WCPi31HjmoTJOZrDmUPR5i+OWn0Y+Pjab+ogTuUEZr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvmX/9MyQjqj9hGPHMd3gOb+gaS1WwvSM4kdMIhXQ9J4dkBF2MMKl0yg/GM6AOtuXWO9ia7F0XVIu+KsjDlubaCf8K1/7Xo5t3rxa9Pl77MK3ujQcvCAcDwBoL/iM7HZcMXUE2d2NNR+aN8tZM7loh6scc/Zx/voy22WpWfhvwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPQUEE2q; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d27184197cso6727761fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 23:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709797938; x=1710402738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CbYPVKeaIikPCUbuRtGBOHniOBHDneAcZ7ulpwXWFXY=;
        b=WPQUEE2qxCysF+7fVrR2DGf9/ViszSTZFStdoLiGruxZJYve4sN+R0Dj6pW2z91M/q
         AnoZ9W7vpRnjZ7EsvkMYMXXEqyloaAbxHznduGDm4UnIgf4ceVSD6dtfj4AZSX0TyL8s
         QSfkJYy7GRGs/rvFqFn6Ppu5IMtGc5dHqOTWFsxmgf/vB5FG8D+N9Mb395eyxHHmwMZD
         ZlFHuOP+zl+0DGYZmitH5vcqykPJJKPWFx1XsQ5qnV9+SuU/hh9nmMOAPG/NzNx4uQ3Q
         yZvMMNzat6A+nkd6/RrqryFeLiU44e8V7kaOnYDM9FMP4uEOiGCUVw9juIjhivN0+mNr
         QqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709797938; x=1710402738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CbYPVKeaIikPCUbuRtGBOHniOBHDneAcZ7ulpwXWFXY=;
        b=rn9bz+2wzJjzZtyNk1q9oCoi6ylklAvNySNo0QqZv+dt/h6emtiyWhTwpCrF0g3yhw
         azK/PZKnSbS+X+7qHwWFut4yCVMAwIbvlLvYo0wBMMXO/tuDeJCFKPibXihgRgImNujk
         b/mt20iSTktGK9TcfwLIiVRFCznE/ejRNIu8zVQo0jihNmlnsGbhf7HvYoeD8Si5mcgu
         LiCpS+/gqscWNTQk55WiMxLG6yK0JbvrrxfhXqVKIyw77Sl6eifKBorkqkrS1qQi4dVS
         N0/qCehGw0No8623vQrMiNeKQcpu1vukAKqY44AI8EvjvJErSBOkQN40lI4wgmnCIJPw
         WYug==
X-Gm-Message-State: AOJu0YwSFNFJd2o8PhXgDTA0I/FcgL/maicyTiSOItuFLL87Z+gQrWXw
	WLWTPc7rLpSbzgDL+lIdw3QVT43jInxEIOZ/d99SGLsiU90rCvhat3V4hbHRq+8=
X-Google-Smtp-Source: AGHT+IHI11C+yIqusXhaLmwy1+iOzNA3oW0q/h92eMJ5vERCt1YWHKoCb13PQFSTRIMHNo6xix9qCA==
X-Received: by 2002:a2e:2c17:0:b0:2d3:ba52:f87e with SMTP id s23-20020a2e2c17000000b002d3ba52f87emr771681ljs.0.1709797938062;
        Wed, 06 Mar 2024 23:52:18 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id ew5-20020a056402538500b005667a11b951sm7746135edb.86.2024.03.06.23.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 23:52:17 -0800 (PST)
Message-ID: <2e093b47-27fb-4a5a-9e0a-d29d09185a92@linaro.org>
Date: Thu, 7 Mar 2024 08:52:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] bindings: clock: qcom: Add "qcom,adsp-skip-pll"
 property
Content-Language: en-US
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-2-quic_tdas@quicinc.com>
 <568c26db-45c4-4a62-9504-738d78007802@linaro.org>
 <91741024-b1f1-404a-a1aa-bc1a0d684ba0@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <91741024-b1f1-404a-a1aa-bc1a0d684ba0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2024 07:53, Taniya Das wrote:
> Thanks for your review Krzysztof.
> 
> On 2/8/2024 1:45 PM, Krzysztof Kozlowski wrote:
>> On 08/02/2024 07:28, Taniya Das wrote:
>>> When remoteproc is used to boot the LPASS the ADSP PLL should not be
>>> configured from the high level OS. Thus add support for property to
>>> avoid configuring the LPASS PLL.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>
>> You nicely bypassed all my filters.
>>
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>> your patch is touching.
>>
> 
> My bad, I will update the commit subject.
> 
>> Anyway, I don't understand point of this commit. Aren't you now
>> duplicating qcom,adsp-pil-mode?
> 
> No, the expectation with pil-mode was still certain level of 
> configuration from HLOS LPASS clock drivers. But on the QCM6490 boards 
> these clocks need to be completely reserved except the resets.

Sounds like qcom,adsp-pil-mode or qcom,controlled-remotely or one of
others. Stop inventing 10 properties describing similar case, one for
each binding.

Best regards,
Krzysztof


