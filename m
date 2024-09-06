Return-Path: <linux-arm-msm+bounces-31122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA3096F529
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F51B28582E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F831CF297;
	Fri,  6 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVexM4QK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE01CEAB5;
	Fri,  6 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628499; cv=none; b=V2+7dsUlN9gWMHfXKANyFZErucg4s4eFqbbkWjynktt6jvabDUgmL4b0QMD5qxohfAUP/y/O58VInAyVkrL+lmzjahNoiZkcJBz4kuIkl/oFMiALJv/WL8Fgs8suDeAEFtCdatoFq04kzJown0VhTMLEDseue4M2RIGHEtcuU8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628499; c=relaxed/simple;
	bh=/MSmBe/YFSZf6t5Cgd2TYXBoOQQtu13KM1KOhOLJX7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aN0Wt8LCEqwa8LK2ABYvRSWgdzxzibBGxpT8G6/VEKql8vummb2EpHDX5TLWsQFoTE416/IVsI7XmF9OckwBP3j4ZubzkCCjErnRfeIEWXbELl/P+ACQCyfszwe/bALcYTS540auLwLbSuglE3Amha74/gONhhSL45NzbaVrtrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVexM4QK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E69C4CEC9;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725628498;
	bh=/MSmBe/YFSZf6t5Cgd2TYXBoOQQtu13KM1KOhOLJX7k=;
	h=From:To:Cc:Subject:Date:From;
	b=iVexM4QKRBgesXubBEfxNA5k2qdQ9HW7mdZ9xk3hGNoRZNCYb5VgGdRgR2zjfjTJT
	 MBt/We3EIxVXnZEyzAaQL/29ZlBoxKulgd/hJ/vQuNmqaiFDRAjzpQekFuaOgNi4hK
	 MPcbFfJdcZN7n+6kVJkczvAurYdGbLvZPRRl5yH5C9wWl9UChUCtuLQsiF9eQwfoyq
	 kNoX7wsMVzMM988N7fk/IuA4jFdKZDzv4qgJw5CUVsT7j7m0d1iE/sdvnbAu6F8EWR
	 Lacxf9YYNgoas7+yIuNYzcja1jXhHj/jYxVT3w0ibiyG4rVC5Nk3YzvT/haTo15AEk
	 5icGBizZzfqYA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1smYo3-000000006Aa-0ABJ;
	Fri, 06 Sep 2024 15:15:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/8] serial: qcom-geni: fix console corruption
Date: Fri,  6 Sep 2024 15:13:28 +0200
Message-ID: <20240906131336.23625-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series is a follow-on series to the lockup fixes [1] that addresses
a number of issues in the Qualcomm GENI console code, including corrupt
console output during boot, which is a problem for automated CI testing.

Johan

[1] https://lore.kernel.org/lkml/20240704101805.30612-1-johan+linaro@kernel.org/

Changes in v2
 - determine poll timeout in set_termios() and avoid hard coding fifo
   size in calculation
 - move fifo drain helper under console ifdef to avoid an unused function
   warning as reported by the kernel test robot
 - drop a redundant active check from fifo drain helper


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

 drivers/tty/serial/qcom_geni_serial.c | 137 +++++++++++++++-----------
 include/linux/soc/qcom/geni-se.h      |   9 ++
 2 files changed, 87 insertions(+), 59 deletions(-)

-- 
2.44.2


