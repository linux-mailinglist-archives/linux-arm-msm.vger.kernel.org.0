Return-Path: <linux-arm-msm+bounces-79199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F68C1531B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D317A4E3593
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 14:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A74B332912;
	Tue, 28 Oct 2025 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZ6m3HKn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC24259CA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662369; cv=none; b=aSgYqzCtTfw+DDeK7doH6FQyvPMeLfORXgB1xXAeer2RuFvpel0qMf++vdP0JrA06rpNdpVPW6rlsg0uHmURPmF4tPw1Rwzn+TKS0Q2dLNXZiDVDn+i88hJozbiXE4IteKe/6KamlWPISUMBqx3W848ijEAlWh+edWsD9Q5vhVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662369; c=relaxed/simple;
	bh=6j7DZ69/pJ+jm4HK5EnL0Dk0EaQ1PW3sTFee6AUTNjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DjWuw/1Y5zmpuCCK5EbR52DvMU2eEt2a/+IiU3rLhfXFoMas1WPITgnmfVyh8CEjh7TEa9zQ3Uzx+xW7pj181Rsc7aGgArV4GLFTYWqWFDg2FdfyKGvb3eybkRomgqHBqOer3pVTQrwJnuNG1+Fm4KB2F6J0vKqxhcN0bZn/5Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZ6m3HKn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-471b80b994bso84112835e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761662366; x=1762267166; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMGYbfLnNZolNz4SGWZENs/OOTmFr8Uy7BDON+kBWXM=;
        b=GZ6m3HKngLNjXxyBnKjQmcGT8U5DeHF3fwcGr44xlthJI85wq5h9CO4OglBFCwsw2X
         IjvzosrLS/Abu+vPhLzS04QIZ3JwW9GsgJA4TQB3CKXyDUotgB05L2PavGUMkGyIZc/m
         6EShUYFX/ukhDUr1CeZUv3aI2MY9mtGRch4rTyrAyTYvIh9+zfhRclylL+FZAwohddmC
         uI4lDJxFRxiuTPDSq+mXfJdc6kdT6cvWhVAosZTjWDUvyNzRHxo2gVaFNiYmeZ3FScDV
         G8YNjN3OadaW0W8EDMgINSSVEm97LVV4OcJZ+jU5F+ou+6DtdOyuHShDd8XBy08+6pUF
         bWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761662366; x=1762267166;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMGYbfLnNZolNz4SGWZENs/OOTmFr8Uy7BDON+kBWXM=;
        b=TidgXK5+liegLS0EOukmqnjT8r3Vw4oyLjsDe6L19/RN/dmX915MpWf83LlJfaXRs8
         rRfCc3gLPM2h32iWEL9EKGj7Mhfl4BY+v5C15NFO+mqcpvF/r5A+9nAelcHtIT6SnigF
         cRnwIAP0onLN5/yUuIWfUQBkaVhfUi5hIs1yl6pSjqKpyMzdiF0PR+hOZNBxMj2j0zS/
         24wWuU9P7yT7HZEAUlABdETA604yQjkwAJednNr/+rI397GGumKr9sQMKVtEcTl+iDQH
         RipPG/PRe/1cEMxVVlPQofDM+KR5YJEUhM3ndqVVLwsrT/hFZ6HIM0ItiEobF2bzwg5M
         3cpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGjoDw1G9eL9x49gT/Y1La6+pgB9v4o/H4LG+7pVQpziqyEB2itGD2GX3S8S3uBvxrSSjJFeKxKV08wvG5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk2EoEK6o5h9aMmiaEqsEk+aPjycZGd4wimrxwdALHdYPhpSgx
	BwSgckNSoUwN+I+PzjpwFHIQw9q5JXh5XF2dzweEue6Dd0N3K37gqLhKJuDEPBMaJwc=
X-Gm-Gg: ASbGnctfR7e3+FwwtI6H7UKYc8L8qlANu3R1LX+e1p4dLNnxFpGZEftmAfHwwxFFJDM
	s3XxH+Qy+Rk5Mmk+gS1jOHylPeo5pVRoCJejy1PMqrJnqUbwmKMbD+Mgwcz0wx3Bm6Nlq97n/V0
	d5ceBCIBRAWdDOTb8u0Yq0VtFtxxv1cglqcmX45ZretQxNXB4NRQhPQ7M2P4EpNZ4vrFbE9c82O
	JjMtxnJjzELYN2T2O20MtsPrgODhkTrivIT1to92GO3gJzyB3Dngq6FHZW+76WBacXkR5RtiKkE
	D4yrccVEZDnBxJO3PIXa67xYz/inPse0z9EQ99CqzrjqLYZC/nEgkH8oDLvL/852IhgagfFU9EN
	b7TwGfsqEjhn2jdcdjGL4CoIaCEYAOLBRqF0JIMHYTYqPxSJlIxfhoMEtCHYPqLkRA8iN/UveJ+
	g4PzszcxJ5
