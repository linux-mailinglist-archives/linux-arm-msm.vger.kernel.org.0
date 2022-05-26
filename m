Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478B5535434
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 22:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345382AbiEZUDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 May 2022 16:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238045AbiEZUDF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 May 2022 16:03:05 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A806E6668F
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 13:03:03 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-f2ccb58ee0so3498523fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 13:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=FadbUOYQTfhqwtmXPIV4R6Iv53QsaHE17At37GAFSpI=;
        b=ECumAw/OczA+Bc4OdOqq0SzGUpO6cJZG+4ICfj1RjEdhHVePkpnT8F+XZgihYIIpJh
         wDkt3GBfrSddkPu5fhA51v881vO1jw9qtGZHJYZ5cgsHFXMoQ/NjVIWXb7t3S25XsKMM
         n4XOtCaaKACuVwDhP23Fe8wFiP4c5VqColuIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=FadbUOYQTfhqwtmXPIV4R6Iv53QsaHE17At37GAFSpI=;
        b=w6J8xTKT4ZQdbyVUzQpeBzAauhR1r2P9pNO0viItwu1tsJ/vSvZIc4ywLW6WDnsPYn
         kYMLLeJ8dqLDKbrCW0jQ2COjI0iTPi1SzVPNyP4BfOoEz/9AedeLEwIDOvm3b+fmhUBk
         BUxqOZjOJECOVWvzi8Aey6uUj5tQUcPl8aAwy7fh49jm5lCETu1aKqJsWujyLhSAhsPJ
         exym1N8/D0m0QWjUuHJiiHzgpptv5Ddiba84qZJZCOfbfRa3zJ6lfCGYW3EKso7NSomv
         QD38jBqYV4RtEmMOZ+vp27+OB7kyM17+Uic0M8/m5VicCF/fnTcdd3aAvKaZOh3qa1jW
         mSnQ==
X-Gm-Message-State: AOAM530cf9m2dfnH4b8NIETU6BRNay9h8yMLZmqvI2mlMhOSd8xU+gBm
        Gqr2rmybFlNNaX8IRZAOiLGR7IgjN2Kq+OQ6+D/ipg==
X-Google-Smtp-Source: ABdhPJyYxNK72k7Hut3zKeeRKfCsZ7QCP4bCHsBSQnD4xwgdfDbPatJObrFRzcHOU6dkskZA8r+cDO9eBA7dRpkp8h4=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr2102021oap.193.1653595382947; Thu, 26
 May 2022 13:03:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 May 2022 16:03:02 -0400
MIME-Version: 1.0
In-Reply-To: <20220523233719.1496297-1-bjorn.andersson@linaro.org>
References: <20220523233719.1496297-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 26 May 2022 16:03:02 -0400
Message-ID: <CAE-0n53SJkTLGg60BURV_3c3C_cB4JyAQx-TUe4mRXyT42G4Fg@mail.gmail.com>
Subject: Re: [PATCH] leds: qcom-lpg: Require pattern to follow documentation
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2022-05-23 16:37:19)
> The leds-trigger-pattern documentation describes how the brightness of
> the LED should transition linearly from one brightness value to the
> next, over the given delta_t.
>
> But the pattern engine in the Qualcomm LPG hardware only supports
> holding the brightness for each entry for the period.
> This subset of patterns can be represented in the leds-trigger-pattern
> by injecting zero-time transitions after each entry in the pattern,
> resulting in a pattern that pattern that can be rendered by the LPG.

s/that pattern//

>
> Rework LPG pattern interface to require these zero-time transitions, to
> make it comply with this subset of patterns and reject the patterns it
> can't render.
>
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
