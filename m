Return-Path: <linux-arm-msm+bounces-26387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CB59333B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 727B01C22915
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195CF73478;
	Tue, 16 Jul 2024 21:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exalondelft.nl header.i=@exalondelft.nl header.b="Dz1ycs7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailfilter03-out30.webhostingserver.nl (mailfilter03-out30.webhostingserver.nl [195.211.72.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB730745E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.211.72.164
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721166186; cv=pass; b=SAH8fYVwosc/9Ov/PKNPIAChJVmsnfsRu/r0mGwnx0Bp/n2LJWRoJnDv39D6Qma0Wxb5Z4mNimRGyePf5b/8XPDBJwW1I1iPZcIPo2GUaocHEYHtGB6k4mY9+FbKscLwlOlUEv/gsG4jUfgMpz1GcCX9+TRYhNxw106KjdUUiDY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721166186; c=relaxed/simple;
	bh=5nOYTiZUFbIJMQxTHzZWXFiNJ/jLiZGpNmn9mZSA4Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPffY3N+r2wbRIv+qoOxgWEa8xIVi4gDdn8zUXSFrty8OutE4hLaJSoDzh1Ys+riBuDu2aXiuvRcqlMugEcLv+39hxbsvXUdAfTP+vuX9mx7m5p5Ezf7b38yiHJNsPsAoN0IoDZFWPsIHDTMDRJxFZtxstPJS6AYMkRfNHO928o=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exalondelft.nl; spf=pass smtp.mailfrom=exalondelft.nl; dkim=pass (2048-bit key) header.d=exalondelft.nl header.i=@exalondelft.nl header.b=Dz1ycs7r; arc=pass smtp.client-ip=195.211.72.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exalondelft.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exalondelft.nl
ARC-Seal: i=2; a=rsa-sha256; t=1721166112; cv=pass;
	d=webhostingserver.nl; s=whs1;
	b=xIaSRsuojISKttZ6OtZWFWxFom2BsRqw/9W7SYn48ixTrJ1moLyB/0raHe1XNMdIG9/h/Olm7w+NN
	 OIHDwU8e6gt6Er82fJR02RAfjgUVobREFLWF9NpMG/U0syMBMFp/86uMUhWJ6CZNEZvg3ZT7knms6x
	 jaLUwk/c5DVOB7wJRZDb15GWdc1P49npnrXVbpKQ3WyWw2T0AKtVuFuEZDw/S2RQAjOjpgxqn50MuY
	 WMdwpqwcWCzqywNFA585YlDnh3Eoq+oOBpmLe294UakUny98Uxo8XaaPMXnwZjKeft72nYRyaF7ZEd
	 7pjL2Nmqi8WcXS9MKOIQzJDEQ3wWNzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
	d=webhostingserver.nl; s=whs1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 dkim-signature:from;
	bh=RrIot9/oKoIM/eEyLC2074Nb3WcaSKrIOuNVhf9pQcY=;
	b=PiTIT3kIDizYDpij+WhAHoh9XyVJswOKy1ICuS5xtp0WqKisJd443y52NZrCuXDuilSk8ENJQd/1X
	 +ivbfWsohFLC8pT6FeUxGu7Xn0tyiWB63qhvgSecN47afXYrbMBUxNLM4qt91xG6rSYYMZ8pva5zkJ
	 t7Dy1iz5cD8HibltsYYKCkG8P2WUlqvrLvubMOHXFe2SmjGk3BkOX/ihvsuSwXg3p+eyWfuHv5CM7Q
	 m8PrjmsuVjLwHGO/0q0YaGvD7rXeCtaaIOQy4w4L3sszt+0StTpyDkqaLVIPTGnNkWltvYwGey5V9P
	 bPadNIhnUWAwOyc8GPQBhT2ZXLcISsA==
ARC-Authentication-Results: i=2; mailfilter03.webhostingserver.nl;
	spf=pass smtp.mailfrom=exalondelft.nl smtp.remote-ip=141.138.168.154;
	dmarc=pass header.from=exalondelft.nl;
	arc=pass header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=exalondelft.nl; s=whs1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=RrIot9/oKoIM/eEyLC2074Nb3WcaSKrIOuNVhf9pQcY=;
	b=Dz1ycs7rNKSeZMXhTzDXlaDVCEtlVRQbHkSXHxLoSyMh+LKXCGypWIK6h3IgvVuQ0ENubnyEtq3da
	 iGbwuEQmec+/NyBIaytqGcL8Zh5AUGoQf2lcjOpvp96Kx3/67JFuSQ99nZ2c9ZaxKTsPkWp+JTGukW
	 KvM+LIJYoavn1NKqRFiocG7+pCslKgRW85SNmsZfk8vev87vdS+Sa6eaoG0r+kFflPHBD0fE75IMqd
	 71T1aLYhiPz5kZVo0/ViwgTttcmlB0zV9hAX9ZdNAbuP6bJCxPnlyh36LIszWD7ITZ9YJ3nrsAb7kD
	 gfAn2hG0oKXhUAyYoA3wNjlFRgWZUmw==
