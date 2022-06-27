Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 030E955C955
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241054AbiF0UEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241006AbiF0UD6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:58 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E570A19C2E
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:57 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id l81so14334995oif.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NZ6CKfiIArqTgDMaWPbCAnT13DlxrNGDoUSwUCUYiT8=;
        b=lzZx9sY5lgcV1X5Dk6RqdM3/HLuNrj45xe8aYClnKcOe5u8mswNdUOAr2akInG5Mtk
         SKnnuvkJdiy7mNlLRvarERncRgqjDewsmXzKh4VxtrzHJ3ilwBwBxG46c3AtFqQTFTx9
         r4bf/ra8QcxkzklPmPHulZRGIUmxo/+O+13Yuv6ZgG4ADgOfxuxi6wzf0Ke811tlacOe
         zywPmUfC0CEiJd3rV6vhkyIQNnmpPAau22hFB2TUFZmc8ba7pzS0yT1qlXm03oaWQOsB
         GJEeK4pGkWjPfAMCn9x4eMZM46WN4lxYJ6zWWc02urTR5KfCiIzzZiBHVU+O67l3PgZE
         jUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NZ6CKfiIArqTgDMaWPbCAnT13DlxrNGDoUSwUCUYiT8=;
        b=tX6zrvVJyqmW2mnI1QzlWUvrzGIfQdrChntILEQIqMb5uZ2A3FDdAOMujCLkQCryY4
         emlxt6iixw2IXX5IBlctHDl9Qznrv1vx8YJGzpHGecrI4IKh0HL9vtjgzrL2JWGNWPdS
         ryKjuzsbSr0yKSLVU4M5cEpxDRUQn1gsrefhoG8OeIo6cTBN/WZxy8IKVpXcGNgEU86r
         QcDOOiMgPOCnvjcYZ8PDe1haBBSZziUcoKi0zOd5xt+GsZc7STrlgM4a1zSz+sg+GLjE
         f+484jCsjlWjcx5YZPOT2QhZ7LQQmYDeez1LOXwkrvOPuU/pZSrlypvFEgcZBWU5aBZb
         3qoA==
X-Gm-Message-State: AJIora/CucIMzGhYKttt+TZvgmdymmqlUfpPZfS2PjkBD/XrZ22hxlku
        AxUj2Rw0R0BtP7qyHWuTHLmjd3X/3HIy4Q==
X-Google-Smtp-Source: AGRyM1sYXAD28ZU4/L1pUvBWczo1bWog7/GJrvIyZlWd+5qTL+HYXh42fFo/lKnPWA8SHlwrQ4xhSA==
X-Received: by 2002:a05:6808:2212:b0:335:2198:99a9 with SMTP id bd18-20020a056808221200b00335219899a9mr11889630oib.234.1656360237231;
        Mon, 27 Jun 2022 13:03:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Andy Gross <agross@kernel.org>
Cc:     kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: apr: Drop redundant check in .remove()
Date:   Mon, 27 Jun 2022 15:03:08 -0500
Message-Id: <165636016349.3080661.8854793329816369056.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220618203913.35785-1-u.kleine-koenig@pengutronix.de>
References: <20220618203913.35785-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 18 Jun 2022 22:39:13 +0200, Uwe Kleine-König wrote:
> The remove callback is only called by the driver core if there is a
> driver to unbind, so there is no need to check dev->driver to be
> non-NULL.
> 
> 

Applied, thanks!

[1/1] soc: qcom: apr: Drop redundant check in .remove()
      commit: bc0f149376894343839c4b156fa5653958fda496

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
