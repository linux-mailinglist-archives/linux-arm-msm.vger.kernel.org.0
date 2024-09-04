Return-Path: <linux-arm-msm+bounces-30748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD096C147
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EB3C1F293EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED9A1DB937;
	Wed,  4 Sep 2024 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPuhZIDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8421DA622
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461536; cv=none; b=KFymVyLpOmfMxvseV0dPhwkwf9ErKAaLs/UarjKWqiWPeZIR7FUqH+1qn94XQk8qpV/YTPhDrza1K6aP/o5N1bUR/RaCtFHtS+4w9s7ZtDWNLWFV+gDkgYNBZfSAe5ugXpdtYZnT/BgOjBc4xAeS6g58N1KpyAmXGfl8t+dWwiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461536; c=relaxed/simple;
	bh=xVR+mPcyEgGmpXVWMWXMbgCvErzCkqJ+KiBfrn+9naw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jUWIKIPc/enaH6tx4w9+PlMYiZGnSoIlaaqGiqQMGLYT7fepENHR84VAAGPVWrkq9NK6eRDSy8H6bLQFlxDq6lergD/DYsPqu4M/nTfXDDtb+lNAqipjuBgqHjyNeKhLUPY3kjul+kKPSHyeISYjzEZ6A+ZZDoXEX/sKjXfJBGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPuhZIDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C123EC4CEC3;
	Wed,  4 Sep 2024 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725461536;
	bh=xVR+mPcyEgGmpXVWMWXMbgCvErzCkqJ+KiBfrn+9naw=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=LPuhZIDZ95cRViyQcuF0UoUPlqZfr6jUEHkAlRhRKH0p1S597SYhgXNBD9EqOYAOX
	 iwbCwDnvfYsOoQTIw4Yj5m4dL/kVoveEkxOD9bo+lq6edL7Y1GSkiwGZp4kXrlWeL5
	 T9eNsrOWK14iII+FCjuNkTV47UUySkz3K94yUvFBNfyn8a00MW2KK9CGu6xYIOzGD+
	 6YvnGZKx5tDe+DKWpbakSmwFGOZzaeaUfS9+rQTBP6ME8zSIrEhAr/V2g7QCM5Vl0W
	 yQp5VGEuk22IYjmSC0PXIW9TA/DY6h4gzU0fO7y1Gp712lqSfanSJMxRKCWixgSlmN
	 vLIEoz9eC5fNA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [GIT PULL] One more Qualcomm driver fix for v6.11
Date: Wed,  4 Sep 2024 09:52:13 -0500
Message-ID: <20240904145214.4089-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit c158ceb826068a8bbe3c9e78df420f47ba53c8a8:

  soc: qcom: pd-mapper: Fix singleton refcount (2024-08-21 09:50:48 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.11-2

for you to fetch changes up to db213b0cfe3268d8b1d382b3bcc999c687a2567f:

  firmware: qcom: uefisecapp: Fix deadlock in qcuefi_acquire() (2024-08-30 22:17:50 -0500)

----------------------------------------------------------------
One more Qualcomm driver fix for v6.11

This resolves a deadlock in the Qualcomm uefisecapp driver following the
attempt to acquire global context is acquired in the case the device
isn't probed.

----------------------------------------------------------------
Dan Carpenter (1):
      firmware: qcom: uefisecapp: Fix deadlock in qcuefi_acquire()

 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 4 ++++
 1 file changed, 4 insertions(+)

