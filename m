Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626633DC705
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jul 2021 18:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhGaQsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Jul 2021 12:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbhGaQsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Jul 2021 12:48:46 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B02C0C0613D3;
        Sat, 31 Jul 2021 09:48:38 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id go31so22892816ejc.6;
        Sat, 31 Jul 2021 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Itv3EyFTWcumokRJv+4xtM8tRa3dHKgfL3BSl35sNtg=;
        b=RMc8gBVjmrhRmfHHc5axvnUqMtSBNhCznVl9D9vDJkrIZ4cMP/GxoFi3avH1Kd0NxX
         +Imy7bhw/TQzw6xJHs+lnL7lHg4e6TEaKE7hKsP2l+u+UFHkUUZRhVNXdSabLWMFT/o6
         pQAQzyOC1ApkM9TQnJ3TbAlxpZxWkU5r2Bg7LXoQmxlvM8eyApNfEAk+KaxH3/vkIaMv
         ir0KrV8nSBucBAa1LdQfAO6l4g4aeii046xKbOKlcUz9tRaQqtksHiUZ/GExjF4DBiz6
         ChHocjHnOEtvMODo1vxmCN9ORthVo5oao1t15AsLzFX36R/r6jr8MYLBZaOIbozDKHkW
         AcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Itv3EyFTWcumokRJv+4xtM8tRa3dHKgfL3BSl35sNtg=;
        b=ehLBDO7I1ZDvYGOMagi3PARKAhU9OHtRy3CFgPH0T+3/qOsqTovzXc1bgosRuY8RJs
         aRXOJwZWXKFfIgF2yjhnoceYQo4sFcWs5N5bTjKBgnWIv6KShJXiYlvNOqa/HFJq08KA
         XXhwq2eNFE02YsbIp6kGZFfXu9uVj/ogJbZVpQoeMQAOyRRjItffMv/V1X5cwIFh4axB
         QMHvmwC4tJTj6pfAwM0Wcz6uGcPLeZPzR9dg/bmLamILTiBywI3XfPW4V6myjVRp3Sxc
         d+u02ZOkgLsu0hZOZohl57wxzDUTcso98IwXil2cvMP4FVJ9nennh8j2ESDPg1usoCG6
         AwjA==
X-Gm-Message-State: AOAM533OBJs0KzmMLFVmBSKos9OohTmTf1Qlkj8EBTT3dNehEze0dbin
        FBQzYRv35/G4IcUus7qHNF0=
X-Google-Smtp-Source: ABdhPJzdiwLAykEii1g8oPSYoK4v9fcdHEniAxW9WmM5r9ItlxJZaWg/XhwljtWU0zNTvIluNbcIxw==
X-Received: by 2002:a17:906:5a53:: with SMTP id my19mr7862503ejc.124.1627750117312;
        Sat, 31 Jul 2021 09:48:37 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id m12sm1941133ejd.21.2021.07.31.09.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 09:48:37 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v3 2/2] soc: qcom: smd-rpm: Add SM6115 compatible
Date:   Sat, 31 Jul 2021 19:48:27 +0300
Message-Id: <20210731164827.2756798-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210731164827.2756798-1-iskren.chernev@gmail.com>
References: <20210731164827.2756798-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for SM6115

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/soc/qcom/smd-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index bc0be1d4be5f..dfdd4f20f5fd 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -242,6 +242,7 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-msm8996" },
 	{ .compatible = "qcom,rpm-msm8998" },
 	{ .compatible = "qcom,rpm-sdm660" },
+	{ .compatible = "qcom,rpm-sm6115" },
 	{ .compatible = "qcom,rpm-sm6125" },
 	{ .compatible = "qcom,rpm-qcs404" },
 	{}
-- 
2.32.0

