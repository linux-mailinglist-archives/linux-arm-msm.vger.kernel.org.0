Return-Path: <linux-arm-msm+bounces-34300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5054999C650
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 164F9285ED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 09:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53960158A18;
	Mon, 14 Oct 2024 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxkO6gC1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCDB156C72
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899263; cv=none; b=k75H/PlOHHkLJDtA2oGXMieXnu637FjN7aWDc4p7MkalZ+yt8+MOSnJvAVXbq3a94x5KIjAjaqs6waRR3i4X2nQZ6cXrDgqNqPd3kvrCc+KpWvc2jRwKbHS/+Md66FAV73LQNF1NQ9o4sl4S1Ids3G39r+fUw2Fb+KVQVosRK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899263; c=relaxed/simple;
	bh=3gU83fsUgBc7GX2iA/IthHKsBHTkqriBsJqpptBPd7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nw+hrN4d2FwP7MWbpf6HZlFm8QxzDHsp8FsijU5OgYW6Tv0PXQBnBaYU3zYpR7VslstYefS8GArR1IHnbyh5VQVfgCsHiTl/I5cq8tw1ilK14/Bn6TvnajTOmW5xGSAstEOGX4sHsu0LpCyEqVTqZ4S1zNbk7E/plvaDCsrSbHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxkO6gC1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BAF9C4CED2;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728899262;
	bh=3gU83fsUgBc7GX2iA/IthHKsBHTkqriBsJqpptBPd7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cxkO6gC1Soz6fGj4dvnYhE4bq1cZwFrU+RgQadUltEsZ3SWr7Npxx/rOwAC/yoJYp
	 AOWFSSKsoHup7waQ5c0dnlEUntw/4aagzpdIatYnIxc78VGM3IvBClwe/34rOrXR4b
	 XzjCha5zDRu/uJW8YLXkJ5Cg13lVl1sOom4gDrSPucA4wdymAObzr3BuXNvZhVMc1O
	 okgMTVTgaNQX/qYrRGOx1prxzeyI7a1QU+NGKzo6GOqg7xEjOLLgs1bJGUYLIAZELF
	 9gXmFyKmG7PWly7MWRpGvuBN6BvI+rXVVCs+uqcxhg6wU13sTtQjf3vlYmDp7RvPlH
	 OfJptO/inpDxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9460BCFC535;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
From: fangez via B4 Relay <devnull+quic_fangez.quicinc.com@kernel.org>
Date: Mon, 14 Oct 2024 17:47:30 +0800
Subject: [PATCH 4/6] dt-bindings: display/msm: Add QCS615 DSI phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-add_display_support_for_qcs615-v1-4-4efa191dbdd4@quicinc.com>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
To: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
 quic_xiangxuy@quicinc.com
Cc: linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728899259; l=797;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=TVRusJPDQxCEUvA/8eVnVeHUlVYWDLGQdPs1R0zTVY8=;
 b=PXIRo7x9fBlPQX1VSIFAP6xePngM6Nxh95IBQO2ciMBBXyyjxXc/p336uqXSRVaNYqc+2hEfd
 w8SGc9boqLSDC3WOJ3a/q2xDLUsfBuvc1H24qBY5mi6MbA/BmcMxE3u
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Endpoint-Received: by B4 Relay for quic_fangez@quicinc.com/20241014 with
 auth_id=245
X-Original-From: fangez <quic_fangez@quicinc.com>
Reply-To: quic_fangez@quicinc.com

From: lliu6 <quic_lliu6@quicinc.com>

QCS615 platform uses the 14nm DSI PHY driver.

Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 52bbe132e6dae57246200757767edcd1c8ec2d77..029606d9e87e3b184bd10bd4a5076d6923d60e9e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,dsi-phy-14nm-660
       - qcom,dsi-phy-14nm-8953
       - qcom,sm6125-dsi-phy-14nm
+      - qcom,qcs615-dsi-phy-14nm
 
   reg:
     items:

-- 
2.25.1



