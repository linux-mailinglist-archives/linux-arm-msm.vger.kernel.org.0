Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD880F26B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 05:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733118AbfKGE74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 23:59:56 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37906 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfKGE74 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 23:59:56 -0500
Received: by mail-pf1-f195.google.com with SMTP id c13so1502330pfp.5;
        Wed, 06 Nov 2019 20:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HWH2JNED9UMHm88oRTrF5KMnkBCYYKbB6EppEgBO7N8=;
        b=UsEFNnN9kZvrI6zrjrzWc40K7JQDT9M/iOvwky0/IPaSVg01eiV1x8KO0XRQu3aHZ5
         Ij0zBUDbblyqW8+J2FY+rQvWJori921HLGLxe86verJIcWvUYoA2jEAADzrX5s9trHO3
         k0Y+UB05NIAneBazZpRoyPBq6rhcUNxLB+47nJfTA4NkW5xRAMMOzLXeZIlDjqw3zi6N
         z4Om7k5wHLAPC1WYUfFR4n/6vN+0LA9IioD/g7B42ZOopcVXllzHi7AkfrzuS3IIpq8B
         H+WNnLZ3o5QxulOIT8KkDvIU/X10hW2vN6bmD43AxNwI0SM23OkEvKdMtvBHCQX1CDIk
         LmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HWH2JNED9UMHm88oRTrF5KMnkBCYYKbB6EppEgBO7N8=;
        b=hht05oh6gvb21pklRMgxKmiT6z6sXP30JWYQJaGULv+8ZUnEULcso8+/cq4m3KGYad
         aXrooxEfb13Kvgq7PoWynovaWQcwikpi+v9a4FJzlZpIk6HIq7b156/V9jhmfd7LhFT1
         PivzeXBOlqVBeqmEs2rGFBlR0hXzpMGtJ2ig1KxiLyYwJVNbfJ53rppRr9Foc47Em8YB
         k6QL8n5GoD6xkGuv1ZoPmj7QLMhitTpufsqWiRz6w2NNZbtOwp3Rdh0xfLDPDZoZgYap
         OBQATg8PpIMSrKxLiDN/iKD/JU7BWGOXJNsSzYLSKxytVl2+z2xLZrnRhahG7NlcIEFo
         zUUQ==
X-Gm-Message-State: APjAAAXIvbSjNN5W0ULqlSeOA5HE9+MEqDyVTC7mYk/CE67LGDQz+lWo
        qJxzlHDadYGVMdEYzUr1zWk=
X-Google-Smtp-Source: APXvYqwd+YlhHhhDUThAUYqhiTKByRHlliDBLUYyrGUbMG8FjccL8P+4FzOsjomtIn3MJboi1QHgrw==
X-Received: by 2002:a17:90a:fc85:: with SMTP id ci5mr2424273pjb.17.1573102794561;
        Wed, 06 Nov 2019 20:59:54 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id i123sm828172pfe.145.2019.11.06.20.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 20:59:54 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8998: Fix tcsr syscon size
Date:   Wed,  6 Nov 2019 20:59:48 -0800
Message-Id: <20191107045948.4341-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The tcsr syscon region is really 0x40000 in size.  We need access to the
full region so that we can access the axi resets when managing the
modem subsystem.

Fixes: c7833949564e ("arm64: dts: qcom: msm8998: Add smem related nodes")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index e624f0323d23..2d0ef426c2dd 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1011,7 +1011,7 @@
 
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
-			reg = <0x01f40000 0x20000>;
+			reg = <0x01f40000 0x40000>;
 		};
 
 		tlmm: pinctrl@3400000 {
-- 
2.17.1

