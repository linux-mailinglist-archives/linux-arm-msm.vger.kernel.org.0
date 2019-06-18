Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFC349CDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 11:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbfFRJR3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 05:17:29 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44478 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbfFRJR3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 05:17:29 -0400
Received: by mail-lf1-f65.google.com with SMTP id r15so8672426lfm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 02:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rJanYe36yi/CmGKqaCrG1otgHpkv5KX5H3hS1IRh33g=;
        b=RiJtJdWoPD8zAWLrRuFlXYtFDm2X0N6/21V3ItMvPDDbdX9jIMVD2NDDE50Evpd7c5
         NP91pnFt1FTIfxm71pG+sw/GLrffxSGkjN5FKLqFCZzFnGDzFCMG19dHtlagjO53JVr/
         80CRzxaL1cN4BtODGKh0tEiNCVJAKGD2hlezCr0t0JeIi0cngbJDXFeAYYfVdH4xapR0
         1nFQQDgIcTIQ1+QHAOYncbIigzuTHyGJIGn5wK5x+yFT1HBY5GkQFMYtVVGMYtPf8zk4
         6jr/zmJsnunS/onnUn73MCCqmxxeoLyyYlMOV/H4O9N6tMze7daUZL+ggyMfqPaVWAIO
         OQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rJanYe36yi/CmGKqaCrG1otgHpkv5KX5H3hS1IRh33g=;
        b=oBCENVABvGjmbSAJZ1xgzWY0soPkVsL//ehtB02sTOjICqkg7kzypY4TfAr7JVTNZL
         EOf+cZ1wLdTaUPOXHzpz3wyVRZcUJET+Ltlh9W6eYJcWg0RW5qnK6ap+pM3AOtvq7As0
         SbC/PXu41U+shLRFyI1MZ4gUMtWfftlmMhJFeXewSgWOx1cPgbxW9W+15uDixhiaL0SC
         LzP2Ek5mkkxGcGiOwb3tA8U0CJiBrbxW3+t/4WuxEstuhIelwCKbm7PBq6stynctDpXj
         eZ46nEgLpgEG1O0UYhJqJuHxF8XObyYht/wVKx3dsk3IwZps7X0z/v37QyxPbLGw1p4/
         BjQA==
X-Gm-Message-State: APjAAAV1yYrjBdzf2Qpk9bFNADxKr+uEhKmMtT5eBG0DAPAgy8GbSYjB
        FxjF9nkCwrfp7zPHS/XLw+SRSA==
X-Google-Smtp-Source: APXvYqzZIY8KYRJ7T3S77TJbee+KXLTlqzbOJRplLldZUlUxRX5u3jYNnsAy45fO6GHH7GsxDOvD1w==
X-Received: by 2002:ac2:482d:: with SMTP id 13mr14129676lft.132.1560849447214;
        Tue, 18 Jun 2019 02:17:27 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id b9sm2497444ljj.92.2019.06.18.02.17.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Jun 2019 02:17:26 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     daidavid1@codeaurora.org, vincent.guittot@linaro.org,
        bjorn.andersson@linaro.org, amit.kucheria@linaro.org,
        evgreen@chromium.org, dianders@chromium.org,
        seansw@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org
Subject: [PATCH v2 0/2] interconnect: Add path tagging support
Date:   Tue, 18 Jun 2019 12:17:22 +0300
Message-Id: <20190618091724.28232-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SoCs that have multiple coexisting CPUs and DSPs, may have shared
interconnect buses between them. In such cases, each CPU/DSP may have
different bandwidth needs, depending on whether it is active or sleeping.
This means that we have to keep different bandwidth configurations for
the CPU (active/sleep). In such systems, usually there is a way to
communicate and synchronize this information with some firmware or pass
it to another processor responsible for monitoring and switching the
interconnect configurations based on the state of each CPU/DSP.

The above problem can be solved by introducing the path tagging concept,
that allows consumers to optionally attach a tag to each path they use.
This tag is used to differentiate between the aggregated bandwidth values
for each state. The tag is generic and how it's handled is up to the
platform specific interconnect provider drivers.

v2:
- Store tag with the request. (Evan)
- Reorganize the code to save bandwidth values into buckets and use the
  tag as a bitfield. (Evan)
- Clear the aggregated values after icc_set().

v1: https://lore.kernel.org/lkml/20190208172152.1807-1-georgi.djakov@linaro.org/


David Dai (1):
  interconnect: qcom: Add tagging and wake/sleep support for sdm845

Georgi Djakov (1):
  interconnect: Add support for path tags

 drivers/interconnect/core.c           |  24 ++++-
 drivers/interconnect/qcom/sdm845.c    | 131 +++++++++++++++++++-------
 include/linux/interconnect-provider.h |   4 +-
 include/linux/interconnect.h          |   5 +
 4 files changed, 129 insertions(+), 35 deletions(-)

