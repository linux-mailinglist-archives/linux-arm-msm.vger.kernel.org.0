Return-Path: <linux-arm-msm+bounces-78634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 037E5C030EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 20:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FE0F19C1916
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 18:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4938299AB5;
	Thu, 23 Oct 2025 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="dlA7gAms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F9E25E44D
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 18:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761245258; cv=none; b=dMlC4bl4Q/pGUHiAwhD52YQESBoleqr6tnwbSDu2A1ThCBkIWLuMZQPupQZkprZVYEhXSRGtULca5dfK4HoU+JKV6XNcAQdREC0RBjtB+ShtN/oRahxnc78kSvcrgA189yfsVS8gUWvokTG+/BoVb/hPf+rTBcwd52sKFJeAyPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761245258; c=relaxed/simple;
	bh=giR1Ap2iAT4cSqjTbCqfpt2EFuxHIrCAvla6fe0mugo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fTLBaBf2ssVuMwmQkKyAWbhKj7RBthRAT9/oPw2H9PJ29evwGMogtsCm1fIMfsqlN1q4Oem13FTd+XfAdY7QwpbcljqDGNgsVysJwQkUsnhLelCmvqAzkx/uEnIP/ugnhle8TKQjKGRI1bgqo5/aUl9UkuPz0N/byh436u2dSRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=dlA7gAms; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7833765433cso1547433b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1761245256; x=1761850056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDlTS66uQs02ZrCh1NQbJm6uxfOa1C37VmD1HX7Ng0A=;
        b=dlA7gAmsoJ1vVPXVmzHBVvcFxF3+h+Ywqi42UhDl/llWfLzpjfiGpB+FHBH9ijcjWd
         hmNVwAL/8A36jWJTIzvEYON/db2d1gR1HLA6k6Qlj3ribNS8g9u0H9cuUXM4oCAM54Kp
         HcUbKqktvIUyhxMsLZ6723z9E0Ap+F3Fx+Va71BvNgmhU8ToURdfwD4UWOnIgWoHeorL
         S6V9Eyltkk6ojvGJocgxzTxQ56mzcs1kOThCJheQJdyyWxgNKC7nLFGPW0bLlFQhnjOT
         acuCMJ4o2tb1+lRWpnfstL9TzW+PWEDi0Ut77NblSf+5mx/Gr9KnIUjeMmgqAtEoOWbv
         6mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761245256; x=1761850056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDlTS66uQs02ZrCh1NQbJm6uxfOa1C37VmD1HX7Ng0A=;
        b=CVnbqOhWRFUxWu+Lyfaubp0hjGAaEv1GHVHntfb7nHMQ0+qDa02c4C9n6zr92RS4vW
         rHK7yEyAA3T28E4+9fYuRLkcE6/yKGYkQTHYD48ADwngANbIR6Joy7PYpeFYktY1bB2S
         qM0o59BU+7ZwLfLVTGEXHzZjltx3m+rTyZRdyoSgre737qrFEBVoifId87A4PTuYHQzT
         Ac49Th2ZmXTsSu/qGzHXCy39WadN09ziZsau2dqS91JkClWm6wSov68C67YtLzJ/QFzl
         wd5xZF72k0aW76PlHCcGw7kNp44S9wSGFBKinFAa0D9zmAlb/HUm/wXplzTlE5S+xuUp
         zelA==
X-Forwarded-Encrypted: i=1; AJvYcCWk9sVS2En8aSTmqW4TPOtlMeTTJ+usq0ke24glQcbQQagyPodH1VWITz81kjf9LtdLvk3VuS8VQIDn9wkf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8OOAWiNX2GyfhdMNrAIZbrrplX36/IrK9XcCD4r785RgO7go9
	CC2B93BuctMdHtwGnGEf2YsoTgxYoMNrwL/I91TTrNzL0MOFgicybJboGz1jHclhlTg=
