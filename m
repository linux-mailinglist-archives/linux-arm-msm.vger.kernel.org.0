Return-Path: <linux-arm-msm+bounces-32770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D198A07D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A51F4B2684D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 11:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9D51991A1;
	Mon, 30 Sep 2024 11:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="l1rpTSby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F49C194A43;
	Mon, 30 Sep 2024 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695316; cv=none; b=AGDM7ArCmn/do8P2/VzS/hNWvSxcRE3ys1YxrMCOn90MGrar4/vHHLPQ+QukXU6PFiloiE+0CUuq8VlLJzdBR1idcTvCH34RR2xmEBBRxsWlPzgZAH7GUh1YgCWhFL10mBGREX50tYzvW6oZaz9WG8tPUk97NwacUT0zTOih6XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695316; c=relaxed/simple;
	bh=ibOj2qloWJnN4ZdS+Mwp9x1nJjOVeivC8IT7smXR1OU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PrmzADRC5mp8ZeSY4rcm8jRdZTgmJTiGwZtZxjOxXfPHg7WNAYFvAnVIm9yOJ7PzwdUSN29GgvHs91GqshcZ24w1BmAtwCrV5WL78RlhFc8t1unkdIGvBJs0A28JWUGkMnN2uHXMhyAx3EvWiVymOaCVlQdFrMnLl8/Cbfb7Mb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=l1rpTSby; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T4DuyXqY2WNs1UMhGZJRfuHg0hQzFciDv1MCkflU6s8=;
  b=l1rpTSbyMFPrnoxqswSp3E28TL7XQh0OULNBc7QyyjP6dtpRZEqnXhfG
   DAnPEVH328ZDLz71/+lmkV3QCCHkjqVOtcC1s4MLfK8SXJLHwqZH33+Ib
   Z3uFAmUlPbxSiAH5RAca5pQa1gDw4Ni8H+qM9WkpI4tjc640D2IRazkU2
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; 
   d="scan'208";a="185956901"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:27 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Bjorn Andersson <andersson@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/35] soc: qcom: qmi: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:21:10 +0200
Message-Id: <20240930112121.95324-25-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

Problems identified using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/soc/qcom/qmi_interface.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index bb98b06e87f8..bc6d6379d8b1 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -195,8 +195,8 @@ static void qmi_send_new_lookup(struct qmi_handle *qmi, struct qmi_service *svc)
  * qmi_add_lookup() - register a new lookup with the name service
  * @qmi:	qmi handle
  * @service:	service id of the request
- * @instance:	instance id of the request
  * @version:	version number of the request
+ * @instance:	instance id of the request
  *
  * Registering a lookup query with the name server will cause the name server
  * to send NEW_SERVER and DEL_SERVER control messages to this socket as


