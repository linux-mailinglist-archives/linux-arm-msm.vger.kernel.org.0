Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0732A27B7EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 01:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgI1XTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 19:19:24 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:34048 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727200AbgI1XTU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 19:19:20 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Sep 2020 15:49:11 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 28 Sep 2020 15:49:10 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id C5BA5194C; Mon, 28 Sep 2020 15:49:10 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [RESEND PATCH v1 0/2] Add support for VBUS detection
Date:   Mon, 28 Sep 2020 15:49:07 -0700
Message-Id: <cover.1601333246.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to enable VBUS detection in the pm8941 extcon driver.

Anirudh Ghayal (2):
  bindings: pm8941-misc: Add support for VBUS detection
  extcon: qcom-spmi: Add support for VBUS detection

 .../bindings/extcon/qcom,pm8941-misc.txt           |   2 +-
 drivers/extcon/extcon-qcom-spmi-misc.c             | 100 +++++++++++++++++----
 2 files changed, 82 insertions(+), 20 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

