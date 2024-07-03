Return-Path: <linux-arm-msm+bounces-25210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C4926A34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 23:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46DA12837A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 21:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B905191F6F;
	Wed,  3 Jul 2024 21:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exalondelft.nl header.i=@exalondelft.nl header.b="JWybxTsr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailfilter03-out30.webhostingserver.nl (mailfilter03-out30.webhostingserver.nl [195.211.72.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A041191F6D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 21:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.211.72.164
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042093; cv=pass; b=Rlua/HWx+5t7IHppQJOCAqKfBgwKc65EVhDKfUutmwQgdZ6BE9lXBV5KRpBaAzTTWEyZ1JXg38W38N7/ic0W4UrzJ14dLDJVkq2RCOVBPEO+kOyCj88sCjxJc5hp874obj2uKZxbTx/Yw/oSAyNUOZ0k+afgQGFD7aKsitD3PT8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042093; c=relaxed/simple;
	bh=bucvDq82UCNSD+67uMZYm6q8M4bzaWSZUAKzstC+xig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZquD4xeFF3AqZyPwGq6wD3KcJKL4kvgRV6lINAKSsYNEuaXKn8nvUiRwdchYpRv1XKxhF80BQM7M/TaOp7M5ToWwNYm8ruOszZ0x23anQsJ5puG1chgyMdu2yMeX5JTdnPp1CQjrzX8JRKY3utiNblMW/D0OjnOk3T4i632FE4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exalondelft.nl; spf=pass smtp.mailfrom=exalondelft.nl; dkim=pass (2048-bit key) header.d=exalondelft.nl header.i=@exalondelft.nl header.b=JWybxTsr; arc=pass smtp.client-ip=195.211.72.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exalondelft.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exalondelft.nl
ARC-Seal: i=2; a=rsa-sha256; t=1720042088; cv=pass;
	d=webhostingserver.nl; s=whs1;
	b=yWhxrBDYK7HnBUjr3DBqvxxz7AruYcvkh9WTKRSDJh09F42xb5bOSOPcdG7dGewPqeAQDYQEv5NCH
	 nv+MpEMPB6Ph5kpURJJYQyk0sOS3UFFDLlMwtg0diGPTPg0EPuAJGdPJyn2k4xbTmkN4EENIoG7ZjH
	 1Xqn46ZTDl6AN0J1oDh1ai7/Dn/bpuxGT31FK5OIpVW13NkhRU6VIAR/N1vT8ep/8NgG/NWROocqVW
	 sFIHp2ch8aDkydmY9xjAImqgJcdk4RAXI5f9tR6EdifBfl58wh3S7kHIG5Q+IL1sA8UeqpyJ9hUF2w
	 O+nPSzBDD6NHV8OUCKXgJe6tiFMeBjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
	d=webhostingserver.nl; s=whs1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:dkim-signature:from;
	bh=ExCvBq2B6b3v1cz2QJJU7mhzraTs+iDw4D8TJVszd78=;
	b=OaUB7ssuJIc4MXtNFyUuSr72NQSuTL6nQADU83ORFotR6qEFYhahuCbhcRF5e9HUHO4NXqrrEbHmy
	 XxTilm1yzH+69xu75g3hfKZm6lgFF+udtqqMSYvNJocNgF+DaMp8efYD0f92xoOEBguXiBf3hTAMBz
	 3iegbEF9CZ/G91nLVl0LH2JhR/RKLpVe0kyLqXGTkbUdedfE3UhNAv4I5bGtWWxE8EuF/v/mAnBLvC
	 jpPp0JQ3illyfujrz1Kpk8vlETs5EjBiVUYWyU9OLLn5czIxLsz4JA2jZ5c53Bx8rfJdaIJrQVHc6x
	 8/Zx7HT5utaQJoW754sephAZw7a1Juw==
