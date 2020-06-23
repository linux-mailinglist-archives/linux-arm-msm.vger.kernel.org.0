Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A410520679A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388916AbgFWWsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388806AbgFWWsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:46 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4948C061795;
        Tue, 23 Jun 2020 15:48:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g21so424180wmg.0;
        Tue, 23 Jun 2020 15:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4YzpTtuQd8igcmEb94rslBu/tpG/FsBo/caSislaGaQ=;
        b=ljMRR2zAT5bki6xwhOGzyGih/88e9uZhIr5rjLQ0ImujfRGpwsg8WbLIUOrI0AaIUy
         0LJenVT0dbIxWdv7jzXxTVSJRd4YVFsTTcwKeoPH8dbQVNEL2+5OY1U8NTEUYMpdLhb5
         UJktKzRrW+pJh2DNj1IT3K/XXymj02wxlID5AhFUqRIyFxqm/3nOgPY9RU24kkZa5HC9
         KGy7puklT019cqMoKEc/+OmGNf6xfiyH60yFeMP85HDzHNiwggkhOr4UotWKacHuOWyy
         TYCzOOQJJybxHNbEGbPvWl6wKupTeTe2o7oLd5BwfDFr2i7/+bBCuZP8JfcCk7PBYURX
         790g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4YzpTtuQd8igcmEb94rslBu/tpG/FsBo/caSislaGaQ=;
        b=Eq4VMOmB/zqAdAsEHAetXpmhe6swuHDBfE9KpkZxwdMwmOaumQkXjac7SFGtYpblmh
         vMBhnN8bGq9RGRkFY4pQ/1nzUYuXueWOP+dyJg8jDz2gi/xi2qe7orfxWB2PNKTWAt4U
         nS4FI/UCRaaEwjDxI2zilLTX+R+CHYjfMsOpP8bsKpeW13DLeVRWKMPPtIW549QohFHa
         Jhsidm53UTB+1ckxp0O1EW13Thj8uzY7+pjZPqzxJZwS8YfSMU26Liqw15M/IuJbZ5PC
         vQrNYDXbb6xMcklu86lOQlqyarWBaso1dAJBMtkoh8HhgzyN7jM7FCgWyZN2KqbC2HLc
         OZ4g==
X-Gm-Message-State: AOAM532PGcNSj+SrP7zQ5BGew5NW7z9Imu6H0U03WfS8OvcK9TXW1S+A
        m0zT1SSMmnJ1hfEtwEKptws=
X-Google-Smtp-Source: ABdhPJxkkA2PF3LfDKai0ks0Y6V5z4FRRkDy4QNo3xBjRp8NJvoEZ7mIXCMbyG27Cd5awP/M0WyTQQ==
X-Received: by 2002:a1c:dcc2:: with SMTP id t185mr27817665wmg.91.1592952524492;
        Tue, 23 Jun 2020 15:48:44 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:44 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/12] arm64: dts: qcom: angler: Add qcom,msm-id and pmic-id
Date:   Wed, 24 Jun 2020 00:48:09 +0200
Message-Id: <20200623224813.297077-11-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add properties required for the bootloader to select
the correct bootloader blob. They have been removed from
the SoC device tree as they should be set on a per-device
basis.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index a5f9a6ab512c..baa55643b40f 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -11,6 +11,8 @@ / {
 	model = "Huawei Nexus 6P";
 	compatible = "huawei,angler", "qcom,msm8994";
 	/* required for bootloader to select correct board */
+	qcom,msm-id = <207 0x20000>;
+	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
 	qcom,board-id = <8026 0>;
 
 	aliases {
-- 
2.27.0

