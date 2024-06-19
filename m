Return-Path: <linux-arm-msm+bounces-23247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A91C90F489
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A2AC282C0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A62C156237;
	Wed, 19 Jun 2024 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="4xeZFVYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11B15530B;
	Wed, 19 Jun 2024 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718816068; cv=none; b=BU9Gs2lZPsmae0v0XWkL4ppVPTKLtdqk6txxVuwsKevE7MuayMdZlz7q+MaxXVzJLsQzv7RKqNOghGPXJqF5USX+xtReed0QvrzBYfa8mSM2H0uocOA4Ldx9P/kqpBltMPka3lf18nxOzA//odKFqzNwAgxPaxcgzxW/zqm8LVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718816068; c=relaxed/simple;
	bh=Ekl8nsWE1QqQW0cy53Cm/B/0aYqmX5RnlMjgQQIQf/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RTe16eGo3elbCK7yMX6kbpKUXX3gvazJ/unU9hiwDu2q8lMGRLAUOjN3FAtIJGI+ODEi83MkUdsVDqWtCrBO6EcC3l8pgWODoUSFT0dMmSH2ndlC16nO9N68K/aYFyVWFoPOfaloMbBd+mXC748HV4vWLZhRHrsiw9kZAF8rO30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=4xeZFVYJ; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718815509; bh=Ekl8nsWE1QqQW0cy53Cm/B/0aYqmX5RnlMjgQQIQf/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=4xeZFVYJPBgvWIjUT9p4+VeY9NdRJWm9CJziKmk+agSG9jjuHK3JeyP45FVJKFHYz
	 jVprD3fScmIjUCrblDyMgrm28OdYCLS7HUOc0yytvn5ymGlA/ExrckXwutieyLrSyQ
	 WZCWVJzKVILLP8MlDUAeQ4mGzxOE+A8kqCU8okM8=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 18:42:28 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: msm8916: Use mboxes in smsm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-smsm-mbox-dts-v1-2-268ab7eef779@lucaweiss.eu>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
In-Reply-To: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=Ekl8nsWE1QqQW0cy53Cm/B/0aYqmX5RnlMjgQQIQf/8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmcwsRnJcv5+5wGplQBfoX/3tp3XF1hcc3dm2ZS
 K624W1mRnuJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnMLEQAKCRBy2EO4nU3X
 Vsb8EACibiO7lDVUy/mVlqbXbQ2W/aBt1pw8lviUItdiQaFPAno4e/5LCSJbJIi+W+Z/WAUJFXC
 mIrB08YDaWT4Q+Lskhmr8dheZgGc2SikoBu7L981y+1QhdXUVLBKRUZsjBOj0/o/4BYR8nAHwXg
 ftBPjWdFR00g80sGtk4FzYL+6HIqe4UxPpijTm59PF3Cf0Dt013ZZpX/2rD7MRDLVpwguLNKXbx
 TU3mkljlGkapz+siOS+phOndNHBTaL0Qjszd525zx7fIKdxaFgVfmL/s1+hzZvtgK0ifrwP6Y0Q
 I2Aoetj7aZGRRlag2adLhWKfe7hnsVEn7yAnFrcpc6goRPTsmJn12NBcpzdlt+qGBsWw6EWiHCr
 exZT7/iLHP6QBQ0/EB6Z/pysKQch1xrm6bbAjYLytGVDjoy+oFKoT43U/oKBFmL/EYLL857HFbC
 w4eJRfF4HvPOSbHfPr91bVZtJNs+hTM7IZjtutXyw7SEdaN6gCT4/Gxguu/2pQrMNYkjVy+TNho
 Sr/gSBnjHgijUibdL1Q+Yfkjj0OlrcU9E0RPOZ42IqGdYUfCRbpTd9vMH9H9H3ibxC6uAxTcTHq
 hZBbtuv3bszTtcEMG2rYSPYB7dljO2XIotYpOhyXUuFPmQT2prrZPYO08m8NHn7nB0uvkJfbkR/
 JRpZQ5LTHUTvVMw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

With the smsm bindings and driver finally supporting mboxes, switch to
that and stop using apcs as syscon.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index bdedbcdc36d3..7383bcc603ab 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -410,8 +410,7 @@ smsm {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		qcom,ipc-1 = <&apcs 8 13>;
-		qcom,ipc-3 = <&apcs 8 19>;
+		mboxes = <0>, <&apcs 13>, <0>, <&apcs 19>;
 
 		apps_smsm: apps@0 {
 			reg = <0>;

-- 
2.45.2


