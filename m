Return-Path: <linux-arm-msm+bounces-21996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E28FF533
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 21:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C8721F24656
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7EB6E614;
	Thu,  6 Jun 2024 19:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="fzdn151y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EAB40BF2;
	Thu,  6 Jun 2024 19:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717701529; cv=none; b=h/NGdAIPY9vKuX+jJqzUh8lbUwTFyXopTUyV7ZxPliOYAFryaExcAsObAXsB+3WdqlwWIFaHoxqk4nSNjKUA6H08rRv7uuCqIB/ac5NltGMTrfTBJzTeWwR/DcuzUorcdAkjyuREnKjsgV/uLjwrjJyIW6mMsdNQaaP7t/zcBPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717701529; c=relaxed/simple;
	bh=O+D0KxN0SpsIA/FwwMt4L5jfsFG66EQIF8vEPodHPxI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o1sk/7vv0h0Rbi17fxEDfOsYR5SNEdhGg7aEi9O1DamsXBwcM84ByHriLjjOXeDlFn6ICFmriNecPzWrYssGFT+WV+AJsLHf3ueEJAp6dwkYZbY14im9w2udwJAh2Ezlwps/5orjQs2efPl/mGZ0Rt7BuwuTZLvxxRfliP63jik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=fzdn151y; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1717701525; bh=O+D0KxN0SpsIA/FwwMt4L5jfsFG66EQIF8vEPodHPxI=;
	h=From:Subject:Date:To:Cc;
	b=fzdn151yJrqTYGQ8o/uOKFDqxVxys0z2O+vv3tNDXQD6HPsUxzEYEJjGw9ea6GrNN
	 BTHHRsZSEBQzqgRMDLkarbvGVtBgMxfrlexEVk0M8bBcs8BNc+TcY6K348eK0cSyKc
	 BAJgkfs926mnK7oYxYvMtuSirNVV1h1NBD3g+ebE=
From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v2 0/2] Support mailbox interface in qcom,smsm driver
Date: Thu, 06 Jun 2024 21:18:31 +0200
Message-Id: <20240606-smsm-mbox-v2-0-8abe6b5f01da@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIcLYmYC/23MQQ7CIBCF4as0sxZDYSDGlfdouqg6WBaAgUpoG
 +4udu3yf3n5dkgULSW4djtEyjbZ4FuIUwePefIvYvbZGgQXyFEgSy455u6hMK61NlLRRIjQ/u9
 IxpbDGsbWs01LiOtB5/63/lNyzzhTShlpEMUF+9sm/fI5l3WDsdb6BclDF2CiAAAA
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=O+D0KxN0SpsIA/FwwMt4L5jfsFG66EQIF8vEPodHPxI=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmYguQmVDERBuVLSHtgyVRREuVhSOo3ZYk3ngcc
 iMOJWTMTl+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZmILkAAKCRBy2EO4nU3X
 Vq3uEAC4rkB5qQR7WH0JZYKYwNZTCLKZKnP+iswpy9AusfUuIysVAAFjmlSW7RH3yILWrwZjoqm
 9sRNUfJ49nar2A1jZMZ2dZPSaeVRpA5DT47tEaSxP3qohndlTlH3xlhbJSYzQ3/9fEKTy4zjc2p
 ppECI5Hh8ymwE5deUyOFs3XB+0UdoDCqzJyTDzBeq2i9YBWMZYpJXQYQVRiiRWDtINo2vsqkBw0
 zkcKfhf8lDELwTH2BJi5gd/Rqvs/TyLR2pjcqs2bmuCCiizMkMI1WnJByezyUs8JQwUz1m2rsz8
 RrbMitx2UWDED3+nfKzGpU4n0mu3XtF6cwpX6IkGFIL87mpHeIY3T8OLLCIrmFe554Plf7HqjbS
 apQAv7Zp1oiRxZxLRPZsT3kh4/9xtJkQi6evOLQGChri/DfgfebDp+oscmDFqYEIu2UVE0nQRZq
 U6sWxkdsUfuT15//z5Oef4TC9XpYUug7t/JM7HListXZp6JQTaLkpvmD2NyHp9ArFOq7JUYAZC3
 2iW7YHK0nqOJ5TFSR/kRA/AZumuSja7WwNMjJMDhnzAE4UJBELj3sujq5TrxhGL36ZPOKRjwjQa
 QfuPF1lGhBm7qCwY9RZX3+xAJwX7sVuWgR90sD8PTMAw5S7QJNDVFnpG69mfsZDi0j8ItQWXCOD
 tWILtOWkeXackUA==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Take a shot at converting the last driver that requires direct
"qcom,ipc*" syscon references in devicetree by allowing the smsm driver
to use the mailbox interface to achieve the same effect.

Still not sure if the devicetree bindings are the prettiest but they're
functional.

One alternative I'm thinking of is to use mbox-names to not have <0>
elements in dt, and reference the items by name from the driver?

e.g. this change for msm8226 could be represented differently.

-		qcom,ipc-1 = <&apcs 8 13>;
-		qcom,ipc-2 = <&apcs 8 9>;
-		qcom,ipc-3 = <&apcs 8 19>;
+		mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;

vs. for example:

-		qcom,ipc-1 = <&apcs 8 13>;
-		qcom,ipc-2 = <&apcs 8 9>;
-		qcom,ipc-3 = <&apcs 8 19>;
+		mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;
+		mbox-names = "ipc-1", "ipc-2", "ipc-3";

But also here the name with 'ipc-N' is probably not particularly
fitting?

Please let me know your thoughts and any suggestions.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes in v2:
- Mark qcom,ipc-N as deprecated
- Update & expand description for mboxes property
- Don't duplicate example, just update existing one since qcom,ipc-N is
  deprecated now anyways
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240424-smsm-mbox-v1-0-555f3f442841@z3ntu.xyz

---
Luca Weiss (2):
      dt-bindings: soc: qcom,smsm: Allow specifying mboxes instead of qcom,ipc
      soc: qcom: smsm: Support using mailbox interface

 .../devicetree/bindings/soc/qcom/qcom,smsm.yaml    | 30 +++++++++----
 drivers/soc/qcom/smsm.c                            | 51 +++++++++++++++++++++-
 2 files changed, 71 insertions(+), 10 deletions(-)
---
base-commit: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
change-id: 20240424-smsm-mbox-0666f35eae44

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>


