Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E942D2EAAC9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbhAEM2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730218AbhAEM2h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:28:37 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0A9C061384
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:33 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id h10so17341808pfo.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HxQ9bQtIikQWDcNYhJoOP9WcMBp1b/WtsV26IjiPkCU=;
        b=UhugPWEIBZUPPw2cCeZde9yuLdlhdeiopaaoFSSVHqObHCAv59LydmJN/FBAHc6Cqc
         b2H5+wIi0zzJ4jf0R9DO4x3oO3go+DZCsFZ4f3Im2IZ/iMlVBVa9lRLM/p0DZOvv3I17
         UFcAHXkHO1mqvZRzAcZSk2D2cHaL8JR1cW2m/8AH6i0Fgr/oztfTdQa6Im0ujslaunid
         E/s9Xnb4prNaw73XgqM6SXIxkt6600t+j9V/eFos01DKqxH6zBvLe+xoOHjn3pgjMLpQ
         PpLGpGDsfCXoeiJpIH3GQDeirlwCpo/R/gG8cjKx/JDd6VDF+i19LXmXbEi0YfdPiQ5f
         tCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HxQ9bQtIikQWDcNYhJoOP9WcMBp1b/WtsV26IjiPkCU=;
        b=Mz3KmBUbr1QwUtEM8tx8R4gtOWZeGqgzNCHVFIJfYp46rraoV8JleZp8PtaIGY6HKw
         5ibdVOpUu/IjlqPVOBvRxO1XnGVN8+A3u5GcIj9LRvx7bnxefqgK8K8PzZtr2ZssFHNf
         9tXe8EAolqRYExna73R6jGp6GwNpWlI7s1qvvi6mFTTgQwvPFPktWpd4UXf1Vq9rf3sz
         4M54aOxz55KfZdtq2mm3efpCGiaXgb3jRPMRfV1YmYGfyxuevMZsxQGXntSoiTjUiJ+Q
         0JopXt8nCKm/xE0MSlHCv2zSkOwPT62cuDYTurngDVKeJOiwGEh1GFz3Jv8yomQwe6wW
         Nd5w==
X-Gm-Message-State: AOAM530KKsHvQJweSALSK37JGM0mr2h2ZCYK8bMCYW6ljmQ5ooSxXI0y
        uSWElrrSNbJq0rRq9B7JSR5y
X-Google-Smtp-Source: ABdhPJxBvHdXkX2j2SBnLoEJr0jLt1fBDvQ7PW2bOUln5256Uk2sqPMUjyvtNlpybwJhBmgnHxvfUA==
X-Received: by 2002:a63:f608:: with SMTP id m8mr11036249pgh.11.1609849652601;
        Tue, 05 Jan 2021 04:27:32 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:31 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 11/18] ARM: dts: qcom: sdx55-mtp: Enable BAM DMA
Date:   Tue,  5 Jan 2021 17:56:42 +0530
Message-Id: <20210105122649.13581-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable BAM DMA on SDX55-MTP board.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index 262660e6dd11..74ea6f425c77 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -25,3 +25,7 @@ chosen {
 &blsp1_uart3 {
 	status = "ok";
 };
+
+&qpic_bam {
+	status = "ok";
+};
-- 
2.25.1

