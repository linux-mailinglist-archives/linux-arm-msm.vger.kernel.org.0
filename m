Return-Path: <linux-arm-msm+bounces-64874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B0B0489E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 22:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 662097B38F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 20:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D502877DF;
	Mon, 14 Jul 2025 20:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b="urrrKnqk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE047287506;
	Mon, 14 Jul 2025 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524953; cv=fail; b=YP8Oza1b3zUwssGKDjjldAoBJm5KcpmSLnzHeTSDPRhJsxc17q3shFbTlqbokdksKP3aXDid9GhHJXYrDNh/b2dLtCZoY/wlSB4c8LqjFJnCETbW6v3IeXkZ0cC1zPjm5ACJWfBhTD+tgOujbI9ClcYx08ciCIMTGBdowdFuyGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524953; c=relaxed/simple;
	bh=jV6goABlyTupqwhNIECy1oKNJ+/LIUOVx0Ahl94AR7c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pM93DJp6hheMaQeiQ9QDe7hM4TfzugEVhMW10NPoemQkXwVJTi/QSJ7KOqfK62bpzgFBNLzp8p1cN2W1coeTm5y4q34QbwlzeSMIl/r82XLJjCFx5tqaSA+1XkEBXiMR050/bQs9pKWM7AVwKBDuQZlka5c6Fgw+XxPH7ebLAIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arri.de; spf=pass smtp.mailfrom=arri.de; dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b=urrrKnqk; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arri.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arri.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jg2FOhNphQ0sG0AfQAnV5Xp4DM1cL0Otr1prbhmONdetOgJiVnpE3GLEkt9V6yVOOG+urQmSctffsQ0uBNOPrzPJ8gxz7dl4a1G7zaMf73el0pDlNm2QqMnngCv7/GPNrS76FJxdYkLP0R06FH+VrCI3hV37YGzx4hKdNAuj8hBKj3ggIS0CjPbTucHxG5G2pZxLU2cJEN6/YG0EDE9I3tjsdh14W30cgecpub3Th2cGB6QAGzVIQu2aoYI6EKgOvFqOYQOMGzkoq9d+OZ4f4xZGwXJQ9sevonN8hTbu+oDrEfLwKyiP4ZnPRPRHMpJAgvLm5qhrOO7LyrHJIMUC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=essKwkFtphxDK6wvlT05HLEZ3SuknynQM50uG43AZgc=;
 b=ftwPV4BIhoRbTA5yusHHT4v1cJP802+W5tjLTB4h5u8XRt6a5CzEFiXG/KQnIwKZQtv0tEDdiOLBcHueqXffoX/31q9KP7xV3XqW0Fo87O94F7R7In4DGBxOxMjTsrgClI9+9MBkTk0/QxgLlm+lcWNfoGWKeEkjeV6AqWp4PgfgOObAAIDRnbD1sj9k3/J/5djNLf3q4ywTJNMKkWhcWAVmWjuCVWBGIZCviC15vHnoIac6aB+MEvHEIQdoc/feehIQxh939hG9ABuls1bbGBLnRwMl5OLcJrvTGFiiC1hZpwvsGv3dWCTZrmmyR1YRKs2LvswFlqZznZZsoHvl3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=holtmann.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=essKwkFtphxDK6wvlT05HLEZ3SuknynQM50uG43AZgc=;
 b=urrrKnqkBNHlYCHyRkpQhefsTtH+thp2buurd/r942j4ti0O6+A1i3597guuDvrtGqkYSP7kkJC3lVT7ymxzt6NTBUjTRtWrZK0kvsHWeptupFhpPWVAenfiOU/Ae5y4h7zdDtaqtmF2LKMeJeCVldTJ0j7egLhDBzS7D+1g8iE=