X-Google-Smtp-Source: AGHT+IGsg77vJFyDzbKu3MvGfNPP07qOfc5c2jkhCzBilqMSI7IYlez2zSn+z6nzwCu/peSm/5L6Zg==
X-Received: by 2002:a05:600c:548f:b0:476:651d:27e6 with SMTP id 5b1f17b1804b1-47717e7a65dmr32654895e9.36.1761662365741;
        Tue, 28 Oct 2025 07:39:25 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47794asm223698735e9.1.2025.10.28.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 07:39:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 28 Oct 2025 16:39:19 +0200
Subject: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJbVAGkC/yWNQQqEMAxFryJZG9BQi8xVxIW0UYNDK43KgHj3C
 TPLx+e9f4NyEVZ4VTcUvkQlJ4O2riCsU1oYJRoDNdS1DfV4BhVc3pI21E12zKanYzrMwzmX/34
 R+thR8N656DxYbS88y+f3NIzP8wU25Y+ieQAAAA==
X-Change-ID: 20251028-ucsi-glink-skip-orientation-for-ucsi-v2-6d52c6644d46
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=6j7DZ69/pJ+jm4HK5EnL0Dk0EaQ1PW3sTFee6AUTNjM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpANWbl46daAm1w3/r4ThxmHU1ITVChMcOHxIk6
 P00FOdpCYuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQDVmwAKCRAbX0TJAJUV
 Vv1qD/9vjGwtf4UNDHDGUVSGnq3TGF4OcHkoyiXooQ0QhPWpgsXylTezsRyHUquS923olJrTJTZ
 3ySr/A9CH9nmwXHP6E1hJ534QJqN/zDOhBry5tSGC4X9mQPTQaKdtsXFC4qPI6x4h3ORIZj89Br
 uXQHEIoJZID3QeKglw5SFxeGLnbpuMx2F4QvLnrHLTCMxtZDqPffC75Y+mZ7TtgH5JKOtyh27WR
 pd2an2EVHtxuZMRo5msd/g4aSB4+7mJcUIkXKdfGVFJr9MWjaqsmStvcvJgQnyOr8MdgOXTaJzp
 hFYx/W+XYGnNCRSoK9IVLfjjGqRuxykU5ImAr9DRlRwBGR8iVtCotoLIIKUhaydsfttZO+xtcjB
 EIc5mqe9KrfCr2Lc8OBgXS54Wbr8mEz9q2k8k7q3mWuUbMMShaEq7nobQB+11oBPUbqgO1OTBg6
 /fSn9sL6OVrSDeGWtmhN9lFWotbk/PGQNcc+bn5/jKuSS0k4B1kNDw7f7XsuaDDeE8W4N9vzONb
 dOCiv+p6cNTnSbX2fNV3UgJvfGpHobdC/YilsDpkAXKGmXTdCzkN9LJxiZ/B2UjoHPHfviKpdvR
 OWsLhCjzn0N+hjqfHlkHRzAhUdVZKtQjZWl5I2OiOOYiZ25utCKqef+ZkIFpd55EqwlfojrM/v+
 UMjZOM2SI2sG/6Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

In case of UCSI version 2.0 and above, if the orientation is set from
glink as well, it will trigger the consumers along the graph (PHYs,
repeaters and so on) to reconfigure a second time. This might break
the consumer drivers which aren't currently implemented to drop the
second request of setting the same orientation.

So lets leave the orientation setting to the UCSI generic implementation
for all platform that implement UCSI spec 2.0 and above.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 11b3e24e34e2b4c21df20b6bec69619a0292c7bb..e68fd3fd0f54bfa3c5998519b17cf187bb363ec8 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -209,6 +209,10 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
 	int orientation;
 
+	/* For UCSI 2.0 and above, orientation is part of UCSI payload */
+	if (ucsi->ucsi->version >= UCSI_VERSION_2_0)
+		return;
+
 	if (!UCSI_CONSTAT(con, CONNECTED)) {
 		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
 		return;

---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-ucsi-glink-skip-orientation-for-ucsi-v2-6d52c6644d46

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


