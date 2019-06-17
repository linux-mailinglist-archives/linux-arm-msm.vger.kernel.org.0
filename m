Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7942482FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 14:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfFQMvK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 08:51:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39225 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfFQMvK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 08:51:10 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so9820172wrt.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5bmkX35OV+Un6bMajgKlhe2VCa9szCQ2ZkSqsLoxX0o=;
        b=SkGqB8nJ/IEWG4IXm6QepVKAPERnunfILKb8Kq1MbhkJjXx3UULfKVudbA72IOKn4f
         G62Fr3PqgKzQKcNsmyBRXyveUf+dHEtdCXtQsE3gTVZVWnfWkldCrMnFs2slVkltx4Gb
         8AATCMbXrzOzWwipup1IO6zK1olLm9TmFGFjp+3h5Yjpcyz6iiNP46kZZ3t5mshsqkkB
         uUfjeYjyZ9Qx603esC/J+weA9ps0NBpcyLjXqm3f6wYZUVQ8smY0LRF+HMW2KQdWf9ZA
         5xqUxmiRTeR1e7KAm+OpIrpAp3jU3t2gdQNZWCNNhR7OlH8K5th6Jk4140PPDGahTHVY
         aqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5bmkX35OV+Un6bMajgKlhe2VCa9szCQ2ZkSqsLoxX0o=;
        b=kX8/oh9Dt++tRtTgSUnEPhpwxm8mXYbwwHCraCNNNzZrWYDVj21GruztQXvsWsuEzk
         n8r8RmfuwxDcxGgjm/HHmuQ3xTN5EAGFMFbL4eAT+XrL8AeSXVscN2ZQ90A+M0KiceGj
         AGbbBiAxvjEFYoDjEbCJfuX10yaqFOX2w34ZwYO8K4lX3b3Hp3nrN1X3UdaWaIPmrUo6
         +ajWmlKK5JeJHtVIBLT2AdO/CArd6Mas00cBQJs9HTB78H6Ro5YgQgPfQt2eD61F+XDF
         p78CWtw2RIgf0XFL67PptWm8abyQO3hjnLUjFOJ78eWCeyQ6TXhopec9Z9E3fGxcJQru
         vqbg==
X-Gm-Message-State: APjAAAUrWZLtfDQYszJGIW9beBrL2qVpCW6kkZtGglMPSgKbFGkhqGZS
        w4oLHKFPfm43h3Eo8vJpxvRA7kzqnb8=
X-Google-Smtp-Source: APXvYqw7cAvvCpSNGdJ5pbIUQp1AMGTBLl023D9nSX8+bxc3wDDiQnF3ftT8PtAoEjuj1WIEl1FdVg==
X-Received: by 2002:adf:f84f:: with SMTP id d15mr75718744wrq.53.1560775868649;
        Mon, 17 Jun 2019 05:51:08 -0700 (PDT)
Received: from dell.watershed.co.uk ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id o11sm10477852wmh.37.2019.06.17.05.51.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:51:08 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [RESEND v4 0/4] I2C: DWC3 USB: Add support for ACPI based AArch64 Laptops
Date:   Mon, 17 Jun 2019 13:51:01 +0100
Message-Id: <20190617125105.6186-1-lee.jones@linaro.org>
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

RESEND: Stripped I2C patches as they have also been merged into
        their respective subsystem.

v4:
 * Collecting Acks
 * Adding Andy Gross' new email
 * Removing applied Pinctrl patches

Lee Jones (4):
  soc: qcom: geni: Add support for ACPI
  usb: dwc3: qcom: Add support for booting with ACPI
  usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
  usb: dwc3: qcom: Improve error handling

 drivers/soc/qcom/qcom-geni-se.c |  21 ++-
 drivers/usb/dwc3/Kconfig        |   2 +-
 drivers/usb/dwc3/dwc3-qcom.c    | 221 ++++++++++++++++++++++++++++----
 3 files changed, 209 insertions(+), 35 deletions(-)

-- 
2.17.1