X-Gm-Gg: ASbGncsWHSstPa/kR/r4og3kOJY917VoQm4sBbSee9aMZXfVqkZbc3oh5M3gzwjhLT8
	XodMkd3cOSC/Hg51le65K5D0BRYDKPHCh11GGu9e0gFWEV2wl5mrjQMq3JIz3NvwAh9luuVpU6D
	mbUe1kDq46eDwLWVoRv5CLAJBPeJvs1HKIZ6x6zYth1lvQYHk9QOArHb5NzV3oRgaVYH0/Dc4O3
	Zngou0vpMQuUJ09uufq5gNmyOWoBg86F+tkTJTE5b5k/5XIofD4VsrSQAyYTFe+aaQXZvt99i8g
	jRQQUayVTgk5N5NXDrWSEFJwg1WhKWPv3WhcmiZYgk3Lyd5shOApQbJNNn3GfcrWlLpDRBOiEC6
	kyNNvAkFFpENYuD2x6ZFMpSswz9Yd0CCchpp/rpi9zlQXunt9NNeNPIBLuPCqVBgYZdkbzqcWEO
	vnew==
X-Google-Smtp-Source: AGHT+IF8HQIHdGLUBu61JKxd11Dvm79npjsLYZBdWDhc4aMFaVHyj557vf//cPT1d4ZxPBolSup6cw==
X-Received: by 2002:a05:6a21:9986:b0:320:3da8:34d7 with SMTP id adf61e73a8af0-334a85661b7mr32411910637.22.1761245256047;
        Thu, 23 Oct 2025 11:47:36 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb9259sm2793961a12.2.2025.10.23.11.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 11:47:35 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>,
	Yang Li <yang.li@amlogic.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Francesco Valla <francesco@valla.it>
Subject: [PATCH] Bluetooth: fix corruption in h4_recv_buf() after cleanup
Date: Thu, 23 Oct 2025 11:47:19 -0700
Message-ID: <ab6fa50055fa0c39e5501c123c36e662eb48ae61.1761245114.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks to Francesco Valla's investigation, the reason for the duplicate
code I recently cleaned up is finally clear: a different structure is
stored in drvdata for the drivers which used that duplicate function,
but h4_recv_buf() assumes drvdata is always an hci_uart structure.

Consequently, alignment and padding are now randomly corrupted for
btmtkuart, btnxpuart, and bpa10x in h4_recv_buf(), causing erratic
breakage.

Fix this by making the hci_uart structure the explicit argument to
h4_recv_buf(). Every caller already has a reference to hci_uart, and
already obtains the hci_hdev reference through it, so this actually
eliminates a redundant pointer indirection for all existing callers.

Fixes: 93f06f8f0daf ("Bluetooth: remove duplicate h4_recv_buf() in header")
Reported-by: Francesco Valla <francesco@valla.it>
Closes: https://lore.kernel.org/lkml/6837167.ZASKD2KPVS@fedora.fritz.box/
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/bluetooth/bpa10x.c    | 4 +++-
 drivers/bluetooth/btmtkuart.c | 4 +++-
 drivers/bluetooth/btnxpuart.c | 4 +++-
 drivers/bluetooth/hci_ag6xx.c | 2 +-
 drivers/bluetooth/hci_aml.c   | 2 +-
 drivers/bluetooth/hci_ath.c   | 2 +-
 drivers/bluetooth/hci_bcm.c   | 2 +-
 drivers/bluetooth/hci_h4.c    | 6 +++---
 drivers/bluetooth/hci_intel.c | 2 +-
 drivers/bluetooth/hci_ll.c    | 2 +-
 drivers/bluetooth/hci_mrvl.c  | 6 +++---
 drivers/bluetooth/hci_nokia.c | 4 ++--
 drivers/bluetooth/hci_qca.c   | 2 +-
 drivers/bluetooth/hci_uart.h  | 2 +-
 14 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/bluetooth/bpa10x.c b/drivers/bluetooth/bpa10x.c
index b7ba667a3d09..e305d04aac9d 100644
--- a/drivers/bluetooth/bpa10x.c
+++ b/drivers/bluetooth/bpa10x.c
@@ -41,6 +41,7 @@ struct bpa10x_data {
 	struct usb_anchor rx_anchor;
 
 	struct sk_buff *rx_skb[2];
+	struct hci_uart hu;
 };
 
 static void bpa10x_tx_complete(struct urb *urb)
