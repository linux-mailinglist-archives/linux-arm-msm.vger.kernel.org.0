Return-Path: <linux-arm-msm+bounces-82326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E37C69DB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3C8D2344B87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F113596ED;
	Tue, 18 Nov 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIXvYX3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B72A2ECD1D;
	Tue, 18 Nov 2025 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475098; cv=none; b=ByRbIQRSAYKPKvCGNP9WHRqVhGurZgE6Y8FG7/HGcYIOVqkZm+DK5yt7mmcwZLaseqvcWeGD5x5i5QrukJF7+o+zLmAyTrYCvlVZgwob+e1Gi9RfjI6gBNjee9lQtHoNxeLKRkLSFDA/oPeST+oeD8KVjDNWvyWfUcLzEMowUt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475098; c=relaxed/simple;
	bh=4sKg01mKYY4IN/9DqdD4Vcc/A2cLVE2h/aQKWhL7kGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSdVfea3K59WGp20pdvofhzEFygjLylXBvaWh0CV8XwBGShkDGWL8kWWt7N1C3Llo0pcba1aF7yaX++q7Rp1o+2mzeuSnvGXyArwvJv2BgYXNQp6A/i1vE+sYV1ApLgg+0PmazqxgQIF51qrd4Y3opaIwAvgpGLU6TPZHatHW9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIXvYX3h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1B82C4CEF5;
	Tue, 18 Nov 2025 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763475097;
	bh=4sKg01mKYY4IN/9DqdD4Vcc/A2cLVE2h/aQKWhL7kGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LIXvYX3hTBupuLen1XaHw27sBOihxn8wPhewMVOLy/ccqWgJRJRX4AMluwHMXwKDF
	 uc8Pd2LDIDxzQ9SasE9cn8Ithhs9DE9oJU8jb9YmDYs27c29v3DQCEi12JLbgnEgZv
	 vBgAdvYJcfNuUveY1hIHAnG6Tp67jfY7FvIbJWcFhST+MjmaQd/kzwG6AkIUgx243k
	 AQygtR9sLtOsrcvSjFzYVQGwpKE72kUjCVc8JSgHKdMd19SmerVW1p48N4bseWG7t5
	 lLfKvsD7b6LT0eRgOasLaYExhwOd01JYYYkpEUBBxL6a4xK31ebkFHZRr9lH6MmIUo
	 21RejprDurCmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BCDCEDD97;
	Tue, 18 Nov 2025 14:11:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 15:11:36 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sdm845-oneplus: Don't keep panel
 regulator always on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dts-oneplus-regulators-v1-2-79fb2f0f253b@ixit.cz>
References: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
In-Reply-To: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=831; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=fSwmAdAODVY3a5d8qwwfw9ZcbtoqAA/tA2uqDntufkQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHH6YOyXwIcpUQpnj4K3a3ZhIFRPBzu5KIsbrS
 WLpQ7R4FtOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRx+mAAKCRBgAj/E00kg
 coZaD/912SaSI4kHNtF+1bWXzh8FR1R2aLvkTetShH97LGXknswcn4fvvnR0QxromIb5KBMx/Jp
 RIIxunxebJ8dbaqMkLdDdpLPCRivKUknLQcwqLpVnXE7hzCMot1FJPYb4CjZ0jtxbjPN7EdP8BW
 IFBV7pOVmkvGaFJBDGcl98jZ4JaVb2hu4hcSFiAw10L7mItvjmkmmXMDoSRg+BoklrBXcFzc5Tt
 /AaKXxUNfOLzlld5OgqaDI6/yI1Z2kuNc+KY0I46xBHyLxBKAsJzXWNBQVr98HswcyJ+FxO0yKa
 rEnWVUnICd9CSeS5fzyYsupO+LSH07aYh+kXQJaYSPM46uw5rb/OBTiEH9MHCPiQUgUdxAgMXHS
 kUMVWHO0BZ8q5MrqgtaQjvG2x3OvHqgVf8M9inT+vfcG3UcZPXaid/Mmf1ZEInBDo84xuy/EgJf
 nSLtHLNhEqsFcwbyO0jxcB2tUfJxhByi+RBLb1obJM7WW+7HAnUkGGXnCMcXDyVoTkpLAzKt+dl
 LOOxVrT/wox1CKrj0YqsibFVcULNUA+bBRxLQBmUAFNDqKQwZWsMM6poEvgxCo6iNJVm5yawqPY
 raxuTgKp4XT413XlCc/IziMUpPlpmjX0qvyKUTIuSpkpEjyAj4dN/nj1PRiMuFz/uO6lAdOiqgO
 8jDk0kJm6KLW3ZQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

The panel regulator doesn't need to be always on, so remove this
property.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index ee62adfa6af0b..5845bc3bb80b2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -272,7 +272,6 @@ vreg_l14a_1p88: ldo14 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
 		};
 
 		vreg_l17a_1p3: ldo17 {

-- 
2.51.0



