Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1D247ACCC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 00:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjIXWwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 18:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbjIXWwK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 18:52:10 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7A9FC
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:52:04 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-59f4db9e11eso32244647b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695595923; x=1696200723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+rY1S32MejckevmB4vOl0liTnSxULA4HG9arqKbcPTU=;
        b=F4AY69vMMTyYJQjVe5TH1iTJaRUt5fQW9snmYWqqXYNwzlaFGNHOViE9BlSEJiw3M2
         D4ZnqBcZx+4C2dkkdEmQp8qaRh0y59vrNFCXWIqiUdNUvjyyAYkBCo++DDbp+vnesh43
         qbYkOkmY7BFJz7njz2ma3evcrUDzlI0bbGEGA+NyIOgOBKP3ueigrEKzgCMqTm8z9LEI
         w39skBbD0JX4aELKT1wAHQq/PE/BBhlvl+gLxTWu1vWpWOE87NN9zm4/3oS9etG03aL4
         E7ChH5foe0W0bkNG0/GT4QdOMwKIi7lFBKhRXkdnHCavhvFgHB2xgb8rEz4yq/8ITv7H
         RCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695595923; x=1696200723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rY1S32MejckevmB4vOl0liTnSxULA4HG9arqKbcPTU=;
        b=EibUS4s49ufh7U76zL0JZs++csVx4dO2XuMi3xasx1+0WuHWEMj385a7xpcDXK9k/O
         Gy8+o1duxP2CO5j7IkPpGmen2x4ozwrFxMK/iKvfI00KSrn9DJx0QVdNsCZ4rQ//lyP6
         a76g4NRdLOgNJoF+6IvEMWilsIwg9nwNbjt3EHxvbUAjVw/2xZTnn00LbqKQcUwNy2JC
         +Mkbf4qV90sypoSuXqCXLq9WWCSHkl6SUSnJymaKO1rtKn4WXdNTylohleOTS1xe7K6a
         dQVPSrtvA9oLup+CBmvDQjJBnSVWg2dEJ6/Y9Ualke5SIHa/Qfi3d/ptRmfAA0HHUZ59
         pxKA==
X-Gm-Message-State: AOJu0YyS65pgnVxbsfn1yisIqC7GiCMeIy9gLHnHw9ft0Ag48T21gcpL
        eHkVPd10RYc3c5LvUyh4cf4Ld9wZynilibtFrAkncw==
X-Google-Smtp-Source: AGHT+IE//14QcNNvzHI86iuLPgtPfWJRMsx6GhZKA14XzEcb7mRUZeg5DRwV2q1BRG1gXBNVIJsA5bZf0qzHBHpVo3s=
X-Received: by 2002:a0d:fbc6:0:b0:573:bb84:737c with SMTP id
 l189-20020a0dfbc6000000b00573bb84737cmr4345682ywf.26.1695595923468; Sun, 24
 Sep 2023 15:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230924183335.49961-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230924183335.49961-1-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 25 Sep 2023 01:51:52 +0300
Message-ID: <CAA8EJpo6TJkhQg9aP3B7UUFQS7nwrtsnQXLDpTTXmtSnAgTvfQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] ARM: dts: qcom: apq8064: drop label property
 from DSI
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 24 Sept 2023 at 21:33, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DSI node does not accept nor use "label" property:
>
>   qcom-apq8064-asus-nexus7-flo.dtb: dsi@4700000: Unevaluated properties are not allowed ('label' was unexpected)
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
