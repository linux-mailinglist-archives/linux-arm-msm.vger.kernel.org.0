Return-Path: <linux-arm-msm+bounces-72001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05517B43636
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09E5D56351D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E33B2D3EF1;
	Thu,  4 Sep 2025 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mjgvfthe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16532D3756
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975530; cv=none; b=BvHF4vCulhyg7DyJnkg9WrQJLn4ETEYDrolE4+bvVwk3AhQ2XlCOiGeG+HLaxLEvLBq9UVYUd5cJi8nIV8AAej6iATIbKa48vxLjRLsoZg+6yIZ9fZOhWDpfqer/nnMNiQQaXoWmOcYboZA+Z/rGVzEx+DcM4QU6qcoj3HqJSf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975530; c=relaxed/simple;
	bh=ZGEqH7zGYkqnFSi4rlrpNOSAhung6PJfCUWI+PnX5d0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUFaLR8v9N82ZVPkzNHcg6cuH8ef15dodqMOjtebM/LJNBNoAApoMA1Wrm1qE0yONIydvGBJaRE2Sv94dKM+XpajfbA4LMHCDolicTP3iQp/R9gqtVTQYFLgPB7HE2K39r1DXbWa852kboxCDSHlNdtwVifTYqP+80Nrn6aRZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mjgvfthe; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso181384a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 01:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756975526; x=1757580326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpo1jT8QicmRmcggPU2o1bfHtAUWdd2RgALld2UHpDk=;
        b=Mjgvfthe4lrT4xnxMQSZi1ExQ7eiB4T6r1Yq9pvAsNh9EJ/tM4chppdv6zPHdrBUJO
         Zjcj4OGyzvAiID9OPmvcR0IXTl7hrm5OOPM9x4w/JyLoFC1eUBhbIuoxVrihpECnKbwm
         S6nOknd7K18kvsPJJVHcZRrdW4SKuSQNEhsyaXuCYP/Cu3qIyvAF5QSWiTcI3BRSV2yf
         Y95spOdRL+rClzBPs7f2ggIEOav6+OUvqjV+qlAVK1PpmnaD/QN22EqNpt7gg1iTaVtp
         V/GPXTAj5zxby8iDWv9ZQA31lCvm6hB/LprEYomx29++CDVgnK7+GUI+e3HpFLDaW+fB
         zCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756975526; x=1757580326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpo1jT8QicmRmcggPU2o1bfHtAUWdd2RgALld2UHpDk=;
        b=ctBe0lB5wWSFu9oER3+RyiGvHEwGEAKJcTN7gIabF+QuW2bmmR5YwI9tN1TdCor8Hk
         y7wF7uARQYQMlKItzJwySjXh8nRtlCdIMn5OkNU5As2sse+yMmOmdLgO8ajXwKXbXm38
         o/nLZJexs8KfJ7YMtB5EuIUOgM3jx427reYagl3LkDbbNVTg21J2mbU7DfeZtyMrDxFL
         xuptCWqp12KqDxl0VkAC5ST1j0Kx/Ye/ItJ0U8fYDdyVKUHjruqvaNu7LX2hBo+ZAKRG
         c8KHMfUEThPhRIqFceQ37qZtiKL4kp7HLMmMlw9Ild9xlcFSpW6cOxnyLaB3HtAyK2VK
         FGHg==
X-Forwarded-Encrypted: i=1; AJvYcCULdoBsCclcj9DndUM2nMRqX9FaQOl4FcToRKiWqB6k4afnaIFa8iMMoheG71+Eb60tO7uCop1KvXO9HoP+@vger.kernel.org
X-Gm-Message-State: AOJu0YxizeN8/ztw8380mbsUCmtacDmtVPeRl3gcRlxfOaiE6iLeIeOi
	bXMjpeG0+fwCgUQLrF2HZ1jmSF3S0soYDKeFB2KwjI4vlscPYZEf9Rgz9s8ZNP3oXqg=
