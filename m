Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F7D72273
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 00:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389571AbfGWWfb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 18:35:31 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44037 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728170AbfGWWfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 18:35:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so19821790pfe.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 15:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XiSb/xm4DCwF5YKTrgrsnR/pgd/JHfF4jO/yKlf55Xw=;
        b=UIcCj7zGKNeQd38ejX8qLsDggMutycfth0tbzNIdR6CHdwx00EJrTxiUeVBNbX16TX
         Gtd4Na72AzruzwW2DidqG3ah8MqqRAvy3n/+/gHWgoQpHBSPNKTf6YS8yEpBNkK5+T5D
         TIA/DRnhgixXmDWF7S4c/yoicBW386TtzL8oyVNKKN1+fZVhYXrjW6fi6bexHHxoTOdH
         Y5cYjYETesyRZ3PEWthJTe6fxiNlfl6yDbacb2y7Tamt8ZIErwA/gUzxyuSyAwKG389o
         xcVSv5MjMgEBXzJP3WGpuMInzRCli9mrrsz3lNTS00n6q16G6WZQTs/PZf5fZuxAJk28
         pBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XiSb/xm4DCwF5YKTrgrsnR/pgd/JHfF4jO/yKlf55Xw=;
        b=jSP1wlLiB91HkX/1SAX7gU//fT58jvb8Qyon1uvbmVOSZBkVgI9ZSdn9Q3kaHu0qJV
         Ie9TV3lXjm802mF/ffeTjpq0HlaZmGadXnO2OQAOQQrYN9LWOlS61xige7DRqYuL0Bvv
         ssdIiTBclJaNpbQKBAzGvUikBIrEt5tzz7h75WlQRLj3V8bjGu9lH5ZKdkAv9p9b3Ry5
         wsbHyxhJ+7DJoKywH6mizfI+riL2qd8CpXlXuHRRzb+e7JVY2P0JCjZgMEeN9ke2PyCY
         YGG+5/ETbnsJscfVnfVUEytDONgSuwAyv8kKEwW68HrPF9WTmU7bTDp5j2WKMQxmGhou
         C70A==
X-Gm-Message-State: APjAAAVdFNwZhhQvXwm2zBrf4RnbXhsMZ/NLJWzdhXBkJFRbynl0tL0N
        3HzBNL8+B82nAEfhnU3QFC+3FQ==
X-Google-Smtp-Source: APXvYqyLeXcfRNmfx416Y7McKDVBY/Rv0VoH/idk7vgEtG9OCSyJsCPhaSkeBGb6P87G88Zj2JwiIA==
X-Received: by 2002:a63:774c:: with SMTP id s73mr78620059pgc.238.1563921329404;
        Tue, 23 Jul 2019 15:35:29 -0700 (PDT)
Received: from localhost.localdomain ([115.99.187.56])
        by smtp.gmail.com with ESMTPSA id h16sm49036917pfo.34.2019.07.23.15.35.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 15:35:29 -0700 (PDT)
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
To:     agross@kernel.org
Cc:     david.brown@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH v6 2/5] base: soc: Export soc_device_register/unregister APIs
Date:   Wed, 24 Jul 2019 04:05:12 +0530
Message-Id: <20190723223515.27839-3-vaishali.thakkar@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
References: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
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
Changes since v5:
        - No code changes, fix diff.context setting for formatting
          patches. Version 5 was adding context at the bottom of
          the file with 'git am'.
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
@@ -164,6 +164,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 out1:
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(soc_device_register);
 
 /* Ensure soc_dev->attr is freed prior to calling soc_device_unregister. */
 void soc_device_unregister(struct soc_device *soc_dev)
@@ -173,6 +174,7 @@ void soc_device_unregister(struct soc_device *soc_dev)
 	device_unregister(&soc_dev->dev);
 	early_soc_dev_attr = NULL;
 }
+EXPORT_SYMBOL_GPL(soc_device_unregister);
 
 static int __init soc_bus_register(void)
 {
-- 
2.17.1

