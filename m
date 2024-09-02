Return-Path: <linux-arm-msm+bounces-30409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E93968AD6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 081EB1C20859
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C171A263C;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jL5QxJ47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E60C19F124;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290759; cv=none; b=KPdNii4z5mjzaFA/YL1PPyQIhnKTaD63b+9jXuTJhMHBiblNrCisaA2ViSRpwFHs7qzTMduSJMRNd8qxiJl09UYCtZVT0O0VMUN2NhNG2tyBQapxJa3XCO3j49WCc5sNfLbYUDkJaQQnY6IRYxSo2mvnV5wu2yjpZGpoq7LFRwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290759; c=relaxed/simple;
	bh=OL3j4krYLgw1/hR+PI+ZmxupOQF+uLSIhz5vZnbz3fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxFe0nU5FaYTzrLZlPRXz8I5UVTs+khWY60VwDApOEZU6Es6w0fxt83tjy1KNQ5Vl5Exa2DkxrGY5CoqP1a9ALP5PCO7mxX4zJdb70HTouRDrqTaHzjCmSSWcqcd+Y+4/O4B9gxv05KRmXYBdBp/5XytWcGlQKvelBP+Zfl0VRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jL5QxJ47; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AF1C4CEC2;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725290758;
	bh=OL3j4krYLgw1/hR+PI+ZmxupOQF+uLSIhz5vZnbz3fM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jL5QxJ47cRI2G7ZY+m+Yk1/arbtyZe7Bp97pWN2klYuxys+Uk2VUZ8ZZjWYs5wIY1
	 Cb4WBr4UqEA/K46y/uIZqTCH/kMdOW7qP6bb/hWnn/6ssU+Ponger83mZN/YDGpo76
	 VE8wriv/LeUNLfpoiwTMWagpbyLHPJT2Wut4kPZqPR6sA6qhz4P5juGhy/BbQUXcy0
	 4Ri7EGsGwPE7JrJdUbbJ+Zo4h4Zwk5zYGYaneI8Owi6bVnI2y366A4/CDwqkodNvhb
	 vhh8UxvlXHgTELgouIaSCrPWHQ1YzdkMqLdG6/g6bNRWUvUVAYmqqOUzXWuKnpgm0x
	 iAqryJj14+HRw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sl8wX-000000000Fj-2GhW;
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
	Stephen Boyd <swboyd@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 4/8] serial: qcom-geni: fix arg types for qcom_geni_serial_poll_bit()
Date: Mon,  2 Sep 2024 17:24:47 +0200
Message-ID: <20240902152451.862-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902152451.862-1-johan+linaro@kernel.org>
References: <20240902152451.862-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Douglas Anderson <dianders@chromium.org>

The "offset" passed in should be unsigned since it's always a positive
offset from our memory mapped IO.

The "field" should be u32 since we're anding it with a 32-bit value
read from the device.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://lore.kernel.org/r/20240610152420.v4.4.I24a0de52dd7336908df180fa6b698e001f3aff82@changeid
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0af4a93c0af5..4625a2e5ebfb 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -266,7 +266,7 @@ static bool qcom_geni_serial_secondary_active(struct uart_port *uport)
 }
 
 static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
-				int offset, int field, bool set)
+				      unsigned int offset, u32 field, bool set)
 {
 	u32 reg;
 	struct qcom_geni_serial_port *port;
-- 
2.44.2


