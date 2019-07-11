Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4860A6614C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 23:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbfGKVj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 17:39:27 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35244 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfGKVj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 17:39:26 -0400
Received: by mail-pl1-f196.google.com with SMTP id w24so3704851plp.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 14:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9mZ61KKydl7XtmWNflo6S6ZKEPWBoobMC4o1X6705JE=;
        b=Q9kxtIzMG+/cHPtBtK5ej7nEkTudPoiCgAxJCQ905E8q15MRjvpJyoLePOq5w2Rh9e
         N2Ki7Q9fEiPGECS399LS7Yu/ysSUP2OYQiWCKg/JHR0b7877DTTWD0mPR5rKWSxbRlgU
         EJXC09ODygN6Jz3uTqkC13VMVqbT+2I3oKyMwKTkzuoUANWfQ7VDuU0zH1Wp79jU0YGt
         1ivqHiuzBXYy7HIw1yygbcFjG0EFSAAws/HWOSVa3XE423YZLx/MrahGIWGJ5axSI0e2
         GE/vvqX3qaPw5vfa1+QPeX6m0csee/jdp697Ge7lc5fgiU0E7UBoqgDSHP9PpPkcdLNt
         ULlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9mZ61KKydl7XtmWNflo6S6ZKEPWBoobMC4o1X6705JE=;
        b=gGxotORObT0XdhlDRgkE1d3/EK5lIasGWMuuim2W2N2v4LwtWmR3PjDJGRwqM9EUGW
         EPbE89kz237OQ8hi7F12xiocXy2IblVFRZ0anev2FEh/+gKNnd8I+8RIOch0zhUNK5Ph
         Jh9OFcRCKC6/1h19aYDl6hhZAGatwhsTuubhr0vWCPkcg72XYz1VDf6rHf0zvclyI7VL
         Q7YVR9B3qXQFvcL73P2it4a0Bj3u55XLXU+kHNAYHrww1m7puLCeci58/PKHbo5e40w9
         WTLPEJYvEAL4UO0WEImwTFXgMk9yNwltgH611VNtf8ph2X11lUcIqktVtfoU26MsMG5f
         Nu5A==
X-Gm-Message-State: APjAAAXWLc5UsU6ZnLfXuSuO1qLg8GALhr47uZ54BNQqgCWBZ4XDCry3
        20Hq2uQZXq/scnrfpDevt9536Q==
X-Google-Smtp-Source: APXvYqwL0nczS205xDEJNOlUUIT7zzmK2cRm2lBMSSkHuuMfPKrktn8f73KVC66YmoAasygLkvCQEw==
X-Received: by 2002:a17:902:a606:: with SMTP id u6mr6497067plq.275.1562881166311;
        Thu, 11 Jul 2019 14:39:26 -0700 (PDT)
Received: from localhost.localdomain ([27.7.91.104])
        by smtp.gmail.com with ESMTPSA id w3sm5709795pgl.31.2019.07.11.14.39.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 14:39:25 -0700 (PDT)
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
To:     agross@kernel.org
Cc:     david.brown@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH v5 2/5] base: soc: Export soc_device_register/unregister APIs
Date:   Fri, 12 Jul 2019 03:09:08 +0530
Message-Id: <20190711213911.23180-3-vaishali.thakkar@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711213911.23180-1-vaishali.thakkar@linaro.org>
References: <20190711213911.23180-1-vaishali.thakkar@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Qcom Socinfo driver can be built as a module, so
export these two APIs.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Vaishali Thakkar <vaishali.thakkar@linaro.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes since v4:
	- Add Bjorn and Stephen's Reviewed-by
Changes since v3:
        - Add Greg's Reviewed-by
Changes since v2:
        - None
Changes since v1:
        - Make comment more clear for the case when serial
          number is not available
---
 drivers/base/soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index b0933b9fe67f..7c0c5ca5953d 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -166,0 +167 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
+EXPORT_SYMBOL_GPL(soc_device_register);
@@ -175,0 +177 @@ void soc_device_unregister(struct soc_device *soc_dev)
+EXPORT_SYMBOL_GPL(soc_device_unregister);
-- 
2.17.1

