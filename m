Return-Path: <linux-arm-msm+bounces-56892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF39AABAF9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E3716F65F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327A5294A19;
	Tue,  6 May 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQZRTtCY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A8F283134;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510261; cv=none; b=IuxYNnakI8V+9rv61O/MsCyJ5iSO9ThaUIhDLJmtq/tkqXuHsnUMFzZj1PXVPGQAcPvl/b3JpxK4too42ZDhLOXoQX5pHu9FwYQunbYHvcY/FZbbx+IuXOJQxv3UFRAh0TEZZfQNS4xwsRi+y+5olNZPVxIHuRkDdMwAQuAL9Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510261; c=relaxed/simple;
	bh=VlGlm2rpX2IQG/rie/jcb5KY6Mr2yf/y9ylfqMeqpo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJF+LF1p+iAjt2jz66aNgjCtva+bSJR25r9LVHgWRcINKT9+/pvw6s785Idv5iUKocSvzA1J6jrhUPnCOupLIt3vR1XYevV4YxFavVrYOiBOkDaVC0KRp4QQjQjHy7hXJ/Hj/W9VRtkBNoUQsxljNfB4G+GXHJzanATPqKN/iJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQZRTtCY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB5D7C4CEEB;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746510260;
	bh=VlGlm2rpX2IQG/rie/jcb5KY6Mr2yf/y9ylfqMeqpo8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oQZRTtCYi4tw7YQZ8NXTvn+49Z+EJga0q2LAJi7B5Mkvc97bkgNUBwJROUUfL4Lq6
	 TqSsSyVI4uqSx2C50MEpec+3ULMTn9ZUSuhbR9rhKcVz70hkpPTbGI5dQoWU4PfPFM
	 uerNcZS/q5XiXnh1uE0P1RZLLzwoHUGIGsT6KbsaFwvaEARcYqyFH7JkFm6zOld/Cf
	 HCgLFvi8ar2qCMmKv9INrIqf7kLzkryHqSWRTopPB7669ZW+Ltw5Zr9jn7kBKQq5jy
	 +zndvPRhKPHKpabKNphQqe4HrEIzP1ciJGtPpoMkz0hrmlt1FCKnM+mPHcEcjVxn7/
	 bStuyy2jy2/Ng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6B4C3ABAC;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 06 May 2025 09:43:34 +0400
Subject: [PATCH v2 2/6] dt-bindings: clock: qcom: ipq5018: remove bindings
 for XO clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-ipq5018-cmn-pll-v2-2-c0a9fcced114@outlook.com>
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746510258; l=916;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=JupKX6iwdtJMe4ecLVTA0mWjAGvKoKV28P3vMGpTlG0=;
 b=7p+yVQvKj5aQQRuj+czk6aiSi45ggNA8QFh8VJwga282xblu/OE1PGOvTXbw3Bj8u5hJmcLBj
 J5Cy+BBjW7MDWf5qvb38Bg7e8V4cI2apve30eAPFN79ZcDPH1FwxgBJ
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The XO and its source clock must be always-on and is enabled in the GCC
during probe. As such, remove the bindings for them.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 include/dt-bindings/clock/qcom,gcc-ipq5018.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-ipq5018.h b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
index f3de2fdfeea11f4b8832b75a05e424ca347b3634..d4de5eaffee7b4cb81e0ff2dcbf9e6669c3da8f8 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq5018.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
@@ -140,8 +140,6 @@
 #define GCC_WCSS_DBG_IFC_NTS_BDG_CLK			131
 #define GCC_WCSS_DBG_IFC_NTS_CLK			132
 #define GCC_WCSS_ECAHB_CLK				133
-#define GCC_XO_CLK					134
-#define GCC_XO_CLK_SRC					135
 #define GMAC0_RX_CLK_SRC				136
 #define GMAC0_TX_CLK_SRC				137
 #define GMAC1_RX_CLK_SRC				138

-- 
2.49.0