X-Halon-ID: 33e55986-43bc-11ef-83a5-001a4a4cb9a5
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
	by mailfilter03.webhostingserver.nl (Halon) with ESMTPSA
	id 33e55986-43bc-11ef-83a5-001a4a4cb9a5;
	Tue, 16 Jul 2024 23:41:47 +0200 (CEST)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=webhostingserver.nl; s=whs1; t=1721166107;
	 b=GOJAta5m6JDzebBOAoiVp562w6YQe4XJIOWfbbfiRU2LNDuq5wWHplsVIF3PmktoaS3NOTQ7JT
	  Q8Bpb+7Qo9DnvFBotF/E2gxzrrq5Jw7jeyEHWJKeEoQ1ZaplR1YWwQVcPR2GsCe60O4hAPTrZD
	  7LWJI7D56fzorzSM0xgmYDJksjZiJOH2gHjD2/GCzM97epR4Ez8Iig7ZUYNP7/87z6RJtjTxke
	  3+ybOQfj1flhlnNogwWNIm2TUfdZszSNTQD1/9pliFVIyNJf+ptOo/Q7XR2r2no7ALsKmJXHnn
	  oJcPn/sfzW2Er8OSd2O1npAnIiiucLTwhLzZBtHV/X5Zag==;
ARC-Authentication-Results: i=1; webhostingserver.nl; smtp.remote-ip=2a02:a466:68ed:1:c40e:b921:8b9f:6384;
	iprev=pass (2a02-a466-68ed-1-c40e-b921-8b9f-6384.fixed6.kpn.net) smtp.remote-ip=2a02:a466:68ed:1:c40e:b921:8b9f:6384;
	auth=pass (PLAIN) smtp.auth=ferry.toth@elsinga.info;
	spf=softfail smtp.mailfrom=exalondelft.nl;
	dmarc=skipped header.from=exalondelft.nl;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=webhostingserver.nl; s=whs1; t=1721166107;
	bh=5nOYTiZUFbIJMQxTHzZWXFiNJ/jLiZGpNmn9mZSA4Vs=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	b=yy5+9Cba+S3Vze/XxPJTmcXDxn4aY9+a1iLmXV+zg3ViFrJ5zQvDBobZmR46PgTR7L1+s7mmUo
	  Ii4Fmss1uQ2haJUktxP1WAtcUSRNm3R9cqGox9a3vesNeVFi5f2WXnCRnqcKNj2umZfRcRVjbd
	  HN0p+ByOlVaxw9kciYmEBBtBhgM4611Ha9nOdfFpLFS8t0UR8Z5S/HnqVMsPiZVFBag+kEAFEj
	  zZDbL2Ygmysu9gmOsdBd3UZRSDM/Hfc1JYvy2uWo3me2gt0+iVg6keyRm27M1QRrbfBvzqAhEd
	  lnrUhkNTXwXqb9KW0ZA9j392adcdS7c/svI39Rpx5VO02Q==;
Authentication-Results: webhostingserver.nl;
	iprev=pass (2a02-a466-68ed-1-c40e-b921-8b9f-6384.fixed6.kpn.net) smtp.remote-ip=2a02:a466:68ed:1:c40e:b921:8b9f:6384;
	auth=pass (PLAIN) smtp.auth=ferry.toth@elsinga.info;
	spf=softfail smtp.mailfrom=exalondelft.nl;
	dmarc=skipped header.from=exalondelft.nl;
	arc=none
Received: from 2a02-a466-68ed-1-c40e-b921-8b9f-6384.fixed6.kpn.net ([2a02:a466:68ed:1:c40e:b921:8b9f:6384] helo=submission)
	by s198.webhostingserver.nl with esmtpa (Exim 4.97.1)
	(envelope-from <ftoth@exalondelft.nl>)
	id 1sTpvd-00000001LuK-3Zi8;
	Tue, 16 Jul 2024 23:41:45 +0200
From: Ferry Toth <ftoth@exalondelft.nl>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ferry Toth <ftoth@exalondelft.nl>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
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
Subject: [PATCH v1 1/1] tty: serial: 8250_dma: use sgl with 2 nents to take care of buffer wrap
Date: Tue, 16 Jul 2024 23:40:31 +0200
Message-ID: <20240716214055.102269-1-ftoth@exalondelft.nl>
X-Mailer: git-send-email 2.43.0
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

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
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


