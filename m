Return-Path: <linux-arm-msm+bounces-80861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BACAAC43AFB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 10:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6D404E2A8E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 09:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14F22D7DE2;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNLQJC/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5F2D6400;
	Sun,  9 Nov 2025 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762681205; cv=none; b=Bjx0pQMZh2NNo4lupfR1SGTSFuNVbkcJelOr2oQGGlLpiydfIv+iYtD7uzGaVKxrxTINEO0kiSN5PcwLLYRZS+lrL2Z5/RK39fRFqp8b9eH8L3fxQ9zl04vBAFXASuoQkuHXCSC3FjJ2OwbIiitAljNxxtkGjRyLf+8gcq3BK+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762681205; c=relaxed/simple;
	bh=1mafSDjzBgsMCZ7ArlDk0UuSa3iSLw6qNMUKGLRpjvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Oz9iOY2DcQgbhuuE8EJUHtAYYJA/V3u00HwnoCluqLwS2a+QtMdpVhtRJT4hysQxlrZfDo3sxiW9LGdbIcY7RtLAaRYDbjgY69iKHVOsWjO49+pwetIwHigL3W3tOCzEr725rI5DyWplLaQiA2CwkpKUU2QBZevCxR/0YyRqyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNLQJC/M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2F63C4CEF8;
	Sun,  9 Nov 2025 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762681204;
	bh=1mafSDjzBgsMCZ7ArlDk0UuSa3iSLw6qNMUKGLRpjvw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZNLQJC/MliYq1YMSb99C1AI+K0n1njY75gqgXPUtW5Mi4gVhrbku+gruTkU3wVJr1
	 i7TiA7LaUzf6vS7CeyxlyChbNYHjHNn/TIrqrFqQCpaTBt+nqSMZF2h5SOAnYEVIrm
	 3f7rwHsa3NRKKpvaDnN/5uSLqx32oVQ2kh5649HxF4kKQREpKlGJefpRgyVXS+CM4q
	 oJ1qj+DxFbrAx/vmpvnamWvPF7GDnm8sRb5AH1UXBrlsH6NhMUbM5RJRDWjncJO7yl
	 0AfE4MWH5YWPzvZAORhjX34nizBQfvvSKL8nOAyICZW1NKMW8yDnKNu6u1WGZHA/Iw
	 P/bkGCR4LhRbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90BACD1288;
	Sun,  9 Nov 2025 09:40:04 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH RFC 0/8] media: camss: Add support for C-PHY configuration
 on Qualcomm platforms
Date: Sun, 09 Nov 2025 10:39:43 +0100
Message-Id: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9hEGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwNL3cLk/Fzd5IKMSt2kJIvkpJREw2QzExMloPqCotS0zAqwWdFKQW7
 OSrG1tQCzqm6gYAAAAA==
X-Change-ID: 20251109-qcom-cphy-bb8cbda1c644
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2819; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=1mafSDjzBgsMCZ7ArlDk0UuSa3iSLw6qNMUKGLRpjvw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEGFy2+CmwZYEuSn/R9jhfOrAc/Q8g4MAn54NH
 Jy0hZCQstqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRBhcgAKCRBgAj/E00kg
 ciHkD/9M7HjTM7Vr9eE8Z+80lQ5KK/JshPHF4fZsh/lgPbPqOcGyq+05W28Jnu+PKSsjp7Dn8MR
 b7wM4PyKskvy/iLrBVgMzY9xM2v6iIzrratp1gLfoDRWLmStSmMcDvWebgFz+ocWGnd9iX4PL5T
 Pe9hUCwlWNrEFAqHDj9WEZbsgI0/PKtVzRL1aDDBal/lobxzEfklLjtTNwhvIHPWVpfRSGjQlMM
 XJD9965Th9OqvMX6wfDv6c3zw21AFmxZ+rg6REX25nqGMIYomuTM6ZIJBGpO0JmINRc15WjgTgp
 que14JxgJ6C0cCdMoNYFIdJKFFUUjSOOWgfyqV9UPWJNzXas7RGMGwBJnimXSBuSa1jwsTuFUdB
 mfgfSTbVDzrMCZnVF08Oc+knH53pv/9r4EoGrObSDdpMVmV3HdD3Es8KzQfXKM0Sllo9Cwwr9R3
 QZZmKF4yqQwDUkcimMptVN339cktKgPVnASrWsYGf6vJ3lznXVUnE9l6afsIdMvITEaMpLbnf51
 ACtmAIiKdNqgyq2DdnzFzmL+YZkb0VhkddzxnyzG4xBivuurdNs6d7MHgGTZ2ub6lIzEBlWtGM+
 dEoP8CRHKy9d7UPCLs2GmSV3XtG3MYodFYBT+YNGSYv+W97VaObg8UHSjz/P7f576kjXhRHSrww
 ko1toCiSge6IXfg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

# Short summary

This patch series extends the Qualcomm CAMSS (Camera Subsystem),
including CSID and CSIPHY components, to support C-PHY mode configuration.

# Background and motivation

Modern smartphone cameras increasingly rely on MIPI C-PHY rather than D-PHY,
thanks to its higher data throughput and signal efficiency. As a result,
many OEMs adopt C-PHY interfaces for main (rear) cameras on Qualcomm-based
devices.

Until now, mainline Linux lacked C-PHY configuration support for Qualcomm
chipsets, preventing bring-up of primary camera sensors on several
Snapdragon platforms. This series closes that gap.

 - Introduces C-PHY configuration support for the CAMSS driver stack,
   covering both CSID and CSIPHY blocks.
 - Successfully enables C-PHY operation on the Snapdragon 845 platform.
 - Tested on OnePlus 6 and 6T phones running mainline Linux,
   using the Sony IMX519 main camera sensor.
 - The new configuration allows other chipsets versionsto enable C-PHY by
   simply adding corresponding sensor driver support and csiphy
   initialization data, following the example set for sdm845.

With this patch series, mainline Linux gains working C-PHY support for
Snapdragon 845, paving the way for improved main camera functionality
across many Qualcomm-based devices. The groundwork also simplifies
future enablement efforts for additional SoCs and sensors.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Casey Connolly (1):
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 CPHY init

David Heidelberg (6):
      media: qcom: camss: csiphy: Introduce C-PHY
      media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes
      media: qcom: camss: Prepare CSID for C-PHY support
      media: qcom: camss: csiphy-3ph: Use sdm845 C-PHY configuration sequence
      media: qcom: camss: Account for C-PHY when calculating link frequency
      media: qcom: camss: Remove D-PHY-only endpoint restriction

Petr Hodina (1):
      media: qcom: camss: Initialize lanes after lane configuration is available

 .../media/platform/qcom/camss/camss-csid-gen2.c    |   1 +
 drivers/media/platform/qcom/camss/camss-csid.c     |   3 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 165 ++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   6 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss.c          |  24 ++-
 drivers/media/platform/qcom/camss/camss.h          |   2 +-
 8 files changed, 146 insertions(+), 58 deletions(-)
---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20251109-qcom-cphy-bb8cbda1c644

Best regards,
-- 
David Heidelberg <david@ixit.cz>



