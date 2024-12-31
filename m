Return-Path: <linux-arm-msm+bounces-43742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C899FEF6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 14:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAB7F3A2E1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 13:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A49F19DF52;
	Tue, 31 Dec 2024 13:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="go74SY6m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C219D88B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650161; cv=none; b=YEO/IMNvW5cpIMh/jDE7VmHjST8La2Q26QqPzXmkXAV75YaJc7mcvEj5x3MejkCYTyg0bbsv3w6PKwCpPkrqeJGomCpZLqreeRDpSEPlXVybvW/btEuSVeKI/UdPahL/BhYqdeua27+DriQvJeBKaLsr8CzxIQEmrmrU5TMKXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650161; c=relaxed/simple;
	bh=hVyAuooOzyUbD/jnmspiTE8wCtobigUKFEsbNH4RJ0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fMbQGPo34pie+fdbpH2cnY9IA+aA4HZ8fbFfFsqlFSHUDfuA+sDuM6Fc0U5vOByhwLCzpT1EqDdaPTuXLSSUchzciaTM0LDwDAPe9hKTOfwM9NpBNQNmOtJUmr0hJjkLVDkTAUwZ/IW2kvSLxLieY9wB01DnnNwLI/t9iRk+PHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=go74SY6m; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2156e078563so115831105ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 05:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735650159; x=1736254959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvF+49X2gFMGE7dCbt+zol5pHVl//CcUiNX288CxZPg=;
        b=go74SY6mxOHBBTbqFyqzoW0alX3HxVyAkcpc3Fs0ci46EQ64hNCEhrLHEw9wsUzdjf
         StkcX3FZ9S99frVeuOvb5LDFSFPlOR+IX4Gv8ugW6eJEuDH9Bay4d8it+lDgSOY4eWRe
         anM4re/Uni/dwtuyI6LuP8Oku9cxynyn6CqORQpKYgwTEdnDb4GFWyn60+6XV75Gri2J
         zK+o7jwrkDguy3iJhpmwTeosUmscCf7uoP4p+UBr66jaKCaj1DpfBP9CkccC1xEXFUDz
         i1uK96UxqiyiEhwDLv3OqXj04+SBZc+ZKZtg7Wl525pN3yBOExMI8x/kSloYOKssFUl2
         mKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735650159; x=1736254959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvF+49X2gFMGE7dCbt+zol5pHVl//CcUiNX288CxZPg=;
        b=UHzxgd1d0e6bb4bbe/EJyjho3mUMO9RNvMSXWG3fL6YR5k4618fGbdkibCZg2hJveF
         MsvTu2Gzk7TXhZ6T6WQ1mtgLNqJYRSHaUMblKBWC5/Q3drA7I8KDX/KTNavraCJUzXoP
         kcMiMk7/je1oUlsIUENUN2p3bTGj85405JWYdwkEF4OBCr3INXj8WjTDlKm4NYqA5cbf
         FepY+/9fbVMuhyyyeGRZ3S2Wld3XbdxJk2KEDZFxcArbUFWxFVUT3Xrfu9t9vtcxAIB6
         4Q4VtrqFTRmC4UcSzwBYoKSR7jPua0NFpME1hwxN+GRZqmkZ1rt05S5XJhEKnGKwvtln
         3Quw==
X-Gm-Message-State: AOJu0YxeGQfmkPJ/lWjqJBmtZQ0JOGBgpKQJkiXn+BrK9Msc4cYEQljw
	Qa7KZcpyxXChKn9ZiJHJqhT24nhmZ8JHWT3n8yj4aRYdBCflwXHUC8RdfuAAlA==
X-Gm-Gg: ASbGncvw06bF64qpTspeb8lMD2E5t87tfKB/VNHnluBoWcGroE8gvu2m5Rh3sGB+rNM
	6mHkE5ZVk3yUjZZoF5EikLFWDGlIG5avZjyki6VLBtmLrZS3fm+NTz3phFnsBi/pQ7w7u+p3j0U
	CT2XKsycylLMSa4lc2n4DAnSA5rp7653hiAWJ6VwQoz+zqv4WMwTr8Dxz8pMb75ys0mXvMWwEvb
	rzLokDyJqld3NrzWRbVa3bS9NkUlP4uLT+ls1m+UHhsMLKgWGpzcA2nPxYCioBFArniUSTTaf/L
	HyD4FM+qLiY=
X-Google-Smtp-Source: AGHT+IEMULsfFORB7W9l9G4XPcBHlz6cU9L2NX3m3xplk+5DtOBI1D2wFJ5g7TgfuAIcWSgnGgDZdA==
X-Received: by 2002:a17:903:2286:b0:215:cbbf:8926 with SMTP id d9443c01a7336-219e6f10978mr531200865ad.35.1735650159283;
        Tue, 31 Dec 2024 05:02:39 -0800 (PST)
Received: from localhost.localdomain ([117.193.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d945csm194514275ad.117.2024.12.31.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:02:38 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: sa8775p: Fix the size of 'addr_space' regions
Date: Tue, 31 Dec 2024 18:32:23 +0530
Message-Id: <20241231130224.38206-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231130224.38206-1-manivannan.sadhasivam@linaro.org>
References: <20241231130224.38206-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For both the controller instances, size of the 'addr_space' region should
be 0x1fe00000 as per the hardware memory layout.

Otherwise, endpoint drivers cannot request even reasonable BAR size of 1MB.

Cc: stable@vger.kernel.org # 6.11
Fixes: c5f5de8434ec ("arm64: dts: qcom: sa8775p: Add ep pcie1 controller node")
Fixes: 1924f5518224 ("arm64: dts: qcom: sa8775p: Add ep pcie0 controller node")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9f315a51a7c1..368bcf7c9802 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6092,7 +6092,7 @@ pcie0_ep: pcie-ep@1c00000 {
 		      <0x0 0x40000000 0x0 0xf20>,
 		      <0x0 0x40000f20 0x0 0xa8>,
 		      <0x0 0x40001000 0x0 0x4000>,
-		      <0x0 0x40200000 0x0 0x100000>,
+		      <0x0 0x40200000 0x0 0x1fe00000>,
 		      <0x0 0x01c03000 0x0 0x1000>,
 		      <0x0 0x40005000 0x0 0x2000>;
 		reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
@@ -6250,7 +6250,7 @@ pcie1_ep: pcie-ep@1c10000 {
 		      <0x0 0x60000000 0x0 0xf20>,
 		      <0x0 0x60000f20 0x0 0xa8>,
 		      <0x0 0x60001000 0x0 0x4000>,
-		      <0x0 0x60200000 0x0 0x100000>,
+		      <0x0 0x60200000 0x0 0x1fe00000>,
 		      <0x0 0x01c13000 0x0 0x1000>,
 		      <0x0 0x60005000 0x0 0x2000>;
 		reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
-- 
2.25.1


