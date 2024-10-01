Return-Path: <linux-arm-msm+bounces-32873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1198BCB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9701B21C90
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6565E1C32EF;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSZi5v7i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3AB1C244E;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787071; cv=none; b=UFwtgOiLhDsDhobkIkONpT1b6D+GlkSp+5WVRRARudBX+nJyvqiL82o/bd/A0s9XitqmhIqUOkDnkTwYEwww204CIVPtBwWMqrkOGk+dF8qpvOr9b1U/qVyRSDa6ywo3K9yARqJAXqI2MjXzL6473xB72hk2fieYapzuMFnRMKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787071; c=relaxed/simple;
	bh=WLDIhMn1vbPa9/NIV8lQ9gqz/PY4jsXJHNNZ8fGZEyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzfhVMGlZ24qA7Aon+Q2goOanwJjRXlBd1/s+tWqsK2Lq1oUxAhGj7r4d0q/ncuzm1OQF/lYxvKYPmnsrvsEAPwybLFElbTZXfuQu8rZZaU+BMOxFWzVTBoKAUY1rQ+YATKV3Gf0Lxq3YPf4f62NpmPJChrPie8XuNx9EZCDKx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSZi5v7i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8CFC4CEC6;
	Tue,  1 Oct 2024 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787070;
	bh=WLDIhMn1vbPa9/NIV8lQ9gqz/PY4jsXJHNNZ8fGZEyI=;
	h=From:To:Cc:Subject:Date:From;
	b=WSZi5v7i7+Mt5JgY+fV5uOUxVUc+MbkFm724I2cJmj90qAk2lAH6DNemN2VNpc6v6
	 tYI8d0lKX5pFihjA12egY4LWqQ1jTB9dbJTSK5ZJryH1ZuYiR/aT2dcdoXrFBzUZpC
	 E014RO1UsMptpHVjeAyk4jyjS55SRDM0JE1loBFzRINto8V3vPLeFAzdObuhUDFhcT
	 aiYhNi98OdgorXgIApThVPgVvvEJ6g9CwwgENotsEyUUeiuUjsVACCLuk7iELNQghw
	 rhKGRgbPhQXH+zydtzMBM/eLZwf9oqFq0XBC4exi9bDNMF4XYAL7644TunkAwBbo+b
	 B/9CMSIaGT7MQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svcLO-000000002mC-0YcU;
	Tue, 01 Oct 2024 14:51:10 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/7] serial: qcom-geni: fix receiver enable
Date: Tue,  1 Oct 2024 14:50:26 +0200
Message-ID: <20241001125033.10625-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a follow up to the console fixes in 6.12-rc1 that can
interact badly with some pre-existing bugs.

Specifically, the receiver could end up being disabled when
set_termios() races with the console code during boot.

Fixing the missing locking in set_termios() exposes another
long-standing bug in the DMA implementation (e.g. used for Bluetooth),
which is also fixed in v2.

Johan


Changes in v2
 - keep the call to stop rx in shutdown() which is called also on
   hangups
 - fix rx dma cancellation
 - fix rx cancel dma status bit
 - drop flip buffer WARN()
 - drop unused receive parameter

Johan Hovold (7):
  serial: qcom-geni: fix premature receiver enable
  serial: qcom-geni: fix shutdown race
  serial: qcom-geni: fix dma rx cancellation
  serial: qcom-geni: fix receiver enable
  serial: qcom-geni: fix rx cancel dma status bit
  serial: qcom-geni: drop flip buffer WARN()
  serial: qcom-geni: drop unused receive parameter

 drivers/tty/serial/qcom_geni_serial.c | 40 +++++++++++++++++----------
 include/linux/soc/qcom/geni-se.h      |  2 +-
 2 files changed, 27 insertions(+), 15 deletions(-)

-- 
2.45.2


