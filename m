Return-Path: <linux-arm-msm+bounces-25260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A869273D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF1BD289E6A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 10:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91011AB8FC;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQkuvRu0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8741A01DE;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088361; cv=none; b=CAGsyUvmyJWTrsnJqRzjUbVN4f73mtQuj5Z2B+jiKVvSaj5fbZYf2bTw/vaV3iU1XA+s55SWrcunXIu0dkGQB9Whw0HnNgi/T1WskIo9gxv6AvBJKk4vMaC1Qc7RN+E4WnHyEk3GKN9zw7yCinyoPaJS9EWpIFQxIUHBIr1FvQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088361; c=relaxed/simple;
	bh=yC9f+13GlnQBZfPodnuKrBIAUjBeF0HnvZN2s4amVgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Afj51X75CNTYIR6TbhkYfSwVUKlxqbo5Y8BCT7LTAy3MH5GMpOjyGdPBCrMrbEtFbwOrOr/4nfD1J3F7u8bqwKasqodzHdiCILfvE0+ivbHiZjvNOXgB/jiY32DJyHHVIA628S6DfXaf6V7sh8HcKlMtdnTuzci8fY4VVjpmLww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQkuvRu0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2517BC3277B;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720088361;
	bh=yC9f+13GlnQBZfPodnuKrBIAUjBeF0HnvZN2s4amVgw=;
	h=From:To:Cc:Subject:Date:From;
	b=IQkuvRu00G0PLTyvwwwQDE2g1kUihrAd4Td1HUtsWgyiujuykBCjpwViOnxlJMQ+K
	 Crd5gciK55I+pZWE8DwXxZddjIrTk8VKwZaMa+ntmAF0kogxcZWEk9MVzgzrKpJQtU
	 p9GUKrL4o0sXjOZLTDrM3GpPhiZttfdAnae0218nDZEPhJ3zzXCNhISwm9sX+aUjj2
	 PqCX/Kp3M6S4aGNd+1p8wyDuFIpnGCc7W3FkAlhOgECpOrW72hP7YiKNio2unFXumV
	 dT4QI/OqBmEYWAGfOSYrOs9yiczr5t4HdHELh04enZFUyr5D7DSGcXdiMe6rwgdU1q
	 9gr4ONOYcP4nw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sPJYe-000000007zL-1NZQ;
	Thu, 04 Jul 2024 12:19:21 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/3] serial: qcom-geni: fix lockups
Date: Thu,  4 Jul 2024 12:18:02 +0200
Message-ID: <20240704101805.30612-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 6.10-rc1, Qualcomm machines with a serial port can easily lock up
hard, for example, when stopping a getty on reboot.

This was triggered by the kfifo conversion, which turned an existing bug
that caused the driver to print discarded characters after a buffer
flush into a hard lockup.

This series fixes the regression and a related soft lockup issue that
can be triggered on software flow control and on suspend.

Doug has posted an alternative series of fixes here that depends on
reworking the driver a fair bit here:

	https://lore.kernel.org/lkml/20240610222515.3023730-1-dianders@chromium.org/

This rework has a significant impact on performance on some platforms,
but fortunately it seems such a rework can be avoided.

There are further bugs in the console code (e.g. that can lead to lost
characters) that this series does not address, but those can be fixed
separately (and I've started working on that).

Johan


Changes in v2
 - restart tx by issuing a transfer command when there is stale data in
   the fifo
 - reorder and rename patches
 - rename cancel tx helper

Johan Hovold (3):
  serial: qcom-geni: fix soft lockup on sw flow control and suspend
  serial: qcom-geni: fix hard lockup on buffer flush
  serial: qcom-geni: do not kill the machine on fifo underrun

 drivers/tty/serial/qcom_geni_serial.c | 51 ++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 13 deletions(-)

-- 
2.44.1


