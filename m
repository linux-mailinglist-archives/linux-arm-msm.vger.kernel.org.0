Return-Path: <linux-arm-msm+bounces-97097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLENFR4AsmkvHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:51:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8BA26B75E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F3F5305ED30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CF83815F3;
	Wed, 11 Mar 2026 23:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nt+mvrtl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD2E37703C;
	Wed, 11 Mar 2026 23:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773272986; cv=none; b=hlZaAogFvOINPuixLw6YVQwR3dvX7dbQrKMaJhiNMTPS0WdkadtVdcCXqAz814KYKlHz9okhQGeE+mIkTZR4hwtArDLt76inNeXZCZldJrorLwuFA4Hsk94/ddmED3wKN11/mbzWIbd2sNaS7ajtkDjBqFbuvLCUoPGn0HKbvL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773272986; c=relaxed/simple;
	bh=TUoad/OrSd8DkhEiwsMoe8BWT2tvATe0hPDCsVSSYt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gx+8Uvaq92o63v+Bf6wXuQ3c7r3czdgB++GrUxcks/VbimQkuRmSDfKgBS+Q6d2XG5Kn+jA02CLExn1hkolAQ5TUM7Q+y5DsuERCJBBqcymhYiiqfpK7qr8cgFHSR1yTLGrS2CDNZkcLeMdlMsZ8gmRivProq+p8s1Ggp5dvi8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nt+mvrtl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CCA7C4CEF7;
	Wed, 11 Mar 2026 23:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773272986;
	bh=TUoad/OrSd8DkhEiwsMoe8BWT2tvATe0hPDCsVSSYt0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nt+mvrtltY+aNkNoVuxxwLcv7kYsUL5h69Z9Mzpx+btV9fvpFqRJNcb6XG8GgYV+3
	 eA2VzyM7e8Fo1iiiwgTpmtqnOi3VMpLbFElG3eoCNikCL6qajlz0LgpyWpNyqQH9ul
	 ymLc6S/UC1arlk/iUjmxLbMICH/5zKUHbrQxDQ7T8lSBpwBJZCnXiynxfiEIs7naCS
	 zmhWoA77wyvMwjcskeeoDgK9y940etlKjjB952sbWfbmeNu2VJ9XjJgrNWH54duDSc
	 Oq8/td1F01Vo4zOWBJagc7vEW9c5XOQEHqndI2LhZo07HokYPdmVemSL7ttlOKc6+d
	 Po8OAbP25zjhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483AA103E2F0;
	Wed, 11 Mar 2026 23:49:46 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 12 Mar 2026 00:49:43 +0100
Subject: [PATCH] arm64: dts: qcom: Mark l1a regulator as powered during
 boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-beryllium-booton-v1-1-59c83ab91b78@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAJb/sWkC/x3MQQqAIBBA0avIrBN0goquEi20phowDa0oorsnL
 d/i/wcSRaYErXgg0smJg8/QhYBhMX4myWM2oMJKlRqlpXg7x8cqbQh78NKMFnVDQ03YQM62SBN
 f/7Lr3/cD7eMPfGIAAAA=
X-Change-ID: 20260312-beryllium-booton-adb218ec7e28
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Amit Pundir <amit.pundir@linaro.org>, 
 Joel Selvaraj <foss@joelselvaraj.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=y27EVFmPscBC6k41hKpMUbdL61VHoT6gjj25XcDc/Dk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpsf+YAnO9xEZ8lMwOKBWhFOPOQMvlih5EuNnnm
 53ySIoTkbCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabH/mAAKCRBgAj/E00kg
 clj5D/9Lt5xAXXYmqCelEPyDL7bwezi4tQGOJuyKg5zLcPhtJSJ2d2+vG1nYRitj53r3Zsa5krr
 S+IN4u84oGPHaBL0uEhHoR4oiEoPlMAhYuI8dOKkhaB2FsCI4RPCMRiVRNjA7oKCv7pSfo1VBhG
 RTa9kYwt1h4qY2hUYjdFLqRp0oju1xEmMz0MpGczhGBwNmZLlhPk9GVzIKtiq6SFNk9yxvQF31i
 uhXRxQA8OouxWblxoC/Wi2Q22eVbEqmJRs6SzfOU7gk06Dy+lDRAVg1tgO+HPNGxbUkdaHPO8Kb
 qYFqIaLyXPTu6SCgJ6rn4P7Hr0K2+8ounT1XQbtRt/8HAHhcwSXZu2u2GRWQEPi05Ju8W6Y60wH
 clIjuBqb+3Z7JUPcn4f1jieDXCNjjGflXNb+7QqrQN9El++aaXWacyTW7cbogBWVx/ZSPKPxUIa
 Fr8bRusFFamAeKX/5eJqelodo1eppiwc/qMhwVUvcHGvxmmYHUGjR1VVopNm0On+C7B7N9Q5svT
 YNHnJj3dR0MqFXeZEiTJtDRf2wxJD/d6LWqFfRqGoGyNpQyYYk4DdPDB9Ol/Nl72ClRM9Eho1vy
 EY4QkN7uY9ERikgzFjy+JHKhdUxiWZ57yCZuHCqPIisKbasenuyYeoAp2l1MXE95Rw6PszkAbeF
 +e9FfCElhpFR8VA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97097-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: AC8BA26B75E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

This regulator provides for the display subsystem, thus must be on.

Fixes: 77809cf74a8c ("arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 01b570d0880d6..1298485c42142 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -148,6 +148,7 @@ vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 
 		vreg_l5a_0p8: ldo5 {

---
base-commit: f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
change-id: 20260312-beryllium-booton-adb218ec7e28

Best regards,
-- 
David Heidelberg <david@ixit.cz>



