Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 801AB4C6B95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbiB1MEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236122AbiB1MER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:04:17 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C128717E0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:03:38 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id i11so20966786lfu.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wpNOYJbLuHAROObNPm3JzKG5s6/JM5BLEeZyhqZ773Q=;
        b=forMbeBW4fCCoz6ra4j4jdnnt3YZ5ahGiQmjH2hEPf8wICpZ2GTJyc2R8kIwGaY8um
         e/YGs+u25viKM9bvkNlZUH3Lx6dQe3I52XSEKM08qaJX/yCTxlGYkcPqDgVwYXte+tgJ
         /+bLsSqvfLZw7RV+pmep9Tp9pwEuu8Zf3dRzKREoYtzPEaZKEnwIzQ+wsAi9d+cvUcJZ
         f8XNxY3wBPP2HUQJgwdr26xMCalE3ZecLpaFX8LcHUgIIH6Tzl4/d8P1xHQMQ14iGwV1
         7Ez6s4F/QyW5NsH7JW41bTJGQZpqCH9yiFBGBQl9J1ZXiStNGie/5fiTefAyWScSUDnH
         fwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wpNOYJbLuHAROObNPm3JzKG5s6/JM5BLEeZyhqZ773Q=;
        b=1DpS9TU/XO1aKaRiycjOQ4NUsu8RAdoAaYKMz+ZMpKvwxCOrVWZ3Sx1FX+sqXNec0e
         APbTjqECpXOoSlopwd/Qv0SvBInt0KwVdSQTYHXgaSOCZxixZ1Bbt+wj6gahEGJ+HPZs
         I6fQC4iHLJbb8jug8X61PRpNQG4AXvO3V43d2jRCarbgrSyl4Rh3L1fKYFVNA3Bdoi4s
         YPyIZEVctp/Kdii0T0Q/Lbpl7D/BX2xnStnTlNs2lWJvcHTzJFIYm0qhFQIDxx/nIQZR
         TRkonm5SaLOmLeJ+aU7tDcarN8zTHoyCUxUAWUVEVNJL4aj/et7e3ao3Rzmv9gdP8kjU
         zI6Q==
X-Gm-Message-State: AOAM530rn94l161vEFijVnYC4uRk5GzSy7B+e/8QB29ayyFI0g/t641Q
        98XctpbwjSE6YqkIgtrTXO/Jss5J9yzJ1x5A
X-Google-Smtp-Source: ABdhPJwjcDOJvwHIVv66Ff6OPuiGUnLQofUx6A6fszsDjXhpOsnULjPQPLHdH4yTocrBb1jVxciN3A==
X-Received: by 2002:a05:6512:324e:b0:443:b0a3:6756 with SMTP id c14-20020a056512324e00b00443b0a36756mr13127965lfr.613.1646049817146;
        Mon, 28 Feb 2022 04:03:37 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id a21-20020a19f815000000b00443977d5a61sm928516lff.110.2022.02.28.04.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:03:36 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 3/8] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Mon, 28 Feb 2022 14:03:34 +0200
Message-Id: <20220228120334.997058-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After merging lucid and trion pll functions in commit 0b01489475c6
("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
the function clk_trion_pll_configure() is left with an old description
header, which results in a W=2 compile time warning, fix it.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4406cf609aae..288692f0ea39 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the trion pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.33.0

