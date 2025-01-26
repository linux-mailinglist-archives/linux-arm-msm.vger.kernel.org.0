Return-Path: <linux-arm-msm+bounces-46142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5057A1CA9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FA2D3AD6B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 15:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303AF1DE4C5;
	Sun, 26 Jan 2025 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdwxC1EG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015AC1DE3DE;
	Sun, 26 Jan 2025 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903652; cv=none; b=H8AHs3tkL9SytaYIPrcVF6GyX5xI3R97GeGw1A5OJZylb624qmlcgVNV1X06s/2ZlQ3QAJI7E6iIVLWnixOwnMo1Hdejjg2N4faDdwPul/1eop5sf0YLzKabadbp34j1qMHwq94bhdYwJKXDmOecUtzluO5Y9C/xANUxo4AeBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903652; c=relaxed/simple;
	bh=02d56irNDBarfWo5Mkhq/+ZsO4/9M/5X0LzmTKTyCeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F1+1ou2X6bSIiFoamoc3fVQuDtHzl9Pw5H/2Od21iY1e3zP2gajXQ4oddxAg/kNBheueuZTyNruvojBasPEQB6XprdZntUgg2hQ08Oca04xD5pKrf81nHUTm9GHenISs+hhYB3FcmZlMrwFleja5HsB7i+zaiNRVp5Q0EvOet9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdwxC1EG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB05C4CEE2;
	Sun, 26 Jan 2025 15:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903651;
	bh=02d56irNDBarfWo5Mkhq/+ZsO4/9M/5X0LzmTKTyCeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kdwxC1EG0zOl2d9b+g3nNZf1Cmm9eAnHFf/oviRJ+ukcTnwjjNFL8RQNoXs3LKxPJ
	 xD36Mhs7vvH0GG2dpWEFXcEO5E1D/0QAtVFbmEPAJZGe51zLaA5y26IYGvtXTaY9Uh
	 2h1oDHB9QBxsHE5H7Lr0xZz8ZQ6XSS1JuFcKen6iVhP3VcoM2I0Cb0pWV/18c8XKv+
	 RNpZgn/lh6z5UwU7ANlWwDysQCnyFmygxXEkMX9+WuhEPiD6W9SMFgyXUxBWWi+gzR
	 h4xgmUnfY4wM46htXdFm4oTPoe2oZDLgdCi6YdsYoyw54SWpNlulGj8Ju4x0DDtxPj
	 aCPqb2Mpb3J0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 12/35] clk: qcom: Make GCC_8150 depend on QCOM_GDSC
Date: Sun, 26 Jan 2025 10:00:06 -0500
Message-Id: <20250126150029.953021-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150029.953021-1-sashal@kernel.org>
References: <20250126150029.953021-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[ Upstream commit 1474149c4209943b37a2c01b82f07ba39465e5fe ]

Like all other non-ancient Qualcomm clock drivers, QCOM_GDSC is
required, as the GCC driver defines and instantiates a bunch of GDSCs.

Add the missing dependency.

Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Closes: https://lore.kernel.org/linux-arm-msm/ab85f2ae-6c97-4fbb-a15b-31cc9e1f77fc@linaro.org/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Link: https://lore.kernel.org/r/20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index ef89d686cbc4e..c27ea46283fd9 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1079,6 +1079,7 @@ config SM_GCC_7150
 config SM_GCC_8150
 	tristate "SM8150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
 	help
 	  Support for the global clock controller on SM8150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
-- 
2.39.5


