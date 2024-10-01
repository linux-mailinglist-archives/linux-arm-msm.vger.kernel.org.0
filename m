Return-Path: <linux-arm-msm+bounces-32875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6856398BCB1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B0A41C23586
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F67B1C32FC;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oV7KiK+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35B1C244D;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787071; cv=none; b=mrvlYUOFQCwbzprWUp1Zac6Hp/mp2H0xIpDP3d3vnk5VVNkcjBaKt0Mms0LltARHLtfSxETM8HS3GHr2NHZb/95U3DohsuK0oTUiTYMpBW0hyQWn5xf0dqswkgGQ34y8u9X0EQ+3h8nNrHzKAis84p2JSzmFS0c1Rdw5C+C5z0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787071; c=relaxed/simple;
	bh=CIdoqbXA+YVySAKWww1LHhuYfAYue7nHwwUDVhAg8Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHIXUSpdnkn8eOZqVLGACgGVM5AFLqpE5Q8JQ0B6pscc1y73BJwYl7a8yLXOJcecqf4vQ/hfDg5XB9jAzVSuXc1Mp02Cagn8kUcmazVPO/rXGICrfkfH43eiUwj8kzXX8MjjMxBl86FeTauz8nJnIhNfzsi+d8yuWGGeQMc8QIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oV7KiK+l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4909C4CECE;
	Tue,  1 Oct 2024 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787071;
	bh=CIdoqbXA+YVySAKWww1LHhuYfAYue7nHwwUDVhAg8Yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oV7KiK+lj/8uPkuIW6XlNda8pIOd76lvzg+aqlHnTjAyRr8aWv0SNd/tY60FMdIT0
	 6jKyL0xrk0uBl+3K95+HQGJY0/DuoptAL3Dwz+5k6rBC+OStYKhbhK5dvG0PraqJ3l
	 RTWj3enQKXGTdmnxxPEGSkZ1kXXBXwy6w03SEPEFSCzUd88bGpGKAZJp4g6Q2ik1He
	 5C+AQIvt1j1JfY5WG+ltzuLR1bhIGDlnl6lDx3w4JGHPNNNQWPhH7hT0C8Gwoz7rG6
	 k1YJaXtddlT18SISiKH8ari9LI4PAh1tNso9h3DAjwrzy/QQF8N3J91FzwRZFA5P+e
	 RxzDSt7lby6+A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svcLO-000000002mE-3uJ9;
	Tue, 01 Oct 2024 14:51:10 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Aniket Randive <quic_arandive@quicinc.com>
Subject: [PATCH v2 1/7] serial: qcom-geni: fix premature receiver enable
Date: Tue,  1 Oct 2024 14:50:27 +0200
Message-ID: <20241001125033.10625-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241001125033.10625-1-johan+linaro@kernel.org>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receiver should not be enabled until the port is opened so drop the
bogus call to start rx from the setup code which is shared with the
console implementation.

This was added for some confused implementation of hibernation support,
but the receiver must not be started unconditionally as the port may not
have been open when hibernating the system.

Fixes: 35781d8356a2 ("tty: serial: qcom-geni-serial: Add support for Hibernation feature")
Cc: stable@vger.kernel.org	# 6.2
Cc: Aniket Randive <quic_arandive@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6f0db310cf69..9ea6bd09e665 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1152,7 +1152,6 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 			       false, true, true);
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
 	geni_se_select_mode(&port->se, port->dev_data->mode);
-	qcom_geni_serial_start_rx(uport);
 	port->setup = true;
 
 	return 0;
-- 
2.45.2


