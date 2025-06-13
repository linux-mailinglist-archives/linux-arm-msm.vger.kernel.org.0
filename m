Return-Path: <linux-arm-msm+bounces-61263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C71AD9591
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C85FD3BA790
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA7B20371E;
	Fri, 13 Jun 2025 19:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKvG6PaI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CBF38DD1;
	Fri, 13 Jun 2025 19:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843182; cv=none; b=eGCQbheZgKVIzmFgc5nfuQdkjbBq/TkQGSZ9mPQ7yAHX+zkQZyhu6P/FOyG7rlzKfoMslsOlTU7vH4W3qawWq3SrXe/52kJ0coQLDvAlNgNvxa9ueTpEIvdeP4/L1THESyH3BkCu5tfM+eHzFn60XfFW+JM5m2vqgpSoWzuZS3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843182; c=relaxed/simple;
	bh=gWaM2SwWG/RzB3IQhP4sXhYbKHVGU+CduuDqU1xoFbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZ0xlfugdzrftbbn/gQD6bmlm7YUBNresPRPPuvDyp4R7yNXZNlM29p7IsYkW6ZUlSEEQXn0Qp/dv6BvioTULJ+bzm2JnoSFinza+OyLbAqFybIk/VcjlEK3I1RAKQAVpsg5duzBcsQcVbJv5dYqbxRHfeQN24wxSh3gtNVgSI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKvG6PaI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade58ef47c0so498952466b.1;
        Fri, 13 Jun 2025 12:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749843179; x=1750447979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVnXDO8P8TTyy5ZMGp74R4GEWT4MAhPxsWXUOSUBcps=;
        b=MKvG6PaIx8GyJEi1REkPpYodvCqWXdpdt5+drXFQ34/+h79ZdOFjJKZ2EU++hPwV7X
         T8WoluJYPBxP324lUStPvn9l15v2qnexOZA1dmqWhVRxCIcRaXGgh4GumHTxnoiWLgvl
         xT/tPkT8ngb0NudKjGfNwx+LsmLYMgpf5vMX4yXTovWgPkQB/6iYHfFsNtxoXo16LRAW
         DD9K52YqtQPyz8MAet9X0DO4WOGZ/ixhQNV4DyBx7tG5NRM8EzTnfMURmMnrcA4t6yWE
         Qu9VlBAz7Rn/OasrLo6/xn/ORTrAItlKJqL7PmhP0BjLhWZ5FXLfEK0nIIJUcgn1i1Cy
         cqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843179; x=1750447979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVnXDO8P8TTyy5ZMGp74R4GEWT4MAhPxsWXUOSUBcps=;
        b=FAlips59CbHbjJWpVSAFXChsBCF0vZZ2xLKFt7fB88h92T+b2VxgLIP12eckWAUp1Y
         j94FRzaudLK70tOW/fF7J+r4R20i0AiXgiSjG7dIHL/rpb4JCgyyoZJsn7gSEBgqLnOy
         j/BCyYQgBLs59p07/3WdkKmWbfXiqyqBOYdfJqE05w1vZScGqXQSpjkc3ekb1kXf4hiJ
         oZ1cJXeNQGnJjme7g5OTt8vmIy0EJ1ICw3JM4f9a8cUQv+pChaeE+Xgz1st2gr9eTBjj
         smiHI+OV2g+U3yxcB/ZQ5mpRSSOc/skR5AUjKOWe0/lLS7D69JZTgYkPu+GIlofn5DKa
         m44w==
X-Forwarded-Encrypted: i=1; AJvYcCUITpFu9hcokJpT24CoVbgaVzCGy2bAXkCoF/kuGAh6sCkSYA8FEI5KSABzjJ4W558OpJsCFPC6JSXN@vger.kernel.org, AJvYcCVHOzyzKQtBW6wdqomOACNTrYYkyIbm7PIgv355w8eM0/xysuXYkh9FUQhwYmSTTgv8z1YKo/PGdolI+kOQ@vger.kernel.org, AJvYcCX6KKwqL9G85Dsva60DWA68+meudtw5YffqOMV2WZxMsdzZLUdWvHowpRStcoXPvMe47pyTcMGJioJwS6U6QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzog4DNVQAVSrOMHzN6ISsBRkN4vce7NU1gK+b2vwMzicBvYCJs
	McSS6fMiSgLDj/cBCB1T0NDuc0yG9Y1Yvup8m+TFO7zVVJQfuorOATEjgBttQ5EDhOg=
X-Gm-Gg: ASbGncu87rjQLLjysFLiGaOiemo2mT34otPg2Qq8a4wt/oXc9QEsL6lkCk+z2WN3jkl
	Hr7zVIEAiy+DkGoGK4Uwuhg90orMaQ7uAjczwUC5aQVN9+QNukprIBhNO8+8QWJXpTNFW4KClu9
	lsPu2Fuf7td0wsSeYFkAmjr2DNHrJpmErnalxqNPi7XQfWKikrjoAPhwNX5RzJUve2pI/hB4TKS
	yIwh950MAmUpqQQnv7hNexJSp8nRDplcLMgsshKgMWjUmEwtUKP9aInOt6s/rHTmzGpF0RqsPCn
	8ht0077QQJmxeCw7lRXa95rX/RiaFXsmIP3EUNZKefc3liC5b+35SgnsFJhySFceeg==
X-Google-Smtp-Source: AGHT+IEGXOsp1clzynzr6HPQxoIIb1/U8iDzv2OCdNS97kewP64laP+qSiWaAjliX6CX3eF7n6APtA==
X-Received: by 2002:a17:907:c24:b0:ade:31bf:611c with SMTP id a640c23a62f3a-adf9c02d9e3mr86133866b.9.1749843178573;
        Fri, 13 Jun 2025 12:32:58 -0700 (PDT)
Received: from ainazi.fritz.box ([2001:9e8:1ad:9f00:925:9e86:49c5:c55f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892b92asm175133666b.133.2025.06.13.12.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 12:32:58 -0700 (PDT)
From: Shinjo Park <peremen@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Shinjo Park <peremen@gmail.com>
Subject: [PATCH] ARM: dts: qcom: pm8921: add vibrator device node
Date: Fri, 13 Jun 2025 21:32:43 +0200
Message-ID: <20250613193244.17550-1-peremen@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the same definition as pm8058.dtsi. Since vibrator is used only by
some devices, disable it by default and let it be enabled explicitly.

Signed-off-by: Shinjo Park <peremen@gmail.com>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 058962af3005..535cb6a2543f 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -17,6 +17,12 @@ pwrkey@1c {
 			pull-up;
 		};
 
+		pm8921_vibrator: vibrator@4a {
+			compatible = "qcom,pm8921-vib";
+			reg = <0x4a>;
+			status = "disabled";
+		};
+
 		pm8921_mpps: mpps@50 {
 			compatible = "qcom,pm8921-mpp",
 				     "qcom,ssbi-mpp";
-- 
2.48.1


