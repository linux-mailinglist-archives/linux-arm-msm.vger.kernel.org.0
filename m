Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD416319EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 07:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiKUG6O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 01:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiKUG6I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 01:58:08 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BB117884
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Nov 2022 22:57:54 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so13484461pjs.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Nov 2022 22:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yAbnAM+ovW8h6+jx0Tfr4v7il7axJFcd8q4vAg9pxqU=;
        b=YASVB2+1xzQoFStyoTpwjLX16ovU0ApOmI8Zw4lo8GoOiOVAapW0jg44/t2Lh/Y3b8
         jwlCK2hSH4iBKdv6uZgisHKDqV0ZCo9YNQ2oK0+VbMiPa3hM/Jl4vHb4wJW4dOsZneYQ
         ZeyWNRNQAboOn5BinYG1bbUpUtQ9SFqd/zR7N3RLL0G/Yt2PTA+SOK9ZhskLc8e05oXe
         zb0xESU22G4S4QuOPAlUCY7yfeEXaElVUbwSDDjxeyCmqOe2NKnbHIha8i/Gwq7H5FVk
         jUYppWpZb9RC8AlaRtZUkaju0BTZ6UNB94fsXCna+BkJGgQkVwYTXp1fbEzQW5jnOitC
         LZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAbnAM+ovW8h6+jx0Tfr4v7il7axJFcd8q4vAg9pxqU=;
        b=mthWNMvzbTHoJPbqrW2pXep4rOgDGx8LPacRFFi82Vf/at6/hyiuHJXxpfBxdO91RT
         LDjjMtD4K7j1ovs+vbv3CiWFnA8mOHW72ozLnV6TPz9KcAc4HLUWyLE23fivqKKezY8S
         E7XhznFtQCOfuc5unJsaUgHrWQgpmcuoYE/Ey10gBtE/wU7+23BqKe0lpfRn/Rur+Ee7
         GVlOpVwJ1BwsNuJPEVNgJ6Ijxf9kvSYaWl+0Sv3xfHKT0tqJs4O/p6YO+45n9INtxYr9
         ckW1V/lu4F3aVXoQ+dBOCGUWxbwC8G5Zndqqc2zLjXqr3MJ7psFXSl0G4LPDr3AHojT+
         rG+A==
X-Gm-Message-State: ANoB5pkxjVNIaA2jsrjme8QJlFTDDJ3Fq71BujbbBXxV5qYlLdTiMtsE
        nYtPRnEmc+zpRTSLl74c1+hQiA==
X-Google-Smtp-Source: AA0mqf6C0AKgl/pkwD/lEgIAwvxAkNrduTECfE85HLT5JQCnu8FuOzL2mhKwZkrCRZiGS2k9qBRL3g==
X-Received: by 2002:a17:90a:dc13:b0:212:c87e:dc8b with SMTP id i19-20020a17090adc1300b00212c87edc8bmr19158185pjv.229.1669013874464;
        Sun, 20 Nov 2022 22:57:54 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id y10-20020a17090322ca00b0017bb38e4588sm8905027plg.135.2022.11.20.22.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 22:57:53 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>, johan@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] OPP: Disallow "opp-hz" property without a corresponding clk
Date:   Mon, 21 Nov 2022 12:27:46 +0530
Message-Id: <cover.1669012140.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This removes the special code added by the commit 2083da24eb56 ("OPP:
Allow multiple clocks for a device"), to make it work for Qcom SoC.

In qcom-cpufreq-hw driver, we want to skip clk configuration that
happens via dev_pm_opp_set_opp(), but still want the OPP core to parse
the "opp-hz" property so we can use the freq based OPP helpers.

The DT for Qcom SoCs is fixed now and contain a valid clk entry, and we
no longer need the special handling of the same in the OPP core. Update Qcom
driver as well to disallow freq update to the clk.

Mani, can you give this a try again please, thanks ? I have only compile tested
this.

Viresh Kumar (2):
  cpufreq: qcom-cpufreq-hw: Register config_clks helper
  OPP: Disallow "opp-hz" property without a corresponding clk

 drivers/cpufreq/qcom-cpufreq-hw.c | 34 ++++++++++++++++++++++++++++---
 drivers/opp/core.c                | 14 -------------
 drivers/opp/debugfs.c             |  2 +-
 3 files changed, 32 insertions(+), 18 deletions(-)

-- 
2.31.1.272.g89b43f80a514

