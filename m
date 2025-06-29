Return-Path: <linux-arm-msm+bounces-62986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC37AECF16
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 19:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C9BC1894D17
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 17:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA052238C03;
	Sun, 29 Jun 2025 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vh90UhkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0C2226D0A;
	Sun, 29 Jun 2025 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217925; cv=none; b=bCBu4Daj7/NIF9YimNkp1F2FiTixFr0IUK5jWLdox03YP9LoHEd1obcfbKxaPJPxLop0aHN+RX2evGlexCBxNCHMhhf+imwGj78YZRXaK/S8MUGT098dbfbCuMnM0WAM+4AfcKxk6HStHo0V5W88VIsffcl/imJjYRWIs+NCWFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217925; c=relaxed/simple;
	bh=Kt22/lukqS2+HqkdwTHgDv3CcrBaoQEscBdWrxhlPhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i96Ch+Z3JDv0Dg2D98bg6szJfdiW7Vik8+YTpkdiHLyz75SBWx8R4Mtje3/jYGbreATntuYLU8GKR9f1VDnU+j9vINlmKLp819SE4PxK1WFUqwFmZ08ozbJPGk//9l74LM8jS2ezTRY5DX75/LgsCKXPScf2rUhvlyTJSSJR2Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vh90UhkD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AEB3C4AF0B;
	Sun, 29 Jun 2025 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751217925;
	bh=Kt22/lukqS2+HqkdwTHgDv3CcrBaoQEscBdWrxhlPhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vh90UhkDsdQaLSOi8M1fT3e06bORbwmnlXdZ0Sn0rNlKYDpvk1Ft0Gb4Bxh7zhgfn
	 +C2zR1d7KuxIEl4FnYJcyW5dDxV+gKwQ5oM/lqO2UJ8rmTsB2xdyBfbbnoMGJFIP3N
	 u0+i39ChQvdLoVsQjnoyZlLa7bHHIj5fPZSnX1lnnc1h2kZXlENM2c7zrHr2Hlr9TB
	 Jt7rhjTka1PNlpFUVtNN7LLUfLD81j0tD9JMtWujCat6naUWdqS27/j2g6RTFcmHny
	 M6gCo4o74MwNtlZXNe4xlVEvRTpji4DhZ1Stx/QpaYAo9L2rZWlIM4ItNB8RuRwGOb
	 Z70XfYa5PaFNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4B1C7EE30;
	Sun, 29 Jun 2025 17:25:25 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 29 Jun 2025 19:25:24 +0200
Subject: [PATCH v7 3/4] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-tb16-dt-v7-3-35276341338f@oldschoolsolutions.biz>
References: <20250629-tb16-dt-v7-0-35276341338f@oldschoolsolutions.biz>
In-Reply-To: <20250629-tb16-dt-v7-0-35276341338f@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751217923; l=938;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=slRI2ekwNMu7Wtu7d7VJFMn+7WTFlY44tFMAJ5L6BoA=;
 b=SkI0IGHIABKkPWf+78Oy52lmxLkJbDKP4iDfsYxGkTngbL9fB3apnvh6qjue7ffffDJ5JB6dB
 IbI1FPQ1UCUATZzf86WqgmJydUOZk8lpMjNeEz1XfwII9GOJJ5NL/eP
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



