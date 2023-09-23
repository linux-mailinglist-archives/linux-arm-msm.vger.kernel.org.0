Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5E997AC4BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Sep 2023 21:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjIWTQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Sep 2023 15:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjIWTQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Sep 2023 15:16:58 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874A6FB
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:16:51 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-59e88a28b98so61976477b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695496611; x=1696101411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UVcs6WaBObvyPdVxt4a5ep98U8wpHctaEIsm3KAKh80=;
        b=J6VcQkqQc2z9FtFHX4tE0jeBVeL8wBkqFXLesQhydNyG3xjNWeQpKSpAZmkDprEZIt
         8yKF6B3bXrG4yr5TCHRRbVbnm+xd/KAQ1qr8GMvcT+ForXPvAra3mm8nKOA6EY8ZcxCL
         V79x5bSt0gr6kn5wEe2hj+6aAaYfzhJFvD6N1aaUY0swTjrqyD31iUeHw7izc5pHTwyi
         KEAbmB19do8DFfqTdsvmB0L4J3BrZa59fGnOM7sDjZQjNg+O6BR4QMsi70lgScOmTCol
         JxQ41++h9EiHeSDGoDpMdPBrWk4jdJ2xHgmRoOTPnlML7jzBA35POHrEP+uLDQ48c9XM
         DwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695496611; x=1696101411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVcs6WaBObvyPdVxt4a5ep98U8wpHctaEIsm3KAKh80=;
        b=YDHC0nu7srhrrpjtTIoQBHV0TTiTSLWMvl+sCm2vxTAl/NYU8yHdHzjjDoO4XjJxgQ
         oh37SwTcz/FYuOtGf2/b5V5nyuix2yqPUiYf28cCEFqjiUWxBbLLkDqX/fAOe86I1Har
         DaYyKn+MRcY2Zfux+k+yG8IvE0YjkkWGBiw+7mSxKhLsK6WJ8cDqCWBzchhR3jHoCddU
         iL6UqrfE6liqXw3BQR4tEWNGpjJosMAW6m5BlQMh0k7FpskXHQrU7E1rSUmi9IEVmgZ2
         C7X4OyHUs4sjkZd9pk1e451cIbjEQin9cI7YTnGcJBtkiJB6OlzQdzERZew2MYRXCsk3
         tR4g==
X-Gm-Message-State: AOJu0YzPmDaPiqIRSCwSPQ7n+fGDbYJpIMBSk+ymnB0dMkTOKe8p78tD
        bD5kynxF9Oa6BQ5CvtRwkxlXFDP2xuAIzTswOMVvgA==
X-Google-Smtp-Source: AGHT+IEy0vvL/85ZN5uulULrJQv0Z1SuezWIFLtE1yQJUsfrQPn+35lk02l8OpHWlZTaEa792MHcx0f3bd7yvT6Y/GY=
X-Received: by 2002:a81:4916:0:b0:59b:e743:630 with SMTP id
 w22-20020a814916000000b0059be7430630mr4069305ywa.22.1695496610786; Sat, 23
 Sep 2023 12:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230922-db410c-adv7533-regulators-v1-1-68aba71e529b@gerhold.net>
In-Reply-To: <20230922-db410c-adv7533-regulators-v1-1-68aba71e529b@gerhold.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:16:38 +0300
Message-ID: <CAA8EJprcJmU060FojSfG0d4uWnS5vQnm-R1sNPqdvp5Qxm1Q3A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: apq8016-sbc: Add missing ADV7533 regulators
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
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

On Fri, 22 Sept 2023 at 13:50, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> Add the missing regulator supplies to the ADV7533 HDMI bridge to fix
> the following dtbs_check warnings. They are all also supplied by
> pm8916_l6 so there is no functional difference.
>
> apq8016-sbc.dtb: bridge@39: 'dvdd-supply' is a required property
> apq8016-sbc.dtb: bridge@39: 'pvdd-supply' is a required property
> apq8016-sbc.dtb: bridge@39: 'a2vdd-supply' is a required property
>         from schema display/bridge/adi,adv7533.yaml
>
> Fixes: 28546b095511 ("arm64: dts: apq8016-sbc: Add HDMI display support")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
