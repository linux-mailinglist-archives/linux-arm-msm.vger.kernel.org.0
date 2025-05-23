Return-Path: <linux-arm-msm+bounces-59216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE1AC2265
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 14:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE94D4E754B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA3F23644F;
	Fri, 23 May 2025 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtkL/VPq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D563D229B32;
	Fri, 23 May 2025 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002317; cv=none; b=CZP+3o4ebaGcMNdBpoTt7oMOkYbNBqlbTF5j7Av1uoed3DK+RlD4OUD+46CZmn50b6HYItpYB8LBIQbWWaJ4wF9H+WVVYTDQ4VpLOhk4ahI4HlifeFPjJMqPTk5GP4c6frVkzHK4AU8Q5xwQcplQVuMesn8uxkxXG58mQgtnNS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002317; c=relaxed/simple;
	bh=ftuK/yE8tXnPUIOstt702Du9VYV2lf8hxTtOkITIrZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jWLKmnEDNUCyQYYWhGe3Vr8+Y/ap95QMOx3krcf7nNRpudY6EQJ+wH7ljfHrFAbFoFJZdKo3Ps672mUsbxqd/9ceRrnbNEj/NenQENHa8UkjVvZFoQ06G1DdE2kCRr6dBcmXzCwkClKzqEcnatwSZ9P7bNzRyjBYhFqjrqVGfXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtkL/VPq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BFFC4CEE9;
	Fri, 23 May 2025 12:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748002317;
	bh=ftuK/yE8tXnPUIOstt702Du9VYV2lf8hxTtOkITIrZk=;
	h=From:To:Cc:Subject:Date:From;
	b=rtkL/VPqe8ztxLswPkoiPynaxLOjwBkKHsHz4a6neL0dJ0mdek6gABpimfD1/sErb
	 rwBttvDhzuDE5LSF3HTkvAYht2UThd5zlwl44yGVnHuLZ3nFCcRjMShT6H5/RBsD7o
	 LVjH+tuBbcbzqGjm+4QoB9ZeJcxIPpLu0wji0LnAaqLcVefVoItiZi3bbQk8ERC2Gl
	 881UO9do8CzJ5srT+cfaiW9/HTKSKGaN269Lk3tPi0F8Dr/4jWIm7VQbTdnvGz26fP
	 P5SG4jZn3CyX0/6FUNJJoiErXXmPfZVX67Iq4TxukETNKOVuQl0X3KNM+1Qaqcx7df
	 8t1wQXBzIn/Dg==
From: Arnd Bergmann <arnd@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qdsp6: fix compile-testing without CONFIG_OF
Date: Fri, 23 May 2025 14:11:47 +0200
Message-Id: <20250523121152.2292574-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The driver builds cleanly only when CONFIG_OF is enabled, otherwise the
compiler notices an unused symbol:

sound/soc/qcom/qdsp6/q6usb.c:401:34: error: 'q6usb_dai_device_id' defined but not used [-Werror=unused-const-variable=]

The driver does not support legacy board files, so the of_match_ptr()
annotation has no use here and can be removed to avoid the warning.

Fixes: e0dd9240f13a ("ASoC: qcom: qdsp6: Fetch USB offload mapped card and PCM device")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/qcom/qdsp6/q6usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index adba0446f301..ebe0c2425927 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -407,7 +407,7 @@ MODULE_DEVICE_TABLE(of, q6usb_dai_device_id);
 static struct platform_driver q6usb_dai_platform_driver = {
 	.driver = {
 		.name = "q6usb-dai",
-		.of_match_table = of_match_ptr(q6usb_dai_device_id),
+		.of_match_table = q6usb_dai_device_id,
 	},
 	.probe = q6usb_dai_dev_probe,
 	/*
-- 
2.39.5


