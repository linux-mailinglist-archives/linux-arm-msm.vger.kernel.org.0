Return-Path: <linux-arm-msm+bounces-24524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B9D91AFAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 21:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7623D1C22516
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 19:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B615103C;
	Thu, 27 Jun 2024 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="LSC7kDSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch [185.70.40.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F201C687;
	Thu, 27 Jun 2024 19:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719516646; cv=none; b=Ny8a+SioiP+nsveih0K7HrFPwDEL3JhaMiHY6VjMLmOV+FkD1ufCgcpjJrWuLc980HygagSQVaZizdwbogZZciF9noHqdK/o8NCJNXZiL5Rwnp1qKXd7k/ZZVYY4an411QquxR1ZDg+M8uijLuPMB+bid/yXRIqlk0hGC7dDkew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719516646; c=relaxed/simple;
	bh=EEoDOWvrfhdAgAcue1y3TMvWRlAS758VxMB3jaAZaZ8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UY5YniEktAbKjBfssb7t2EBoPA7/fzorWGP43vt4iL6hnX/lG82+ppKWM0584Uo9/He5+LJDTE+hVPzh8tOQMNO5hEFOdxPKP8cBW9yOGgvDvASqNOuATdKzgCP7pnHcC3M8lP55Onwd0VU1sz5TPLM26tBE5MUxvxhyRr/OxKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=LSC7kDSZ; arc=none smtp.client-ip=185.70.40.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1719516643; x=1719775843;
	bh=3IZSrVHE5nxJLlfS0hoy4u3xcXjdItN9VWt+RopTAiI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LSC7kDSZt+qms6wmBWNAF7dLf+wzU4XagaobzANDY+c2AwytGK0wKuT7lfC46TO5E
	 fctic6wU1wGqqN8YhkqwUcoch/I4AO6ZccZMvMiIc0KU6T+Gos8IP4GcNjhJiZ6e0J
	 MDJsBwxgd83p4PS71mYq9siU3d9PoZtIRa6biWfYMS4VVGCWxRcAzk13qpYWmYme3N
	 5GRlBsw2Wd0EAQ9CV4ujVVgwp+/Ta7w1XC1h3UvrtPciwKTI+Yd2VWpiMJXlqw3+ff
	 3EJhWUL2u6MttZLj4ykLNhbW6HhyY11y4fW6x5YTOtQ39zZOrpCakRiMXSU2dU6hT3
	 qnpfff7VXOJfA==
Date: Thu, 27 Jun 2024 19:30:40 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document samsung,ms013g
Message-ID: <20240627193013.1800-2-raymondhackley@protonmail.com>
In-Reply-To: <20240627193013.1800-1-raymondhackley@protonmail.com>
References: <20240627193013.1800-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 060a785a1b779dae8929df6126c44af3009da94d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document samsung,ms013g for Galaxy Grand 2.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index ec1c10a12470..7990e7e27542 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -141,6 +141,7 @@ properties:
               - microsoft,makepeace
               - microsoft,moneypenny
               - motorola,falcon
+              - samsung,ms013g
               - samsung,s3ve3g
           - const: qcom,msm8226
=20
--=20
2.39.2



