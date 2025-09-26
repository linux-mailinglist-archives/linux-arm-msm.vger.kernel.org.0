Return-Path: <linux-arm-msm+bounces-75329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD77BA43C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 16:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C491563185
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 14:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6622083CC7;
	Fri, 26 Sep 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/SXF7k2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A039374EA;
	Fri, 26 Sep 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897342; cv=none; b=KftI1VYzWDtuIQW7EfYRipW3anC9nRbq9OIBGEaTAziAxpxHoxTaJHLwVTzb3SohHDz34g4OsnyvkduvUkwKtsidf6Kt7+LBWfGoyWwq6XtI+fzjTuiy4ZTJRQ5YcGoHlMPnvWnF13zGDRXAo1te+YVScXA6LIcFN8/2sdfNjkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897342; c=relaxed/simple;
	bh=wRSjziLftfccRMW9HSZHUGY0OLK+wEINYpUpCt8hkSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fji4vnO31DH8Pdz11/zhvyj/HtlP8nG34YwJUpAX6DOnuTBiH+1Uo5fPN+57xH9BrFFypKeCHbibzPzQSAMjmGMHJ0+hKobkDVMSpbVFoCvqcLzXy5o8x0goWW5vqgGczwsoMooFWwdY2PVWcvcgE5Docd1PuTUBOVW/7nDK+t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/SXF7k2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63E1C113D0;
	Fri, 26 Sep 2025 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897341;
	bh=wRSjziLftfccRMW9HSZHUGY0OLK+wEINYpUpCt8hkSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L/SXF7k2LI/+LeJN7n7eosKpSo9ya8FC1Kb5BMc04arqYiGMbibq31M+i9ejjBrl5
	 ZkgLSUAq6E8q1SxwSo6rxG0XJVSbAIoie5ZbnKIQSjLWvC5xleFXmtPCYCasOw5pBS
	 2guUaPgBEiUCtXdB9tfuJuvCmFj+k4XkjcuAa4WZ9JWn4AnaEHWvjZFjwdt9JS1AQh
	 cRKqTXN2MyJjMP8yDCO/X2sVjI8BH7GLX0jcvPqKBSaRQc/S/sxpRdRuJMT3wofLtH
	 RRV44OjoIi/NfyyfrkHGFwvtDzYBTqJv5bso8wJViWEw2fdEVgc1uAAu1RmNMqQeYF
	 gH77hTxKHzRFg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v29Xr-000000001kx-2hE8;
	Fri, 26 Sep 2025 16:35:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Anjelique Melendez <quic_amelende@quicinc.com>
Subject: [PATCH 2/2] soc: qcom: pbs: fix device leak on lookup
Date: Fri, 26 Sep 2025 16:35:11 +0200
Message-ID: <20250926143511.6715-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250926143511.6715-1-johan@kernel.org>
References: <20250926143511.6715-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to drop the reference taken to the pbs platform device when
looking up its driver data.

Note that holding a reference to a device does not prevent its driver
data from going away so there is no point in keeping the reference.

Fixes: 5b2dd77be1d8 ("soc: qcom: add QCOM PBS driver")
Cc: stable@vger.kernel.org	# 6.9
Cc: Anjelique Melendez <quic_amelende@quicinc.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/soc/qcom/qcom-pbs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/qcom-pbs.c b/drivers/soc/qcom/qcom-pbs.c
index 1cc5d045f9dd..06b4a596e275 100644
--- a/drivers/soc/qcom/qcom-pbs.c
+++ b/drivers/soc/qcom/qcom-pbs.c
@@ -173,6 +173,8 @@ struct pbs_dev *get_pbs_client_device(struct device *dev)
 		return ERR_PTR(-EINVAL);
 	}
 
+	platform_device_put(pdev);
+
 	return pbs;
 }
 EXPORT_SYMBOL_GPL(get_pbs_client_device);
-- 
2.49.1


