Return-Path: <linux-arm-msm+bounces-83200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EA3C83ED5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6CF53AB94D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02112FF166;
	Tue, 25 Nov 2025 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="RsrwLh6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3CF2FE58C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058422; cv=none; b=j7JVY9FaFwEVA52qOMcQycIyaT5PiB4fjM3eGRx2YIBFWA/To4uqMl1XiGYJE5uNfLvlXkoJEkWEyG7eGZYSbVClxOSwT/rNMPRhQkJ6Lk7vnbf6MhmS6/bjm6Z/rLw8rjjz/s7y0A251Ih7ThDBc+tYdiWdSyeDRuiNkXyOiwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058422; c=relaxed/simple;
	bh=6kUagx2PLiZQhoylE2iSEeJcK7M54MweGvTnZ2pJddo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jyW8gki0r2o5FqCIJC/IgcJ7eYy644zP03W6dcXJ3fb7XOPHF3bXOHnGhxQVKNqmHp+6zjUESBeyfKZEFWRL09K6IFOYaTTji8qVaSKm359Gob3Nxp3ZMPl7UB40TWrfu0faUMf4INZJzGYjeSByGnOrEbKq1oNZfpTQcrkYmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=RsrwLh6a; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YLExmy7DtIyQmmY4byQYrWIkfY+f+HEvOImGQCGaoM=;
	b=RsrwLh6amVdu3eAxQTVH34sQecPfoAnGpjeunPuAE39+WdqcmJ3OhgOH0WEdMhP7NWd7s3
	dvpyl3QwNgWNHFOONaZK8VmFx/NrulvdyPgoWBQsHhFMF2e2rDkmg2jtq9jw9ZjT0FKmMq
	XJ5rJbr3w9K5muUFKCc4fLB/foGHcNeqqEuX1lK7QRw6lOl4jK4ASgnWdsZ6jfIV5HjuWb
	jaSTJFQe13sJtIFVFtCArpbr2CGVh2lJ4sEJvdPxanagQJfkO+l4ErNYtJxq9gNt9PFK4w
	qwWoq8ziMnNIulTI3SApq1OLDHv1HtgTlGs4JLjB/iE011jmc67DT3Dr05x7Xg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:42 -0800
Subject: [PATCH v4 12/12] arm64: dts: qcom: sdm845-lg-common: remove
 framebuffer reserved-mem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-12-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=918;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=6kUagx2PLiZQhoylE2iSEeJcK7M54MweGvTnZ2pJddo=;
 b=V6LvTHiJou5wkswaPKURVe4apup8STlNXXyy8wthzabfuBzip3HQpUo6b+G2gbOFkZOniC/Kr
 FU6XkvAoZcwC5hlPGNcVo1VxA6pxE/MogZPyRZzMwb5h++SpRlQAdjk
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

It causes this warning

[ 0.000000] OF: reserved mem: OVERLAP DETECTED!
framebuffer@9d400000
(0x000000009d400000--0x000000009f800000) overlaps with
memory@9d400000 (0x000000009d400000--0x000000009f800000)

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 0ba4a2b42028..472a0519c690 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -98,12 +98,6 @@ spss_mem: memory@99000000 {
 			no-map;
 		};
 
-		/* Framebuffer region */
-		memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x2400000>;
-			no-map;
-		};
-
 		qseecom_mem: memory@b2000000 {
 			reg = <0 0xb2000000 0 0x1800000>;
 			no-map;

-- 
2.52.0


