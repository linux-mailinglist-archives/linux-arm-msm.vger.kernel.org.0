Return-Path: <linux-arm-msm+bounces-48391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEF4A3A136
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 16:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96E1916F935
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7638626D5B0;
	Tue, 18 Feb 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uujVYSSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4739026B97A;
	Tue, 18 Feb 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739892580; cv=none; b=ubaXwu7wnrjQ9v/4U4PWesQQfpN2haguZBPizu5G04j+4wmO/QuuGvG5TfnCcc9Qr4xXXl8lrRkr2UMTDuHKFKBHc52lP9JS2PEsOUCf5dbhJ7VEWGijf4EB3u370eNPc2OjPT5gYvGFVkWa/WgyfMJitgUIQFv3k5b2QpcYXes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739892580; c=relaxed/simple;
	bh=0PhbzpB9u8D3S2MXUBj+nfqwYX8xKnp3orMPWwddbMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKNZNsdHxfqXPUnoUVlnxsfiagIVsTs1px0NuXpijLjW2zF7/nR9Nz82guJdO6TenO6WR6FzwTY3FJCJi/THsy1umzLvK9Z4msEejYiVbpsQPPGROHOnRIV0CocEy4kxbGgfMsuemjJdbVeRv6+yxVI9yoixf+TdELT9R6yEwmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uujVYSSf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9640C4CEE8;
	Tue, 18 Feb 2025 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739892579;
	bh=0PhbzpB9u8D3S2MXUBj+nfqwYX8xKnp3orMPWwddbMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uujVYSSfLTqej3fODQzZaSya4QDk7isjWVEORPkqZ5q7SgP+StLcrwOCJVYszTUZ8
	 khZAvFXYc67CEd+UQ0kHRk7g1R+woLRHq9j73t8d7ii/oeYgFR/24z//7EfOQfEK3d
	 RQZgUbKZnj1QsLjxw/IRwwJM4Hu9RqRCp8VmD1uaP/nlfNsIQD1/QxE4OQRBIt3spe
	 2Hp1emlv2v2WCIfv+he9NhlqIOe9MdkXgPvXPPjPpXzMewkYd4qQwUryvrKSn0Pa/L
	 FSvSQM/cY7os9XSsTOt+NJtMvf3tm+0xG1hVckWwd/W8YAuR9dDACPOTNV1vMSu6Dl
	 CLivnd8WUwwHQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkPXg-000000005zN-1p2N;
	Tue, 18 Feb 2025 16:29:48 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 3/3] usb: typec: ps883x: fix configuration error handling
Date: Tue, 18 Feb 2025 16:29:33 +0100
Message-ID: <20250218152933.22992-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250218152933.22992-1-johan+linaro@kernel.org>
References: <20250218152933.22992-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate errors to the consumers when configuring the retimer so that
they can act on any failures as intended, for example:

	ps883x_retimer 2-0008: failed to write conn_status_0: -5
	pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to setup retimer to DP: -5

Fixes: 257a087c8b52 ("usb: typec: Add support for Parade PS8830 Type-C Retimer")
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/usb/typec/mux/ps883x.c | 36 ++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
index f8b47187f4cf..ad59babf7cce 100644
--- a/drivers/usb/typec/mux/ps883x.c
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -58,12 +58,31 @@ struct ps883x_retimer {
 	unsigned int svid;
 };
 
-static void ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
-			     int cfg1, int cfg2)
+static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
+			    int cfg1, int cfg2)
 {
-	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_0, cfg0);
-	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_1, cfg1);
-	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_2, cfg2);
+	struct device *dev = &retimer->client->dev;
+	int ret;
+
+	ret = regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_0, cfg0);
+	if (ret) {
+		dev_err(dev, "failed to write conn_status_0: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_1, cfg1);
+	if (ret) {
+		dev_err(dev, "failed to write conn_status_1: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_2, cfg2);
+	if (ret) {
+		dev_err(dev, "failed to write conn_status_2: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int ps883x_set(struct ps883x_retimer *retimer)
@@ -74,8 +93,7 @@ static int ps883x_set(struct ps883x_retimer *retimer)
 
 	if (retimer->orientation == TYPEC_ORIENTATION_NONE ||
 	    retimer->mode == TYPEC_STATE_SAFE) {
-		ps883x_configure(retimer, cfg0, cfg1, cfg2);
-		return 0;
+		return ps883x_configure(retimer, cfg0, cfg1, cfg2);
 	}
 
 	if (retimer->mode != TYPEC_STATE_USB && retimer->svid != USB_TYPEC_DP_SID)
@@ -113,9 +131,7 @@ static int ps883x_set(struct ps883x_retimer *retimer)
 		return -EOPNOTSUPP;
 	}
 
-	ps883x_configure(retimer, cfg0, cfg1, cfg2);
-
-	return 0;
+	return ps883x_configure(retimer, cfg0, cfg1, cfg2);
 }
 
 static int ps883x_sw_set(struct typec_switch_dev *sw,
-- 
2.45.3


