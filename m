Return-Path: <linux-arm-msm+bounces-76422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C21BC55FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 16:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 039824F4319
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 14:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776CD296BB3;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTA2XkcT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C7228D850;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759932331; cv=none; b=hTw40hWIERqrWOLF7fAx/zHHyEwxN50S/pUCVoYiFdsnTzJhjUzQ8f92d47mbugm6VYzY7QlICeyDQNDn1GCCLETgEOtrJNmv5gbP6xvWjfmzekvd1LOdGmB6iyUbfmS072IaLXK9OdkSGZn+1HXsby4jMQsA7Wd3KMfMXHmkpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759932331; c=relaxed/simple;
	bh=9bVearmQFwT4337hd9NqP8CJl3TV9B6RJZRF3V2Pm+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yib9DpSzmy5wfqtgQui0ZeGInAK7M08uN0iU0VVqNY0b8HxjVzDManWmZi6X7OjGRzdVe4Iy17Scy8jmS+g8LzLFhNMIKwmmm//MRRd6AVcLE5E3skAMnj3BTnmRnSVhqz3jWgX5OwjTtaJt3WGyq1R/a50Vjdko2Pc+K6vn4F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTA2XkcT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C47F2C116C6;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759932330;
	bh=9bVearmQFwT4337hd9NqP8CJl3TV9B6RJZRF3V2Pm+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bTA2XkcT1nZfJlwrn2e68zMSGKdY1ISFJ8xLyqbI2DJoHCtKo2B9CVYdTpIPylrtE
	 KL/WGx7mZSSy16T1Ii0ytgef/NnGYB8HDhDqUx5Pu42dtjs3H/n6opZgvStlsDhrjo
	 6RQN2zZodCIatBFONXPIrbA23Oy3yw7IJznRxSFW1Tbz+U3m/XPt5I24jVU+z+wBza
	 DRX9JdiC5fVHyyiBZmDX+S7SJyFGo8AlvPreEBgkVwcnk7SGWR0RbO1Qx18NnpueAs
	 nNcpNjY9ZX6LmGoNhb8pKhXU5bR1Si2iDAkJkCQLi73uCeaIH8VhlsGEBxv6rYXihh
	 cAOjeqNc1p/nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB101CCA470;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 08 Oct 2025 16:05:30 +0200
Subject: [PATCH v2 3/7] arm64: dts: qcom: sdm845-oneplus-fajita: Use the
 freshly introduced driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-s6e3fc2x01-v2-3-21eca1d5c289@ixit.cz>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
In-Reply-To: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=785; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=q/p/oUY/pg0psfDX27C/axQezovaGYNjTnnvhN5F6iw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo5m+o8WwYZzJmpGUawi0df9TqyDrWc1ltH2aT1
 c4H6sYwSvmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOZvqAAKCRBgAj/E00kg
 cvyoEACS08aETUxyptP3uxV/seFzPvBW9ta1Gvhde2LowExWDfg5Oi7yiCc2xrzlmP22ycMyBDJ
 pvZrPP6QXzEe4ONdIedzl0tyZFDa+91qo/f0vdgymQR+fcTse55mY4L3qZI0QpWae2G7XjwRPAb
 kxIQOlpywvU+zZ4mwdf7JNh5y2+AcQUXFd0tac6uSoYB6gtdwK05m4GpQP0SNV6QgerdWP/3KGn
 z3hwmKCRXKPLosKWcd+Gdv/qwYIDEGl65mbf95Hg1FwTN2i3eOyXJN2oPdwZDFzb2UllkG7ck1T
 NwexZYDvhNLd2IncXUO9E4d2H2wAOxU0J14kpWKlNpGO6fCJVhOUv9K9p3Ho6rdKEXLwnVdjFv5
 fbpiSNiEddAi0dToxSNzFH9ewZnLDTLmDffVUHUT9w/IgwTwONI/a15FJeyHYADoR9g4LwTB5OX
 p0n8GNMBAJnvopl7cuIV/UQbi2XYjWkyun+z4bASaA+1GamhP7O/4pu3HeHOiNYXE3dhpxVMzh8
 w3GdGTluwzTAW9qkM9R0j+hHy4blUYmJAHkGy+ToTmVk8814FEzGdlx7GXbpYxHI/8ESOFZDcMe
 x0uh8K48GZgxuXH36OO+wOKqkrnz8MFy+QGMrei38bWpYq+aAy2IKRlunv981DwfNtdzlfdlzr8
 K/J2Tvp1X/K631w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Switch from older effort to support different panels within one driver
(which already dropped support for the HW) to the freshly written one.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 7e75decfda052..55b3e94dd9726 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -32,7 +32,7 @@ battery: battery {
 &display_panel {
 	status = "okay";
 
-	compatible = "samsung,s6e3fc2x01";
+	compatible = "samsung,s6e3fc2x01-ams641rw";
 };
 
 &i2c4 {

-- 
2.51.0



