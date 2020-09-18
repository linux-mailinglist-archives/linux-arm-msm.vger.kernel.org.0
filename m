Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE999270602
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 22:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgIRUJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 16:09:29 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:52373 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726118AbgIRUJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 16:09:29 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 16:09:28 EDT
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Sep 2020 13:03:24 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg03-sd.qualcomm.com with ESMTP; 18 Sep 2020 13:03:23 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 857EB194F; Fri, 18 Sep 2020 13:03:23 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v1 0/2] Add support for VBUS detection
Date:   Fri, 18 Sep 2020 13:03:20 -0700
Message-Id: <cover.1600459322.git.gurus@codeaurora.org>
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

