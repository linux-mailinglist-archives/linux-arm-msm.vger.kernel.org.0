Return-Path: <linux-arm-msm+bounces-34066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5CC99A091
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 11:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D10E2893CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901C1210C32;
	Fri, 11 Oct 2024 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYZsggJg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1CD20FAA4;
	Fri, 11 Oct 2024 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728640643; cv=none; b=kQRmYFzCC+bPTfESyN4QCJpNZU7reUv2K5EJuZGkZtD3Kjzb37PCrk9hsLOn+cYQ+09KSBdoc4xzsanfxA5ymmGUgUvEurxPhagi5JBdX/C3ikPkR1zr0nhLqxD5mH5qNM9riuygIOEIdBz1bI5kzVKTNV1PeowjH3Jt3pCJvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728640643; c=relaxed/simple;
	bh=C4j0spZA6e8EtGv8uPBzDuOpzYnqUPeFP8JKH5G1X2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCkUmXg0zlPq9BouwOcabPt9q06HZsf+wPRj/35d2gKSyXqVmTlnuo4Nhl0xN5sH8Fys9le0zqO3OYObC9iqt/Ra54RzTRt4rOa46u+5bD4XT57irASLf74e+YEW+6UJbYllIs0CzKJPkVPFsJhNWK2zschR4wchYkWpF0tzIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYZsggJg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1ED8C4CED0;
	Fri, 11 Oct 2024 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728640642;
	bh=C4j0spZA6e8EtGv8uPBzDuOpzYnqUPeFP8JKH5G1X2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YYZsggJgcn0JhvMFned+oc1Zr9EUvB+y/6R2noGQylEmjNbtdx4FAhh1nNQtES74s
	 N88fZc6X7lVCq9+jVaLjWtyJxLNs8Apx5+mKSiyniQt/WVwnekxj47qzCaAGkrgVwa
	 Njw9lLq1pQJou3i4GNfU+s0F/LBI1fXZWGppm7nignGMSHI3xiYx8CXmbuFdajslEp
	 Tflq1mKQhrpG8Bp/qta9V1eqCLK1HbqpjWuxbOUl0k1RA+Z8GVGb/0mvfszjsElcSV
	 g6/ZvY30YnT6sgj7xvSYNkurEQz2bbtYPTK4+Sj8UaCZGDqb23I8vpfPRpvZK2A9e5
	 us7zaPy5HporA==
From: Simon Horman <horms@kernel.org>
Date: Fri, 11 Oct 2024 10:57:10 +0100
Subject: [PATCH net-next 1/3] net: dsa: microchip: copy string using
 strscpy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-string-thing-v1-1-acc506568033@kernel.org>
References: <20241011-string-thing-v1-0-acc506568033@kernel.org>
In-Reply-To: <20241011-string-thing-v1-0-acc506568033@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, 
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, llvm@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.0

Prior to this patch ksz_ptp_msg_irq_setup() uses snprintf() to copy
strings. It does so by passing strings as the format argument of
snprintf(). This appears to be safe, due to the absence of format
specifiers in the strings, which are declared within the same function.
But nonetheless GCC 14 warns about it:

.../ksz_ptp.c:1109:55: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
 1109 |         snprintf(ptpmsg_irq->name, sizeof(ptpmsg_irq->name), name[n]);
      |                                                              ^~~~~~~
.../ksz_ptp.c:1109:55: note: treat the string as an argument to avoid this
 1109 |         snprintf(ptpmsg_irq->name, sizeof(ptpmsg_irq->name), name[n]);
      |                                                              ^
      |                                                              "%s",

As what we are really dealing with here is a string copy, it seems make
sense to use a function designed for this purpose. In this case null
padding is not required, so strscpy is appropriate. And as the
destination is an array, the 2-argument variant may be used.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/dsa/microchip/ksz_ptp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/microchip/ksz_ptp.c b/drivers/net/dsa/microchip/ksz_ptp.c
index 050f17c43ef6..22fb9ef4645c 100644
--- a/drivers/net/dsa/microchip/ksz_ptp.c
+++ b/drivers/net/dsa/microchip/ksz_ptp.c
@@ -1106,7 +1106,7 @@ static int ksz_ptp_msg_irq_setup(struct ksz_port *port, u8 n)
 	ptpmsg_irq->port = port;
 	ptpmsg_irq->ts_reg = ops->get_port_addr(port->num, ts_reg[n]);
 
-	snprintf(ptpmsg_irq->name, sizeof(ptpmsg_irq->name), name[n]);
+	strscpy(ptpmsg_irq->name, name[n]);
 
 	ptpmsg_irq->num = irq_find_mapping(port->ptpirq.domain, n);
 	if (ptpmsg_irq->num < 0)

-- 
2.45.2


