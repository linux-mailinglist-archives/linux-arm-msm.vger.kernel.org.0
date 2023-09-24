Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0EF87ACCC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 00:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjIXWwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 18:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjIXWwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 18:52:33 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3FA100
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:52:26 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59bbdb435bfso61682317b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695595945; x=1696200745; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wqePdKs4FSnXt7oeFVHQEm26iZNJhC0uyofhDbrUr/o=;
        b=Du2COnuMlmkuok1bgVTzEciYoZXTM2lO1i+lpr26zcLpfI/7FIzHSgBFH0rINZsipJ
         a9aRbh0WSK1pW0j+5v5eWheny093ItAtLJZrRAz0fNkDTg8XStvbQwm+33IfOgF7FEB4
         BAodzr1Yv4UyU1yxVle9ZNl2FBl14trs17wicIbIgZfFt+MNfjFwJXnkZzoSukU0PExH
         Ab7k2vz6u/HonZMzVcXf2OzJ81SMBz3AyVgCpQb/DXQudeVMVtGfAylWauMU6JZpGIPd
         q8HDanKNu7jtLCoBPpGrv4o63EFxD7GB3cwCewSC/mE/86aKIn49bcxEzahrREakm3SQ
         maAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695595945; x=1696200745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqePdKs4FSnXt7oeFVHQEm26iZNJhC0uyofhDbrUr/o=;
        b=O0/tbe36Cj/yMY0Dca6Z3CFY7vN1vA/iTQkJUdzkjELyXOV18E8fzg9oaFRNxofBSQ
         p+NHXlnfk14DueB4nBeSLajB8qPeLVW7jKvxPJMkZGYDl8QVuLc9/rVH8QcVK7rNLoTe
         oluRj29XFDVzDg8ftOwi8UKscecITcAWL34JyyWELGX1JKTKw+I+CrmT0jz9CllVm8hS
         dMDtsHAtLlvFyYX11hpnrcxjclWxv08x3u9HrMIZPytbqnf4R4F3/WKpyBrVHGreqWvs
         L0fjBD26JtM4V/em9tc+DqshqN4D/T/y5ZqeBagH3W/ppykz0BNFLpN79eC0QrIp7v5O
         w4fA==
X-Gm-Message-State: AOJu0Yxl/+JHlWk1l8gogs1YFxdhl6xOGhK0OedRM9Acr2pitQqrQPIy
        Tmvcz2HchyoFd6zQguR2K9m1jVNQmISEJGZ9JfUQMg==
X-Google-Smtp-Source: AGHT+IHmkOeW1EDSC36M8rpNz9cZRruORxhAmZUq0TCAXthzcxqv9L1+CneWfLH9vYiKedpBtnBvpPDfGCqf9V6ljDg=
X-Received: by 2002:a81:4f92:0:b0:59b:ec11:7734 with SMTP id
 d140-20020a814f92000000b0059bec117734mr5038823ywb.39.1695595945493; Sun, 24
 Sep 2023 15:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230924183335.49961-1-krzysztof.kozlowski@linaro.org> <20230924183335.49961-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230924183335.49961-2-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 25 Sep 2023 01:52:14 +0300
Message-ID: <CAA8EJprSKGLgPgGcNxPud3gp=zhSCOaB+8mp0s1Jc7XqpDZ6kQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] ARM: dts: qcom: sdx65: fix SDHCI clocks order
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 24 Sept 2023 at 21:33, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Bindings expect clocks to be in different order:
>
>   qcom-sdx65-mtp.dtb: mmc@8804000: clock-names:0: 'iface' was expected
>   qcom-sdx65-mtp.dtb: mmc@8804000: clock-names:1: 'core' was expected
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
