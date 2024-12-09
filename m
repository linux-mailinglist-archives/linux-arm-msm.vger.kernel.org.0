Return-Path: <linux-arm-msm+bounces-41051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6E9E9367
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC0DC163DA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F7F22759F;
	Mon,  9 Dec 2024 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmY+kVPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5D3227571;
	Mon,  9 Dec 2024 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746190; cv=none; b=JnOpQT2tvyBVy2YQO/+gV1lKsJWwG/Xyisfs3E3wo28vPUxBKaRB9puBTWUYLH60Ze3Ssmd91XKGEA18mSR5su2zztLlK3XFG+WfTx9khIn18VolAIDzmrB3NhZAIkXAAKFWRh3egwVyBkqZz9mzwaw6el99DNgT6kRBeGrAZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746190; c=relaxed/simple;
	bh=7nGbNBR2rlmrlKV+/i/enn28MQ/yQq/coI0HrSWcwhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6UNuTtoCkAW+8XpkAXW0zL7Nazqkn2fr76eZ8zmeBgQYLJYUX13IOjs4V7fOkU+ecjr10QPohlZm9BoE31d8iDfPbLFnppvY5DuGrPUUtBnzOrCJ6gI+4HjYejhFUanHcYTdHiL0FGbOuPHEFKMnmGWFvQHvVZ8eMvHDfj7fi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmY+kVPh; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa68d0b9e7bso142514466b.3;
        Mon, 09 Dec 2024 04:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746186; x=1734350986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4L7W9BAIQ/n8Lu+TgBIRQR0dd3Tfyg7NM8s+Xthj6m8=;
        b=NmY+kVPhWo1dg8A1Jqz846EtHzOWmWOtNQCu/RMJL9iDoCC68OKfOvWFb5ANVuFvbX
         JNaskUdyHiBMkuSRlXgXfm2uPHrNq1BgvvLzwvCS8ypxuMtuwjwvRhushGMD+kgFCsPj
         +GGrCsCcuvwNiLDtjxL2jlumKKqCFLabDYhe01edqIxPqWkxVqy4kAn7WU2i5wIIMYxB
         FyjPbo1znmE+6jZzDaKUN+RGlBxQRLgcbFqBkprZ1VBBrguM9LjKSwBf+0yQUYtfKyEu
         EjnGClhqpsDm/Yslv8Zs6CSa9qUFmM/B9THVYWChAecoYXA0lSbjEGbj1H8KvYAyrF90
         i53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746186; x=1734350986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4L7W9BAIQ/n8Lu+TgBIRQR0dd3Tfyg7NM8s+Xthj6m8=;
        b=F2cNWo3FjPpY0ChnhKZDp6xnNKopBbevQjpCa1zgtE9MM3jrR/SfYJpxqwXitD1l55
         jLtS5ZEJZh+W9iTWKwL0+xSi7elSe7tvPt5hvC8IM+9YxYfscFoGD/yG8un5PyiaMf+8
         5MuQ0oIwkJgShpE+WsbWkxeDShooVtT+q5uks2XryY7nqA+pZtojCHtq3ayXnWd6CC65
         VpFFAkpvxwK0t9/6mNu1DHsb9JHX6Yk66hYHggfsQg3RjKoaux+9Y00dHaFLfzAw+H7Z
         f2dhxkJwmrUZykFw3r8+gHry8pPnhzO7M7mKcGPWcjtXZffp7C2kEN99dOpReliht5zm
         h0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVnbDd6WUzzxZQoLI05enzDh0rIkzv5ttOSZJcOjj0I5nqUMya4gx3lO+p8Uhd3iZsaw4yjAvwwPCkgJsaj@vger.kernel.org, AJvYcCXXA3sbNnu1dqsSkd9pMxY5REPAV2AO+TYbMM2DlqGr7AUdH7lHnecULpIdiBMVItpKYLekZj3idhcUZmI=@vger.kernel.org, AJvYcCXZvHxaM2HFvHn8V1aRLc74Z9MR5+BgGJJChjDwzMYRwHntkQyYyRZOR/QxHTBhOw2tnSiOsdYjkyEA@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmjoGQyZRhU7P3XTNhSAtSCl//BKiZELCrjS12NVds+i4t5FY
	/G2t4r36T2/HTNtt1vhAmEMcH3bcfpV1n5w1qWlYx3XzinCgx/+Q
X-Gm-Gg: ASbGncsF+3BxybCjdBQlGppshNcnwEfSje88vpkJSg+nxT9Pxs9zcTrQWhnsD7hHc52
	Miuq5BOcU2Nai7BfoOudkMJXO8XT2VC24Jgsqx7r2C+AoHVMIlmgz7k+K15Vr+Xl06LMWIGVUOE
	U368zoyp+SNIEKdIstkPWmxjSE7VIa88x+qoLsF/UXEE4LcoxHZZ3g31mdgNHwQ7LvKEfbweDYK
	5xZWulvoG4tZk4FAURZ7o0Q2A2QlfgSBV8je7H5Yke3XNKy
X-Google-Smtp-Source: AGHT+IGxRu3xHO5VR4TK1xd1uhMWu0pw0GfW+fcrDRiidbylypv1f96Q1s2lS9JtjvShHTa23MhsZA==
X-Received: by 2002:a17:906:318c:b0:aa6:851d:af4d with SMTP id a640c23a62f3a-aa69cd466c4mr10720766b.21.1733746186479;
        Mon, 09 Dec 2024 04:09:46 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:46 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:10 +0300
Subject: [PATCH v8 06/14] arm64: dts: qcom: sdm845-starqltechn: refactor
 node order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-6-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=1030;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=7nGbNBR2rlmrlKV+/i/enn28MQ/yQq/coI0HrSWcwhM=;
 b=oO3BmWykPCewsxUpV+PUe+me9MZVBJQGw1Jmapq4JbBYdOePcz/9NZ+v+xGdLPlvUmTSGQbbR
 w/3AlnO4q0nAlxO70jUaivdhAHFtcPI6Nyp2u2mHstnaKVIPMy+PM4k
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index f3f2b25883d8..8a0d63bd594b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -382,8 +382,8 @@ &ufs_mem_phy {
 };
 
 &sdhc_2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdc2_clk_state &sdc2_cmd_state &sdc2_data_state &sd_card_det_n_state>;
+	pinctrl-names = "default";
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;

-- 
2.39.5


