Return-Path: <linux-arm-msm+bounces-82325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C50AC69E46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0F7A04F7926
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502D3358D30;
	Tue, 18 Nov 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnbrBhWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7AA2F99BC;
	Tue, 18 Nov 2025 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475098; cv=none; b=oTJ7k0OVtCUtJaCSmH4Jjh6ONw3tkgVVeZYsktseCEAuRQumV2sUN0uuh8gsMuYqcPCuA3SR2TH2NhnmLBFac0E/PicFfzguuOedJvFvZY2qMaNn1JHhug3h5Mzrk9TjzkXmyo/ql9v4BlamdeDvbfMpJ7Jif8bT8Y0Kb3NDv74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475098; c=relaxed/simple;
	bh=zEEZ+tgbupnE8MuYxfeIaw3voCncjbXCdXviXkL1Ya0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jZjmJnRXZ52OQk4dFpEwsdpjPzoPCpbQRJCjMMRHeJKUeJ4qwIQLopu+SbPYgUUn0U/CI+DUnO4Epf9GNZ9hBLdeYFgxl6qTzal3zuHJt2JaoETwQJ54tRv1cVcozAhgmOL2EQOaOFztxqk7wZpWTayFEuym2GN0XBYdza5h32c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnbrBhWA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9509CC19421;
	Tue, 18 Nov 2025 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763475097;
	bh=zEEZ+tgbupnE8MuYxfeIaw3voCncjbXCdXviXkL1Ya0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jnbrBhWAGOoX8tIuDjGeceLjAcngEKzmyziUaMifbu1W9SXLfQGlm0d44/aOGfHE2
	 eJtv3vRMuJNq2+kH4nDsf+B3pnM9Qtb4Yp7dHlHvciTEO3oblhu8Or2QCe/enWPF6Q
	 XJEBIxqRchXe/VTh8iWjHmYAlDpQOd+egyOtcsy1fic4MMUVgzyFy9nf92Aco749Fl
	 CKB/ZzWELpUA/la45KWiVbFzFX4D/R8dQNNgaOOWAHDuw9/RVcdwOr69SES/GYITG8
	 BA8cwWvRRmjdpiS4CFXkzXVCkO4ZG2M173z5m0CPWlScSJtJ4swN+tM74xzAbUXV2P
	 gRNZi+h6SjD+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA63CED620;
	Tue, 18 Nov 2025 14:11:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/3] Regulator adjustments for OnePlus 6 and 6T
Date: Tue, 18 Nov 2025 15:11:34 +0100
Message-Id: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJZ+HGkC/x3MMQqAMAxA0atIZgOtIhSvIg5BowZKK4mKIN7d4
 viG/x8wVmGDvnpA+RKTnAp8XcG0UVoZZS6GxjWd9z7gfBjmxHs8DZXXM9KR1dAFIgrdMlEboMS
 78iL3Px7G9/0AH9nPPmgAAAA=
X-Change-ID: 20251118-dts-oneplus-regulators-08aaa85fca38
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=715; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=zEEZ+tgbupnE8MuYxfeIaw3voCncjbXCdXviXkL1Ya0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHH6YHpLoRgCilp9CegCwUfGbv+grpz3AFEeEy
 /ZxAj2F4a6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRx+mAAKCRBgAj/E00kg
 ch6aD/492aZ6/9Mu1d9NDkM4vpGB8G9iS/nyBg9g62iLjsvczeZTHNG0jkmYbkhB/4WEA7Nlhot
 AmBXPm3FUBU/6bmlo97+daI6LSzlYzkgsZ+hPKqGGnuZ78jiahA1YjUQuWA7xi1XEY4UgX7ORlY
 XF98Q49LxOjPnvqtHXW3pUu6xsZGU3CMd0s868zFtQOsqpLUX2zJ8zpcw/TvPozx9ex7K65T5GQ
 xElWHn7eqChBF99IIq36G7kBKOufI3sUTx38zvRxkoCCQMkm71cVg9ZVa9WPS8ZkMgwwapp523I
 nrA5CNuuukReulHAIukqbq+gwnK0m2p2VUiwKt63BHjl0jE+qs9r7aWeFLxdEFz5Pp9lAdNp5pr
 EoQ6QNGzt3UICjp3JmUM0VbE6WHV3qbTBO96fok1lNjp2oUyrhi+BmiruXM4Edj3U3xGF9ysrDX
 qvX+sGynJQGlkCpreijK98/pVwoAfha0e7oTV9nDqcwnWQOMEWKxASYvKFezxgWqXUgAcrYp+sb
 bDIcOKlrFgU4jXMsWA9PKdigML04hy6TQfOy4NV0mWA0Srpbxmqdi7o7ObEd+NUsGdm1CVYt1cU
 dLn68SErFLSJ7dwN6KzTKTiVLRuH7NMdqx9Nwvn5a5svep0jkqWLiCYsl3k3XupNUdMVQ2hUle6
 jlKggiTCgm5xwBw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Small regulators adjustments, tested on sdm845-mainline and sdm845-next
tree with recently fixed (6) and upstreamed (6T) drivers.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Casey Connolly (3):
      arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply boot-on
      arm64: dts: qcom: sdm845-oneplus: Don't keep panel regulator always on
      arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on

 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
---
base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
change-id: 20251118-dts-oneplus-regulators-08aaa85fca38

Best regards,
-- 
David Heidelberg <david@ixit.cz>



