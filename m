Return-Path: <linux-arm-msm+bounces-8255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A883C338
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68286B2509F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE53854BCE;
	Thu, 25 Jan 2024 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bvj/naTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA351038
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706187999; cv=none; b=bGmm4lybX+EvsZOdzHOYpz8ptaFVBgh4rM7HpbUvS9VJZ3MWSf0CzV774d4pihAuuXfNjx+OJQQ2ya3H6hNghSgzupmOIOccZD2PvpDAepMNXAegnfSnNOFSwakFCO5EgEVlmLvhyWQAcvedgTWLMA3c0c555YlhGHwiUTwcCkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706187999; c=relaxed/simple;
	bh=ldYdbs5oPh4Hq2Daxb2G1AuoZ8dqv10O4RAJbEtaa5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aH/hn3dzaBtJ0s8Z6HEuAo6Rss9mcyUWxEono25RyPCTNLNywnBVbh9AQyHIhJqoDTYQsFLQrE8SMG2k4fxhmYPtDuH/Kjm3dd9xAKt/u4LiSOscgzRc3YnX22hRvGNrBhBko5cv5Sj8190lctDK4PXJ9JUBr6UIxWGjxqg7vGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bvj/naTf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55a8fb31fc2so6431835a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706187996; x=1706792796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIkqlh6CaDU8JayB7s5wW8TvwFUIh7h5CDgwF5CSs2o=;
        b=bvj/naTff+Inuyp4yIEjMWI8P80qmsqeOhfx2dr7F5Ygj1Wk1XXaKXPlqWvZs8p5RD
         zvq/OvGnvyk1bfQ/YBGsLk3WuGRh0Yt30qhS8kKEHN/CQpt5TSFYmBGD3acuQJxe0LKn
         bdwfTMlajJn8BS0L9yYXSWR4hboWvzjQcCyUWtMDUs4OFqxuEL9CI5Pj+ASdJnz03mzu
         vGtk4HymG/NHHQ1aDCxUET9vE0Qqlft768FiJMynBefXcR4POCctPien1ty2hlR2/CXh
         BAjCt1EI3Fe7FS6bGWDz3Vq1MgONRXMM+etglux+xiCzo6VuGngnZVp79rOEVK5FqYnF
         9+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706187996; x=1706792796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIkqlh6CaDU8JayB7s5wW8TvwFUIh7h5CDgwF5CSs2o=;
        b=BndCJZabVNe9zfKdFQhas0vKzYCRptTXa0H6WWxI+QJ81EBlvwlaq+mInIQjPh1pxZ
         BTqJXEpyaBq8i0cuYb0YVj3g/rKefgS4syVtIGm0oGZ+K1jrg+E3BlzCaE7N1NLe+DyA
         lY/93PymOHK7xHXoNaqr1P5Yk35XOYdEe3VEBcegOubRDknPur5YVNp8c8nT3dlW9kvX
         x2LYhlqWAxsyNZoliuAlEGX76c7ikUuRVdw9R3mi2K//0xd1xdlc+W30YBP6gTQp9O/s
         fcgi3pj6t8g1zyhBM+IcOAe42Je0j2ibAuKPZ1Slzby+ajL16rdtq5dw+ylz06oyejva
         Xcpg==
X-Gm-Message-State: AOJu0YynEYP7dzzyf0DtNlD+f3Zgx+bgMFw9IJ6vmNKNxiFifGLuDm8z
	JhsJCb82odAqG8800hxFwdDUP4D0b9aWan0Vh8h29GSE5wBfaRr4515vysqFqs8=
X-Google-Smtp-Source: AGHT+IGAnOfanuHCjqF65xc8+b+OuqS/2WVdJ42og9UCSzWeaHtelLO01aRON1hOUAtgJUJ9jR2eoQ==
X-Received: by 2002:aa7:c158:0:b0:55b:fda0:4f1c with SMTP id r24-20020aa7c158000000b0055bfda04f1cmr654411edp.45.1706187996200;
        Thu, 25 Jan 2024 05:06:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id ig1-20020a056402458100b0055ca5ce62ddsm1873315edb.12.2024.01.25.05.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 05:06:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/6] arm64: dts: qcom: sm8350: describe all PCI MSI interrupts
Date: Thu, 25 Jan 2024 14:06:23 +0100
Message-Id: <20240125130626.390850-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each group of MSI interrupts is mapped to the separate host interrupt.
Describe each of interrupts in the device tree for PCIe hosts.  Not
tested on hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index e78c83a897c2..70ac80a6dc8b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1611,8 +1611,16 @@ pcie1: pcie@1c08000 {
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
 
-			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0", "msi1", "msi2", "msi3",
+					  "msi4", "msi5", "msi6", "msi7";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-- 
2.34.1


