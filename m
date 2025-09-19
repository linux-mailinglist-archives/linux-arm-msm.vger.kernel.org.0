Return-Path: <linux-arm-msm+bounces-74185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84376B897A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B6717AD239
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 12:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093461E9B1C;
	Fri, 19 Sep 2025 12:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JBogxAS1";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="1vd1wivw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598991A3164;
	Fri, 19 Sep 2025 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758285510; cv=none; b=a+Bn1ciF1fJWOpmJJcJnQY6AgcBqZmJnrpsTRwUDLWUNCvBVWrRVu+zsbFqpxvKeKvQdINvE0mEV+J/bLUQTVxOpxVQMVzBbq+7282NztG6FYJFtpVoxGd3viUMiZH6Hrv/wfGK8sPktzgKrbFQ78sJw4ctlAFB+35JquueXQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758285510; c=relaxed/simple;
	bh=pjdx3KmkVfayItoNx+GcC2rpgXGWKVIs9w087+AuPlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bj81GpJISoXGF607vub14LwUUs8NsLmjziyUl4979fXWSWN9jQwQ+A4F9TpX+7aJLrTPD2w/5Jj8Be6r18guMeTL9435wExZQYI1SRDE+BNP7JQNMjxRoZbGXzSC9cK9Z7+U6skH2RjcWgma9oYJKIsmXhQe+fuzIZTWP3J8eM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JBogxAS1; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=1vd1wivw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758285282; bh=iItCiU8BNuecu2gfmjPAR9Z
	OWqkt6OC1Sv++g3RQvMA=; b=JBogxAS12OEduoNVHfRHuhhcr+H3XMYOiCA3R+kFX4yWtsXjwG
	XMyXMa+b8Y3sSoCgUg9+0ERi7ByflIEDf3ISMzaro6r5ZHgg+Nx7SThCecMcFAfmQTpxnJqdeni
	nFD+CqPPqmxQA23EV/g1zPP6I7dUsrqtS73BJiVG1A5I1s0GZdC0Hk/Zmtfbyehro6FNtJoBfAL
	K53jN3JS3NidKrMemRoFTwinHgiQpAAipGBw+Fz1yz4O9zmdRFve3WH5JVjNnLFYF6m9+QBHpkk
	r2oTlIRKmN7FwoaJqZ7uQAOJn12ohugRMXt6ci4y1qCwGXu7PQfSpXf6sCjWQmsmlxQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758285282; bh=iItCiU8BNuecu2gfmjPAR9Z
	OWqkt6OC1Sv++g3RQvMA=; b=1vd1wivwFcE1ySViRECIa3RXokwVitrHNg+rrVLpg3ShLfiCB2
	nBO7b/rOYin+n6dIz4Dwq9GM+4shZpxr4JCQ==;
From: Jens Reidel <adrian@mainlining.org>
Date: Fri, 19 Sep 2025 14:34:32 +0200
Subject: [PATCH 3/3] clk: qcom: dispcc-sm7150: Fix
 dispcc_mdss_pclk0_clk_src
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm7150-dispcc-fixes-v1-3-308ad47c5fce@mainlining.org>
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
In-Reply-To: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>, 
 David Wronek <david@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux@mainlining.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Jens Reidel <adrian@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=adrian@mainlining.org;
 h=from:subject:message-id; bh=pjdx3KmkVfayItoNx+GcC2rpgXGWKVIs9w087+AuPlI=;
 b=owGbwMvMwCWmfPDpV6GDysyMp9WSGDLO+j7g3pG0eTmn1qb7Vep3Dpr9eu8e/ZuNOzU+tCoyx
 Ks1a8rljlIWBjEuBlkxRZb6GwkmV62/HZqfb7MaZg4rE8gQBi5OAZiI0GOG/8mbr6ieF1ALEFg/
 U7a6af/z+cbrzl1snGMhoPJU9suKcwWMDLv/m260eSiS8m7uhgVzHtw3fFAs8uSb3WzvZQon+xX
 Za1kB
X-Developer-Key: i=adrian@mainlining.org; a=openpgp;
 fpr=7FD86034D53BF6C29F6F3CAB23C1E5F512C12303

Set CLK_OPS_PARENT_ENABLE to ensure the parent gets prepared and enabled
when switching to it, fixing an "rcg didn't update its configuration"
warning.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 drivers/clk/qcom/dispcc-sm7150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index 0a7f6ec7a2a737c6f6f0484c71dd80f3dbf758b6..811d380a8e9f9bd8a8f1aecba567ebffdb893f5d 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -357,7 +357,7 @@ static struct clk_rcg2 dispcc_mdss_pclk0_clk_src = {
 		.name = "dispcc_mdss_pclk0_clk_src",
 		.parent_data = dispcc_parent_data_4,
 		.num_parents = ARRAY_SIZE(dispcc_parent_data_4),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_pixel_ops,
 	},
 };

-- 
2.51.0


