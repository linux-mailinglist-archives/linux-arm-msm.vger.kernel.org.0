Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F051C45E2DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 23:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236645AbhKYWE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 17:04:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244108AbhKYWCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 17:02:55 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46DFC061756;
        Thu, 25 Nov 2021 13:59:43 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id n12so19424700lfe.1;
        Thu, 25 Nov 2021 13:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=56dyo2B5WxLSRjH8dLU5dNlhfoG71/Hfm6ftni52IYk=;
        b=Gj9ioyeu5vxUD/HRx+xbfHF3E4RnJfN7f2/LwnnVv3oBkGHAlqpW4z39byD07iqRX4
         IX9Ndya6zYUAI96mlNEV8/l42XS+j3AYE/nQ7J0bFqHJ9Nz8dzu3abMqY+pubG7/7dVJ
         ArowD055ei/XIvUsfp21sTz9PSkj3SjnSaDqi5DGB9iUnj+i4xAV74hUUyWLVl2pEf0U
         iisDp8CBLNkszEZac1BpVc2jUfssLVz7LRuZNrNkZbgUSVukxBWZQnUQxHxbXj8632xB
         q348tVJVa231eeOzmu7Dpu5EnBGoWxZC2g71NrAw4ArFyu3yZ217xoKX9mZxblKk+kJS
         yy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=56dyo2B5WxLSRjH8dLU5dNlhfoG71/Hfm6ftni52IYk=;
        b=SZy8gpSMxiKF+Yf2CbyvKhbhOdGJ8xH5QttrpmxXhSTCdxD3Ga3cziC7Q35iPy3b9T
         M2BlDPkA1KGTpF8h2+xbjmCqZx6eGpRJGYov3GWK3Mo5PsyRpuwovQ0L9T1vw4yMrle2
         H1kKRPtuyNkZSbgXiowEd087JmVV9fjE7DBauP37DHTI8rqIGXb3CuRQKT51MSVVqEHM
         HS6QDsMCjxz9XuPKy0qai38ne6jF9CxkY+6i55vTmEP3Dg8UmyN5pMItTD498rdqQeFf
         ckosdBfigbIbBNjL8XJceTIYI6Vv0zzPZ7bXTqlFlbyijbZiXdhl2+VDyHipKCE7MhAq
         vSqA==
X-Gm-Message-State: AOAM530MUKPZ331h2bVn61s5HHS7LkIXqGWDINZmZH7YWFdMNGy5MSIX
        IekZeDFgsxws/zwPTbFSTK0=
X-Google-Smtp-Source: ABdhPJwbBvp5EjMkUyfLTw86uq+ddhDMAjDtc0EQrDqaLK8kdNN4KN2BSmxr/Yq/nrnQ20afqzbaDw==
X-Received: by 2002:a05:6512:90f:: with SMTP id e15mr27532185lft.552.1637877582147;
        Thu, 25 Nov 2021 13:59:42 -0800 (PST)
Received: from localhost.localdomain (public-gprs212807.centertel.pl. [46.134.170.136])
        by smtp.googlemail.com with ESMTPSA id m10sm338611lji.11.2021.11.25.13.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:59:41 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH v2,3/5] dt-bindings: regulator: qcom: spmi-regulator: Document pm8226 compatible
Date:   Thu, 25 Nov 2021 22:59:14 +0100
Message-Id: <20211125215914.62508-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125213451.62010-1-dominikkobinski314@gmail.com>
References: <20211125213451.62010-1-dominikkobinski314@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
---
 .../devicetree/bindings/regulator/qcom,spmi-regulator.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index 2b544059e029..c2a39b121b1b 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -6,6 +6,7 @@ Qualcomm SPMI Regulators
 	Definition: must be one of:
 			"qcom,pm8004-regulators"
 			"qcom,pm8005-regulators"
+			"qcom,pm8226-regulators"
 			"qcom,pm8841-regulators"
 			"qcom,pm8916-regulators"
 			"qcom,pm8941-regulators"
-- 
2.34.0

