Return-Path: <linux-arm-msm+bounces-33712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C903996EA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C02FCB20D7C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C3919DF8B;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kk+14XPO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BFF433C9;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485489; cv=none; b=KP6J0Z+1SDkJghrmtBM3BWSO+OzI4znSEg1W65k0vbDFxd4GlOF4lGNz3vYhm7pPyWNhlrMdFHL9AzCNfyox817u9imdnONRAAZM9cyX4GpeNICEXLAEnOxneGPQs6gRIKeGbQ4SuboU2peZ/c7T7joebeHAl1DBRxl1Mg1xXIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485489; c=relaxed/simple;
	bh=QDvGRQtJ8okQqMkr1E5eGPwr5hSP7pHdzGrwtk6SK6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lR4NDni0aaATI2HyTufVXDKf3+Z9IeLX0b0GS3Cx+1vxrF7K1XY3l2qeIwXGEjPSPxfbeSWPQ36mhUHtsYBPwFptQ/0aTfSdUf2Y7hN8qdPmmQc/978nzFTQPn8EulEoCeFglE0XfcTTfXkALFNOc1Yr/qGVtjunajYEUzCNN5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kk+14XPO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B86C4CECE;
	Wed,  9 Oct 2024 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485488;
	bh=QDvGRQtJ8okQqMkr1E5eGPwr5hSP7pHdzGrwtk6SK6A=;
	h=From:To:Cc:Subject:Date:From;
	b=kk+14XPOHDPBZ7CFZycoyZeGRAf97ER0cmTuk84DKACQ0vFtqo66Z5pRdHkDXEA+m
	 87Vr8QGZprf9sYAYClP5twQKCGQGEP7VvE62zQMjrf/4PSOckXe5bXMm5723fZXgrj
	 etrjVS1Fb/WawvujmqCR6PHE/A/ShitnZjbTVxhQ+xsnG1919ZgYqSYRW6zSbPH+ly
	 AeRlzLAWpt6KOB/NGJoa1hMkpkwOPr9TISQG2t5AwzeY36ZuC9+MyW5nszrnxv0+pQ
	 sDIOKvxxvz/oPbcuYX4zzu+/S4f9ympv1HWzE14wPhQ1PYh9gGVDkvQdBx1SZe30rM
	 /igtpeXd9Hn7Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syY2F-000000004OT-3W10;
	Wed, 09 Oct 2024 16:51:32 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 0/9] serial: qcom-geni: fix receiver enable
Date: Wed,  9 Oct 2024 16:51:01 +0200
Message-ID: <20241009145110.16847-1-johan+linaro@kernel.org>
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
set_termios() races with the console code during boot. This can manifest
itself as a serial getty not accepting input.

Fixing the missing locking in set_termios() exposes another
long-standing bug in the DMA implementation (e.g. used for Bluetooth),
which is also fixed.

Johan


Changes in v3
 - fix polled console initialisation
 - revert broken hibernation support
 - rename suspend PM ops

Changes in v2
 - keep the call to stop rx in shutdown() which is called also on
   hangups
 - fix rx dma cancellation
 - fix rx cancel dma status bit
 - drop flip buffer WARN()
 - drop unused receive parameter

Johan Hovold (9):
  serial: qcom-geni: fix polled console initialisation
  serial: qcom-geni: revert broken hibernation support
  serial: qcom-geni: fix shutdown race
  serial: qcom-geni: fix dma rx cancellation
  serial: qcom-geni: fix receiver enable
  serial: qcom-geni: fix rx cancel dma status bit
  serial: qcom-geni: drop flip buffer WARN()
  serial: qcom-geni: drop unused receive parameter
  serial: qcom-geni: rename suspend functions

 drivers/tty/serial/qcom_geni_serial.c | 103 ++++++++++++--------------
 include/linux/soc/qcom/geni-se.h      |   2 +-
 2 files changed, 49 insertions(+), 56 deletions(-)

-- 
2.45.2


