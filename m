Return-Path: <linux-arm-msm+bounces-61269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9111AD95B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 358767A52D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BEB242D9E;
	Fri, 13 Jun 2025 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OC7/UeAK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93B63FE7;
	Fri, 13 Jun 2025 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843621; cv=none; b=ewZkMBYVNJl8gnlXUk9LXJPTn6yfbrt3vA4FZpWvikUzKKMZxh7lkBlrnhJgKdUj8uTu8ajHGm6xdeosmidb/yDpVqwEkuKk3CLu8AWp+SISzg3gt75IFs17j5dLnA9arQsaAgVCx/2KVWE9CGn9AomdIWI7jsITD3raADLUdkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843621; c=relaxed/simple;
	bh=gWaM2SwWG/RzB3IQhP4sXhYbKHVGU+CduuDqU1xoFbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ImapkKf4A88HgqMQDZ5XpHQR03yjiF8UMJDlzU6+39UXpfV5U3zTj1IvvBDkxoTfU5qZ5EZ+JiryD4dyb0MRotGVOoTyxOHs/YhE3m17C9FdiDGsauwAtrcicai+v3mKqDrLlzv+C6azUlB7yPzSqak8E3F4lnuV9uPkT+YDc0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OC7/UeAK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so21275965e9.3;
        Fri, 13 Jun 2025 12:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749843617; x=1750448417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVnXDO8P8TTyy5ZMGp74R4GEWT4MAhPxsWXUOSUBcps=;
        b=OC7/UeAKEcv3DdvKupkvAFOTviSl8oVQSZ+0PFE2sw2E8Vqdf0sZ00LtlVhhvyrvFq
         48GohTsRMjnvbrUzBDhAypDHVl69g1oH5IG49T/I1TmN3qzhHm3XZAjkXGi0ck70cS4a
         1oJSPJfZGnDfk5qvf+ve9ogHAxT65zmPLEHV7yoZ9JuDtcZQDKxW55YbeMHdkTMkADyW
         n2KJtQQmOk5d0kqI4At5bHuowanR+jXTV1OhoX441bQS34ERkzilgqkqcYtTm56sfmNY
         z+qx3nOKq08EQQ0N7ZdnDx9nS/5pblq30qlBOXhvgZIRN6GEbNmCJHcjREj57hsK0J6E
         U4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843617; x=1750448417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVnXDO8P8TTyy5ZMGp74R4GEWT4MAhPxsWXUOSUBcps=;
        b=fbhGzzdW/2Pqu3nT0jWB7o9fEOVSHj2gHyEYKwYCic+l1q3rId/PRzNTtHUHLDmo6U
         8HDkV00riHkuleeWEbF8ocrwZ27eI0XQ0flavn3JjHGcvhcntLPreMLGr+OrTdVTdexU
         vpqSHJqd5SACY/8OJePnBy8K23yJJc440cpBLtZOsXKbyW3k5rhfRHhdw7kCMEGsHQYO
         YWvqTh0YPJMty0aMEWNKYsgBmLa9DbQzcZ88qKtqXanYmTrvlKkZx7MupYY8GRT4UfHP
         uT6Tbipw7xBi/BiIwja939ObQNcMZds2tt00CdGBftXQ2JI06+tE7oq3WvlJ/4myHFRI
         Dmhw==
X-Forwarded-Encrypted: i=1; AJvYcCU1scH6NZsZUIEFstp3Ewaw9ZF/eetJsxWZsw2Lq0h6giMhY+E/UwC0yeegyG4pWtRdDlbFJjDxq2X5AvhQxw==@vger.kernel.org, AJvYcCWN1PpQo0/Sp0uM1QEqJKUmWPiUQgXKUQAUBzp0Wo9YuXVwIbTi0/lm6WXSjkJt67+dQYYggC41WS+3gQWE@vger.kernel.org, AJvYcCXZd3oPFLM/atAvMVRzU63K/GehBiIZEup/ZEZJeXdHpQ3q64DL6bQQvNge8lvgxkDjIcHaw1QJPaui@vger.kernel.org
X-Gm-Message-State: AOJu0YwJe2ObMIrDG/nVgDPJ39RwkWdITaof0h960RFLK7lp/E2vajdh
	BVIzQoINl2m5NSyeVcJ8DWP/8+9SQTZ01jwoHWmGVnUhadCV2r8vO8sBjg+GWBMn3YM=
X-Gm-Gg: ASbGncs85V9FjY3w31nBf4fM/ix3sAaBexFyHKC5BwPOQVizqzHEsY4FpXN4+2nq8AE
	w0RYBzyTrWE/6XHdKGOExyNywZLNr4Os08oOCGUAMeFnSL/5lPKNo+uW/OKVG6i1cwVwoDpf9Ob
	iXpIx8lC1XE3sA44diQd95PA3iH7q09tHlUm3zSqhrzl79BEo6L5m7dodDLmoeV0S3KY3LTJAeZ
	Dxq5kp/+ZV8bgmRLnzlWchgq/S0/wdKfEUNkq/rEz/fTEDEooZmBevT8pfwHuG/A37db4+ieWWi
	9EtH0HB2ih2mUke2EErraQTwj53ElRqlRWsxZ8XdWPTKSNea+saSldOgo76eAI5FTA==
X-Google-Smtp-Source: AGHT+IHwnXCusQPd2xTeyPOne2OOCgkEhoCcxGHv3R6CJ4vPXqyARKVcZf3Omyub9I6R5J2rz9vutg==
X-Received: by 2002:a05:600c:630f:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-4533ca8b32fmr11550575e9.10.1749843617209;
        Fri, 13 Jun 2025 12:40:17 -0700 (PDT)
Received: from ainazi.fritz.box ([2001:9e8:1ad:9f00:925:9e86:49c5:c55f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453305a0d9dsm55532725e9.21.2025.06.13.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 12:40:16 -0700 (PDT)
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
Date: Fri, 13 Jun 2025 21:40:04 +0200
Message-ID: <20250613194004.19390-1-peremen@gmail.com>
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