X-Gm-Gg: ASbGncsAVCGq9+m4ILQXNHgAwXj+LPq5WOogBH+qVt34DLssK9iIQ7i9HGo89qoTx9t
	9XjrL3Kwq3CLELPqvbxTs8MHb5+oiQJXv3NVNpp313c1Xy0lnfUdUIcawFm4SWhXc/muUfAoHUG
	YJq5HItB5/StnSreSRv4iwdE3AEAa34oeqmdGN3QeDMXKtmY0JLl1DwohwTskiqEl2D82neIPD6
	/aK9Nat4+8vgXV2BqsJk9fg1e4RdS7ztfNdg35DFetpvhdzTok5tayp7dI0J7BKyECK5G4qwctI
	n3HPgHYJZ6aEqOsYsdxk7zBbKzzgr7nnAWlceO0RTs4+CpzCqRa81KC/UDA/5rRKFdptSyg+Q9Z
	z8VFzraM3yP9SineadVFpeuh+6E6bJ8b7A2Mh1qSmNN/4
X-Google-Smtp-Source: AGHT+IE3VdjWLOu6xIo8rIEY/sOYhCgLWevktG3rPpuCMabmQujVAgKwDckQsqvJYhFcJkQvWetMyQ==
X-Received: by 2002:a05:6402:234e:b0:61d:107:d0b7 with SMTP id 4fb4d7f45d1cf-61d0d612dc1mr10930224a12.7.1756975526042;
        Thu, 04 Sep 2025 01:45:26 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7ed1sm14209228a12.1.2025.09.04.01.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 01:45:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: apq8016-sbc: Drop redundant HDMI bridge status
Date: Thu,  4 Sep 2025 10:44:23 +0200
Message-ID: <20250904084421.82985-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250904084421.82985-3-krzysztof.kozlowski@linaro.org>
References: <20250904084421.82985-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=684; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ZGEqH7zGYkqnFSi4rlrpNOSAhung6PJfCUWI+PnX5d0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBouVFma+h6JZWLqFpNS91mMYe05574SI438BPYQ
 Iyapi97XC6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLlRZgAKCRDBN2bmhouD
 188hEACasGVcudwsVYdu6N6YGVAycTiEivBNGZhcL+6QnP8jxD95/+rceGEt9yM+gZFpU9zu0NZ
 wU7dHyj2R4R/rOt7Ly2/EQ0AadkVU6Ofsm+ttRZJK/Eqi2jCWbDObjZE17b1kFfwU7H8dCdweBN
 A6Z6Mi21DBNtNf6hGT65z30FeCF9icstLVtPvwppH0HN/VeaFQ+qdRFBlNAXDObxpOmrw3KIizF
 WvVPJ0v28P8su9mK6wmibQNMMfwv9ckkGRDCfFumnYLFGoQj7QpouC4HXsugNq8AmI57nucYLQd
 B6bhstxvmo9JZRMZAXH6IPOBgHngtDE9meiLsOANE8a7znf2Y/RoI3Jws8m/ceJyaBAHuTDibR9
 YhgNh87yF8GLyMeRvuN2IBxH1RMAjP05yXVKK4ug3xhi7pTnr/f85z9kMpZAgHHhXIHeO6vWmNh
 dIT7XQxWuv9T5+q2PHEcW25g7eiAnpU8H1vwxm4xBBi6NBXjGb36RJ9sZt8jRyn48wRlUVLwEji
 pUM+Sd93oCC5SxjzVr1VSXUPcJrVU7WS81Bw+k+qza6d37+A48GYHa4ALAXGjk5+6sMYulkHVwL
 cjbhxuPuUn1EMiIvBj0iEz0XLg3gUCu5DtvrzkTPNcb19lEcqndww6AnScAYA4EkV1ggJ8OdoqQ 9IpQF3vSgFJRIWg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

New device nodes are enabled by default, so status is redundant.  No
functional impact, verified with dtx_diff.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 9c71de589749..ba6ccf0db16a 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -157,8 +157,6 @@ &blsp_i2c4 {
 	status = "okay";
 
 	adv_bridge: bridge@39 {
-		status = "okay";
-
 		compatible = "adi,adv7533";
 		reg = <0x39>;
 
-- 
2.48.1


