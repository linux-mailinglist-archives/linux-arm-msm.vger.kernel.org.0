Return-Path: <linux-arm-msm+bounces-33471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FDF993D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 04:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA8002859E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 02:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044DD2940F;
	Tue,  8 Oct 2024 02:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7SncYKi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF81C3B1AC;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728356390; cv=none; b=RIXtSH4Fo4d8526N3E5ZRkSfDa4yOwVy65B/zISPgfmCMw21/xLx0Zta2mhAgNILzFQj/eQJ9gXmPd8ZVL8pWbwmFz1IRsF95fZztJRGyIPTLzS5Fne++dFb2+Fq7i6TvWS5CrdVzkGZsgv3s2Cxt/9HmAvBWwpZ7j15PhPOUx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728356390; c=relaxed/simple;
	bh=rGIhUZq1OIxQBgv47TJ2KRLmsrhF54gP2FImUbG5WxM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OPBh8TLJ+c0PirOUhJuUrlcrnHED97UN277SEFetFYqxufnd291lo+43Z9pcbhnEnFp5j6Om+8Lu7kM51tUgUsc72Vn8edzeEzRuokQ5ZrAaLpYzxRODRgG+/ocmQaePFChDvSzYfaQ9sIgEuiT1CBv3uhmms6QdAq2H+FhGrqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7SncYKi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51E60C4CEC6;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728356390;
	bh=rGIhUZq1OIxQBgv47TJ2KRLmsrhF54gP2FImUbG5WxM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Y7SncYKijbK/6Xgse2ukZe6FgX0iG37A0cd0QPQtvhn1Tpy6nxoDnb+oga2ixSAyn
	 nkT4vfyyhFAHhREIfh+5hYBZJwBLLi/2oZRbt+Coa77QWfNQ7wsewWRw0krzz2YfBV
	 TYAGKj3Zuydcw4sW6kXmyQhy1nVa0s6Klnlemg6P5hX5bfg3ApZG+oQMziIZy37GSd
	 PUYp2kEPiiz8lNGrf1pxxoOAKR9ZLUEozMC26S1Qf3Y7XnlW/3T7J7FC4ngXAZ4LBi
	 DgnzPc7jmlAX2/mjq3H4ULNT3yuzrWezGiP9C8HQmzESceNtex6pyGZiuQB5W7IhR1
	 vypiH9OCBv7vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39648CED25D;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Subject: [PATCH 0/3] Add Xiaomi Poco F1 touchscreen support
Date: Mon, 07 Oct 2024 21:59:25 -0500
Message-Id: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2gBGcC/x3MQQqDQAwAwK9IzgZ2Q1vBr0gPEmPNZbMkWgTx7
 116nMtcEOIqAWN3gctXQ6005L4D3ubyEdSlGSjRI6c0YDW2NeNuB2/BLlIwjlrNd+ThSXN+ES9
 M0ILqsur5z6f3ff8AhCZNdGwAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, Joel Selvaraj <jo@jsfamily.in>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728356389; l=1209;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=rGIhUZq1OIxQBgv47TJ2KRLmsrhF54gP2FImUbG5WxM=;
 b=Fl+P5tK2HKXeuCQYn6cyNaeJn/xLqsmBsmpzVI44xGA9DUcKVhl6Qo8siQ2aiHR3O8R2TiJMH
 TjrxdBd9YLoDMC6mxGzBu8w/loaUKs66mLk6wN6nAXr/8LUSjwEiKni
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20241007 with
 auth_id=238
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

In the first patch, I have enabled the  qupv3_id_1 and gpi_dma1 as they 
are required for configuring touchscreen. Also added the pinctrl configurations.
These are common for both the Poco F1 Tianma and EBBG panel variant.

In the subsequent patches, I have enabled support for the Novatek NT36672a
touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
Tianma and EBBG panel variant respectively.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
Joel Selvaraj (3):
      arm64: dts: qcom: sdm845-xiaomi-beryllium-common: add touchscreen related nodes
      arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: introduce touchscreen support
      arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support

 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 39 ++++++++++++++++++++++
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 23 +++++++++++++
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    | 23 +++++++++++++
 3 files changed, 85 insertions(+)
---
base-commit: d435d1e92be5fd26cd383fbddb596942ddc52b9f
change-id: 20241007-pocof1-touchscreen-support-c752a162cdc2

Best regards,
-- 
Joel Selvaraj <foss@joelselvaraj.com>



