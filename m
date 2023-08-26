Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11C178971A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 16:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjHZODu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 10:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232673AbjHZODe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 10:03:34 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A56519A0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 07:03:32 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d7225259f52so1837582276.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693058610; x=1693663410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OECpJpuzRGTpFfZZ6LF8wc0zJa5pdb5ic3jVGSKw5tA=;
        b=IoOq02SqV5/YJ0l7TNDsn+czct3ySCCjTo6xDwYZo0DlVxd9MH0jaecDJyA6vTTm7q
         uN8C9RUdAONSSAzUq2H0pO7A+sqgY6krm4QTydzZZujAMILU57AA7QaTFiMbLyfzRELw
         chNCTQgjF3byPArrCWUXl2pDh4oG6TKhrOcOTXhAnXH7v7Ao+yVIagN8kEsZGEkTX+CT
         +hmSScH5hr0fcCuDiNiaXicii7qZVjfos+l/Hv11p3kr5ewrFmMYaxVQ75n4vUU/JXO5
         yHZhfQjAIYF0DoZtSsNd1VVorIfE2JNHyzjF6lHRjUTg8j3Yd2+QccXNtdVyqsqFN+qA
         AAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693058610; x=1693663410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OECpJpuzRGTpFfZZ6LF8wc0zJa5pdb5ic3jVGSKw5tA=;
        b=bI/j8ImuqSpts7WAA37dFcL/lb16kWgOircBisuPys7wlrUI4VWTX5Lzm3D92scKqj
         n40uKzewc6B/0ES8vDsyo9xUCxgg2wVVJcdUFzuXekVeeYehjsd8tgXsGhyzbOyeELGk
         BT0zofnUBfggQzvsRWv8T8027tlyEBUAHBbjyYpHq8wBiDvQ9dTed51tJEZPmMKOuX+F
         O88YoVBlHhO3k5PPEtA6NUn+jhm3ZRDBK3aDBi8nO/yKPHxNlOlGKSFVD/9HsK82hArP
         6XvNHr8rErzZn4HJ7RLXZAhA83anFeab4Go25h/SmazCHCjd3H+bmVogTo9m0hPKFdf6
         8gUQ==
X-Gm-Message-State: AOJu0Yxx51QsBFuAFODVitlP3kG4y4YoHhKvWMYdeX8qOHHDQNN/tQlV
        1kq5leLaM4AQWBdZciTlIW2Rj6ayQoimNTukbzcrmg==
X-Google-Smtp-Source: AGHT+IEOaxMx9taSxugSxzekl96KMLWldfs1IBAMMp77dpDFnRICyJmOoCJx0scz3kVVVi/oF4ptbpdLLjGOO64POUE=
X-Received: by 2002:a25:7352:0:b0:d4c:82ff:7bde with SMTP id
 o79-20020a257352000000b00d4c82ff7bdemr20094707ybc.63.1693058610193; Sat, 26
 Aug 2023 07:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
 <20230822001349.899298-17-dmitry.baryshkov@linaro.org> <2dea943a-7a9e-4963-8ae5-6b126c750f80@linaro.org>
 <CAA8EJpoB6JYrFPZ7PMrVYvuwxgu6SH1zuPWG3q8Xy1J2YcCPcA@mail.gmail.com> <aff8e42f-4861-4953-966a-c6ac735404dd@linaro.org>
In-Reply-To: <aff8e42f-4861-4953-966a-c6ac735404dd@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 26 Aug 2023 17:03:18 +0300
Message-ID: <CAA8EJpoRJwjfa1S=zqvTEQ6rJLkq_Py0KmcgQ7fYNj3986EDag@mail.gmail.com>
Subject: Re: [PATCH v3 16/32] ARM: dts: qcom: mdm9615: split PMIC to separate
 dtsi files
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
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

On Sat, 26 Aug 2023 at 16:48, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 26.08.2023 15:43, Dmitry Baryshkov wrote:
> > On Sat, 26 Aug 2023 at 15:08, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >> On 22.08.2023 02:13, Dmitry Baryshkov wrote:
> >>> The PMIC is not a part of the SoC, so move PMIC to a separate file and
> >>> include it from the board files.
> >>>
> >>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >> [...]
> >>
> >>> +                     pmic {
> >> Are you leaving an empty subnode here?
> >
> > No. It contains 'interrupts' property (which is specific to the SoC).
> Meh, that's bad design.. should have been in the controller node!

It will not be logical either. The interrupt line comes from the PMIC.

Wait. Maybe we should do it other way around: move IRQ to the _board_
file, since it is just a GPIO line. Then we don't have to leave this
band-aid in place.

> But noboyd thought about this 10y+ ago so here we are
>
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Konrad



-- 
With best wishes
Dmitry
