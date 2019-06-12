Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9C7428F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 16:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408678AbfFLO1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 10:27:00 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50886 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407424AbfFLO1A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 10:27:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id c66so6808999wmf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2019 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=9RG/fmGuMFz1uOaOz5ph/6qVFWhsvvm2ZWfHtq97fow=;
        b=U3aIc/V9L3ZOTcT3ZWJ5NsF/6YJWWwbbm7Swu0+HXiDryJ0hzaoC0d599o5c02/wfB
         txsPmg5vnRsDnpHii3K7CcH9tVtBuEIkdV9yk511gxV2IUu/hByTGdjLnEToK/XiJHE7
         bYZcR54RCc6PrTpqyWwk7GJrQbSS5LtM+vafuV6wypMDmfZcQoFrz6K6R8I+ykp0Rt4y
         8lM3cxTB+ITbOMGxQ5pXG+QdGDoe6vDIeH6USCgqcUPtBUcR0QdM8FBxohykFAa8lpM/
         MY6HXggENdNPtU2hgdyGDNiA19XvUd6/l3/AKJjHZikq1HOfB80J0UWPwDChonFerPvx
         eX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9RG/fmGuMFz1uOaOz5ph/6qVFWhsvvm2ZWfHtq97fow=;
        b=pnrZs/3fYrFBujzkqNYSQg9Ye+H3W3ubv38i2/cZXUYGWReD/QUevGLgimyeMwqdcJ
         tzw6GS0RF3gkv4LJ//UZNZklgahqaRa75TGVd0cpYSHa2CLE3z+y7OT139V7SHEcs7mP
         5r0DL6yTtFeiryW/houYQSI/RtjmsfAVCoAoy82scL9hBQdMJmvW2bQX8bITisHSfItu
         qNzIFc6eJT5Mt7KIDwVm9fI7pap1QU4ybdVIobdxMH8GF8jLQfO9nrmBsDlXw0OmxJtd
         m5uT05dhv+wbJFcS+zxIgotKzfjjrVQn8ZSqls66MVbSZkkggEfh22lE0y64pKvdAWMl
         nxwQ==
X-Gm-Message-State: APjAAAXFLPRkYviraQfmNusK0Ybn4n/n+SfqusZl6vi2YW30KpgE+5AV
        7Np7wXsjQc4R0T8Rp3FZPhANUg==
X-Google-Smtp-Source: APXvYqy1cLtAIc09aYE/pTZ4C8baAoSIE+X5aqrXpGYtR24fXNVBaYjQ4r2OFfrIZUCykHgpUQaBCA==
X-Received: by 2002:a7b:cb84:: with SMTP id m4mr23894630wmi.50.1560349618344;
        Wed, 12 Jun 2019 07:26:58 -0700 (PDT)
Received: from dell.watershed.co.uk ([185.80.132.160])
        by smtp.gmail.com with ESMTPSA id y18sm203959wmd.29.2019.06.12.07.26.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:26:57 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.or,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v4 0/6] I2C: DWC3 USB: Add support for ACPI based AArch64 Laptops
Date:   Wed, 12 Jun 2019 15:26:48 +0100
Message-Id: <20190612142654.9639-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch-set ensures the kernel is bootable on the newly released
AArch64 based Laptops using ACPI configuration tables.  The Pinctrl
changes have been accepted, leaving only I2C (keyboard, touchpad,
touchscreen, fingerprint, etc, HID device) and USB (root filesystem,
camera, networking, etc) enablement.

v4:
 * Collecting Acks
 * Adding Andy Gross' new email
 * Removing applied Pinctrl patches
 
Lee Jones (6):
  i2c: i2c-qcom-geni: Provide support for ACPI
  i2c: i2c-qcom-geni: Signify successful driver probe
  soc: qcom: geni: Add support for ACPI
  usb: dwc3: qcom: Add support for booting with ACPI
  usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
  usb: dwc3: qcom: Improve error handling

 drivers/i2c/busses/i2c-qcom-geni.c |  17 ++-
 drivers/soc/qcom/qcom-geni-se.c    |  21 ++-
 drivers/usb/dwc3/Kconfig           |   2 +-
 drivers/usb/dwc3/dwc3-qcom.c       | 221 +++++++++++++++++++++++++----
 4 files changed, 225 insertions(+), 36 deletions(-)

-- 
2.17.1

