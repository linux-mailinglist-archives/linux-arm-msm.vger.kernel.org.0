Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01A6B67C5AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 09:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjAZIYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 03:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjAZIYD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 03:24:03 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909C94FAE7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 00:24:01 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id kt14so3109253ejc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 00:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVwMEPbXkbzt4NAZBAhNTCsMxl1XIt6vqYOdx4ByhSc=;
        b=kHLa8nhubocQnIw1lPa+Y75mJp1pyjlO+tAa1tkgDUKom6b7lvk0ugV/CFvhxci70S
         IXPyC7Hz/HemRFFWYK4LFm36oaEfdkb43sXABvwesRxt1iqwsjafIfRb0ab6aKuDld6R
         vftbeaQJ+T27ygXaKxM5+z9NUuqCUH5dc9udhg5jKzc/CfMtM2gD1/pJRqx2/Dpw+y4x
         BV9b2eJA7LkO0YkV/8nZ02OXpGzXCJOOJwN+AZF5SnX1lX1RiGp2Y1fV8FNeNAO8xFnq
         QHSmzpLf5yqxs8Zi5Yhnd51/mEfj+KZe5K49B5JxmtRNLrjvKc2ahVItGLKsWEzzLxHI
         2nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVwMEPbXkbzt4NAZBAhNTCsMxl1XIt6vqYOdx4ByhSc=;
        b=ciYiuOQ+iKtQSnKZs70gUCgeycyDFYxpm54g3BjsD3py4skv/YGRJFCfMUGNL5BW9M
         uFUnm3AfInjgb54clxcXJtHIt+jttP5MhjUrgOb+AAUCBS9A8Yzyk+A8/+/1z/z9W6Om
         SJa5Uvph0ouHbALAOTOgwS5dGcMyDxvjkZLVqkG/5xeq1k1LLzz6WBqZKrATXGSzZBHR
         /NK0ZCYhsaWCOJTlmJMYcfuGmTKpNXCgqhZRdWmrSuvabcf8K6GVne07qJPfG4dkkTE3
         G/Ri4YZhWrDqOrn3sJMadlbRzhFcYPBEKbng7t72JhUrkl8r7jNXZ1QZuuzdSjePD/9E
         u4vg==
X-Gm-Message-State: AFqh2kpSB8bNh5qucStuBf/pBun7rEzkaE6AFYJYTHyFVhRvPPdqolpA
        YHR3pRhaMq/VIeuwNUuZYRe9gg==
X-Google-Smtp-Source: AMrXdXtoL6ijVRRJV3bH8RnPu4JPF+x9waczF0ZkH4KVPQoA3bCT/MyVxVSZX8hWuAe5kwH1Fleasg==
X-Received: by 2002:a17:906:b299:b0:86e:a013:c26f with SMTP id q25-20020a170906b29900b0086ea013c26fmr36702869ejz.19.1674721440150;
        Thu, 26 Jan 2023 00:24:00 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0086ffe8a00fdsm243185ejg.84.2023.01.26.00.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:23:59 -0800 (PST)
Message-ID: <fa68b44c-0725-48ef-8b0d-ed06ee4c6541@linaro.org>
Date:   Thu, 26 Jan 2023 10:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 06/12] clk: qcom: gcc-apq8084: use parent_hws/_data
 instead of parent_names
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
 <20230111060402.1168726-7-dmitry.baryshkov@linaro.org>
 <0d7a6821e1825c18db4f6a2efd5bdfde.sboyd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0d7a6821e1825c18db4f6a2efd5bdfde.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/01/2023 23:49, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-01-10 22:03:56)
>> Convert the clock driver to specify parent data rather than parent
>> names, to actually bind using 'clock-names' specified in the DTS rather
>> than global clock names. Use parent_hws where possible to refer parent
>> clocks directly, skipping the lookup.
>>
>> Note, the system names for xo clocks were changed from "xo" to
>> "xo_board" to follow the example of other platforms. This switches the
>> clocks to use DT-provided "xo_board" clock instead of manually
>> registered "xo" clock and allows us to drop qcom_cc_register_board_clk()
>> call from the driver at some point.
> 
> Should probably also mention that using the firmware path will mean the
> RPM control of XO could be involved and so suspend may no longer achieve
> XO shutdown or it will stop working. In case bisect lands here we'll
> know from the commit text that this likely broke power management.

As you've seen from the DT changes, this series is a pure rework, no 
switching to RPM's XO clock.

> 
>>
>> In the same way change the looked up system "sleep_clk_src" clock to
>> "sleep_clk", which is registered from DT.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

-- 
With best wishes
Dmitry

