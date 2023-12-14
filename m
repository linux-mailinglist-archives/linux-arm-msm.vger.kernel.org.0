Return-Path: <linux-arm-msm+bounces-4628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7B38123F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 01:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41DC8B20D04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 00:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2476339C;
	Thu, 14 Dec 2023 00:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dows6p8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEE8DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 16:35:53 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28b0016d989so651655a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 16:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702514153; x=1703118953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/9vhns2rh5wNRAmTF+7unWvvWQlEhzdv4Zy/TsV5A0=;
        b=dows6p8mXur/wQfnC2iMggrm2+iC6D64PXF1sAfvsbWuSFFWhYoBySauIfISJ/rL57
         Kxojgw/YFXNYQ7bQBLzau7t+nEvmpwRzNX4UBozdB9RYsaXNYuueaWcDowrd8j53YXC+
         kIaUq5y1v16T886wbKGZcdxNAYD6bRywzasdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702514153; x=1703118953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/9vhns2rh5wNRAmTF+7unWvvWQlEhzdv4Zy/TsV5A0=;
        b=NIWjb6FWvAaMsDdVuEiWRPkZoLVGt5pg9I4Ib4eZoujO5DboCjIZNjyOpz7WIROflL
         5EmvUjS6Rq6VlmR7X+mlvVguvNE4SW4sGlKVrQ0VRVL2d/zwKhHo2gP2qj9SHKq0AEaJ
         DvOE3nR2tXOo848u6DCzQ+eMEc+Dn9i9IsflhuC+G5u1rjfPEPdMeFuGyXSIsFjpCpoo
         BPpiNLuJhIX12qYYTCFXdBCIXAbXnzyQPf2lDEJuiYMCvbHlEBTZqxxRHuguzX7kpZhK
         u3ByhUSJCFrdX3oLxJe2chYluBwdbAVBjxwTImoY5+TXKSwV9L/GSMQGx2ScEc5fT8A+
         oheg==
X-Gm-Message-State: AOJu0YxQl55Krf5AvsMKERLkSK5EM/Mg+cKxsdhBa+wDiDhh6JevPkbw
	ZNhg11iW9CZwwD2T5Zdip2Q6CQ==
X-Google-Smtp-Source: AGHT+IE/V1gvqFNTDzqqMA4JhqSbG/LhKExowWOW95PGLRoZTgWORK8uZ5xecK/IINEs9HhgjSZDqA==
X-Received: by 2002:a17:90a:ba85:b0:28a:fd40:1650 with SMTP id t5-20020a17090aba8500b0028afd401650mr719467pjr.25.1702514153413;
        Wed, 13 Dec 2023 16:35:53 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:f03:a4cc:c5f:7040])
        by smtp.gmail.com with ESMTPSA id sk13-20020a17090b2dcd00b002864c14063fsm11879981pjb.20.2023.12.13.16.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 16:35:52 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Andy Gross <agross@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7180: Switch pompom to the generic edp-panel
Date: Wed, 13 Dec 2023 16:35:02 -0800
Message-ID: <20231213163501.1.I8c20f926d15c9ddc12e423e07df1e89db1105d93@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pompom has several sources for its panel. Let's switch it to the
generic edp-panel compatible string to account for this.

This fixes a problem where the panel wouldn't come up on some pompon
devices after commit fb3f43d50d9b ("drm/panel-edp: Avoid adding
multiple preferred modes"). Specifically, some models of pompom have a
1920x1080 panel which is _very_ different than the 1366x768 panel
specified in the dts. Before the recent panel-edp fix on Linux things
kinda/sorta worked because the panel-edp driver would include both the
hardcoded and probed mode, AKA:

* #0 1920x1080
  60.00 1920 1944 1960 2000 1080 1083 1088 1111 133320
  flags: nhsync, nvsync; type: preferred, driver
* #1 1366x768
  60.00 1366 1406 1438 1500 768 773 778 900 81000
  flags: nhsync, nvsync; type: preferred, driver

...and, at least on ChromeOS, the userspace was consistently picking
the first mode even though both were marked as "preferred". Now that
the Linux driver is fixed we only get the hardcoded mode. That means
we end up trying to drive a 1920x1080 panel at 1366x768 and it doesn't
work so well.

Let's switch over to the generic panel-edp.

Fixes: fb3f43d50d9b ("drm/panel-edp: Avoid adding multiple preferred modes")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Techhnically we could put a "Fixes" in for the commits that added the
pompom device tree, but that gets a little weird. Specifically the
pompom device tree predates the introduction of the generic edp-panel
bindings. Older pompom hardware always had 1366x768 compatible panels
and worked fine so techncially those old commits weren't really
"broken" per say and thus don't need to be "fixed".

For now, I've marked this a fixing the Linux driver commit that broke
ChromeOS userspace.

 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index 0be62331f982..067813f5f437 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -141,7 +141,7 @@ CROS_STD_MAIN_KEYMAP
 };
 
 &panel {
-	compatible = "kingdisplay,kd116n21-30nv-a010";
+	compatible = "edp-panel";
 };
 
 &pen_insert {
-- 
2.43.0.472.g3155946c3a-goog


