Return-Path: <linux-arm-msm+bounces-170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C80B7E5306
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 11:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 775491C20AF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 10:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DE31095F;
	Wed,  8 Nov 2023 10:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oWFkTutF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524B31094F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 10:06:20 +0000 (UTC)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FA11726
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 02:06:19 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7789577b53fso434430185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Nov 2023 02:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699437979; x=1700042779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rr7gS752VmDAnEEC2uCNu6BHcbWN9XZEmhatGiJJf1A=;
        b=oWFkTutFxvQq6N86TQjSF5P/JEESnp0OXvRK+kS4lbEIQcoNBum9JQT1+l2DHKmYc7
         iUlY8QqpuWk1bst4hsNbgFo0fNVfuzdDW56NZXL64Fr1nm5lKANcKOtQe58/RH6sILIn
         x5d3rQExSc3wvwzteygysIb3M8sD6IYUAQmSMCZIWPWUrsWq4Tol/vws/KkumnGhphOw
         dsaEI9GUW5kpykmWu/F69yrVUlVcb1r+nfxni1T1VS251ioWmZa5k+PfAfaxPjx1Nfia
         rvC0JjQnyEmo9WPfCz/vuRF92bbKABSc+8B2SmoJz2jpkBVa0VeSSa+8zo2x28ONVJKm
         YYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699437979; x=1700042779;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rr7gS752VmDAnEEC2uCNu6BHcbWN9XZEmhatGiJJf1A=;
        b=NfHt5CmQfc3j5pcjdDlSBQvp7zHlXnMy6XxILdQeeM0gdmgZPztu499j/5AnPM+8PQ
         Kh3lITjWF0EEQAbmko7zybxX6ObwjUyjkBtvkYleTC5/Q0+WW1eqQfKLb7tMihIMAiPh
         8/5DV0GcGxkUKjnQMoVlvL9zf8jx7ai7zugxEoqlJSsmRyB9opKZXSd5dn3qVpiuvRlG
         LWizuCbr8OkQmUu5qhgx+GGjGM291eC1pcXYOg/knrHZIjwPpRF8eZh/moHuQuElJUmh
         Yo/MMRVw5HCsaziwWTlLR+ZudiixFyzW2mPnlxnpWBAR8VlApdZtarmyjCBpuDKER4wW
         Lx5g==
X-Gm-Message-State: AOJu0YxlP8M+OCrTXP9nnfeD+5x6RPq6FrMXxzNEXXnwqsmCBlk4AY2p
	ZmeoEOOIJ1SuVu7rQmRqcZAYqg==
X-Google-Smtp-Source: AGHT+IGx7lgqtx9S/oyIp/5xMeMdu5UbG0dUZcFvMTcnc6s3J0nohJbZResltcIJRIscBeM3h7M0qQ==
X-Received: by 2002:a05:620a:4055:b0:77b:9a8c:b0b5 with SMTP id i21-20020a05620a405500b0077b9a8cb0b5mr1278087qko.57.1699437978763;
        Wed, 08 Nov 2023 02:06:18 -0800 (PST)
Received: from [172.30.205.23] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w2-20020a05620a0e8200b007789a3499casm858664qkm.115.2023.11.08.02.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 02:06:18 -0800 (PST)
Message-ID: <8f7db00f-aae0-43d9-bd6a-47374a91d546@linaro.org>
Date: Wed, 8 Nov 2023 11:06:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: Add LPG LED device description
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_huliu@quicinc.com
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_fenglinw@quicinc.com, quic_uchheda@quicinc.com, kamalw@qti.qualcomm.com
References: <20231108-qcom_leds-v1-1-c3e1c8572cb0@quicinc.com>
 <CAA8EJpogiYXVPCNXSu+kq29nbn1uxGDAYMn9+qk8CwDz0bfyjg@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpogiYXVPCNXSu+kq29nbn1uxGDAYMn9+qk8CwDz0bfyjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/8/23 07:59, Dmitry Baryshkov wrote:
> On Wed, 8 Nov 2023 at 08:05, Hui Liu via B4 Relay
> <devnull+quic_huliu.quicinc.com@kernel.org> wrote:
>>
>> From: Hui Liu <quic_huliu@quicinc.com>
>>
>> Add LPG LED device description.
> 
> No. You are not adding "LPG LED device description". You are adding
> definition for three LEDs.
> 
>>
>> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
>> ---
Aside from Dmitry's valid comments, the subject is wrong.

ARM points to arch/arm/ (arm32) and you're missing the name of
the file that you're modifying. Check the git log for that file
to get a grasp of it.

Konrad

