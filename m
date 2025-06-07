Return-Path: <linux-arm-msm+bounces-60526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 636C6AD0F09
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 21:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CBE33AE389
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 19:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCBD215798;
	Sat,  7 Jun 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udAigpdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671301E2853;
	Sat,  7 Jun 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749323980; cv=none; b=buOFEo4EkGV5spvMkKBP5f2YAiSifwSQ6Y12YEOywOhm/p5jhRj1MlBXkMf+tQoDL2FNl9weCZadMY9sqHF+qh14zSLkgGHn9Wq7qnAnMjmIi0YRBDixATGPlftTUYL4LwaQI+376+RVV8Fpuz3aCQH7TGMsA+XINT8HlWcOUR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749323980; c=relaxed/simple;
	bh=Kt22/lukqS2+HqkdwTHgDv3CcrBaoQEscBdWrxhlPhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAt5+PjdHJjU0/IQOvR+7j6YkE4dTrKrR7kqvRZr8YA5G7oM6QAaV+c1prziXfLG9QjIWqUm6WrncLFOlvURwfdtvVTAyDjFU+QhvIWPWK9+atY4bwhwM+KtnlukEftzyFXPguXDHBn2MyrwI8Kz66XQQOD4hHh4nQElULA6Ya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udAigpdn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0291DC4CEF2;
	Sat,  7 Jun 2025 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749323980;
	bh=Kt22/lukqS2+HqkdwTHgDv3CcrBaoQEscBdWrxhlPhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=udAigpdngMunKKUvWTqNUFzLa5xT47meJK1D07/qqln8VWjpY6hqmD/Dbi5TFswJq
	 tDhdETuhjdbZZ/ReCQl1YnRW0FH2MWRV5Q4mIetQ4OOe9hOb99VEpt8qXQGOchuFq/
	 JeJPtiXO9jhswWRcvTBerahf1SOTpkoRtysRwBhCvmZOeo1kokpg/RHF8EoC2egajk
	 dcLKUzly6d0LCVOY61GWWs0AMp2fknJnJ0QY6cNCtVUalvvN5krPLkGPfuTVYOaNNV
	 0aXQlPol+6ACEeypS15ATFuEr6/ottktL206MVXvGopbcXOh7YjBaYSve/4oLpTvHs
	 vOcUi8Myygu6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A93C61CE8;
	Sat,  7 Jun 2025 19:19:39 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 07 Jun 2025 21:19:38 +0200
Subject: [PATCH v6 3/4] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-tb16-dt-v6-3-61a31914ee72@oldschoolsolutions.biz>
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
In-Reply-To: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749323978; l=938;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=slRI2ekwNMu7Wtu7d7VJFMn+7WTFlY44tFMAJ5L6BoA=;
 b=Gwpbta7IF9nMrQHMt4pBxCZjwuyNvDa9pqc7ajsStH7B3+zaaId0aY/kX75iXpnnQ4NzkuA68
 CkPHZcqLnvmAFqKrFbdFdQU4HH1vVGamX895YrnR8YiPpD9LPxjRwSc
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Allow particular machine accessing eg. efivars.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b027550ae3a987e784f0814ea6d678..171cc2a6502463e3445919ef77a129563ea233a4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1993,6 +1993,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },

-- 
2.48.1



