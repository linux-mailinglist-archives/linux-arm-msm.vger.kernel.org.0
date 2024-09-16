Return-Path: <linux-arm-msm+bounces-31857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AC497A6BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 19:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF3D282476
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88C315B98F;
	Mon, 16 Sep 2024 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3PZC4sx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78FF15B119;
	Mon, 16 Sep 2024 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726507623; cv=none; b=RADY7PA61c+pesGT4uC/Hqtd7whO2BXZN8oyV1Ypda0IMZ3U6D3oEszAl7kxhpy8nnZ0vDWdB19UNfaohTO9gL5ZlSMkFAXCBEJjf8riDsLROb0B7OjamyodV3K9TF76PDo/hi2c+XdVDgYpfMk+icRJNF4LWeyvR1CXUZOAMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726507623; c=relaxed/simple;
	bh=z7EdTYsA6V/W1MQGmwRQQ0qDBVubOwIJcaV8C9pFbP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Za2/ZHrL/oh7sFXWsTHxD0OChAXCjoHSyhaNBEhttpXTls2f12i/0g340Me+vyi724AsoebwMTqKrm0Rje5+Cey8OvYA+hyTzXpXyU5jxn6mpeLVsumumUEfp7uYI5YzziB/c3+nDpSYI0Lba7pu1EpuOH5z7qcy7W4cD3/3KB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3PZC4sx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35274C4AF09;
	Mon, 16 Sep 2024 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726507623;
	bh=z7EdTYsA6V/W1MQGmwRQQ0qDBVubOwIJcaV8C9pFbP0=;
	h=From:To:Cc:Subject:Date:From;
	b=b3PZC4sxX1L5FZFU0wRPV0/FP5Y9E/xMAzKFKfwsvuFFuFBNlH/X3e4m6/6Ni+kz3
	 Ryb6KVUrBUR8kQ7/78YOiCHJtUWeiCKr0oc4Bl/tAdqHJS7VXeZVP8MEEaAh52be24
	 IwnF9HvxDz4mYU9x1g5349jQ3yW4jo8CNpAr3RXNHfyyoeITmGqSoQh0KiL7lIXUi7
	 UUATM98V5JLFt8N3bCRBT23Yr8o9Ty3jN2W41ePwdu7bsYpjgnFi4nQ3O0OvLKkwi4
	 +4RnkDude2/CBmrD8waywbje+YOHPLCycE8UA6bH2Fs1c0bdTOSSFS8WtLP+j+x6Ms
	 q0ATUFcs4pPDw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sqFVS-0000000022u-059e;
	Mon, 16 Sep 2024 19:27:22 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/3] serial: qcom-geni: fix receiver enable
Date: Mon, 16 Sep 2024 19:26:39 +0200
Message-ID: <20240916172642.7814-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a follow-up to the console fixes that have been merged
for 6.12-rc1 but that can interact badly with some pre-existing bugs.

Specifically, the receiver could end up being disabled when
set_termios() races with the console code during boot.

Johan


Johan Hovold (3):
  serial: qcom-geni: fix premature receiver enable
  serial: qcom-geni: fix shutdown race
  serial: qcom-geni: fix receiver enable

 drivers/tty/serial/qcom_geni_serial.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

-- 
2.44.2


