Return-Path: <linux-arm-msm+bounces-83199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E992C83EED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 11E8734D01D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B29C2FE584;
	Tue, 25 Nov 2025 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Ow3tnbKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D7E2FE566
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058419; cv=none; b=gd7yv8ALy5cww0ZVTS8+f+PgAXm5Duf7iP+veM5R85bA520bKMab0oUo15v0knbLw0gm4XlrFHvAfpCD3J7tWXsa73jG48bbsOl5glJyFa5hRSyfbFWAixJ5ddYYhR8QbAd8sc+3UXM7WTpvRCTYdTgKkVhv3dSF4clMVoWoKMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058419; c=relaxed/simple;
	bh=Gl/gJYV0g6upBwK0J1M12zQsBAkoU5+ti7t2Bm2mBNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jezg+NLUzHtO7JSOFkVd8cggd7OYWkrndfnzs/hIv8F6GklJ8DmJGXEFBsVSo0aooLcjWiWCnUrtp00wxdqDFMVZauhwzncS/aAxnpkigt2NcpSHdJyrgHNaL/PW9JHgeSjV/SjwIKM1SbS+Eze2DL2iYC19XahC6H2TgAmyLlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Ow3tnbKS; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vHG/jlaIWQTs96mFuBlrlOMl3pje93XFwt5zvKCGvOI=;
	b=Ow3tnbKSAd0jaFmOclbqk5tQ+VWa9mmOlJO9VolmNJWVt2Q5KDsjsIA1dw3V+DJ0xN37nJ
	KnCLTo+VtCQ7+TajEXzpY8uYMeFHSsiB7S4nNYt/jfIhIxeLXgMGfPcm6hxMsOtdD5pbMh
	ExKlrJsm4INZVQo6AfcUJs9kXbVU9QzcEFdvN8WWB3z2NTg+4bX3uo/T3HbyoRSh7xTjqL
	7FzlIa3Pg0ZGQE2EREt62V84Ct65W/EJBi7PTn/hK9lDREnRvqNxpyFWp68RflyzlLG6GY
	2EylDMik/G5i8/sUwboH+IaePp1zx5PleCrgdKOcK/UYU7Pc7OKjINvrd50hqw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:41 -0800
Subject: [PATCH v4 11/12] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-11-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=835;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Gl/gJYV0g6upBwK0J1M12zQsBAkoU5+ti7t2Bm2mBNg=;
 b=pm5lOkJANWNHPh0SPV3UV1heXzzdCcPi263xNE0sqZ1kjbWykB+kwB55p353LxVhR7sfyx3co
 sDtJmDIYQVJDv9MgKb9FtesokPpxzlwX0w5HFJCgDBFgWy1t34XthO7
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

This lets modem get a bit closer to working

ipa 1e40000.ipa: channel 4 limited to 256 TREs
ipa 1e40000.ipa: IPA driver initialized
ipa 1e40000.ipa: received modem starting event
ipa 1e40000.ipa: received modem running event

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index fa664b5120d2..0ba4a2b42028 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -469,7 +469,7 @@ &gpu {
 };
 
 &ipa {
-	qcom,gsi-loader = "modem";
+	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
 
 	status = "okay";

-- 
2.52.0


