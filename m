Return-Path: <linux-arm-msm+bounces-25469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 832EF929F5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 11:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D7481F2420D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 09:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C757F7C2;
	Mon,  8 Jul 2024 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aYbk29QA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF407D09D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720431590; cv=none; b=X3FBksfmNh0l6WC7htUdgS7t+EbqxWoiop5PTLPhw99jAD1a3Eu+mwPMLaWcA79RLJp86yZ5/aJbJAvcgqs4n61d8H6X+Wzg5eSW65ODRf05qiUYBB3jVzmt7uRmFt1V8I5YVaKvUL9N43HEyrjZT8p9Wr1sDlMk3ucX1DnjqKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720431590; c=relaxed/simple;
	bh=rX6HSZqo9EDn0+GeGHERexI6fvsrXchyVpKYUYjFQw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCeC86gVf6MimRzxokFpteN8xjTtMctVFJbXrLqYKr8ugVcB8CFXKTunbRICHM/o6zxkeXCj4vI1dudJqI/JMr5QZGlNY6bFnUpiluobhZ6IjjgdR3EZUR4ACc+R5zOD4x64UN0yCNjy9gEwoBSARVB64i7xUnoPuXEJUoYEduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aYbk29QA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-367940c57ddso2379320f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720431587; x=1721036387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieafqXzIyb831j0Lac7a7OvRSebh4Z9eyb6cztRWuGA=;
        b=aYbk29QA9ZcAAylydjikUoiCnkOl/H9jjMEuervgTTfkjRcbctELFyIFZIzk6FdsDk
         BSRlkmlWFn8xIPCTCWWMYuoVCS8NW34Kjff5iHsdB0Hi33Ag61wqN4Qi/KyXNS7WmMQu
         cXAokk/WtwJnJLUY9KFzZ5zOsVXmN5+nvie709UCE9uEbPng8026jdW7bOkhxYSVFFQF
         XDFaTOSfZwnYYiUzOppBErDfUkYOZSFMLJVRW+gOUs2hN5rGYrsVqM/ETTzxgyJ3b68r
         uN5bbADhb+go8dvw9BiENtjkdjLIEGCNpiAQjUOYL5IpnmsndOiOV5UuvdiLjh6SfWt+
         oFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720431587; x=1721036387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieafqXzIyb831j0Lac7a7OvRSebh4Z9eyb6cztRWuGA=;
        b=i5xLFGWqwnte783dg8z0cgUiUKM5QITOP4LKCGMozcJA50Fu2ySvlIhTeGhUdqRZyM
         4TvHW8j78prIKhah6og3UoNHzhFGNd3nILA8gtDy/3fncriBMDXucQfjvdOHWR7ycJGl
         /g/VH369CLglrDkYMShFduytBYZ1zsLjKm89QY7DMXuP9k4Fl1F/8jqdeFkqExevo+uQ
         c0PYGWHJzNxvqgxQNrll9MHYup0qGt/vpnR0MxP8/+Rmc82BW2bvxvDbUbq++xhe/SvF
         ONLYcbUUUZUzdrVJFjGHRlBIL73jtSmqjB3FWm96fx2ngdQwcEwaQOIvk44wpWzZtA5X
         pa2A==
X-Forwarded-Encrypted: i=1; AJvYcCUooM+8cs59AZKV7272T05MtcLrdHbpjYLARaO0HYZC1JRDHlU8rWD6vDvXV+a8r5HYkTL0NssicdIG2kzDerqQNFxR77ikbNlYcNmZLQ==
X-Gm-Message-State: AOJu0YxWxcUOQ40txd/4G5vIzG9ncMqkYhffXiSVg/6VaLUjPEaBwdQu
	MaHroA2RkHh/QQ+kPWpCJaPUFxzP5dvT4FrWaxZ4EkP/S9muJT+U0c+Cav7lbf9P62SFl62ESAp
	j
X-Google-Smtp-Source: AGHT+IHwXksP6gA/c/6Ht8kZISwkZu/M27CDm9xGXqWegnzbYa06h/+s1e9ffX887LU6vdm6tEGpcA==
X-Received: by 2002:a05:6000:1868:b0:367:83ea:9a6c with SMTP id ffacd0b85a97d-367b96c026bmr2930553f8f.24.1720431587156;
        Mon, 08 Jul 2024 02:39:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36789fd7a0esm15457779f8f.104.2024.07.08.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 02:39:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 08 Jul 2024 11:39:28 +0200
