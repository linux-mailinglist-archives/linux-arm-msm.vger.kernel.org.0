Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD656490BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 21:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiLJUyd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 15:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiLJUya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 15:54:30 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CD417067
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:54:28 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id s11so9487489ybe.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q16cxr3s5Ib/3QCtLbMCElaACH8JgEzemBLFcm7MiOY=;
        b=R7AKYZndABWJMDjQgvNBO5XgFt85b6LX7zTVDJMZsdueHvaM+Z135Q1XPrHodiM2He
         MoisOf/uej3tuCrxds1VVXgZUfv+Zsr+8qUU5pZfgDFTzmtvyZdG0MjGg8x1PKFkAUBI
         0MQeqI3t1694tpSlNEgAIQIRHMOhvgxLZg2pE/tDFuju9CMuV2Je18n8RJIWAJm95tUO
         kDAZfMfk2qaV1HlMAYERx41LZ1LyDJNPAYF5tKfkzeCAFnAQLdUnq+IjXfTSYbgQufM2
         NOptWSc+ja72x5n7+7N9AkvsNqfa5deh7gFQao7PIXNUogBqPT3+vbIVE2NYHyR8fPFh
         UrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q16cxr3s5Ib/3QCtLbMCElaACH8JgEzemBLFcm7MiOY=;
        b=Obu/fEwCoN29RJeriKlGHmMEIS93QphkCU66lgv9/0Wo+as35NIwj7zKutpwxMF11J
         NsWegDyldBzXXmURv5H1MUfGiKazcTFhmeyU1lGUJDb0rJg3oSGil1nO+D6NzmKOb7sm
         YLhMaEy8aL9oSyRJlvoLi4+YpaMk31VBEYzj9u5cLa/T+oQkxC1KkuLSpdoS4w7tduyc
         3HEosGS3QxspuAHf8pc9PxK/WStDTtgwWjO/Fqhz2niOHn5REhOi3EE1gGKBycQFMHym
         0DJAWcogq/E9r3SfgPUSR4ek2OQIN1sfDJ0HvQ7Fa8YrKRYtKZPlImC/YDF66ObHUsbw
         VfRg==
X-Gm-Message-State: ANoB5pmKtSodsEc82hwRT/KlS0JYfe6o2uyAYH/NQcOZkFKA9H01ofJu
        EHeC4oePz5FWWWeL0iYI/t265+ubp75syQmXe6qn7A==
X-Google-Smtp-Source: AA0mqf44ulwHZCa6/pZ9L/2X+QF6ko7HvjIj/me7Y25mH3+MX+Gpz6y6Sw/vv0/48I8yKLLFWHcXUZ3+TTtMDLEtJzI=
X-Received: by 2002:a25:4dd7:0:b0:6f1:535f:2f38 with SMTP id
 a206-20020a254dd7000000b006f1535f2f38mr65304962ybb.153.1670705667741; Sat, 10
 Dec 2022 12:54:27 -0800 (PST)
MIME-Version: 1.0
References: <20221210200353.418391-1-konrad.dybcio@linaro.org> <20221210200353.418391-5-konrad.dybcio@linaro.org>
In-Reply-To: <20221210200353.418391-5-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 10 Dec 2022 23:54:17 +0300
Message-ID: <CAA8EJppJoc8bCOgFjiWagbiVOF3RCFWmEEYObcErv26bfeuM9Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] interconnect: qcom: rpm: Use _optional func for
 provider clocks
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org, Georgi Djakov <djakov@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 10 Dec 2022 at 23:04, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> It turned out that - very unfortunately - msm8996 needs a binding
> update, adding 2 more clocks to the A2NoC node. Use the _optional
> variant of devm_clk_get to make sure old DTs will still probe with
> newer versions of the driver.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
