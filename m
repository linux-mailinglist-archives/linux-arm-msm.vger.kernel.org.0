Return-Path: <linux-arm-msm+bounces-1862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EA87F75CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 14:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B511C20859
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 13:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C66F2C840;
	Fri, 24 Nov 2023 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2g+876a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD551739;
	Fri, 24 Nov 2023 05:57:26 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cfae5ca719so877735ad.0;
        Fri, 24 Nov 2023 05:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700834246; x=1701439046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZfKd9ld8EcpTSh9IkKiwQ19+m7m8h2U5B+9O8cLUt0=;
        b=E2g+876az5WH8ZNeF2Yj4OEj3RjbFNbWCppFCUNmzgsyQyLKo1j7x0RE+xErl2vvgp
         9dF0tqP7SmaQg10mTwzbXDIBm9aSqYizG5CrFMXKvn78G3g+qpo3mpoaD2v/qXnoRO8F
         HmzMlKWJQjnlC+6P9mzQ5jlGTSrPOpmKltj8DXarFxqwT2T6WGQtbVVtzk8UXzcKNXCn
         RkPQHKJsprtesqfArKB3R/dJUTc0nCwKkvwfpazkybwVpDzTT2eZnB8e4qafjezC49W1
         myLh2Zs6dmIXSGI76mLDKEk9xXhoRkFCEvh4P7dOQpBTuOMy+cfw/SvCGii0hOK9k9gB
         rPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700834246; x=1701439046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZfKd9ld8EcpTSh9IkKiwQ19+m7m8h2U5B+9O8cLUt0=;
        b=A60WE5lkkK849PoQD0Hn3Hh16foFGZK13gm8YQIlzS6HJf+ubXxYBphQ5Annbilu3j
         LO8rXIHlp89ufCN2D2JA1aVJnc/4HEyqMDRBmh88u9Nz02kwfbM/LTU/XzprW0NoywuK
         qoivEs4t9MNKBs1CsXB8IBMLYfCtTVVfaG+qSvcX13ALLypoI2CNStoz8c+mO4xMiXun
         zKi3BQLVzvci46udMuQtm0jTYygEsg9kY5Z5h87jPO+wegWq7PK6dRnb0DXVY3rUEcjA
         +LOytGoMwVSoMnc6Cv38bJbwr0gfecWTyJgzN0YX/Cw5DaKahmbWTaRHi+6eSC/mv2WP
         PiHQ==
X-Gm-Message-State: AOJu0YxSlTl43W+xqc5ZS4HOm7RZ8IPGips3ZXMhQohtf3DyA8kSJFWk
	p7KWB3HEpxhkfvjjNfO7FzgjWfM55yU=
X-Google-Smtp-Source: AGHT+IHfZuSyuZePFumVf9GySSD7n+qcNQXMUctv4gMfBPItfnYRDBsORnIEhA/mbCC0XzaUz63wEQ==
X-Received: by 2002:a17:902:c713:b0:1cf:677b:6c2b with SMTP id p19-20020a170902c71300b001cf677b6c2bmr2419200plp.29.1700834246261;
        Fri, 24 Nov 2023 05:57:26 -0800 (PST)
Received: from localhost.localdomain ([192.166.114.90])
        by smtp.gmail.com with ESMTPSA id o9-20020a170902d4c900b001c3be750900sm3179417plg.163.2023.11.24.05.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 05:57:25 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Fix typos
Date: Fri, 24 Nov 2023 21:57:11 +0800
Message-ID: <20231124135713.5610-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two typos in this dtsi, so fix it.
  classis -> chassis.
  80700000 -> 80600000

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 85e5cf3dc91e..3d4ea428e4cb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -23,7 +23,7 @@
 /delete-node/ &xbl_aop_mem;
 
 / {
-	classis-type = "tablet";
+	chassis-type = "tablet";
 
 	/* required for bootloader to select correct board */
 	qcom,msm-id = <QCOM_ID_SM8250 0x20001>; /* SM8250 v2.1 */
@@ -114,7 +114,7 @@ vreg_s6c_0p88: smpc6-regulator {
 	};
 
 	reserved-memory {
-		xbl_aop_mem: xbl-aop@80700000 {
+		xbl_aop_mem: xbl-aop@80600000 {
 			reg = <0x0 0x80600000 0x0 0x260000>;
 			no-map;
 		};
-- 
2.41.0


