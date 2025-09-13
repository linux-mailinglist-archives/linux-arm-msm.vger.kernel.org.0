Return-Path: <linux-arm-msm+bounces-73399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8064B55EF8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 08:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CBCFAC7390
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 06:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CB62E7BB1;
	Sat, 13 Sep 2025 06:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJQZunZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41732E7BA0
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 06:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757745695; cv=none; b=nEb4qOJhOWfILb3YjgmbPTdLs8piX9x1QgAVMICbDstVQ3TPmM6iorPqIn6YN6zm4vhbL6mviw3qhJbtIuCeDOda+YnSQe6TC6Rbr7us+XYD4EP849ulyZZaLGqcsw8v1wHN7RNB3JhMJUcgO3czwXgaVWl28RqxjuGx2neGCVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757745695; c=relaxed/simple;
	bh=b4u/3r8EbbEWIWFxBt9+YcYVVzC+/qin113CQAU/g5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xgb5uMUlm+VprgCX4s+sYkJhaf4Gz7x6PkyiTegrgEbb792FOi0fnWMugyfLzWH/LuZ7hbCyVCS6AkXEHF1m+eLcaOk15mCb/0HEvyCXdU5nkJrVWQJ2F6Ax1QsAolL47Jl974sOigg0Dc+d5CLK7/r6NYYbgz0bxNQ+4WZjCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJQZunZz; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24cb39fbd90so22941635ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757745693; x=1758350493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+9gSbQhTkyUKu4oc46FN0yP83tgnQ9EveENpBOiA0w=;
        b=YJQZunZz+Z3KjLKM913jEadZLnOuK6XkCvNGtjDKJYuQvXCeWyAKlRceC/SYVcLBTC
         ha4La7ce1PBvnhIYrt0puzT97DoAIE0VSdpsiXCH9swN+4qjCAseUl0boKlUPfZakSvT
         6eD+cVH5PJQANKcq/55jWe4zGvhC5RwAisRKw/CcGt6YHkLmyFcrT03JGiPEsonvSS00
         IqH7RnBkeua2QRM9ZElQ99/o6BOEj8joeMqL1zzeuCWY/qw5vQ1nTLVPnGPFqO6Dx8vX
         7b1NQmlrqXQwDvNIa+3E8Gsyf/mC7jGn7FSdCipkLjyzJJJtxiRR16UIpANndrLHJBhC
         vQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757745693; x=1758350493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+9gSbQhTkyUKu4oc46FN0yP83tgnQ9EveENpBOiA0w=;
        b=g+Yx+FdGZ/jlEQtGMHVDhRVFDj+mKQRVklpMsQy48R5uScrD3JQV9m8K6w7VNFWyIh
         5Si06pmlbp1rC9J4v/gsC+jPJPn0nQUTJ1EX+9GT1ft/E+7JqkeNCFl3HnDVYteZZs1u
         c16+32L6Tv9/6aB7AaZz9scia8kcwemeRErmcqOTvpJQJhFG84AMvFPsE1rV0n+o1xAV
         7/KIIzMtcc6noWk59153XCjR1/i1BmvUWH4eI8e/G1uROiwKxjYhHsJGNfYteEqCFCx5
         VFy5YtUt19qyFIGSkb3I8iUOFzFiDInh4M3sMVj5XuTsB5zuaSHCO/T3BZMnnySnnc4V
         0HMQ==
X-Gm-Message-State: AOJu0YzAYnjWh8eOMsvYiScozmdAt4qVBb5LjyfrBTr8IxBthAN039ze
	a5MTwslmNCciXD2Poy6zy6c1b+hY6lui6lpc/3hcsVG1ZTL0hI06q+p4
X-Gm-Gg: ASbGncsEu1zEq8OijXKbO5XNCaQtMQscqyj6DzSvkaIP2ArmqD8PJilUPMT+7kCZkIz
	1oMxAU3bllenZA92NCIUmRfImDgviDDNgrQOR7X6g5xrY07vfqgL6Y+ngZHeU0vJgyUTQ7TW7s3
	wcoZQeWr4/cslQyspVLNOPVzSvzZHwZi5zL3UKCAl/pL83dFXeIC6oP02Nk2b5VA9dJidC4BepY
	oIyaLYVgJ6+6L3TKu11l43Qre5aNfbuu9syc3djU07vI2rBZaFl6cVp0YyCYUFcShaXqTZOwifk
	ec7F9X+d+fYlIUgOKaPIfKQc4rNIhAHWKG3cytOH6S2KcFAR/0P11Mb089DaqXGUtPzXBWZHhSh
	vrKArzDbuDNz6L5XqEU/erz1TGlof0mT9xZ2ew8VThY+hOIFT/BFJmi7bQw6APxH5Dg==
X-Google-Smtp-Source: AGHT+IEPMOXqhtSRG3ommkdDyK73YAd9aNroh5EmvYiCkuWeEel+Gu02hYUJwz3pnEOvbev7iIXNag==
X-Received: by 2002:a17:903:1666:b0:261:cb35:5a0e with SMTP id d9443c01a7336-261cb355f8dmr13755645ad.57.1757745692902;
        Fri, 12 Sep 2025 23:41:32 -0700 (PDT)
Received: from fb990434ae75 (ai200241.d.west.v6connect.net. [138.64.200.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c341aabafsm69525245ad.0.2025.09.12.23.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 23:41:32 -0700 (PDT)
From: Tamura Dai <kirinode0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tamura Dai <kirinode0@gmail.com>,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3] arm64: dts: qcom: sdm845-shift-axolotl: Fix typo of compatible
Date: Sat, 13 Sep 2025 06:39:59 +0000
Message-Id: <20250913063958.149-1-kirinode0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Message-ID: <2d41c617-b7c7-43ae-aa90-7368e960e8a5@kernel.org>
References: <Message-ID: <2d41c617-b7c7-43ae-aa90-7368e960e8a5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in the compatible string for the touchscreen node. According to
Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml,
the correct compatible is "focaltech,ft8719", but the device tree used
"focaltech,fts8719".

Fixes: 45882459159d ("arm64: dts: qcom: sdm845: add device tree for SHIFT6mq")
Cc: stable@vger.kernel.org
Signed-off-by: Tamura Dai <kirinode0@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 2cf7b5e1243c..a0b288d6162f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -432,7 +432,7 @@ &i2c5 {
 	status = "okay";
 
 	touchscreen@38 {
-		compatible = "focaltech,fts8719";
+		compatible = "focaltech,ft8719";
 		reg = <0x38>;
 		wakeup-source;
 		interrupt-parent = <&tlmm>;
-- 
2.34.1


