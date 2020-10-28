Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C805629DA92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390369AbgJ1XZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:25:57 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:2692 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390355AbgJ1XZT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:25:19 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Oct 2020 00:18:56 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg05-sd.qualcomm.com with ESMTP; 28 Oct 2020 00:18:56 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 12FD51B21; Wed, 28 Oct 2020 00:18:56 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v4 0/3] Add support for VBUS detection
Date:   Wed, 28 Oct 2020 00:18:51 -0700
Message-Id: <cover.1603869292.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to enable VBUS detection in the pm8941 extcon driver.

Changes from v3:
- Split bindings into direct conversion of txt file, and addition of VBUS
  detection support.

Changes from v2:
- Fix YAML errors in dt binding document.

Changes from v1:
- Change bindings from txt to YAML.

Anirudh Ghayal (1):
  extcon: qcom-spmi: Add support for VBUS detection

Guru Das Srinagesh (2):
  bindings: pm8941-misc: Convert bindings to YAML
  bindings: pm8941-misc: Add support for VBUS detection

 .../bindings/extcon/qcom,pm8941-misc.txt           |  41 ---------
 .../bindings/extcon/qcom,pm8941-misc.yaml          |  64 +++++++++++++
 drivers/extcon/extcon-qcom-spmi-misc.c             | 100 +++++++++++++++++----
 3 files changed, 145 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
 create mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