Subject: [PATCH v2 5/6] Bluetooth: hci_qca: use the power sequencer for
 wcn7850 and wcn6855
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-hci_qca_refactor-v2-5-b6e83b3d1ca5@linaro.org>
References: <20240708-hci_qca_refactor-v2-0-b6e83b3d1ca5@linaro.org>
In-Reply-To: <20240708-hci_qca_refactor-v2-0-b6e83b3d1ca5@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XhfMHe3KhH9rYmkZoXav+8TiC/B+hfO1M+bLTOU1TM0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmi7PaDANIuScMy3WbS7nGqzPNKQtQc8TFWl/mW
 as8m/OCOVKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZouz2gAKCRARpy6gFHHX
 cmIREADQGHWnbgUpZxbuSyzUJnU+H/+pR3Kyg/hXijvP97dJ7C3C4+ev10eiMZ/AQVG7MYMNywx
 63l40EAunGje/FqGmETeEC4C7GQFVouL0NpzybMV625fNOpIKwgDnVRciURrl48XZyrKza22c7r
 vZ2cNQCARAFo6XhSuIUiry4EoirivRrWbGhhjGT8xmFU51Pidn1atv8JiI0Y18h2LiKAltkC9R2
 yculYwy5oFzbJedXHE1VeAEBPjFPpXBRsLwrVSdzYkw1RMBXjKhv+VfhumidVkpExf9PKerKwhQ
 rZPoyJO6ylp+g3dQ6cWcpwHuj9Zt2vqn1Xz0AX37I8ccUwUvPQ9GTgS5gfCouM96JK9qdGw1Yf1
 6EZ2B+EuQcmsLaHgUcx8xbaNweDpLg9VjrHHqQJTRgG5BOZNX9tu+YkBjojqsmV60cBc4DZmnQ4
 xuZR2iOv6HibbQ34jKToO9KhrahuLcp0OxJoryclsQ1KB4hOTgOScfcNyzr0SUVRq1aVBq81+qN
 jufSZSWMYGpNG23Oyvtx5+MIeZ2vTz9gKM9IAa4wrMigtGwiA/Urtu/EBPo32Hfp3DIT6JO9iyf
 zSgAxCkVJOFwdzRo9lVBSSqpJNTnyi5YNrfrlxVl0hviSn2Urn+qH4D8Pa/TtJId4oED3k7G7nl
 tFARIOCqjU7PcBg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for using the power sequencing subsystem on sm8650 boards
and X13s laptop let's make pwrseq the default for wcn7850 and wcn6855.

Both these models require an enable GPIO so we can safely assume that if
the property is not there, then we should try to get the power
sequencer. Due to how the pwrseq lookup works - checking the provider at
run-time - we cannot really do it the other way around as we'd get stuck
forever on -EPROBE_DEFER.

If the relevant OF node does have the 'enable-gpios' property, we
fallback to the existing code for backward compatibility with older DTs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 9d9553552ee1..22d37e8944d0 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2354,13 +2354,28 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	}
 
 	switch (qcadev->btsoc_type) {
+	case QCA_WCN6855:
+	case QCA_WCN7850:
+		if (!device_property_present(&serdev->dev, "enable-gpios")) {
+			/*
+			 * Backward compatibility with old DT sources. If the
+			 * node doesn't have the 'enable-gpios' property then
+			 * let's use the power sequencer. Otherwise, let's
+			 * drive everything outselves.
+			 */
+			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
+								   "bluetooth");
+			if (IS_ERR(qcadev->bt_power->pwrseq))
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+
+			break;
+		}
+		fallthrough;
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
 	case QCA_WCN3998:
 	case QCA_WCN6750:
-	case QCA_WCN6855:
-	case QCA_WCN7850:
 		qcadev->bt_power->dev = &serdev->dev;
 		err = qca_init_regulators(qcadev->bt_power, data->vregs,
 					  data->num_vregs);

-- 
2.43.0


