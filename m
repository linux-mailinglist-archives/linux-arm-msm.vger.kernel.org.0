Return-Path: <linux-arm-msm+bounces-77619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF12BE4896
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 18:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9E20540F2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 16:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3449D34DCD0;
	Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBfsoMsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BC32E54B3;
	Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631420; cv=none; b=K+sqMPt0dkJPivjKCAAHO4+14IEziMOQTl+jcShrtKPpZDfeVVRjc4MYtUheLM27NFcZLmEp324qgTTupv+kaBzASpeCUNJEuFn35+XG1thonoaoVAMDDgAcA2+vUt9QuoJRCV5HlDBCwlPBGt0ZF+cZHVJU/zwRpnOqruug9CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631420; c=relaxed/simple;
	bh=bnBK6gQXArLuqQ7PsSO5Q8xoCk11qgz4xqMAxigrWp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U04aA272u4xLG+uyb9S1oX4cNnTCgyGuq1IU/pTVGJshmG1mqFDYgAYL45O2vB2StJ35rQTl+WmHQMktpsgPKEjPFa6K+Hyt78t7HmtVFrnT3PgDh4qBbfWc3PuZhj4JLLzZrLbdGxdT8ROwJXQzJaiOgCOSbrOp3gicav+Un7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBfsoMsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4F26C16AAE;
	Thu, 16 Oct 2025 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760631419;
	bh=bnBK6gQXArLuqQ7PsSO5Q8xoCk11qgz4xqMAxigrWp4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WBfsoMsjYv8n54e9df80eI9HFjHyudKk7oJGQxwitlkpU+eo8SYnX1Sx/vt7hZtTE
	 g2Aqw/oXeM2eHooc7rxHW+icwCv1E+toJQQ+8JfoaUD0gGhvNdXJFkyhuWFAYJg8lE
	 O/HP1l9HEw6R1dHPtqLRFjmA4clI7F/t1mszwG2KCz+wJGHyZ8SfV2Doi7CPpmSbvy
	 o1dFk3GvmgEKkCDb5wFPJUibKpk3UsGCFSp9th2nVROSPxa3oRZjOvStbWjNQHWbsw
	 tY3U6BwBXlQKotwnqEz6xdf67caE9ayn1ikBrWYMZ5ddn2yzxAU/EFfPgol8BcPr9w
	 oJWL47EusXdpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9194CCD1A1;
	Thu, 16 Oct 2025 16:16:59 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 16 Oct 2025 18:16:58 +0200
Subject: [PATCH v3 3/8] arm64: dts: qcom: sdm845-oneplus-fajita: Compatible
 describing both DDIC and panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-s6e3fc2x01-v3-3-ce0f3566b903@ixit.cz>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
In-Reply-To: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Mdaar2hgWJbOqSL6WtOcpPiawiVPmyRpa3cF3G5hBoI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo8Rp57dX7ERbtZtzUrmaWGhO+aGlrVwvoenRp9
 A1HmNyxuGiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPEaeQAKCRBgAj/E00kg
 cjYwD/43O/OAxwTC9/HG211kyEcuYIlgg7oCSb3+0B/WhuGKVrsmUHI6cJ+RN600JacTLU5NbeO
 t+w3U+GuuYRc9Lp22XmFaOBDtoUaawhILNdVZ6LBD0bYoVFGP6MB84FvQBesQcutUpFE4NuBXPG
 d6dw/Ke0SvQYQKuKmwn5+NoZgrdyQBL3oyIhM1ZPSCJrg/bzofPcd6zT50p7+2SDIgC0BcRQDT3
 RVz/+smDnF520VbKvFxxgdd6kzzCYtEox52FGm41l+b9q9erplPpLHxJJvZys2z5aN/bRafxkNQ
 CUcHiZ20SS1Y6AFi8Dl+FpS+Tm6slPbtrr93I5gy98z7Hyfcra6HHTV3GZIXUsq8AL74NcJVbdB
 bXqbIU/B3mZ9TW5X9mkje9i8D20bwWK1XuHdqLyUqA65pOOxZgop74qAd3g8RsMEeA01KEqTv91
 UIQ3ul1Tctg4FkiiWzqUSAiqWVywdy2Sb5JCnAfhEOYjWmbVBpDHL4/wiqapiK7xX3R7U96lOx7
 HWHC9oQ8ic4o+6x8no/uIfE2UulfJCUbxK6cPOeYSiLqNr9sINupQ8o22sn97Fdiykm3niS2ZOt
 Bchyh99+Jv3itFzzcV0kMbgLpyTTvmsSP3/4CjipaDGezxBEE1jehByVFlSsYn5ktvRgHX2PF3d
 PE42kB15glEDjig==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Compatible should precisely describe the hardware used.
Original compatible describing only the DDIC used, but omit describing
the panel used (Samsung AMS641RW), which we have no way to detect.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 7e75decfda052..d6cd873aef0de 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -32,7 +32,7 @@ battery: battery {
 &display_panel {
 	status = "okay";
 
-	compatible = "samsung,s6e3fc2x01";
+	compatible = "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01";
 };
 
 &i2c4 {

-- 
2.51.0



