Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D8B7AF48C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 21:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbjIZT6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 15:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjIZT6B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 15:58:01 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F48120
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 12:57:54 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a9cd066db5so1267437766b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 12:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695758272; x=1696363072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0kSwK3PVk7H9vqR6LJUrVkOaC2Hn8PPpjAomEPL3kY=;
        b=wyQnV90dnER2pauqvwS3EVchmsVgjbxJq4kAlatt7HUkKxosEyJ5XD4hreMLMLyrQT
         8Q8hDN1b2f1vinA7cQa59H8okH9FtXRJv3qe8Hf22txPBanPYzZY0YECmfP3d/OSBzN+
         ILZnGJcOX4hpv7BG+1o1a28eG54Nrp4idiQ6eDevvabqYaEGOGnO65ZK2W52Cqtmuseo
         F+3lEMdBapqgy8VKGrkcZdc9jseHrmDcYI5itfaOTzEs7L/na4L+3xYdIUQN7meMYZzs
         9E6IjPLbbfAxgVVNgaKPep9rqQZgGXYcKqHWh4xFcMtcf5q5Yu2zETcQxBA8MMUTMKZd
         PlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695758272; x=1696363072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0kSwK3PVk7H9vqR6LJUrVkOaC2Hn8PPpjAomEPL3kY=;
        b=GGuhLAddgQaSjyxVl287raCLLrIqkkuupS7I0Zlki7riCFVZSSbHSsLPK5/96jVQc+
         zDrtMDhcTC5QWLLDZtXVUf0suOh2chrKfru1jCFp7h7cKkd50K5e5Gk5zA5BHmNzWiRP
         TB8cOMR6RZUbzipd8GVIzHxS81pOpLxDaB3yH8MkufC/Lu/ta83Ph2rUgZCx0GC3a8V8
         RT3PS6VvEUfYGlSM5GpErpV1RNGB+250A8VGOs0vvxAyjTVk7WA4k3q1K6T5xQee0y01
         BG71Th+MaphTrseWgLYPbF0a821Swqfcxr76Bt4NG0RhbO0WQ8E3h05dss1I/KBrOBHL
         FOyA==
X-Gm-Message-State: AOJu0Yz5PO/tF+8pHthrhHEunETnpUzJhkZ0lFqrN6fSo0aFxYsq9//9
        a/oS/nsuyeebrAPKaVPsBY87ag==
X-Google-Smtp-Source: AGHT+IHjbWORZPXjmDOgqu7p72QUQqNxDanzZxOQWlI3iMKFmTK9o5TkYkJYJt/utg0kDv6Sl696wg==
X-Received: by 2002:a17:907:7818:b0:9ae:654d:5105 with SMTP id la24-20020a170907781800b009ae654d5105mr10095500ejc.47.1695758272572;
        Tue, 26 Sep 2023 12:57:52 -0700 (PDT)
Received: from [192.168.33.189] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id v6-20020a170906380600b0099c53c4407dsm8109693ejc.78.2023.09.26.12.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 12:57:52 -0700 (PDT)
Message-ID: <449f8299-3694-49e9-ba18-38cb52b5f196@linaro.org>
Date:   Tue, 26 Sep 2023 21:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] arm64: dts: qcom: msm8916-samsung-serranove: Add
 sound and modem
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20230926-msm8916-modem-v1-0-398eec74bac9@gerhold.net>
 <20230926-msm8916-modem-v1-5-398eec74bac9@gerhold.net>
 <64f030ca-27e5-47c8-b0d4-5fd0d4fce9d9@linaro.org>
 <ZRMxDjVKu-kGIs5f@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZRMxDjVKu-kGIs5f@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[...]

>>>  
>>> +&sound {
>>> +	status = "okay";
>>> +	audio-routing =
>>> +		"AMIC1", "MIC BIAS External1",
>>> +		"AMIC2", "MIC BIAS Internal2",
>>> +		"AMIC3", "MIC BIAS External1";
>>> +};
>> I *think* we should be able to harmlessly enable &audio globally?
>>
> 
> What about boards that do not have/use audio at all? (see
> msm8916-ufi.dtsi). We don't even want to load the kernel modules on
> those.
Is it really an issue other than losing a few kb of memory?

> 
> IMO the SoC dtsi should always be minimal by default. This also
> guarantees that you don't run into trouble because of half- or
> incorrectly configured components during early bring-up, especially if
> you don't have serial and are hoping to get the device booting far
> enough to debug it.
Generally I'd agree, but if the audio machine driver cannot NOP
successfully without a topology configuration, that's a problem.

Konrad
