Return-Path: <linux-arm-msm+bounces-33719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C78996EBA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9185B225AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BE31A3031;
	Wed,  9 Oct 2024 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tW47HgAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A498A1A0B12;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485489; cv=none; b=SzVhgkzxi4rRJ9VZGTRIDApWi+KnZ4Z4YjWlERvpe5UHvf2e1j68vNludWTzSoOaZO2/33CnoTTQe1/uS/V4xJLlJ60afjBBoSVVXnpEdH+nRZF9AS6xLT/48xjggXN7rYUu4Cf6swSA4XslqVZ52LthAjsKDvaCYTq+RP3UHmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485489; c=relaxed/simple;
	bh=ni/7C49v00kREPSkEliowLoAY5fhHWk11WGWdQQ6Z4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwX534l+UXtx9T4uQSrKIcOsCvRFhCpYmiYzwyQhCOscdE7LGINXoSTsruInRXe9cp7RZv36w+BCq7Y21uRywqVzq/LdvavVwpvpk3LVUd6WEGGmNcG5x6VMfLOSD5LCsDu3oTCsHVeKD46VVIvFaB3KZoPv9P/P+dEasJFXiI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tW47HgAC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304A5C4AF17;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485489;
	bh=ni/7C49v00kREPSkEliowLoAY5fhHWk11WGWdQQ6Z4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tW47HgACfs2/jocBVh9roIJ0sdeyocFqd8DLw3q59IoiGe2dqJhnf1VLSNV+qxUuD
	 N3l6As0Gi7k4kKOf4f1AbL5TJxKK171fIpcTAffVgIetVWgHdXVBtVyKNMTcPn6glJ
	 eelwp7Xql6/7H4R2KwRhPaS4NsnCF89uSeyg7yZF7F3ubDW5SkutcFlKgwaV8wqdyp
	 nOB2Te5FtfGnjtC92vuIE8FR9sHNdjtFRKVzwbGduI6WrzXpY4D0mLcVJraAN5ztRI
	 RRvU6MwLKrFi/bqqKDFHIlHMEDDikOYnQsgtWgREVa32ZAHRVMGMhcbZf6fWZ+lyNw
	 wPewGOYqV4JHg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syY2H-000000004Oj-0hk1;
	Wed, 09 Oct 2024 16:51:33 +0200
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
Subject: [PATCH v3 7/9] serial: qcom-geni: drop flip buffer WARN()
Date: Wed,  9 Oct 2024 16:51:08 +0200
Message-ID: <20241009145110.16847-8-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009145110.16847-1-johan+linaro@kernel.org>
References: <20241009145110.16847-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the unnecessary WARN() in case the TTY buffers are ever full in
favour of a rate limited dev_err() which doesn't kill the machine when
panic_on_warn is set.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6c4349ea5720..22e468065666 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -588,9 +588,8 @@ static void handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 
 	ret = tty_insert_flip_string(tport, port->rx_buf, bytes);
 	if (ret != bytes) {
-		dev_err(uport->dev, "%s:Unable to push data ret %d_bytes %d\n",
-				__func__, ret, bytes);
-		WARN_ON_ONCE(1);
+		dev_err_ratelimited(uport->dev, "failed to push data (%d < %u)\n",
+				ret, bytes);
 	}
 	uport->icount.rx += ret;
 	tty_flip_buffer_push(tport);
-- 
2.45.2


