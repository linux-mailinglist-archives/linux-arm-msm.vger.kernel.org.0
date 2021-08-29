Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1AF3FAB0C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 13:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbhH2LSx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 07:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235110AbhH2LSw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 07:18:52 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF86C061575
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 04:18:01 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id y23so10516876pgi.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SAoDhMJcJw/JNrAyWJntSqtxMB6xb1NpJmbv5t83Gjg=;
        b=oWox1U7kHqQx2Aeo6rJHDWwXkAfKWCvDJZIWwstFLkOLqoFHIocMnTKG/g62KuDI+W
         9qQfpekszP5RnyZkvi3HedKo1UMMIIpoyXenq5WE/q26wv8N0OEiG437h40+vf8eOBi0
         guJTfHGRu9D7dU5O+CPsWHvAz0cJR5FAlkhpN2nN0H56w4XLmGcUct7CAMJ68uzbhOpq
         ln8eAP4ihzlo8ABlA2ADV08QBC0snpS8fMFjIhjkfk0IicvsPFjVS5eV3RjgPM3Ptht9
         i9seNq4YDWaxCJlh1VQ9+EZHFAsfWpLNN7eCD2qxWGaPzq5jwLLNMuon1x3aiEAAc9YU
         n6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SAoDhMJcJw/JNrAyWJntSqtxMB6xb1NpJmbv5t83Gjg=;
        b=C+v0CKHHnAtipo+PYFQIF5hF3s5ayOC6vHk2niUuSwK1cwyVU1obE6AFCJuDV5T95r
         yGQE84ZhOOsiDm975V6vnXvb9DmhOJjuaHmlUW+AbiwdvFvT3mu/8W36e8sR1H6nzfPM
         6ljN6G29i0bhDZR3d+881EoHQHQe18hvGcvsDZOb6z3W8/lOVXrbcpwGg2t6tCc6Gex5
         MsSWrBGDKAf32ErciLz8asYT2YGZzFSzNKyaoUH5w2NLk8VSXLQpcPiqNXpn1HJwZVI2
         6J1ZjspDzQGq/gdhJmT3jSLS7lIvpyfrLCyarzxVVQH/g19KcKeVNngYt7+HoFhcRV4a
         Iimg==
X-Gm-Message-State: AOAM532+F9z/HOqPXn0MTuHuOqhB+f9R8HUFTZ3KYmqQyR9vabepsso9
        oHS3scVkPVD9Up/l9u5uhWYpi9i3LRWsXA==
X-Google-Smtp-Source: ABdhPJyhUyFXSYML+bpfW4jltSp/RI9ithgvWY2mhrvG5YIR2LuiQKt68udLrYkEl3iUnjWsVZ1L6w==
X-Received: by 2002:a63:fc0a:: with SMTP id j10mr16417786pgi.136.1630235880666;
        Sun, 29 Aug 2021 04:18:00 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id gn12sm16857115pjb.26.2021.08.29.04.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 04:18:00 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: ipq6018: Fix qcom,controlled-remotely property
Date:   Sun, 29 Aug 2021 19:16:26 +0800
Message-Id: <20210829111628.5543-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210829111628.5543-1-shawn.guo@linaro.org>
References: <20210829111628.5543-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Property qcom,controlled-remotely should be boolean.  Fix it.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index d2fe58e0eb7a..7b6205c180df 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -200,7 +200,7 @@
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <1>;
-			qcom,controlled-remotely = <1>;
+			qcom,controlled-remotely;
 			qcom,config-pipe-trust-reg = <0>;
 		};
 
-- 
2.17.1

