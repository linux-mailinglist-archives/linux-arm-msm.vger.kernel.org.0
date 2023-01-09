Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5907662844
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 15:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjAIOSt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 09:18:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjAIOSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 09:18:48 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E900164B4
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 06:18:46 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4c24993965eso108085837b3.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 06:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq/zsLtOxvUpilNzkZm53DLhGTnecoKgp9xef0ifk6A=;
        b=f9g2fxJH+nlBKifMDoOpaEo7JhFa/zmFsblORNMzG4fLvnfWT3f7UxnpMetzjcZyLC
         BgcA0Ls+UbYBs22fjAlMfiRFO1uPXD2A9mKDT0LJSCFZUschkEcSMBgLS/HwHLWUaJ3b
         pWqHIFreVg1K/e4HKk7/uIdHLyyCTiLBhf4ppbqD99jOKMyIvhJsqBGixFVsRWQS5kbn
         6apuvNj2k3gFa8VZnoMY68HHJ8gfBnToJ9uvGmbNv2yLEMJWUmlijOAC4jJ8U6qV621t
         TWoJMWFec6Q4C0ewIVHu5hVlnT1xq9Y4YCpOV3HOIKKvccRCyxX/hyTXct2vIhlFQCD/
         Ol7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cq/zsLtOxvUpilNzkZm53DLhGTnecoKgp9xef0ifk6A=;
        b=L1wsvgWPLlWXH7g8POd8Qx/fMcaG6+W4SJbq0VPhVpMN780WUZMcW+gYwgRFijN5eI
         489cGz8AQ8sGqAVuR1uoXg6FSw5bhqfOyQdO5LLy2twqZM9aoi0oV6ozs9EaAes7u0w/
         lGQteGMdD8nNM+Xbr7eF+qcktZn8TkY5bsR+h6/5QRY8M50ePTQBFYpbU/TZTS6bQLt1
         fhJXBpxwU7Z+AY12ux1y5UIirjrP6vLL0iVX9gLsBTBSFmpDyEbIAgHOpJbcG0+VcXTU
         qxuCbtw8EyeTZ/QpBEs4Rk6wSOKYvgBOYzwONKiKH1S7jkahSlWW/CP/ndkvqmgTDQ9S
         l7hg==
X-Gm-Message-State: AFqh2kqWdkVn3MGrRt2GnYHziMYvBh1iaeQT9f8MtunpeDDlwAoikaFh
        a3IQEatHLPfMNVdKBdFh+D1WSnU99QOirjge/6yPvQ==
X-Google-Smtp-Source: AMrXdXvZALTukqFMVUU9iMepmp1dDXQlhGDNQL65hRRRgn4hLCn5jfD+jwcXYqtGNKvKuKxbo6DIiBsmemMNl/Ctxx4=
X-Received: by 2002:a81:484c:0:b0:36a:de9d:825e with SMTP id
 v73-20020a81484c000000b0036ade9d825emr1509416ywa.477.1673273925453; Mon, 09
 Jan 2023 06:18:45 -0800 (PST)
MIME-Version: 1.0
References: <20221114-narmstrong-sm8550-upstream-spmi-v2-0-b839bf2d558a@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v2-0-b839bf2d558a@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 15:18:34 +0100
Message-ID: <CACRpkdby3KTakQXnmkSYsu3HreSYx9zhP0nWKQU3KOtmunA3Ew@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] qcom: add support for SPMI PMICs found on SM8550 platforms
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
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

On Fri, Nov 18, 2022 at 9:24 AM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

>       dt-bindings: pinctrl: qcom,pmic-gpio: document pm8550, pm8550b, pm8550ve, pm8550vs, pmk8550 & pmr735d
>       pinctrl: qcom: spmi-gpio: add support for pm8550 & pmr735d gpio control

These two patches applied to the pinctrl tree!

Yours,
Linus Walleij
