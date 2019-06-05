Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 274D435BCD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 13:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfFELnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 07:43:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50235 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727337AbfFELnK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 07:43:10 -0400
Received: by mail-wm1-f65.google.com with SMTP id f204so1941606wme.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jzlILgVOq+qa8QnWXtHWObcbjxta0J+JIjopEg5uUuk=;
        b=Phzisd+Tdhfzrf2cnfJc7/3YsGZ48Ro4ChpgCOPMYGdsND4hfBtzYRbIro3IyIF/ok
         d2VoAM0CSoZqsLeb7daN/0gWZRf5oYOfyq6HbGajovhrFh9+ylcx1OfSnJPxDyboNKNr
         HMsHNOxcL/twPctqJndkmBghg6/cgcpivviP8tG3X6yJFC/6J1FDnX8ZMfAdcOoCwEOE
         wYt3lEugdF3bWe3lo3j+YIfzADWTggVyqZI8qjFBFYZq7yYU/hEkxsZURtN7iMzbDiKy
         SDGdToE7A6QwBNbr1y/nGX+1OFl/mOFABzdOKeAYX/+AtInl2tcDDgusYUFJjEOXiceF
         NJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jzlILgVOq+qa8QnWXtHWObcbjxta0J+JIjopEg5uUuk=;
        b=XhjOetr05ohfr8CL23VfrEA6ibcmFLMyEw1pV2RMS/9V/TxWRRtor749oqKiD9s9oD
         TYTKFq9HECRyxjH6DW5wmXDBL43wJ0PQz1NbmDZ9bjgpnuRzqQEWSwKjiDj4KeMmvt8h
         YazvTIbnQFQkvcvWGcOoBZwz1l0+ymo+bwrK/hsKeILj5vhr/MOdAvflMUpP+oVUNII2
         K8JDsEJ79/hxFtVqM3UY8shtZwIrFULyy6xysV/FK6+0wIaLwU3BSwu8zNEanlL46hDC
         AyVK90G8QpCNNX2fK54kSoyjlfL9Zp07Betp1YC9ozHPkvynSaU7mrMpNOiTwfv3VUlD
         QX5A==
X-Gm-Message-State: APjAAAUGgVGppofSbVCT8wQxUH/kcr3P57ILprwf29EoMPpUJgXkf9Oe
        AWolZ++BUiYw2GSwsEVKIAT4GQ==
X-Google-Smtp-Source: APXvYqyIKCzRjK5C2cfGwWv0aa6X+yD0CtMUNDQac+1g9TUKp+wHCO+xwEod0nMcftdvvIOKCPSkVg==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr22806026wme.177.1559734988581;
        Wed, 05 Jun 2019 04:43:08 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 34sm27718740wre.32.2019.06.05.04.43.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 04:43:08 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Date:   Wed,  5 Jun 2019 12:42:56 +0100
Message-Id: <20190605114302.22509-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605114302.22509-1-lee.jones@linaro.org>
References: <20190605114302.22509-1-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm Geni I2C driver currently probes silently which can be
confusing when debugging potential issues.  Add a low level (INFO)
print when each I2C controller is successfully initially set-up.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 0fa93b448e8d..720131c40fe0 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
+
 	return 0;
 }
 
-- 
2.17.1

