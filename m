Return-Path: <linux-arm-msm+bounces-46436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08545A21526
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E598C3A86A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A071F78EE;
	Tue, 28 Jan 2025 23:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="7JO+bE7N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCB01F542F;
	Tue, 28 Jan 2025 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107392; cv=none; b=YDwfer4VFCQ+vEOcp1nEKJESLh3UoyyQdsiNOlGsoMfM9mMp6MCr+xp3VG9OWDHu7X30nJNh9qvPRhrUS7E1LZoB5kM/BmhmDdtzKA3ic7AVU4uhLIe9tcJiLp7nEKxrdYtmyK9UBiaE3rTmrix/+GN7OqxkFttX832NSw4eh3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107392; c=relaxed/simple;
	bh=jpy5uWscm5n25aeooQjOuugzo/l5xnqC2dhnFTaNXq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLKfd5vGFoA/3PnfdGDcPtcCXJMfXfbIwZ63r3HiiGMFSlFUzVLlfZChxR0sfQqKCWL4ZhdtkSUtDzB+5KRDc/P29rIghHXQhBblxzn08IGGLN85KP7XoxcFS+xzpOkR6Xh1fa4w/cMMq/bPcwYUBV9AEztZyH1YXeD7r0mLKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=7JO+bE7N; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107380; bh=jpy5uWscm5n25aeooQjOuugzo/l5xnqC2dhnFTaNXq0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=7JO+bE7NKAKsHyCDNyUklXa/BKFSdUaY7+QlfCCMSt8b3Jk8K986E/Uzx+awaoOPE
	 1b4VS1tX4zWmxuWZB5PkTI+DjwDZm0ftMDjc8t8k7/sbxsD+vVxtwXssZ6wZTv/Ihr
	 pX6OluYUNVTlNsF/bGtmCxyOVWOb74JC2uPbDPVA=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:39 +0100
Subject: [PATCH v4 07/13] ARM: dts: qcom: msm8226: Add node for TCSR halt
 regs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-msm8226-modem-v4-7-2b02ed7b7f1c@lucaweiss.eu>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=EG1Yxy7Ssf9FR6CqB3nM5wo8JTRgwLQbA7US32NjMDg=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnrKX62znRagfUcdGHlPU5UzQp0ze9DG/ONz
 OCiRvj9oo2JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp6wAKCRBy2EO4nU3X
 VmwVD/9qZ/N9jwRlSAD6Lk1vk+HSG8LJFwTOrARPQx1Z7F/s6aTqUuxbqYyKCiFUUNoGWJGfazL
 nTBqiDtSEmCPS2GZerSekmspXpWA5sodlPChaXVbAUK9ecqNqEhEL4tRi5MdWx4JfML+SXwbqlO
 EpwUOKhgFjMOA+GGylIauOqP3vxi9Eia88H3a1NRCXF54r+ZxNBkAlpO+YWUXUCZ4UVVnABxlor
 eXLP5vGP7KOXYTc4QyoB4bYw5FZ7ufApBKAWxDTt1AqbDUOd5yW7Se2NGQ7eoX0CWwzWoC8CoXr
 KwtYBhamzMqo+puHzfmzytMq3nqHpB0gp9eC22ylKfay7aNSBhgsk0GvqRRrka4xCk5UzdNcmXT
 vncuKK3g4seIwR4dwWqEPMHPK1prsWJXXRC2wIyadk85SQQQRiY8QwvR/GRhhaoRT0Pm4uit718
 TcDelXxvWN5aao7lv0i1NrCjpFDIrpGc9JR0hI9bvwAQu7t1L3Mz5rYDQVX0cwmwhdWU49w1LM4
 jYzczg/tjS+gPIUODJS/oc4By4OY+2Bq5DSdlx3mgQQrB2hlJ+MYFOthw+QUrmKVkumx+dGFBwg
 Hr/fIT0UP9HnT2OJVoVbSUMITDEXxcLR8jP5mW6ogCkdIUV955mvRmxZ1ttyAFrGzL6chky9Yoj
 i2HIqnxJ4AILiKg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add a syscon device node for the TCSR halt regs needed by
modem and other remoteprocs.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 64c8ac94f352e46dc4a18f902d2c30114ecd91d2..caaeeadf289f78d29403312738bbb714eaad74d2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -851,6 +851,11 @@ tcsr_mutex: hwlock@fd484000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr_regs_1: syscon@fd485000 {
+			compatible = "qcom,tcsr-msm8226", "syscon";
+			reg = <0xfd485000 0x1000>;
+		};
+
 		tlmm: pinctrl@fd510000 {
 			compatible = "qcom,msm8226-pinctrl";
 			reg = <0xfd510000 0x4000>;

-- 
2.48.1


