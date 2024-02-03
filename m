Return-Path: <linux-arm-msm+bounces-9719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F4284885B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 20:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443F81F2329C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 19:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348D55FDD7;
	Sat,  3 Feb 2024 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="TAIdHCEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A695F86F
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Feb 2024 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706987550; cv=none; b=ZtAbA7kjuqM0kgYmLKoYn+oiznp1of/G3ItO0dQAnJ+YVYbjXtEdPBm6vG6sJRk1GCK8/QN96C8LI3BakaXrlTAZnB84/SPX8er/cXstIjG9iDIExFFs7G53AIz3pFwMbcug7MQ1ZsHFDPzDHFOhfOgLyzaY2R4JQbf75OAB77c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706987550; c=relaxed/simple;
	bh=bd7lZoKMBfp0dNJw3NMwekWLKolEqwplDPJst9vEqNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amet7tIjHlDifm2a66+uaLvEtKCVvA9xXd4kaaZ/Abc5hRqVMipje/Z5EPVwx6OordVtGwCCyBEpoBNOvmaS8wfj/PaXNfAdfHB5mETgTSzSmL5uLBVfbyX128zF2QAyhe+Bw4HELd6Guk6VnnBOmikRartG8YSCE0k5/Gtn7qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=TAIdHCEh; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1706987545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7cWIwnS8VWIVYNfovS60jJxitrKNEY+l7a3wpu9pzs=;
	b=TAIdHCEhyaYlc7T8IU8N3I+0e+nbVbDNFp+Q95Z0sUBUz3qbQVu/hjscMg2CE4iBV0qMtQ
	bFMMcIqhiEwZNOJAXLVFWdp/tirHQaDloxTGO1idBDhN0AQ4qIEs1ugl/yl9jn6bkLEncz
	i/DoAGmfavATZ65Geim5mSn3ZTBtDTwM4xIKHcf5DJ9idZlNSM5XrKWbC1PAA/P7sMVoqz
	awqdjK1Wv9iJYSvXXtO7YNjFZXRpw5OJ4hbzJv+hIMMNx+4VigvRzpe7/JtMcR7SvjjZoa
	XMCLOpXrRnA+N+xY0zjwvJnaGuEa+MQ9opMlD5yzQUNdLOTV7UrBFT5XbWPaVQ==
From: Anton Bambura <jenneron@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] arm64: dts: qcom: sc8180x-lenovo-flex-5g: fix GPU firmware path
Date: Sat,  3 Feb 2024 21:11:55 +0200
Message-ID: <20240203191200.99185-2-jenneron@postmarketos.org>
In-Reply-To: <20240203191200.99185-1-jenneron@postmarketos.org>
References: <20240203191200.99185-1-jenneron@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix GPU firmware path so it uses model-specific directory.

Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 0c22f3efec20..49b740c54674 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -350,7 +350,7 @@ &gpu {
 
 	zap-shader {
 		memory-region = <&gpu_mem>;
-		firmware-name = "qcom/sc8180x/qcdxkmsuc8180.mbn";
+		firmware-name = "qcom/sc8180x/LENOVO/82AK/qcdxkmsuc8180.mbn";
 	};
 };
 
-- 
2.42.0


