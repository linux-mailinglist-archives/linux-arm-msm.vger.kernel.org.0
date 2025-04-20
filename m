Return-Path: <linux-arm-msm+bounces-54822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B594A9481F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 17:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32BD51723A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 15:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918CC20AF9D;
	Sun, 20 Apr 2025 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="HD+dgttS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC1E38FAD;
	Sun, 20 Apr 2025 15:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745161993; cv=none; b=UP9ni/JB52b04yoIryckoZIJvGcFN74lPE9TjcBDEqNy+3oWL7hbc0/t+NHZH0aRcJtwvmBuLJQFpkQuvERGj60FO/Vim1APHbO85i219cwp2WeAeFct05ek/FCqMMAcnKe47v7SZbjTjTVS7J4vjad5wc0IGL0XkXcl/c8cruM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745161993; c=relaxed/simple;
	bh=Kpq7ro3i9sA6BaEIgHSC/PwaQTt/JmVWsIY7UsowlcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YW+3Ez+/hSi9qViZng8j3IMJ2FJfvlS9OpWtAU+LnaN8LyY5sNA2pUoXA2hGSloDaaST+8Jyc9dtcbVz6Nlzb6IahdfpZYXFfhNaV/9s2u4ne/+lhoF3LY8g84YBtecXfTZEh7W+UKyAZn8PIcLvXS+cNweNaAcNFz4KnigxtRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=HD+dgttS; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745161983; bh=Kpq7ro3i9sA6BaEIgHSC/PwaQTt/JmVWsIY7UsowlcE=;
	h=From:Subject:Date:To:Cc;
	b=HD+dgttS9Jh/G0d0tK1k5A9sju1HAJDEDaOa16rm89SITqVt6n0pmQ7pCAL9liwYJ
	 By834uSV0wMKOOb0T2bR/PIgfB7aXrS/5OF012u5bRB/KcM2y9ZiOY0aTZaDxwmlVg
	 b72eiDT6K6xJupWRluHQ4ZcsW1km1uZ2/7EGVvsc=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v2 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Sun, 20 Apr 2025 17:12:42 +0200
Message-Id: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoOBWgC/4WNQQ6CQBAEv0L27JphEAKe/IfhAGsjk8hidgA1h
 L+78gGPVUlXr0YRBGrOyWoCFlEZfQQ+JMb1jb/Dyi2yYeKcTlTYQYeyyjMrfkJwo/dwk0VHKVU
 oO7StidNnQCfvPXutI/ei0xg++8uS/uyf4JJasg1nYAZnBejymF3zgqgeMZt627YvJ9/xGLsAA
 AA=
X-Change-ID: 20250406-msm8953-interconnect-ef0109e8febb
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=Kpq7ro3i9sA6BaEIgHSC/PwaQTt/JmVWsIY7UsowlcE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoBQ74aC8pRTjusLNC0w7cHA6fb0STc8x2OTrka
 OHZiShYF6+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaAUO+AAKCRBy2EO4nU3X
 VgD2D/0TK0MHeV6AMmap+qu1iDMxwkXZU6Mfj28QKdRSPe9L9pIVK/AQIQcuUoNJjrHot5ZWQwI
 uYwPiI0xSYigpm9rJZLJe19Kp/BoO5n71wSfpFvBvoovCqZx5FMstqHd5ZV3iXS2L4Z16GOp0MR
 2RIhr8SXtsB69zDI7UMhvdPoMbtdj2e6FbSd1LHRYZr7sMqp4g/oW9YUaPktQLjTZdpXCeeyoBg
 JGp1l5pRHtMLaKpclooOuHsb/vvEv6osmtjQd3djv1DGqVgI7Hny2IRDhsD04NJgcOX+Jj3TksM
 vy11qyf2JK4Jx+pWfNwv9p6u1/n8ubr/9yKAvsvq9bRsGLzuXFEG/4kSGdDOyJQWSUM7x0USMHi
 9s2E5A7pme8glaZBzXJGTTsnHYAV4cQhEypfID2uZxj9PEjDrgGPRPRZAll9ym1vnwvF2S0OUKI
 jOf1N9/UwSSC2yskRua+aUeau/NV4b8NPyHfmRJUR7af9xnBzu8MViCzSVd74Kt4f+0d/JPyEa3
 w/0BG+KS25PLTeT+9t9ho4yjvKRdI4bqWM8ybP64YpZgWRdFt+LQcJGKarN6fZExX6e0FCL7na7
 +YSa85SCFL403kViOOsgpkiEq8IdVTzyWAS3Xiv7F23qwcnPcBvqN5Yi2XBmXws80JGXhnLksBO
 tH0QM8kE4sWo9Ww==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Since the interconnect driver for msm8953 is already upstream, let's add
the nodes which are required for it to enable interconnect on MSM8953.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v2:
- RPM_ACTIVE_TAG -> RPM_ALWAYS_TAG for mdss, gpu, usb3, sdhc_1, sdhc_2
  (Konrad)
- Reformat interconnect-names for usb3
- Add interconnect-names for sdhc_1 & sdhc_2
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu

---
Luca Weiss (1):
      dt-bindings: msm: qcom,mdss: Document interconnect paths

Vladimir Lypak (1):
      arm64: dts: qcom: msm8953: Add interconnects

 .../devicetree/bindings/display/msm/qcom,mdss.yaml |  12 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi              | 101 +++++++++++++++++++++
 2 files changed, 113 insertions(+)
---
base-commit: 26afa38c4ec694e22596b653849e25a54da68eb3
change-id: 20250406-msm8953-interconnect-ef0109e8febb

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


