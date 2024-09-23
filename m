Return-Path: <linux-arm-msm+bounces-32185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A897E69B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 09:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A4B61F228C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 07:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E0777101;
	Mon, 23 Sep 2024 07:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i5SUXaKE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C351447772
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727076549; cv=none; b=PPhy3gidpteL/91GXYDjJ7IE4UJPvrJ5suOIw1/eRxJjyXTL6TZbjEFhveataF1S/kVhIKiZRg/4nKtrpQcqVDqB+GYsBXd8CBRhNKP0ZQZThmLtYUl3MiZQ0RDbZynAuHMGqHrG9vAtGWGlUFRFuqyGDiAlw2GJFu8fthCwsPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727076549; c=relaxed/simple;
	bh=7pQSa4b4GlzE5eupsdIVj8T4K0JRPjHOsUfy9A5rcbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0YfA8DcRZ6L9QpFAQklpm1L98UTxqis7WtwZ+0Y/TL2upuzuJVghxpU4dezmKSaS5AZ2lQ/BpKCZTbedTbCdbqHO22/89Ppl75zbxfsde2uvTN7AqCw7c9gSACjxDthlSw0sFkk5l5Fg/Etu6VxOGOgZCKxTE5JbrCyW4lcRns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i5SUXaKE; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a9c4858d9cso62492685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727076547; x=1727681347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RL+PGx3dSjKZk/vbyi+GiTq1Mgd2XuhjvH7cuwoY2Y=;
        b=i5SUXaKE7ahAJpbz3okTiKUeJnhxcGZvdf+OBrftup38bdybZ8VaIN6xQz1f57SgnC
         kr82aCkJPuFo9C+vGTchbjGf+KMzAZqvhRipe/gc0TZCxaW44plY8762y+G2SzCzuxFY
         /dslwgv2fOzZhyoztXq0+bhKHasNZ65P+VDp0RPWbm0GJjUUhnOhCGFjNkmbp948L/xc
         90QcR3Eq6A6tLXE7BvjrurAc90SbRb/nEZYiKYnL7c/Z0O6H9C14dE0xJfos4BfuFsar
         TCzazSBAFuDMaKKww8Y54nUDHJ0tArbJIcWjwiGwmKpLncR+QFMGC7E8P8yysXkpe2fb
         gQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727076547; x=1727681347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RL+PGx3dSjKZk/vbyi+GiTq1Mgd2XuhjvH7cuwoY2Y=;
        b=bBDTh2ULPtsE7Krbkejl3eHjdxRRQcLYQZKulQtSkb5Uy4BmT68X6TObNFh0xXr6kK
         aohz6ib6jA5muy9dDSUS5IIyLLzyxvhBgzLdToOtwe7ECcMfK7yjYDaahqDte3RlIpfy
         EbPmpHGu97OU8K6Zuyub8cXoxPDZ3w/1kxJE8ggevdgkBakGmrXAb+EnJou9ovEQhGfW
         EXk2CDrPlWxf25GQHWQbmRJbhPv6ztGFtgVl/hezRA3oP/Km5JeDgnTXbJojjUZypNge
         Vjhvd3oeD3OOA1of2N26z+ywHuv9GgcKT+bC3t04gVLLbW3Xr36EF0u28BsZzZq8H/DZ
         RyhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpCpuKD7bTn3Qcu/9+hwdkJAmAEfLU9mcqJzIe/W/gN4fBloltvi17hpn+fESshb1jwu19R242Uf2m9SFY@vger.kernel.org
X-Gm-Message-State: AOJu0YypDYQwO5iFheYFUErnJ2Fb9sKBem8w8RmjH8t1L51Sb5po2Fyu
	2pKNsmTxnSP9kOnELvryUIR8BblHQcZIMKyAZNlqcTfJtRHbNEgH8tLW1DwUm4k=
X-Google-Smtp-Source: AGHT+IFMJEJCmxtDtPL9zaXvM7NO/KZlhn5JD2Gs+0qppxE3sGEXoeTBcrfAE3685XamqMzd6fR5+g==
X-Received: by 2002:a05:620a:298b:b0:7a9:a632:df39 with SMTP id af79cd13be357-7acb81e6e54mr731150685a.11.1727076546707;
        Mon, 23 Sep 2024 00:29:06 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08c182dsm452872285a.75.2024.09.23.00.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 00:29:06 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
Date: Mon, 23 Sep 2024 10:28:26 +0300
Message-ID: <20240923072827.3772504-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expected type of all CAMSS interrupts is edge rising, fix it in
the CAMSS device tree node for sdm845 platform.

Fixes: d48a6698a6b7 ("arm64: dts: qcom: sdm845: Add CAMSS ISP node")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 54077549b9da..0a0cef9dfcc4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4326,16 +4326,16 @@ camss: camss@acb3000 {
 				"vfe1",
 				"vfe_lite";
 
-			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csid0",
 				"csid1",
 				"csid2",
-- 
2.45.2


