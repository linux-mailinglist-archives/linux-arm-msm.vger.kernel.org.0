Return-Path: <linux-arm-msm+bounces-34601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E404B9A0D50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 767A8B23A37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 14:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B421620E00F;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xz44T+eh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DD320CCEA;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729090362; cv=none; b=nhfVpi9h235qXFxrzHJJrmlEVoMda0bEYb6F+UJIbrqPjXsgVz2kv65+8gmls+G1BazCGiT0FeT8gUBrd3em9qNeMKcbQPUkFt3E5hZYJC+VFvXkTTDZlp4T8VdSRAeva6f8vAv5+UM6w3UNaH7EnqP4ID/OYVV0a3eKsj4ABKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729090362; c=relaxed/simple;
	bh=FJTN7H3SkrxTCsFT5M/F5uxXhCj+8GWjUfvn0IwBnf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXXLwgLDeFbq1g4g4ccLGW/XXWEEHMTvBDi1ct4icbVJTsU/DIOMibp/0H3m1YvZaE/zGIVJ50lTrF8i1bq/nVllwLilUv/+mGf7fbJS9LZid3Vw/bmxWxX5L6VkdduDszw6d+bouFjmrF8pbKk03E7PQeE361K5Wv8GGUkuxlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xz44T+eh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134A9C4AF09;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729090362;
	bh=FJTN7H3SkrxTCsFT5M/F5uxXhCj+8GWjUfvn0IwBnf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xz44T+eh3KW9I8pmYhy4aXyKslkaI2HV3SGnTj4///HZdLWaeI9CTgpbbcGOif1cw
	 pNHg2lNU6DWbWuSJ375Uokzh8/v1tc6r7tRBNb4tk+ZdoUIUinbHMp4RFjwDZxvmfO
	 B3i65AhYXh1CRkVDBypWHMNWBPTXGeblqqXYGGn0sJJ2K27bVYER3+s51vxkAeP5qp
	 HSoQGdUXi9jEFBAXX4eb53YPMGOSR9p3F/4frOBej7kCEMDPzs2uSidVjZxFCWCffe
	 zzlB28ydfhPdqo/5DMMn8nWmGd6pZ+oJ7XTdWUEHRp09/7/bKuAzgMcWRX+/Qc/bzS
	 8l18wvLz1PkVQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t15OL-000000006UN-3tcY;
	Wed, 16 Oct 2024 16:52:49 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/6] arm64: dts: qcom: x1e80100-yoga-slim7x: fix nvme regulator boot glitch
Date: Wed, 16 Oct 2024 16:51:10 +0200
Message-ID: <20241016145112.24785-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016145112.24785-1-johan+linaro@kernel.org>
References: <20241016145112.24785-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVMe regulator has been left enabled by the boot firmware. Mark it
as such to avoid disabling the regulator temporarily during boot.

Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Cc: stable@vger.kernel.org	# 6.11
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 3c13331a9ef4..0cdaff9c8cf0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -205,6 +205,8 @@ vreg_nvme: regulator-nvme {
 
 		pinctrl-0 = <&nvme_reg_en>;
 		pinctrl-names = "default";
+
+		regulator-boot-on;
 	};
 };
 
-- 
2.45.2