ARC-Authentication-Results: i=2; mailfilter03.webhostingserver.nl;
	spf=pass smtp.mailfrom=exalondelft.nl smtp.remote-ip=141.138.168.154;
	dmarc=pass header.from=exalondelft.nl;
	arc=pass header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=exalondelft.nl; s=whs1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=ExCvBq2B6b3v1cz2QJJU7mhzraTs+iDw4D8TJVszd78=;
	b=JWybxTsr7tW6lF1kU7nvWJvyysslL+re85VlXocx+Kc53SsEbu+i6p6Pa5d82HVsNxu4PioDf2x9j
	 xrb/ho4/xBWBCqUWhQt5qA8B6gBKjrO0ruQ1x+uJtglhuSa2HQi9pgIP/osPX23uattHHYZlttUYzU
	 idTdVjNtGr3SPID+bu0Riq+7oIiehDj2q2BhossmUj1O5f7NbOo+oql9cY/O5iyoQ1KQKLGkHlSxdt
	 oocAy1rTPZT/HTU2gHqxDJAVgxGPZXnQIENDcmFwQYEPOXlnm+b0z7kRPcz3H7kcWzz6k5Y35obFqX
	 GSCABLfWxlKnNm/atYUa2G3y5evthPw==
X-Halon-ID: 2169d692-3983-11ef-b271-001a4a4cb9a5
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
	by mailfilter03.webhostingserver.nl (Halon) with ESMTPSA
	id 2169d692-3983-11ef-b271-001a4a4cb9a5;
	Wed, 03 Jul 2024 23:28:03 +0200 (CEST)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=webhostingserver.nl; s=whs1; t=1720042083;
	 b=dNXQNm3UVgwJiRG1Lat5Dboc2T9kVeWArEJOaM/6LxhQPasnrNGReen1M5r++7qVtGKjIi9+s0
	  5Qf8wt6YvGRbFFy0OL3uv0O/zVlbkA9i0o5d/LP44urpWU/2KQarDzXV2lo1scej8JwqL/2XvU
	  gb1oDQFWZR//sT9fqYwb0m6GGV7fVh1KxyJh1fxAyk+xMUWPdS7KxnWJeOwiIuNdawzsJPlVNK
	  4PJLD0YDuXZM2fUvOCz/z5FFOIst6/mHYzjr2Py9n758Q2CFTwf2PFRLjbP63J4DvFyMU4qQdQ
	  eaLUXUim882uOcqUNBajDROX8H20wCYUbjrezOx67Hwaiw==;
ARC-Authentication-Results: i=1; webhostingserver.nl; smtp.remote-ip=2a02:a466:68ed:1:46c9:4818:36c:3aae;
	iprev=pass (2a02-a466-68ed-1-46c9-4818-36c-3aae.fixed6.kpn.net) smtp.remote-ip=2a02:a466:68ed:1:46c9:4818:36c:3aae;
	auth=pass (PLAIN) smtp.auth=ferry.toth@elsinga.info;
	spf=softfail smtp.mailfrom=exalondelft.nl;
	dmarc=skipped header.from=exalondelft.nl;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=webhostingserver.nl; s=whs1; t=1720042083;
	bh=bucvDq82UCNSD+67uMZYm6q8M4bzaWSZUAKzstC+xig=;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
	  Date:Subject:Cc:To:From;
	b=Wf99J9XA0wD6dDpOTyhI0DShfE+CjPJNyPEkOBrEzj1J3eiKb9m6n4uFH54MLBsI3wMzy+0vCe
	  Yu6ONE2gk6vDxp59WSYjPPdau5zwcpWpQUIuYJKVGq9/cuRUImgkgoP4iiiisof0STxseOYg80
	  XKDs9ZpnjoYYsWUYZgWMWIkK4K+0NjymJ2pIqV5eCNup3uvHN5tXlByfGo+Z0lgZfRnlI7Nvxf
	  Y1e+8F1uxujw5DTf5jAJRPxFG226uKTo2Xx4fDeCCsdFaEDEsH7pq+i2kW7FlLhqxErZWwzebW
	  qaUAHq2FWeBAb+4uj8svo0GTQ6qqmVFM3vuOKfbneDtb9w==;