Received: from DU6P191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::15)
 by VI0PR03MB10758.eurprd03.prod.outlook.com (2603:10a6:800:261::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 20:29:00 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::63) by DU6P191CA0040.outlook.office365.com
 (2603:10a6:10:53f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Mon,
 14 Jul 2025 20:29:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 20:28:59 +0000
Received: from N9W6SW14.arri.de (192.168.54.14) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Mon, 14 Jul
 2025 22:28:57 +0200
From: Christian Eggers <ceggers@arri.de>
To: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>, Pauli Virtanen <pav@iki.fi>, Johan Hedberg
	<johan.hedberg@gmail.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang
	<sean.wang@mediatek.com>, Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	"Neeraj Kale" <neeraj.sanjaykale@nxp.com>, Yang Li <yang.li@amlogic.com>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
	<linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <asahi@lists.linux.dev>,
	<netdev@vger.kernel.org>, Christian Eggers <ceggers@arri.de>
Subject: [PATCH 3/3] Bluetooth: hci_dev: replace 'quirks' integer by 'quirk_flags' bitmap
Date: Mon, 14 Jul 2025 22:27:45 +0200
Message-ID: <20250714202744.11578-4-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250714202744.11578-2-ceggers@arri.de>
References: <20250714202744.11578-2-ceggers@arri.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|VI0PR03MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8c8d57-cb9d-4997-1456-08ddc315105c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oqqm5iPS7njMHR3lPn4osnoofnwZa2puidS7w0OgutuT1yRVw/vHBAaJxvIe?=
 =?us-ascii?Q?+F9HNCCREJRIfTKwen8qERE65VjXSFgVKTThJDWL66P5dWnQz0wbQEqXZLf6?=
 =?us-ascii?Q?ZCIoDFT/Aj7mtr8hx94V6nb0YuL3fYbZkwM9rzGUVMNinRivJVo0UQwdiTGT?=
 =?us-ascii?Q?geT6tEtgHHy1ZEtwLRcdtCTt67R7sSvE2ezS+Suw/OlhxkLvMBr0Jfs00Hr+?=
 =?us-ascii?Q?gvC99XtOs5GCwEXot6n/BsEIUjDMddCHrMNtzxhkpU792xvdD1jX3En5Z/o6?=
 =?us-ascii?Q?Lp1B8x/xGzrRsi3fmfpWkh7nMZsW96rlUISMpi5BFFRoh671sp7Fdo3KKE7g?=
 =?us-ascii?Q?hzKKNC7S1tHEoIQV8a/epOZkMwdwVu17EZxCnymFv9S3iGPh8Ga4/oZbxYbO?=
 =?us-ascii?Q?SyOXi56gfoALPSL0RQ2dUKTt4TjeJ+W1Adrt9Y/0vOD9cOz2tCLi9Yi6GSXQ?=
 =?us-ascii?Q?LLOA8uEqxznGDilvfcdGnDvJvKly7GTFcXdpyVSGr58wmvwxa5J5GwkAu5cY?=
 =?us-ascii?Q?oQBOYCgidhPnwj5HJWbzsx/49C10SrzNAer990IBFqD8/67UYk3ln8K1iNbv?=
 =?us-ascii?Q?Ehos0fCCri6IbIkO5wUnY1Tkte9EGFpXXHCInI4JGAu/ptvTMArX4WtKqbCH?=
 =?us-ascii?Q?omBFWxtVFixtLKdxjpPjnudeh1M0QlmQjazHI2wTdiV/kP7Wg08aOKM0kx2J?=
 =?us-ascii?Q?FFcp3i6HmQtG9W3qh0aCE1+afy0pWl3ji27udnzU9424TuP9RD5A3yxC98AI?=
 =?us-ascii?Q?NM1k0Bjf1oUkusycWLJ+R749B7JgVyaPgrkO8rENZ/9nIvyJR69HGPvxXI6z?=
 =?us-ascii?Q?hkBHLSl3t6JrLAu/EcelM4/tCT3agW2OYcTQXZqMnbyOGSLePldK5A69XhT0?=
 =?us-ascii?Q?Cqmd1I1kYce16HGNOngBNv2x0Q4f2hdn+/idfOqqnH5KNcJmcrbseI5vY1Jp?=
 =?us-ascii?Q?Uwyr4cCI1IFBqdZpsU0cri6Gtqkm9Wh0z3jD9NKUH1K9gOsgIHwURXPGs5Ji?=
 =?us-ascii?Q?oyd3vVo6LVUFN2ctoSHLOStpxs2lxUW3tghit1pvSyA2FxEebAgWYC37wJJw?=
 =?us-ascii?Q?8+Vgn5CYV0TGi0JQV9ZTRDg93g5dVrYoYWWZJoL6FQJfKSg8RUTgnCYdBm8k?=
 =?us-ascii?Q?bqlvZgOAnOW+BZ965p8tjw0ekdUSxTZnBVTzyv/k+I3VQ4OEIYc0LrezMb1Q?=
 =?us-ascii?Q?N3Qo4myGGV6D+Bm5uiGQw6dNoVnKTLxFXfEkMLWzkPrqv7mWO6gGV+YmOlku?=
 =?us-ascii?Q?+voMPwFUCkhpVeo6TBHiQXlpMwigdpsT3c4mBxn5YhqGTGqoFCpdZcBzthzz?=
 =?us-ascii?Q?FL0J7Y1rcHYviSHDZ9X0Vgdi1KeIIvKV7hqlZSZTCcGRQXKxsDF30WwBqnwM?=
 =?us-ascii?Q?CNSZoc25t0Ww7bSQwSUOQRv052bjNxfTErZ0e3Bfs5UqBVtXeSOhSaQMqfiC?=
 =?us-ascii?Q?yj262ejVZ7/hAba9GinEgieSgNYeoGwlIVx3ED0R7AcXeAIj/FZ6Bxo2tNDQ?=
 =?us-ascii?Q?0OyNhG6oIL/yeJNQjPcz8/oHK5hiGSZmEJP3?=
X-Forefront-Antispam-Report:
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 20:28:59.1947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8c8d57-cb9d-4997-1456-08ddc315105c
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10758

The 'quirks' member already ran out of bits on some platforms some time
ago. Replace the integer member by a bitmap in order to have enough bits
in future. Replace raw bit operations by accessor macros.

Suggested-by: Pauli Virtanen <pav@iki.fi>
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 drivers/bluetooth/bfusb.c        |  2 +-
 drivers/bluetooth/bpa10x.c       |  2 +-
 drivers/bluetooth/btbcm.c        |  8 ++--
 drivers/bluetooth/btintel.c      | 28 ++++++-------
 drivers/bluetooth/btintel_pcie.c |  8 ++--
 drivers/bluetooth/btmtksdio.c    |  4 +-
 drivers/bluetooth/btmtkuart.c    |  2 +-
 drivers/bluetooth/btnxpuart.c    |  2 +-
 drivers/bluetooth/btqca.c        |  2 +-
 drivers/bluetooth/btqcomsmd.c    |  2 +-
 drivers/bluetooth/btrtl.c        | 10 ++---
 drivers/bluetooth/btsdio.c       |  2 +-
 drivers/bluetooth/btusb.c        | 70 ++++++++++++++++----------------
 drivers/bluetooth/hci_aml.c      |  2 +-
 drivers/bluetooth/hci_bcm.c      |  4 +-
 drivers/bluetooth/hci_bcm4377.c  | 10 ++---
 drivers/bluetooth/hci_intel.c    |  2 +-
 drivers/bluetooth/hci_ldisc.c    |  6 +--
 drivers/bluetooth/hci_nokia.c    |  2 +-
 drivers/bluetooth/hci_qca.c      | 14 +++----
 drivers/bluetooth/hci_serdev.c   |  8 ++--
 drivers/bluetooth/hci_vhci.c     |  8 ++--
 drivers/bluetooth/virtio_bt.c    | 10 ++---
 include/net/bluetooth/hci.h      |  2 +
 include/net/bluetooth/hci_core.h | 28 +++++++------
 net/bluetooth/hci_core.c         |  4 +-
 net/bluetooth/hci_debugfs.c      |  8 ++--
 net/bluetooth/hci_event.c        | 19 ++++-----
 net/bluetooth/hci_sync.c         | 59 +++++++++++++--------------
 net/bluetooth/mgmt.c             | 38 ++++++++---------
 net/bluetooth/msft.c             |  2 +-
 31 files changed, 185 insertions(+), 183 deletions(-)

diff --git a/drivers/bluetooth/bfusb.c b/drivers/bluetooth/bfusb.c
index 0d6ad50da046..8df310983bf6 100644
--- a/drivers/bluetooth/bfusb.c
+++ b/drivers/bluetooth/bfusb.c
@@ -670,7 +670,7 @@ static int bfusb_probe(struct usb_interface *intf, const struct usb_device_id *i
 	hdev->flush = bfusb_flush;
 	hdev->send  = bfusb_send_frame;
 
-	set_bit(HCI_QUIRK_BROKEN_LOCAL_COMMANDS, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LOCAL_COMMANDS);
 
 	if (hci_register_dev(hdev) < 0) {
 		BT_ERR("Can't register HCI device");
diff --git a/drivers/bluetooth/bpa10x.c b/drivers/bluetooth/bpa10x.c
index 1fa58c059cbf..8b43dfc755de 100644
--- a/drivers/bluetooth/bpa10x.c
+++ b/drivers/bluetooth/bpa10x.c
@@ -398,7 +398,7 @@ static int bpa10x_probe(struct usb_interface *intf,
 	hdev->send     = bpa10x_send_frame;
 	hdev->set_diag = bpa10x_set_diag;
 
-	set_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE);
 
 	err = hci_register_dev(hdev);
 	if (err < 0) {
diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 0a60660fc8ce..3a3a56ddbb06 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -135,7 +135,7 @@ int btbcm_check_bdaddr(struct hci_dev *hdev)
 		if (btbcm_set_bdaddr_from_efi(hdev) != 0) {
 			bt_dev_info(hdev, "BCM: Using default device address (%pMR)",
 				    &bda->bdaddr);
-			set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
+			hci_set_quirk(hdev, HCI_QUIRK_INVALID_BDADDR);
 		}
 	}
 
@@ -467,7 +467,7 @@ static int btbcm_print_controller_features(struct hci_dev *hdev)
 
 	/* Read DMI and disable broken Read LE Min/Max Tx Power */
 	if (dmi_first_match(disable_broken_read_transmit_power))
-		set_bit(HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER);
 
 	return 0;
 }
@@ -706,7 +706,7 @@ int btbcm_finalize(struct hci_dev *hdev, bool *fw_load_done, bool use_autobaud_m
 
 	btbcm_check_bdaddr(hdev);
 
-	set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
 
 	return 0;
 }
@@ -769,7 +769,7 @@ int btbcm_setup_apple(struct hci_dev *hdev)
 		kfree_skb(skb);
 	}
 
-	set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
 
 	return 0;
 }
diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 40da9f2ec237..be69d21c9aa7 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -88,7 +88,7 @@ int btintel_check_bdaddr(struct hci_dev *hdev)
 	if (!bacmp(&bda->bdaddr, BDADDR_INTEL)) {
 		bt_dev_err(hdev, "Found Intel default device address (%pMR)",
 			   &bda->bdaddr);
-		set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_INVALID_BDADDR);
 	}
 
 	kfree_skb(skb);
@@ -2027,7 +2027,7 @@ static int btintel_download_fw(struct hci_dev *hdev,
 	 */
 	if (!bacmp(&params->otp_bdaddr, BDADDR_ANY)) {
 		bt_dev_info(hdev, "No device address configured");
-		set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_INVALID_BDADDR);
 	}
 
 download:
@@ -2295,7 +2295,7 @@ static int btintel_prepare_fw_download_tlv(struct hci_dev *hdev,
 		 */
 		if (!bacmp(&ver->otp_bd_addr, BDADDR_ANY)) {
 			bt_dev_info(hdev, "No device address configured");
-			set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
+			hci_set_quirk(hdev, HCI_QUIRK_INVALID_BDADDR);
 		}
 	}
 
@@ -3435,9 +3435,9 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 	}
 
 	/* Apply the common HCI quirks for Intel device */
-	set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
-	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
-	set_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
+	hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
+	hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_DIAG);
 
 	/* Set up the quality report callback for Intel devices */
 	hdev->set_quality_report = btintel_set_quality_report;
@@ -3475,8 +3475,8 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 			 */
 			if (!btintel_test_flag(hdev,
 					       INTEL_ROM_LEGACY_NO_WBS_SUPPORT))
-				set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED,
-					&hdev->quirks);
+				hci_set_quirk(hdev,
+					      HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 
 			err = btintel_legacy_rom_setup(hdev, &ver);
 			break;
@@ -3491,11 +3491,11 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 			 *
 			 * All Legacy bootloader devices support WBS
 			 */
-			set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED,
-				&hdev->quirks);
+			hci_set_quirk(hdev,
+				      HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 
 			/* These variants don't seem to support LE Coded PHY */
-			set_bit(HCI_QUIRK_BROKEN_LE_CODED, &hdev->quirks);
+			hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_CODED);
 
 			/* Setup MSFT Extension support */
 			btintel_set_msft_opcode(hdev, ver.hw_variant);
@@ -3571,10 +3571,10 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 		 *
 		 * All Legacy bootloader devices support WBS
 		 */
-		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 
 		/* These variants don't seem to support LE Coded PHY */
-		set_bit(HCI_QUIRK_BROKEN_LE_CODED, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_CODED);
 
 		/* Setup MSFT Extension support */
 		btintel_set_msft_opcode(hdev, ver.hw_variant);
@@ -3600,7 +3600,7 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 		 *
 		 * All TLV based devices support WBS
 		 */
-		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 
 		/* Setup MSFT Extension support */
 		btintel_set_msft_opcode(hdev,
diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index 04cec76ff5c5..60528bdc4316 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -2103,9 +2103,9 @@ static int btintel_pcie_setup_internal(struct hci_dev *hdev)
 	}
 
 	/* Apply the common HCI quirks for Intel device */
-	set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
-	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
-	set_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
+	hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
+	hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_DIAG);
 
 	/* Set up the quality report callback for Intel devices */
 	hdev->set_quality_report = btintel_set_quality_report;
@@ -2145,7 +2145,7 @@ static int btintel_pcie_setup_internal(struct hci_dev *hdev)
 		 *
 		 * All TLV based devices support WBS
 		 */
