Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04AFA4C3713
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbiBXUyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:54:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbiBXUym (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:54:42 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116101C6EDA
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:54:12 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id a6so4913980oid.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1gjMFPbNgKd1Fc+yJ2WMlD8bStAd2QRyxEWecc3LYdo=;
        b=Y/Wvt/7a4Am55JzXa9HoEyDMYICHiIr9PkWows4PdIGunA+iguZ1KgUzNB0B5E9Wj6
         XXnQQoa5gB1Fgc84RwOs4WWy0l8SfCu5fU0lHxh6pU00e8nxwTAH/IuXN4XwmNMcB3Zw
         lPPWFXEd7KgBw8vPaE5j925HxxDCPVh24B/18Hq05zCfIYN70sNTnfn65vghO63krnNP
         DOaPNTi2nwOhfCIxeIoUx+/uI2w8nTimLgvnpp2xX8gX/mAYV3bC053g5pDayn5F22wO
         bvKbIxKoUkv8FBD0tsNrpMi3Y86J7HA9GbixQ1QqXU/jb90g2GCaPebzFzq6OGOwZPtt
         l8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1gjMFPbNgKd1Fc+yJ2WMlD8bStAd2QRyxEWecc3LYdo=;
        b=ocJtxZCz0pKqPI/GVNOTecKne/bfuDT2IJUCX0qT63js/BoxxO8qp5tg0LkkvgN/ou
         BF0GCk+wYGR4dPO05IQfoQpD65kYN36ULy0mN+ZI5UJgNttSaHAMOmOqvJAGCYMnxMzd
         LidWeqQuFv/YNzXpN/jtfyUu8eDm3i9srZKu5q9Sb2smPtRZqcbUsyUfalgFcX8i3TwY
         D0mZ+Hl9FZEX+9m/2cKM9ydZR00n6B0TgRwklhml+PL3d7jK8mIi1COtwHEfrHnP/zxo
         oWYqT4M1iHa5iOyN38VAm+2GNiWo2/3iRgWy9w5cujqFrI6BofsQ/NNi9qkz21RksYqP
         GBBA==
X-Gm-Message-State: AOAM530X6TEuG0CHd19KQWOXRbQw0GEp3ynPpySw2AsA3421tCxvgUg+
        vtdQSIC+t0xOrDWYxsNHMpAf2g==
X-Google-Smtp-Source: ABdhPJwyZw5i5quvytzLgQRMkFwcPhdAZHq7eSXE0uyLKb2AFLds0r6jS7vN7MYNsoo1mggWoWd9qw==
X-Received: by 2002:a05:6870:7994:b0:d2:cc3f:5e7 with SMTP id he20-20020a056870799400b000d2cc3f05e7mr7221024oab.77.1645736051447;
        Thu, 24 Feb 2022 12:54:11 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c8-20020a4ad788000000b0031ce69b1640sm191259oou.10.2022.02.24.12.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 12:54:10 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: mdt_loader: Fix split-firmware condition
Date:   Thu, 24 Feb 2022 14:53:58 -0600
Message-Id: <164573604161.1471031.13709791424620348092.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220215034819.1209367-1-bjorn.andersson@linaro.org>
References: <20220215034819.1209367-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Feb 2022 19:48:19 -0800, Bjorn Andersson wrote:
> The updated condition checking if a segment can be found in the loaded
> firmware blob, or need to be loaded from a separate file, incorrectly
> classifies segments that ends at the end of the loaded blob. The result
> is that the mdt loader attempts to load the segment from a separate
> file.
> 
> Correct the conditional to use the loaded segment instead.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: mdt_loader: Fix split-firmware condition
      commit: a1b019872693c74d919db4e267f451fc7af9a21c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
