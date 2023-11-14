Return-Path: <linux-arm-msm+bounces-611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5217EAD9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 11:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F85FB20A12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 10:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4FE1864F;
	Tue, 14 Nov 2023 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernkonzept.com header.i=@kernkonzept.com header.b="B0lhctY9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A471A182CB;
	Tue, 14 Nov 2023 10:08:11 +0000 (UTC)
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD83197;
	Tue, 14 Nov 2023 02:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kernkonzept.com; s=mx1; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:References:In-Reply-To:Reply-To:
	Content-ID:Content-Description;
	bh=lnb08R9HF7IxaFru8lvv0AlBanwWuzGilxFh5qu9Cgw=; b=B0lhctY9wEXw5rPpcquomTcVF5
	imyojfw0Xtm+P2Ztw3e/0xTHGJOAnaC8INQ7wQz9TUoMGxg6inziLUeex2+lXQ9MxbDhAAVheChgb
	BRfKAVefFGp2feYWZTt56ncPQyvBVv33kpnf3pnb0yMhR9pIOW6a8Naz1xDXUPDD0se5JN8qA/d4p
	iWuZeJjorEsCM0CEjVe/UnoP/eZ7gryqPihbU7v3zzjJl1LTOBLAZvcqP1FycL1+bCu8o4xE6WWGm
	SKZQHkTg0jOCkppU767cDeqVQ7LQrK1WR4PnR4B6W1Jk8RQV0/ehYkDVqxOqiEF3SlsoqBpnkON/D
	ZXuJZPAw==;
Received: from [10.22.3.24] (helo=serv1.dd1.int.kernkonzept.com)
	by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.96)
	id 1r2qKx-0050az-2v;
	Tue, 14 Nov 2023 11:08:03 +0100
From: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH v3 0/3] cpufreq: qcom-nvmem: Fix power domain scaling
Date: Tue, 14 Nov 2023 11:07:42 +0100
Message-Id: <20231114-msm8909-cpufreq-v3-0-926097a6e5c1@kernkonzept.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO9GU2UC/2XNTQ6CMBCG4auQrq3pDxTqynsYF9JOpSG02GKjE
 u5uIcYNy/dL5pkZRQgWIjoVMwqQbLTe5eCHAqnu5u6Arc6NGGGcSCLwEIdGEonV+DQBHlgbw3i
 jQRrDUb4aAxj72sTLNXdn4+TDe3uQ6Lr+LMp2VqKY4FrUCoRoq7Jszz0E13v3gXE6Kj+gVUzsr
 1BCm73CskKkYNrIyoiq3CvLsnwBczAyCfoAAAA=
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Ilia Lin <ilia.lin@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>, 
 Stephan Gerhold <stephan.gerhold@kernkonzept.com>, stable@vger.kernel.org
X-Mailer: b4 0.12.4

The power domain scaling setup for QCS404 and MSM8909 in
cpufreq-com-nvmem does not work correctly at the moment because the
genpd core ignores all the performance state votes that are specified in
the CPU OPP table. This happens because nothing in the driver makes the
genpd core aware that the power domains are actively being consumed by
the CPU.

Fix this by marking the devices as runtime active. Also mark the devices
to be in the "awake path" during system suspend so that performance
state votes necessary for the CPU are preserved during system suspend.

While all the patches in this series are needed for full functionality,
the cpufreq and pmdomain patches can be merged independently. There is
no compile-time dependency between those two.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Changes in v3:
- Drop patches with MSM8909 definitions that were applied already
- Add extra patch to fix system suspend properly by using
  device_set_awake_path() instead of dev_pm_syscore_device()
- Set GENPD_FLAG_ACTIVE_WAKEUP for rpmpd so that performance state votes
  needed by the CPU are preserved during suspend
- Link to v2: https://lore.kernel.org/r/20231018-msm8909-cpufreq-v2-0-0962df95f654@kernkonzept.com

Changes in v2:
- Reword commit messages based on discussion with Uffe
- Use generic power domain name "perf" (Uffe)
- Fix pm_runtime error handling (Uffe)
- Add allocation cleanup patch as preparation
- Fix ordering of qcom,msm8909 compatible (Konrad)
- cpufreq-dt-platdev blocklist/dt-bindings patches were applied already
- Link to v1: https://lore.kernel.org/r/20230912-msm8909-cpufreq-v1-0-767ce66b544b@kernkonzept.com

---
Stephan Gerhold (3):
      cpufreq: qcom-nvmem: Enable virtual power domain devices
      cpufreq: qcom-nvmem: Preserve PM domain votes in system suspend
      pmdomain: qcom: rpmpd: Set GENPD_FLAG_ACTIVE_WAKEUP

 drivers/cpufreq/qcom-cpufreq-nvmem.c | 73 ++++++++++++++++++++++++++++++++++--
 drivers/pmdomain/qcom/rpmpd.c        |  1 +
 2 files changed, 71 insertions(+), 3 deletions(-)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20230906-msm8909-cpufreq-dff238de9ff3

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Kernkonzept GmbH at Dresden, Germany, HRB 31129, CEO Dr.-Ing. Michael Hohmuth


