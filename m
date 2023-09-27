Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1287B02C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 13:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbjI0LZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 07:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbjI0LZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 07:25:37 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02926191
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 04:25:36 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d89491dab33so5646234276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 04:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695813935; x=1696418735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3rhUxDhJJabCNT5gEkEeaWHHhWLJbXNmm+8HO9FQ4ko=;
        b=X6Ud8EgdVTAdF1HL9SLk5O/x+IwiM7iIYWRK72d1GA7Adr4UuTxxBI/MPpVZAZ6MK+
         dIDubhb+VpYKYZbMg2NthTVEoo81w7+yoz/tMzT8YSe9y+bZDKFpeaXAjlP71UVilLOc
         IttMKybidSbUYAiOixUUmXa3u9+FiuzvgozHdsiZsgEBitDcYfyRQmwdno/BzC9oGYX1
         BES0ApENr4v3dnDnoUjT0fGNQM9HQwEkuS3xEs6GpcplCXYooFwPrX6qqCt1m8a+AMlE
         vBR20HqtfHONTqaoPD90DnQcsjodP2Fg3iiv046t/nLfVBECfd6e8JYWLfS/T0l09GLY
         3syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695813935; x=1696418735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rhUxDhJJabCNT5gEkEeaWHHhWLJbXNmm+8HO9FQ4ko=;
        b=D/5ZsyQFIHbqj/9271BQhdnvYF5C7rzXN9JxxDdLO+WNyTcU4f/0/ssdsS6s/Ixid/
         ngSe3vodJYbZ4ivGpLVW4jevCrNgF7PejHROqhUu6NwiGKY8GgmXQ9Md2eO67agp7DGu
         WmQUIKoHa7RnB9ffVOA8hCzX0VyHfI79cXVcu2wvRc8p99dkGdNa7M71hNVx/ShbIRBV
         5dRdvf6anaRJPZC0SXpS33YTASvVGg7Xff9q/GfrONGCRt74PPtg0pE/QndrL0qwOk8/
         XmdYoQH1c06BQofggQx+HQSUOOrLsumVSYseTiEgHqBYbG5jg6MuJ4dv1N/MC/f1Hc0G
         Ebqw==
X-Gm-Message-State: AOJu0YxNTXszhFRYnUgSaqGFsBxl3abYnymXu69jlusFlrzRHQ4HN2Ql
        pV4+RzodQz25PzYQJo+/7UbbzeLTTFwMZpPi+xAKNuoyf+gmpqzI
X-Google-Smtp-Source: AGHT+IEfgCCehiTmQ4WyCrzk+BL3JJu9a61KOY5KmvRc6K1x2XARsd+PgCX0jR5XTG9og2VdbvlhCVCECen6zvUCL9A=
X-Received: by 2002:a25:c754:0:b0:d0a:a1fa:b8e4 with SMTP id
 w81-20020a25c754000000b00d0aa1fab8e4mr1855377ybe.38.1695813935109; Wed, 27
 Sep 2023 04:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230916175952.178611-1-danila@jiaxyga.com>
In-Reply-To: <20230916175952.178611-1-danila@jiaxyga.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 27 Sep 2023 13:24:59 +0200
Message-ID: <CAPDyKFoogvK5STo51VVyQhrZZ=3V8piMtHm=E+YeLm_pidt+vA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pmdomain: qcom: rpmhpd: Add support for SM7150
To:     Danila Tikhonov <danila@jiaxyga.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
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

On Sat, 16 Sept 2023 at 19:59, Danila Tikhonov <danila@jiaxyga.com> wrote:
>
> This series adds RPMH support for Qualcomm SM7150 SoC.
>
> Changes in v2:
> - Use generic RPMh PD indexes.
> - Link to v1:
> https://lore.kernel.org/all/20230915182054.113839-1-danila@jiaxyga.com/
>
> Danila Tikhonov (2):
>   dt-bindings: power: qcom,rpmpd: Add SM7150
>   pmdomain: qcom: rpmhpd: Add support for SM7150 rpmh clocks
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml  |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                 | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>

Applied for next, thanks!

Kind regards
Uffe
