Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11355333D51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhCJNJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:09:01 -0500
Received: from mail-lf1-f51.google.com ([209.85.167.51]:46896 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbhCJNId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:08:33 -0500
Received: by mail-lf1-f51.google.com with SMTP id r3so25155430lfc.13;
        Wed, 10 Mar 2021 05:08:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IDSJEhR3nj5vbJCjgS5WrWjZtxX52Thgjco29XIGLgY=;
        b=JT8ejpoxgIz50uEJkFDHHBBgmZLtL58201nGKz7lZvn7BPHm1MXClOepL2hgwABjht
         fFYM1SwdZ6b8h/bmBcukQfqD2voQ+ij5CpwG/YVZAsN76tnEDpDFk6b1K8aAgT5h3w57
         Ul0nQ+l1bQ1bH72ZAs3HfEUu9bbA++nUhQTERoSqcg7AUtbEVkFA8QFaJ2YSWHVgESdT
         MqutPH0lV0lLV1IFWyd7W/sO0Ta/54tqb/lxlCSVfoM7a6ifTFLuKa+JYXyjYUrpeQmy
         belXHU8t0DYs/bH8PQuJh6L8VIgohSJ3SwF2WIpr6ido78+1eeZ9jOI094KtmiAV68oQ
         NVkQ==
X-Gm-Message-State: AOAM5315Cqa7dquYRIV83asLPVQ9V4uqlzMWJ6/FYY99uPNTv2nRdWoo
        46nUezMqOEflK4ZlUcKm+6g=
X-Google-Smtp-Source: ABdhPJwfQ0bt5y8RwlLFpXp+rNneUOk7FdAyE1c/hGg5LRZAlzot2uD8ixavdxwaSp3DLs+cK6wDew==
X-Received: by 2002:a19:4147:: with SMTP id o68mr2161232lfa.295.1615381711228;
        Wed, 10 Mar 2021 05:08:31 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id x31sm2934474lfu.10.2021.03.10.05.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:08:30 -0800 (PST)
Date:   Wed, 10 Mar 2021 15:08:24 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 2/7] regulator: add warning flags
Message-ID: <2a89e9208164b44b8179abe8719dc16100da4848.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add 'warning' level events and error flags to regulator core.
Current regulator core notifications are used to inform consumers
about errors where HW is misbehaving in such way it is assumed to
be broken/unrecoverable.

There are PMICs which are designed for system(s) that may have use
for regulator indications sent before HW is damaged so that some
board/consumer specific recovery-event can be performed while
continuing most of the normal operations.

Add new WARNING level events and notifications to be used for
that purpose.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 include/linux/regulator/consumer.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 20e84a84fb77..f72ca73631be 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -119,6 +119,16 @@ struct regulator_dev;
 #define REGULATOR_EVENT_PRE_DISABLE		0x400
 #define REGULATOR_EVENT_ABORT_DISABLE		0x800
 #define REGULATOR_EVENT_ENABLE			0x1000
+/*
+ * Following notifications should be emitted only if detected condition
+ * is such that the HW is likely to still be working but consumers should
+ * take a recovery action to prevent problems esacalating into errors.
+ */
+#define REGULATOR_EVENT_UNDER_VOLTAGE_WARN	0x2000
+#define REGULATOR_EVENT_OVER_CURRENT_WARN	0x4000
+#define REGULATOR_EVENT_OVER_VOLTAGE_WARN	0x8000
+#define REGULATOR_EVENT_OVER_TEMP_WARN		0x10000
+#define REGULATOR_EVENT_WARN_MASK		0x1E000
 
 /*
  * Regulator errors that can be queried using regulator_get_error_flags
@@ -138,6 +148,10 @@ struct regulator_dev;
 #define REGULATOR_ERROR_FAIL			BIT(4)
 #define REGULATOR_ERROR_OVER_TEMP		BIT(5)
 
+#define REGULATOR_ERROR_UNDER_VOLTAGE_WARN	BIT(6)
+#define REGULATOR_ERROR_OVER_CURRENT_WARN	BIT(7)
+#define REGULATOR_ERROR_OVER_VOLTAGE_WARN	BIT(8)
+#define REGULATOR_ERROR_OVER_TEMP_WARN		BIT(9)
 
 /**
  * struct pre_voltage_change_data - Data sent with PRE_VOLTAGE_CHANGE event
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