-		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 
 		/* Setup MSFT Extension support */
 		btintel_set_msft_opcode(hdev,
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c16a3518b8ff..4fc673640bfc 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1141,7 +1141,7 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		}
 
 		/* Enable WBS with mSBC codec */
-		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 
 		/* Enable GPIO reset mechanism */
 		if (bdev->reset) {
@@ -1384,7 +1384,7 @@ static int btmtksdio_probe(struct sdio_func *func,
 	SET_HCIDEV_DEV(hdev, &func->dev);
 
 	hdev->manufacturer = 70;
-	set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 
 	sdio_set_drvdata(func, bdev);
 
diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 4208ebecd560..76995cfcd534 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -872,7 +872,7 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 	SET_HCIDEV_DEV(hdev, &serdev->dev);
 
 	hdev->manufacturer = 70;
-	set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 
 	if (btmtkuart_is_standalone(bdev)) {
 		err = clk_prepare_enable(bdev->osc);
diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index 64a8d91e191e..01be32c577b0 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -1841,7 +1841,7 @@ static int nxp_serdev_probe(struct serdev_device *serdev)
 				      "local-bd-address",
 				      (u8 *)&ba, sizeof(ba));
 	if (bacmp(&ba, BDADDR_ANY))
-		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
 
 	if (hci_register_dev(hdev) < 0) {
 		dev_err(&serdev->dev, "Can't register HCI device\n");
diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index edefb9dc76aa..7c958d6065be 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -739,7 +739,7 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
 	if (!bacmp(&bda->bdaddr, &config->bdaddr))
-		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
 
 	kfree_skb(skb);
 
diff --git a/drivers/bluetooth/btqcomsmd.c b/drivers/bluetooth/btqcomsmd.c
index c0eb71d6ffd3..d2e13fcb6bab 100644
--- a/drivers/bluetooth/btqcomsmd.c
+++ b/drivers/bluetooth/btqcomsmd.c
@@ -117,7 +117,7 @@ static int btqcomsmd_setup(struct hci_dev *hdev)
 	/* Devices do not have persistent storage for BD address. Retrieve
 	 * it from the firmware node property.
 	 */
-	set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
 
 	return 0;
 }
diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 7c556c37c659..6abd962502e3 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -1287,7 +1287,7 @@ void btrtl_set_quirks(struct hci_dev *hdev, struct btrtl_device_info *btrtl_dev)
 	/* Enable controller to do both LE scan and BR/EDR inquiry
 	 * simultaneously.
 	 */
-	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
 
 	/* Enable central-peripheral role (able to create new connections with
 	 * an existing connection in slave role).
@@ -1301,7 +1301,7 @@ void btrtl_set_quirks(struct hci_dev *hdev, struct btrtl_device_info *btrtl_dev)
 	case CHIP_ID_8851B:
 	case CHIP_ID_8922A:
 	case CHIP_ID_8852BT:
-		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 
 		/* RTL8852C needs to transmit mSBC data continuously without
 		 * the zero length of USB packets for the ALT 6 supported chips
@@ -1312,7 +1312,8 @@ void btrtl_set_quirks(struct hci_dev *hdev, struct btrtl_device_info *btrtl_dev)
 		if (btrtl_dev->project_id == CHIP_ID_8852A ||
 		    btrtl_dev->project_id == CHIP_ID_8852B ||
 		    btrtl_dev->project_id == CHIP_ID_8852C)
-			set_bit(HCI_QUIRK_USE_MSFT_EXT_ADDRESS_FILTER, &hdev->quirks);
+			hci_set_quirk(hdev,
+				      HCI_QUIRK_USE_MSFT_EXT_ADDRESS_FILTER);
 
 		hci_set_aosp_capable(hdev);
 		break;
@@ -1331,8 +1332,7 @@ void btrtl_set_quirks(struct hci_dev *hdev, struct btrtl_device_info *btrtl_dev)
 		 * but it doesn't support any features from page 2 -
 		 * it either responds with garbage or with error status
 		 */
-		set_bit(HCI_QUIRK_BROKEN_LOCAL_EXT_FEATURES_PAGE_2,
-			&hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LOCAL_EXT_FEATURES_PAGE_2);
 		break;
 	default:
 		break;
diff --git a/drivers/bluetooth/btsdio.c b/drivers/bluetooth/btsdio.c
index a69feb08486a..8325655ce6aa 100644
--- a/drivers/bluetooth/btsdio.c
+++ b/drivers/bluetooth/btsdio.c
@@ -327,7 +327,7 @@ static int btsdio_probe(struct sdio_func *func,
 	hdev->send     = btsdio_send_frame;
 
 	if (func->vendor == 0x0104 && func->device == 0x00c5)
-		set_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE);
 
 	err = hci_register_dev(hdev);
 	if (err < 0) {
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 484e8fe3bc07..f302c3f1e4cf 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2483,18 +2483,18 @@ static int btusb_setup_csr(struct hci_dev *hdev)
 		 * Probably will need to be expanded in the future;
 		 * without these the controller will lock up.
 		 */
-		set_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_FILTER_CLEAR_ALL, &hdev->quirks);
-		set_bit(HCI_QUIRK_NO_SUSPEND_NOTIFIER, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_READ_VOICE_SETTING, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_READ_PAGE_SCAN_TYPE, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_STORED_LINK_KEY);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_ERR_DATA_REPORTING);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_FILTER_CLEAR_ALL);
+		hci_set_quirk(hdev, HCI_QUIRK_NO_SUSPEND_NOTIFIER);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_VOICE_SETTING);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_PAGE_SCAN_TYPE);
 
 		/* Clear the reset quirk since this is not an actual
 		 * early Bluetooth 1.1 device from CSR.
 		 */
-		clear_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
-		clear_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+		hci_clear_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE);
+		hci_clear_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
 
 		/*
 		 * Special workaround for these BT 4.0 chip clones, and potentially more:
@@ -3505,7 +3505,7 @@ static int btusb_setup_qca(struct hci_dev *hdev)
 	/* Mark HCI_OP_ENHANCED_SETUP_SYNC_CONN as broken as it doesn't seem to
 	 * work with the likes of HSP/HFP mSBC.
 	 */
-	set_bit(HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN);
 
 	return 0;
 }
@@ -4021,10 +4021,10 @@ static int btusb_probe(struct usb_interface *intf,
 	}
 #endif
 	if (id->driver_info & BTUSB_CW6622)
-		set_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_STORED_LINK_KEY);
 
 	if (id->driver_info & BTUSB_BCM2045)
-		set_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_STORED_LINK_KEY);
 
 	if (id->driver_info & BTUSB_BCM92035)
 		hdev->setup = btusb_setup_bcm92035;
@@ -4081,8 +4081,8 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->reset = btmtk_reset_sync;
 		hdev->set_bdaddr = btmtk_set_bdaddr;
 		hdev->send = btusb_send_frame_mtk;
-		set_bit(HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN, &hdev->quirks);
-		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN);
+		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		data->recv_acl = btmtk_usb_recv_acl;
 		data->suspend = btmtk_usb_suspend;
 		data->resume = btmtk_usb_resume;
@@ -4090,20 +4090,20 @@ static int btusb_probe(struct usb_interface *intf,
 	}
 
 	if (id->driver_info & BTUSB_SWAVE) {
-		set_bit(HCI_QUIRK_FIXUP_INQUIRY_MODE, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_LOCAL_COMMANDS, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_FIXUP_INQUIRY_MODE);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LOCAL_COMMANDS);
 	}
 
 	if (id->driver_info & BTUSB_INTEL_BOOT) {
 		hdev->manufacturer = 2;
-		set_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_RAW_DEVICE);
 	}
 
 	if (id->driver_info & BTUSB_ATH3012) {
 		data->setup_on_usb = btusb_setup_qca;
 		hdev->set_bdaddr = btusb_set_bdaddr_ath3012;
-		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
-		set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
+		hci_set_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
 	}
 
 	if (id->driver_info & BTUSB_QCA_ROME) {
@@ -4111,7 +4111,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->shutdown = btusb_shutdown_qca;
 		hdev->set_bdaddr = btusb_set_bdaddr_ath3012;
 		hdev->reset = btusb_qca_reset;
-		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
 		btusb_check_needs_reset_resume(intf);
 	}
 
@@ -4125,7 +4125,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->shutdown = btusb_shutdown_qca;
 		hdev->set_bdaddr = btusb_set_bdaddr_wcn6855;
 		hdev->reset = btusb_qca_reset;
-		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
 		hci_set_msft_opcode(hdev, 0xFD70);
 	}
 
@@ -4153,35 +4153,35 @@ static int btusb_probe(struct usb_interface *intf,
 
 	if (id->driver_info & BTUSB_ACTIONS_SEMI) {
 		/* Support is advertised, but not implemented */
-		set_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_SET_RPA_TIMEOUT, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_EXT_SCAN, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_READ_ENC_KEY_SIZE, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_EXT_CREATE_CONN, &hdev->quirks);
-		set_bit(HCI_QUIRK_BROKEN_WRITE_AUTH_PAYLOAD_TIMEOUT, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_ERR_DATA_REPORTING);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_SET_RPA_TIMEOUT);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_SCAN);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_ENC_KEY_SIZE);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_CREATE_CONN);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_WRITE_AUTH_PAYLOAD_TIMEOUT);
 	}
 
 	if (!reset)
