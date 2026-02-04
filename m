Return-Path: <linux-arm-msm+bounces-91834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF2QBN19g2mHnwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:11:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29286EAE08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49BC5300938C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 17:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10246347FC3;
	Wed,  4 Feb 2026 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOgwHOb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06FD331A5D;
	Wed,  4 Feb 2026 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224623; cv=none; b=hzNRX4qZGczQm1ICzr8xAB138DNPd0L5x2pmEeXXaa4DGRz7m02I0siMse7B29zZlLK+GcjU1DnWsease6lWRThcNxP7JHxApbiwX1NPAlQJCNZ4SPlHn65UDk+dTg7KqGjWnlGaB14Kp81PUVxuYminPBprNOJJb7D0+DblSa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224623; c=relaxed/simple;
	bh=grfMbECNH1icJfVNClw7Lzh5XJpsl8PTYhdQn5bwIDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=onoB1gUpwnPaaODWVVD0O+NO43DbPCa6KCRoxoyzoA971xCQkVYwulkX22j/u1NYRaX+ueuzYl3Pc/YdoVHevmazPIn0in3LQPr0n11SbsSZ8YRs9HI2TFOdPoNRz0e42xIhqCXkAr0NA3dsjPrp+C91hPoWas8i7dB6JnOcqiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOgwHOb+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2578C2BC86;
	Wed,  4 Feb 2026 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770224622;
	bh=grfMbECNH1icJfVNClw7Lzh5XJpsl8PTYhdQn5bwIDc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AOgwHOb+WFd19ylpyssPlYWpCDu9t25k8Ywq99B1ZmCqdlj3J8GiL1rtI9Y1GV18f
	 uSED/pEA0gwTtwEUFaDxuNXiT2WUpto5PLeBQrdKsPHPHIpArg5xm8UVOhmH8hmG9B
	 hZEF+OR7ZxPu7ZZxBYP6rSaZVT12kl8T+KAO3Kr8TBccBptVNEPmOXKx5rfDhoUrG3
	 lfZSf68Iqd1cWojfDirimkw/xfQtcsjUeGzMNCgdnRG2jE2ce5zl1SdrCSqRaZPs3M
	 oOzqwdWkcBOWiop0Zo+0cAdmGRqTqj4s1o6U2IApAcVH47jAq3LxrLxIb1klbIXSZx
	 pBnfaqXwzW+7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991A4E9D418;
	Wed,  4 Feb 2026 17:03:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 04 Feb 2026 18:03:41 +0100
Subject: [PATCH] testing! arm64: dts: qcom: decrease WiFi antenna regulator
 minimum to 3.0V
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-oneplus6-wifi-voltage-v1-1-ee6fd47f9d02@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAOx7g2kC/x2MWwqAIBAAryL7nZBCIl0l+pBtrYVQ0V4Q3j3pc
 2BmXiiUmQqM4oVMFxeOoYHqBODmwkqSl8agez0orYyMgdJ+FiNv9iyvuB+uSZYQLXpryCO0NmX
 y/Pzfaa71A3I3h2hnAAAA
X-Change-ID: 20251216-oneplus6-wifi-voltage-8ecc8cf86efc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MU24/0EIkkFW4iVo90u34fUl4tbYSjVYYtHCLcNmzhI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpg3vttL5pwPV+sq8S27yyE9ZGek38daFoKqtkz
 lcccZPXB4mJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaYN77QAKCRBgAj/E00kg
 chLDEACm+c5AjJwx7etuRiWKrMxuYeqaDczPtr9XUafue2acCLjH4sFSi7MDwui3i6b4vYwg8ah
 zv7H47yGtLtKCeGA3QWhW52UouDimzbEjePwexkfRspE4by+RN4VjCvvEY8f3+2WQwllKv4wpw4
 T6DqU7isqI9u8z5U4Wf3NA/xk1WfFlhT2kAL74OviaxxJ0PN6gij8Ipoubfg042c5bMtiVxUvTY
 edxOycNeMzkXeBejtt6whLYaQwrnaOqL65pizd5YweFFYjRbDu0OF2dVoMpDYARBvnVamV8bdrY
 MkmVwI7aFa6FRtdpHfgROP2fFjhfOxk9cmmoqWQ4dDTGWIbVaFFXGkAzrM6EcsIDiOMsK7+204s
 aOOJSANkOi6FQMZDbdcRrtx53kwSns74qL6HIezwcvmGQo+eY/SBDokMb7Cxc/4Bd1dEONSESDi
 gJ+XAD1Fq/OYjBKcSSDq+MxVZVO6HFWhe6XcVfDmU0+1iQ1n5UOVFPBVRkm6KGn8DKW9v+9OrGm
 DVwCOsEZqv04i7UJ55HEkI4KV+f+pXTwJOmNnZJ11OrZ1lK0w2DmQZIOpjm/LMHhPa9HfblR45R
 4MnzfqiuQzQkKCd16qOaXxazh7Bt+MkdaQpgjC5ZRsVUw/QNargNUKZAF6ubwQ36HOE9snjVCRV
 vtmO7glK6idZy+g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91834-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 29286EAE08
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

Downstream defines minimal voltage as 3.0 V, while when OnePlus 6 was
introduced to Linux mainline, the value was fixed to maximum 3.3V.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Tested for ~ 1 month. Seems to work well, no visible issues anywhere.
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 5b121ea5520f5..e950db41ce25a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -307,7 +307,7 @@ vreg_l20a_2p95: ldo20 {
 		};
 
 		vreg_l23a_3p3: ldo23 {
-			regulator-min-microvolt = <3300000>;
+			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3312000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -320,7 +320,7 @@ vreg_l24a_3p075: ldo24 {
 		};
 
 		vreg_l25a_3p3: ldo25 {
-			regulator-min-microvolt = <3300000>;
+			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3312000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};

---
base-commit: 5c009020744fe129e4728e71c44a6c7816c9105e
change-id: 20251216-oneplus6-wifi-voltage-8ecc8cf86efc

Best regards,
-- 
David Heidelberg <david@ixit.cz>



