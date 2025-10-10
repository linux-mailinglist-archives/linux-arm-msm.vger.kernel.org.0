Return-Path: <linux-arm-msm+bounces-76773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF494BCC85F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 12:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60A034FC92C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 10:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075C92EE608;
	Fri, 10 Oct 2025 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYPa0Ev+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04432EDD6B;
	Fri, 10 Oct 2025 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091912; cv=none; b=TCS27hevYYtyuWnSKhm37tZQ7oSAGj0cVw+gwKSA+phmi/Tluc9+lmvzug1RQUvQ/BH7U8tRGji2qyIqfE0v3ZK5X6HSpSq6qzQn4hKiNxXY7/9kbQaLbezPOl+fdq0abaAAUny7cyFUt5nBpdu+/AQYfUfFvjtnJTemaCF12PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091912; c=relaxed/simple;
	bh=/8cWJiBupP0JzmsZI2DgA7npX4AQCb1y9wkxjgU6PiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIw27/XVjr+jMdeCI+NJWqZagv46t0QjDFpWJ4Wlmo1mOa5heONRch0JwRxX0CYiEgImPPo5EUm3xFm1Kaj8IlVuSiiLPQYtl1AXgkqvSEA0WshjubY8CwrLy26w6jurU7ygP4kTqBUvlucFevFQtcvtGakMpHgR4tdu7lnfKzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYPa0Ev+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C866C4CEF5;
	Fri, 10 Oct 2025 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760091912;
	bh=/8cWJiBupP0JzmsZI2DgA7npX4AQCb1y9wkxjgU6PiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EYPa0Ev+t2r7nvsU/5HnVQ/6p3PBcc3rhPuN+uIYvI445r+Uh0tpl8o3KKUHcmPXC
	 SW4Bc/PieLjIobyH4ijfcCOG4IWYiIRyOZyyRba5OVppKwjbIIqKCZMNB+LlU57JYN
	 d0oN/RXt/wQOFvyNzbH1AsuTdovd97uO4HurOROrWxkyUThJ6hU8u3knjqW4NQL2WQ
	 1G3zZfHEnOK/E78GXtCWmYNIg74MR4t5Tp6lU0cvR3gpDQFH3WvO9hELC3UiXSorGv
	 A2yDS9YDADe0yCObZeoJ0ggFXEYPgtoPT9pbP70XWGWAkmWqPFk9/5fpCZdr3wUCbn
	 gCnRqHUEhP4OA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 10 Oct 2025 12:24:51 +0200
Subject: [PATCH 2/3] clk: qcom: gcc-x1e80100: Remove 85.71 MHz USB4 master
 clock frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-topic-gcc_usb4_unused_freq-v1-2-4be5e77d2307@oss.qualcomm.com>
References: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
In-Reply-To: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760091904; l=1009;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=GTQG43EkMyH6tb7Jg5d9UUXZFZPr7cDtj1v8q1r1C7c=;
 b=tMOXKh4mqUoMW7yILoSeq6URocZnmk0bFxuRqh1WeEqmAwqvp6k/4y2mhfJJQm31inQ4+aiZy
 qB8NOvLYo4fCGs+92LgKxW6zyOUKwyPCDdNIbEmLI4pTDrzdhRy5szI
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The USB4 HPG says this frequency remains unused, remove it from the
frequency table to avoid any misunderstandings.

The reason it's unused seems to be that the lower RPMh level required
to support it (LOW_SVS) is not enough for other pieces of the pipeline
which require SVS, which in turn is enough to support a faster, 175 MHz
rate.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 301fc9fc32d8..474404f9ddb4 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -1456,7 +1456,6 @@ static struct clk_rcg2 gcc_usb3_tert_phy_aux_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb4_0_master_clk_src[] = {
-	F(85714286, P_GCC_GPLL0_OUT_EVEN, 3.5, 0, 0),
 	F(175000000, P_GCC_GPLL8_OUT_MAIN, 4, 0, 0),
 	F(350000000, P_GCC_GPLL8_OUT_MAIN, 2, 0, 0),
 	{ }

-- 
2.51.0


