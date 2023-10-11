Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABAD07C5B27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 20:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbjJKSUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 14:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbjJKSUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 14:20:08 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9682A94
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 11:20:06 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7ac4c3666so1667437b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 11:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697048406; x=1697653206; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/JGcSKg2l3kPMqygix6rwTD+Mo3CQavgi0LGq8Bh/Wk=;
        b=pY1qUOyxKu8vS37dVQzkIHQ2R/+X7fPG3offu6exOmtyVnAH49eyb6cOwrhAphQKuS
         WPFkZaESpt8Ei+Y7VcxRbii3wPV9sRhyFd2ByOWkXx6eziyrWk+8Hxw2S1VvzblKj6yh
         gGSudcImT0yj9qZiDx+sIbYWMAiId91M1FT1HnBozR6qAkY9nBM6HKkoSL/VPwOVNU96
         A5EgukhtbWx33ocQ7A/dyjgNLNOZdTQgGhDVia4ZHu3ncJ3K8Vd/wwkftCGrtywtm3Cw
         os61Cg6aS/zYrTxOXoqtOuiggzesZePM56h1mqIPzPY1fndyhDr7LoBggCvovK9ZAIdI
         LrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697048406; x=1697653206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JGcSKg2l3kPMqygix6rwTD+Mo3CQavgi0LGq8Bh/Wk=;
        b=RLt+3/p6qsHE4SwFhu+S4sANLOeREUX9uiUC9s15BwYXMux9ZVnHkoawC51fz9WkkC
         ZQoT2ds5jatcNRuRJaW28gMASfZ81NeDOg3Yuxb5tMsZi8+vf6wiBRX2MzbaIECcUpXp
         FrtzOs0BRHLUjiLNiTnyF8Cw7UzHt+UQtNAKdrO05cXQxWmm2a5ug2c7ResIh63hKorl
         82hQm+CbgCK02VljalLDaz8XEl1SThSqLssN2IgSLBcV82ff8i0YAa+24UgCR/lZ+bVH
         AQKg8fVEmnKmgl7PS1855Z91vPMHRSCb6v1G2ab8DSHGPNAhjIjvImxw0uMS28Wu/AtZ
         M3sA==
X-Gm-Message-State: AOJu0YyJUHkMwSaJL2SqawpwD63mKBDb64hDvFBJ/EeD7ZCQa1RQw1BS
        2XHvVXdvPskC5pymLMZHQaMjPLIaj4zFqohnnnR1bA==
X-Google-Smtp-Source: AGHT+IEPs2KKEsTpfPnTbGZKibXu8BySXACq2P2NXAPCOtWj6cnAtMkDIuxRTY/loz5JISVAmNDkdtyrmjKM7KVREco=
X-Received: by 2002:a81:4314:0:b0:5a7:aa54:42b1 with SMTP id
 q20-20020a814314000000b005a7aa5442b1mr7992527ywa.28.1697048405767; Wed, 11
 Oct 2023 11:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
 <20230827115033.935089-9-dmitry.baryshkov@linaro.org> <20231011154935.GA785564-robh@kernel.org>
In-Reply-To: <20231011154935.GA785564-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 11 Oct 2023 21:19:54 +0300
Message-ID: <CAA8EJpqf4Q7wh657==C45Ka8YmmyopkCQnyEFcXkaoRwnCRZLQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/23] soc: qcom: Add driver for Qualcomm Krait L2
 cache scaling
To:     Rob Herring <robh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 11 Oct 2023 at 18:49, Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Aug 27, 2023 at 02:50:18PM +0300, Dmitry Baryshkov wrote:
> > Add a simple driver that handles scaling of L2 frequency and voltages.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> [...]
>
> > +static const struct of_device_id krait_l2_match_table[] = {
> > +     { .compatible = "qcom,krait-l2-cache" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, krait_l2_match_table);
> > +
> > +static struct platform_driver krait_l2_driver = {
> > +     .probe = krait_l2_probe,
> > +     .remove = krait_l2_remove,
> > +     .driver = {
> > +             .name = "qcom-krait-l2",
> > +             .of_match_table = krait_l2_match_table,
> > +             .sync_state = icc_sync_state,
> > +     },
> > +};
>
> As I mentioned in the other thread, cache devices already have a struct
> device. Specifically, they have a struct device (no subclass) on the
> cpu_subsys bus type. So there should be no need for a platform device
> and second struct device.
>
> See drivers/acpi/processor_driver.c for an example. Or grep any use of
> "cpu_subsys".

Most likely you mean drivers/base/cacheinfo.c. I saw this code, I
don't think it makes a good fit here. The cacheinfo devices provide
information only, they are not tied to DT nodes in any way. cpu_subsys
doesn't provide a way to match drivers with subsys devices in the
non-ACPI case, etc. Moreover, the whole cacheinfo subsys is
non-existing on arm32, there is no cacheinfo implementation there,
thanks to the overall variety of architectures.

Thus said, I don't think cacheinfo makes a good fit for the case of
scaling L2 cache.

-- 
With best wishes
Dmitry
