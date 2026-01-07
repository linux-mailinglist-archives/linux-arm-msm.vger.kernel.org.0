Return-Path: <linux-arm-msm+bounces-87769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E947CFBF50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 05:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFBDD303504D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 04:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B370255F3F;
	Wed,  7 Jan 2026 04:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R18fp8af"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECF424501B
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 04:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760233; cv=none; b=RyK6fog8UnlIj7fhJ50HGvTrd868h1xz863iNRJtbDkLMxJx+cV+DNpudNleMmmbRYe6UObi/9A3WQgEPPMZ9yFGh6S4VGu5K0kDfOoX20L6dyKZKCM6RDy7lWjfZzS2xu40VdSw+IvVSN4OoXqSjnwwn3X19q9Y8zShRGswefM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760233; c=relaxed/simple;
	bh=J9Fz7sRtOqzGWUn4OaalbhQscMbkEKJaXUTx0SI3dAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZyhgCkTyvyOcvyytjpcg+tZw4qQ8O3pGF1rmf9BYPOZCCnwD3y1kwlhjMRIejTGh7+4C2TOt6SfyfJ8gF2Rhw6/MZ0gUBNd+8frynbCs5Y7WiOuryIT5/FtUie13n0vZMSK1TkwaRMnuKSS9zvHEq+NufNIGnvSNIcREbbu09I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R18fp8af; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c15e8b2f1aso154593685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 20:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760231; x=1768365031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF0PSXd7nxzcgib/fF2QxJQOQ3zAiN3r11lfYK9VD2k=;
        b=R18fp8afWgdLQq2YpIcpyl7GB8W+qc5jhai+abXLs2hLpONAo4oe71rXsoNY7nDWJK
         RvAV3YvTozO+pXJ1jju936Lpb/iOZacj9uQT5ewHptvZhCWhonaj8MIdXxbsCXTHktY7
         u5H1n8BXZ6/Pm6nXF1cZCEcTWiw60QYiz7L2KNKHWa4iYgIja6chQG1dkckyCKAttW4v
         hYJVbSTVVqZTg5kVN564rGyeEcYkd+GRT+jhWbQgUaMV1Q7PwDUDpHCNJM+SRIgoxJfM
         feIXTn/EvbeuD+y8hQrgjIhqAOnBuKlH2EGXLc0fyehsFlUVvHbYWuc0SrasmeTP87UG
         c21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760231; x=1768365031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IF0PSXd7nxzcgib/fF2QxJQOQ3zAiN3r11lfYK9VD2k=;
        b=aINYT4bCbdul19sJT5Kl/ZWyiY8WyQNidVYmffCIIiB8fRLGRwhZsVt3sbI5RX3RCN
         6G0qexeXy290ni85Sllw9+Ka6kzQZAmO8MTpfy7DlVFjF1U2K4fe3M9zbIO6hSnRz9w1
         qm+4cg5Mk1TJsOdhuEyfTXD2zbG9w2jjw9fHNZf/nwI4qVRQb9LWcmJE57KGBaclvp9H
         cj3ck/wb04Z/CJzVnU5mI4R4vw3nfmgefEoSA0qQ+MmgB7eqYeQndnK1yWXqdERRBcir
         BvKthPHtpz7Tfpsrqz2Etdk6Dv+EbJJC1HVqNkWYKb3DPZNZl5gemgCiifX4l73Fs0Sw
         YpfA==
X-Forwarded-Encrypted: i=1; AJvYcCUVxhCIpGksHnf501v/2DNOgTJTiqBX5tsReJAof9DP/s5XAo+1ZDn+7pV+YHGYfwhIby8oz8Lx9fjuDude@vger.kernel.org
X-Gm-Message-State: AOJu0YxPE2p3AfW5Op3oYm3EXGoFx0/dLAOYazHzZf2uyTg4JcI4atZe
	0MOhr/ao/dQ2wM5ZeWUJypzVxpaY6cP1zlQqMzxdGw7smzPVZDsDMWvs
X-Gm-Gg: AY/fxX4rMFBs6+XKSRqvp/fyQn9Sd/kGQGqGQqaUDdAkv4NTJRzww0RPUKn7pbHiCeR
	VHyrk75MPnZw8B24SYkOcWGT28IkPS6s2YTgcjTAxrbp6MNT6O6ot9fYXU1joLiAp2zJUv820Yh
	zsUyW+5cEVr0WVtFe2oECPUdeuVJ5UlKxNVDg9ZafU5W6T4jYJ8YQbP4yAdTGaZDMdUzgyXimLu
	/U4UGaPd1rIIO1DPd98/1Vn+Xt8S+8l35wfz4v5vTMNi6R5NBvG1RQIvLJcbo8F45uz5SIm3EyM
	8DnHukabzW/M1G8V1saAoINrsP8jLKHnVV6VkML0YsYTCoscKBaySiiMpIuTkwZvRygyjJYKevT
	4yJkEz5YtvnAQfJYUrj8GiaoHZ4yNMh8lyP3Fl5kjw0LVuXuG1TzbOEpudLhnUOpU+N5bJ+g7DF
	61+SswPRZHK25X8JKmdQ4sHQlEx+ZYAB5yYRik623lUr1/7zV+x37/8xfCnfX71Eh1MNgVbPN8O
	7k=
X-Google-Smtp-Source: AGHT+IETyC4X98OhIHBp46gznYzJBy3d02/tkM3F4X2Rh0LLVtLU+yZjpl9/TdjSUKepyeyPRAiyrA==
X-Received: by 2002:a05:620a:1904:b0:8b2:f1f3:900e with SMTP id af79cd13be357-8c38941c68dmr155122085a.62.1767760230642;
        Tue, 06 Jan 2026 20:30:30 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6441sm309316385a.7.2026.01.06.20.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:30:30 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 3/5] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Tue,  6 Jan 2026 23:30:42 -0500
Message-ID: <20260107043044.92485-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107043044.92485-1-mailingradian@gmail.com>
References: <20260107043044.92485-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints cannot be pre-defined since dcf6fb89e6f7 ("media: qcom: camss:
remove a check for unavailable CAMSS endpoint") was applied, probing all
endpoint nodes and requiring them to have a remote. There is no sensible
remote in the SoC devicetree because camera sensors are board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b8a8dcbdfbe3..3eb4eaf7b8d7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1776,28 +1776,16 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				camss_port0: port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@1 {
+				camss_port1: port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@2 {
+				camss_port2: port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.52.0


