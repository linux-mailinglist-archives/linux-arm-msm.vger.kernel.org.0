Return-Path: <linux-arm-msm+bounces-28280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4794E569
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 05:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D0EBB219C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 03:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2255D14D296;
	Mon, 12 Aug 2024 03:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTLo7eeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8FE14C585;
	Mon, 12 Aug 2024 03:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723432063; cv=none; b=ldvRzgRIpOUlKpLK2atdY5qyLf4/SnTr1CirNoTrBGqpO2oDTxqpwAHjOWaGtH1iR1IYmUwVmStug6yRghi9W5xufbM8+7sWcc+DPj4ozDvHp59sIrqV5QVwQ1Paa0Yjcs6ir3sIcYxtiYtOTJiuizBnUE4Yym4Aph+N8EqvFAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723432063; c=relaxed/simple;
	bh=L9wAJo10BnzE7JaXuip6gtOXdHXBOMBxLOJLtPy4Qiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CD0SBswoZsJdEakU5w+3x3viz7vMCPKBqPWbINJjjffxLVrh/0X74OqLnY1lfXFwN9tov1gDzXECBO4EGNAexw1ACIT97BAH3Z6+n6SwUGprWz+itkjKm1q7wxZZFOoaHPRuKwTD1Yp2JmZElGQPEduL3WIAxsma8eaQlnNhCzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTLo7eeM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C322C4AF11;
	Mon, 12 Aug 2024 03:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723432062;
	bh=L9wAJo10BnzE7JaXuip6gtOXdHXBOMBxLOJLtPy4Qiw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UTLo7eeMaYzSQcy/ReSVuS7lAiREbZfvbBRURglPdz3ReapOb/3EU9ng5aCm77XcC
	 fiGl5pSDgZQzVpagcFDUdian74ptg1BuwzjU+gsdLuPmcFTYCP08kxeUueU8NV0Qhl
	 adGIbZEBajF/8YMnPLkCATEbZwUqxLc9zVhLBjW7vQ5lBimmiZL2Hs46p1GtOxe2P0
	 Y02Hxrtu1KnxWkHC/d2rl35pSH34VhQzD3NTkY9pR3YPAHJk6OdDoUjC0Gjj8/zeBT
	 LUQ9ycoi/fZZ+Bbsi+GKOFfM/SAkY6UhIGDoPB1rlVc9qH7URAstvcIyiI9w9HjY9f
	 BkhPZ0vo/ty0w==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sun, 11 Aug 2024 20:12:00 -0700
Subject: [PATCH v2 3/7] of: dynamic: Don't discard children upon node
 attach
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dwc3-refactor-v2-3-91f370d61ad2@quicinc.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
In-Reply-To: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=6OAjPy1kx5oZXZRHoFFA0Ve553WW6uXL5xF/FqO3D6o=;
 b=kA0DAAgBCx85Pw2ZrcUByyZiAGa5fYCgOS8gLSedkYVSDSaroB3MiWh76VVOI0GW9mDHxKkkA
 YkCSQQAAQgAMxYhBAXeA8xfNepPCWbVJQsfOT8Nma3FBQJmuX2AFRxhbmRlcnNzb25Aa2VybmVs
 Lm9yZwAKCRALHzk/DZmtxQbGEACN47/vv5BtkgEqMlBy+6acz8EAp1L0DMMf/+aMkTrMP4KNMbk
 MLypk6371Nq007cphhZkB5wz8cc0fuBKiOly4+u9m6YreVk84aqCbBgedbKU0nczOoWrPcpnPyV
 aZTo/a7D3/nytzs4iTsqDCttttL3/RFNa5agm5JE9hFcJZSFNYQyJChsrgwgbNCsDlF4Y61b+EF
 j0vCtpMzlITlJZB15T244pq0CsP/1KqLV9NoMYDnKvLJHLIV+tOY0Q+qTTnvaQIzpdsX8bXRtVj
 1dC3yKZc41nqPp/XpKEdxWhTf8bXhSo4yY6xiGOY4UxHsKxSJMVavg/hrPbPJBNsw0tupGAS11w
 VM5XLSs/vkJn+hI9OdqRu9f0xUYbQ2BmD0GejWJDiXsNLvDjKoxVIdhvhZ71tk2lia/m4aRniT/
 BHY8XDIWWn9STSUnvaUVO6LGcdoHWYslIch0n2M4Rlvpiz4APofJ+UOSU0QwCfnflXUhBJoKzI7
 gZdWph7PkYpNyldG8y+E6slonNw4yZVA5bBtBATS9m4sKuD/1Aq89XW+yCydZSoqXJSH+A0MZYh
 rHJUeKuk0dOITGFXhYlNtL971LLeqB7KLnkIy3DDYul1ERsPfezMY5+79S18z2oRGJhGfLhivdS
 ooypCeFKdRIoUV5Nk5rx9rCZm9d5oyhC4iw==
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

When dynamically modifying DeviceTree it's useful to be able to reparent
nodes, but of_attach_node() clear the child pointer and hence discards
any child nodes.

Retain the child pointer upon attach, so that the client code doesn't
need to manually rebuild the tree.

Current users of of_attach_node() either avoids attaching nodes with
children or explicitly attaches nodes without children, so no impact is
expected to current users.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/of/dynamic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 110104a936d9..32e1dffd9f96 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -221,7 +221,6 @@ static void __of_attach_node(struct device_node *np)
 			np->phandle = 0;
 	}
 
-	np->child = NULL;
 	np->sibling = np->parent->child;
 	np->parent->child = np;
 	of_node_clear_flag(np, OF_DETACHED);

-- 
2.45.2


