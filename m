Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B846A84FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 16:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjCBPOZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 10:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjCBPOW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 10:14:22 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F0825274
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 07:14:21 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id i6so3863971ybu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 07:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i9qMDgluQ/cZqemfQqN+zkisdC/D/UT8rYvJMo/g8vQ=;
        b=gse/Q2qYVdsWIHsneCUj75fKAvWwlha7XCN7Lv+IqCDcORt/SNVn+WdyRwGo9HRKWa
         M/JTshQifXO+q10VJ4SG1ipkLDZ50iI4p1nsyzUEIxY2f5W7kOgrkcjJQl1ojq1Gq8MW
         gPDZjzRk9Lf/baxCDxS360rXfYznTQuHoU/SC/WYr2SVs5+Mugh2v7wtBQnKuo6CGAUH
         7DADx2lxEIuz92bU3JysQsQ7d+BYGprXywwO4+ipAcFEfPIfSH1ck1Hx022mq1vnKZ02
         Dj6lkBBCo+FWjp0DC37kwKi8/wmyUjXEAlgExogR7BH+G5GiTDBjb2+9ijKzdyCn3loj
         bnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9qMDgluQ/cZqemfQqN+zkisdC/D/UT8rYvJMo/g8vQ=;
        b=X6npdNEAa3Hq9Ey95gsNOKsljY+CH60hLBBAdHZfDwCuv8zgKKn7Tk5uSJEG+zGPKu
         VRvWfORf3dISZAiDyDhy4xmkWld9qWZ0BxKLhxqs+a+aC9Xvn99aAyZHpv3ODgcvO7Ro
         tRzqDlqCAir4lmv9yJZV+VbErdyT7qBEv9eBBQaWaZ/E4Az3Lk1HpdrIIAAynDeD+CBv
         f/LGnKI7pOCPSJkGonckmdo+OlSDtKfxJUvpuK546fM5ZvclqdbRsnqwrfje7RHLPV/l
         A539XBm4/CsVT/mjhYG3W39HXl9miAhISMTqN4hLWWZiHrUmQIhrtMdgK87Nn5b8wH8F
         E7Jg==
X-Gm-Message-State: AO0yUKXSQJDQfl1ddGGDkmOqhJ5lqm+U2+w4xSE7cZEJbl0gzpkPeNj4
        R70Zg1aoyJip4ijhUKfN8zLNYp6ia5GxgCHjUzQx4A==
X-Google-Smtp-Source: AK7set+FGGX80FAbGl6Gz+M3hmtr4hLGC4c5SSXvjFM1vVp178zHsOU3Qz77GkmNoTps02GebJxu/s3qCKoJNXL+Jlc=
X-Received: by 2002:a25:9b86:0:b0:a8a:a652:2a69 with SMTP id
 v6-20020a259b86000000b00a8aa6522a69mr4544525ybo.10.1677770060764; Thu, 02 Mar
 2023 07:14:20 -0800 (PST)
MIME-Version: 1.0
References: <b9cc99c3-7dd3-6a57-b67c-e9e0ddd60a49@linaro.org>
In-Reply-To: <b9cc99c3-7dd3-6a57-b67c-e9e0ddd60a49@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Mar 2023 17:14:10 +0200
Message-ID: <CAA8EJpoDustJL5ua-cVW1DZcknSfbtudPaGNZeH1v2aFmhzoKg@mail.gmail.com>
Subject: Re: [bug report] regulator-fixed-domain can't sleep
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
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

Hello,

On Thu, 2 Mar 2023 at 15:43, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Hello,
>
> I've noticed that regulator-fixed-domain sets the performance state of the
> attached genpd to 0 correctly, but will never actually let the power domain
> it's attached to enter idle, as it has no PM ops. I was trying to come up
> with a good set of PM ops, but I'm not sure what PM ops for a regulator
> should look like.

I think the regulator-fixed-domain should not be used, it has been
replaced with using power-domains directly. I think we should remove
it now.

>
> Konrad



-- 
With best wishes
Dmitry
