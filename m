Return-Path: <linux-arm-msm+bounces-82327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F15C69E16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C19AC2BBEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A827635BDC6;
	Tue, 18 Nov 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPm+UqI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B745347BA3;
	Tue, 18 Nov 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475098; cv=none; b=d0bzxv1mqYZl2c3PMnZYZFXJLr7vxrZHTmBu9o/DA1OHeIVMb5PT1e9VB1TzVw8EvYMaYdv+JaTpxx1BWYNfpnxDKjgWtylDfMbQMXWZ/kmP5IRsA1LMrflRvfkOYVIkj3kgdiwuiULBNC846A7DbmDtFTGJQKMeoxhjbtbEvkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475098; c=relaxed/simple;
	bh=biksnDZbHRZHAOKU6oJ6lOhbz3ZG191CQgCDytVAtaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ct0ZqJiHCl0ravvZtOzzRw3m/Njp35njdV7bWcnbPXRR0hP/o/11ioMTP3U38KuJJX6wTyAnrpEuoW9W2wa+7r+R6jcjTb/sG5WKw7kr12lJOvvOXoANMnwCi28MjDfRRB49DedqSPMWMh9XPGhK4CcCXqQRfljYr5R4GJfHyRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPm+UqI2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2B64C16AAE;
	Tue, 18 Nov 2025 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763475097;
	bh=biksnDZbHRZHAOKU6oJ6lOhbz3ZG191CQgCDytVAtaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YPm+UqI2Mdr8YbpjYc7RU6Yd/i1kgs+cW6W2j2JbIEEs8EYT+UT/HjVCsMT/AzxLD
	 c6i3XxXSg1NflMsLjtvMmlqqUDm5+DwI/CcKwxj0B96wotj1Th6Y4k6hindbxc9b4Q
	 lNgLaGULfN45EcriD2sOy//hisk0OIrDgYKEtbbcvf2etbymEmFR6vjhoHZXcfpKMn
	 lzJk0Qqn34jdzVp2XBoyWCbqz8Qh0IMzdf0miWl6skqWCpt7MjMo3r+0ohmNzHwBbM
	 gpUHt99hygUGHXKQ2KoY/VSqU1suyFyM7GyiPyuVpWh+yUDWjQ0xhXGYtxLYVsWsVS
	 KMXysk7sbdnAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6D0CEDD93;
	Tue, 18 Nov 2025 14:11:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 15:11:35 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply
 boot-on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dts-oneplus-regulators-v1-1-79fb2f0f253b@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=822; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=EBu0veDmUKkqndi/R0MzeoYGegTyBnWZ2KGLTX6A6Jk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHH6YQwCJN5mh2aVBhARO89TA6DDAnVhFvh95q
 /FJv85FTKuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRx+mAAKCRBgAj/E00kg
 cqRtEADGHYqpaOuG1irM7X9WmPbUkjChUCUvf80HUnoDZaV3jA4sH/+ZjrdUjd0yEnmyqLP8vH9
 OWPx2+pT64wbNI5AcBdTYRHz+96PIIwtXdHonK34kToE4u2JZYILtaalKpavxhehzGB8BsJaVc1
 /oddaXcRzZDi8J1o6GBkvVLKqxRyNMmyLb/Xgw9IQbdVwtoQ4GPm/88yQP3eOCIyhcclL2Of8dB
 p8bO1TWmXoEGBIXjcKJHjQCg9nWnkSKmOnbYpu5dOQ34jU0leusc0x2YjzbvHVe23mL5ISdiS7N
 Rj7RzL0ugQKwoV6S9bKX4GSLRPN9PCkqqec1q5DgzQqt7gQvXKR34fZvaWf7/1QlCIm+xSlJqRl
 IaUpUkDrEjIsj+DKJ9WIFM5aEwFGqFVd1iVSTRBKOrR14kvgtlTJvxY/E0CPsIpmt5pfx92pzeQ
 UT7WfT3BUYFWSuard92sKh7CgdemWwgwg5Lr3pfNiubYT1rzEDy9M8ccdAVTduq1uxfvoxyU2DI
 8ZPf45zbgwVT/cjPZHG0zIxCm4nK+MZz1dxZxYGSnJ1A9x54hNd0mJye84RJLwiPwgx++aADgog
 cQg8ZAzNLQkS8BjUBSKDb8hQeP0+89FXRuBm4SsY+CROkgCaSgNKGar4Rj+A+kvmxxFqr8iEsYV
 6qGDakfP7dJ+pHA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

The touchscreen 1.8v supply doesn't need to be enabled at boot, only
when the driver probes. Remove the regulator-boot-on property.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index db6dd04c51bb5..ee62adfa6af0b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -148,7 +148,6 @@ ts_1p8_supply: ts-1p8-regulator {
 
 		gpio = <&tlmm 88 0>;
 		enable-active-high;
-		regulator-boot-on;
 	};
 
 	panel_vci_3v3: panel-vci-3v3-regulator {

-- 
2.51.0



