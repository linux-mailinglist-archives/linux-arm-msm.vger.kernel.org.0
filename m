Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD577B7C14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 11:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241788AbjJDJ1d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Oct 2023 05:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbjJDJ1c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Oct 2023 05:27:32 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90D8B7
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Oct 2023 02:27:27 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3248aa5cf4eso1911159f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Oct 2023 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696411646; x=1697016446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQWwY35qHhpEyqqvsyb/9Z5p3stIxyOj1T15ZqiCbz8=;
        b=bmVPK/Oer362hpFR8QmFKX1vSGq3wE4YrHYWiI1Dacul8eGLhzM1Zr3u5TBcQJDw1x
         4MP+VDfof1dX03w5wSPxSjmh4Oul6PDStStAdAMTX883ITRINCGDgynOeYWFj7MR6i51
         Go+crStHE23yWTbLzrp2mOYirr2lYKwAAIfa1agir30sZNtkK75QwX70TuHvASHzY6Mu
         5OYGsosM+07RFNO+YHTG/t2ygW2ZwriSXQoHNameGRW5Qhl+3tvvSx48a1wsFw4UVNfm
         eBUJIA+6HpEDo8yutwyuSklZhNRRAeTNWfuK8LHbav+7GMGyxPDf8tTvb2wMq9nsddhL
         q72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696411646; x=1697016446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQWwY35qHhpEyqqvsyb/9Z5p3stIxyOj1T15ZqiCbz8=;
        b=WQllUBhbON81vAGprlxXN9LvaOrqynU2U9+zdRoU+tKAawGh4yJhPKsp9zzc3SLnMk
         Xd89GMIxXzMjQB/PK1KdntBtRYGWnC4a3HfVlszKbBtGMjlUChQsr2pNoa+t9AVOzPvM
         gcF+2QHHQ46mOftZrfSMooptveXxCiMOUODwuw7pXkdOzSwsR0F08qLIkGdGds2EMQnj
         80ADOoVoFmWQqGQy3ILzxLFIZUBedRFUJLsV/G7jxszQ3yBK8cbzK0jt4NdxIdiKo91y
         tNjTWWBwhZB+fN/oGE8grfFGZSQKbexpmJlbSik8ZJ9wZYw6W3eD2gafiTHESk5YX3TK
         dB5A==
X-Gm-Message-State: AOJu0Yyd6iut6CJI4waTet4wyBsxsQnWy00iQK5fFyTq4Z/52QU4UUWq
        VDMJjKmYLpFO8d/LrOppsyPAyGdq8bRN8WukWVbJ1A==
X-Google-Smtp-Source: AGHT+IHDGjJWuvF9ybIHG+gJMqgzkYqVEZwXvDym/uLQ5V/maejxNFygps5q3rl7zG8Fs1nDOmYDnw==
X-Received: by 2002:a5d:470a:0:b0:321:4ab6:9b28 with SMTP id y10-20020a5d470a000000b003214ab69b28mr1447071wrq.16.1696411646062;
        Wed, 04 Oct 2023 02:27:26 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p5-20020adfcc85000000b0031f300a4c26sm3517825wrj.93.2023.10.04.02.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 02:27:25 -0700 (PDT)
Message-ID: <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
Date:   Wed, 4 Oct 2023 10:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2023 01:31, Dmitry Baryshkov wrote:
> clk_rcg2_shared_ops implements support for the case of the RCG which
> must not be completely turned off. However its design has one major
> drawback: it doesn't allow us to properly implement the is_enabled
> callback, which causes different kinds of misbehaviour from the CCF.
> 
> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> switched off (and shared most of the implementation with
> clk_rcg2_shared_ops). The major difference is that it requires that the
> parent map doesn't conain the safe (parked) clock source. Instead if the
> CFG_REG register points to the safe source, the clock is considered to
> be disabled.

Why not have a new bit in .flags ?

Instead of lying about the clock being off, mark the clock as "parked", 
or "safe parked" or whatever term we choose for it ?

I feel 'disabled' should mean disabled and 'enabled' should me enabled 
when I read a value from debugfs and if we are parking a clock it should 
have a clear means of being flagged as a clock that should be parked.

An example. I recently inherited some autogenerated code for camcc on 
sc8280xp.

One of the clocks is marked as CLK_IS_CRITICAL by the autogen code 
meaning "never switch off" but CLK_IS_CRITICAL stops the camcc driver 
from doing runtime pm_ops to power collapse.

The solution I have is to remove CLK_IS_CRITICAL and to hard-code in 
probe() the clock to always on.

But if we had a CLK_DISABLE_SAFE_PARK flag - then not just for rcg but 
for branch clocks we could differentiate away from hard-coded always on 
in probe...

?

---
bod
