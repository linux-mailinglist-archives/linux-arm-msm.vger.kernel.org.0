Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0067ACCCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 00:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbjIXWxG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 18:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbjIXWxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 18:53:05 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9B510B
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:52:58 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-59f7f46b326so6893257b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695595977; x=1696200777; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RS3xD+hLJBCpSA21+g/xd7etHLQLdvhWyKWTwsdi+Ys=;
        b=ZgBcvNTUhP1hpHAEKIFoatn/4BaYNRg3dWmK/Yn7uQBYcRbKTXDIkOiLiTyXe9U9K9
         n7lj0qnjy/OMz1qodlO4icHJOn+7Isp632yS1uDvXPw513qnNjKJxQoWkRKhnC4iN8M7
         XiUFMh7w/UctyQ5EMVrO74MVyPTDD2PuGej5QwXA2YxLWbP/HsTUecxS3fUGA/lvzlHa
         LXSHq7G2qfC2QnkleXuaafb2R7p62drkuh0FWyPKM8trtAB1uQ47x2ZmwR339BW2AkEi
         M2gmWA3uKQYN+uJyWRkqMXHMt4XcUk8mGVsn85PVhjVK/MiCslNZKxrgxz3dej++mxiQ
         t80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695595977; x=1696200777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RS3xD+hLJBCpSA21+g/xd7etHLQLdvhWyKWTwsdi+Ys=;
        b=QACUUUkbJFADKFgIf7cx70Knitu/+UC8avWn595H47X+HOMxNfqzF7RI8gEjNViSyg
         JRsxn+CaubOx8NJqvbmWWSAEgVoevAtyVaw3gUEFvcZfhc32rqfvCptWtXBUHze5HI+K
         91vAfBgkvYupXVBPs7IQYB0XnGdHHYai5qm2x4bAlvH4j2KpRAiCUWPA2G5Rh+tuusHa
         iNGtTeYLvgD9S3Uqn1g7gMw4AyL4ucAu1NxmrOem385cI8ggGaQouC9DNpSbykTOXVf4
         ujjWJeDHsJoPY5RJxDMKFSIwn/asqo0RibuVsh5vCgkcWY7ihv7uJ6S4OtvA92rAEM/E
         ia1A==
X-Gm-Message-State: AOJu0YzgfYAhaNfNj2kMVuFPR0ZKcBEII3wsV0bjqK+bOXztbHG1R+IJ
        MayyaHIiXQfqh7wqnYpbrbFFTFrwO74PwrsDwRi45oD+or7oGBkOfXrLSw==
X-Google-Smtp-Source: AGHT+IFUG+J6Ni1QrEn8tKGwp9fgqdY/HoTprD4Oql5fcXylygPKDAR6X6koHLVe++ySWBf9o11/f8lR3ldAmce81mw=
X-Received: by 2002:a05:690c:2fc3:b0:59f:4c52:2f5d with SMTP id
 ex3-20020a05690c2fc300b0059f4c522f5dmr4199644ywb.2.1695595977476; Sun, 24 Sep
 2023 15:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230924183914.51414-1-krzysztof.kozlowski@linaro.org> <20230924183914.51414-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230924183914.51414-2-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 25 Sep 2023 01:52:46 +0300
Message-ID: <CAA8EJpqNON+TLxBodMhr0ZzKavNoaJi3RDrhic+UaDo8nnS9fA@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/4] ARM: dts: qcom: apq8060: drop incorrect regulator-type
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
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

On Sun, 24 Sept 2023 at 21:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> regulator-fixed does not have a "regulator-type" property:
>
>   qcom-apq8060-dragonboard.dtb: regulator-fixed: Unevaluated properties are not allowed ('regulator-type' was unexpected)
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