-		set_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE);
 
 	if (force_scofix || id->driver_info & BTUSB_WRONG_SCO_MTU) {
 		if (!disable_scofix)
-			set_bit(HCI_QUIRK_FIXUP_BUFFER_SIZE, &hdev->quirks);
+			hci_set_quirk(hdev, HCI_QUIRK_FIXUP_BUFFER_SIZE);
 	}
 
 	if (id->driver_info & BTUSB_BROKEN_ISOC)
 		data->isoc = NULL;
 
 	if (id->driver_info & BTUSB_WIDEBAND_SPEECH)
-		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 
 	if (id->driver_info & BTUSB_INVALID_LE_STATES)
-		set_bit(HCI_QUIRK_BROKEN_LE_STATES, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_STATES);
 
 	if (id->driver_info & BTUSB_DIGIANSWER) {
 		data->cmdreq_type = USB_TYPE_VENDOR;
-		set_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE);
 	}
 
 	if (id->driver_info & BTUSB_CSR) {
@@ -4190,10 +4190,10 @@ static int btusb_probe(struct usb_interface *intf,
 
 		/* Old firmware would otherwise execute USB reset */
 		if (bcdDevice < 0x117)
-			set_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
+			hci_set_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE);
 
 		/* This must be set first in case we disable it for fakes */
-		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
 
 		/* Fake CSR devices with broken commands */
 		if (le16_to_cpu(udev->descriptor.idVendor)  == 0x0a12 &&
@@ -4206,7 +4206,7 @@ static int btusb_probe(struct usb_interface *intf,
 
 		/* New sniffer firmware has crippled HCI interface */
 		if (le16_to_cpu(udev->descriptor.bcdDevice) > 0x997)
-			set_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks);
+			hci_set_quirk(hdev, HCI_QUIRK_RAW_DEVICE);
 	}
 
 	if (id->driver_info & BTUSB_INTEL_BOOT) {
diff --git a/drivers/bluetooth/hci_aml.c b/drivers/bluetooth/hci_aml.c
index 1394c575aa6d..707e90f80130 100644
--- a/drivers/bluetooth/hci_aml.c
+++ b/drivers/bluetooth/hci_aml.c
@@ -424,7 +424,7 @@ static int aml_check_bdaddr(struct hci_dev *hdev)
 
 	if (!bacmp(&paddr->bdaddr, AML_BDADDR_DEFAULT)) {
 		bt_dev_info(hdev, "amlbt using default bdaddr (%pM)", &paddr->bdaddr);
-		set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_INVALID_BDADDR);
 	}
 
 exit:
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 9684eb16059b..f96617b85d87 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -643,8 +643,8 @@ static int bcm_setup(struct hci_uart *hu)
 	 * Allow the bootloader to set a valid address through the
 	 * device tree.
 	 */
-	if (test_bit(HCI_QUIRK_INVALID_BDADDR, &hu->hdev->quirks))
-		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hu->hdev->quirks);
+	if (hci_test_quirk(hu->hdev, HCI_QUIRK_INVALID_BDADDR))
+		hci_set_quirk(hu->hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
 
 	if (!bcm_request_irq(bcm))
 		err = bcm_setup_sleep(hu);
diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 1393580ad075..45e6d84224ee 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -1435,7 +1435,7 @@ static int bcm4377_check_bdaddr(struct bcm4377_data *bcm4377)
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
 	if (!bcm4377_is_valid_bdaddr(bcm4377, &bda->bdaddr))
-		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &bcm4377->hdev->quirks);
+		hci_set_quirk(bcm4377->hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
 
 	kfree_skb(skb);
 	return 0;
@@ -2389,13 +2389,13 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	hdev->setup = bcm4377_hci_setup;
 
 	if (bcm4377->hw->broken_mws_transport_config)
-		set_bit(HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG);
 	if (bcm4377->hw->broken_ext_scan)
-		set_bit(HCI_QUIRK_BROKEN_EXT_SCAN, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_SCAN);
 	if (bcm4377->hw->broken_le_coded)
-		set_bit(HCI_QUIRK_BROKEN_LE_CODED, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_CODED);
 	if (bcm4377->hw->broken_le_ext_adv_report_phy)
-		set_bit(HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY);
 
 	pci_set_drvdata(pdev, bcm4377);
 	hci_set_drvdata(hdev, bcm4377);
diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index b45e65a93828..9b353c3d6442 100644
--- a/drivers/bluetooth/hci_intel.c
+++ b/drivers/bluetooth/hci_intel.c
@@ -660,7 +660,7 @@ static int intel_setup(struct hci_uart *hu)
 	 */
 	if (!bacmp(&params.otp_bdaddr, BDADDR_ANY)) {
 		bt_dev_info(hdev, "No device address configured");
-		set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_INVALID_BDADDR);
 	}
 
 	/* With this Intel bootloader only the hardware variant and device
diff --git a/drivers/bluetooth/hci_ldisc.c b/drivers/bluetooth/hci_ldisc.c
index acba83156de9..d0adae3267b4 100644
--- a/drivers/bluetooth/hci_ldisc.c
+++ b/drivers/bluetooth/hci_ldisc.c
@@ -667,13 +667,13 @@ static int hci_uart_register_dev(struct hci_uart *hu)
 	SET_HCIDEV_DEV(hdev, hu->tty->dev);
 
 	if (test_bit(HCI_UART_RAW_DEVICE, &hu->hdev_flags))
-		set_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_RAW_DEVICE);
 
 	if (test_bit(HCI_UART_EXT_CONFIG, &hu->hdev_flags))
-		set_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_EXTERNAL_CONFIG);
 
 	if (!test_bit(HCI_UART_RESET_ON_INIT, &hu->hdev_flags))
-		set_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE);
 
 	/* Only call open() for the protocol after hdev is fully initialized as
 	 * open() (or a timer/workqueue it starts) may attempt to reference it.
diff --git a/drivers/bluetooth/hci_nokia.c b/drivers/bluetooth/hci_nokia.c
index 9fc10a16fd96..cd7575c20f65 100644
--- a/drivers/bluetooth/hci_nokia.c
+++ b/drivers/bluetooth/hci_nokia.c
@@ -439,7 +439,7 @@ static int nokia_setup(struct hci_uart *hu)
 
 	if (btdev->man_id == NOKIA_ID_BCM2048) {
 		hu->hdev->set_bdaddr = btbcm_set_bdaddr;
-		set_bit(HCI_QUIRK_INVALID_BDADDR, &hu->hdev->quirks);
+		hci_set_quirk(hu->hdev, HCI_QUIRK_INVALID_BDADDR);
 		dev_dbg(dev, "bcm2048 has invalid bluetooth address!");
 	}
 
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 2324a4f5b957..1a1a4fa7b71e 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1893,7 +1893,7 @@ static int qca_setup(struct hci_uart *hu)
 	/* Enable controller to do both LE scan and BR/EDR inquiry
 	 * simultaneously.
 	 */
-	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
 
 	switch (soc_type) {
 	case QCA_QCA2066:
@@ -1945,7 +1945,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN7850:
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 		if (qcadev->bdaddr_property_broken)
-			set_bit(HCI_QUIRK_BDADDR_PROPERTY_BROKEN, &hdev->quirks);
+			hci_set_quirk(hdev, HCI_QUIRK_BDADDR_PROPERTY_BROKEN);
 
 		hci_set_aosp_capable(hdev);
 
@@ -2488,7 +2488,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	hdev = qcadev->serdev_hu.hdev;
 
 	if (power_ctrl_enabled) {
-		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_power_off;
 	}
 
@@ -2497,11 +2497,11 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		 * be queried via hci. Same with the valid le states quirk.
 		 */
 		if (data->capabilities & QCA_CAP_WIDEBAND_SPEECH)
-			set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED,
-				&hdev->quirks);
+			hci_set_quirk(hdev,
+				      HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 
 		if (!(data->capabilities & QCA_CAP_VALID_LE_STATES))
-			set_bit(HCI_QUIRK_BROKEN_LE_STATES, &hdev->quirks);
+			hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_STATES);
 	}
 
 	return 0;
@@ -2551,7 +2551,7 @@ static void qca_serdev_shutdown(struct device *dev)
 		 * invoked and the SOC is already in the initial state, so
 		 * don't also need to send the VSC.
 		 */
-		if (test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks) ||
+		if (hci_test_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP) ||
 		    hci_dev_test_flag(hdev, HCI_SETUP))
 			return;
 
diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index 89a22e9b3253..593d9cefbbf9 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -152,7 +152,7 @@ static int hci_uart_close(struct hci_dev *hdev)
 	 * BT SOC is completely powered OFF during BT OFF, holding port
 	 * open may drain the battery.
 	 */
