Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3611419C9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 13:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbfEJL35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 07:29:57 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36614 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbfEJL35 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 07:29:57 -0400
Received: by mail-pf1-f195.google.com with SMTP id v80so3095407pfa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2019 04:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=3omjhH7TbR3FmFs5TtPgVwPetLA6H87w8Ypx7qlc/xQ=;
        b=HoRmKH63l7C7FzvYpQKh9CZ7kohym54pLp7tXuBRX+GWRJfziLnjDDh+iRDQO9D9ee
         L4gUVGETEU2esvl0g5q9h3bRgSsop0fGsD0JpUSAmANdczdGmY6DncD+TdxbG83VSLOB
         ECMSRiDOXP/Qvyj9HQXFZqa4yto5zcrr+/ckIp8uh6ttN53QE3GNGRsdrEOGhUKa9tN6
         cpDhWAifzey2GtZ4GhvpKvoMeoyVVNA+uQAOJfdNMJAJKf91DdZ6OPg+2ndEz9dgdFSr
         HMdKg/UDzXCfEyHxEksgJUnkPpgp9Z2LWM6luP+ICipwxa3FyktPtwlvuTTzOwiY+Lzi
         QKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=3omjhH7TbR3FmFs5TtPgVwPetLA6H87w8Ypx7qlc/xQ=;
        b=n0bBw+JQc7+EwjoKmQ2UUVnj84NYHUc8lBUc9HbBFolHKwPVJHKD1uMDdkccfqd505
         doFXZlPlY+zId/YwBcq9gdatbk6faYSFQCVwvItCTeCxXI3XUdfhPl9sLfP66Iuy6LF8
         w/xQVmv5odK6Ttzc97mZ1KkPJnzgWrc5EKuG398cUdOMaDgAZGQAC0LfEzBJlq56efwy
         uyk8NK7ZuszjC9DBKstaao2GTf5htHiDHkKJca6WFDyuuRhdOyXyJzDRFMRTDyup4fj9
         tIs9VV7jM+tqTqHEkWCE8yIvuEWX1ZmLsPD0jnFRe9NaB34WWxPT2niZyC9aHTycY5FX
         W34g==
X-Gm-Message-State: APjAAAXt2vWDA6AttalIfVC2k5g3XJpORFxfNb2hwGgiQfRpe5R9CmJ5
        4bRgZ9MHyGhmOW+9LadI47V3wg==
X-Google-Smtp-Source: APXvYqzNyy7bxRrQ7l94JGdi1xN/ExFPIGkh1mhDP9vdWj+8z618L0x1+xHqlUuds8ama1WOaBRHOA==
X-Received: by 2002:aa7:820c:: with SMTP id k12mr13044777pfi.177.1557487796788;
        Fri, 10 May 2019 04:29:56 -0700 (PDT)
Received: from localhost ([103.8.150.7])
        by smtp.gmail.com with ESMTPSA id s137sm2854428pfc.119.2019.05.10.04.29.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 04:29:56 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCHv1 1/8] arm64: dts: Fix various entry-method properties to reflect documentation
Date:   Fri, 10 May 2019 16:59:39 +0530
Message-Id: <ab5bad0258e455ef84059b749ca9e79f311b5e3c.1557486950.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The idle-states binding documentation[1] mentions that the
'entry-method' property is required on 64-bit platforms and must be set
to "psci".

We fixed up all uses of the entry-method property in
commit e9880240e4f4 ("arm64: dts: Fix various entry-method properties to
reflect documentation"). But a new one has appeared. Fix it up.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 2896bbcfa3bb..42e7822a0227 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -51,7 +51,7 @@
 		 * PSCI node is not added default, U-boot will add missing
 		 * parts if it determines to use PSCI.
 		 */
-		entry-method = "arm,psci";
+		entry-method = "psci";
 
 		CPU_PH20: cpu-ph20 {
 			compatible = "arm,idle-state";
-- 
2.17.1

