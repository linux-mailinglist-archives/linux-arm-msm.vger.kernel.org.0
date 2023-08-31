Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE5E378EC12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 13:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244089AbjHaLcc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Aug 2023 07:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235708AbjHaLcc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Aug 2023 07:32:32 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EADFCF3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Aug 2023 04:32:29 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d7b66b5641eso464270276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Aug 2023 04:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693481548; x=1694086348; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Y4Cq/IHdVsRZWccJ+nEpibfReLfGO5CUKhv7KNNEEs=;
        b=r22IQQCEFtQcbJRHBCq5qEcauLLGwMO++3wX21yyE8QrruYLJ2o5hdnH6eYCbDaH6J
         Lm7/PFLFfckGz+upSVnz3h6l9DwrWIEMMO2rLLzZU1vjBNJ2HF9nII3t0JvFTHsY3bEI
         yXXS07bojLRSxMlPSKr7E/zxvwJ8cRKB2ODJ5wEf+ntLb90dnz3zvs3YqZdQ1Aq6xcNc
         72LTT3v1RXqZQZIZf0jUUXqrrQkqggN7TBssKGpzvGYDc2iipFnEYxCxohNs39ONx/Mf
         ORL9L58hFjfyPS6dEYKjdyxQBBWnxhAL+tlBP1LAaerW4GOxyNniBLv44khEOKROGj5Z
         9Gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693481548; x=1694086348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Y4Cq/IHdVsRZWccJ+nEpibfReLfGO5CUKhv7KNNEEs=;
        b=DIrIaQsxwoL2W2YCjrfGTWe+ic+DJ3CBAXSMFrH7KdTAVKmx+Qg36c16S5dmn/QNDX
         wVYA4b2azNfOcT3s6aDMFzp1/A6xJksFfDI+qsWW5As2M6Nf2PyQqXqSwwAWJlcWV7I/
         Lx7m/EXmaUBE/maJ+Cr6A5EGKwsqRqTfLUYiPO1b3tO3wgIjOLRjaG0lNeVD6NT1SUjs
         OwZT+qpUeyGNFSdhLKJNQMBRvYn/KXT1siFFOsKpzCa+RoPEbirVt7ssXMp+wxdKDZlh
         +O8adl1vLxrnr72VKvI/JasIiLqUmFjnDD+Cm7+ZWCGu1SB6Ogt5ae1fdLIlIOJ6cWAi
         6s1w==
X-Gm-Message-State: AOJu0Yye9uVYZDfPDC/WzXP2KZKE7JNV98BVOewZN5uadfzZzcuFQJD8
        N4YRBzdpubIhNWymUk+e5NC1fGf6rXgQw17JSDQNHAXLHQTPIU6a/oY=
X-Google-Smtp-Source: AGHT+IGmZkwOv9/T3myqmvLQt+2FQYaNTQx2vhwnosm5z0c5JuszozfA/F3Oh1I0GuscrvpOIc2G/zJJoa5FiM3GqoA=
X-Received: by 2002:a25:b8b:0:b0:c73:e6b5:c452 with SMTP id
 133-20020a250b8b000000b00c73e6b5c452mr4431574ybl.2.1693481548627; Thu, 31 Aug
 2023 04:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230830-topic-rpmbusclocks8996gcc-v1-1-9e99bedcdc3b@linaro.org>
In-Reply-To: <20230830-topic-rpmbusclocks8996gcc-v1-1-9e99bedcdc3b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 14:32:17 +0300
Message-ID: <CAA8EJprupMJY7xKq4qO_+vBsrtBDvEPr+HEZqc2S+o0B1tQsWg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-msm8996: Remove RPM bus clocks
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Aug 2023 at 12:39, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> The GCC driver contains clocks that are owned (meaning configured and
> scaled) by the RPM core.
>
> Remove them from Linux to stop interjecting the RPM's logic.
>
> Fixes: b1e010c0730a ("clk: qcom: Add MSM8996 Global Clock Control (GCC) driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Evolution of:
> https://lore.kernel.org/linux-arm-msm/20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org/
> ---
>  drivers/clk/qcom/gcc-msm8996.c | 237 +----------------------------------------
>  1 file changed, 5 insertions(+), 232 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
