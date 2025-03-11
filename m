Return-Path: <linux-arm-msm+bounces-50895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD16A5B3DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 01:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92AA77A4007
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 00:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB9317991;
	Tue, 11 Mar 2025 00:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dwWyRcHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73B02F56;
	Tue, 11 Mar 2025 00:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741653278; cv=none; b=QqtCMptSs2txwmO8dXI2cuOeQybYaLyuxXD+b8qHTzu5tTRsqNRKrnVL+khIbtKQgjarDrXyF1uib2pecjKbWEQg+yVdysvHsPXs9jk6jiJRoMMRZmJ3we7WIT7HYIi+z4mbsoQM28gSx2zt1L3c1R6XMX+OGIgqDb1KfruEVIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741653278; c=relaxed/simple;
	bh=xPFdd+J7WL4s7kuYOr7GMjRI2pf21SntxHM/E7tQInk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTCXRmiu8C7MupA2x0XGj3zK8sHnLTGbPkXUKpVW+6IKyuO+HKL1WuMJV8DB4LlgY1sbY7HrN+T526/GZqi8MN7vhbBVYHwPNQbPKK35UAEkoJmhJeS3qXfVzE3kEswlJ4Vo7AAifmEXZI5OT88rQPLZilSrWKGPpQJ+s+OITx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dwWyRcHI; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 962EB2093F;
	Tue, 11 Mar 2025 01:34:33 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WVFsJGXXHnh; Tue, 11 Mar 2025 01:34:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741653269; bh=xPFdd+J7WL4s7kuYOr7GMjRI2pf21SntxHM/E7tQInk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dwWyRcHIR1O89JU8A08oKEQsM9Cp1khLmbPghvuKteq7+k56Ck/2HWpQjSr1G3KEI
	 BbVAUBWuXR3O1nAiEYeEk7Paddg2johdsMcKXeI5RyI//B6XI3BmnlF3a2TrAC78/2
	 GGux4/c24iqXnDhQeJg5gDpXnCODGU0SHwSKfMNMqHIdiIKFlELj3vl+oJL+zzpQ9H
	 Tc7egD6aHdCaD/Q6iP3pt5cRbn/EZoExpCOYjZNcny6Z/D7uDXKopg3YeTUGwZBool
	 Geq1shDXjzMC9kUlgsbcpm/xplfknAPms0a08bUYOJil/4D7iP+qMWDMYhA2cNZQy9
	 C2JTo79w1xW9g==
From: Gabriel Gonzales <semfault@disroot.org>
To: 
Cc: Gabriel Gonzales <semfault@disroot.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add Xiaomi Redmi Note 8 support
Date: Tue, 11 Mar 2025 08:33:46 +0800
Message-ID: <20250311003353.8250-1-semfault@disroot.org>
In-Reply-To: <20250308013019.10321-1-semfault@disroot.org>
References: <20250308013019.10321-1-semfault@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset introduces support for the Redmi Note 8 (codenamed ginkgo). 

Changes in v2:
- Add missing cover letter
- Fix up commit message for schema
Changes in v3:
- Use qcom ids instead of hardcoded msm-id (and other changes suggested by Konrad)
- Switch up model properties and qcom properties position

Gabriel Gonzales (2):
  dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
  arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo.dts    | 295 ++++++++++++++++++
 3 files changed, 297 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts

-- 
2.48.1


