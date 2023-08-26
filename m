Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D698E7896F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 15:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbjHZNnU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 09:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232706AbjHZNnS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 09:43:18 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C1C2115
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 06:43:16 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d746ea563f9so1789040276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 06:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693057395; x=1693662195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQjPQncEhFfHNzBdVkIuccPrrLI6I2i5ji4GfF/HXGA=;
        b=QvvEjqaW5NGoyt/76vLwvsGtmjlx8KRWvOgu7djTaLs6HVjP2bQ+y3O3rXiBpHB4ND
         dufr+C03tyf8LoHVBkNhQ1cVnJ3cJkmbNZVbZphZAXpMe7nxFVleet9nv3WWH4jM+zzo
         cBvZOg4a8FaVSXj+xNrzs9sQV9lWpcDi8jpFHVhJa2e+/iMfVB42m7f6TmEuD43fqtP4
         fjSG47UagO4++sROhcVl+7zAainIDKnkmhT9LG0L76XU6ueySYYWbDfhn01/Lqa5sJpj
         vyhK9TN90NcJ9+BeW7sNg9EDFuTxqSA/rXKG0IFwKhFj8o0d8BCAIG7srFElkpy3YCeD
         4Htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693057395; x=1693662195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQjPQncEhFfHNzBdVkIuccPrrLI6I2i5ji4GfF/HXGA=;
        b=ZMtEZVyiZfcdGyDUJXwDzEtFbOHtayZRub4wsRrA0OX7VnDpkyNiP0PBZaGYBV+0Jg
         JXwM0zFcZpl/jIW4dwkKA51SqKozsvFgVkLdGuZnMg/Ok72kQ1cjdBFG6Vkus/PGGryf
         zf/fEwRJQY6gjcLrKZx5HX4cHIjL6rkJXARnAoufHs3GSBERPYSHS+0L0sM84B/VVR7T
         +2XbvwJgy/HTefI4DnkAYEEGQBNzCGdQYBbw4AMjuM0vC3jByGa+JNCfj49bPGAbHT96
         0HvE0k/M5njsVm1EgpRurlIka/dHDMN0wgEQjxxtA+yhKN3ncMrGx3JWcQPW9BedA/id
         uZ3Q==
X-Gm-Message-State: AOJu0YydYGSVs33A3rF2Kh7ENvGYVm2wH8642O9LAULwJDI8gYgeiWS+
        04dAMIIXMsbiQTAnNlxtVizDDYpUTD4S/1rE8ruHtaPSoinwXwFA
X-Google-Smtp-Source: AGHT+IHcDC3t4yiX2xuvB5FhDZS40/AzZ3y3R7pq8UQJuwx3jDiV0nPfvPkBvp/zXSlwDRB6pfbVs/gMDuNNbBcLPK4=
X-Received: by 2002:a25:dfd4:0:b0:d05:fa02:5bf5 with SMTP id
 w203-20020a25dfd4000000b00d05fa025bf5mr23538354ybg.48.1693057395493; Sat, 26
 Aug 2023 06:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
 <20230822001349.899298-17-dmitry.baryshkov@linaro.org> <2dea943a-7a9e-4963-8ae5-6b126c750f80@linaro.org>
In-Reply-To: <2dea943a-7a9e-4963-8ae5-6b126c750f80@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 26 Aug 2023 16:43:04 +0300
Message-ID: <CAA8EJpoB6JYrFPZ7PMrVYvuwxgu6SH1zuPWG3q8Xy1J2YcCPcA@mail.gmail.com>
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

On Sat, 26 Aug 2023 at 15:08, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 22.08.2023 02:13, Dmitry Baryshkov wrote:
> > The PMIC is not a part of the SoC, so move PMIC to a separate file and
> > include it from the board files.
> >
> > Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
>
> > +                     pmic {
> Are you leaving an empty subnode here?

No. It contains 'interrupts' property (which is specific to the SoC).

-- 
With best wishes
Dmitry
