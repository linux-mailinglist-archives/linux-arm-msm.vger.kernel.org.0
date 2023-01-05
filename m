Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E3465E179
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 01:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbjAEAW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 19:22:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234381AbjAEAWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 19:22:25 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9552B43A30
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 16:22:24 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id n1so37203935ljg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 16:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fc+e1Wrqq4V5fta3bJ+Z/tnWjxVJEg8xzf66W9K/0o4=;
        b=mUZrkIkjyuG0yydo+LZSs35Xp4eEUvd7tuI0+IgsMBHzDQKBCByVXRurDLNQ8sWlxk
         VEur3SVfhqissP6NGjKvrKZnYSFbhXmYuYNW8wt/AIDx4YzIMYnErkvNwdjpqxH06X1t
         zRJn/U5Gf+KU6RKw3WDTPICAc1uL8zx7EpxC/RMKB28z9QyLbb6XvSyZFy5M1ut+prky
         8qcU1J3h7Iv4ucisORhJq9/r1lLOB0bqVcdGxr4s2shTM7LLm72l0+0DJdRdnQBHWBSp
         REokbkxmKCIc6Ml3zNRiI7n1EMXbRqbdSzlkjX4Oh93SKXGWc+B8wFnminw0gfGP+hiO
         KndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fc+e1Wrqq4V5fta3bJ+Z/tnWjxVJEg8xzf66W9K/0o4=;
        b=oExuRF8Z55ZjlfpDEc6nPkOrcL+wB97veKQsGG39EKYcTvaewL+DJULAPN6H1cFWtI
         EXP4RE+yoJ8q+gWatbuK3ucpzPARb9PCF+gK6S7LXAAmEFNpqswIMv2wt9yX742I804b
         dCcWHog5WneGx63Ti/cOdVvdnIxbmbmbSOBow6v2ob3OJ7Wm+9uwJ3dBhL3fgzs8Z3cO
         lvZlNqGLHnyMedUHkYXgEJfthBRWOceJVpgElCMh8xo9FQYDMBIAwEKGKn8NwUJ11YGS
         Tfd/yOz0UDtiAssV/A1liXfeWZSIJIPZnLHWZeEfiTpVMZgfuOWZDZ8C4DT6CzJ59YQ1
         VJkQ==
X-Gm-Message-State: AFqh2kq9GlMRLzPYRqy3HvRS+bR/W/hW8s/3qInaewFblylf4H9ykmfI
        7OuYdBytKG6W+Ev+5tcyCQmKbQ==
X-Google-Smtp-Source: AMrXdXs7UOIS4610Df0fYQLXcyJqdoyIuRuVbCjPH0YG+963HoNzi6xIOLH+DZQY8/obbKPQEJW3JQ==
X-Received: by 2002:a05:651c:1541:b0:27f:f897:b8d3 with SMTP id y1-20020a05651c154100b0027ff897b8d3mr3811539ljp.25.1672878142982;
        Wed, 04 Jan 2023 16:22:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d18-20020ac241d2000000b004b4cbc942a3sm5291992lfi.127.2023.01.04.16.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 16:22:22 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 0/3] interconnect: qcom: several fixes
Date:   Thu,  5 Jan 2023 02:22:18 +0200
Message-Id: <20230105002221.1416479-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Patches 1 and 2 are applicable on top of 6.2-rc1, patch 3 applies only
on top of the immutable branch `icc-sm8550-immutable'.

Dmitry Baryshkov (3):
  interconnect: qcom: osm-l3: fix icc_onecell_data allocation
  interconnect: qcom: sm8450: switch to qcom_icc_rpmh_* function
  interconnect: qcom: sm8550: switch to qcom_icc_rpmh_* function

 drivers/interconnect/qcom/osm-l3.c |  2 +-
 drivers/interconnect/qcom/sm8450.c | 98 +----------------------------
 drivers/interconnect/qcom/sm8550.c | 99 +-----------------------------
 3 files changed, 5 insertions(+), 194 deletions(-)

-- 
2.39.0

