Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13587470DE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 23:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243356AbhLJWfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 17:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243624AbhLJWfH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 17:35:07 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52712C061A72
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 14:31:31 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id p23so12027106iod.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 14:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CgSHoGMd3MZ0+RwfUhTHIWklywVMelQpZkd8mqp/LWA=;
        b=e/JZEyXrKeEX9SR7YbajTX+JIlRKoyFcw5w6VW20SGiQT9UomhQ4hygaYNTaU4Bn01
         8jkk0VcLBji3os506FJaVgwZgwj1N5OTLELoMWFtOCmdV1p/3vIWe9StYftFRvleNBVR
         JgOtgzxPgk06gSQijatDKzxM2Z1y9E0wL1MwVw/IYiEeBdmpl8sZWi4fTEZzIp33r3MQ
         0aXJHS/klf7yMjqp6LONi1tpQuxmjiq9OKWEKeFgLJqWIZllL2VvUP+ortPwC8KV2RYa
         Pr6OJVg0oMChDBpG1wJ9T4l74ObuanDiExVOjlNC/9UeVZXYVSFBO5ZIqQM1yc3WbCXX
         rdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CgSHoGMd3MZ0+RwfUhTHIWklywVMelQpZkd8mqp/LWA=;
        b=0uOrwV2keizPTDGdxg+NBbkNJOEyMI74+lCBZiiPwRRBwReF5W+b9S8ak/Bu7RwDUa
         nUjDtAx1UujH8yG/+1mJg6ij6SbQoJ5eHgIqaxepUNzZ+62RdOsDNtxZd4TwVI5ZuRn8
         NHT44CfNz7avNdTpBjs7p6F6P3Eu6ptPPvTjz73VsMwH8jM8MR+XM1Wputdk/JXskJ10
         DUE8LTyw5tb0UT8+mDfbvnBk3+KgY0+lKxqEN5ZH5bv7Npjq/solJ1jerXG1ZoxrumtH
         6SAsgH7wDcUBAhwJTYV67NQTlSWG2Hmt7WYKcIl6gJbn4eDQC71F+IQBbM3eblJBHDLP
         FcAA==
X-Gm-Message-State: AOAM533/+hn3Q0Drf29SkdadDxNiGL09a5hoGTdJO1RZajr/vhtvqQ8E
        JQazhADqMzmQ8X80p/4+yVcPPw==
X-Google-Smtp-Source: ABdhPJxJ2HPs8UlogyZ2Gs+icjZDUujFP0Gufzb4kOzlxXhOdNOSdtIYeCNaL34gHEkxdg3928jdGQ==
X-Received: by 2002:a05:6638:130f:: with SMTP id r15mr20409986jad.19.1639175490311;
        Fri, 10 Dec 2021 14:31:30 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id q4sm1279879ilv.56.2021.12.10.14.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 14:31:29 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     david@ixit.cz, manivannan.sadhasivam@linaro.org,
        jponduru@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org, mka@chromium.org,
        evgreen@chromium.org, elder@kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: ipa: fix IPA v4.5 interconnect data
Date:   Fri, 10 Dec 2021 16:31:23 -0600
Message-Id: <20211210223123.98586-3-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211210223123.98586-1-elder@linaro.org>
References: <20211210223123.98586-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the definition of the IPA interconnects for IPA v4.5 so
the path between IPA and system memory is represented by a single
"memory" interconnect.

Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_data-v4.5.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ipa/ipa_data-v4.5.c b/drivers/net/ipa/ipa_data-v4.5.c
index e62ab9c3ac672..2da2c4194f2e6 100644
--- a/drivers/net/ipa/ipa_data-v4.5.c
+++ b/drivers/net/ipa/ipa_data-v4.5.c
@@ -420,15 +420,10 @@ static const struct ipa_mem_data ipa_mem_data = {
 /* Interconnect rates are in 1000 byte/second units */
 static const struct ipa_interconnect_data ipa_interconnect_data[] = {
 	{
-		.name			= "memory-a",
+		.name			= "memory",
 		.peak_bandwidth		= 600000,	/* 600 MBps */
 		.average_bandwidth	= 150000,	/* 150 MBps */
 	},
-	{
-		.name			= "memory-b",
-		.peak_bandwidth		= 1804000,	/* 1.804 GBps */
-		.average_bandwidth	= 150000,	/* 150 MBps */
-	},
 	/* Average rate is unused for the next two interconnects */
 	{
 		.name			= "imem",
-- 
2.32.0

