Return-Path: <linux-arm-msm+bounces-13871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D6B878A31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 22:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47CBBB20C15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 21:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF69756B8F;
	Mon, 11 Mar 2024 21:50:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252056B88
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 21:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710193806; cv=none; b=syUWJuaQCNS4/vWrUtRcF3JOCPq86iQe6b/3e8ZTJ0Jb6c4jHVF/ndzrsVu/0L/T/4kUW2Zp8RfxMY+9/RwBrVjjDTxxrcJsaTk9oocIKlnOWy/CSOpQ5wdQDd/VDXPJ78ZO6KMROO5dRQYwPwgL8mMFJJSqf+v/eyOI/mqxa3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710193806; c=relaxed/simple;
	bh=qKQpzW9kAD5OFqsxnkBuHxEnFn+Xt0RSWhw0KUNSgiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pEBN7Od1JGZfo+Lt7XaYyVTXckMZO3NMScRSPCXden8THvAAZwl32KYX8AYHUqujr9mzejJEDnA4JitlzOENZSNEcVhSWjL++VIM9iHbzaVDYmfRAgEOp7Lji/SQqX2JE8Ku8Repcgc0sZAIkRXvfi6uvTFiI8iMg35adtLDkBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjnWz-0003DU-Kh; Mon, 11 Mar 2024 22:50:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjnWy-005nDh-Tm; Mon, 11 Mar 2024 22:50:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjnWy-004IoQ-2h;
	Mon, 11 Mar 2024 22:50:00 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 0/3] Bluetooth: Convert to platform remove callback returning void
Date: Mon, 11 Mar 2024 22:49:51 +0100
Message-ID: <cover.1710193561.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=qKQpzW9kAD5OFqsxnkBuHxEnFn+Xt0RSWhw0KUNSgiE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl73yBbAjUoaqtaTXZugvz5BPDzliyqXDxGTilM ccRRuvR5TiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZe98gQAKCRCPgPtYfRL+ TpKkB/9d6ElVG+OXjQotKKA3hf2VVxJY8lbwztB288Y+FN8C6Xwi+7eXyX5UKmlzcDZz6LoeW6j ziyodAqS2tG3j9I3MZo1fzGEW7sdaTt4OZNOgiYxWE94NFKnxy27A/Gy0BUW5aczKm01zGop2PC 3CxRQMeTwqRznTh9BgCqAJw4uU8JCeMmh6Pd8GPdLNR06rC37j8vDd2IZCUZQXKqd9rdmdII4W4 dGbQqTJhGk/8M1OlMhLjwO/jDlvU/iUIAITajXAU6JUasDyGaWXPul5LRV0Cww8ptQf0PUQaZYC PDNFC5tsl2WSxoxD8KeWV2Z36p3L1OCVrcX0VGdqAyDLT74P
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

Hello,

this series converts all platform drivers below drivers/bluetooth to
stop using struct platform_driver::remove(). See commit 5c5a7680e67b
("platform: Provide a remove callback that returns no value") for an
extended explanation and the eventual goal.

All conversations are trivial, because the driver's .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, still I'd expect
them to be picked up together. This is merge window material.

Best regards
Uwe

Uwe Kleine-König (3):
  Bluetooth: btqcomsmd: Convert to platform remove callback returning void
  Bluetooth: hci_bcm: Convert to platform remove callback returning void
  Bluetooth: hci_intel: Convert to platform remove callback returning void

 drivers/bluetooth/btqcomsmd.c | 6 ++----
 drivers/bluetooth/hci_bcm.c   | 6 ++----
 drivers/bluetooth/hci_intel.c | 6 ++----
 3 files changed, 6 insertions(+), 12 deletions(-)

base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.43.0


