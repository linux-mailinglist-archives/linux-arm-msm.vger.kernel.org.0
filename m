Return-Path: <linux-arm-msm+bounces-75031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F26B9E378
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34958166170
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA5A27B34C;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKbH5RJH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA26A2367BF;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791571; cv=none; b=qMbFvvOZwT80/WiWz1aDLIo99ZylFFZuXBueyotehzvcrZZFmnKgM1AmrA2Yvrhq9IMCbkOW3XPzJdRXiRSoyP8reKinI8zbSD2WKVi28h5JR2i78VVufk5p7WdwZjNh79NP2JC/GYZW+gnWf7gnN7gMSokv6WM5T28xsAAZD5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791571; c=relaxed/simple;
	bh=w2h021jMD9GsalBB3ADdOMlEjXOVX1XyaFvRU6+ecZI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u/NTS0B3kCMNUjmIL7nlATn5kwNxkWdda6Gd6UaQPsspMbwRU5EI41SdZKBfSr8u9JIJHAptXjIh0dof1twqLfLeGB94mcSdmphed0suYssdNVTp+7HiJY1VvKdpJl/lG6L3ZNrI8BeJzVkAiQGSTYLMXd5gr/8L8XeQk0/Z84w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKbH5RJH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70E8CC4CEF0;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758791571;
	bh=w2h021jMD9GsalBB3ADdOMlEjXOVX1XyaFvRU6+ecZI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dKbH5RJHQHW1RgTdRXzYy3rquYIplWD4iF3X9cXALr3WQm5iqIKVFY4XPvzgkLnXb
	 jlWpjPBxi99OdNziyT9e1mXm0t2kzr1tMqUD28mbc+ssW2JNrSUVAiupXLDIKcmvhv
	 CYkaSb5ywMpua58n3SsQA3rpYSYzmgRf6ShVJbwmjZMzpUb0R6E9J7lDvm97NyXyXH
	 v93s1owXyg0jQ+ynXCJfqLB9KPUBY64JoYR7+uzO1aOZJGa2KoVXOK52L4/WpX4NTr
	 WO5ZOhNAPvs2PkTIDxYd8zZ3g4HQHfkCbht8EnVEWnn96syPnmKJaPy9oB3l8XfZ73
	 vvipOAOnHs2MA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58942CAC5A7;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/8] Add OnePlus 6T display (Samsung S6E3FC2X01 DDIC with
 AMS641RW panel)
Date: Thu, 25 Sep 2025 11:12:46 +0200
Message-Id: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI4H1WgC/x3MQQqAIBBA0avIrBN0xMiuEi3KxpqNhUII4t2Tl
 m/xf4VMiSnDLCokejnzHTv0IMBfWzxJ8tENqNAqh0bmkUzwWJSWwVmr9gkxkIUePIkCl3+2rK1
 9d2mGnVwAAAA=
X-Change-ID: 20250923-s6e3fc2x01-f9550b822fe5
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1800; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=w2h021jMD9GsalBB3ADdOMlEjXOVX1XyaFvRU6+ecZI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo1QeRbo/2hmfLGDqLFdrUixqM5/mVi8/CFahBd
 9U//pQ1aSyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaNUHkQAKCRBgAj/E00kg
 cgz+EACLEFfyyaze7JqKF3k9hOiOSWTJoexB38nGRUvr0km2RFSrI7+TtZMbd7N5uanhHCerasM
 HUV4yxMt1kMmT/1gn/+IoWLHuRCXc4EBef9dLSV7vBhso05eVS7qYHyg0NaZ6uGQyhlEbafuLHQ
 nbmskpvjZnmUEcyGHTegWkgY1EK/erUfgJzZNo8yvLAvzKFDdhT7KvCdhfNRa9uOqQP2PM8zkQI
 tuAQ4h2FzdmQNHeQoG0Ie6mi3G3YbnHexRP2/5MaEP+WSRRn5gcTcRgzTjLO022b4SzsAyK286T
 OJv2vhYd+2FM3hNt8+iFriMvwH36GvCBEeHVj/F9lOI3A7vFa0Zb5W2T6J5nrrVmO9R4xQgiHMw
 PfLZdPqnkxqPpDoDKrA7JM1vKS8Drxt3BAKMmkg/9W/PRyZMTFEaocSbO5Y4ERdJjHL6THVs1uO
 VOJNlYKfBhnGWdDryD++mdcI58goV06Yrb0/yzcj+u7MRrwCp5ThR0BgD8o872HPhKygPjaeXDJ
 mZMRr13bZvlc9g6rJ+5CTgaa1xUREI3cvlrOKrhZk2j+dhwg6qmB50+lK/IwlNtAAVNCCyxyAXR
 s0e7WdQA3GHQ6XuZR4Sw+5epDNdyXML2kdW9e6DKkIWEPmfN+K6Azp4GFHpJqaxYgoiqmRj6h00
 MTX3CYPWBuf1zug==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

This patchset enables display on the OnePlus 6T smartphone.

Minor adjust to the device-tree of OnePlus 6 had to be done
to properly document reset GPIO used. Also same adjustments
had been done to the sofef00 panel driver (used by OnePlus 6).

In the last step new DDIC driver is introduced together with AMS641RW
panel sequences.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Casey Connolly (1):
      arm64: dts: qcom: sdm845-oneplus: Describe panel vci and poc supplies

David Heidelberg (7):
      dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
      dt-bindings: display: panel-simple-dsi: Remove Samsung S6E3FC2 compatible
      arm64: dts: qcom: sdm845-oneplus-fajita: Reflect used panel in compatible
      arm64: dts: qcom: sdm845-oneplus: Correct panel reset gpio polarity
      arm64: dts: qcom: sdm845-oneplus: Document TE gpio
      drm/panel: samsung-sofef00: Invert reset gpio polarity
      drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel

 .../bindings/display/panel/panel-simple-dsi.yaml   |   2 -
 .../bindings/display/panel/samsung,s6e3fc2x01.yaml |  77 ++++
 MAINTAINERS                                        |   6 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  31 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c   | 404 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |  10 +-
 9 files changed, 536 insertions(+), 10 deletions(-)
---
base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
change-id: 20250923-s6e3fc2x01-f9550b822fe5

Best regards,
-- 
David Heidelberg <david@ixit.cz>



