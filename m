Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3095294507
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 00:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388176AbgJTWRg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 18:17:36 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:18931 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727155AbgJTWRg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 18:17:36 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Oct 2020 15:17:35 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg05-sd.qualcomm.com with ESMTP; 20 Oct 2020 15:17:35 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 10C5B194C; Tue, 20 Oct 2020 15:17:35 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [RESEND PATCH v2 0/2] Add support for VBUS detection
Date:   Tue, 20 Oct 2020 15:17:23 -0700
Message-Id: <cover.1603231949.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(Re-sending to add devicetree mailing list)

Add support to enable VBUS detection in the pm8941 extcon driver.

Changes from v1:
- Change bindings from txt to YAML.

Anirudh Ghayal (2):
  bindings: pm8941-misc: Convert to YAML and add support for VBUS
    detection
  extcon: qcom-spmi: Add support for VBUS detection

 .../bindings/extcon/qcom,pm8941-misc.txt           |  41 ---------
 .../bindings/extcon/qcom,pm8941-misc.yaml          |  56 ++++++++++++
 drivers/extcon/extcon-qcom-spmi-misc.c             | 100 +++++++++++++++++----
 3 files changed, 137 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
 create mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