-	if (test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
+	if (hci_test_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP)) {
 		clear_bit(HCI_UART_PROTO_READY, &hu->flags);
 		serdev_device_close(hu->serdev);
 	}
@@ -358,13 +358,13 @@ int hci_uart_register_device_priv(struct hci_uart *hu,
 	SET_HCIDEV_DEV(hdev, &hu->serdev->dev);
 
 	if (test_bit(HCI_UART_NO_SUSPEND_NOTIFIER, &hu->flags))
-		set_bit(HCI_QUIRK_NO_SUSPEND_NOTIFIER, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_NO_SUSPEND_NOTIFIER);
 
 	if (test_bit(HCI_UART_RAW_DEVICE, &hu->hdev_flags))
-		set_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_RAW_DEVICE);
 
 	if (test_bit(HCI_UART_EXT_CONFIG, &hu->hdev_flags))
-		set_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_EXTERNAL_CONFIG);
 
 	if (test_bit(HCI_UART_INIT_PENDING, &hu->hdev_flags))
 		return 0;
diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
index 59f4d7bdffdc..f7d8c3c00655 100644
--- a/drivers/bluetooth/hci_vhci.c
+++ b/drivers/bluetooth/hci_vhci.c
@@ -415,16 +415,16 @@ static int __vhci_create_device(struct vhci_data *data, __u8 opcode)
 	hdev->get_codec_config_data = vhci_get_codec_config_data;
 	hdev->wakeup = vhci_wakeup;
 	hdev->setup = vhci_setup;
-	set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
-	set_bit(HCI_QUIRK_SYNC_FLOWCTL_SUPPORTED, &hdev->quirks);
+	hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
+	hci_set_quirk(hdev, HCI_QUIRK_SYNC_FLOWCTL_SUPPORTED);
 
 	/* bit 6 is for external configuration */
 	if (opcode & 0x40)
-		set_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_EXTERNAL_CONFIG);
 
 	/* bit 7 is for raw device */
 	if (opcode & 0x80)
-		set_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks);
+		hci_set_quirk(hdev, HCI_QUIRK_RAW_DEVICE);
 
 	if (hci_register_dev(hdev) < 0) {
 		BT_ERR("Can't register HCI device");
diff --git a/drivers/bluetooth/virtio_bt.c b/drivers/bluetooth/virtio_bt.c
index 756f292df9e8..6f1a37e85c6a 100644
--- a/drivers/bluetooth/virtio_bt.c
+++ b/drivers/bluetooth/virtio_bt.c
@@ -327,17 +327,17 @@ static int virtbt_probe(struct virtio_device *vdev)
 			hdev->setup = virtbt_setup_intel;
 			hdev->shutdown = virtbt_shutdown_generic;
 			hdev->set_bdaddr = virtbt_set_bdaddr_intel;
-			set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
-			set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
-			set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+			hci_set_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
+			hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
+			hci_set_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 			break;
 
 		case VIRTIO_BT_CONFIG_VENDOR_REALTEK:
 			hdev->manufacturer = 93;
 			hdev->setup = virtbt_setup_realtek;
 			hdev->shutdown = virtbt_shutdown_generic;
-			set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
-			set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+			hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
+			hci_set_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED);
 			break;
 		}
 	}
diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 19248d326cb2..94f365b75166 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -377,6 +377,8 @@ enum {
 	 * This quirk must be set before hci_register_dev is called.
 	 */
 	HCI_QUIRK_BROKEN_READ_PAGE_SCAN_TYPE,
+
+	__HCI_NUM_QUIRKS,
 };
 
 /* HCI device flags */
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 01ae3f433a2e..1ef9279cfd6f 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -464,7 +464,7 @@ struct hci_dev {
 
 	unsigned int	auto_accept_delay;
 
-	unsigned long	quirks;
+	DECLARE_BITMAP(quirk_flags, __HCI_NUM_QUIRKS);
 
 	atomic_t	cmd_cnt;
 	unsigned int	acl_cnt;
@@ -656,6 +656,10 @@ struct hci_dev {
 	u8 (*classify_pkt_type)(struct hci_dev *hdev, struct sk_buff *skb);
 };
 
+#define hci_set_quirk(hdev, nr) set_bit((nr), (hdev)->quirk_flags)
+#define hci_clear_quirk(hdev, nr) clear_bit((nr), (hdev)->quirk_flags)
+#define hci_test_quirk(hdev, nr) test_bit((nr), (hdev)->quirk_flags)
+
 #define HCI_PHY_HANDLE(handle)	(handle & 0xff)
 
 enum conn_reasons {
@@ -839,7 +843,7 @@ extern struct mutex hci_cb_list_lock;
 	} while (0)
 
 #define hci_dev_le_state_simultaneous(hdev) \
-	(!test_bit(HCI_QUIRK_BROKEN_LE_STATES, &(hdev)->quirks) && \
+	(!hci_test_quirk((hdev), HCI_QUIRK_BROKEN_LE_STATES) && \
 	 ((hdev)->le_states[4] & 0x08) &&	/* Central */ \
 	 ((hdev)->le_states[4] & 0x40) &&	/* Peripheral */ \
 	 ((hdev)->le_states[3] & 0x10))		/* Simultaneous */
@@ -1912,8 +1916,8 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
 		      ((dev)->le_rx_def_phys & HCI_LE_SET_PHY_2M))
 
 #define le_coded_capable(dev) (((dev)->le_features[1] & HCI_LE_PHY_CODED) && \
-			       !test_bit(HCI_QUIRK_BROKEN_LE_CODED, \
-					 &(dev)->quirks))
+			       !hci_test_quirk((dev), \
+					       HCI_QUIRK_BROKEN_LE_CODED))
 
 #define scan_coded(dev) (((dev)->le_tx_def_phys & HCI_LE_SET_PHY_CODED) || \
 			 ((dev)->le_rx_def_phys & HCI_LE_SET_PHY_CODED))
@@ -1925,27 +1929,27 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
 
 #define read_key_size_capable(dev) \
 	((dev)->commands[20] & 0x10 && \
-	 !test_bit(HCI_QUIRK_BROKEN_READ_ENC_KEY_SIZE, &(dev)->quirks))
+	 !hci_test_quirk((dev), HCI_QUIRK_BROKEN_READ_ENC_KEY_SIZE))
 
 #define read_voice_setting_capable(dev) \
 	((dev)->commands[9] & 0x04 && \
-	 !test_bit(HCI_QUIRK_BROKEN_READ_VOICE_SETTING, &(dev)->quirks))
+	 !hci_test_quirk((dev), HCI_QUIRK_BROKEN_READ_VOICE_SETTING))
 
 /* Use enhanced synchronous connection if command is supported and its quirk
  * has not been set.
  */
 #define enhanced_sync_conn_capable(dev) \
 	(((dev)->commands[29] & 0x08) && \
-	 !test_bit(HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN, &(dev)->quirks))
+	 !hci_test_quirk((dev), HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN))
 
 /* Use ext scanning if set ext scan param and ext scan enable is supported */
 #define use_ext_scan(dev) (((dev)->commands[37] & 0x20) && \
 			   ((dev)->commands[37] & 0x40) && \
-			   !test_bit(HCI_QUIRK_BROKEN_EXT_SCAN, &(dev)->quirks))
+			   !hci_test_quirk((dev), HCI_QUIRK_BROKEN_EXT_SCAN))
 
 /* Use ext create connection if command is supported */
 #define use_ext_conn(dev) (((dev)->commands[37] & 0x80) && \
-	!test_bit(HCI_QUIRK_BROKEN_EXT_CREATE_CONN, &(dev)->quirks))
+	!hci_test_quirk((dev), HCI_QUIRK_BROKEN_EXT_CREATE_CONN))
 /* Extended advertising support */
 #define ext_adv_capable(dev) (((dev)->le_features[1] & HCI_LE_EXT_ADV))
 
@@ -1960,8 +1964,8 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
  */
 #define use_enhanced_conn_complete(dev) ((ll_privacy_capable(dev) || \
 					 ext_adv_capable(dev)) && \
-					 !test_bit(HCI_QUIRK_BROKEN_EXT_CREATE_CONN, \
-						 &(dev)->quirks))
+					 !hci_test_quirk((dev), \
+							 HCI_QUIRK_BROKEN_EXT_CREATE_CONN))
 
 /* Periodic advertising support */
 #define per_adv_capable(dev) (((dev)->le_features[1] & HCI_LE_PERIODIC_ADV))
@@ -1978,7 +1982,7 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
 #define sync_recv_capable(dev) ((dev)->le_features[3] & HCI_LE_ISO_SYNC_RECEIVER)
 
 #define mws_transport_config_capable(dev) (((dev)->commands[30] & 0x08) && \
-	(!test_bit(HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG, &(dev)->quirks)))
+	(!hci_test_quirk((dev), HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG)))
 
 /* ----- HCI protocols ----- */
 #define HCI_PROTO_DEFER             0x01
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 42f597cb0941..f2fbe9c8e1be 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2652,7 +2652,7 @@ int hci_register_dev(struct hci_dev *hdev)
 	/* Devices that are marked for raw-only usage are unconfigured
 	 * and should not be included in normal operation.
 	 */
