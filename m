Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1BEF7D54B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 17:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbjJXPI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 11:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbjJXPIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 11:08:54 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7692DD7F
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 08:08:52 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7ac4c3666so45724887b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698160131; x=1698764931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L6YEOKFZgnFFaFZTb2aWNTq5tspoBeefaSbm2PKin5I=;
        b=grWbncdaFAmgIa+rADUOXCvA1kgEps1HSgMbXt9/fZyUZJvlHbvAhYJyQrzkevsM25
         EvujKf1LibhOl7eYRA+2OLk1n8ehyJJyMzsNZa6qOjyKbLQgFxaZmNF/yqbooEKBEbPm
         nBSz0C8R4sSLtkLtAaKs5V/qHBzQ9ufULgk9fMQFgGx933mMzYUKomCwovAIjtK0GTOq
         ub/3vybhVHGoQHoB7103/mKFXztt6WCgCUtvSo0z1oU/H+orDfv/UMvRkAsjiBjZbRHr
         zil/x+6MoX6db9D4QhOJUGvmGkw2IVA+YdCIMyy9ZbkVMCndPWg8bVn45GpAdMebC1+R
         k6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698160131; x=1698764931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6YEOKFZgnFFaFZTb2aWNTq5tspoBeefaSbm2PKin5I=;
        b=wbNgKYZl5XcYy6TrGywwREyq78jlmuLV2qr0X1+7KE95eRECR+q+vkJA6mo1xqcYli
         aUesYD3mEZ98pWmNVnDl5BB4BvsnUsxvdaWr77s4NubuS9Yb1OCa0rLNeZYsRsAr6HrY
         2UX9iqlnTwrLaxFBtIcBr+AJSwWltot/7y9t0RLEIWrsvOHrfPocvzH3Hd7RiP7tLAN5
         SFnlnszSjepqeRIBBYTqt4bR3+WNmzeUxjMPz2a55Vj955nLqv6A3hX9jG5qC/zyp0fB
         LzIn4CixFilXE7JJyLZpdfYgFecGGEZvdCjwo8T2LW6P/UU4eqgyfMRL9Mvg25SBF/XE
         qmJQ==
X-Gm-Message-State: AOJu0Ywc4TFr+ottsFsJ3jgYUm80nZXdUqJrf7yujsOwh7y+z9QlFj4Z
        hG1Jxl5EcaPJUF2bMblVIpyzqAWQIqgnt1Exm0IGog==
X-Google-Smtp-Source: AGHT+IFdzxMRbfUafGldLvc0HICTqC1JOkySRW6UQmufXP4xHsBx58j8IAM3qrN6y3CJMnHbyWV5ul2UEmW+AdgnJ3I=
X-Received: by 2002:a81:4814:0:b0:5a8:e303:1db2 with SMTP id
 v20-20020a814814000000b005a8e3031db2mr13315604ywa.23.1698160131018; Tue, 24
 Oct 2023 08:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <1696440338-12561-1-git-send-email-quic_mojha@quicinc.com> <f3a4c114-b430-47ce-a746-4a840994dc58@quicinc.com>
In-Reply-To: <f3a4c114-b430-47ce-a746-4a840994dc58@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Oct 2023 18:08:39 +0300
Message-ID: <CAA8EJpr0Nnn5Tr=2CBAADYfNU6cnKuq==x5L5YQoko9C=3q2tg@mail.gmail.com>
Subject: Re: [PATCH 0/3 v7] Misc SCM changes
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        p.zabel@pengutronix.de, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
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

On Tue, 24 Oct 2023 at 16:31, Kathiravan Thirumoorthy
<quic_kathirav@quicinc.com> wrote:
>
>
> On 10/4/2023 10:55 PM, Mukesh Ojha wrote:
> > I have given version to this series as v7 as it has already
> > gone through v6 and later got added to minidump patch series
> > However, these 3 patches can go independently and has no
> > relation with minidump hence, separated it from minidump series.
>
>
> Mukesh, Can you rebase this series on top of linux-next, since there is
> a conflict?
>
>
> Bjorn, after rebase is done, will you able to pick it up for v6.7 if
> there is a time? These patches(#1  and #3) are required for the crash
> dump collection on IPQ9574 and IPQ5332 SoCs.

It is not obvious that they are fixes for the crash. You did not add
Fixes tags, you didn't follow
Documentation/process/stable-kernel-rules.rst. Cover letter is
useless. How can we guess that they are urgent / important?

-- 
With best wishes
Dmitry
