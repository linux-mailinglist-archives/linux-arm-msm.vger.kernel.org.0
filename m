Return-Path: <linux-arm-msm+bounces-65203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A284DB07317
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCE603B1D6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F5A2F508C;
	Wed, 16 Jul 2025 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxcZwS4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4612EA158;
	Wed, 16 Jul 2025 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661006; cv=none; b=h/4441C3ZYBMV4PP8qZBxH8LAvASXS0Oi2S7ysU3cHDG6bq/W7TmSqbKlwaRyIecuGsMWXUvyleTJlY2gYVP6WCH8Wy9P3EUgJVKqcjft7Bkt8c7akHXU2E8q/Zn9B2+rV47FjQ5bLChkqc+bzMCsn3M57aBHuwF0G9KIBB/OUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661006; c=relaxed/simple;
	bh=XT9cXOKCmgl+ldwrsrHzx8+e2njm2xgZ6MA6eRd2e/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHuH3zVplTeGXYXrX+YA2/lMvA7B0CVzhxGdu+HnZrc+O8Lnloptxre+CtKgwSJe1RdxIep0n4pl/l1LelIqcIs84cdnWrDgkGpVKu24PHAb+3YvUWqM3fwiYuJ3NeCkCRB0bsd2xMHLIEjjEbJysaSisZzKpF98kHJAr1K9Q70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxcZwS4a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE950C4CEF1;
	Wed, 16 Jul 2025 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752661004;
	bh=XT9cXOKCmgl+ldwrsrHzx8+e2njm2xgZ6MA6eRd2e/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LxcZwS4aCnkKDwRprVZ6dIySrzUO2MocrydHWue/iOuPpLgSEvTwNrEg0h3f3EF6i
	 Sb4gUi2vhzfyem5XOWmJMa4rmCJJD1kpdjVaIA9NoQtQaP0AUJ1dMk62mxeHrjq+dE
	 qEE82XVL6VH2M0jlIrFl/LRKxFNIN6zyZgEut36q26nThcrpv95YtIJXY9f2QjTEYa
	 D2f9+kKHQk09fWT0Msq0IFEljX9xz9OPn3fiEOe8/5iYipAw95KGOj8ttxUvpqinNp
	 R6Zntx3xNm/i1UjTvEw+Qc7AiBhySpFTNsV75LquyGPBEWCFEkG6DEDhydjL3uGrkH
	 5Cr56zlrxRLCg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 16 Jul 2025 12:16:10 +0200
Subject: [PATCH v2 4/4] MAINTAINERS: Remove sdm845-cheza device trees
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-topic-goodnight_cheza-v2-4-6fa8d3261813@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752660979; l=865;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ANVp9wD1JKerNgZkOFesI2FiXPrTvVkvGY5Hg/6LtoA=;
 b=qAkxUuVfq2BgTuvJ55zGB+Qi2KJW+DlZZqVzcXUyp80yzPuP4rZbQ+3K+h4pndYjSXVkqT85t
 nuAx28SbwTqDRfiIdrqHZl5cmxa9zQNkE5WnrvbgDQ6nobfM+Xnp5EO
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Cheza was a prototype board, used for developing Snapdragon platform
support on ChromeOS.

Since almost none are left in existence, and none are left in use, the
device trees for that family of devices are being removed.

Clean up the maintainers entry with it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5efcdb5537f52b84a57505857399af70f0fa7e45..1458ff091a864e539c554ef9e915331c44c87370 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3071,7 +3071,6 @@ ARM/QUALCOMM CHROMEBOOK SUPPORT
 R:	cros-qcom-dts-watchers@chromium.org
 F:	arch/arm64/boot/dts/qcom/sc7180*
 F:	arch/arm64/boot/dts/qcom/sc7280*
-F:	arch/arm64/boot/dts/qcom/sdm845-cheza*
 
 ARM/QUALCOMM MAILING LIST
 L:	linux-arm-msm@vger.kernel.org

-- 
2.50.1


