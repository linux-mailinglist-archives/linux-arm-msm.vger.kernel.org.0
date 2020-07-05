Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A991E214D3C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2020 16:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgGEOvI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Jul 2020 10:51:08 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22904 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726861AbgGEOvI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Jul 2020 10:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593960667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=iXCxfmDIqLR0YY1Yveu6peJuEk9aFuiQ279/+YX39vE=;
        b=CUapmOSATJPlmXBRmthecAt0bKJoX7a1NUL7a3CHC4ihi1ZALD8v1etZ4OcoK7huagyxkg
        lhkMWvAsGiOgmPUtniHMwJ+kdYiaR2QBcukGLI2EoGRGbRjY0CRiI2YPkkfeYiSaPDCmeY
        xYPBcKnWyczGtZW6ELG0SJRfHhR4aIE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-sYR8LL4lM9eTAXO25v2XaQ-1; Sun, 05 Jul 2020 10:51:05 -0400
X-MC-Unique: sYR8LL4lM9eTAXO25v2XaQ-1
Received: by mail-qt1-f197.google.com with SMTP id y5so26202966qto.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2020 07:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iXCxfmDIqLR0YY1Yveu6peJuEk9aFuiQ279/+YX39vE=;
        b=fx1ZGlh78j+A3GZd6zrK43tRpY5aZbjiBIEOobAw2lCAlIg8xuIcclkUNMsBHEcYlB
         91ZLAKdutAhqV2ppn4tHicfdErvtXBq/4u2JkLbEG61rKITNTvIn70VABBxz9SjtvMEJ
         iTO+nB04qrZFEJ/tjoxeRlq3UzZuTjNjoStEvplad18M8Gse4jk66IMDipTAJb/f7MBk
         thkj2VTU/1C41TGq0uYQnuRfx6XC4roFcBizJMXZASVMOkqlb5s/ecPp4XQkhCd6Ocxi
         sE6xngR1MJIjYYn9iXE2Upye4lDpEAaUoGTmjtN4IDBQ6soO+ybrhrA+b91to5XdDsdq
         ONrQ==
X-Gm-Message-State: AOAM530tXNGaEXLKYOBqFPgKdmE+q/Xrbrlwl8fwgwN9t+25hBQiUhsr
        osAe5SLUyj2MmzDnzXdis6bHB1jUWp67p3vkFkOUnigadoXsJGx74VROd+RrZlb69PuFim7GPwA
        6Dh9X+Njm4CIUqUm7TM6wnosQrg==
X-Received: by 2002:a05:620a:1282:: with SMTP id w2mr41504922qki.196.1593960664740;
        Sun, 05 Jul 2020 07:51:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWTIqnguVvpnywYSxPHy22VXsfHPo1AXr38eRYcmQQNSWIJu768VxjNNiP3WlrfVmxuHOCLQ==
X-Received: by 2002:a05:620a:1282:: with SMTP id w2mr41504905qki.196.1593960664505;
        Sun, 05 Jul 2020 07:51:04 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b22sm13573907qka.43.2020.07.05.07.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 07:51:03 -0700 (PDT)
From:   trix@redhat.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] soc: qcom-geni-se: fix configury of qcom-geni-se.c
Date:   Sun,  5 Jul 2020 07:50:55 -0700
Message-Id: <20200705145055.14629-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Tom Rix <trix@redhat.com>

In a randconfig, qcom-geni-se.c breaks with

drivers/soc/qcom/qcom-geni-se.c: In function ‘geni_remove_earlycon_icc_vote’:
drivers/soc/qcom/qcom-geni-se.c:819:11: error: implicit declaration of function ‘of_get_next_parent’; did you mean ‘of_get_parent’? [-Werror=implicit-function-declaration]
  parent = of_get_next_parent(wrapper->dev->of_node);
           ^~~~~~~~~~~~~~~~~~
           of_get_parent

qcom-geni-sec.c correctly includes the linux/of.h header.
But the header depends on CONFIG_OF being set.

So add depends to QCOM_GENI_SE

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 899f8c066797..f699cfa33d7d 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -29,6 +29,7 @@ config QCOM_COMMAND_DB
 config QCOM_GENI_SE
 	tristate "QCOM GENI Serial Engine Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
-- 
2.18.1

