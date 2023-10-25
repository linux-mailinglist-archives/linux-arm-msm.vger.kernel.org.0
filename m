Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 716CB7D66BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 11:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbjJYJ1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 05:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbjJYJ1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 05:27:16 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66751DC
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:27:14 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507d7b73b74so7845253e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698226032; x=1698830832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8USfd2cXtMS5J3mM9vTi2tspxUYy+b4DZDSMhYADls=;
        b=RDyEXD2qoraul842vdpKNun+9bxHv5oCyVdL9+mK0lVGrlwhXP7CzFo/3jkH0v2wF5
         fhZEMgwrtt9blZCkbILjANc+7RzAqyiE1y3XvY+VWuqm5AT/Ki0xWx74fh+qxsTAa+m4
         +FMM+zcGgL45k2qDKjLa5N5IQQQ/YqcaWn7BTwbocQKDOOvl7PnDeMOrZ8rvvj1CmTpY
         pv83GXas52zpZE6PUUxcGpVnOXTLv+mKZk/kArY4mzqD7ojKnSFFB1kBcBND9mevOlBq
         GYh/2xGr0sds8P5qZR7xIixxqx5UpWskg79OAhDPLcrdnK0tceZWVMk+0zyJzBKAw3ZI
         LlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698226032; x=1698830832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8USfd2cXtMS5J3mM9vTi2tspxUYy+b4DZDSMhYADls=;
        b=IlLOqjHq/RcGOg+KX+W9FGHFTOhlFlBu5sBX7dHBNpCMV1jdOae1IKM7doVNw6mMjM
         M3gwzc5kY37fct2H8v+iDHJ4beIy/zBT5DPuFEABvVkeZk4bPa4bijsGEpcY6C2BHENZ
         Id5ufTvOrC+A8+AOb9DBFHKKLhJXlpVlURdwsKGTxFpwPg294PrlqMgsFvHmGe5UvfoL
         F0HTDEAFDVNdL7qmRt6EutVojpx8bb6hE65otYZtcGQOPpotvs4XEFukNZ35Mqn++Vwf
         FJQkaHbVrcdP3l/PQsYYXALpnjeqnHn+cvc+d3nW+858uyN6bxYrqfK2900hJZZ4AiL/
         wHMg==
X-Gm-Message-State: AOJu0YzhWf+7GYxxAwmFJxeknfj8PLAz0OXrLQUTZuTPLyjq9sGjZJQ2
        VHaQY33xZhseviAaMNN+76dmXA==
X-Google-Smtp-Source: AGHT+IHTmUTCmb8MZXEisS6oCGCWvEuXG58i+0LOySJCTSTxUc7vXiT2YUaa5P7vgH3I4IZPYTsNqQ==
X-Received: by 2002:a19:655d:0:b0:507:9d70:b297 with SMTP id c29-20020a19655d000000b005079d70b297mr9607031lfj.60.1698226032561;
        Wed, 25 Oct 2023 02:27:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id eq25-20020a056512489900b005079fff83d2sm2470377lfb.3.2023.10.25.02.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 02:27:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/2] drm/msm/dp: fix DP subconnector handling
Date:   Wed, 25 Oct 2023 12:23:08 +0300
Message-ID: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix two failovers in the DP subconnector's patch. I didn't notice that I
had another patch adding the property in my tree and later Abel pointed
out that we shouldn't use subconnector type for eDP panels.

Fixes since v1:
 - Add Abel's patch.

Abel Vesa (1):
  drm/msm/dp: don't touch DP subconnector property in eDP case

Dmitry Baryshkov (1):
  drm/msm/dp: attach the DP subconnector property

 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
 drivers/gpu/drm/msm/dp/dp_drm.c     |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.42.0

