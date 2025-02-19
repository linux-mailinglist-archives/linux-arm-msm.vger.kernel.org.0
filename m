Return-Path: <linux-arm-msm+bounces-48509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A6EA3BF89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 14:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26DE816520B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 13:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBE6198E81;
	Wed, 19 Feb 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZqr+ilV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4546B12B73;
	Wed, 19 Feb 2025 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739970596; cv=none; b=TU2Bu4VuPQ/MU+0BM5GRKkh6lOFUu4et4zpFCEdOcUuXSd7YWMS7rz0oBxnxCIr+JZrWBIApdPQGYPUvYDvUe95a+Y30DNgwYZxpnZYKD8fzA2qFT3cS/N+rYZwJ8MR9f23XUUPHyMWWPq/PLVCutVurXFIhbtGcFHWNXX83qsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739970596; c=relaxed/simple;
	bh=lbm9EMvHSC3HGg8sbayokeiGq1GS4Q8HOslmFXwOhlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ldMhzAqJeQflk4ZxcmJQO0MDQCSbdPFU05QSmd2b3cfov9Tzh/ATJMhXiobL7R+JeFhGij78LwM1+4Y2wAlwuk/BS6aXdb6nHtxoH8M80m/qRgENMTv4FshuTV66sxOj3f2jNGVKfSf+Zbvv8gDen97OyxpXva/3/HYVOrSHzzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZqr+ilV; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dd9b3419cso3614753f8f.0;
        Wed, 19 Feb 2025 05:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739970593; x=1740575393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0Kbyp7CupAYs5UbQsl7w/FVHCaTEohFav94XT7tXLI=;
        b=UZqr+ilVTqQQq+vAJlF+eiF0EYBu519vGaoATPDBR2qVufM/JsKw0je0lQFVvYZxre
         x/DuRLNC7McYKVZxcRn/lNJZzfhVorJWsl+ocAer71OUmbRlQ5g+JRRsawL9y8tVnGzM
         M2+Rgx5hkW1nVRcGBbHY17UtmdfflrpMAdsEXDYhjhhxyjvzGT8S39AhB7W0NwqMX2hB
         Jh5tMzIcUM3w9Gwf27YlUyDKGJWE1g+JnRasdFwNXrScCNqdw7mD5/g1kPObJcwQpwEX
         OdzXLNXMHmUJqt4at0v59F62WoPZJMufaGmXlJNCdHGuf92LolhLcnUGwxalvcuymPGh
         f79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739970593; x=1740575393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0Kbyp7CupAYs5UbQsl7w/FVHCaTEohFav94XT7tXLI=;
        b=LIBRXeO0oDAvsKYMl0gtQIZRvdC1TDICxggi+b1lO932HSaLfDhN4qdoL1HYGvTzi1
         78rCfyiDsqLCp2aHLhnLeoJ396+E8WP90acNgZmcBLeK40hMn6FxYyMONuWt9GwW0N2N
         jcUQWu6F1sn1JJzAehDhLKmjpQE0PkbmJeiHyxCblgq7g2NWIdWIkYNTrBFMvyiRP41m
         Vn9BscpEyN1jmiOLSWj1zZwKhApnc/Srb6bkvzNkqnX7593CXUa1zrvVZMSySINly9Wa
         81W3Iu9Yhjji1IhHRiECtp3ktE4rHqK31WiYLPhlsniorpbfFWpBKzKt81fmpgts1Hh7
         QdvA==
X-Forwarded-Encrypted: i=1; AJvYcCU9l6XC6lli1qeSqEp2qw9q9AQ8Nkd3ccwGBTZ3/A2Xv0TVuBAYmZh7x7Y4w332tEBy5DDXnO/KJgLGs70g@vger.kernel.org, AJvYcCUrfH6JurghnjrONS5kwrq65XDpb0qSArkGhELMQ6EpjEXfWNRpeHfxJcqIOOIgsd2yCqEGkPo3@vger.kernel.org, AJvYcCUrjzgwqpR2gR3rpWQNpdqj84ZN8PcyAdVO8vBCo1LBHwBYjRVWhRFHiKOhuBkBINUjg3gKBWcU4BazEUW/@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRgpODYwImhTzosGp8UXQa021fcydT780Vu/QLPM6TYqFZWzo
	FAG62wS8NKyYstDNyDiML1WhWINflo2H3ePl8pqGRZFUs6urBQey
X-Gm-Gg: ASbGnctJcjesBzxOjNf3oaRmvry/JSL8mQGOEY46uIQ/m7xrVdvybGyrgo3Y1CLeZ8g
	/gnY0Io8u1gfHrOHpspVmP2SpTV2d8aM8njv9eL7m8SKp/6SoEB5B45yXUXK3Ob+wT0z0a5R9Sg
	6YHe+xx+Zus6JRdkQlDscqIp4bgfhzcITr/YEj9ywwkrLzsClc0GfKD6loKwS9RbO8VCp2jbvbi
	k9tkhL8QJx/a5wsq6Mu/IpHO8jMOoRQjHksGPq5WcFra8Ch8Zw0Q+nAyZdGHoobGy37xYpE3EX6
	TO+lbIoah80rjS7DsuIQhqqZE6SMqxin1lqcAkxLkCIl1H7qjlEoyKGg690aIQ3My8NJstI=
X-Google-Smtp-Source: AGHT+IFCaHY0kzUOzM91PMiUlVU3mwEfBxBS9L99pdJlK6WgwXE5yUiGE5nRgxRPTq9PSpDKdeDk5g==
X-Received: by 2002:a05:6000:154f:b0:38f:2093:6e75 with SMTP id ffacd0b85a97d-38f33f3599fmr17480037f8f.33.1739970593210;
        Wed, 19 Feb 2025 05:09:53 -0800 (PST)
Received: from localhost.localdomain (host-87-11-14-46.retail.telecomitalia.it. [87.11.14.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f259f7979sm17576873f8f.83.2025.02.19.05.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:09:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	George Moussalem <george.moussalem@outlook.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [net PATCH] net: phy: qcom: qca807x fix condition for DAC_DSP_BIAS_CURRENT
Date: Wed, 19 Feb 2025 14:09:21 +0100
Message-ID: <20250219130923.7216-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Moussalem <george.moussalem@outlook.com>

While setting the DAC value, the wrong boolean value is evaluated to set
the DSP bias current. So let's correct the conditional statement and use
the right boolean value read from the DTS set in the priv.

Cc: stable@vger.kernel.org
Fixes: d1cb613efbd3 ("net: phy: qcom: add support for QCA807x PHY Family")
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/qcom/qca807x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 3279de857b47..2ad8c2586d64 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -774,7 +774,7 @@ static int qca807x_config_init(struct phy_device *phydev)
 	control_dac &= ~QCA807X_CONTROL_DAC_MASK;
 	if (!priv->dac_full_amplitude)
 		control_dac |= QCA807X_CONTROL_DAC_DSP_AMPLITUDE;
-	if (!priv->dac_full_amplitude)
+	if (!priv->dac_full_bias_current)
 		control_dac |= QCA807X_CONTROL_DAC_DSP_BIAS_CURRENT;
 	if (!priv->dac_disable_bias_current_tweak)
 		control_dac |= QCA807X_CONTROL_DAC_BIAS_CURRENT_TWEAK;
-- 
2.47.1


