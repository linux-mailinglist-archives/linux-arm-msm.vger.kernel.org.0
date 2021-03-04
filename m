Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFE132DA97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 20:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233711AbhCDTuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 14:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhCDTuS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 14:50:18 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F056C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 11:49:38 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id 130so14488344qkh.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 11:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGdJz+F7X0YEt83RQ+ubusZIDW1JVh1grqyHtT5UzMM=;
        b=LgJjks1gY6hesLWCBLbeQ72UJ/bbmO2sufio87kHG+xYrjFTzqgXsEkS7aa9nU58ee
         5LEMGPvWEdLezDaalptz3EG6Pz3H8KLvb0GXxspiYlH5Swi0D6EPQj+uBc3MNd3DgyHX
         xhM95emL2cvGV5tTlBK+tMUYiJUwuMjla2ooSmZ6hW/IGOlMbk7qH9twVgYcsIkb4Gq+
         x7uWN3LbmrLxJg9HVf2LiV4WaxUZUTtP5jA/Bfm4TIzuC+oZrJZce+Sm/UhK8rvpYGM8
         9Ut3jXX6bdtuWHfjpKcVD3obWhPfEt0WD81cVJdUPeAke0bTzEYO7wz9GN/2DOwljJll
         HuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGdJz+F7X0YEt83RQ+ubusZIDW1JVh1grqyHtT5UzMM=;
        b=r/uzm3JSmLNlGBT7TJ2rEEqT0a+mfXD/dJSmriHM3Oeo7k3BY49Joz2JqE7I0wxwFS
         b3UhgPpxu4ztwtbX0bh9BZxrZwp0OTPLw35K8mI/8mQOFTSXVBpucLuhmwWYf3g4VcBD
         gPJpxKK9YHNJ91vL7XJne0B7l9KRAKYc/6oSjNKG6NRSrMAVstATOn1Lt696Mg1MRYwM
         Yrtca5n7nq835VGf4sQye/sb+xVBypyJxNxrSH8cmurZWL9AvtMqP5Z3hIOqAl6ziVfB
         AIzmWfc/DwbVGBMLIuhkFkk80YTs0n0r93g5HU6UR4+UPubzCKuzAXkYfcJ+IbjWd8EO
         1aAA==
X-Gm-Message-State: AOAM530SKbM6sFARWTQoO8sMZKvEdnQKueelmt/yzWqOoqk8+QSks62s
        ghZChoLdUR+DEOuIUJOo8MoynAvalse+fQEo
X-Google-Smtp-Source: ABdhPJwXKuTqgQfGdVQj9GpZbfdRvSCkYzjEAzQEqWN+UBGguJj8YzoO+VZRqRPOfUA4GqwKo7FhVQ==
X-Received: by 2002:a37:6397:: with SMTP id x145mr5479020qkb.358.1614887377405;
        Thu, 04 Mar 2021 11:49:37 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id c22sm392908qtn.74.2021.03.04.11.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 11:49:36 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: qcom: lpass lpi: use default pullup/strength values
Date:   Thu,  4 Mar 2021 14:48:16 -0500
Message-Id: <20210304194816.3843-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If these fields are not set in dts, the driver will use these variables
uninitialized to set the fields. Not only will it set garbage values for
these fields, but it can overflow into other fields and break those.

In the current sm8250 dts, the dmic01 entries do not have a pullup setting,
and might not work without this change.

Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 369ee20a7ea95..2f19ab4db7208 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -392,7 +392,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 			  unsigned long *configs, unsigned int nconfs)
 {
 	struct lpi_pinctrl *pctrl = dev_get_drvdata(pctldev->dev);
-	unsigned int param, arg, pullup, strength;
+	unsigned int param, arg, pullup = LPI_GPIO_BIAS_DISABLE, strength = 2;
 	bool value, output_enabled = false;
 	const struct lpi_pingroup *g;
 	unsigned long sval;
-- 
2.26.1