Authentication-Results: webhostingserver.nl;
	iprev=pass (2a02-a466-68ed-1-46c9-4818-36c-3aae.fixed6.kpn.net) smtp.remote-ip=2a02:a466:68ed:1:46c9:4818:36c:3aae;
	auth=pass (PLAIN) smtp.auth=ferry.toth@elsinga.info;
	spf=softfail smtp.mailfrom=exalondelft.nl;
	dmarc=skipped header.from=exalondelft.nl;
	arc=none
Received: from 2a02-a466-68ed-1-46c9-4818-36c-3aae.fixed6.kpn.net ([2a02:a466:68ed:1:46c9:4818:36c:3aae] helo=submission)
	by s198.webhostingserver.nl with esmtpa (Exim 4.97.1)
	(envelope-from <ftoth@exalondelft.nl>)
	id 1sP7WF-0000000CSYn-0MH8;
	Wed, 03 Jul 2024 23:28:03 +0200
From: Ferry Toth <ftoth@exalondelft.nl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ferry Toth <ftoth@exalondelft.nl>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: neil.armstrong@linaro.org,
	AlCooper <alcooperx@gmail.com>,
	AlexanderShiyan <shc_work@mail.ru>,
	AlexandreBelloni <alexandre.belloni@bootlin.com>,
	AlexandreTorgue <alexandre.torgue@foss.st.com>,
	AlimAkhtar <alim.akhtar@samsung.com>,
	AndrewMorton <akpm@linux-foundation.org>,
	"AneeshKumarK . V" <aneesh.kumar@kernel.org>,
	AngeloGioacchinoDelRegno <angelogioacchino.delregno@collabora.com>,
	BaolinWang <baolin.wang@linux.alibaba.com>,
	BaruchSiach <baruch@tkos.co.il>,
	BjornAndersson <andersson@kernel.org>,
	ClaudiuBeznea <claudiu.beznea@tuxon.dev>,
	"DavidS . Miller" <davem@davemloft.net>,
	FabioEstevam <festevam@gmail.com>,
	HammerHsieh <hammerh0314@gmail.com>,
	=?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
	ChristopheLeroy <christophe.leroy@csgroup.eu>,
	ChunyanZhang <zhang.lyra@gmail.com>,
	JeromeBrunet <jbrunet@baylibre.com>,
	JonathanHunter <jonathanh@nvidia.com>,
	KevinHilman <khilman@baylibre.com>,
	KonradDybcio <konrad.dybcio@linaro.org>,
	KrzysztofKozlowski <krzysztof.kozlowski@linaro.org>,
	KumaravelThiagarajan <kumaravel.thiagarajan@microchip.com>,
	LaxmanDewangan <ldewangan@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	"MaciejW . Rozycki" <macro@orcam.me.uk>,
	ManivannanSadhasivam <manivannan.sadhasivam@linaro.org>,
	MartinBlumenstingl <martin.blumenstingl@googlemail.com>,
	MatthiasBrugger <matthias.bgg@gmail.com>,
	MaximeCoquelin <mcoquelin.stm32@gmail.com>,
	MichaelEllerman <mpe@ellerman.id.au>,
	MichalSimek <michal.simek@amd.com>,
	"NaveenN . Rao" <naveen.n.rao@linux.ibm.com>,
	NicolasFerre <nicolas.ferre@microchip.com>,
	NicholasPiggin <npiggin@gmail.com>,
	OrsonZhai <orsonzhai@gmail.com>,
	=?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>,
	PatriceChotard <patrice.chotard@foss.st.com>,
	PeterKorsgaard <jacmet@sunsite.dk>,
	RichardGenoud <richard.genoud@gmail.com>,
	RussellKing <linux@armlinux.org.uk>,
	SaschaHauer <s.hauer@pengutronix.de>,
	ShawnGuo <shawnguo@kernel.org>,
	StefaniSeibold <stefani@seibold.net>,
	SumitSemwal <sumit.semwal@linaro.org>,
	TaichiSugaya <sugaya.taichi@socionext.com>,
	TakaoOrito <orito.takao@socionext.com>,
	TharunKumarP <tharunkumar.pasumarthi@microchip.com>,
	ThierryReding <thierry.reding@gmail.com>,
	TimurTabi <timur@kernel.org>,
	VineetGupta <vgupta@kernel.org>,
	MarekSzyprowski <m.szyprowski@samsung.com>,
	PhilEdworthy <phil.edworthy@renesas.com>