-	if (test_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks))
+	if (hci_test_quirk(hdev, HCI_QUIRK_RAW_DEVICE))
 		hci_dev_set_flag(hdev, HCI_UNCONFIGURED);
 
 	/* Mark Remote Wakeup connection flag as supported if driver has wakeup
@@ -2782,7 +2782,7 @@ int hci_register_suspend_notifier(struct hci_dev *hdev)
 	int ret = 0;
 
 	if (!hdev->suspend_notifier.notifier_call &&
-	    !test_bit(HCI_QUIRK_NO_SUSPEND_NOTIFIER, &hdev->quirks)) {
+	    !hci_test_quirk(hdev, HCI_QUIRK_NO_SUSPEND_NOTIFIER)) {
 		hdev->suspend_notifier.notifier_call = hci_suspend_notifier;
 		ret = register_pm_notifier(&hdev->suspend_notifier);
 	}
diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
index f625074d1f00..99e2e9fc70e8 100644
--- a/net/bluetooth/hci_debugfs.c
+++ b/net/bluetooth/hci_debugfs.c
@@ -38,7 +38,7 @@ static ssize_t __name ## _read(struct file *file,			      \
 	struct hci_dev *hdev = file->private_data;			      \
 	char buf[3];							      \
 									      \
-	buf[0] = test_bit(__quirk, &hdev->quirks) ? 'Y' : 'N';		      \
+	buf[0] = test_bit(__quirk, hdev->quirk_flags) ? 'Y' : 'N';	      \
 	buf[1] = '\n';							      \
 	buf[2] = '\0';							      \
 	return simple_read_from_buffer(user_buf, count, ppos, buf, 2);	      \
@@ -59,10 +59,10 @@ static ssize_t __name ## _write(struct file *file,			      \
 	if (err)							      \
 		return err;						      \
 									      \
-	if (enable == test_bit(__quirk, &hdev->quirks))			      \
+	if (enable == test_bit(__quirk, hdev->quirk_flags))		      \
 		return -EALREADY;					      \
 									      \
-	change_bit(__quirk, &hdev->quirks);				      \
+	change_bit(__quirk, hdev->quirk_flags);				      \
 									      \
 	return count;							      \
 }									      \
@@ -1356,7 +1356,7 @@ static ssize_t vendor_diag_write(struct file *file, const char __user *user_buf,
 	 * for the vendor callback. Instead just store the desired value and
 	 * the setting will be programmed when the controller gets powered on.
 	 */
-	if (test_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks) &&
+	if (hci_test_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_DIAG) &&
 	    (!test_bit(HCI_RUNNING, &hdev->flags) ||
 	     hci_dev_test_flag(hdev, HCI_USER_CHANNEL)))
 		goto done;
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 9997d5cb5fe2..c0eb03e5cbf8 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -908,8 +908,8 @@ static u8 hci_cc_read_local_ext_features(struct hci_dev *hdev, void *data,
 		return rp->status;
 
 	if (hdev->max_page < rp->max_page) {
-		if (test_bit(HCI_QUIRK_BROKEN_LOCAL_EXT_FEATURES_PAGE_2,
-			     &hdev->quirks))
+		if (hci_test_quirk(hdev,
+				   HCI_QUIRK_BROKEN_LOCAL_EXT_FEATURES_PAGE_2))
 			bt_dev_warn(hdev, "broken local ext features page 2");
 		else
 			hdev->max_page = rp->max_page;
@@ -936,7 +936,7 @@ static u8 hci_cc_read_buffer_size(struct hci_dev *hdev, void *data,
 	hdev->acl_pkts = __le16_to_cpu(rp->acl_max_pkt);
 	hdev->sco_pkts = __le16_to_cpu(rp->sco_max_pkt);
 
-	if (test_bit(HCI_QUIRK_FIXUP_BUFFER_SIZE, &hdev->quirks)) {
+	if (hci_test_quirk(hdev, HCI_QUIRK_FIXUP_BUFFER_SIZE)) {
 		hdev->sco_mtu  = 64;
 		hdev->sco_pkts = 8;
 	}
@@ -2971,7 +2971,7 @@ static void hci_inquiry_complete_evt(struct hci_dev *hdev, void *data,
 		 * state to indicate completion.
 		 */
 		if (!hci_dev_test_flag(hdev, HCI_LE_SCAN) ||
-		    !test_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks))
+		    !hci_test_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY))
 			hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
 		goto unlock;
 	}
@@ -2990,7 +2990,7 @@ static void hci_inquiry_complete_evt(struct hci_dev *hdev, void *data,
 		 * state to indicate completion.
 		 */
 		if (!hci_dev_test_flag(hdev, HCI_LE_SCAN) ||
-		    !test_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks))
+		    !hci_test_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY))
 			hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
 	}
 
@@ -3614,8 +3614,7 @@ static void hci_encrypt_change_evt(struct hci_dev *hdev, void *data,
 	/* We skip the WRITE_AUTH_PAYLOAD_TIMEOUT for ATS2851 based controllers
 	 * to avoid unexpected SMP command errors when pairing.
 	 */
-	if (test_bit(HCI_QUIRK_BROKEN_WRITE_AUTH_PAYLOAD_TIMEOUT,
-		     &hdev->quirks))
+	if (hci_test_quirk(hdev, HCI_QUIRK_BROKEN_WRITE_AUTH_PAYLOAD_TIMEOUT))
 		goto notify;
 
 	/* Set the default Authenticated Payload Timeout after
@@ -5914,7 +5913,7 @@ static struct hci_conn *check_pending_le_conn(struct hci_dev *hdev,
 	 * while we have an existing one in peripheral role.
 	 */
 	if (hdev->conn_hash.le_num_peripheral > 0 &&
-	    (test_bit(HCI_QUIRK_BROKEN_LE_STATES, &hdev->quirks) ||
+	    (hci_test_quirk(hdev, HCI_QUIRK_BROKEN_LE_STATES) ||
 	     !(hdev->le_states[3] & 0x10)))
 		return NULL;
 
@@ -6310,8 +6309,8 @@ static void hci_le_ext_adv_report_evt(struct hci_dev *hdev, void *data,
 		evt_type = __le16_to_cpu(info->type) & LE_EXT_ADV_EVT_TYPE_MASK;
 		legacy_evt_type = ext_evt_type_to_legacy(hdev, evt_type);
 
-		if (test_bit(HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY,
-			     &hdev->quirks)) {
+		if (hci_test_quirk(hdev,
+				   HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY)) {
 			info->primary_phy &= 0x1f;
 			info->secondary_phy &= 0x1f;
 		}
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 489f5a2e3f6c..e9df6502e58e 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -393,7 +393,7 @@ static void le_scan_disable(struct work_struct *work)
 	if (hdev->discovery.type != DISCOV_TYPE_INTERLEAVED)
 		goto _return;
 
-	if (test_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks)) {
+	if (hci_test_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY)) {
 		if (!test_bit(HCI_INQUIRY, &hdev->flags) &&
 		    hdev->discovery.state != DISCOVERY_RESOLVING)
 			goto discov_stopped;
@@ -3587,7 +3587,7 @@ static void hci_dev_get_bd_addr_from_property(struct hci_dev *hdev)
 	if (ret < 0 || !bacmp(&ba, BDADDR_ANY))
 		return;
 
-	if (test_bit(HCI_QUIRK_BDADDR_PROPERTY_BROKEN, &hdev->quirks))
+	if (hci_test_quirk(hdev, HCI_QUIRK_BDADDR_PROPERTY_BROKEN))
 		baswap(&hdev->public_addr, &ba);
 	else
 		bacpy(&hdev->public_addr, &ba);
@@ -3662,7 +3662,7 @@ static int hci_init0_sync(struct hci_dev *hdev)
 	bt_dev_dbg(hdev, "");
 
 	/* Reset */
-	if (!test_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks)) {
+	if (!hci_test_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE)) {
 		err = hci_reset_sync(hdev);
 		if (err)
 			return err;
@@ -3675,7 +3675,7 @@ static int hci_unconf_init_sync(struct hci_dev *hdev)
 {
 	int err;
 
-	if (test_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks))
+	if (hci_test_quirk(hdev, HCI_QUIRK_RAW_DEVICE))
 		return 0;
 
 	err = hci_init0_sync(hdev);
@@ -3718,7 +3718,7 @@ static int hci_read_local_cmds_sync(struct hci_dev *hdev)
 	 * supported commands.
 	 */
 	if (hdev->hci_ver > BLUETOOTH_VER_1_1 &&
-	    !test_bit(HCI_QUIRK_BROKEN_LOCAL_COMMANDS, &hdev->quirks))
+	    !hci_test_quirk(hdev, HCI_QUIRK_BROKEN_LOCAL_COMMANDS))
 		return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_COMMANDS,
 					     0, NULL, HCI_CMD_TIMEOUT);
 
@@ -3732,7 +3732,7 @@ static int hci_init1_sync(struct hci_dev *hdev)
 	bt_dev_dbg(hdev, "");
 
 	/* Reset */
-	if (!test_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks)) {
+	if (!hci_test_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE)) {
 		err = hci_reset_sync(hdev);
 		if (err)
 			return err;
@@ -3795,7 +3795,7 @@ static int hci_set_event_filter_sync(struct hci_dev *hdev, u8 flt_type,
 	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED))
 		return 0;
 
-	if (test_bit(HCI_QUIRK_BROKEN_FILTER_CLEAR_ALL, &hdev->quirks))
+	if (hci_test_quirk(hdev, HCI_QUIRK_BROKEN_FILTER_CLEAR_ALL))
 		return 0;
 
 	memset(&cp, 0, sizeof(cp));
@@ -3822,7 +3822,7 @@ static int hci_clear_event_filter_sync(struct hci_dev *hdev)
 	 * a hci_set_event_filter_sync() call succeeds, but we do
 	 * the check both for parity and as a future reminder.
 	 */
-	if (test_bit(HCI_QUIRK_BROKEN_FILTER_CLEAR_ALL, &hdev->quirks))
+	if (hci_test_quirk(hdev, HCI_QUIRK_BROKEN_FILTER_CLEAR_ALL))
 		return 0;
 
 	return hci_set_event_filter_sync(hdev, HCI_FLT_CLEAR_ALL, 0x00,
@@ -3846,7 +3846,7 @@ static int hci_write_sync_flowctl_sync(struct hci_dev *hdev)
 
 	/* Check if the controller supports SCO and HCI_OP_WRITE_SYNC_FLOWCTL */
 	if (!lmp_sco_capable(hdev) || !(hdev->commands[10] & BIT(4)) ||
-	    !test_bit(HCI_QUIRK_SYNC_FLOWCTL_SUPPORTED, &hdev->quirks))
+	    !hci_test_quirk(hdev, HCI_QUIRK_SYNC_FLOWCTL_SUPPORTED))
 		return 0;
 
 	memset(&cp, 0, sizeof(cp));
@@ -3921,7 +3921,7 @@ static int hci_write_inquiry_mode_sync(struct hci_dev *hdev)
 	u8 mode;
 
 	if (!lmp_inq_rssi_capable(hdev) &&
-	    !test_bit(HCI_QUIRK_FIXUP_INQUIRY_MODE, &hdev->quirks))
+	    !hci_test_quirk(hdev, HCI_QUIRK_FIXUP_INQUIRY_MODE))
 		return 0;
 
 	/* If Extended Inquiry Result events are supported, then
@@ -4111,7 +4111,7 @@ static int hci_set_event_mask_sync(struct hci_dev *hdev)
 	}
 
 	if (lmp_inq_rssi_capable(hdev) ||
-	    test_bit(HCI_QUIRK_FIXUP_INQUIRY_MODE, &hdev->quirks))
+	    hci_test_quirk(hdev, HCI_QUIRK_FIXUP_INQUIRY_MODE))
 		events[4] |= 0x02; /* Inquiry Result with RSSI */
 
 	if (lmp_ext_feat_capable(hdev))
