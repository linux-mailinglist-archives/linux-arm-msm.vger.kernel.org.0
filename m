Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D27D51DB72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 17:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442628AbiEFPHN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 11:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442583AbiEFPHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 11:07:10 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F676B099
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 08:03:20 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id l16so7748731oil.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3k1CGf7ROX57d+5WZUD3Ci9D6iHGah8jUhJeYX8XYVE=;
        b=GLkj6Hv5d/A5rE/9DD6Tzor0/u1/R/gZYcHd8t7Sy1NbQe6ebZCGTY762QhRQ39y+J
         ZhuI+4PIwKDznGkJLClhPL3BRzBtCiJa06rjtiEfVYKL7gbaKUtX1nJ45dmd6L3Z4YN8
         dfcjiIsjQfuUHyIqb1UuaVwUXzwg+458tf/oMWnBDGs/Ev9ClKWlNeXLz/4Uqvu2OgUS
         PitxsoJisvfa4QiH1CzmlQH+HLGJiMXYItrbfkHiNVwbFN4HJ8C9foBql73pSv/RVZma
         8ki1qSiuRhMcSknR2/R5qIRwXorgaeCFDSQFRyGi5w0Y8cCC5m8jv1FZlH/s8ApQK2cN
         HeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3k1CGf7ROX57d+5WZUD3Ci9D6iHGah8jUhJeYX8XYVE=;
        b=tn0IJBuM/Y2hj6v6yZppkGhuzcmtJUTXjrYcF+bH60ZyuYuw0VOvWMsBuxCcdSOPvL
         kXb6DlALlX0Gv3hqy+OCwKzB8KNPwC+tsDofQhBh7uNsrKeMF9iKzH2Zuh5iSZYpXj3G
         c3Fuiv0zsS51kw9HJQTljG0AYS7yokEC8B58CW19dpX0Hzdhb+rnLYQruApgk2eXsoS6
         jL/4lQzlzcqfWR0qGtzJ66gQsNK158J65R3HQ38U1AziYWpsSrLam3WwNTS+hAG3o9+6
         a2LYtLJ17BjX5ZNPenJMDIcLqOyIrI3Kl8lXyhf/dyLzCv286YghRizSaIydfcWlvSIH
         oQPA==
X-Gm-Message-State: AOAM532P6LhYtUFD3JyAnGqnhDFZI+PNQQqiz08PhZO/sDoeSc04IKl0
        2K46cBSjbIlwE5UcC4Bt10/EOA==
X-Google-Smtp-Source: ABdhPJzthI21WXpbvORv0sr+tLijGFfFfgXmJyntLomCPe5H9CG1iqJcxfJs7oj+WmXU+xuUw55ANQ==
X-Received: by 2002:a05:6808:1917:b0:326:9989:5db with SMTP id bf23-20020a056808191700b00326998905dbmr750764oib.24.1651849400469;
        Fri, 06 May 2022 08:03:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e21-20020a056808111500b00325cda1ffb9sm1665311oih.56.2022.05.06.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 08:03:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        patches@lists.linux.dev,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: sc7180-trogdor: Simplify!
Date:   Fri,  6 May 2022 10:03:08 -0500
Message-Id: <165184936433.73465.13214953449519830284.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427020339.360855-1-swboyd@chromium.org>
References: <20220427020339.360855-1-swboyd@chromium.org>
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

On Tue, 26 Apr 2022 19:03:36 -0700, Stephen Boyd wrote:
> Here's a couple patches to simplify sc7180-trogdor dtsi files further.
> There will be logical conflicts with the wormdingler patch because it
> will need to have similar changes done for the swizzle and include, but
> that can be cleaned up later or I can resend if the wormdingler patch
> gets merged first. Either way nothing will be broken from what I can
> tell.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sc7180-trogdor: Simplify trackpad enabling
      commit: 51d30402be7506db007af6d29c6bc7c1cefcc82f
[2/3] arm64: dts: qcom: sc7180-trogdor: Simplify spi0/spi6 labeling
      commit: d277cab7afc7b54ea91808c0895d78c2021af534
[3/3] arm64: dts: qcom: Only include sc7180.dtsi in sc7180-trogdor.dtsi
      commit: 19794489fa2474a55c00848e00ca3d15ea01d36c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
