Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99AFA7D84AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 16:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345235AbjJZO1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 10:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345183AbjJZO1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 10:27:43 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 313139C
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 07:27:41 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7ac4c3666so7184307b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698330460; x=1698935260; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aq6iigylZMpfs04X5SeXZ4mtetKbM9BrbaFDGbQvE9o=;
        b=pJPL21YR8BU93jB5pWuogc/1qcxuzz4q5t5/rlQP3aw4Q27dhGRty3Fa64po7Cv3FM
         dglwvDQIA6sIaAaVJY8/d5d9yhNYYupmqnVWB/mVwY+etQ9n1yv9mhsKra0Lrad/0kWL
         5tLTaPQJNf1WymgYeKQ/nSmBUm44XbjMjQqRmZBMogVWhySoEk+ux9E0j0Jkz3Sz7w6Z
         0QsosL4RqeB24vfaESRl43AadN5IhRwFMv3L4HG7I2i7Ti3NQzb1+qqmBfJqG43OTA4K
         auhyj9DaH3O7R2Yk/CFC2ayh8MYbSWhii1tHn+YYHNANSOtgn8JCr2XQvN4Z+tlYpgx2
         iW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330460; x=1698935260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aq6iigylZMpfs04X5SeXZ4mtetKbM9BrbaFDGbQvE9o=;
        b=hjGg+kJb0D9p+v4LdMPnvAMPWWcVUWG33boAIMDK4C/MjvXTuZHk7zCplmN3Yd5Fzi
         uo+lhfP6VfWu6zJ8oUWB6cK6bliyZsTJy6CrAwSY94OqtBSPAGudUB+lbCQhtdIuKu0u
         x72pG+Y+dWNMnDhg6CJ9fDpSl1MnpW3RNW5A9UEjYVHryXj9+OLS6fL9mNIXtqAx3cO6
         NHLMg9nBDYW0HLpBx9ho2XhrJ/U2MzyZxCHKbUqlctXCh/vwxjgboaqIbTYU05c2AW3M
         a+zFR6bZzhy7MRSLnXafMz37Gxwew7x8UZFioHLzPlH8hDZaDheDViCTAuquhvAQK3Oj
         pkBA==
X-Gm-Message-State: AOJu0Yww30ai0DbSBDadPBnw5l2ngWLkjJ0rKvwkb7hOhVsaCBcb8YAz
        N64QyvajTUNBuIfQ/7unL8UnXBDi5cxXv8OJMXjSzg==
X-Google-Smtp-Source: AGHT+IF9Q38E9GYE6ICcOASuOK8JhrLJhUIH0SyBbZqI7bVwo2KRd8JC/19kmyoIdCwSgBT5tP2m9yPHgvRFJFObtLc=
X-Received: by 2002:a05:690c:dc4:b0:5a7:aa54:42b1 with SMTP id
 db4-20020a05690c0dc400b005a7aa5442b1mr23450115ywb.28.1698330460413; Thu, 26
 Oct 2023 07:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231025135943.13854-1-quic_sibis@quicinc.com>
In-Reply-To: <20231025135943.13854-1-quic_sibis@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 26 Oct 2023 16:27:04 +0200
Message-ID: <CAPDyKFow00ZDE7RkaU_gj3iLYKjubhCZX01GNyROXYE+3YjUAA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: qcom: Add power domain support for SC8380XP
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_tsoni@quicinc.com,
        neil.armstrong@linaro.org
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

On Wed, 25 Oct 2023 at 16:00, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> This series adds power domain support for the Qualcomm SC8380XP platform, aka Snapdragon X Elite.
>
> Dependencies: None
> Release Link: https://www.qualcomm.com/news/releases/2023/10/qualcomm-unleashes-snapdragon-x-elite--the-ai-super-charged-plat
>
> Abel Vesa (2):
>   dt-bindings: power: rpmpd: Add SC8380XP support
>   pmdomain: qcom: rpmhpd: Add SC8380XP power domains
>
> Sibi Sankar (1):
>   dt-bindings: power: qcom,rpmhpd: Add GMXC PD index
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                | 28 +++++++++++++++++++
>  include/dt-bindings/power/qcom,rpmhpd.h       |  1 +
>  3 files changed, 30 insertions(+)
>

Applied for next, thanks!

Kind regards
Uffe
