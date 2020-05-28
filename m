Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A551E6497
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 16:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbgE1Ovp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 10:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728622AbgE1Ovo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 10:51:44 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14C2C05BD1E;
        Thu, 28 May 2020 07:51:39 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id bh7so4730510plb.11;
        Thu, 28 May 2020 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=74h2HADeox42a/JRXdpKzvx6226fj+iEDouk51yK4Zw=;
        b=BfvcFZXO3pxXhRrqV87YWooMNbNK5/bGRn+0Socvr71I+oBrh3QfxkShQ9PXw75j2c
         H1KItUiqCtzLO2WBaBo7A/7HMQlZ903RkWMCpTssjYyQigHOzm3s0dmXTFCkJCUpt0z4
         Pg3qon96GcbUGEE5t0ivBfavVfJNcHSoaP6jiW8S9THqzxMY2k8dNy3pHu97MuKS78Xi
         HMU5gR8RG7OY4sFJzsV+JOSvSgYrX+iO/SSM+SbxllV7zHgS8ivOIQhnv75ykIgDZM2h
         1Z9UIGKZWQQZcV1r8h7AbW4Q8AmJE8LmzcT4LndOyjZoMndbH4UgAPnNhzt4RfdoUOUg
         52nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=74h2HADeox42a/JRXdpKzvx6226fj+iEDouk51yK4Zw=;
        b=skVAG3jPh9KmUMFtamz3xr2dvfahP9W/1sXTHT6yHuPO/i45ipjLk2n0vNjecyubSH
         5SH69aAfnKLuTEwnSRtqv69V7E0Vp9/zX3RW9t5etwI9MaOr7EPrNZiNTcQAnLCKqbfY
         WQGT726OG4HlY2xKEMHzdUAjKreGDGaXbN2gnaCkI6OQ+4mBURax+cnhnf9A6UKgI3yo
         jYL/mbLaOa88jnfnDc3LzvV+1JvbgljfrEDSgMBhFYG7mX/rs18+5Gv/jc16Q4d9xol5
         kQhfzOj5PSmrv2DpAOKUABLfqU+x2Hea/BDBTDpTJjzZMZM/H3jtFCps7MTs0NPNPwE9
         j1Mg==
X-Gm-Message-State: AOAM532J3rOyTfwbOKOwZj/SkpfGlfiUTfBvoTJb3LOAZSxDPqbz/4w8
        iSmYbAX26+sKiOgx1MEUYQc=
X-Google-Smtp-Source: ABdhPJxAzIJNYdDxzwqp2FPM8CV6Ya9LNh7ZNMxD2jt2z6LCZ0mcp80TxEthXSxjQHYGvlg1BbE3wA==
X-Received: by 2002:a17:90b:1897:: with SMTP id mn23mr4217541pjb.84.1590677499598;
        Thu, 28 May 2020 07:51:39 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id x18sm294496pfr.106.2020.05.28.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:51:39 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8998-clamshell: Fix label on l15 regulator
Date:   Thu, 28 May 2020 07:51:35 -0700
Message-Id: <20200528145135.44269-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The label on the l15 regulator node does not follow the style of the
rest of the regulator nodes.  Luckily, no one has used the label yet,
so lets fix it.

Fixes: 2c6d2d3a580a ("arm64: dts: qcom: Add Lenovo Miix 630")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
index 6ab830d01867..00d84fb21798 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -202,7 +202,7 @@
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

