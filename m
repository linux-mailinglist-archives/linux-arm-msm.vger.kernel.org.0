Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A21565C39C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 17:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbjACQKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 11:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjACQKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 11:10:01 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750FD1277B
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 08:10:00 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id q2so32360528ljp.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 08:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42zZAHf1jxTjkV11A2s0BJ3xhHEnWIKWoo4gYXrvk0I=;
        b=uXkgYDGeSAi7kzEdyXXMkuc2svB79GOyFQf6YY8NM/QOAcYzXJ4tX24K/r2z1NWvYf
         i/hqrKc8nMH+OV2DhjQ1GPGMl1fb7ErXRyDOC71a5msAFCHUJ30RVEY1gAjWXxIB2mpN
         byweSug2pKUY+BFvgefoLmC/ffDN3AYlAfV/garGV1ke38xZKOJKhvwYfD5XnD27Qysn
         KQZxpDQ3GTPkgEozGj+kNp/mOn7nhKsGOv2w3+N+/b9yoHLC2DEdIgGpCMorRsk5i2Zs
         sijPZ7KAPS1+YQZl17zXmmqQ6NWBjjQuzSFfuMtlqNWsAskW1d2U3DcX5X8YDai024Ae
         ee+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42zZAHf1jxTjkV11A2s0BJ3xhHEnWIKWoo4gYXrvk0I=;
        b=jhn8l74QCGJ3JBAZDAKuX1JhYb923OPeSnfEJqtJlogpE2Geq9Ee/znmWHP6KZ/4dv
         5G3sbzP1WEZzZIOyi8OQMWkgZ97hH/5yKqW31ll8YwfGQVVe61QLH9N0CCohn/BzhvAr
         pnoBYQWzsgtNM2KKpzZWBPAkdBafE3F1N72tzM/HPlWf49PKO4PBCPnj8pNrCU91H4dh
         0JytGdRMByag1RQKd/hEMugk2RQzQN0sjmfmlKGTBpwc+Ca9EGFBlKCjmEv9i7dziE2d
         VAgkNq3FybmMC91Oyj/y4z5XnVz8pid3PBDHAN/9YIX1V1hNY63r8DcsUGADkBlYv4kC
         tAlQ==
X-Gm-Message-State: AFqh2krwI5zYTbbvk6nAALouFakWmbs59UGH8B8tHg3P3HvVWMvJLWez
        /N1aeuB/micVGvwqBia8D046oA==
X-Google-Smtp-Source: AMrXdXsezd1AuOVRPAIJpP/L2NKRk9zglMYh3vW1w7m1xoPgT2UfTlkRwg0+k62Mxc8YF7PuWZQCBQ==
X-Received: by 2002:a2e:95d9:0:b0:27f:bf70:e55c with SMTP id y25-20020a2e95d9000000b0027fbf70e55cmr8458899ljh.28.1672762198759;
        Tue, 03 Jan 2023 08:09:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q10-20020a2eb4aa000000b0027fd72dd6a1sm1528831ljm.70.2023.01.03.08.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 08:09:58 -0800 (PST)
Message-ID: <cf1f65e4-338a-c519-1401-91e13b5fd937@linaro.org>
Date:   Tue, 3 Jan 2023 18:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 05/16] dt-bindings: clock: qcom,mmcc-msm8998: drop
 core_bi_pll_test_se
Content-Language: en-GB
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
 <20221228133243.3052132-6-dmitry.baryshkov@linaro.org>
 <CAOCk7Noa1A4mBqg3OAxk3hnnUg-qjCeCE0tyhq3ktbFcETicqw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAOCk7Noa1A4mBqg3OAxk3hnnUg-qjCeCE0tyhq3ktbFcETicqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2023 17:38, Jeffrey Hugo wrote:
> On Wed, Dec 28, 2022 at 6:33 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> IMO, NACK,
> 
> This is not a valid justification.
> 
> The DT is supposed to describe the hardware, and should be complete in
> that regard.  This clock exists in the hardware, so it should be
> described.

Most of Qualcomm clock controllers can input clocks from 
core_bi_pll_test_se. But we are listing them only for a small number of 
them. And even on these platforms nobody provides this clock.

Maybe you shed some light here, what is the source of this clock? Who 
provides the clock, e.g. on msm8998 platform?

> 
> DT is supposed to be separate from Linux, that is it doesn't matter
> that Linux doesn't consume this clock.  Maybe FreeBSD does, or some
> other OS.  Linux doesn't own Device Tree any more than it owns BIOS or
> ACPI.
> 
> Also, I'm listed as a maintainer for this binding, yet this series is
> not addressed to me.  Seems like you might need to review how you are
> composing your patches.

Ack, excuse me. I missed the 'in file' maintainers.

-- 
With best wishes
Dmitry

