Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFA7C79793A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 19:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236789AbjIGRHh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 13:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240736AbjIGRHe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 13:07:34 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFAE1FEA
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 10:06:59 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a603159f33so150136066b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 10:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694106364; x=1694711164; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ro+pKVjgj+qjW5pgqGuvDVB8LEkYu3AYgnnmwQIWsbs=;
        b=DkLF9BLakKqZ1nl0ZBif+HEkB228iDqoeNH1R/e7YjL6GGxTlvryBFOYIenQIJ/6Vz
         ZIT5o5rzknOybS1UssTqdGtoQTzca1CISyoeiRT9Bom8KRR/4mLSKZj6gehnuQtXxGVN
         T+LcGUPZJB2IhJVfzk7hWBqhf9VpM564XqemhsUZjOVMHTER3NbaKCeuqLw3YsaWxrTP
         5lcJRU9VgPAurVRUFeXe7GA+oWpjKgceRPkf8KqqtBPvsyLc3KfvZP3oNbJIDX6ufSDv
         iYsVF05V2NtAXCA5ZJaLmVR4tz0PzdSXmaEkrOlXirCPrGn7TeNs9PNZPH/xfVPNtu5V
         ty7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694106364; x=1694711164;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ro+pKVjgj+qjW5pgqGuvDVB8LEkYu3AYgnnmwQIWsbs=;
        b=BcKmGzEiWm5fLpLXzTkFKQ6AXCgM1gG85zM+vlrNFNk5499gIt0PIRyzVVgAt1cYsw
         sL34mBcsj6xmZHFbmczfvHYVcwe6LtZ6OzXNbmGiFZSSvQ8/a3Vf4VsB1EhWjT4JO7Ul
         2EQn8g8BQtAsl2KCBemZN1mVxvFz7/HrcLJsDv2kuCdP1f16tzD0JCZCYEKsAWlXJ+Oi
         AS3DWddhdQCwspVXPtm+qC8hxBMKkAEQp0jO2y9AYH5w8gC8vUs88FfGtmCx0qZxOcSU
         +aiPeQAm/DmQx1aeSU4vUxk6mu1+om2bzqzBdm+JXbUNKqzB1kjA7PYyqC4/7ZoYseiI
         p71w==
X-Gm-Message-State: AOJu0YxYwPFp0y64vSR3nBPLnGDGd2qIoKMBgIzzgxLb1DA6qAHjovh0
        QXG/EdRpSxhfUZurYofLxdkfE2sQmc5LZKWeNQ8=
X-Google-Smtp-Source: AGHT+IFg0bFSC0lzaqVqa/PY0sh6IBWdUUoK9G2NFmiJdxUui9GFWOqDAfoxG2ThzfavR6oiUtxwag==
X-Received: by 2002:adf:e508:0:b0:317:6e08:ed35 with SMTP id j8-20020adfe508000000b003176e08ed35mr4543247wrm.1.1694080483294;
        Thu, 07 Sep 2023 02:54:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f7-20020a7bcd07000000b00401c595fcc7sm2026280wmj.11.2023.09.07.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:54:43 -0700 (PDT)
Date:   Thu, 7 Sep 2023 12:54:39 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: qcom-m31: Fix error code in probe()
Message-ID: <7926c8e6-630e-4d7a-b0b2-d29b3c8b2c09@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This accidentally returns the wrong variable.  It should be "qphy->vreg"
instead of "qphy->phy".

Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
When we're adding new drivers then we should use the new driver
prefix instead of the subsystem prefix.  For example:

 Bad: [PATCH] phy: qcom: Introduce M31 USB PHY driver
Good: [PATCH] phy: qcom-m31: Introduce M31 USB PHY driver

That way it's obvious to the first person who sends a bugfix
what the driver prefix is.

 drivers/phy/qualcomm/phy-qcom-m31.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
index ed08072ca032..99d570f4142a 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31.c
@@ -256,7 +256,7 @@ static int m31usb_phy_probe(struct platform_device *pdev)
 
 	qphy->vreg = devm_regulator_get(dev, "vdda-phy");
 	if (IS_ERR(qphy->vreg))
-		return dev_err_probe(dev, PTR_ERR(qphy->phy),
+		return dev_err_probe(dev, PTR_ERR(qphy->vreg),
 						"failed to get vreg\n");
 
 	phy_set_drvdata(qphy->phy, qphy);
-- 
2.39.2

