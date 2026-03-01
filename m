Return-Path: <linux-arm-msm+bounces-94746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCXpEGBipGnIfAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 16:59:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 367721D0843
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 16:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E0D930252BA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 15:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C43530BF77;
	Sun,  1 Mar 2026 15:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ipN4sanw";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yYlCIOVy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2353A2877C3;
	Sun,  1 Mar 2026 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772380605; cv=none; b=dRetEezUdlAtuqZLvg1VFeV2v9XZ6hu6ZLumVCgyQAf6gL0I/cA3TFP3C8e/zocrujXhyK7RjuSX7CKFKgtwvlpYn+6m9f9klTER7jBbeEu+U1pqoFnNnALM+qHE2j3CyRCXFzrcTJatMcU9xzm52eC8TqQBefRGaksKRFMtVjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772380605; c=relaxed/simple;
	bh=s8thqW1tMuw6RS8tMHJFKMOzNak88Anm0d2RW7dtC98=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lT9As9fVxbIYp2FGoHmFiQq5kSBoQZo2pH9YkdTdnXRQDt3d32EUImTYNW7BwifasRu61rrJibEdA7AQufhG5387duWzjW8m1D26BxvWZZKR8+l8z9ggVisKhldFYmGzV1e2NJnXHWz9NUGPQJaixQJtF5XZg5yxGm0HY49KXFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ipN4sanw; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yYlCIOVy; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1772380518; bh=MDf18aLfDEzotGi13+xMk+M
	9xTF6bTrn7qXQktKULnA=; b=ipN4sanwUBES3Nvi8zGO4fRn/tl7d2mLvgzrzvySvD5RnvxnMw
	c9schmEs7EyfrckP27owPU7B4g8ort+eSEHcyNGmNanDXzj+WjRBt1nvS/730Bbkz5tIpbqfs9J
	u1Cp1ODvKavFmX0r2X097eK4GUiPl0EkUxmfukszcY0X7nKJl2g1gflAB/+f+Hm5vkp1N+DBDJx
	e4J1f/wYPbbIFQBA+XbLIhluy3SQTzvT8YKKOB8aGZwvksv0pDjoU4KBS+TJ19qmaKGylKplost
	/Af2wpFPr2Gu7rjFOkp9CYl57q3Xp1hgnqdVXPvQ4kYN1aLPb3L1Fg3AWHLV1CyrqWg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1772380518; bh=MDf18aLfDEzotGi13+xMk+M
	9xTF6bTrn7qXQktKULnA=; b=yYlCIOVyCF+Jcjc7vNPwCR1pXDsJK2eAa+i8OkW5Cfuq20VKMl
	4jCxeyeDRuC17vDXJpVCmX975bggh/doIjBg==;
From: Aelin Reidel <aelin@mainlining.org>
Subject: [PATCH 0/2] Add SM7450 and SM7450P to socinfo
Date: Sun, 01 Mar 2026 16:55:09 +0100
Message-Id: <20260301-fillmore-socids-v1-0-5a033cd8d0e3@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNtpA5eRRxqm2pArTQggnh3i
 +Mb/n9AuQgrDM0DhS9RyUeFbRsIqz8WRonVQIZ60xmLSbZtz4VRc5Co6F1IMznPRA5qdRZOcv/
 HcXrfD9StLcJhAAAA
X-Change-ID: 20260301-fillmore-socids-a5cfb25ae225
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94746-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aelin@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mainlining.org:mid,mainlining.org:dkim,mainlining.org:email]
X-Rspamd-Queue-Id: 367721D0843
X-Rspamd-Action: no action

Add the SoC IDs of SM7450 and SM7450P, two SoCs in the fillmore family,
to socinfo.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
Aelin Reidel (2):
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM7450 and SM7450P
      soc: qcom: socinfo: Add SoC IDs for SM7450 and SM7450P

 drivers/soc/qcom/socinfo.c         | 2 ++
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-fillmore-socids-a5cfb25ae225

Best regards,
-- 
Aelin Reidel <aelin@mainlining.org>