@@ -96,7 +97,7 @@ static void bpa10x_rx_complete(struct urb *urb)
 	if (urb->status == 0) {
 		bool idx = usb_pipebulk(urb->pipe);
 
-		data->rx_skb[idx] = h4_recv_buf(hdev, data->rx_skb[idx],
+		data->rx_skb[idx] = h4_recv_buf(&data->hu, data->rx_skb[idx],
 						urb->transfer_buffer,
 						urb->actual_length,
 						bpa10x_recv_pkts,
@@ -388,6 +389,7 @@ static int bpa10x_probe(struct usb_interface *intf,
 	hci_set_drvdata(hdev, data);
 
 	data->hdev = hdev;
+	data->hu.hdev = hdev;
 
 	SET_HCIDEV_DEV(hdev, &intf->dev);
 
diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index d9b90ea2ad38..27aa48ff3ac2 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -79,6 +79,7 @@ struct btmtkuart_dev {
 	u16	stp_dlen;
 
 	const struct btmtkuart_data *data;
+	struct hci_uart hu;
 };
 
 #define btmtkuart_is_standalone(bdev)	\
@@ -368,7 +369,7 @@ static void btmtkuart_recv(struct hci_dev *hdev, const u8 *data, size_t count)
 		sz_left -= adv;
 		p_left += adv;
 
-		bdev->rx_skb = h4_recv_buf(bdev->hdev, bdev->rx_skb, p_h4,
+		bdev->rx_skb = h4_recv_buf(&bdev->hu, bdev->rx_skb, p_h4,
 					   sz_h4, mtk_recv_pkts,
 					   ARRAY_SIZE(mtk_recv_pkts));
 		if (IS_ERR(bdev->rx_skb)) {
@@ -858,6 +859,7 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 	}
 
 	bdev->hdev = hdev;
+	bdev->hu.hdev = hdev;
 
 	hdev->bus = HCI_UART;
 	hci_set_drvdata(hdev, bdev);
diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index d5153fed0518..3b1e9224e965 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -212,6 +212,7 @@ struct btnxpuart_dev {
 	struct ps_data psdata;
 	struct btnxpuart_data *nxp_data;
 	struct reset_control *pdn;
+	struct hci_uart hu;
 };
 
 #define NXP_V1_FW_REQ_PKT	0xa5
@@ -1756,7 +1757,7 @@ static size_t btnxpuart_receive_buf(struct serdev_device *serdev,
 
 	ps_start_timer(nxpdev);
 
-	nxpdev->rx_skb = h4_recv_buf(nxpdev->hdev, nxpdev->rx_skb, data, count,
+	nxpdev->rx_skb = h4_recv_buf(&nxpdev->hu, nxpdev->rx_skb, data, count,
 				     nxp_recv_pkts, ARRAY_SIZE(nxp_recv_pkts));
 	if (IS_ERR(nxpdev->rx_skb)) {
 		int err = PTR_ERR(nxpdev->rx_skb);
@@ -1875,6 +1876,7 @@ static int nxp_serdev_probe(struct serdev_device *serdev)
 	reset_control_deassert(nxpdev->pdn);
 
 	nxpdev->hdev = hdev;
+	nxpdev->hu.hdev = hdev;
 
 	hdev->bus = HCI_UART;
 	hci_set_drvdata(hdev, nxpdev);
diff --git a/drivers/bluetooth/hci_ag6xx.c b/drivers/bluetooth/hci_ag6xx.c
index 2d40302409ff..94588676510f 100644
--- a/drivers/bluetooth/hci_ag6xx.c
+++ b/drivers/bluetooth/hci_ag6xx.c
@@ -105,7 +105,7 @@ static int ag6xx_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	ag6xx->rx_skb = h4_recv_buf(hu->hdev, ag6xx->rx_skb, data, count,
+	ag6xx->rx_skb = h4_recv_buf(hu, ag6xx->rx_skb, data, count,
 				    ag6xx_recv_pkts,
 				    ARRAY_SIZE(ag6xx_recv_pkts));
 	if (IS_ERR(ag6xx->rx_skb)) {
diff --git a/drivers/bluetooth/hci_aml.c b/drivers/bluetooth/hci_aml.c
index 707e90f80130..b1f32c5a8a3f 100644
--- a/drivers/bluetooth/hci_aml.c
+++ b/drivers/bluetooth/hci_aml.c
@@ -650,7 +650,7 @@ static int aml_recv(struct hci_uart *hu, const void *data, int count)
 	struct aml_data *aml_data = hu->priv;
 	int err;
 
-	aml_data->rx_skb = h4_recv_buf(hu->hdev, aml_data->rx_skb, data, count,
+	aml_data->rx_skb = h4_recv_buf(hu, aml_data->rx_skb, data, count,
 				       aml_recv_pkts,
 				       ARRAY_SIZE(aml_recv_pkts));
 	if (IS_ERR(aml_data->rx_skb)) {
diff --git a/drivers/bluetooth/hci_ath.c b/drivers/bluetooth/hci_ath.c
index dbfe34664633..8d2b5e7f0d6a 100644
--- a/drivers/bluetooth/hci_ath.c
+++ b/drivers/bluetooth/hci_ath.c
@@ -191,7 +191,7 @@ static int ath_recv(struct hci_uart *hu, const void *data, int count)
 {
 	struct ath_struct *ath = hu->priv;
 
-	ath->rx_skb = h4_recv_buf(hu->hdev, ath->rx_skb, data, count,
+	ath->rx_skb = h4_recv_buf(hu, ath->rx_skb, data, count,
 				  ath_recv_pkts, ARRAY_SIZE(ath_recv_pkts));
 	if (IS_ERR(ath->rx_skb)) {
 		int err = PTR_ERR(ath->rx_skb);
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index f96617b85d87..fff845ed44e3 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -698,7 +698,7 @@ static int bcm_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	bcm->rx_skb = h4_recv_buf(hu->hdev, bcm->rx_skb, data, count,
+	bcm->rx_skb = h4_recv_buf(hu, bcm->rx_skb, data, count,
 				  bcm_recv_pkts, ARRAY_SIZE(bcm_recv_pkts));
 	if (IS_ERR(bcm->rx_skb)) {
 		int err = PTR_ERR(bcm->rx_skb);
diff --git a/drivers/bluetooth/hci_h4.c b/drivers/bluetooth/hci_h4.c
index 9070e31a68bf..ec017df8572c 100644
--- a/drivers/bluetooth/hci_h4.c
+++ b/drivers/bluetooth/hci_h4.c
@@ -112,7 +112,7 @@ static int h4_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	h4->rx_skb = h4_recv_buf(hu->hdev, h4->rx_skb, data, count,
+	h4->rx_skb = h4_recv_buf(hu, h4->rx_skb, data, count,
 				 h4_recv_pkts, ARRAY_SIZE(h4_recv_pkts));
 	if (IS_ERR(h4->rx_skb)) {
 		int err = PTR_ERR(h4->rx_skb);
@@ -151,12 +151,12 @@ int __exit h4_deinit(void)
 	return hci_uart_unregister_proto(&h4p);
 }
 
-struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
+struct sk_buff *h4_recv_buf(struct hci_uart *hu, struct sk_buff *skb,
 			    const unsigned char *buffer, int count,
 			    const struct h4_recv_pkt *pkts, int pkts_count)
 {
-	struct hci_uart *hu = hci_get_drvdata(hdev);
 	u8 alignment = hu->alignment ? hu->alignment : 1;
+	struct hci_dev *hdev = hu->hdev;
 
 	/* Check for error from previous call */
 	if (IS_ERR(skb))
diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index 9b353c3d6442..1d6e09508f1f 100644
--- a/drivers/bluetooth/hci_intel.c
+++ b/drivers/bluetooth/hci_intel.c
@@ -972,7 +972,7 @@ static int intel_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	intel->rx_skb = h4_recv_buf(hu->hdev, intel->rx_skb, data, count,
+	intel->rx_skb = h4_recv_buf(hu, intel->rx_skb, data, count,
 				    intel_recv_pkts,
 				    ARRAY_SIZE(intel_recv_pkts));
 	if (IS_ERR(intel->rx_skb)) {
diff --git a/drivers/bluetooth/hci_ll.c b/drivers/bluetooth/hci_ll.c
index 7044c86325ce..6f4e25917b86 100644
--- a/drivers/bluetooth/hci_ll.c
+++ b/drivers/bluetooth/hci_ll.c
@@ -429,7 +429,7 @@ static int ll_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	ll->rx_skb = h4_recv_buf(hu->hdev, ll->rx_skb, data, count,
+	ll->rx_skb = h4_recv_buf(hu, ll->rx_skb, data, count,
 				 ll_recv_pkts, ARRAY_SIZE(ll_recv_pkts));
 	if (IS_ERR(ll->rx_skb)) {
 		int err = PTR_ERR(ll->rx_skb);
diff --git a/drivers/bluetooth/hci_mrvl.c b/drivers/bluetooth/hci_mrvl.c
index e08222395772..8767522ec4c6 100644
--- a/drivers/bluetooth/hci_mrvl.c
+++ b/drivers/bluetooth/hci_mrvl.c
@@ -264,9 +264,9 @@ static int mrvl_recv(struct hci_uart *hu, const void *data, int count)
 				!test_bit(STATE_FW_LOADED, &mrvl->flags))
 		return count;
 
-	mrvl->rx_skb = h4_recv_buf(hu->hdev, mrvl->rx_skb, data, count,
-				    mrvl_recv_pkts,
-				    ARRAY_SIZE(mrvl_recv_pkts));
+	mrvl->rx_skb = h4_recv_buf(hu, mrvl->rx_skb, data, count,
+				   mrvl_recv_pkts,
+				   ARRAY_SIZE(mrvl_recv_pkts));
 	if (IS_ERR(mrvl->rx_skb)) {
 		int err = PTR_ERR(mrvl->rx_skb);
 		bt_dev_err(hu->hdev, "Frame reassembly failed (%d)", err);
diff --git a/drivers/bluetooth/hci_nokia.c b/drivers/bluetooth/hci_nokia.c
index cd7575c20f65..1e65b541f8ad 100644
--- a/drivers/bluetooth/hci_nokia.c
+++ b/drivers/bluetooth/hci_nokia.c
@@ -624,8 +624,8 @@ static int nokia_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	btdev->rx_skb = h4_recv_buf(hu->hdev, btdev->rx_skb, data, count,
-				  nokia_recv_pkts, ARRAY_SIZE(nokia_recv_pkts));
+	btdev->rx_skb = h4_recv_buf(hu, btdev->rx_skb, data, count,
+				    nokia_recv_pkts, ARRAY_SIZE(nokia_recv_pkts));
 	if (IS_ERR(btdev->rx_skb)) {
 		err = PTR_ERR(btdev->rx_skb);
 		dev_err(dev, "Frame reassembly failed (%d)", err);
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4cff4d9be313..888176b0faa9 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1277,7 +1277,7 @@ static int qca_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	qca->rx_skb = h4_recv_buf(hu->hdev, qca->rx_skb, data, count,
+	qca->rx_skb = h4_recv_buf(hu, qca->rx_skb, data, count,
 				  qca_recv_pkts, ARRAY_SIZE(qca_recv_pkts));
 	if (IS_ERR(qca->rx_skb)) {
 		int err = PTR_ERR(qca->rx_skb);
diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index cbbe79b241ce..48ac7ca9334e 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -162,7 +162,7 @@ struct h4_recv_pkt {
 int h4_init(void);
 int h4_deinit(void);
 
-struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
+struct sk_buff *h4_recv_buf(struct hci_uart *hu, struct sk_buff *skb,
 			    const unsigned char *buffer, int count,
 			    const struct h4_recv_pkt *pkts, int pkts_count);
 #endif
-- 
2.47.3


