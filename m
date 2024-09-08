Return-Path: <linux-arm-msm+bounces-31224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D08A9709A6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 22:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 083FB1F215C7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 20:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48207176231;
	Sun,  8 Sep 2024 20:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfYhhrkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6CE3DBB6;
	Sun,  8 Sep 2024 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725826460; cv=none; b=t/shn8K3ExfFsVG49RX072ag4PeKdrZ+3u8OtahOfjgDwKQKAqq23gNksPLNfGi0r418++LY4Nfi80acxKMCj0H6fJ/riH/+I9ouYWIcg1bIHpE3Df4v2akkpm/m7Re3YURFxUNufB5psab9M3abqqS6GLa9wAixg7jpq5xqdm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725826460; c=relaxed/simple;
	bh=A1cKXL9IHIxE98OKHVR2/EtMbL7WXNEhAZJ6jMUklDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JSxxdcPHJifG574dQ/uP30CarK1s5XxegJPcy79o6PYkol/m1AJzhrYAUoi8Y9hphtZYK1TJkzAJ0rGjLRLFDcU+70KCkrZyi4iEcYWOjpW+g3pu3/71guqnFQO9Wt2CISafob1+Bx9X/fh10B1Z9Co4C0s+HrFz3qBvWUoDczk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfYhhrkw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2861EC4CEC3;
	Sun,  8 Sep 2024 20:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725826459;
	bh=A1cKXL9IHIxE98OKHVR2/EtMbL7WXNEhAZJ6jMUklDQ=;
	h=From:Date:Subject:To:Cc:From;
	b=lfYhhrkwDpkb9booIRg4cj4ykUJ/tCVWtPI/G4D0pLe6xPL6C11bjKWS/jEgAqzrx
	 1zuYAj7NxgWJD1/+k3UXwCvacRtEl/v6TfRqv2wyYLyMHn2VLjuTaRrloVGyhStSOr
	 jBauFdQ04sT0T96IKulV93j8coyw67Yzvv84gKf1pWVLZOIJ7ctC51rtD3t4t4qJp2
	 X8kYiQ2/VJUcJVmcY0pcL8JjpH/9105LNQph+iwR/8dliRkRI7l/4bNRIkcsv+lDFR
	 VOVfTODZ0qzrdPQljeTeSIuUtD5f90Fs0PwR6CrUCkhYMg/BLjUp/6A1i9pvRYC4Is
	 kNUc3/HmW3g2g==
From: Simon Horman <horms@kernel.org>
Date: Sun, 08 Sep 2024 21:14:14 +0100
Subject: [PATCH] MAINTAINERS: Qualcomm SoC: Match reserved-memory bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-qcom-glob-v1-1-94a390f36744@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJUF3mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwML3cLk/Fzd9Jz8JF2zVGMjE0PTNPM0szQloPqCotS0zAqwWdGxtbU
 AvQ4EulsAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0

commit 8b90269ee6d7 ("MAINTAINERS: Split Qualcomm SoC and linux-arm-msm
entries") included an entry for .../bindings/reserved-memory/qcom.
However, it appears that this should have been a glob as although
there are files that start with that path, no file matches that exact
path.

Address this by making the entry a glob.

Flagged by make htmldocs as:
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom

Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Simon Horman <horms@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b599269a821..da7594a32ae1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2754,7 +2754,7 @@ F:	Documentation/devicetree/bindings/arm/qcom.yaml
 F:	Documentation/devicetree/bindings/bus/qcom*
 F:	Documentation/devicetree/bindings/cache/qcom,llcc.yaml
 F:	Documentation/devicetree/bindings/firmware/qcom,scm.yaml
-F:	Documentation/devicetree/bindings/reserved-memory/qcom
+F:	Documentation/devicetree/bindings/reserved-memory/qcom*
 F:	Documentation/devicetree/bindings/soc/qcom/
 F:	arch/arm/boot/dts/qcom/
 F:	arch/arm/configs/qcom_defconfig


