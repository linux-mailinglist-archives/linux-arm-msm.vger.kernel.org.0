Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A97E1FEAF9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 07:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbfKPGoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Nov 2019 01:44:20 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35184 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfKPGoU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Nov 2019 01:44:20 -0500
Received: by mail-pg1-f196.google.com with SMTP id k32so1299539pgl.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 22:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=83mOzCZrk2hLeBIavxFW02Ub7zgigDrZgcfo7Rp02xE=;
        b=etF6/auczY/PHyj2EW/5m9MAfa7+4KhKO2DKDAQqUiiJ/HJycDvebsWhFyy7ltErNz
         GPdUetQoCqDTxijT0aZPIe5TPLoBcuI/HcwwSLoQvfsRwKrEcXKyfNi58/nXbyswpqjH
         BprxdonwAHRWF6P4gsThGhzKQh/Py9iApmDHlM3sQN6OXVP0V9y6jMAMLR3TIIUCIAOs
         wiAUpDM/MxLmyKx/CsTNelNQqSJLaS4PsRhsYQm37K7kVfWPrj01BPVG5X/0yGHts/rX
         wRCVlVZ2lrtpKQbhURCDfqzz26gKxLE7PQlrRpXzosM17VsQnO3aK56Z84Nzqk9noZcq
         43eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=83mOzCZrk2hLeBIavxFW02Ub7zgigDrZgcfo7Rp02xE=;
        b=mFKS89Gl+sDH9BBBx+ptXnBLt6v0+VAqdHpOmOXcT674cGxWarpMuvy/K4WwQ4IoIm
         j9/0kNVye/5/KaS7NAVU1sYEXok4TYF72EF4cQJGN1x6pynGjLE0I7jh1Ktc0adSS3dJ
         dUm8iTS7skhMnGJI1MWTC1UZEmSfijLQ+eDvRx2XVKBU+ksAJu6D0k5VHHcArw+Rh+3U
         /IkPWfrQljYc8ebsmu1S2B4/8zfTtXgrdc5oSO9gARy0l4C8r/lS2VaaiNAiqN1bJPx6
         4CMCc+nCl+4UrznySuwGAGeuElVAOA7e31lLNNKlvAlE6n3oa7ZLp6GmDZb0zLGpuuMG
         wTVw==
X-Gm-Message-State: APjAAAWs39r1dc8viR8jMPbGHEardr86Vn89CtQK7zeA2QTVfanGm+x/
        B/O3tOiv6OjHB3tfbfl7zoC7Tw==
X-Google-Smtp-Source: APXvYqwkM4lZh6cRGZMVmRD+7muqSOChY7AWDb7zXeO/JwqTvRigHw1HpZUm08pwffapf4Vo4sOuEg==
X-Received: by 2002:a63:5164:: with SMTP id r36mr7664120pgl.143.1573886659746;
        Fri, 15 Nov 2019 22:44:19 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f26sm10985615pgf.22.2019.11.15.22.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 22:44:18 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8998-mtp: Add alias for blsp1_uart3
Date:   Fri, 15 Nov 2019 22:44:15 -0800
Message-Id: <20191116064415.159899-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm_serial driver uses a simple counter to determine which port to
use when no alias is defined, but there's no logic to prevent this from
not colliding with what's defined by the aliases. As a result either
none or all of the active msm_serial instances must be listed as
aliases.

Define blsp1_uart3 as "serial1" to mitigate this problem.

Fixes: 4cffb9f2c700 ("arm64: dts: qcom: msm8998-mtp: Enable bluetooth")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 5f101a20a20a..e08fcb426bbf 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -9,6 +9,7 @@
 / {
 	aliases {
 		serial0 = &blsp2_uart1;
+		serial1 = &blsp1_uart3;
 	};
 
 	chosen {
-- 
2.23.0

