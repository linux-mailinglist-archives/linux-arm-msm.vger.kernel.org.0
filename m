Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D7E658CB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 13:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbiL2M1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 07:27:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbiL2M1k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 07:27:40 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E57B263D
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 04:27:39 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so18787923pjj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 04:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+hGkOUg+wK/FXNAA9vMwR3FDtng1n8avMahOBdivI0=;
        b=fk+T0PaTmOXzRK9XYWY2hSjeh9ewA/AnPRGtJtA5sdXcNX1Qg736psLrNk1Dx/S37c
         Ln+BtxvfFb9Czi39b/rLMQp3elaTp9dxJ9rzFIjB7tTstXgcwMpY9g/ZCfEanptuicpU
         kJQIfwnvjcD0Ececa70O9GR9U+s2Tz5HJ4w5/wfO1ec3uNLdjkkl6W6AhgWa3es/1Gi9
         2EmyXC0c3Q407PU2ZBeJ5unmA0pxRVc2dIH87MVikPRp/ddxhDF+JrlYZtPgN/g/C7bh
         G2SwpkEc0AH8Q6xpvx9GznKSJloIq4gKeHXkZWOFvcc2CYLkXKc6amplmvxHaGaySNiO
         vk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+hGkOUg+wK/FXNAA9vMwR3FDtng1n8avMahOBdivI0=;
        b=0k9YnsQ9ozfGpstMqfugDsK74lc4YytMmTqmX/fkpVCgYRIsoIjvlWeGsdd4FV7PE9
         iaUW+KfSF0vjXvkwFwOdbNX6DA5A6RWT0U5sw1XMN8Uza8SYKxDrl+Y3VQdGSrisSUFF
         elAcssMy6xia52uOkMs9hdT+UFwF56CWmKBeVWNCVUUfOIcVSwoN7c1QRoQ9GYahFrRC
         B8CrOXlykqtpj8jvo/OjhaOb+9qBYkcF+8DWYrVktQAH/Xi9YacX3IxYkya0imfMu110
         SIrUyunEn4pYvXUcfQxrR8dLz6xn3XW3JOBwdaghp1ajjxDNtFTpRF2M39soV6JjbZvd
         HxcQ==
X-Gm-Message-State: AFqh2krb7EdXIWTn2ccaYh5wWoq13gLXBJZBuOJChX+S35AQQNIvQkHu
        ZeHgUCq+RPz7xGzKxoC5+nlF4Q==
X-Google-Smtp-Source: AMrXdXtYfiTQbHvumGeWgluI8gh376S9KCxYj0ngtAa2Ugsj1FXEFBVx0jmUS1ZbGaNFN9gwtiRQWw==
X-Received: by 2002:a17:902:dad0:b0:191:3ec0:9166 with SMTP id q16-20020a170902dad000b001913ec09166mr46091427plx.6.1672316858863;
        Thu, 29 Dec 2022 04:27:38 -0800 (PST)
Received: from T480 (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g21-20020a170902d1d500b0019262dfa3ecsm11328878plb.112.2022.12.29.04.27.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Dec 2022 04:27:38 -0800 (PST)
Date:   Thu, 29 Dec 2022 20:27:30 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 13/20] thermal/drivers/tsens: Drop single-cell code
 for msm8939
Message-ID: <20221229122729.GC18875@T480>
References: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
 <20221229030106.3303205-14-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229030106.3303205-14-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 29, 2022 at 05:00:59AM +0200, Dmitry Baryshkov wrote:
> There is no dtsi file for msm8939 in the kernel sources. Drop the
> compatibility with unofficial dtsi and remove support for handling the
> single-cell calibration data on msm8939.
> 
> Cc: Shawn Guo <shawn.guo@linaro.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>

> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
