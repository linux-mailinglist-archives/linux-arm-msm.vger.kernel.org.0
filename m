Return-Path: <linux-arm-msm+bounces-23246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D15D90F487
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88CD282CB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CC3155C8A;
	Wed, 19 Jun 2024 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="pakniau2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0E55C8FC;
	Wed, 19 Jun 2024 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718816068; cv=none; b=s6zksxkPr76FauuO7E33KMaB7cPRH7OiAl3OXDPR+JzWP1KOYb0XOHncO92vhGbXQvbQSdSnZdwTE16BNljFixAO0nLfsudRwo3bJUlgvOOswgAcN799CAvU7mdV0hf06iyLH7vnAfo5ZWG7eRDJGSrTceZ7dhafoQnOhPU3/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718816068; c=relaxed/simple;
	bh=/02P1251JBeKc3cVsZQGagO6CFxC/8yXaNFlnkg+NjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKSUCZ5ksBpNuJZCwLk22GmdQEjdOOg3OOEQyLta/6UOPXKZky+K5a6yvzYer/jD48HsvjZoGMFWCmAuk5dD+KTYf9rXoROVuAmxt6gxy2vcFWIwST3uDhlVSKG2PTToddT1WP2/sUxNl+yIflImzXZo/hoyo1a/VJCorwQr6Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=pakniau2; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718815509; bh=/02P1251JBeKc3cVsZQGagO6CFxC/8yXaNFlnkg+NjI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=pakniau2Gbj5dCKpsQ5na/R0scG0xi25htTwf3G5sel19hjbNO5ZrM0ogQ1Cg4zmJ
	 LmB1SFSonHMYltiV6t/Q4dOr8iXque+07f+7OBBEDar3DSqvYj1ftLnJS/Hs0DKKmi
	 pwB8c7DOH3p72C7OoWyVKwNP+3XuEpDV7x08W34w=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 18:42:27 +0200
Subject: [PATCH 1/5] ARM: dts: qcom: msm8974: Use mboxes in smsm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-smsm-mbox-dts-v1-1-268ab7eef779@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=/02P1251JBeKc3cVsZQGagO6CFxC/8yXaNFlnkg+NjI=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmcwsQxj1xeibLazV71AcOA21pOPVhT+ro8iFj8
 jdRZ+Sh3sOJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnMLEAAKCRBy2EO4nU3X
 VjCFEACxT4rYdko/asJUn3hXvf5woIG5MncmScRVWkAhAFx6pvs2g1yUUAtabJq1B2wRzC+TCEv
 4a0miNbPgSVwcItJ1zXUa3ul3HCbtdX8xDot47UmGnHLyV9ntKmZI8INzOqX3NcR1eB+THA0m8S
 5Tmq4MtrfzxLqB2LwWPzRjAthEBB3CVsTZL01JAQMAwxXznfdzvoDNkEEzsgFYOEJEtzgs2db5K
 /pZrGflsxx4oaP4lBMvey83ASCAzqXs+AnVuy0sEUhKUyFUbMSDpTuSLxZ2tlQN+9fxqgSCGpBn
 ZJ8E7IpZxVMGlVGA5taVq3aYuhKOubtv6mqlIv8Csqtuy9QBm8XMCC0EbYtMDCfc7adAqyyJEBn
 LIzZK4QG2Q7lrYolotcoeGYXgzcr4XSzm3hjxiAy1McprGbTq8CuhYo6dwMJaBnknYnv4piu4nq
 7W2ZK8S3xv2kknPQA0lxxrpFoQDpeVyLci9xv3w4RwFL0HS4AbwH8aBBDsovm/YD7GXn8rB06eE
 bKOqqHomAdKrQ06m+Rzs2MoZKTd3YUuOpL4ppo7gaJAjM4IYBHoZ31yU160TPqhoc4lgHgp6iRy
 mNXggscod7ovJC5YERZG8kFg1ttzacwMWL0OuijfEDUYocRZZDDG+2regTP1fr4BXCjjjByyQMd
 MpXEULtjCBZdH8g==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

With the smsm bindings and driver finally supporting mboxes, switch to
that and stop using apcs as syscon.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 1bea3cef4ba7..18b6a7c77996 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -294,9 +294,7 @@ smsm {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		qcom,ipc-1 = <&apcs 8 13>;
-		qcom,ipc-2 = <&apcs 8 9>;
-		qcom,ipc-3 = <&apcs 8 19>;
+		mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
 
 		apps_smsm: apps@0 {
 			reg = <0>;

-- 
2.45.2


