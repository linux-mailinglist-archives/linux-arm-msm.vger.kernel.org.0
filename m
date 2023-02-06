Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C45268BB1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 12:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbjBFLQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 06:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjBFLQy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 06:16:54 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE4A1F902
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 03:16:53 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id d132so13969342ybb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 03:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OhxKDPJ6pOym9wJrPSDn71eM4IFziSGMQNizjmAwcs0=;
        b=yngQCW1XtBSRUvg+eDFMSrevq+9xgT2G5jqyq/sC8i4HPEnHF24+rnzVRnFIwaNe/W
         aEmOjz/Wy75oXttuYRgMizxCxwzWMchOHiEBHc+zWKTW1v/kuFCTUg3rmSb8a9yMFsdA
         lbGEAoyW+Pk2oR8BFf3SOQLH5vlLpbgDNC3OwNfWOIJvZ/jUlYkWJV46md5cjj/hfv9l
         5vjSB8g7Me/FAvwo4WU2A/xpt0HPS5KX9o4z9Ug8H/ybFRav/napMo+2HxV9YrIqXSBv
         vzKoEmZD7KpE4dse7MB4z3inU1jYMwH2rS0nIy4SsC07+BZLgnlhYJdujDUtya7IgH5h
         4q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhxKDPJ6pOym9wJrPSDn71eM4IFziSGMQNizjmAwcs0=;
        b=hQQSN4mbKopJpNuaL4wbsJsQNpIzje5s4L/1ImIJoecBW0b0VTDcqeHXwT9E7kzZV4
         MtGjRMbrdKxUl79xaGu4Y9uYxQ780refefhofg0U6kITvQ306A2nGI1hWWZVOYXKk7xZ
         EfkEARm2rLcN+OaImU75kqyPuucYGeM/zmJjTDd3djVQOPQ/S+NqmHt2E3aDV8HKiGXO
         2jqJnPYnLtrqA/L4Zwlq7V2wQovs68+hcwH2P4r4a1UPcRakRFITqI6YV+CExwNty9T6
         9M/pIzLlTWqW+UxAZ7l8MD9UjWfZA+oZQWMxuEQkWdz5n10QqsZfCr8tz3zDNDEnH4u+
         ErXQ==
X-Gm-Message-State: AO0yUKWmdbtMappEJ4XYwBhtBuJKldQLQ411cyCzRoj5gvl8yL9gUWui
        mlsRLSi334zz8C2HmOjpNJDe2DT29ww6d8fKHkQJlQ==
X-Google-Smtp-Source: AK7set9tqy6b4zeUvwk2evpXxc5HvlqRofYrPkB2gfafiAdMKqcOGqZWzzw4GxME18lt7NUusauYGgG1H/IM+65HYms=
X-Received: by 2002:a5b:ecf:0:b0:89b:fd9e:81a4 with SMTP id
 a15-20020a5b0ecf000000b0089bfd9e81a4mr278952ybs.341.1675682212686; Mon, 06
 Feb 2023 03:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20230203174645.597053-1-krzysztof.kozlowski@linaro.org> <20230203174645.597053-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203174645.597053-2-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Feb 2023 12:16:41 +0100
Message-ID: <CACRpkdaCnFScB2PKsVCC8w4uTgyL6eKuh5DSgrr3DxqEE51qAg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: pinctrl-sm8550-lpass-lpi: add SM8550 LPASS
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Feb 3, 2023 at 6:46 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add druver for pin controller in Low Power Audio SubSystem (LPASS).  The
> driver is similar to SM8450 LPASS pin controller, with differences in
> few pin groups (qua_mi2s -> i2s0).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

Yours,
Linus Walleij
