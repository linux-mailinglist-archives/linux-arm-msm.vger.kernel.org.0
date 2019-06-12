Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B2C41B48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 06:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbfFLEpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 00:45:40 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44450 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729921AbfFLEpk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 00:45:40 -0400
Received: by mail-pg1-f195.google.com with SMTP id n2so8188113pgp.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2019 21:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2TrMdbDpNorKaT7XDMSsPFdib5FuNIVgrqDkUZTgvr4=;
        b=trASQV/i6hQMvG3yM+1qDTXQeLDcKha94BSnA5kVPePebHBoJIxsntc8djDRhJIqJZ
         7O35TJWtIeGrzSZJftr+GkinjSHZcZPjaQKDKSDYtIfHsoFT5Jn239RfNVTJ/JzgvHAw
         KKQHZIgHn2BlosgRoLJNZ7E8HJ9dMzRyRV82H8cfZrB8ecQN59A3BhLhWdW6EJC1w6NV
         A+bmWk8lybIzWiHVLn+1xefTWJNUQAz82a/H+ECgzjKWHiOQM0gYSDyqRXq8r8bNRixU
         ySqlQ0LkSYOYmD5EQcS20WPP/vQyklCngGEcZFH9764eO3xIROqhkhZ7lQIWNANVdhgR
         O0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2TrMdbDpNorKaT7XDMSsPFdib5FuNIVgrqDkUZTgvr4=;
        b=acukkFS8LjAN3UOwC7Ezg41Y8pTd85QNYwdKHUlPKyCW3AH9loNvZSHer+CndJnPFL
         vnQT4g3YHVtAqFBET3P+y216W6FytqRhdu6WE6Gs9aINdeij1HdWTMgaYUXTIMJ/XM3s
         jIxr5CaZAmeSomFYgKFS/RthdQ8+DlLkP/M5s0FO+mdKaHWRco7GOLBWQwP+7lfVShYb
         jg3R+KkjJiFixidKwlw2yzScGVd4JO9O3KX3Loaa2gZONlFHqjIjhh9btvbvbzJpdfLQ
         VzB3johtuj1NrTEqfnDNi6VYsiN2E225UZ6CTCcGtbGvQQexcQi9c3KfQk4a1yH4J3bO
         tocA==
X-Gm-Message-State: APjAAAXGwD+XlrFdObCCT6xpSDELxkENXWxcauSAS7t2HDo1mwqvH7GZ
        MAdVvjBIaCREI+3MmiLmhADDuA==
X-Google-Smtp-Source: APXvYqz3W8q9oigR26Mbx1v4xByijK9Jz/r+1Afep2gYKpXDUdM2PBuyTIripuQOAxLahLGYWoDmGA==
X-Received: by 2002:a62:5303:: with SMTP id h3mr3288553pfb.58.1560314739414;
        Tue, 11 Jun 2019 21:45:39 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z126sm17129194pfb.100.2019.06.11.21.45.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 21:45:38 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/4] Qualcomm AOSS QMP driver
Date:   Tue, 11 Jun 2019 21:45:32 -0700
Message-Id: <20190612044536.13940-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding for the QMP based side-channel communication mechanism to
the AOSS, which is used to control resources not exposed through the
RPMh interface.

Bjorn Andersson (3):
  dt-bindings: soc: qcom: Add AOSS QMP binding
  soc: qcom: Add AOSS QMP driver
  arm64: dts: qcom: Add AOSS QMP node

Sibi Sankar (1):
  arm64: dts: qcom: sdm845: Add Q6V5 MSS node

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  81 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  68 +++
 drivers/soc/qcom/Kconfig                      |  12 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qcom_aoss.c                  | 480 ++++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h     |  14 +
 6 files changed, 656 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 drivers/soc/qcom/qcom_aoss.c
 create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

-- 
2.18.0

