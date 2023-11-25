Return-Path: <linux-arm-msm+bounces-1926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 450087F87D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 03:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0405B1F20F7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 02:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D51656;
	Sat, 25 Nov 2023 02:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDTiDS8f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4FA1990;
	Fri, 24 Nov 2023 18:33:53 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6cbda959062so2230682b3a.1;
        Fri, 24 Nov 2023 18:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700879632; x=1701484432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LgmvUfGWjKIm8iadY/2xVP7C/NerwMgdLCiio0IxTI=;
        b=jDTiDS8fF3hwQ3HbIMKbbDmLV6bSCqgPGU0fn7zIeigf6hSVqOyqpx/YSCFCdeJZBY
         mCJqaOq/BiXnUwsLjkF4xta3ngmIvpCKorZ55j+wcHrSuiCNTb6QgEe2mIY7B68f+O32
         gcHO3JHyEMjKHH3krq8HW+BSdMSWKwcQT4feKprALrQbHfJ4z65pYlTPrGdk9TFU4x63
         ixg0vupaGh7WoHXojnVNDBh+CA6CbKrWlzRW9AcYLLK5TrRLLweYT2Yrmgm0fq87dsjw
         hgyoftZuGAoKhfq3VmKMFKbsPMeoY0SjIL/+pWL+YIyX6L7vpo6dI+xvpJA6wDgoETwA
         LP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700879632; x=1701484432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LgmvUfGWjKIm8iadY/2xVP7C/NerwMgdLCiio0IxTI=;
        b=dYldUYUfIWYuvZdY/CDqc9ekRT67SAXa5TcVGyFUdorIYznuA1tltDqd4bkhi5Y+7I
         HZfvcAUSaCG5Xwqvn09olUVwKTemihF/rduwE/8w7iWciWRDCTced5tWR0NaV2mUSRL7
         aeCg+tA1jBQlFWXTv2JNG/bIw2gOF23bKQUQfheOn5wZz1jFpPyBVoJGev8W6b7a9HB8
         rcP9Ox77V+p/FqOGKCv0z/seNNpWCmFd5xRs+vqTwCuoCPpDCrE70x7sc2P0Stpv5VYQ
         pOmFtyrMs0U58zZUYsmJRd6aYdCrdfpA2jE01QT/EjeglYSnQbi3uoF3B3tndOgEER3Z
         mJYg==
X-Gm-Message-State: AOJu0YxJAoD1W/P1O7iHmNZ8c9wlz/el3OBUZuJP/sUzsZEZ6fmz6zDo
	0bRwHNWt+g6XF74mQoXEJuw=
X-Google-Smtp-Source: AGHT+IEgGUD9Pd+bQ7DVbSRyD0Wo/4cVRb+7VXsfnnsZ9qYBBIfyoTWwr/RuGqJ4RNGJEE8fdevU2Q==
X-Received: by 2002:a05:6a20:daa8:b0:18b:914a:a81 with SMTP id iy40-20020a056a20daa800b0018b914a0a81mr6189316pzb.52.1700879632467;
        Fri, 24 Nov 2023 18:33:52 -0800 (PST)
Received: from localhost.localdomain ([192.166.114.90])
        by smtp.gmail.com with ESMTPSA id mz22-20020a17090b379600b002839a4f65c5sm3611353pjb.30.2023.11.24.18.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 18:33:52 -0800 (PST)
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
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Fix typos
Date: Sat, 25 Nov 2023 10:33:41 +0800
Message-ID: <20231125023343.10939-1-lujianhua000@gmail.com>
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
No changes in v2.

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