@@ -4163,7 +4163,7 @@ static int hci_read_stored_link_key_sync(struct hci_dev *hdev)
 	struct hci_cp_read_stored_link_key cp;
 
 	if (!(hdev->commands[6] & 0x20) ||
-	    test_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks))
+	    hci_test_quirk(hdev, HCI_QUIRK_BROKEN_STORED_LINK_KEY))
 		return 0;
 
 	memset(&cp, 0, sizeof(cp));
@@ -4212,7 +4212,7 @@ static int hci_read_def_err_data_reporting_sync(struct hci_dev *hdev)
 {
 	if (!(hdev->commands[18] & 0x04) ||
 	    !(hdev->features[0][6] & LMP_ERR_DATA_REPORTING) ||
-	    test_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks))
+	    hci_test_quirk(hdev, HCI_QUIRK_BROKEN_ERR_DATA_REPORTING))
 		return 0;
 
 	return __hci_cmd_sync_status(hdev, HCI_OP_READ_DEF_ERR_DATA_REPORTING,
@@ -4226,7 +4226,7 @@ static int hci_read_page_scan_type_sync(struct hci_dev *hdev)
 	 * this command in the bit mask of supported commands.
 	 */
 	if (!(hdev->commands[13] & 0x01) ||
-	    test_bit(HCI_QUIRK_BROKEN_READ_PAGE_SCAN_TYPE, &hdev->quirks))
+	    hci_test_quirk(hdev, HCI_QUIRK_BROKEN_READ_PAGE_SCAN_TYPE))
 		return 0;
 
 	return __hci_cmd_sync_status(hdev, HCI_OP_READ_PAGE_SCAN_TYPE,
@@ -4421,7 +4421,7 @@ static int hci_le_read_adv_tx_power_sync(struct hci_dev *hdev)
 static int hci_le_read_tx_power_sync(struct hci_dev *hdev)
 {
 	if (!(hdev->commands[38] & 0x80) ||
-	    test_bit(HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER, &hdev->quirks))
+	    hci_test_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER))
 		return 0;
 
 	return __hci_cmd_sync_status(hdev, HCI_OP_LE_READ_TRANSMIT_POWER,
@@ -4464,7 +4464,7 @@ static int hci_le_set_rpa_timeout_sync(struct hci_dev *hdev)
 	__le16 timeout = cpu_to_le16(hdev->rpa_timeout);
 
 	if (!(hdev->commands[35] & 0x04) ||
-	    test_bit(HCI_QUIRK_BROKEN_SET_RPA_TIMEOUT, &hdev->quirks))
+	    hci_test_quirk(hdev, HCI_QUIRK_BROKEN_SET_RPA_TIMEOUT))
 		return 0;
 
 	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_RPA_TIMEOUT,
@@ -4609,7 +4609,7 @@ static int hci_delete_stored_link_key_sync(struct hci_dev *hdev)
 	 * just disable this command.
 	 */
 	if (!(hdev->commands[6] & 0x80) ||
-	    test_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks))
+	    hci_test_quirk(hdev, HCI_QUIRK_BROKEN_STORED_LINK_KEY))
 		return 0;
 
 	memset(&cp, 0, sizeof(cp));
@@ -4735,7 +4735,7 @@ static int hci_set_err_data_report_sync(struct hci_dev *hdev)
 
 	if (!(hdev->commands[18] & 0x08) ||
 	    !(hdev->features[0][6] & LMP_ERR_DATA_REPORTING) ||
-	    test_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks))
+	    hci_test_quirk(hdev, HCI_QUIRK_BROKEN_ERR_DATA_REPORTING))
 		return 0;
 
 	if (enabled == hdev->err_data_reporting)
@@ -4948,7 +4948,7 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
 	size_t i;
 
 	if (!hci_dev_test_flag(hdev, HCI_SETUP) &&
-	    !test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks))
+	    !hci_test_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP))
 		return 0;
 
 	bt_dev_dbg(hdev, "");
@@ -4959,7 +4959,7 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
 		ret = hdev->setup(hdev);
 
 	for (i = 0; i < ARRAY_SIZE(hci_broken_table); i++) {
-		if (test_bit(hci_broken_table[i].quirk, &hdev->quirks))
+		if (hci_test_quirk(hdev, hci_broken_table[i].quirk))
 			bt_dev_warn(hdev, "%s", hci_broken_table[i].desc);
 	}
 
@@ -4967,10 +4967,10 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
 	 * BD_ADDR invalid before creating the HCI device or in
 	 * its setup callback.
 	 */
-	invalid_bdaddr = test_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks) ||
-			 test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
+	invalid_bdaddr = hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
+			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
 	if (!ret) {
-		if (test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks) &&
+		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) &&
 		    !bacmp(&hdev->public_addr, BDADDR_ANY))
 			hci_dev_get_bd_addr_from_property(hdev);
 
@@ -4992,7 +4992,7 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
 	 * In case any of them is set, the controller has to
 	 * start up as unconfigured.
 	 */
-	if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks) ||
+	if (hci_test_quirk(hdev, HCI_QUIRK_EXTERNAL_CONFIG) ||
 	    invalid_bdaddr)
 		hci_dev_set_flag(hdev, HCI_UNCONFIGURED);
 
@@ -5052,7 +5052,7 @@ static int hci_dev_init_sync(struct hci_dev *hdev)
 	 * then they need to be reprogrammed after the init procedure
 	 * completed.
 	 */
-	if (test_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks) &&
+	if (hci_test_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_DIAG) &&
 	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
 	    hci_dev_test_flag(hdev, HCI_VENDOR_DIAG) && hdev->set_diag)
 		ret = hdev->set_diag(hdev, true);
@@ -5309,7 +5309,7 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 	/* Reset device */
 	skb_queue_purge(&hdev->cmd_q);
 	atomic_set(&hdev->cmd_cnt, 1);
-	if (test_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks) &&
+	if (hci_test_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE) &&
 	    !auto_off && !hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
 		set_bit(HCI_INIT, &hdev->flags);
 		hci_reset_sync(hdev);
