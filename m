Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6914E4AA5FC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Feb 2022 03:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234950AbiBECnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 21:43:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbiBECns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 21:43:48 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D80C061347
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 18:43:46 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id d18-20020a9d51d2000000b005a09728a8c2so6503488oth.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 18:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ptR9arcgsxsyCBHT5svh2CJp+R1460e5VL52+gvh4sY=;
        b=iBWC0rDndMbAJeR7VoG1YfMyeH5uEtF6kNG1xDmR9IPm0ImGhINjF5GuREsuf36yTo
         k85S0GlwMXhBb6TtmfsU4wSvjqG/h7UCMO7NItqQrHCLmAXYu/KrvEISsdHBhOMsmW8P
         LPP3IWiYk3mGrlnkg+8Wgc6yhp/1bja5qc9Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ptR9arcgsxsyCBHT5svh2CJp+R1460e5VL52+gvh4sY=;
        b=F7ue//f6/Y5Nd4OKKF0ftdjZtdiu4sVWOcAZ1sF1cpF7y5RO5HKws1HHFBPYTX/57S
         qeSMIMwjAlOAB30Vrkm2ZaMv0+KTsLU7oxSqm+Q1zzNeNQgLGaBQbuZ/yBqo8Pg8enH7
         ae4YmpBeW3YA3AOIIeY4yDWyHGpktUYkMs86ohs5JcEM4NLmjcdfUkG9efmctAfunNYW
         rhb0eWeduuggmLuFPpUjg+UYBYdbPf0TNUe2bOySEmMvtsCGwRC1ZqifPjh2NhihcWFD
         FQpy6js4ZWCLMn7tqPFw4/1ejNYk/UAJLHTNqGhV+5IeaTVpKuQWsveXfL5y/86pn9eI
         qwzw==
X-Gm-Message-State: AOAM532UleYHdxEf11ZWuHCw4XlIM5LahM58qOHo4HOMeNdhZ8c48R4y
        pwPFdoURQva/8Az360ni7Fxirl4yWKVE7kK0lpFGOQ==
X-Google-Smtp-Source: ABdhPJyJl7J0DMcwsErnsAZ2e6quUEfYM4CAsNNLCnhFVIsc+VDuH7t47yMKxkQ316BIMkPyEJu0huVO3XOQxkaUfoA=
X-Received: by 2002:a9d:6f06:: with SMTP id n6mr637882otq.159.1644029025712;
 Fri, 04 Feb 2022 18:43:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 5 Feb 2022 02:43:45 +0000
MIME-Version: 1.0
In-Reply-To: <20220202053207.14256-1-tdas@codeaurora.org>
References: <20220202053207.14256-1-tdas@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Sat, 5 Feb 2022 02:43:45 +0000
Message-ID: <CAE-0n52zypP5Uhikbk01ZrMRoXyLKBv9wgjX6uRYD0iCOeqJag@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio
 clock controllers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2022-02-01 21:32:07)
> Add the low pass audio clock controller device nodes.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
