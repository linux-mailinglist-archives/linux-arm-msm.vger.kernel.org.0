Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3319E440F3D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Oct 2021 16:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhJaP7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 Oct 2021 11:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhJaP7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 Oct 2021 11:59:24 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3A9C061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Oct 2021 08:56:52 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id d27so6649164wrb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Oct 2021 08:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6OHQ0j+K5/2L6H/BDjjsSj67/Mqdw9hhXfzGPbI3ow=;
        b=Hn4/xvs94xjsw6q/N86TxoW8/v9nYpuk10CDfOgEktKILHkmK0sOYnZExTH5Mzh9TC
         bjeFj/SNIPz3uK9craKkt6EqjBE29S6xDrJBFY4Nsqex7SnytmUTgd9CqJ4FHwCodV0B
         RmhjKqLglOIfJXcakw40fAXdRm0kLmaa5u/P/thn/K0OJ2YE3/b5HmARiPbAs3qs/UeO
         70DQ4zqILITBZM++Y3ELED2pzbliHmXQSdreUhDSYYEp7fA9dg2u1/JiA27PbDKzgA3Z
         SGUe9pBCVwztrIe7y6a/g64qTRfSvHZwlcfuNgkaiVJFwFunwHtQD54unk5XcbNo7rnm
         I44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6OHQ0j+K5/2L6H/BDjjsSj67/Mqdw9hhXfzGPbI3ow=;
        b=qtHRhpOZxsVrznD4psZD3/sUp9JUHCsWPXTTXEekPc/sCDthPnobJDCT3SkiPKvfUV
         qkLWDPNOFddetjh2cGGpKYmpMEXdR/GuG/XekZ8WGmNIYp6Q+gLWIPZnDVnSaiowLPLM
         liDDna4p9upwzmncUs2FULviEylzFulsEUpmjAcoFqrRUbsg83olR8G/vXka1NZ6r7d+
         FH2qTFUPYPCkVIjTWJcrZANcwCekr/RTB0ERFVeGwVIgR4WRs8Qe6Lb4s0EelxstQqgH
         cUeulZQAcXF0FlUKPQWeDjvMTNMejMsmlpc2I0gxvzCS4Jx050okN0EsaqWmVONDI8+L
         Ywxw==
X-Gm-Message-State: AOAM532adPxOfhUHMfIBfCqY/UUE3DHHe9EegAO01KndyaCZdLsTrQ2/
        N+iZxx5hhBPFZaogTvP5WtvanEbzqxY=
X-Google-Smtp-Source: ABdhPJye7XXl1ozYHkhy+BRywRL4rcN4Q2bXGzlX7W1zskTg36cdMPUj0bMfQ3sisQsoAHhsPGYlFg==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr3401449wrn.247.1635695811466;
        Sun, 31 Oct 2021 08:56:51 -0700 (PDT)
Received: from debian64.daheim (p5b0d75bd.dip0.t-ipconnect.de. [91.13.117.189])
        by smtp.gmail.com with ESMTPSA id q193sm6809107wme.48.2021.10.31.08.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 08:56:50 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1mhDCU-0022jc-Cz;
        Sun, 31 Oct 2021 16:56:50 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Pavel Kubelun <be.dissent@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH] ARM: dts: qcom: ipq4019: fix sleep clock
Date:   Sun, 31 Oct 2021 16:56:50 +0100
Message-Id: <20211031155650.487158-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Pavel Kubelun <be.dissent@gmail.com>

It seems like sleep_clk was copied from ipq806x.
Fix ipq40xx sleep_clk to the value QSDK defines.

Also rename the sleep clock node like the GCC driver names it.

Link: https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/commit/?id=d92ec59973484acc86dd24b67f10f8911b4b4b7d
Link: https://patchwork.kernel.org/comment/22721613/
Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com> (resend)
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 7a181352b306..ed40bef91e45 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -144,9 +144,9 @@ pmu {
 	};
 
 	clocks {
-		sleep_clk: sleep_clk {
+		sleep_clk: gcc_sleep_clk_src {
 			compatible = "fixed-clock";
-			clock-frequency = <32768>;
+			clock-frequency = <32000>;
 			#clock-cells = <0>;
 		};
 
-- 
2.33.1

