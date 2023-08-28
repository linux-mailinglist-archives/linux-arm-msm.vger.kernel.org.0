Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09DD278A94F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 11:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjH1Jvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 05:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbjH1Jv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 05:51:29 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C89811D
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 02:51:26 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d748d8cf074so5479184276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693216285; x=1693821085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij/ixhJNQiAk+bZwLk7P9bcr0ExdcnJdmk1KM+v6qMg=;
        b=TAtmfieieDUstkl2+NwLV9lHYB8MR8y86Ya+cRhD66lVUKtZ8EmNZF611vDNhycHq6
         RAG9YCGyf5KRI2LCzKpcq5N51m6B+ww//48yalTSPVEahCsIPhVk5Y7jNkx3TMAAo7hM
         GNYpIMnakzcKBQGJNk3U3pbrIfiQN2l84gFXQfxRmSgyzJXXh9o+3vFPcoPTLrlLLHjg
         RCAipHpoEmuhzZRUNUxaCz8elPO177gsFoEn4ez4AXAUpStsLMhgKReoNpT1Ygm5577d
         lvJ2MrwXuPeEijl1V1cqxfkJjUefkiisNGHGr5Th9UoOIOcgC+I6+JQtSYmsE4FPiAj+
         m5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693216285; x=1693821085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ij/ixhJNQiAk+bZwLk7P9bcr0ExdcnJdmk1KM+v6qMg=;
        b=PyE+017cGqSv8aj7+GfsBIwmelm8Nq65cdYzr2BRJhQNbjwBe8P/XEdyTRx2MfbMeJ
         pE7esRB0Ul3VAN9tNs2RJC5eivm7npRWUJcLAhT5RMAq7M4yJX03LH4RC3SXCxmfJH7M
         KqtEizPqXlKcQDBlgJZ9MhfMG2laVRRPzEjwmVqt2FY/GbChyj+STFbNMDsS8WzNxRmW
         Bu37LOVLCKsi/o4qcwgxFsUoVQVdsCeQbveAqFUlcDsvce5uYuWLh80npQd5mLbwoysL
         pGMv5s31jm4kEP0p3zdTJi3AuAbUm//kmYcn0UwOy/qEYB69fXfJd1XRHaAXHwMJk4JX
         rVFQ==
X-Gm-Message-State: AOJu0YyLsEO3zi3sAxVSJjKrrwoiue8CzFkpcGnuUTyao5fOyrcoiN6L
        bwQvJXMHVoNM4lG998kHO1Y2I6v+BVsyO5aHpMkdQw==
X-Google-Smtp-Source: AGHT+IHMMPGzXX2cW5IcOCKq4arQnF2HZdkyJNgtpKLsJixMwGCtJEqpnV0q+I1Fh+mNln2paZJzihB9mbHFdSX6FLc=
X-Received: by 2002:a25:ac19:0:b0:d60:b5f2:9824 with SMTP id
 w25-20020a25ac19000000b00d60b5f29824mr23015952ybi.23.1693216285191; Mon, 28
 Aug 2023 02:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230827032803.934819-1-dmitry.baryshkov@linaro.org> <ccd35516-04e4-4e24-82cb-8502d4694e8b@linaro.org>
In-Reply-To: <ccd35516-04e4-4e24-82cb-8502d4694e8b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 28 Aug 2023 12:51:14 +0300
Message-ID: <CAA8EJpo2HppmyaYtWPxsvpwm4RX+kXQa=3WbByvOpmv7SQah3Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] cpufreq: qcom-nvmem: support apq8064 cpufreq scaling
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 28 Aug 2023 at 12:43, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 27.08.2023 05:27, Dmitry Baryshkov wrote:
> > This is a split of APQ8064 cpufreq series, as requested by Viresh. This
> > series includes only opp and cpufreq parts, with the DT and soc parts
> > being split to a separate patchset.
> >
> > Each core has independent power and frequency control. Additionally the
> > L2 cache is scaled to follow the CPU frequencies (failure to do so
> > results in strange semi-random crashes).
> >
> > Core voltage is controlled through the SAW2 devices, one for each core.
> > The L2 has two regulators, vdd-mem and vdd-dig.
> >
> No changelog?

Missed it while performing the split.

Changes since v3:
- Unrolled loops in krait_l2_config_regulators() (Konrad)

-- 
With best wishes
Dmitry
