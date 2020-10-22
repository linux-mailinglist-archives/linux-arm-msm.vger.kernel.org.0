Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDEE02966C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 23:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372462AbgJVVrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 17:47:46 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:49240 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S372459AbgJVVrq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 17:47:46 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Oct 2020 14:47:45 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 22 Oct 2020 14:47:45 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id DA866193C; Thu, 22 Oct 2020 14:47:44 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v3 0/2] Add support for VBUS detection
Date:   Thu, 22 Oct 2020 14:47:42 -0700
Message-Id: <cover.1603403020.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to enable VBUS detection in the pm8941 extcon driver.

Changes from v2:
- Fix YAML errors in dt binding document.

Changes from v1:
- Change bindings from txt to YAML.

Anirudh Ghayal (2):
  bindings: pm8941-misc: Convert to YAML and add support for VBUS
    detection
  extcon: qcom-spmi: Add support for VBUS detection

 .../bindings/extcon/qcom,pm8941-misc.txt           |  41 ---------
 .../bindings/extcon/qcom,pm8941-misc.yaml          |  65 ++++++++++++++
 drivers/extcon/extcon-qcom-spmi-misc.c             | 100 +++++++++++++++++----
 3 files changed, 146 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
 create mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

