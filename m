Return-Path: <linux-arm-msm+bounces-84145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04926C9DB5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 05:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1583A1A96
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 04:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B770E26FDBF;
	Wed,  3 Dec 2025 04:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ur3+VYAl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC86927381E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 04:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734753; cv=none; b=ud6rWgYMQ5Souy/499Q8v0ixRZ5Ox1nGpv33WtHng6eANiHxWpjH5yf0o7MwNULmDaIWpAkWa16deokaOVdAuhccvEjlxo0PEwryTEkyt97qQ2OLpFUteS+TBUicffAefq+OAK3ZnufhiV/Gdva1dATarcBL9Geq8aGla0hQNfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734753; c=relaxed/simple;
	bh=n917d0FUTWb6oIgJoj4/YwDmqaXHdJMv7QouzHEd0lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R225wR/sUIUEVOZ2mp3Fk2kKstZ/nffkHkh1ZRVUphBCDo75xJE1zOLmN/5grqMDZ0OJWdpD/3nNbg9/RdDnmSianJMBdgLYBN5Wq/ZWHbAJoXsp3XvnARC9yo9QlID9F5eDMcbf1izdqq6t3b6uqVggwcNMT+tDDQXMVyGG/n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ur3+VYAl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37b8f270a3dso7676781fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 20:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764734750; x=1765339550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woXRM0FgmChcnuN85zBbg3XYQxsuUDdnQE/N5irv9ds=;
        b=Ur3+VYAlpSQY15Ne5xKGyl4e3i2HkOTjQNalecuHuaDUoEEunB1YF3fSuatm8Ss8YZ
         DswgH2VzLbLY3q+egPgRz0zf66/DxOtJNyslpEJRpzAJwY8bVb4gSpLmWkVAlQFF3MXw
         pJxWzlCQsQveLSobRRx36akreepvoduJQsHTD6C8I1W9gghlOtKo9e9F0cmwu+VdM67k
         EpzUYwgMdCJmOTC1FshDKeLNY/6pruAjJAuJkfENsWk3kZRr0h677r9CU6USlRrrlkbW
         9yKJPPG9fq+wfTY4Ozr/hWwp1F5ZyzonEsYR3IfObb8FNo7OCjiGsAxjAjCoaSZ3rHnC
         WWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764734750; x=1765339550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=woXRM0FgmChcnuN85zBbg3XYQxsuUDdnQE/N5irv9ds=;
        b=pe/sAVDQCOwPw9qK5fsMiUesvoJvehCLVRlCtJLestRsP0IPWWTe9eZRVCPnP1s0iZ
         c6gYqfFJMLRBEeXNU41fGuTexFeJLXx916NNXcjDnuWuOsH7ltySoxq9SZcNlCkz2MdZ
         I3Ywov+GElFVz5l9DlP4eFrqlj9Kqp71xdN6EkiiV7QPlQ0CQ+YA93kRSeakAiQbdkY0
         LA8znRhpvazoYRCJKRGPfPQroENZeNEzhP8MdX+p1A98RbMD2seXbspcLmQn9mIVqENG
         GlWe0EAZ/RvhR2rrL+MTqno+pzejWm4ovVs9mp6IokjpQGpGNeQdbXJlpRyX3hd7Na9z
         QLJA==
X-Forwarded-Encrypted: i=1; AJvYcCU2D1N7CEKW8Lj6CX2xI0AdkBimXPH3UDBDUzrJxTgEGsYReHIRf9BGUZArXDVJ7k3we08qrbzNcl4b+qG8@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkFqEa8bpMJIGO/dEUL45iJTawYm1HaM0z2bUvDqMOBOG2jcv
	HnZc85SlyL1C4DfRy6+YTSVDkkXZwkTgr39wt4BOTh6QqJDKSfuKeVUXa77ICeWzMdc=
X-Gm-Gg: ASbGncsD63p2bdw8roX5rSwdXePrEUsHgzB5Gv/nzkZu5JwgwuB9+kzF5oTaZykaaNc
	YINHmEg6o/VaJTeAy05DfEv8mBiyNCGI8GfprF4yef1MDJ+EbcNYOauOo+NyBT0UYigMlpT+07I
	fg0LaEKAk9fvLNnDuVNRPRXtcNKGsQhWFFKsx+59Mt+dVWVnp4Vv8sV+5LH9Hv/u9ZM5P+gFAOe
	xOO3T7oT7RsyrYcQvpky0eMqJT/mmcFaHK69pnk+0/2HIpXhz0gVsy5IkSnNmkieYNijLq1EVNa
	WUsAvjuUIXTQQ7udEz44cmW3TYkCLOFi0BdP1rieIc2IllFLhQnNaNgH6XqJPn5JbBJd6yz205s
	1hFLYflxj0v2r5F89WNy0wFolAXKhX7myrYDNcO8BZ8e4NZvqLrAs4VIjEsDCZi7ahCZow2TfE2
	Ry6Gr15Y9rTEhK0AfBNCDDkwIJrMVEYyIIvv1rSOJ6FRQ29LRrOl58OA==
X-Google-Smtp-Source: AGHT+IGiJ2EiwArngokAluzWqRTKeDdBq6s4FR0P9zPxFKj1p97CfRqTvXszSlTJqv87E2/MYygMgA==
X-Received: by 2002:a05:651c:210b:b0:37a:42ac:fb8c with SMTP id 38308e7fff4ca-37e66cad9bbmr232221fa.4.1764734750071;
        Tue, 02 Dec 2025 20:05:50 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d240981cbsm39505631fa.24.2025.12.02.20.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 20:05:48 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: qcom: sm8550-qrd: move camss status property to the end
Date: Wed,  3 Dec 2025 06:05:35 +0200
Message-ID: <20251203040538.71119-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conventionally status property is the last one in the list, move it there.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 48af6d114161..b3eb0836c408 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -717,10 +717,9 @@ vreg_l7n_2p96: ldo7 {
 };
 
 &camss {
-	status = "okay";
-
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
+	status = "okay";
 
 	ports {
 		port@3 {
-- 
2.49.0


