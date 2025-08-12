Return-Path: <linux-arm-msm+bounces-68780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E762B227E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 15:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A6D03B29D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E4A279DD8;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceD66Kl4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A132819ADA2;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003792; cv=none; b=mWUDOnm6xz9+2R+4gagSNXslLRVj9G5iqCml5pA98UFtmK2xmDQolfT80iiHeEjTPC9ji7tkdXoGdZ7IXo09d/M+vzS7rexgDUqVplf87U1ut/TVBLRhF48Ll2KhQm8XcNuNOgwfhXT298uyKVv65RU3AQUpSOe2ZuL3u/CtwQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003792; c=relaxed/simple;
	bh=hSliaqhTVcMgqr1/cO9Z4DSoUMki8UVa5xL53u07jEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbcqx5kKq/bBmzzb5L0+r7U61y7cPlVH/zDSa/mh5oZNo1rFN+hhqx8tc2zMMTyucisEoOsLMggBG67RnyoABlKbiX6zKpNsUUtWqEWKVqQaKNopZR7I+NqKGWlCz3nUjdRzn5pFEDhNSz086Quy1gBRoKjjnRii9mITEKMHoDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceD66Kl4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 687ECC4CEF5;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755003792;
	bh=hSliaqhTVcMgqr1/cO9Z4DSoUMki8UVa5xL53u07jEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ceD66Kl44wsazNL/VrQR66sJWRVxe6Jp15A2ERyozVxuisJRWz550VvV/UaiqkO7x
	 4bH4I45DNGohzCWOiZj9oKwDVHAWoaLWw+PLux8ibh68jwgY3Le2IQmlrwotEgHX9y
	 yufM+BL1hIp3jyHxThOGHLW4RouOcQu6/Z3VahJzfD19GffKRBtWGf4SbKBT/eTxg3
	 L6U0mBcX/F7H7MXsZHyeHTQXmG3aZHOMwlIY9Pj14Ha49UFQ+m327iSXIf/Oard0UF
	 f2cQE/8EMPm+n/ti0uU4Hxixo1zN+dp3RBLZnDVM/zGbKj144iHb31hDTlBT1LR0Iy
	 u9ooIcxJWUwQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3A3CA0EDC;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 12 Aug 2025 15:02:49 +0200
Subject: [PATCH v11 2/3] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-tb16-dt-v11-2-4923d2cd7121@oldschoolsolutions.biz>
References: <20250812-tb16-dt-v11-0-4923d2cd7121@oldschoolsolutions.biz>
In-Reply-To: <20250812-tb16-dt-v11-0-4923d2cd7121@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755003790; l=938;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=7SGoP85kjraN4KooKfOtScvDadRwFMii72G5N0C9sT0=;
 b=jlNaJxEsQjoC+Q2K/W5SDN1qHxZ/eMe5/Pe3WzaiRo7juRWCWrY9qtggHnxHeo/FrGYd1jebV
 xhVODEhq2iOAUgGpgr0xBMlLTHQqdxSNh45gK5gLxDz3Z6OjXDxZsOU
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



