Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0101179B1B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 01:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245604AbjIKVLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244494AbjIKUit (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 16:38:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FF6127
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 13:38:45 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-500cfb168c6so7983351e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 13:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694464723; x=1695069523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37OsjzF5m+al/zXK2QWqSvM4L7XWKLb+zPwOOhEzbPI=;
        b=ley5YWpVY3SNpJ7g6kIEBNzUOnp2NBR4/4KRTRRpyzjWv/EPDid7R8fWkUwvCa+55A
         WmlAWkl0GHGIjFaKdwu0qetxtJaiw/AEb5+YMj6qLxweJB+4nXHhcBnlP4Z27LbCttUP
         olYaqo1yozqN7pzn4oQRof5YUpBhAZfk4nM6AFu3eqN1DG6QC9SWRn9Ey2qY3FGeXK3T
         IyZmG48tAthHAqsUZ6xNZCTD2w5iaHdKBzPgIh5aoy+nsXwbNqEhsqP7ucOEWrJsNtNm
         nDT36zgEQGCJ3hu8gPgFdgnBU0WRbZdEzzDvVdTJQdURZBKby8pFvAeUedw2+ht8+yxS
         YQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694464723; x=1695069523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37OsjzF5m+al/zXK2QWqSvM4L7XWKLb+zPwOOhEzbPI=;
        b=X7tn2X/kF2n/flhmqcJQIisTdC9Lersu+q3tqDWQcY/bSN+ctpyfPY8OaU1sdHxvrg
         r6xHpdXEqH38JyjgCxVQmiDP0e0g6Zzv9QMX5d/2jyzl60m9+C46rxeitO8OoPm1KCGP
         Vr5+0+pN5gPDQXT8mfwslJVWw9hzCilZpTI+s0Nyy8wf+zcPV5SGNAEsQt9GDhrJJAFU
         N06FIo7eEcxSFOnuzF4H74FTqe+FbpPyJOkyNQldNQtHiEDXFL95X8EbUYkAexCD1dob
         Wouy/0HZfyXt0A0UrYTvVmki0LIbK8OjZctnjKchh4HCeJ3wOKT7UhPHeTRCYMULt+9b
         8qEA==
X-Gm-Message-State: AOJu0Yyo7pdSquVwe+56xI1MxquA/SR914hpy2I+BbmVjlgH5Vy1c3tZ
        fGBlAM7x0ukt/338P2E+8JzgJA==
X-Google-Smtp-Source: AGHT+IE/sR/H0S9Rss/BHwpM+5UNkI3p5aeardc1ZB482te0FFBMKSOhsuMdpWQv4rMVaeNKdwIqGw==
X-Received: by 2002:ac2:4bcf:0:b0:500:bddc:56d5 with SMTP id o15-20020ac24bcf000000b00500bddc56d5mr9330424lfq.37.1694464723295;
        Mon, 11 Sep 2023 13:38:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l9-20020ac24309000000b00500b3157ec2sm1447753lfh.148.2023.09.11.13.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 13:38:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 0/3] phy: qcom-qmp-combo: correct sm8550 PHY programming
Date:   Mon, 11 Sep 2023 23:38:39 +0300
Message-Id: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix several small issues with the QMP USB+DP PHY programming on the
Qualcomm SM8550 platform.

Dependencies: [1]

[1] https://lore.kernel.org/all/20230829-topic-8550_usbphy-v3-0-34ec434194c5@linaro.org/

Changes since v1:
- Rebased on top of Konrad's patchet ([1])

Dmitry Baryshkov (3):
  phy: qcom-qmp-combo: fix the prefix for the PCS_USB v6 registers
  phy: qcom-qmp-usb: move PCS v6 register to the proper header
  phy: qcom-qmp-combo: use v6 registers in v6 regs layout

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 50 +++++++++----------
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h    | 28 +++--------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h    | 20 +++++++-
 3 files changed, 50 insertions(+), 48 deletions(-)

-- 
2.39.2

