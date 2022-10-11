Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C46EE5FB3FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 15:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiJKN7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 09:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiJKN7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 09:59:20 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8D27B2B1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 06:59:18 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id f14so8983128qvo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YVyCU1GyrgH/o8lcSvAoAfWW/XK1pu5VGWnGETyseE=;
        b=mI4TFQLi0+TZmxLnwmkbsVFlVqUMsPyDpOEOH83Eb4KcFWutHMNhymkYm1YlA3LGo0
         mXKEb2EkGw20UZraBrUBizSDkm07hhzT2JfCPhVDW14KiyX2WOqRHXZqiYoljcPUbndu
         lH0lIXFkpXfQn6o8wx7Nn9LRfISPcfHEYqbGBKHUOqDvQDLxbqOwhX0aZJmTsFA780iJ
         sxwdvQpugzzUKnsTTOIxJFqED2gwD7kB/zP4Ftyx/LI3yIEaTBYMVIntOFRqavfJ+Vah
         5H5hOVHXXCC/zjxWWMKSPrQ7EsYgF3wa5xpAYNTqZXVE7vxtyDBkGiWu2L9FZQm1NUd4
         pEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YVyCU1GyrgH/o8lcSvAoAfWW/XK1pu5VGWnGETyseE=;
        b=NPJBSin7VZyaLsBZz2/c9g2jPfJ9fmbRZpffg5PFSxuatc/QeVjlKrFomIroZkWypO
         a0AQXpSymkmpZEeCt42hUuao5cSO1jV6EaxUQF4lFAG79rrxVljUSmEhKfXiVXLIlfKC
         z+FPm3FxAGjp8aOXdnExKVSBh4tg8I6oYhcsZ5ERFwvGVbz4wlwU14S8k5I1OsEWb4GG
         cVZQoD8vXnHRYmZkYGyzNAuRBPqFN7ZPKXZmGBe5h7bjOwYLaojBCrC0t4DkyYjNaeIC
         vbuI9Vz8T7LZ7TDpq6FQwvqx9pQes1loUXl6UNl6MykWHMe+EoVrQyozi9vNyQ1Fqz9u
         7jEg==
X-Gm-Message-State: ACrzQf1PI3xGhY2opFVbziAZzkvmiFvtVdKL9gEIRcBdKpJi1+VGHwsL
        w4vFmB4iWefh244OolN5aacUMw==
X-Google-Smtp-Source: AMsMyM6MUJbFVRMNY9hUSOWI/089zqY1BN3IH3YZz20z5RhRcBMV5IifDF8pNrEArjODrrmry5bfxQ==
X-Received: by 2002:ad4:5dea:0:b0:4b2:e813:7c35 with SMTP id jn10-20020ad45dea000000b004b2e8137c35mr17933397qvb.74.1665496757499;
        Tue, 11 Oct 2022 06:59:17 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id o8-20020ac841c8000000b00398313f286dsm7424666qtm.40.2022.10.11.06.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 06:59:16 -0700 (PDT)
Message-ID: <0f5bb12f-814d-37f2-9307-b2b649aedfe3@linaro.org>
Date:   Tue, 11 Oct 2022 09:57:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Vinod Koul <vinod.koul@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Caleb Connolly <kc@postmarketos.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Johan Hovold <johan@kernel.org>
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
In-Reply-To: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 10:32, Krzysztof Kozlowski wrote:
> Hi everyone,
> 
> Quite a lot of people are working on Qualcomm DT bindings conversion
> (TXT->YAML) and fixups to Qualcomm DTS. We track a bit of this effort
> internally in Linaro, but that has many shortcomings and we would like
> to track it rather community-wide with the support and contributions
> from the community.
> 
> What to track:
> 1. Which bindings to convert to YAML,
> 2. Missing compatibles (either entirely or because of missing conversion),
> 3. `dt_binding_check` warnings (usually connected with 1-2),
> 4. `dtbs_check` warnings.
> 
> Rob's bot gives us daily output for 1-4, but how can we track current
> efforts to avoid duplication of work? Also it would allow people to find
> tasks for them to get contributions to Linux kernel :). Is anyone in
> community interested in tracking it together, in a public way?
> 
> If so, where?
> A. elinux.org (needs some formatting when pasting the output from tools)
> B. gitlab pages/wiki (maybe scripts could parse tools and create the page?)
> C. gitlab dedicated repo - some text file
> D. Linux kernel TODO file (might be difficult to keep updated)
> E. kernel.org wiki (requires LF accounts, AFAIK, a bit pain to edit; I
> have it for Exynos but I don't find it usable -
> https://exynos.wiki.kernel.org/todo_tasks)
> 
> I am leaning towards Gitlab pages because they could be quite automated
> - with CI or with scripts.

This could be looking like that - the list of missing compatibles from
Rob's tasks:
https://gitlab.com/krzkoz/linux-dt-todo/-/blob/main/todo-compatibles.rst

There is a script which will automatically add new entries to the list
(above RST file), once fed with Rob's job output. Further this could be
probably pipelined with Rob's jobs.

List anyway has to be manually updated with work in progress.

This is for the compatibles. Missing part is doing something similar for
the dtbs_check warnings.

In replies Luca, Caleb and Neil mentioned GitLab issues. That could be
useful, so if someone would like to hook into GitLab API - feel free to
work on that (either in that repo or in separate).

Best regards,
Krzysztof

