Return-Path: <linux-arm-msm+bounces-86902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A14CE88D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 03:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E44103001605
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 02:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7882DF137;
	Tue, 30 Dec 2025 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtmdeF5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6528E2DF136
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061689; cv=none; b=iYidQReLLmmZq/uMLkGYL2ANhYhL7HuBb603g5b/C7Fh24BuXO2XtnpkRLQDSTNt6XqRGQ0U/ccZB/A8u4ElgrW5ym4XAqeAEbD0o1Y3oqNHz0Dk3MY3+wFU+28cynU1jvywq6NiL4TTTVXFHWGvL6kPNZma3mRQBOQEEMrv/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061689; c=relaxed/simple;
	bh=hZMAxnWL5r+KiexN1e6GrVKsiCsKBA3Ey90h4qQueSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEzYMsg3e88gufzBABh8GcNkDBb5MB/uGk9kg27IeMI5mL/TwqOTJXmY+mDXtuIlZBnQg5LxHMit+lv0Y/urMHhHqhqwrHXBSrhudQQgMFo9RO8dxBsNHSaWSvnFk8UYY1pwsxZaVHIgfCjp3gou1W/lzDX0gf2sTcOA7M8nibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtmdeF5g; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4f4a88e75a5so85778991cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 18:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061687; x=1767666487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Boc0hyaruKu7zfPgeDx+KGd5hDYj3D0Tb7d06swQ2k=;
        b=CtmdeF5gazjNOm2BZfnELhBuhN3h0NAGZqhtArcVccRTTup5immNbsMid4fn6ULxeG
         NO0N1p3+17Z1hzu6HmZP0enxImt/27HZ7tJHwI4i02si9UY77c1tsvjgIMmXlmJqYThP
         dCMDPGbqnXCgFRx1iSxqDsZ/sel3enT4dzSbbmbq98BgoS0yPBmda537jH0s/z7wPCK1
         M7zVBRpN2mz3202syT/xKbskz5Q1P+NpxJKEZRx9Kn/fd0kF8x2NCb9c5cl7VOVMo4qm
         I0YWOXm6NVz9ixHuc7GrJaCxD7Of6/k9GC6tai46V0R9AOMq8k6lm3xSwdouBiYklGLt
         vFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061687; x=1767666487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Boc0hyaruKu7zfPgeDx+KGd5hDYj3D0Tb7d06swQ2k=;
        b=ll/Gu0N//HBVmX/w1InJL//uVW7pjSJM0HO5xZ4kQQINTmhI1i2ryanJj5LYLUU00Q
         bpE63qYxtko4ClW4T++F8eqc0S7s7Da9MR6GH+eDL6iX2v9ZewdSWD05oXPEMCIvxMi4
         Q/aIEgw/hoRV9qmnUXaPUKbA+gCFTX8wd+4EuZn5owvUPI6AVBpnERxXdPW5XcW/+flO
         H2HsdwX1SYvup/VGs83hn6yijK0g46EHcXwT/snWU+aJ8ParazjWuaLeIzihp6Wrz0GI
         vRONlyOPERoDY09Od1ZtjjcpODsR0sVrFYyzx6v7kYG1u05x62vPN1yKE1Lsi4p4mtyG
         mTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0bbZ8y/RLJRPD/nVJ4X8unHwnpxYNsv0tp3J5CgWt4WbkUyop9oRjPK/LvEgtroce7N3X/RLsjouVTepl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhg9JLRKLQ0FQNDbT45MbM9SM3y/bw3uzjna8BKAcnwCmJ0EFN
	pvac7UtVCjSSJeE2ZcXaOGIW09n87o33yzkJj9//HYbOMizK2TI3v5xM
X-Gm-Gg: AY/fxX75ZMQGYmtTUVIzL0dK/YNZriBmx2GvR3/DVAhBXFCxSPveY3OtxOsJ28LBspW
	yw584aPRT2i33y2rVtAt/ngl+5OBTeNIk6A2pmIsB/i+dgUeGdPQqScHo803GdbKkNsWwS+woXr
	0WqJtK4gboMi3CUZnwJIKe8EasgDwkEbUv60wGNudauYzTCblmkCxx45dVjdbvePgUGYZDBKmE+
	P+2T8UuvGB+cQTxVpLCzB9rA80v4stE8ZU9bvPkD1tGX/igA3jw4Ty/Ttxt2PrAfQl4AwqBZZRy
	eX/HwUgwRVN09zvDmvrST6ivrpKtfXP6NN2RLjvFk8Ep7dDzj0t5cIxO9PgedgMppAXra+Ygf13
	sw9JtA5QGSONP64EL1kJH2aACCTjSzTnpeXFx5gPNIKezvwhGsEc7hjUr3nX5sed1isBUjgTqzY
	rluS3EpRaIjaL5Ig==
X-Google-Smtp-Source: AGHT+IFEAMQrwwwqZI6BcR86cj8VNjvEbJgT3zi/3zKCZBfFKORHXJEZ4ohqq/vIUFDgz0WWZXwE2A==
X-Received: by 2002:a05:622a:130e:b0:4ee:26bd:13fa with SMTP id d75a77b69052e-4f4abdd147bmr480786931cf.80.1767061687220;
        Mon, 29 Dec 2025 18:28:07 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac532d08sm229328881cf.6.2025.12.29.18.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 18:28:06 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [RFC PATCH 3/3] arm64: dts: qcom: sdm670: remove status properties of camss endpoints
Date: Mon, 29 Dec 2025 21:27:59 -0500
Message-ID: <20251230022759.9449-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>
References: <20251230022759.9449-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These properties are unnecessary and can be removed. The endpoints are
disconnected, but this is implied by a missing remote-parent.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b8a8dcbdfbe3..e841309221e2 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1780,7 +1780,6 @@ port@0 {
 					reg = <0>;
 
 					camss_endpoint0: endpoint {
-						status = "disabled";
 					};
 				};
 
@@ -1788,7 +1787,6 @@ port@1 {
 					reg = <1>;
 
 					camss_endpoint1: endpoint {
-						status = "disabled";
 					};
 				};
 
@@ -1796,7 +1794,6 @@ port@2 {
 					reg = <2>;
 
 					camss_endpoint2: endpoint {
-						status = "disabled";
 					};
 				};
 			};
-- 
2.52.0


