Return-Path: <linux-arm-msm+bounces-69394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E057B28487
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 19:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D8DC1BC685E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 16:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4D8257848;
	Fri, 15 Aug 2025 16:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+B9X3KL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAB92E5D34;
	Fri, 15 Aug 2025 16:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755277014; cv=none; b=erau4OIk2ZCYlrUYGmrsDjPOmd2R3HicVMdrl26yAWiF+pTjjSuUt+692TO/ItHmADGVx8qr/146+v1wV2yuNQz3hHvYoyumFYiT7xsiD4rjVg+APzA+elKtO0w4mXV5MndLKN0I4SsQYRd29kllyI+JicgcacCgAkZiosW77S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755277014; c=relaxed/simple;
	bh=HElbIKK8aSTKmO/ZwAiZrBwwRzKY55uzVhucMeSfW5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GZxzB1rh/HPITwgC7HmiMSedGrUk5EIWQFIsrhVqEypDGxJiLS8g5qjV0wV2abuyCSmn2AB/o+/omlZdpL/DEWlIIVsIBB426K+OxLWs21EEBJ5WNwK30QSEVMufREsWHdsKWwuQqCJ2r6AZCeRbWUa+LUieU/psmOxPGik1vww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+B9X3KL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEC77C4CEEB;
	Fri, 15 Aug 2025 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755277014;
	bh=HElbIKK8aSTKmO/ZwAiZrBwwRzKY55uzVhucMeSfW5A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=j+B9X3KLCApZbmu3GnwfABlxXZ4q7PDZ7LTJ3IgerNVN9fH1ADSCrmZbI09I91hN/
	 6k7TGro/fKTran92mfvkFfUMBLaRjItmuObEk9m5dRZa/voixGyx4srpR9EIb4+3aG
	 WisQqtV7zWtDBUFJEbV6SwsDf9FzVwWX+kKHcDXuBVJJjjLbm+z+85fbk9oaorI6nu
	 5v2/a7+WNaa8oPDW0+sDYI4EFSx5xIlfyNHl5GdyQ44OGuvMmMJ4d/CJBqPHwqvcGq
	 h8Jbn+g5UfhNzQBmKYdXJdgJApCl6nbn2XkD5/DnkdR5tzLo5s9GKPLRquVQzaSJF4
	 BxPUxTWYHbaFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E689ECA0EE6;
	Fri, 15 Aug 2025 16:56:53 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Subject: [PATCH 0/2] Add LPASS/CDSP vote clocks/GDSCs for SDM660
Date: Fri, 15 Aug 2025 19:56:50 +0300
Message-Id: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-0-c5a8af040093@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJmn2gC/x3NwQqDMAyA4VeRnBeouoruVcYOXRJr2GxHM2Qgv
 vuKx+/y/zuYFBWDW7NDkU1Nc6poLw3QElIUVK6GznXeja3HSITG6zA43PJXkN6ZXoYhMUY2Mrz
 208w9PWkMHmrmU2TW37m4P47jD6fJg3RyAAAA
X-Change-ID: 20250815-gcc-sdm660-vote-clocks-and-gdscs-439fd3cbc8a5
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nickolay Goppen <setotau@yandex.ru>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755277013; l=748;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=HElbIKK8aSTKmO/ZwAiZrBwwRzKY55uzVhucMeSfW5A=;
 b=1Y/v7jrQ+XTqQsZpbZdJh6yqm0HdBSkFxvGa3BEhEupM7VwzpKN4g5DA0elflLl/B5zP9XrZ+
 h8T7wWJRQssCLhVuMftAyCUKvFxQhxGwrHialySwjjUc14rK6yXvYN8
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

This patch series adds LPASS/CDSP vote clocks/GDSCs to gcc-sdm660 driver.
These clocks are needed for properly functioning of SMMUs related to the
audio/compute DSPs.

Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
Nickolay Goppen (2):
      dt-bindings: clock: gcc-sdm660: Add LPASS/CDSP vote clocks/GDSCs
      clk: qcom: gcc-sdm660: Add missing LPASS/CDSP vote clocks

 drivers/clk/qcom/gcc-sdm660.c               | 72 +++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdm660.h |  6 +++
 2 files changed, 78 insertions(+)
---
base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
change-id: 20250815-gcc-sdm660-vote-clocks-and-gdscs-439fd3cbc8a5

Best regards,
-- 
Nickolay Goppen <setotau@yandex.ru>



