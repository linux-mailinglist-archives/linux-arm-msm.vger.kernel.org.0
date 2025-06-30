Return-Path: <linux-arm-msm+bounces-63118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBDDAEE732
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 21:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 562413BF6A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 19:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F382E888A;
	Mon, 30 Jun 2025 19:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avT2fft+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F028AB11;
	Mon, 30 Jun 2025 19:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310403; cv=none; b=kXxzYAitNMrdCQdrPb35Jz7hU7yAAzai5mMGH1DuXySw2U9thxdgPdGAcqKBnXL1Wy+2/FH2fW7OfRrs4+hHCIDQ8zrbzrJA4G8uSDoJ1a0I2KuOn4tEGKRaw8GsHKaDGKrlxw8NihoXRDxSIelpE3t8dqlBZil7C2j7UAuenXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310403; c=relaxed/simple;
	bh=Kt22/lukqS2+HqkdwTHgDv3CcrBaoQEscBdWrxhlPhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcjTvpe1aGxdyjRblE6d3T0sP2sgSyorp4n2DGjKNhxt8duzcwC1Ah0npgqrdblI2VwRChWCIfVgko8gQxVcX/yFaiTLRDovJlqmKxPIuPPbc4jGVaM7F7OcW+7c4TscYM+uAyDZn3qQ3kNsnHrX5kR/vBKl1sZkl4utfIfo9Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avT2fft+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0BABC4CEF4;
	Mon, 30 Jun 2025 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751310403;
	bh=Kt22/lukqS2+HqkdwTHgDv3CcrBaoQEscBdWrxhlPhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=avT2fft+m43iyP1p1KrVhoqIkKuDwjVPqvXyIy9yvHgQhm/u38lEiFXgzTsyrR9b1
	 ioGaaCBm5rHFOTTSZ/YfnX0jqmolIt2bdHwV+hsfNO7F40XgFWl3tM4ni1ErKUs0li
	 D5MSJ+4WU6dwy7HYijc5/akhnh5TwUO5OdjTqAJagRi8eFWFG7cMD4/ApLNHQIxrZ3
	 WeacYQHm96hgbhTn1gn1YVNpdpQmBXujzwkyevixcBiRdP5J7+uILMLtrH7clZcFaP
	 vIOFyMEuOtCg+dqa1nYzATzzHo3gO5b11WQhoygag/N18JJtSjlUbt1nhy/Rg7f6m1
	 50Z7kLoy9C0cw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73D5C83036;
	Mon, 30 Jun 2025 19:06:42 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Mon, 30 Jun 2025 21:06:41 +0200
Subject: [PATCH v8 3/4] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-tb16-dt-v8-3-cf42a396e736@oldschoolsolutions.biz>
References: <20250630-tb16-dt-v8-0-cf42a396e736@oldschoolsolutions.biz>
In-Reply-To: <20250630-tb16-dt-v8-0-cf42a396e736@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751310400; l=938;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=slRI2ekwNMu7Wtu7d7VJFMn+7WTFlY44tFMAJ5L6BoA=;
 b=AwKtCMzLyqZ0wZj+ZhDmojHszKsq+M0CQpSA5HqWwOZ8itlHEA56vdDveAf5iyfdO0r92oQ5P
 x6ifLiHs4hiD1NR7GJf9OTOVij7oZHA8qeaRumxrAt5oAIGv7qn/f0c
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



