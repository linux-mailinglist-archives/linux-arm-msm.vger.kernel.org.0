Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D068A1E646F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 16:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391240AbgE1Os0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 10:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391238AbgE1OsT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 10:48:19 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7ACC05BD1E;
        Thu, 28 May 2020 07:48:18 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id c75so13575879pga.3;
        Thu, 28 May 2020 07:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8InrAz2MhUrOgrq+PmAJiNC3B7TqEPBo9SqsNjP+O0k=;
        b=SJE4F0seUN//jFuZfCOVIagaBq71D5C3gP+r8zxrhnEFOnTbRDRMJIgaPFkPM7c7Ap
         eIkRMZ8JLmRFcM+/16p0r4rrHZ8Ie7sNTRTukQDlDZOMkhcAQrLNcrDRXtUr3j15/Vdj
         LRNeykS+p/Gm7VTCRi23sCwU6MJPqpt/lCOjWBXh2QU3pgDGURMdgowcp8JIT3FRYGHa
         VhiJ7RyOEQXhC182Fa/tw7kPVBwbs0BxbSe18fDVy80ef56o5iU0WwcsKznca98JncNq
         zm5qjYekMzyvcxNyxRDxntGcY5LI8uAFw2CiF9sUW72yvK9WY/dYjObhbz9wfZXnkG1n
         MMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8InrAz2MhUrOgrq+PmAJiNC3B7TqEPBo9SqsNjP+O0k=;
        b=Ibu2wIovt4oQi4akiycJ+PxqjoPII6NHAvjS0BayMHW+pCS8zqOCxEliFRgEuH35zW
         6yB5MuGjnJ56tRYxSHQbRfvyn+KKCgMRnD20gJ/8T8SYAqixmeXvI2gqGKnmC96/0PW7
         uMCwkKBXUQty+zwXWZubAsi15uFLhgX6imq3ZhgMWNZM0Qjcclxj/UivIUh3QcraO22T
         khmxtt31dKNbFRHHIWOnJv3ddyHlg6hSQMdKnTfKwzv1UUKWqgz//egbPqh/96DKCWz9
         wV+826j6XS9FRuAKOYCRZXc91d1t/6ek6txtaEJ+opQKonnLRfmsynsE3faAgA/Znamj
         Calg==
X-Gm-Message-State: AOAM533FyYhAP/LpxxprGpkcVMygOY5ZDCqhh15wpKwSNa07225s0rYm
        /RhfxL4H+ZgAlTU7+u+3OYE=
X-Google-Smtp-Source: ABdhPJwaswyUJScc4k1GPKu4/4jtDU7unMNp+7zesaj3KNqxLSTvlmwNqvHnuVaY3fxm8C84obzOqg==
X-Received: by 2002:a63:5054:: with SMTP id q20mr3306558pgl.117.1590677298406;
        Thu, 28 May 2020 07:48:18 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id y14sm5158107pjr.31.2020.05.28.07.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:48:18 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8998-mtp: Fix label on l15 regulator
Date:   Thu, 28 May 2020 07:48:14 -0700
Message-Id: <20200528144814.44143-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The label on the l15 regulator node does not follow the style of the
rest of the regulator nodes.  Luckily, no one has used the label yet,
so lets fix it.

Fixes: 31c1f0e33deb ("arm64: dts: qcom: msm8998: Add RPM and regulators for MTP")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 8a14b2bf7bca..cec42437b302 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -235,7 +235,7 @@
 			regulator-min-microvolt = <1880000>;
 			regulator-max-microvolt = <1880000>;
 		};
-		vreg_15a_1p8: l15 {
+		vreg_l15a_1p8: l15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
-- 
2.17.1

