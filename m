Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9EB1821C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 20:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731045AbgCKTOu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 15:14:50 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41685 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730953AbgCKTOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 15:14:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id s14so4114671wrt.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 12:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzGl1lTjjJuRxMAbBftuxtB9MJjgk6x+oviFOcjaDys=;
        b=YLNdyNmK2vyfKxMOCS7HWp6d4XQsMWdvOQEcKN1faOdUM2BCv2B+GumqHRkGR0Z7Js
         2/B4v+VZA/N1+wiDPZi47q69b2OQKgEaNkP0tciXHqiRB/UU5yFqXfKC2+YoVK20U4Yn
         yhabALLKRaYhGdX9h/D6CI2KsWUpj+hlbOzApfQUKj1U0OD1RU1H1ACq8vM9ZmFS7Au5
         b6WU4OqMN+skDeiX0bE1bbtSjF3bqz1d7r6dKLe3ILE9QgBzVaz2Ca0j9a1J91FtVAg8
         M/2acCXJCJl6t147QLWaKT3nd4ZlcuQK7kNBVHZTSGfTg1PPjuLF75otBYKsa8UopN4N
         t9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzGl1lTjjJuRxMAbBftuxtB9MJjgk6x+oviFOcjaDys=;
        b=RolMbAhCC1dNyvx6KnRwb50f5zROCeAHWQZuJ2Hp6XNPL8AekvaPnkWMmklaqDWMrL
         Sq3vVFcWLAgRosfiGVmp+8c8a+8ip8eu7SumtJQmEhjNz9tTwazI6yzT+aM1mJmWFDH3
         ok+LhGw/q9yt5xtTJ9FD3uoC5DxjOJpCQmnJki0KjlCsqxdoHN6D5Ay05Q/9vnVGiyYl
         Si8GRMovvcCvIHHfWvArScgRukbkEVQfZ902Ws4nfhqdfgF683OXgn8HfSDmA7qBEH5U
         8NATmsZn6clLeg42aez/N0HIZYApR8lq2BlUiDQgLrmU4eUTFnEWhVeDyX25VqYh1D1B
         YACg==
X-Gm-Message-State: ANhLgQ0lKWGk4reI/slzAgnjKIAn8sp+OV+uVIlzAME138jIkqjmOlmX
        eM8nB/qxQZd04f2NB/pSPcoiNg==
X-Google-Smtp-Source: ADFU+vte2EmnA1VGXLC/3ngkjZwkIu3t0fo0J77SleUTZo+UYnOJ7Q0A4UxmnD3gJhE3NfCOt6QUNA==
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr1494872wrs.96.1583954088160;
        Wed, 11 Mar 2020 12:14:48 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n24sm32958496wra.61.2020.03.11.12.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:47 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/7] DWC3/Qualcomm connector based role-switching
Date:   Wed, 11 Mar 2020 19:14:54 +0000
Message-Id: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This set of patches adds the ability to use usb-gpio-connectors with
role-switching to the DWC3 controller.

Additional Qualcomm specific logic is included in the Qualcomm DWC3 wrapper
to facilitate PHY related updates on role-switch and thus VBUS state
toggle.

These patches have been through seven review cycles already and have a
number of Review-by and Ack-by. For the pusposes of making it easier to
merge this set focuses on the USB role-switching related stuff alone.

The last set for can be found here:
https://lkml.org/lkml/2020/3/3/807

Bryan O'Donoghue (6):
  dt-bindings: usb: dwc3: Add a gpio-usb-connector example
  dt-bindings: usb: dwc3: Add a usb-role-switch to the example
  usb: dwc3: qcom: Add support for usb-conn-gpio connectors
  usb: dwc3: Add support for usb-conn-gpio connectors
  usb: dwc3: Add support for a role-switch notifier
  usb: dwc3: qcom: Enable gpio-usb-conn based role-switching

Yu Chen (1):
  usb: dwc3: Registering a role switch in the DRD code.

 .../devicetree/bindings/usb/dwc3.txt          |   9 ++
 drivers/usb/dwc3/core.h                       |  22 ++++
 drivers/usb/dwc3/drd.c                        | 120 +++++++++++++++++-
 drivers/usb/dwc3/dwc3-qcom.c                  |  31 ++++-
 4 files changed, 179 insertions(+), 3 deletions(-)

-- 
2.25.1