Subject: [PATCH/RFC v1 1/1] tty: serial: 8250_dma: use sgl with 2 nents to take care of buffer wrap
Date: Wed,  3 Jul 2024 22:56:37 +0200
Message-ID: <20240703212613.56024-2-ftoth@exalondelft.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240703212613.56024-1-ftoth@exalondelft.nl>
References: <20240703212613.56024-1-ftoth@exalondelft.nl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ACL-Warn: Sender domain ( exalondelft.nl ) must match your domain name used in authenticated email user ( ferry.toth@elsinga.info ).
X-ACL-Warn: From-header domain ( exalondelft.nl} ) must match your domain name used in authenticated email user ( ferry.toth@elsinga.info )
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus

Previously 8250_dma used a circular xmit->buf as DMA output buffer. This
causes messages that wrap around in the circular buffer to be
transmitted using 2 DMA transfers. Depending on baud rate and processor
load this can cause an interchar gap in the middle of the message. On
the receiving end the gap may cause a short receive timeout, possibly
long enough to terminate a DMA transfer, but too short to restart a
receive DMA transfer in time thus causing a receive buffer overrun.

This is especially a problem for devices with high speed UARTs (HSU)
where even deep 64 byte FIFO's are not sufficient to handle interrupt
latency.

The circular buffer has now been replaced by kfifo which requires a SG
list with a single entry, which still causes 2 dma transfers when a wrap
around occurs. Fix this by allowing up to 2 entries in the sgl.

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
---
 drivers/tty/serial/8250/8250_dma.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 8a353e3cc3dd..d215c494ee24 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -89,7 +89,9 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 	struct tty_port			*tport = &p->port.state->port;
 	struct dma_async_tx_descriptor	*desc;
 	struct uart_port		*up = &p->port;
-	struct scatterlist sg;
+	struct scatterlist		*sg;
+	struct scatterlist		sgl[2];
+	int i;
 	int ret;
 
 	if (dma->tx_running) {
@@ -110,18 +112,17 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 
 	serial8250_do_prepare_tx_dma(p);
 
-	sg_init_table(&sg, 1);
-	/* kfifo can do more than one sg, we don't (quite yet) */
-	ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
+	sg_init_table(sgl, ARRAY_SIZE(sgl));
+
+	ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, sgl, ARRAY_SIZE(sgl),
 					   UART_XMIT_SIZE, dma->tx_addr);
 
-	/* we already checked empty fifo above, so there should be something */
-	if (WARN_ON_ONCE(ret != 1))
-		return 0;
+	dma->tx_size = 0;
 
-	dma->tx_size = sg_dma_len(&sg);
+	for_each_sg(sgl, sg, ret, i)
+		dma->tx_size += sg_dma_len(sg);
 
-	desc = dmaengine_prep_slave_sg(dma->txchan, &sg, 1,
+	desc = dmaengine_prep_slave_sg(dma->txchan, sgl, ret,
 				       DMA_MEM_TO_DEV,
 				       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc) {
-- 
2.43.0


