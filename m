Return-Path: <linux-arm-msm+bounces-88246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1C3D08595
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8D03301A328
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1141D3358BE;
	Fri,  9 Jan 2026 09:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIUpHtUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8AE335090
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952374; cv=none; b=sLS9EP1mdqmw0ebdDvrEVfxvYr2NIRMisNERn9G99c8nuEmC2mqJETpEgxZDLxYegp1/KGRd16roL4IKgKqb4FVFUnW4vSrz1u2GH1at2VKjKYMs45HgRFdYua3jkvDCmSFlq+Ff1Hd/QmqgjJrSwvG0VWX1JdVdTocD4H2nRF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952374; c=relaxed/simple;
	bh=cWkoSxf5GQ1pwmPOQLW8JMLepujedW7Nev/TdAtherA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KJVFw+KLYYj0fW5BxtwpH2v/IHZten3yoc3Fi2H9HJWHe+X+M7HmHQhp9OclipmOOr6v4hr6MYSryql/uMzAx13C1/9HOBQ9SFb1hWd6SdNnZc4ve0ogdLIddeOKyg4e481wg9lTSdH8BqjJxH6H7Ac+8xRAfknj3b3t5WP6wQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIUpHtUM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0f3f74587so33857345ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767952372; x=1768557172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIW916aC+DTPkyvj+7JZZ73UBmCogbfoBvDVvOvfy6I=;
        b=YIUpHtUMByuFKUEhIPPFWPXI03Kx/0eNATcSE4GG4S74tV5FfbERzyRr5KCLBW0v/M
         ingz5/pIyV0ZrFovjZumTpGhXECL4cf74AI63IRFQhhdVFQMKwoqICzCgNCibuc7u0Wt
         r/XUA8lzYV8JaLXZi3AxTAiytCnkWWZ4UN4bUOo3RcAefo9iTmtp673TnwkUkoluUhUF
         PYZ+IG6UdClr3PaO2xiNQ3V9grp28xejz20t7FPKf0LYyh+UcmIDRkCbTU91LhEmhQ3q
         en74nRBsnkxxkQyZ9Cp72Rg7Kf2RW0rrSOZgevqED8AOLUaPQyB5L8v2OZknVT15dsW/
         jHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952372; x=1768557172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIW916aC+DTPkyvj+7JZZ73UBmCogbfoBvDVvOvfy6I=;
        b=feE7r+vMFbg/5vpiI+TEXCYjbAO4kcPNCW9TMbTdktLX7aKAInHzJP9A+PeYWr75Gn
         3N5wuvcDcg21lUTY4IdmVBokY6WXo/yNsCvfJbFUhchcwYEppTKVveuH0tCqEGYyTq5X
         cKuKjLWotFG16u2SZH0PfqK9rZs7fT2olzLwr67hDj1NuvfCe17Jpndmfjz0jXT7ujSh
         ciX+XRlz8/E+0L7t9JMLglvGCVmai0ixDsyVuzKK+cKoZssczWz8nxQ7B69oLS41lBx6
         NXCs1N24CaqrA8nKFbv/QKQDLrKuWNIJPvJwSuLF1LUWuBvROdoXV12hheLD1w65Na6H
         INvA==
X-Forwarded-Encrypted: i=1; AJvYcCUDVKA524BtaGfdvOXhV78I/LPSarcAnScIw5bwlZy/RnMyQ+nl0EFD2z9jZQHTqz8rOHtM83Z6gfSPkVPa@vger.kernel.org
X-Gm-Message-State: AOJu0YyaXnQxeUt0wH6wGwjk6wiMH0Q2IkGtjXxbqI6iJ5Xg3XpJGUeF
	uvhM+AYh16gb/WZufEHlKcA3RlV0KhfUM4eqm//RpKXebMBApQojd5X+
X-Gm-Gg: AY/fxX5+D6YZMPoyZoNVDlF7qoDoXrC5jWjYmfqjpcve1QQZEMJTUbBIkn4C3GHKrLi
	wQ+fxk6VnfbQg+PPgWFlALCtcUQuD7Fi2Y/+NiKmpScK/oRc1IEpAA/wO4RMgWFyABoz/mPUfMD
	C9NnlNMQ8N/O//NgoRP33s/tdO4bdQ8uyUyidbe9vM5MlzZ5J7HLxSzDDJ7VcdCZLmQxNVi3k7A
	urJd2143IWpSECMsjtf041XOaW0EuoeboCxSnGNFNDbEngCPOm7WjQ7SdUYg0cd4bI/82DM2FL4
	fLeprothuH3CqtBDS+QFWW3R4jY+pi0tU/fdsl11Dmw+b4/n7VqBca7uO16YWb721Bd/rFS4TMS
	QTv8nfByX6GiNWj4HfTJkw8CAABHR9eVqT/lJtFd2JkzwZFUEps6K0nQmtRczDuMCcmTuPLJhlO
	25orm3FzV9pgwAwOp/IY3DFh+UMYVEVmJBgEWG
X-Google-Smtp-Source: AGHT+IHYHwepqPiwAWEOdjlDbzqEVVwnuyCPg7a4sTAYqd0IUr+3qGRZtpYPEoMGWBVOQm0wgxodxA==
X-Received: by 2002:a17:902:ccd0:b0:2a0:f0e5:3f5c with SMTP id d9443c01a7336-2a3ee4c0ecamr80868555ad.34.1767952371931;
        Fri, 09 Jan 2026 01:52:51 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d79sm103081795ad.56.2026.01.09.01.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:52:51 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v11 3/4] arm64: dts: qcom: qcs615-ride: Fix USB PHY label reference
Date: Fri,  9 Jan 2026 15:22:19 +0530
Message-Id: <20260109095221.2847067-4-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109095221.2847067-1-tessolveupstream@gmail.com>
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the USB high-speed PHY label from 'usb_1_hsphy' to
'usb_hsphy_1' to maintain consistency with the naming
convention used in talos.dtsi, where the second PHY is
labeled 'usb_hsphy_2'.

No functional changes, only label renaming.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index be67eb173046..0ca6b50a6de1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -609,7 +609,7 @@ bluetooth {
 	};
 };
 
-&usb_1_hsphy {
+&usb_hsphy_1 {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
 	vdda-phy-dpdm-supply = <&vreg_l13a>;
-- 
2.34.1


