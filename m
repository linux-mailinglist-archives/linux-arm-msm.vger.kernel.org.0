Return-Path: <linux-arm-msm+bounces-30408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 732F2968AD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 015B0B215DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570EB1A2634;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFwnZX2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53819C563;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290759; cv=none; b=hdv7u8tLxKvjL/MudD1p4yq425QrFmmtIMPpMz5bNmZZ1LYSuylb1U+EB8YYro2TCKSkJvj0ax3NY5LLpjdVGGDOdbipJCKYG32/l6HjqIOFxn4EPfoFSPwZNk5fFXciexNJkuHPtSo/BYZxpPRhoy5kedmmdSKHPBJLmCvjG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290759; c=relaxed/simple;
	bh=SMKFE4d0aiwkpJj7virTsyUEB+nYZROKDFfJTwG1I5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eo/F9X6o2fCvFjqcxn4pWVRn/Rb/daSK0q7oQ0o/lE0hRWSntkMV2A1wGLFWAWR7Fb/m8MeDUtSuwkz1uxnX5XekfLIuFSqQf/fy142qtNEK40OJxV4MH9ZAm96AoQ1hteLy6UQzREYPd/1UDO6/WYb3yvU8pCFlzwmIoQmWCaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFwnZX2+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7BCC4CEC4;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725290758;
	bh=SMKFE4d0aiwkpJj7virTsyUEB+nYZROKDFfJTwG1I5g=;
	h=From:To:Cc:Subject:Date:From;
	b=UFwnZX2+6Qa6/zIbATF65tVHsbmwk77ApJi4MKL0hPMD77HnIucIar4uqAGww9MS0
	 swp/3Z1kF2mVb6taFx4lWO5tPG1ReDd9HiUrun+U7SAeAQbfuwqxavZ35qvUH661Yv
	 Smb5s0NcMLONq8qqjFEEctuqv82tpSOjteRqARhasIE2WD6mm1+4zBtWJE1TBZs4hz
	 4zi4fSbD8Ub+9uZglkDmEjhO/T2fEKje6nI5CUV2iTSw6X4HmYWIP8mdqHVbETb8qo
	 T8ZhLZfcpsI7XU9NEXmbAL4d5qMqzg141rBM9jkEIq0BSEClK0S+CgT6S6NB+TkrJO
	 MHFQYNBAhsReQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sl8wW-000000000Fb-1znp;
	Mon, 02 Sep 2024 17:26:13 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?=27N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado=27?= <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/8] serial: qcom-geni: fix console corruption
Date: Mon,  2 Sep 2024 17:24:43 +0200
Message-ID: <20240902152451.862-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a follow-on series to the lockup fixes [1] that addresses
a number of issues in the Qualcomm GENI console code, including corrupt
console output during boot, which is a problem for automated CI testing.

Johan

[1] https://lore.kernel.org/lkml/20240704101805.30612-1-johan+linaro@kernel.org/


Douglas Anderson (3):
  soc: qcom: geni-se: add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
  serial: qcom-geni: fix arg types for qcom_geni_serial_poll_bit()
  serial: qcom-geni: introduce qcom_geni_serial_poll_bitfield()

Johan Hovold (5):
  serial: qcom-geni: fix fifo polling timeout
  serial: qcom-geni: fix false console tx restart
  serial: qcom-geni: fix console corruption
  serial: qcom-geni: disable interrupts during console writes
  serial: qcom-geni: fix polled console corruption

 drivers/tty/serial/qcom_geni_serial.c | 133 +++++++++++++++-----------
 include/linux/soc/qcom/geni-se.h      |   9 ++
 2 files changed, 85 insertions(+), 57 deletions(-)

-- 
2.44.2


