Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF6F22A1B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 00:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733022AbgGVWBZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 18:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729843AbgGVWBY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 18:01:24 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81654C0619DC
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 15:01:24 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gc15so3433747pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 15:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kf4G9OecuatMPdQAajjbtHZg6Z4TN34pDB2QVj3Jfws=;
        b=GPVhp3NGJ19wf1ctURm4g+w3dBSbio1bGMroejrll7ayIS2Q6mitp1XXu92TJA2Jgj
         IN1hNbxl8IeAKe2gdCvYw4pNo6F0E/bMfhMfz7kJzxFdImVkqUM4CCuKZ32g7HBylXO5
         NgOlYSDD0SRuMJy60oyVH0BTPnJ0vphFIOFoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kf4G9OecuatMPdQAajjbtHZg6Z4TN34pDB2QVj3Jfws=;
        b=QZw8hag9XRTo8vJjPm0156WxUFd4g3WF2o7KhyAJeMOcadzGh2iHDpH3m8vPjFGHB6
         N44QxlkiZdNr754iitw5Rrvz7D/w+EJkoTDMW5cWWTuUKImaYMsDQvD7+GDgNXJ4e9NW
         iD+uXzJRcYbRy8oeQ9JfAlOEE311mcEmw4OC4IohCJvIHam8ytHMFki1uuPIOXxj9dOB
         a58scY0SBsX8J7xECNHrUMqfHQkMDQYTGYWGqXUUJb6pE5RUkDiDfzBipA7BIoKb5y9L
         NBvrsk0TNBhVHU/OkeLD9KRrBHEd/faIs+yJLZh/sJlgVxKBjtHZio4LGHKqhijqJw5k
         rLJw==
X-Gm-Message-State: AOAM530Be4FDRDxRQPkw7x1t17t2Ihk0lcUUZtPtso2qkSa52tZyDXSl
        Rss9zZBNY8rO5eDDuXb83/FUAQ==
X-Google-Smtp-Source: ABdhPJycqu6mq0CFbV5ri7ojMQiC9BlaOqdNq6tqaC5IOPjIpz1Or40LqD5+CBCdwb8DcHUtsvqq/Q==
X-Received: by 2002:a17:902:bd47:: with SMTP id b7mr1342798plx.144.1595455283992;
        Wed, 22 Jul 2020 15:01:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id g7sm562035pfh.210.2020.07.22.15.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 15:01:23 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Wolfram Sang <wsa@the-dreams.de>, msavaliy@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom-geni-se: Don't use relaxed writes when writing commands
Date:   Wed, 22 Jul 2020 15:01:20 -0700
Message-Id: <20200722150113.1.Ia50ab5cb8a6d3a73d302e6bdc25542d48ffd27f4@changeid>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Writing the command is the final step in kicking off a transfer.
Let's use writel() to ensure that any other memory accesses are done
before the command kicks off.  It's expected that this is mostly
relevant if we're in DMA mode but since it doesn't appear to regress
performance in a measurable way [1] even in PIO mode and it's easier
to reason about then let's just always use it.

NOTE: this patch came about due to code inspection.  No actual
problems were observed that this patch fixes.

[1] Tested by timing "flashrom -p ec" on a Chromebook which stresses
GENI SPI a lot.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/qcom-geni-se.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index dd464943f717..f50c73be1428 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -262,7 +262,7 @@ static inline void geni_se_setup_m_cmd(struct geni_se *se, u32 cmd, u32 params)
 	u32 m_cmd;
 
 	m_cmd = (cmd << M_OPCODE_SHFT) | (params & M_PARAMS_MSK);
-	writel_relaxed(m_cmd, se->base + SE_GENI_M_CMD0);
+	writel(m_cmd, se->base + SE_GENI_M_CMD0);
 }
 
 /**
@@ -282,7 +282,7 @@ static inline void geni_se_setup_s_cmd(struct geni_se *se, u32 cmd, u32 params)
 	s_cmd &= ~(S_OPCODE_MSK | S_PARAMS_MSK);
 	s_cmd |= (cmd << S_OPCODE_SHFT);
 	s_cmd |= (params & S_PARAMS_MSK);
-	writel_relaxed(s_cmd, se->base + SE_GENI_S_CMD0);
+	writel(s_cmd, se->base + SE_GENI_S_CMD0);
 }
 
 /**
-- 
2.28.0.rc0.142.g3c755180ce-goog

