Return-Path: <linux-arm-msm+bounces-48390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938AEA3A134
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 16:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E7BD16F77E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7170926D5A5;
	Tue, 18 Feb 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFW7hUdC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4731826B978;
	Tue, 18 Feb 2025 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739892580; cv=none; b=gzOwjqBxa9JHNmgB2nTENIauyMmLAWwRuEgm3hATlR5tfRyyksR2dTaOPT9gebwruypc/nBwQomzCbcK9EehJAWdbYlOnT7M/kUZ6gkI88wwQjQycY+o2ArOzigSaXpzpO2bpRai+Y3cVFMzsvEVWzPfq6HLNU0MhS2zJLGqDX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739892580; c=relaxed/simple;
	bh=N1ayEV7sL5Sq3gWnWdmX3KdAdqSXVHGCkXIl9Q1DMfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHL99KQiTyvm1uYMuYQz930myuch9wfCB4xZ1DBuhMB9aPXMD7wg4lXfZEZWzY3YjNtu7zFe3dxuaeBzPDm5Anov2c6wPJRjpGFmAcxLGSLNS8KCXEspP1yW1OTZC4rf51aDnvG71qTmZMkmh6AASiScnE8dE3iDAo8Z7p26+oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFW7hUdC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24E4C4CEE9;
	Tue, 18 Feb 2025 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739892579;
	bh=N1ayEV7sL5Sq3gWnWdmX3KdAdqSXVHGCkXIl9Q1DMfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eFW7hUdCmnmH2YimY9U672MtcYiBUQiQilqowPAGeLQJrC1yuddIJQRRlQCozkugE
	 mkfrI/kfPMXpYiLIvBAMd7wY0D7hMVMjucrO5psDXFlIaCJ3dtszLcfPIEkeT+wRHr
	 Yua9VfFBTNU+N8AKaGZChhvPZIqlFDgflu0m2zGsJO/8xhya4rEKU/l5KFkwMDeWMM
	 hLyzDZCCXNxeUV5vjNrHO4/xcj962tmDuCRgArx9WUIiVYLEPfaAz7Hpr9ZbbR4Sii
	 mE4o4Lt2GYBbRtAoMAeJja8fawYoVzmaDoSPvwT19gMSsW3Z3s0XNaswKdXm/ql9fL
	 16b+K00UgF7Gw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkPXg-000000005zK-1RoY;
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
Subject: [PATCH 2/3] usb: typec: ps883x: fix missing accessibility check
Date: Tue, 18 Feb 2025 16:29:32 +0100
Message-ID: <20250218152933.22992-3-johan+linaro@kernel.org>
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

Make sure that the retimer is accessible before registering to avoid
having later consumer calls fail to configure it, something which, for
example, can lead to a hotplugged display not being recognised:

	[drm:msm_dp_panel_read_sink_caps [msm]] *ERROR* read dpcd failed -110

Fixes: 257a087c8b52 ("usb: typec: Add support for Parade PS8830 Type-C Retimer")
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/usb/typec/mux/ps883x.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
index 274de7abe585..f8b47187f4cf 100644
--- a/drivers/usb/typec/mux/ps883x.c
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -291,6 +291,7 @@ static int ps883x_retimer_probe(struct i2c_client *client)
 	struct typec_switch_desc sw_desc = { };
 	struct typec_retimer_desc rtmr_desc = { };
 	struct ps883x_retimer *retimer;
+	unsigned int val;
 	int ret;
 
 	retimer = devm_kzalloc(dev, sizeof(*retimer), GFP_KERNEL);
@@ -360,6 +361,16 @@ static int ps883x_retimer_probe(struct i2c_client *client)
 
 		/* firmware initialization delay */
 		msleep(60);
+
+		/* make sure device is accessible */
+		ret = regmap_read(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
+				  &val);
+		if (ret) {
+			dev_err(dev, "failed to read conn_status_0: %d\n", ret);
+			if (ret == -ENXIO)
+				ret = -EIO;
+			goto err_clk_disable;
+		}
 	}
 
 	sw_desc.drvdata = retimer;
-- 
2.45.3


