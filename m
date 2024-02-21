Return-Path: <linux-arm-msm+bounces-12014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0C485D507
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 11:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F71D1C20CAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 10:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51534CB2E;
	Wed, 21 Feb 2024 09:54:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DB641C7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708509269; cv=none; b=qRHeeIhSMiAH+7iPYNEt7NoGB8NcpQ94bWKNxD5Lyn1VPj4pL2nbuSeM8aMbhREb7Jc2xytQF97FWj0EeJKLVySfohF/8khlM3EttVq1YgV8bZ4fhjbhmFh0wMA/dbZ03EixLi/lGBVcA5fyHj7ci0DpjSKhaU1IxnjTsS+bTBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708509269; c=relaxed/simple;
	bh=4jrgDTIItOaqzUueSGfkLHel//P9YB1P9vaM2W3h81k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=USoJCa97/9qpqlDY0HEKNwZ94OmFg+LW9pvcDBshJrQ1KoaN11PdVm7GhY8cpsOxS2ifWMGGZVTX2cF4h87BJQlWbndOqbISPmga8PjuUUlxhbtv9QR5LOUyKgOQXdS66NuC0/a/WpLB4dDP1K3aNi4lkjX6hMCe8J/vV/Apm9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcjIq-0007GT-3K; Wed, 21 Feb 2024 10:54:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcjIo-0020pI-8r; Wed, 21 Feb 2024 10:54:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcjIo-008mZ2-0W;
	Wed, 21 Feb 2024 10:54:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Tomas Winkler <tomas.winkler@intel.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <keescook@chromium.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>
Subject: [PATCH 00/11] misc: Convert to platform remove callback returning void
Date: Wed, 21 Feb 2024 10:53:44 +0100
Message-ID: <cover.1708508896.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=4jrgDTIItOaqzUueSGfkLHel//P9YB1P9vaM2W3h81k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl1cgqTOtIAO8z59oSIx/sIvhuKH1+b51NAFFWR 3bkknjc77KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdXIKgAKCRCPgPtYfRL+ Tk2MCACCKkCdjbNZyc29xxFm4VWa+DhS4+htkcYrw+AdxDNVtW4qk33M6GeSdZmSv2NHyRXr6/e eN0IlmfFp1fVqxEGMnYT8GDi23GMW10uOku+Lfn67lM0aeNnpY7zfosgREfEoNKbM/i5vWpoZHp brAQt+3AmSOat2+Ti1HlNfBW6HUGna/AG7Ymg44ojVw57dZg5/zrML+ZNcq0Z8aKVkDMojJ117Y NKTYvX4AR5Cq4ed/0UoJUPGi+OrhYSbO9+mj6sj298JriIeXAhhVaO7iRejCq4N53L4tXaePU3P Y1hef+xmfdWUvxcS+rNEwgwOHiSwDgSg4f56iCTdzP8ZN9FP
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

Hello,

this series converts all drivers below drivers/misc to struct
platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
Provide a remove callback that returns no value") for an extended
explanation and the eventual goal.

All conversations are trivial, because their .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, so they could be
picked up individually. But I'd hope that Greg or Arnd picks them up all
together.

Best regards
Uwe

Uwe Kleine-König (11):
  misc: atmel-ssc: Convert to platform remove callback returning void
  cxl: Convert to platform remove callback returning void
  misc: fastrpc: Convert to platform remove callback returning void
  misc: hisi_hikey_usb: Convert to platform remove callback returning
    void
  mei: vsc: Convert to platform remove callback returning void
  misc: open-dice: Convert to platform remove callback returning void
  misc: sram: Convert to platform remove callback returning void
  misc: ti-st: st_kim: Convert to platform remove callback returning
    void
  misc: vcpu_stall_detector: Convert to platform remove callback
    returning void
  misc: xilinx_sdfec: Convert to platform remove callback returning void
  misc: xilinx_tmr_inject: Convert to platform remove callback returning
    void

 drivers/misc/atmel-ssc.c           | 6 ++----
 drivers/misc/cxl/of.c              | 5 ++---
 drivers/misc/fastrpc.c             | 6 ++----
 drivers/misc/hisi_hikey_usb.c      | 6 ++----
 drivers/misc/mei/platform-vsc.c    | 6 ++----
 drivers/misc/open-dice.c           | 5 ++---
 drivers/misc/sram.c                | 6 ++----
 drivers/misc/ti-st/st_kim.c        | 5 ++---
 drivers/misc/vcpu_stall_detector.c | 6 ++----
 drivers/misc/xilinx_sdfec.c        | 5 ++---
 drivers/misc/xilinx_tmr_inject.c   | 5 ++---
 11 files changed, 22 insertions(+), 39 deletions(-)


base-commit: 4893c639cc3659cefaa675bf1e59f4e7571afb5c
-- 
2.43.0


