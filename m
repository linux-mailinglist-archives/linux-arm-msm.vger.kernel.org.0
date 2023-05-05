Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84AD06F859A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 17:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbjEEPZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 11:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbjEEPY6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 11:24:58 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB361A624
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 08:23:23 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so28105234a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683300186; x=1685892186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ0MjyN2tPXJnBiN7+wdwcYqZoiGnIUzbIIwgINFMQk=;
        b=t9cPpIqjIu7IP/FdOUGPJXKMeX+ktMi3VAhNdww6MEKLAn96lOAvAwzMNvfTc9Jjga
         WnoJJ131iQm+jk9XN/xGVpPUI64t7dQi0B4H96pUjMS2LeGH0cQSJsGjVBL33BBlXiqM
         mn41G/W98ig6WwbwBP4ik9n1E0dScC9iDZTbx+UPNxbO0MrjMACBQUIOxjRtsPxDP52v
         NYCuj+zDxmf79qI+sY4hweoZ3QB8TlacHWry4QETuSMhODClU/hDrmLsx38jxYNCgc+K
         NEvScEv3zGQ3SXf+QfEANMhP9xpl7hUoAP686nFlLu59btn+5YLdemzDKtqsvKgl4bOf
         t+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300186; x=1685892186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJ0MjyN2tPXJnBiN7+wdwcYqZoiGnIUzbIIwgINFMQk=;
        b=jzxhfq83DzzmbyU3O+7EEMuW36pWYWaD2e/nv5QOch3CspFflL40MxDYzcx9zJ8FSq
         nD1+3beqRiYWAZJ9/GbojCXSIHEt7R+Rbhml4Sa6X6B4S5s9OA4QwFKulSBa1q0LrtHr
         TLH5vr2WPQgEBcrF0W9r7kgUKEcCymbAcpMyjgo7aY0XQ0vl32B5V49bgdHaZ8hUcVKF
         MfrDpLjc8O0IOMaYB7ylne/XWDqKDSvpvT9AP7Np3Pl061AScHJt3tNJFwYJm0z7ibcY
         wf13l05Xk4oIW1hOg++iECZlN82aq7cyZ95xy3DErzc8vvO7DeLyHmoOcuwP/n6/DGxZ
         hMkw==
X-Gm-Message-State: AC+VfDywNYe3ysUMNTZgkX3ntCzxfd1FGDU/6k8tO5jINxMAWwqyDg1C
        10PlpkJShIekuo/0Bau9yjFxAw==
X-Google-Smtp-Source: ACHHUZ5N5HWekvFr0K66lggYS0aqJcCoHia21AcHCedlBnfdA7aLDt9GxSSzEBIoWYEuVNio2WSufQ==
X-Received: by 2002:a17:907:7f02:b0:958:46aa:7f99 with SMTP id qf2-20020a1709077f0200b0095846aa7f99mr2781417ejc.7.1683300186053;
        Fri, 05 May 2023 08:23:06 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id hy19-20020a1709068a7300b00961277a426dsm1053667ejc.205.2023.05.05.08.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:23:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] serial: qcom-geni: fix enabling deactivated interrupt
Date:   Fri,  5 May 2023 17:23:01 +0200
Message-Id: <20230505152301.2181270-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver have a race, experienced only with PREEMPT_RT patchset:

CPU0                         | CPU1
==================================================================
qcom_geni_serial_probe       |
  uart_add_one_port          |
                             | serdev_drv_probe
                             |   qca_serdev_probe
                             |     serdev_device_open
                             |       uart_open
                             |         uart_startup
                             |           qcom_geni_serial_startup
                             |             enable_irq
                             |               __irq_startup
                             |                 WARN_ON()
                             |                 IRQ not activated
  request_threaded_irq       |
    irq_domain_activate_irq  |

The warning:

  894000.serial: ttyHS1 at MMIO 0x894000 (irq = 144, base_baud = 0) is a MSM
  serial serial0: tty port ttyHS1 registered
  WARNING: CPU: 7 PID: 107 at kernel/irq/chip.c:241 __irq_startup+0x78/0xd8
  ...
  qcom_geni_serial 894000.serial: serial engine reports 0 RX bytes in!

Adding UART port triggers probe of child serial devices - serdev and
eventually Qualcomm Bluetooth hci_qca driver.  This opens UART port
which enables the interrupt before it got activated in
request_threaded_irq().  The issue originates in commit f3974413cf02
("tty: serial: qcom_geni_serial: Wakeup IRQ cleanup") and discussion on
mailing list [1].  However the above commit does not explain why the
uart_add_one_port() is moved above requesting interrupt.

[1] https://lore.kernel.org/all/5d9f3dfa.1c69fb81.84c4b.30bf@mx.google.com/

Fixes: f3974413cf02 ("tty: serial: qcom_geni_serial: Wakeup IRQ cleanup")
Cc: <stable@vger.kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 08dc3e2a729c..8582479f0211 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1664,19 +1664,18 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	uport->private_data = &port->private_data;
 	platform_set_drvdata(pdev, port);
 
-	ret = uart_add_one_port(drv, uport);
-	if (ret)
-		return ret;
-
 	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
 			IRQF_TRIGGER_HIGH, port->name, uport);
 	if (ret) {
 		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
-		uart_remove_one_port(drv, uport);
 		return ret;
 	}
 
+	ret = uart_add_one_port(drv, uport);
+	if (ret)
+		return ret;
+
 	/*
 	 * Set pm_runtime status as ACTIVE so that wakeup_irq gets
 	 * enabled/disabled from dev_pm_arm_wake_irq during system
-- 
2.34.1

