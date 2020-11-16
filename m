Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B4B2B52D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 21:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727475AbgKPUkg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 15:40:36 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:57955 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730970AbgKPUkf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 15:40:35 -0500
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Nov 2020 12:40:34 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 16 Nov 2020 12:40:33 -0800
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id F3596192D; Mon, 16 Nov 2020 12:40:33 -0800 (PST)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v6 0/3] Add support for VBUS detection
Date:   Mon, 16 Nov 2020 12:40:29 -0800
Message-Id: <cover.1605559069.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[REQUEST]

Thanks Rob for reviewing the dt patches.

Would it be possible for the maintainers and reviewers to review the code as
well? 

[COVER LETTER]

Add support to enable VBUS detection in the pm8941 extcon driver.

Changes from v5:
- Gathered Rob H's Acked-by for the dt-bindings patch.

Changes from v4:
- Drop addition of new compatible string in both bindings and driver.

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

 .../bindings/extcon/qcom,pm8941-misc.txt           | 41 ---------
 .../bindings/extcon/qcom,pm8941-misc.yaml          | 62 ++++++++++++++
 drivers/extcon/extcon-qcom-spmi-misc.c             | 99 +++++++++++++++++-----
 3 files changed, 142 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
 create mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

