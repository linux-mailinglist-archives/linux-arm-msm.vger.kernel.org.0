Return-Path: <linux-arm-msm+bounces-23953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AD914EB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A35DBB240D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0630143748;
	Mon, 24 Jun 2024 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNjCBPS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C31143743;
	Mon, 24 Jun 2024 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235901; cv=none; b=KyUQwtm67euxEs/jEzXYZ3sdGK2BZnySRTTrLX1TIdRynYdFteRybWkJRwsugPkg9dGL0JjGMhE9Aq0SXtM8WBR856/vJ+Xbzi2wuOjag5yXBmdRzzYG+sMOoPzXePVGDFHfQ24j1oMkNH1OcLRGsM8gPMwNGZg4gBUoV0mU2ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235901; c=relaxed/simple;
	bh=vL7M6HIfjIdiY9ehdOVpJ0ONlHrr4nW+odyhP3l9jXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZTVhY7CdD9ppKcDIYwh2NQ0QxDgl+lTUz8mHRSekglAqzV2CCTE9ZDG2+gLMpu6ijK5hBYW+dgwxnPGb3QTh4YeBh3u4ZUVVdYfFAiNYA/DTQu0Ki6X3UQqSVjqLk0ukwCQb0GQVJh/IxoCiuZoRNq0QEPkzZc87QdCLBuK+gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNjCBPS0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17136C2BBFC;
	Mon, 24 Jun 2024 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719235901;
	bh=vL7M6HIfjIdiY9ehdOVpJ0ONlHrr4nW+odyhP3l9jXE=;
	h=From:To:Cc:Subject:Date:From;
	b=qNjCBPS0HAv5PDH1zqwns6xxdIdHEnYpu5G8mIHJQdiO5lLwTehGX/pyaDIZ7sGa6
	 Xv/grLpqvWyzAundeCK8IzaBd0gfEMG6CgLF0jQF7JYqnC3JsolpBkDmuzNp0QdI7s
	 ewyG3eDO1+0LqK7STelr4guiz2pHtS4JfcHnScwGIro6TttlfCo4a8CdeC4tZhAB9k
	 1M6ViqOWUQntlhF8jl4kA63WRmtW1rbVMTdIg5U5ull6/ZKbEu7H7JLgMrI38KrYWq
	 RhMS2iEZiApT7U888frsBNg0cYdXq4sn3KhQHzD4YQYFQBJ8n//Rxs5PNciIlxWwJ1
	 UZnpXPFtfZiAQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sLjnO-000000001wS-0bQn;
	Mon, 24 Jun 2024 15:31:46 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/3] serial: qcom-geni: fix lockups
Date: Mon, 24 Jun 2024 15:31:32 +0200
Message-ID: <20240624133135.7445-1-johan+linaro@kernel.org>
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

The first patch in this series fixes this severe regression by restoring
the pre-6.10-rc1 behaviour of printing additional characters when
flushing the tx buffer.

The second patch fixes a long-standing issue in the GENI driver which
can lead to a soft lock up when using software flow control and on
suspend.

The third patch, addresses the old issue with additional characters
being printing when flushing the buffer.

Note that timeouts used when clearing the tx fifo are a bit excessive
since I'm reusing the current qcom_geni_serial_poll_bit() helper for
now.

I think at least the first patch should be merged for rc6 while we
consider the best way forward to address the remaining issues.

Doug has posted an alternative series of fixes here that depends on
reworking the driver a fair bit here:

	https://lore.kernel.org/lkml/20240610222515.3023730-1-dianders@chromium.org/

Johan


Johan Hovold (3):
  serial: qcom-geni: fix hard lockup on buffer flush
  serial: qcom-geni: fix soft lockup on sw flow control and suspend
  serial: qcom-geni: fix garbage output after buffer flush

 drivers/tty/serial/qcom_geni_serial.c | 36 +++++++++++++++++++--------
 1 file changed, 25 insertions(+), 11 deletions(-)

-- 
2.44.1


