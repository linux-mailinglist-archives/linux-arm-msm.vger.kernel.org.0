Return-Path: <linux-arm-msm+bounces-75394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D14EBBA67E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 06:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BE141893A26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 04:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4D622173F;
	Sun, 28 Sep 2025 04:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3yfAOFC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1591421B9E2
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 04:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759034771; cv=none; b=jDMRCcS13NHu7ggRyc/5unKTvicyfXucnLpsX1oVH8Da4P1jl6eHsn9eO/86SLR5cI//o1nxW9DY2TJgtDquwvy2hJiy/LL9KXG0sRuh/NCQzITWrSrEyNXEpdF7p1s74mFsts+JM/ZdD7Ylyy8XkRZ0zjk+qtodqiidFniv+0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759034771; c=relaxed/simple;
	bh=zfTq5g1ludAKubu4g9KK7vCWa/JgTFL7So3sYNlLrGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aG1o9luGRjWn2yyca+2ouKtfNXOwS+64W4a/D7RoTXLrsKw/BtvIMGArgD2yjjbebOsMoFwE/V48WJn5Wo8eddwnWXn21cPusw2A0Qm/kiLu3DPIPZ//qEtKX1eNkJZNFyP82e8u21s2OLnakXJbVdIjcpmptd/q15WfILgEnHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3yfAOFC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so2842312a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 21:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759034769; x=1759639569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Iq+ECzazVF8cvZrw/yaLLDjTg+zMVvRf59rdoyx9e0=;
        b=K3yfAOFCREtzG9mjpmOURVgR6itrACdIZQhC9dfpEIwo+dR2rZ/FOd6CDKTAJ3RoG0
         WeootEoyNhvOjyRkBmb+0AUxo3kTydZkh0BFiJ1kxvqo5LGhOQDFo0JEByELEUBsMT2d
         FExKVO6pTJiNUeBM+mH7wu3mdmHS8HRFshiY8zRCfmzGSP+5Tc6oqBdrwoMHcMEyrLQR
         ZxwxqRXQJlUYaO6kgO1BV9FsepzoW9giu6w7MSDc46Xe4iDdbMpswg1Yj7T0M5RZ1hVK
         IcDcJGPRyYcSW3IkHEVxWT67yYkW70zsCjBcro55Re3yQP2WFnv8/ZywuDj+Dia6h9P4
         l/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759034769; x=1759639569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Iq+ECzazVF8cvZrw/yaLLDjTg+zMVvRf59rdoyx9e0=;
        b=bNihb2mSyU35wBkRhPqMnhpAAzPyQWw7qWnyWkhf2uItaPJj4K2kUaMygprkbBhqS5
         15j8LMNJVKi40SnojOhuZ2DtcdJ+B1EVgRGS9e1j1lMehxDT4rmrMhHubS4qlLkD4UN8
         FDv3xIJqiQGqYWdhIwxRPKjbzAbTc5dlNrqiYJ7p10V+SMuCoih9FD8t24prM32T3lMT
         iOY9IXzKxXY3NYHki7lRl/gUxM97CVK/FEH0ObjoXHkL+lBRg9ZuCnnlsPTJjSAIEmHj
         YzkY6LgVOLyZ/yrhph2FBQJ3zY4A6LB6hC2lmFHzJW+eGsZyZSCbdZJI9c2ksXjU4AaC
         OTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYzlBYYAfJtRHDCnqAf9e4z9iBy4UXQcS/1iA2NdVyX4857j//JEJlpAvzmB7AIP/vvVWMotqlcPTf1fJW@vger.kernel.org
X-Gm-Message-State: AOJu0YwD1QJEHw29Wpvr4TadCLaNADmkNlQYIjVerhSPOW4eHIP3c0tc
	AxNsgBRSeU8irMzdCxNt9ZX3IkXC82i0BErc9xs4pfgb/d+Amr5nzQB9
X-Gm-Gg: ASbGncuOEwwgstUAfTrVVyZ8qhgROGPGLcnHJb2IKFDWN0qgZM1uSD5YxBYsTZrmdIm
	uaw9JR0za6F8nzaW+kutTzKG7vXJw+sO80AXf5rF+mUyFEebhac2biDjeRqHIG5gD6n2yguYk5S
	ir91QUFcCHQRzZXD+dlGpuxTAg9N/n89/vnxMaCeef5R/DhpaGlfx5+G+ZpLgvgN8UqLfoI3+fx
	f9xjS3TSpT5pakInPQufdA/EpGsLMcTgBb50givJTytNMO427VHdibWZeABJx9cL0VjtrdxV2tr
	14p1dfq48NbGBIktEMTm5R/DFI4Q3qDNKX6QUyajuDP64Kr+esrPAYUHuLZUWfnqOrfDexRraKy
	z2LNzoImx2/MLnxuLb+jRnJ7y9T4vdEC4bnfL85Q4ItNe2QA4Tv0=
X-Google-Smtp-Source: AGHT+IEoaeyJQ5U8TsP5ap0KoAVJ8ly2czmGqC1fBrRX1g9BM6bblQ1XKTqGT2n8r5GFu3V9SPfCSg==
X-Received: by 2002:a17:90a:c2c3:b0:32e:9da9:3e60 with SMTP id 98e67ed59e1d1-3342a346330mr12163227a91.36.1759034769289;
        Sat, 27 Sep 2025 21:46:09 -0700 (PDT)
Received: from archlinux ([179.113.184.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3350256d403sm8621263a91.14.2025.09.27.21.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 21:46:08 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sm8250-samsung-common: correct reserved pins
Date: Sun, 28 Sep 2025 04:45:33 +0000
Message-ID: <20250928044533.34798-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The S20 series has additional reserved pins for the fingerprint sensor,
GPIO 20-23. Correct it by adding them into gpio-reserved-ranges.

Fixes: 6657fe9e9f23 ("arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE")
Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
Changes in v2:
- Fixed the formatting of the <40 4> line
- Added Fixes tag
---
 arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
index 96662bf9e527..a87e3d23e3e2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
@@ -159,7 +159,8 @@ &pon_resin {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <40 4>; /* I2C (Unused) */
+	gpio-reserved-ranges = <20 4>, /* SPI (fingerprint scanner) */
+					       <40 4>, /* Unused */
 };
 
 &usb_1 {
-- 
2.51.0


