Return-Path: <linux-arm-msm+bounces-3161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE20E802878
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 23:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5591F20F91
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 22:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830B318636;
	Sun,  3 Dec 2023 22:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="3jRWZPOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DA5C8;
	Sun,  3 Dec 2023 14:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1701643112; bh=AesBkNxA252D4AbyjH4t7j7mkstu5vSTutkNPCSMK78=;
	h=From:Subject:Date:To:Cc;
	b=3jRWZPOBQ37sHriz6gJx599YjztV6LFvoSQ0pTXrIhS46EGq7gtibm4g8vUEbRIp6
	 VkLNDF04yENFofs7e5viAMajLAqrBBnuy/vraP4zqq0gI4XrFBgRv2JG5MpChKPjJu
	 07wm5kRHgOuEWpPXkaUiHoS/L/7giHo4xVjRp8HM=
From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 0/2] Bring up more CPU cores on MSM8226
Date: Sun, 03 Dec 2023 23:38:16 +0100
Message-Id: <20231203-msm8226-cpu-v1-0-d18e83340b32@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFgDbWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDIwNj3dziXAsjIzPd5IJSXQsDw6TUpKTUFAsLMyWgjoKi1LTMCrBp0bG
 1tQCaFWvOXQAAAA==
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=676; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=AesBkNxA252D4AbyjH4t7j7mkstu5vSTutkNPCSMK78=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlbQNet1Qkqw9icqh7x2TvysX/TZVC/88Bqf31s
 /lVyLhq3H+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZW0DXgAKCRBy2EO4nU3X
 VmSFD/0e+mfQbG/JfIugUj5C5g3aoUlvE2k2qSJIqwdVUZs2s94HVcpvzmdGMebPy3rGV5PhjYv
 S5+mzX/0+9rJvZvGByZ4C8g4zdjSpYI/X4KlqHn0TBCJudMwaUOSuHJkvpfxXGQfSuIaga37lJ/
 StIhoXuj2PddYFI5RRQkkJnoU5sNTVzPJ3TxizFc/B4nKkiZC7eAAN+shaxQuYRFnW6RT7/ZLMH
 6gUrEkiu6zs356DZWQaWWOTyybJlNlFsrA+H6rWsCFi8PLivi7LFrox3fsvIQWoROlTXTGGOkn1
 TTL+1cpqrL0/3ybgVtJHdej9B4McYAG+A0xFij91pSbT5914T7OBEF4zr1tl+XaYNX6b3EJj3bV
 jryo686MpC8IBz6A35osCKmF/ENzxPJ1PHyqWepgt2RSA0Jqe08MzRORzs5RFhaMhO3U7biiyO4
 bMx8xxQyWscNUzyZ6DqvuAPomv0gAAzHFwRwNoeVA609R1WLGRgxCIZ8DCG85m+BrdwghlKeU6e
 Loep7pnWqWRH+ntLyhjs/mWuJjh88BznsBHdAyu5KIi8gQXW3m6gYulIOsZibFWUxEdqfnr6NMj
 Xx/GHdlyzvt852f+y4WfiNhVLq4sDvEkvVLn0P6BfRJXhDDiqJYSE8RnfeQisI5Uz0nEh17K9rS
 7UJYr3cZtY0hgBQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add some nodes to bring up SMP on msm8226 SoC. Another commit to fix the
sorting of the nodes is also included since the ordering is currently a
bit all over the place.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Ivaylo Ivanov (1):
      ARM: dts: qcom: msm8226: Add CPU and SAW/ACC nodes

Matti Lehtimäki (1):
      ARM: dts: qcom: msm8226: Sort and clean up nodes

 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 751 +++++++++++++++++--------------
 1 file changed, 421 insertions(+), 330 deletions(-)
---
base-commit: 63b325612c1e996a107fc156db8ea9b756a9f65c
change-id: 20231203-msm8226-cpu-801bebbed886

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>


