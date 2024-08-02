Return-Path: <linux-arm-msm+bounces-27768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E33F94598D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 10:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9AF21F23E66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 08:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4241C231A;
	Fri,  2 Aug 2024 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="GLbaG3Pz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B7B15CD4D;
	Fri,  2 Aug 2024 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722586055; cv=none; b=eT8JIF0mWz/DYLZ6UCR/HSlUSn7UjvoZtDRqNwR545S3SWzyvlA3SPtAfkW7oidjGD7oc7yOU+o1beOjrAaqKKDAK315u3CuP1VgzjRuOfC3xx6aYHsP+ZCi1QfprT0vkxUCnq0iCPqDa3cNPNUcdV7trne1VpN0IfzOWa76C44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722586055; c=relaxed/simple;
	bh=ZmQwW/wDeR90OUcShfj1AaExlHjUr7arz/oq1GU52zU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DpsFinNxhbLCr47cICFaBiLOCb1L+EjsbzcC8dU4Ba5MbbDsuQRIPHAj0kttuMjy8WIRCb5xUEDpCRzFSHosIfoc1kk6MMEOip/ja57bfIandl/hlOn//44AE7We6OYd4eR0km0cuXx85ikTHseHkXUwdi0AsDu6C0fWiVBPnpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=GLbaG3Pz; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722586051; x=1722845251;
	bh=iemyoq2lYHkRLjl5ZVLhpqkXKCDblZObCfWltrVdYyk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GLbaG3Pzs7YEM1ig3c/3IJyH77Nifrs8IWrnM2i76xNEyXtQD72MNVd2ijpvP20Ev
	 eckkc/H93v5KNXcBdU3ePBFYNOlWGF2GIf6JWZDXuK/mbu723+D6L1IkAtIRfACIn/
	 1IwVe+SMuTWK8CVgX8Lylk51QPHhIX6JDigmdF0BDhY6LVTtQ9Jokpoqzjt4jlc/Ig
	 Omo9HJHha9S0qSx6NU3LPiTnva4pPCNjFIqRJ8JFy3aMMALXq9arlIXMlN+hMwkcMe
	 bNmhkDrXKM5PbyL+brJBy8DNFl+ZqjkTJoHOQBCkFdelycArs62tlFRUQmZNVaPAgT
	 fE2VOd5t7rM3w==
Date: Fri, 02 Aug 2024 08:07:27 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 1/2] dt-bindings: qcom: Document samsung,j3ltetw
Message-ID: <20240802080701.3643-2-linmengbo06890@proton.me>
In-Reply-To: <20240802080701.3643-1-linmengbo06890@proton.me>
References: <20240802080701.3643-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: 1862562a16d6a63aaafa332366fe9d2e56232e76
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document samsung,j3ltetw bindings used in its device tree.

Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index 4ef456cefd6c..c0529486810f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -235,6 +235,7 @@ properties:
               - samsung,grandprimelte
               - samsung,gt510
               - samsung,gt58
+              - samsung,j3ltetw
               - samsung,j5
               - samsung,j5x
               - samsung,rossa
--=20
2.39.2



