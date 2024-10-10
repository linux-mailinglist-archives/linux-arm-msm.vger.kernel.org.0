Return-Path: <linux-arm-msm+bounces-33807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF53997FC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F855B23A8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2841FCC4D;
	Thu, 10 Oct 2024 07:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVtLcd07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07D91C5796;
	Thu, 10 Oct 2024 07:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546292; cv=none; b=mOmI4nSEsgZynwVi2+8nGZh7y5cOyUrkonKDAyiztk1Cg7alk5OYfh1+O54ANF+T26iSqdJFBc1C5wAlFYAGekMoJkBthY0HZpx/52n/h3FYWLdh5ZH1UGj/kOrIRlMgv7wyxyo2/DTMOaF27KFkbfNSrY8t53qZMk/NLZJjKVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546292; c=relaxed/simple;
	bh=A20Cxip7h9+hwVZDDL8T9b50iOLKZr6WhzudD6Hbq8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ORC6tS/HsJQS7bLmdieex06A4qw8f4QQdytxOUVHUa/MwR33Nl7gFE31sup8fYDl2YvabHckX5KNya5gukFnPTvNmvY6+CZpxsxGkXw2+es8X7CZZfYaVcuc60bsaojQuWBBoxthmOcv8Z5xBlTDRSIavVK1XkntxJCIVxnvqr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVtLcd07; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74114C4CEC5;
	Thu, 10 Oct 2024 07:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728546291;
	bh=A20Cxip7h9+hwVZDDL8T9b50iOLKZr6WhzudD6Hbq8E=;
	h=From:To:Cc:Subject:Date:From;
	b=MVtLcd07As1FA0eLjjXzFN7+2Swv38YSrDFoGa3CM0hUn3GteVeYvK/K6GbutNxyJ
	 vjlDlXQvGS/VBAbX3ZZCEvXsot4rB4RsSwfJcg3/iUfmensZhh6sozHLAzkLClf1wm
	 ERA7MFbVmLEXnYzNuRRpWiPJ3f+MyRAq53vDlKkrYE4p/pZjISE9wB4EpaS6m/X0n2
	 lyAeW5//o1dMahL7tk0EE59nISwuCH8/hgJUFfyHylNX3a9y6bhImaE+tzIoYUaVlT
	 ZhdZRoz06h/FdeFVOC3Y7k+DKJwAcoVi+wn03Fm2l858YxGRv4nFuINL4nrhCY4zpg
	 iyls+R2aC7o9w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1synqw-0000000047M-3YFJ;
	Thu, 10 Oct 2024 09:44:55 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] soc: qcom: mark pd-mapper as broken
Date: Thu, 10 Oct 2024 09:42:46 +0200
Message-ID: <20241010074246.15725-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using the in-kernel pd-mapper on x1e80100, client drivers often
fail to communicate with the firmware during boot, which specifically
breaks battery and USB-C altmode notifications. This has been observed
to happen on almost every second boot (41%) but likely depends on probe
order:

    pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
    pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125

    ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125

    qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications

In the same setup audio also fails to probe albeit much more rarely:

    PDR: avs/audio get domain list txn wait failed: -110
    PDR: service lookup for avs/audio failed: -110

Chris Lew has provided an analysis and is working on a fix for the
ECANCELED (125) errors, but it is not yet clear whether this will also
address the audio regression.

Even if this was first observed on x1e80100 there is currently no reason
to believe that these issues are specific to that platform.

Disable the in-kernel pd-mapper for now, and make sure to backport this
to stable to prevent users and distros from migrating away from the
user-space service.

Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
Cc: stable@vger.kernel.org	# 6.11
Link: https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

It's now been over two months since I reported this regression, and even
if we seem to be making some progress on at least some of these issues I
think we need disable the pd-mapper temporarily until the fixes are in
place (e.g. to prevent distros from dropping the user-space service).

Johan


#regzbot introduced: 1ebcde047c54


 drivers/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 74b9121240f8..35ddab9338d4 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -78,6 +78,7 @@ config QCOM_PD_MAPPER
 	select QCOM_PDR_MSG
 	select AUXILIARY_BUS
 	depends on NET && QRTR && (ARCH_QCOM || COMPILE_TEST)
+	depends on BROKEN
 	default QCOM_RPROC_COMMON
 	help
 	  The Protection Domain Mapper maps registered services to the domains
-- 
2.45.2


