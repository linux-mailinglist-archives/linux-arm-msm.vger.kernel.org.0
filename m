Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D322B96E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 16:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbgKSPwi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 10:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728873AbgKSPwh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 10:52:37 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5D3C061A4B
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 07:52:37 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id d28so5720042qka.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 07:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Npw6pndFeDGN1j2LCowh5jKLxcwFxW0ubJq0P0MtToo=;
        b=tzSx5BzoSWa+UyX23Szfm8Za+2AUHXHyE1c/mT8Nff0Lu1w8kEyfDAAdP57DYKHkJO
         oyfEj6ErpuYVuwv3FgF4lhNkvWwj4EJIs/hzwmU8+M6fasdS2y/UwZCbqx+8G7lfhqt1
         ga1EqQZzUpNH8TaRzgVMMhtemfyvlFCLuFtfcuMmnl6YxwXLVjWUKYb0k2RKp/KEhVwR
         aes6IhVH4Y1BRnGT2gIE2gVBpAz3GqTREs6T2yeYNWgTPwfvV3wvpNF69WaMgKRDk/Pd
         BrUWYSc3kAfGV4NdD0cfhjsxBeQk6eAvvUbhH4OrZ4P+0FROL3rtlVXPT/GqPkG9PGZG
         KYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Npw6pndFeDGN1j2LCowh5jKLxcwFxW0ubJq0P0MtToo=;
        b=N6JMCVDn9YfgSmEtn7rpxVNzBbUgz+D+9s7PA5EIMx/gsUoPHAMAV735X+K5jc9nL8
         qr37ELGYshwwVm/A1nBRn8rqY4yByFpxKMIHusW6+0Cf+W6xEQkPpXxibngmneFCTBtr
         PslsPAk6MtNxAnoVGFqf0H5Kits77i0KhttXP5SWRqGX5SdzEwLR0FGMPJzi2dMNm7FQ
         OXWb1b/iP3ur6MQMI6EG40buQI+xPIH9nq/As+yd58VpV9YrTNnGh19SFwzxWBmN/t3q
         11F9enQL9IMwKDsvTwoOdhCtJSP8yRmyf3C5xix5Bt/Mj8gAXcudVc2TE51Fe8nik3Us
         vD1Q==
X-Gm-Message-State: AOAM532Ddm9hPNXib5582aXilZptF+S40TmlT7bwG5Ycv9w/VGA3k4+r
        Ws3BUqkWg9OHztrSrVtdbMV5NA==
X-Google-Smtp-Source: ABdhPJzE/cpIdffZF7GXTI12bMsYjzDIHtiepu5cxTYppLPpKsAIMXNtigSCwXOsudsnLdzUqij17g==
X-Received: by 2002:a37:52c3:: with SMTP id g186mr11115468qkb.1.1605801156368;
        Thu, 19 Nov 2020 07:52:36 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id g70sm127290qke.8.2020.11.19.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 07:52:35 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [Patch v2 1/6] dt-bindings: clock: Add entry for crypto engine RPMH clock resource
Date:   Thu, 19 Nov 2020 10:52:28 -0500
Message-Id: <20201119155233.3974286-2-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119155233.3974286-1-thara.gopinath@linaro.org>
References: <20201119155233.3974286-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add clock id forc CE clock resource which is required to bring up the
crypto engine on sdm845.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 include/dt-bindings/clock/qcom,rpmh.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 2e6c54e65455..30111c8f7fe9 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -21,5 +21,6 @@
 #define RPMH_IPA_CLK				12
 #define RPMH_LN_BB_CLK1				13
 #define RPMH_LN_BB_CLK1_A			14
+#define RPMH_CE_CLK				15
 
 #endif
-- 
2.25.1

