Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E96722BEF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 17:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbjFEPu7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 11:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbjFEPuj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 11:50:39 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C85F9
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 08:50:17 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-bacbc7a2998so5568792276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685980215; x=1688572215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/rwEbo5JSTdoMaDlmiLIrc5B4xTObKdifeh+A92pBE=;
        b=tehXU3POZZFMf6S0xCJwhCc8lbhQyW0kfHxtEmy/yPV8CjRAWwZjEKDl38RSm0vvuv
         65O+s/Qi0reXdb602murjsaUDQeMFhr9bxzJVpQXAuxtvRJ33LIjA2LobSVtUmphfc5t
         dpn6X14T8TMcAQ4vb0cZMAZgpfyPrSOsnmrb08XY3EwNupf2HPUUJAtqiGG8xqfBe0Vt
         lmcegKpDmonufWCF8lVOPj309+dKQXO9NYS+aN+N6Qi5GofT4jFT/qRmYvXgLhDNNIbL
         pOKvHRuplKHrDLKLMhCIBNv0MH/h3/Y51IxejjcNqOuUYLY3kzX/0NonGFHb5GuuYo/N
         Wj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685980215; x=1688572215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/rwEbo5JSTdoMaDlmiLIrc5B4xTObKdifeh+A92pBE=;
        b=lkWpNDIbNVxVUBRV4m1ABo+ReFaG3PfUVKIEHy0amZmPnqkRN3QAYg7MiZWGvMXfqf
         LCStWeBKWa2yGFnkmAG3u8JWMQ12P2UACzCuobAuS2F/EzyzJgVUG2ObpCI+GyorG7d2
         2f0fHW2M/2d30oYdx+jYpVLacA1Ox/I5iQ5FoPblb4uU+Qr8p/Tqi5D4k/mUUxFJgwDf
         JsvN0XMfbZRkC8x/542IoLK6ax0D0YSqQDdKZiYMdemFUx7eR+xqtUHQKIHSI+xu4qxb
         95l7TOMCoZA1d/QLGV23D8pYJPz56b/Fa7LRQghFk4lCNcY1pYw3VByGDLKPsxJlfv0l
         duWg==
X-Gm-Message-State: AC+VfDzQ7aOupIncfWuP/I0qKyq+B50mLpU6/e+5JD463R6/Lc/n4bkM
        r41MPQqk0qbW48PAQbI2fB1N9hzau4MBRJen/3Y2WA==
X-Google-Smtp-Source: ACHHUZ6MHDlIng6j4s3BtKAAZMCZm1zhShzwTWAQXnaSPZwJ4LxHLDzNz6uFTbf5FdnJFQjUWxB++bTBFfAD8DVON7Q=
X-Received: by 2002:a25:41cc:0:b0:ba8:1f85:46cd with SMTP id
 o195-20020a2541cc000000b00ba81f8546cdmr12844287yba.45.1685980215190; Mon, 05
 Jun 2023 08:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <0fbe5ddb-c3de-0724-fb69-a99e4980b26c@linaro.org> <20230605154338.GC21796@willie-the-truck>
In-Reply-To: <20230605154338.GC21796@willie-the-truck>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 5 Jun 2023 18:50:03 +0300
Message-ID: <CAA8EJpp3H9RWh_MRtEkuyWbKEsrCrSKR-40=t+fx0FS5SfjC1A@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] SM63(50|75) DPU support
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 5 Jun 2023 at 18:43, Will Deacon <will@kernel.org> wrote:
>
> On Thu, Jun 01, 2023 at 03:16:52AM +0300, Dmitry Baryshkov wrote:
> > On 23/05/2023 10:46, Konrad Dybcio wrote:
> >
> > [skipped the changelog]
> >
> > > ---
> > > Konrad Dybcio (12):
> > >        dt-bindings: display/msm: dsi-controller-main: Add SM6350
> > >        dt-bindings: display/msm: dsi-controller-main: Add SM6375
> > >        dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
> > >        dt-bindings: display/msm: Add SM6350 MDSS
> > >        dt-bindings: display/msm: Add SM6375 MDSS
> > >        drm/msm/dpu: Add SM6350 support
> > >        drm/msm: mdss: Add SM6350 support
> > >        drm/msm/dpu: Add SM6375 support
> > >        drm/msm: mdss: Add SM6375 support
> > >        iommu/arm-smmu-qcom: Sort the compatible list alphabetically
> > >        iommu/arm-smmu-qcom: Add SM6375 DPU compatible
> > >        iommu/arm-smmu-qcom: Add SM6350 DPU compatible
> >
> > As we are now nearly ready to merge this series, Will, Robin, what should be
> > the merge strategy for these three patches? Would you take them through the
> > arm-smmu/iommu tree?
>
> I'm happy to take the three IOMMU changes, but the bulk of this series is
> replated to display and GPU so I don't think it makes sense for me to take
> those.

Could you please then ack merging them through the msm-next?


-- 
With best wishes
Dmitry
