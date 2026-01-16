Return-Path: <linux-arm-msm+bounces-89402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F61D31B31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 226F4305D88B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628CB22370A;
	Fri, 16 Jan 2026 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="be3WEBYL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA8A23FC54
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569454; cv=none; b=c9V51iQC+YJgyTrvarBFJL/LNCIvpfo4bSkUxkhxJ5lcXjaeoIEtZ7d9Uz69YkVYBTRRrNWYqi4c0pDQkB8ob51ZykIyRpLn7BH1J6pm0pCRkXFXnB7xROTxpYUQoOAZrkNjdVn/w9J0aWF98res/YR2KSwq+nlR13ZRlnxsdLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569454; c=relaxed/simple;
	bh=v3yWlx3GbotL3G9AhcSN50C5SpvFDf2A//QxTjb64Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fna8gZgRUrWimbu3P51cVRHyHJsgRmEuMRw904G2bW6seKm45E5MKdKvPwJmFcLZjIVprmNkV5ziNyXBgCcrFEd1GCD8wwbzsoQqyeila6rl5dKZ+hDVjYBqpAuK+rMCDK8YdLMzpPEY48VEtw9mDsTiJgvCmGiTjF9aPyTx7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=be3WEBYL; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b879d5c1526so117459066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569448; x=1769174248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJgg01NaZF2IVCPUnfeyk7TRyWFsft/f+OKB8cHgBK8=;
        b=be3WEBYLr9CQ8Uqbqh/EA5zPkEV/7hU5Jz3ypwBG0e9aSBTlqKJGbZ4u4eWPet+gdh
         shzQnn5Q5FFynUD5mizZ7QvHkgU5ruktjLctez4uCwUsh4lE5xMadbBfH348kl9chRI3
         kx6GZ7w9ubrHP+JQU7yTFZn6QZt3+7vYNiNzqyXt5op3rQ/mREwzSfZscPSCw7B916i/
         OljF6Tp8xDVIkbB3rWb6joPQ8Zv++tBZnhHVYc4xvzqCX5yO0fhZW0UYEVdu8YQyJg1z
         y8AzmtxG59iorijbkrEQYsppYqhv0InXGN8vJ1W4JJ+eIdcNCxULdk+LCSGs4KVugme/
         Pr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569448; x=1769174248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gJgg01NaZF2IVCPUnfeyk7TRyWFsft/f+OKB8cHgBK8=;
        b=UKc8OKzM6/jb+sxkrnTNZEVL0iDZZoqJeFgIZuQKu4Uk+8tl7WQlUTUaO/Etg08Akk
         9NiGFJqs9X00f8TahsD1HOc3WvMLn5zISJyjXDAe9Nw9Bbo/uEdLv2FgnxxV0G3iWy61
         TazZUmammUHcFGgQm/mbS5RMIbB2NOQmGcb42hdEXvDfK7nF5HqiYQB+4T5PiMbYl1A1
         M842tedE6Hqrs/foiBitm0uDWxnA6wyQhcYjSwO8C27qzQnd/YyEPB4vLCIyM9Ar7cFZ
         2CcYLy8v5OMSR/F71up+uFEqSIssklol3Uzmx1Mvu/frZZj0en5OwXYnp9NUDtZg7NVr
         5aMw==
X-Forwarded-Encrypted: i=1; AJvYcCWQaA/FQ0fbvvtkDJzEXcin2sBYU+i1EMiZpKlUNSwSKAwR30SLZWJKFi3/ioFa7goYAClUaWQZGw267bW6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2uo/OB0jV58nascdh3R3PDTXqwDDGqahEITdQ2NFkp0cyZYHJ
	mbyctqG32snjFo0/3e9rwMUBUz0pUYTWFlayVybUfBxVj/zxp8VIAbqzYbGZ3RETLqJtSS+HJEl
	Dtiro
X-Gm-Gg: AY/fxX5U3zLBfogm7zpmRK1QBqWGsCc/NzVlzEsqF5ahDQ5Y9ev8bMpM68pWJLktyXg
	j0agdm+i6lBhWQLBrOE2X9L0W/njIvQTrkLIpWd5VjgXBKH41c1UxRA0rQipPUyET40jOy19Ouu
	awL45f7Z579UFb37WmwFRGJf+Zr5tCG8uHpncj1m5v2nxKl+RcUjSAVn163oTVIews6azBxDx+Q
	pI3NwJjg7dW5bZThSVDYJ6y8GrEbMrPU1yutqdq2WpxmuI3xg7gyklwdvMUS/q+Wdy8mYRoKZB3
	ZHE7cvEb0ytk35H7SFwPxV2cG7HZK/I1ElVroYemflfKKv4HOo46EG4gg4kRGtMA8EBm/pYCqBN
	y5F2htUTKUiYbPK2vwbWzkdY2N+jFq3Eq5RxLvW/Dnt05nrxnyGVvLJhri4EyLRqlBMx2y5yif1
	t6K5v4PzOssYyiToiTwKAnZJABBIbVsb5L/JEunkf0+XJMu1bCWzmqaikjjRnUbPN5
X-Received: by 2002:a17:907:940d:b0:b87:2d0f:d42c with SMTP id a640c23a62f3a-b8796bf55e7mr207695866b.63.1768569448338;
        Fri, 16 Jan 2026 05:17:28 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:27 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:24 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: milos: Add interconnects to camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-5-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=934;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v3yWlx3GbotL3G9AhcSN50C5SpvFDf2A//QxTjb64Xs=;
 b=7wylF7yqR/1GoCG7yFRPMLqJokhikSOBv5u57rvVqHFkqjHgqmzQMvlpMhfx0Dl0hM+wLd8sL
 nNihUzL6AQiDwGvEwHERwtwD5doSABLP66k8esCiKpq1FwIUTJhh9H+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The CAMSS_TOP_GDSC inside camcc requires an interconnect path to be
enabled, otherwise the GDSC will be stuck on 'off' and can't be enabled.

Add the interconnect path so that this requirement can be satisfied by
the kernel.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 0f69deabb60c..58b4c2966df1 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1660,6 +1660,9 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.52.0


