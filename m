Return-Path: <linux-arm-msm+bounces-20414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D33AC8CE8CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 18:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67D421F22F4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 16:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1B112E1C9;
	Fri, 24 May 2024 16:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dylanvanassche.be header.i=@dylanvanassche.be header.b="cDnhqIZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from www316.your-server.de (www316.your-server.de [88.198.220.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4ED86251;
	Fri, 24 May 2024 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.220.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716568976; cv=none; b=ZtYIn87ny7zW0iE0CPN1EmtaHoFEZ0paHqH7uORLaedBSW3alIZQV+LTZbYWnZg0kgVItLwuQCg+9LhTAOykyox/Gh9Qa5QL/3vtKqUjUxJL9xH6QMEte2sDpokwh1BNSIJ9pAC2mpYBdhrZHYNvL+dortE1IjwUbRLcTCzpP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716568976; c=relaxed/simple;
	bh=t+YModx5IJ7i5mA14PTSUCfUZivYXk693ycSQhxzxdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GicM9B1Ca+iZchxYcPS6Ux6iCJmkHKtYCrxB8s2ARRL5Y90ozG/nJArRzt3pU5hY0ZJNoMkt5CIoB/tSAYopqEXm2Sx3CQ1F993W3DR9Ny4VaG5acHHo/fb0Xsn4ni59tWzb72jv3OOCGVeCfoTuqBlJr2iKdAuTXLv0Ls34dTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dylanvanassche.be; spf=pass smtp.mailfrom=dylanvanassche.be; dkim=pass (2048-bit key) header.d=dylanvanassche.be header.i=@dylanvanassche.be header.b=cDnhqIZU; arc=none smtp.client-ip=88.198.220.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dylanvanassche.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dylanvanassche.be
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=dylanvanassche.be; s=default2306; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=YX9E6Ij88ACGoWd05mXkF/EXj7DNLDqMPEhMZaF6BOY=; b=cDnhqIZUl8o75/ULztpfX3e7co
	QN1z9NuArUEBkXMMbiIGQrCaipczliltmNneysj2YPARx4Wi7aLskCcyn4f18ofd+hNsL+9Kl6nBW
	Ia5xOEozXNZMcSrX4hUy/lCcchdXDewJF+SRSuT6kHi1kASReN1OgzqpoSgwptv1rI/hH85uAK62P
	bygtri8LvYF1EOnWLfW+rUCvjClAskoi3wMJ9b2mkgibASap2uUMOOmpu6gnc77aGKxzn/BLOF6FK
	n6Ct2dLY9gTcr2zfn1Dm7OO4lNk3ewRNu57CAyZ0cR8R4fowe0YNqLqiontBK7iZJvnmKi5xWQ0lf
	qE8GVI/w==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www316.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <me@dylanvanassche.be>)
	id 1sAXYq-000K0N-1r; Fri, 24 May 2024 18:14:28 +0200
Received: from [169.150.196.25] (helo=desktop.telenet.be)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <me@dylanvanassche.be>)
	id 1sAXYp-0000gS-0N;
	Fri, 24 May 2024 18:14:27 +0200
From: Dylan Van Assche <me@dylanvanassche.be>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH v5 0/2] misc: fastrpc: FastRPC reserved memory assignment for SDM845 SLPI
Date: Fri, 24 May 2024 18:14:01 +0200
Message-ID: <20240524161423.15392-1-me@dylanvanassche.be>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: me@dylanvanassche.be
X-Virus-Scanned: Clear (ClamAV 0.103.10/27285/Fri May 24 10:30:55 2024)

* About *

The Qualcomm SDM845 SoC has a separate SLPI (Sensor Low Power Island)
DSP for sensors connected to the SoC which is responsible for exposing
sensors to userspace, power saving, and other features. 
While sensors are connected to GPIOs of the SoC, they cannot be used
because the hypervisor blocks direct access to the sensors, thus the 
DSP must be used to access any sensor on this SoC. The SLPI DSP uses a
GLink edge (dsps) to communicate with the host and has a FastRPC interface
to load files from the host filesystem such as sensor configuration files.
The FastRPC interface does not use regular FastRPC Compute Banks
but instead uses an allocated CMA region through which communication happens.

* Changes *

This patchseries add support to the FastRPC for assigning a coherent memory
region to a DSP via the hypervisor with the correct permissions.
This is necessary to support the SLPI found in the Qualcomm SDM845 SoC which
does not have dedicated FastRPC Compute Banks, in contrast to newer SoCs,
but uses a memory region instead when allocating buffers.

* Related patches *

1. Remoteproc changes to support the SLPI DSP in SDM845 (v3), needs to be applied:
https://lore.kernel.org/linux-remoteproc/20230330164633.117335-1-me@dylanvanassche.be
2. DTS changes (v5), already applied:
https://lore.kernel.org/linux-devicetree/20230406173148.28309-1-me@dylanvanassche.be

This serie does not depend on any serie, but all of them are necessary
to enable the feature in the end.

* Changelog *

Changes in v5:
- Adjusted to FastRPC driver changes in 6.9.X.

Changes in v4:
- Fixed possible memory leak when driver encounters an error during probing.

Changes in v3:
- Dropped debug prints.
- Added Reviewed-By tags from v2.

Changes in v2:

- Removed double blank lines
- Dropped dt-bindings property as it is not needed for driver behavior
- Add additional patch to allocate buffers via CMA memory for DSPs
  without dedicated FastRPC Compute Banks.

Dylan Van Assche (2):
  misc: fastrpc: support complete DMA pool access to the DSP
  misc: fastrpc: use coherent pool for untranslated Compute Banks

 drivers/misc/fastrpc.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

-- 
2.45.1


