Return-Path: <linux-arm-msm+bounces-79781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D3C23038
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 03:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C9853B99F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 02:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8396B288510;
	Fri, 31 Oct 2025 02:28:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5F627E1DC;
	Fri, 31 Oct 2025 02:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877718; cv=none; b=MlvNKXycztPyVm24k0Q0UhrePuiw5gkR7IugC2VCJXYN2rQDO5ii3TX2nTkQnQ3jvkhxcyVe1q3Ucz/FVu6JaV+zX/WCexU2GFbYq3jtJX4YKAssku1JnltgP1bMsXWzglUH4LXepC2O+VlvL1y7U3UOhWbN58OUwzs3UOHsNJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877718; c=relaxed/simple;
	bh=KCWVlcgb2vlTFeuNn6M9x7iyQu3pcLnS9YetBihR8wo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nXG0HHsuc5V0FtDWppHEvR20+5q7vtr9nvz699Z2TEirCLgQG7oNx0kNWLLxzKl0MDCmrR3gaKo9fIbmSNQf4TDcwmDKgct9O56J9qVl7fT+ZwUkCgNYBXIQSg/YwlJ1+/ScIpFxEYM0Zp6EPhsPIHCuVdgQI6EqfXMVbt6HNNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=permerror (bad message/signature format); arc=none smtp.client-ip=95.215.58.178
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey@web.codeaurora.org, Minnekhanov@web.codeaurora.org
Subject: [PATCH 0/3] SDM630/660: Add missing MDSS reset
Date: Fri, 31 Oct 2025 05:27:42 +0300
Message-Id: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4eBGkC/x3MQQqAIBBA0avErBtQS4muEi0sp5qFFk5EEN09a
 fkW/z8glJkE+uqBTBcL76lA1xXMm08rIYdiMMpYrRqNEqJzCmMQwUxCJyptfeu8abrJQumOTAv
 f/3MY3/cDZTCz6GMAAAA=
X-Change-ID: 20251031-sdm660-mdss-reset-015a46a238b5
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

Since kernel 6.17 display stack needs to reset the hardware properly to
ensure that we don't run into issues with the hardware configured by the
bootloader. MDSS reset is necessary to have working display when the
bootloader has already initialized it for the boot splash screen.

Signed-off-by: Alexey Minnekhanov <<alexeymin@postmarketos.org>>
---
Alexey Minnekhanov (3):
      dt-bindings: clock: mmcc-sdm660: Add missing MDSS reset
      clk: qcom: mmcc-sdm660: Add missing MDSS reset
      arm64: dts: qcom: sdm630: Add missing MDSS reset

 arch/arm64/boot/dts/qcom/sdm630.dtsi         | 1 +
 drivers/clk/qcom/mmcc-sdm660.c               | 1 +
 include/dt-bindings/clock/qcom,mmcc-sdm660.h | 1 +
 3 files changed, 3 insertions(+)
---
base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
change-id: 20251031-sdm660-mdss-reset-015a46a238b5

Best regards,
-- 
Alexey Minnekhanov <<alexeymin@postmarketos.org>>


