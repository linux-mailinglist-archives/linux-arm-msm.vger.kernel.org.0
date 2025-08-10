Return-Path: <linux-arm-msm+bounces-68239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C5CB1FB71
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 19:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BD603B41D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 17:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765F9274FE8;
	Sun, 10 Aug 2025 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUZurnAY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C233272802;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754847492; cv=none; b=msa6nRKrriI1jnM8hrA7j5okv29MksgXJEzqtFo5Jg8/jDPdZO5Llb6UhV2yDfUq9NsMGuuhVrx0R43HPusILt9gGxwSQz9WTbXPuGdLspEUxnbqXHqL3T4fMcyc8hZc7ma4o7oHsS10shO7tjncYbPnjiVuzlasrnTNwxVlloA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754847492; c=relaxed/simple;
	bh=hSliaqhTVcMgqr1/cO9Z4DSoUMki8UVa5xL53u07jEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myWEKiGtvEbVYWDBfuAJWRgjyzJAhhb8XM2EgbLzZYYp3absepdSzoICRgq4Fk/M7RSnjJ6mW+woLcUUtkyD5X58jxP5ZXfeUELGSljd+VOZW2Ig/Rc+XFgeXqPXnDYPyXOBcNCBreQV1E+hViHZgI0XHsdpBqJD9Hs+JvlXwt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUZurnAY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AA2FC4CEF8;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754847491;
	bh=hSliaqhTVcMgqr1/cO9Z4DSoUMki8UVa5xL53u07jEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PUZurnAYA+bsECDUFGic/maleosg6ahI8RAzO00W6tbPg3guMMmjpjlyhg4u84pUK
	 ghFawTQg581EWMmbKs5pbHzrSjvaIKta/wnLPFzZQu6RQi1YwyBfK4HTYdEprgV6+2
	 ZPLORbum1VRgMW/v5SGLUkTAhPiETjAG2bQ89QefbA0YEIkL3iprnMwei9iNOzN7wy
	 BgbUoc0tsqtm25j9yyfQy00WIGM0sNVGglLTKKv7x2uZ6lfP8l7ar1qSk2uYVX9n7r
	 Ki4v0TWFEPSDlP4dNtJhEbr7TBatUzBpYf1dZ3vOj6E9g8K4EwjiEc59yTy/hJX48H
	 YzzCJnJoYbyqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D824CA0EC0;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 10 Aug 2025 19:37:43 +0200
Subject: [PATCH v10 2/3] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-tb16-dt-v10-2-0bfed6d75c69@oldschoolsolutions.biz>
References: <20250810-tb16-dt-v10-0-0bfed6d75c69@oldschoolsolutions.biz>
In-Reply-To: <20250810-tb16-dt-v10-0-0bfed6d75c69@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754847490; l=938;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=7SGoP85kjraN4KooKfOtScvDadRwFMii72G5N0C9sT0=;
 b=l3LdjHzDc9XHZdp9Q3PEJYsYfXhzCzYgUZnujSIrn0o2RoWyQHEaJueodgRtKWSOG3TEDWEQm
 x+wg3H66p76DEGdAwSEfGeZZVO9utz6DnLlyTUJWNO+UdajvsDPqvV7
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
index 26cd0458aacd67dcd36f065675e969cea97eb465..0562ad23fb6e36a56674139735992b9fbc61f093 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1999,6 +1999,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },

-- 
2.48.1



