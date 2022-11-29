Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 255B963C797
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 19:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236226AbiK2S5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 13:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236296AbiK2S4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 13:56:45 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CDF68C6D
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 10:56:20 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id c1so23461859lfi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 10:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PBCgjAiK04IrCUOE9G7u0BiUPXBGDsDlbQIwI9V4K7I=;
        b=qvPNXvQ8mIOkgMit1jOXIEGp+9D6AyhCZwYFZW+vUm4D+mfdpwIJHQ0Y6BIaWRCm6a
         4g6uT/PtBTkrPebCOI1di3aZc047awsFSg9En23R3hHcCA+zCSYjt1Ofy/lNUK/5ZFx/
         oDe/AZCn3muCQ6e4qJbUnx0B+YqhVOAqwgpHWhAn6fgC3btduHb+4E+h49I8p0RGmMD0
         2CNoDKW6GChvPUk4KGgu0uRhH5pRTDRcwZ4/6iGyFwCZo8Z2fV2NBiVhvRKByBl7y1nG
         Osa8pDvV4M6je7VkWEnQmlIEc2VC0YdAhulURtbudk/qoarWBiOgHy/ArxuBiNPAI+Ml
         PKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBCgjAiK04IrCUOE9G7u0BiUPXBGDsDlbQIwI9V4K7I=;
        b=TrdRdZQmz7LQq0BC4NlpX/34uwckLed9CcpfbBO8KChBpWyfokcCPD0XJ95V9z6hzY
         2l052kRVbG1eT7givSjkhmMQdAcGZ/B0CQyU0czOvOpiHNzDGLLtEzuIGWVSXJpJyLfo
         KMeQNd44xnUsMwGa8Q+BPyok6aXYbuPNj2b0Ehv3ExOZO44tI55jM0BiR0pvG0Ti8Nuo
         Z43PaVskhwrr8szmQjQzZ/P5qKABCNj3/PvWv1onhkm7sKbyZccZ7J6ZVhJA1l2LSQs1
         RvC9R42tutbmU2LnB/vQECCe+ORFYeS7ruhiEOSIGTx9mRBJyYhLjNWreSFG9pRFnR9o
         nvAQ==
X-Gm-Message-State: ANoB5pmE3MYSX9q8zoju2fDb50TMZqo7Eqnh6V/lEIV1jLnhjBIBmyjB
        U2L0PT9/YY5AMN7F3o7MyAwfopdJzSfCnqVzmKJmQQ==
X-Google-Smtp-Source: AA0mqf4kWEf92W8sf08ba2plrUdzCvVW44+8ePjCefWcLRT+llNZCInV7JsXkcg6KhMH8q7tS/tQWafeweU02OnrVEw=
X-Received: by 2002:a19:7b1c:0:b0:4a2:701c:f252 with SMTP id
 w28-20020a197b1c000000b004a2701cf252mr18758852lfc.125.1669748178063; Tue, 29
 Nov 2022 10:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20221127195418.1506876-1-bhupesh.sharma@linaro.org>
 <20221127195418.1506876-2-bhupesh.sharma@linaro.org> <d294edf4-9df3-5958-5a12-0f93bc74f28f@linaro.org>
In-Reply-To: <d294edf4-9df3-5958-5a12-0f93bc74f28f@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 30 Nov 2022 00:26:06 +0530
Message-ID: <CAH=2Ntwc7TvXZf8MLCwmkzzbnmPayKfdcX2dFZL_r2Q9vGmX5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Add SM4250 APCS compatible
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     jassisinghbrar@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
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

On Mon, 28 Nov 2022 at 14:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/11/2022 20:54, Bhupesh Sharma wrote:
> > Add compatible for the Qualcomm SM4250 APCS block.
> >
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>
> There is no need to store the regular CC list (coming from automated
> output - get_maintainer.pl) in the Git history. Store it under ---.

Got it. Will keep in mind for future patches.
Thanks for the review.

Regards,
Bhupesh

> > Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
>
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>
