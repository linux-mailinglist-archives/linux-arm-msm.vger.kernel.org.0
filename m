Return-Path: <linux-arm-msm+bounces-31120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C3D96F524
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13CC6B21EB9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC361CEAB8;
	Fri,  6 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBTJYYoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133201CDA31;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628499; cv=none; b=Ca46Myj6awd71Z6E5LxbR1VTvhdKuif+gHl4cnmVjT+G+FNFFnqJ3Q8cFwOXU9Ituxj+NUZpu3vpaqVhMT03Qqr9WQMfv9P7jAs5ddDZ15i8DCI6PebpN01nD/0zpw67bCiBzlD3xC3zRvfk3HayBYtloRJ4vUptdgeTz8ASSdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628499; c=relaxed/simple;
	bh=OK2YrfdKa62Py+C20Rb0AQbYDFeK3Ek1BUPv36lR1dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ofJ08UDFvOIeLW6WxY9+LCdy/R95NEPZNiF1VA3hp2EVIxgLrmcu+z1nvt6t2z8pbgg6rEkucJLGvhXYoMa3uVPN5Zl5Wg64POnLGpkOweRKLpP441aHk3oMbzne47NwP5zMkMG+MCnS27i+z9d8mEAn/kHvnExwnsp4Iz/Cl8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBTJYYoH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B2AC4AF0C;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725628498;
	bh=OK2YrfdKa62Py+C20Rb0AQbYDFeK3Ek1BUPv36lR1dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oBTJYYoHT1eigofGwuy+od7mnUeVyV8jx2SE+ZrMlRvDeHHvZLPqRPVnQGHBRU21d
	 q+GIzQdhbpEBBzqclxC5rV5J/8dZSqz4jaeG+0R74RfMUcb0Sz9Srf6zLqnD49A8jK
	 fMN+/ylcvRWRXiE1taEPahbHFHKWxl009euBqVvinqLV0yqP8kV37MaLGHBjQNqSqO
	 TKNAAt/JOC1IAbLU8ZBOO8gc4ZLZ/vVaEi14n4hjlUHtjaqasoef62oir5HsLL0SuD
	 KisxYYC2npCpxUXHPA93GkWJWJH23QmmGBR8v9RLin8e8jjpOrrrpXLNE/q6Ov3ss+
	 n1k1vWvKsbhOQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1smYo3-000000006Ai-1gcp;
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
	Stephen Boyd <swboyd@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 4/8] serial: qcom-geni: fix arg types for qcom_geni_serial_poll_bit()
Date: Fri,  6 Sep 2024 15:13:32 +0200
Message-ID: <20240906131336.23625-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240906131336.23625-1-johan+linaro@kernel.org>
References: <20240906131336.23625-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index b88435c0ea50..54052c68555d 100644
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


