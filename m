Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D848066DB6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 11:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235963AbjAQKqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 05:46:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236182AbjAQKqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 05:46:36 -0500
X-Greylist: delayed 2275 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 17 Jan 2023 02:46:33 PST
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F192D16C;
        Tue, 17 Jan 2023 02:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5lOdDkXmqt/n+E+7DkwgWkVn3eeFOhgRvKeEyKH5zV4=; b=hJNmOS1iEMSCYdkwEsbHFpVKKI
        5R8bmjR62AZt3g2SsB1hJ+z3TUZ1YhAHV+qXyx3ivA9KsiDosqvTgXBo5ephRj4u6hN6p6ZOK/kjA
        c51kS8di/uIvEYTSjCWatXizQgc7S4ved7yoZUhPcS2TT4eMjRnoHOqIxcT+pV5g1c5CYgQMji33n
        Jv4uG9Z6+pre9pShsAAbQGPN3PCpmnjV9y303jNDnxS5lCeWqY6uP1uLYLVjZEBOQG0rWLECIZZzx
        IMl09R1dGLDykUeMP3pPe4Y4UbEnJ+Vp9Hi4VNV4laUxmTr00eXJa/orQpJMV9qZIvBosxGIT+dQ3
        vVl39hdg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1pHitL-003dpB-BN; Tue, 17 Jan 2023 11:08:31 +0100
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH v2 RESEND RESEND] Bluetooth: btqcomsmd: Fix command timeout after setting BD address
Date:   Tue, 17 Jan 2023 11:07:03 +0100
Message-Id: <20230117100703.375787-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On most devices using the btqcomsmd driver (e.g. the DragonBoard 410c
and other devices based on the Qualcomm MSM8916/MSM8909/... SoCs)
the Bluetooth firmware seems to become unresponsive for a while after
setting the BD address. On recent kernel versions (at least 5.17+)
this often causes timeouts for subsequent commands, e.g. the HCI reset
sent by the Bluetooth core during initialization:

    Bluetooth: hci0: Opcode 0x c03 failed: -110

Unfortunately this behavior does not seem to be documented anywhere.
Experimentation suggests that the minimum necessary delay to avoid
the problem is ~150us. However, to be sure add a sleep for > 1ms
in case it is a bit longer on other firmware versions.

Older kernel versions are likely also affected, although perhaps with
slightly different errors or less probability. Side effects can easily
hide the issue in most cases, e.g. unrelated incoming interrupts that
cause the necessary delay.

Fixes: 1511cc750c3d ("Bluetooth: Introduce Qualcomm WCNSS SMD based HCI driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Unmodified second resend of the v2 I sent back in June and again in
October, it seems to have been archived again in patchwork. Any kind of
feedback would be much appreciated! :)

I tested this using a script that reboots repeatedly and checks for the
error. With this patch, BT shows up successfully for 100+ consecutive
boots. Without this patch it usually fails after 1-5 boots (or even
always on some boards).

Changes in v2:
  - Clarify commit message: Add affected devices and kernel versions
---
 drivers/bluetooth/btqcomsmd.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqcomsmd.c b/drivers/bluetooth/btqcomsmd.c
index 2acb719e596f..11c7e04bf394 100644
--- a/drivers/bluetooth/btqcomsmd.c
+++ b/drivers/bluetooth/btqcomsmd.c
@@ -122,6 +122,21 @@ static int btqcomsmd_setup(struct hci_dev *hdev)
 	return 0;
 }
 
+static int btqcomsmd_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
+{
+	int ret;
+
+	ret = qca_set_bdaddr_rome(hdev, bdaddr);
+	if (ret)
+		return ret;
+
+	/* The firmware stops responding for a while after setting the bdaddr,
+	 * causing timeouts for subsequent commands. Sleep a bit to avoid this.
+	 */
+	usleep_range(1000, 10000);
+	return 0;
+}
+
 static int btqcomsmd_probe(struct platform_device *pdev)
 {
 	struct btqcomsmd *btq;
@@ -162,7 +177,7 @@ static int btqcomsmd_probe(struct platform_device *pdev)
 	hdev->close = btqcomsmd_close;
 	hdev->send = btqcomsmd_send;
 	hdev->setup = btqcomsmd_setup;
-	hdev->set_bdaddr = qca_set_bdaddr_rome;
+	hdev->set_bdaddr = btqcomsmd_set_bdaddr;
 
 	ret = hci_register_dev(hdev);
 	if (ret < 0)
-- 
2.30.2