@@ -5959,7 +5959,7 @@ static int hci_active_scan_sync(struct hci_dev *hdev, uint16_t interval)
 		own_addr_type = ADDR_LE_DEV_PUBLIC;
 
 	if (hci_is_adv_monitoring(hdev) ||
-	    (test_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks) &&
+	    (hci_test_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER) &&
 	    hdev->discovery.result_filtering)) {
 		/* Duplicate filter should be disabled when some advertisement
 		 * monitor is activated, otherwise AdvMon can only receive one
@@ -6022,8 +6022,7 @@ int hci_start_discovery_sync(struct hci_dev *hdev)
 		 * and LE scanning are done sequentially with separate
 		 * timeouts.
 		 */
-		if (test_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY,
-			     &hdev->quirks)) {
+		if (hci_test_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY)) {
 			timeout = msecs_to_jiffies(DISCOV_LE_TIMEOUT);
 			/* During simultaneous discovery, we double LE scan
 			 * interval. We must leave some time for the controller
@@ -6100,7 +6099,7 @@ static int hci_update_event_filter_sync(struct hci_dev *hdev)
 	/* Some fake CSR controllers lock up after setting this type of
 	 * filter, so avoid sending the request altogether.
 	 */
-	if (test_bit(HCI_QUIRK_BROKEN_FILTER_CLEAR_ALL, &hdev->quirks))
+	if (hci_test_quirk(hdev, HCI_QUIRK_BROKEN_FILTER_CLEAR_ALL))
 		return 0;
 
 	/* Always clear event filter when starting */
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 1485b455ade4..63dba0503653 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -464,7 +464,7 @@ static int read_index_list(struct sock *sk, struct hci_dev *hdev, void *data,
 		/* Devices marked as raw-only are neither configured
 		 * nor unconfigured controllers.
 		 */
-		if (test_bit(HCI_QUIRK_RAW_DEVICE, &d->quirks))
+		if (hci_test_quirk(d, HCI_QUIRK_RAW_DEVICE))
 			continue;
 
 		if (!hci_dev_test_flag(d, HCI_UNCONFIGURED)) {
@@ -522,7 +522,7 @@ static int read_unconf_index_list(struct sock *sk, struct hci_dev *hdev,
 		/* Devices marked as raw-only are neither configured
 		 * nor unconfigured controllers.
 		 */
-		if (test_bit(HCI_QUIRK_RAW_DEVICE, &d->quirks))
+		if (hci_test_quirk(d, HCI_QUIRK_RAW_DEVICE))
 			continue;
 
 		if (hci_dev_test_flag(d, HCI_UNCONFIGURED)) {
@@ -576,7 +576,7 @@ static int read_ext_index_list(struct sock *sk, struct hci_dev *hdev,
 		/* Devices marked as raw-only are neither configured
 		 * nor unconfigured controllers.
 		 */
-		if (test_bit(HCI_QUIRK_RAW_DEVICE, &d->quirks))
+		if (hci_test_quirk(d, HCI_QUIRK_RAW_DEVICE))
 			continue;
 
 		if (hci_dev_test_flag(d, HCI_UNCONFIGURED))
@@ -612,12 +612,12 @@ static int read_ext_index_list(struct sock *sk, struct hci_dev *hdev,
 
 static bool is_configured(struct hci_dev *hdev)
 {
-	if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks) &&
+	if (hci_test_quirk(hdev, HCI_QUIRK_EXTERNAL_CONFIG) &&
 	    !hci_dev_test_flag(hdev, HCI_EXT_CONFIGURED))
 		return false;
 
-	if ((test_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks) ||
-	     test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks)) &&
+	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		return false;
 
@@ -628,12 +628,12 @@ static __le32 get_missing_options(struct hci_dev *hdev)
 {
 	u32 options = 0;
 
-	if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks) &&
+	if (hci_test_quirk(hdev, HCI_QUIRK_EXTERNAL_CONFIG) &&
 	    !hci_dev_test_flag(hdev, HCI_EXT_CONFIGURED))
 		options |= MGMT_OPTION_EXTERNAL_CONFIG;
 
-	if ((test_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks) ||
-	     test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks)) &&
+	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		options |= MGMT_OPTION_PUBLIC_ADDRESS;
 
@@ -669,7 +669,7 @@ static int read_config_info(struct sock *sk, struct hci_dev *hdev,
 	memset(&rp, 0, sizeof(rp));
 	rp.manufacturer = cpu_to_le16(hdev->manufacturer);
 
-	if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks))
+	if (hci_test_quirk(hdev, HCI_QUIRK_EXTERNAL_CONFIG))
 		options |= MGMT_OPTION_EXTERNAL_CONFIG;
 
 	if (hdev->set_bdaddr)
@@ -828,8 +828,7 @@ static u32 get_supported_settings(struct hci_dev *hdev)
 		if (lmp_sc_capable(hdev))
 			settings |= MGMT_SETTING_SECURE_CONN;
 
-		if (test_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED,
-			     &hdev->quirks))
+		if (hci_test_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED))
 			settings |= MGMT_SETTING_WIDEBAND_SPEECH;
 	}
 
@@ -841,8 +840,7 @@ static u32 get_supported_settings(struct hci_dev *hdev)
 		settings |= MGMT_SETTING_ADVERTISING;
 	}
 
-	if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks) ||
-	    hdev->set_bdaddr)
+	if (hci_test_quirk(hdev, HCI_QUIRK_EXTERNAL_CONFIG) || hdev->set_bdaddr)
 		settings |= MGMT_SETTING_CONFIGURATION;
 
 	if (cis_central_capable(hdev))
@@ -4307,7 +4305,7 @@ static int set_wideband_speech(struct sock *sk, struct hci_dev *hdev,
 
 	bt_dev_dbg(hdev, "sock %p", sk);
 
-	if (!test_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks))
+	if (!hci_test_quirk(hdev, HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED))
 		return mgmt_cmd_status(sk, hdev->id,
 				       MGMT_OP_SET_WIDEBAND_SPEECH,
 				       MGMT_STATUS_NOT_SUPPORTED);
@@ -7935,7 +7933,7 @@ static int set_external_config(struct sock *sk, struct hci_dev *hdev,
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_EXTERNAL_CONFIG,
 				         MGMT_STATUS_INVALID_PARAMS);
 
-	if (!test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks))
+	if (!hci_test_quirk(hdev, HCI_QUIRK_EXTERNAL_CONFIG))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_EXTERNAL_CONFIG,
 				       MGMT_STATUS_NOT_SUPPORTED);
 
@@ -9338,7 +9336,7 @@ void mgmt_index_added(struct hci_dev *hdev)
 {
 	struct mgmt_ev_ext_index ev;
 
-	if (test_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks))
+	if (hci_test_quirk(hdev, HCI_QUIRK_RAW_DEVICE))
 		return;
 
 	if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
@@ -9362,7 +9360,7 @@ void mgmt_index_removed(struct hci_dev *hdev)
 	struct mgmt_ev_ext_index ev;
 	struct cmd_lookup match = { NULL, hdev, MGMT_STATUS_INVALID_INDEX };
 
-	if (test_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks))
+	if (hci_test_quirk(hdev, HCI_QUIRK_RAW_DEVICE))
 		return;
 
 	mgmt_pending_foreach(0, hdev, true, cmd_complete_rsp, &match);
@@ -10089,7 +10087,7 @@ static bool is_filter_match(struct hci_dev *hdev, s8 rssi, u8 *eir,
 	if (hdev->discovery.rssi != HCI_RSSI_INVALID &&
 	    (rssi == HCI_RSSI_INVALID ||
 	    (rssi < hdev->discovery.rssi &&
-	     !test_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks))))
+	     !hci_test_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER))))
 		return  false;
 
 	if (hdev->discovery.uuid_count != 0) {
@@ -10107,7 +10105,7 @@ static bool is_filter_match(struct hci_dev *hdev, s8 rssi, u8 *eir,
 	/* If duplicate filtering does not report RSSI changes, then restart
 	 * scanning to ensure updated result with updated RSSI values.
 	 */
-	if (test_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks)) {
+	if (hci_test_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER)) {
 		/* Validate RSSI value against the RSSI threshold once more. */
 		if (hdev->discovery.rssi != HCI_RSSI_INVALID &&
 		    rssi < hdev->discovery.rssi)
diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
index 5a8ccc491b14..c560d8467669 100644
--- a/net/bluetooth/msft.c
+++ b/net/bluetooth/msft.c
@@ -989,7 +989,7 @@ static void msft_monitor_device_evt(struct hci_dev *hdev, struct sk_buff *skb)
 
 	handle_data = msft_find_handle_data(hdev, ev->monitor_handle, false);
 
-	if (!test_bit(HCI_QUIRK_USE_MSFT_EXT_ADDRESS_FILTER, &hdev->quirks)) {
+	if (!hci_test_quirk(hdev, HCI_QUIRK_USE_MSFT_EXT_ADDRESS_FILTER)) {
 		if (!handle_data)
 			return;
 		mgmt_handle = handle_data->mgmt_handle;
-- 
2.43.0


