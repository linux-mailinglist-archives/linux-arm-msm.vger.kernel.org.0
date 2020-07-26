Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D8E22DE3D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 13:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgGZLNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 07:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZLNs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 07:13:48 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A12C0619D2;
        Sun, 26 Jul 2020 04:13:47 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id c2so4217516edx.8;
        Sun, 26 Jul 2020 04:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UbgBtdsZGIemXshDXMwmxf8DoQcpEbxLRUMayd/h/0g=;
        b=GkEdKGdFtTYQj/wFf/bU8fnqXSKDhM5E0FjRRZJL84pEHDMtWyOnAXT6OdfN3bhReH
         sKyk7syptobl4TxxsRCJ2Bn7k/nQuTFBkLv3Gii5l6BaMg/RiOg8rhssAI8l8Z9aTqwO
         n47zSWet0TK8BesjiHOnq7Yj/MN1tg9VGJX0gvgtHpC7YnDsU6MKf0d5rnh9gF6SkJa+
         GvjFgW++sRaGks9UYMNByvlEGD7rXzJyPc6XZpQfkwn98nPPzwgt6W6jjnl8lJbL6577
         vQEq6d5cWTmTzNBS10zqJ+6xWqFgtofWSJ6KOOVBHMwcGRl3OOqeo/2HPU/HwPzsDy2l
         icVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UbgBtdsZGIemXshDXMwmxf8DoQcpEbxLRUMayd/h/0g=;
        b=cODFBRq51n9kKsg9DMHb6j9D5wXoDisf2H1UcaXjsQQT/YyscMqvHQRmqtSpkibHvD
         od22IdYhH8HZsUbi2orlPX7ms0Ycz8meu97Myw+Yyjc9xgFPktYlKScS6rdKTBzuJtnV
         F/sTVssn/cSpfolGZS5BpkJEmEPGKNmfIffw4zKMoDap4SruflyCl2pRaFxQzIBtoa+V
         gc/c2SD95xGQAjZC2c4SzmsyGvjlYapIY4cMw1vMqvca2Fou5EzWWfSW2eUWMI5/yQ1X
         3XjugQ1/18mdDuHxHTW9LjZnoqVzjmNcQo7+sNyynMIn5U4/kAZZDx0VkRK3arjw2xzr
         b/iw==
X-Gm-Message-State: AOAM531S5HutGbWwezfmhDUkZMF6xP3KTncHYqjHK9x7AjjlsR4nQR75
        cZIzJLcyapRdYvnRtB3onHE=
X-Google-Smtp-Source: ABdhPJzOyixNGF0EsoqZKZkm/6+YqgQs81jjv0P0Oa8ZJNnWeDK79k8NR0e7xq+4mLzEswwNytYdaA==
X-Received: by 2002:a05:6402:308e:: with SMTP id de14mr1187894edb.344.1595762026436;
        Sun, 26 Jul 2020 04:13:46 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:13:46 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     martin.botka1@gmail.com, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/9] drivers: usb: dwc3-qcom: Add sdm660 compatible
Date:   Sun, 26 Jul 2020 13:12:00 +0200
Message-Id: <20200726111215.22361-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 drivers/usb/dwc3/dwc3-qcom.c                         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index dac10848dd7f..c5280d6406ec 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
           - qcom,sc7180-dwc3
+          - qcom,sdm660-dwc3
           - qcom,sdm845-dwc3
       - const: qcom,dwc3
 
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1dfd024cd06b..d6b3e1bb550a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -753,6 +753,7 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
 	{ .compatible = "qcom,dwc3" },
 	{ .compatible = "qcom,msm8996-dwc3" },
 	{ .compatible = "qcom,msm8998-dwc3" },
+	{ .compatible = "qcom,sdm660-dwc3" },
 	{ .compatible = "qcom,sdm845-dwc3" },
 	{ }
 };
-- 
2.27.0

