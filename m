Return-Path: <linux-arm-msm+bounces-90471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL1nME5Qdmk4PQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 18:18:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 480128191F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 18:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 319813004212
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 17:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A776C22A4D8;
	Sun, 25 Jan 2026 17:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwqGjKKT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8CF1EB19B
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361480; cv=none; b=EKQsqXkEnRGy5941SvjGHE9ZT9yPQo5N4Wng2k+Ujr5EFSD/3sGVr0/IWPwBOAcL0loNkpsQ3Km8pewG2/Ij3e4fV2kLrgswSbKodMNNJ10qu5KKdJt0zgbjLFQzduS7BBSb1CWPHV+K+4l8PmU0J/RFrrw9cJQVmr6x6Bf46To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361480; c=relaxed/simple;
	bh=IIaOkiMl0+0OniP81s+srZPjVFERVFHSDf8B5qCgaXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBsFImiOBO2Ya25dmWuinit7YqLunelbFwB5bx4U4Ed/TFBFmpMgJkR//UaDMs1kF7IpCdbJx8fOSxmtX0zx7WX6GtY/ex5ANhmB0e+Aqx5Un/sH7Vq64y4q3xAJc3VW0vX72NxSpg4gmlX2A+qOx9cwBMONmwlw/3uXfsViW40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwqGjKKT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f4e36512aso3798743b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 09:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769361479; x=1769966279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtPcAa/eA0+6dIk9uSAqy9NJNwcCQhRCZhxbQHlEB6E=;
        b=HwqGjKKT+2BeO1/dhHGeehoHcFG0rObTgrPaKcmYCASTc04+veXdsoFGNa6gL7UVk6
         nORJ71Bo9/f6H4AAwVVvdliudfCiW22NFPGVTaJKFioECxl7V3pRucz4uVtnenmL7hjq
         dfSSKdyoHNWI8SCTn4ZKT/MKqPOp/hAQTPIScCOF+/85rLsGPrv6EcAtUP2k+DB+ULJV
         aYBqVHl4tqetuTkU07x99N7HzXzR8xGUJMuvAqBaKoEMVKyJ+HoVL3STUeispGpwuO+z
         Bybe8tYrr2IFdMGnFlvYqS8ycdKCEOHNg2GNu+nGnPg7qwtoFarDdu4NJkKIu7E5K6dP
         Q2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769361479; x=1769966279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vtPcAa/eA0+6dIk9uSAqy9NJNwcCQhRCZhxbQHlEB6E=;
        b=I1rbVL++TiaUQGhDAtS6F211eltdMLe50R7FYmR+2jBUQZWtAmc6QMcJ5uMZhItIgZ
         MbccwzcIoA+2RUkLoFCdBEylrtvSDWDqAb3Mzlz8Dw84e4cnkoB325uUmR4WILxiuBfv
         x1AaVuTu31Lo6S08vGCLnwB99+AABviTvGoaA539qOhEjwhbXhSCqagkWBlB4EDh6EyY
         Ch45gruEkKLKUMfDLVhVMV0Zyaqj4tztXaMEy/o3sLPw1q4WpfaMcmg7EbkbnHkJANcm
         2s4SldM9r6LW0PbwZpvPJOUnJT+wDo/uCA6kREVFDoxqI+TIH9XKFeDQFwryLTd+I3Tc
         U9+A==
X-Gm-Message-State: AOJu0YxnN/LpTTrlfnQBxSV6KQmoCLcE/CeaPoRmTNP1GFJmI9q4M7NA
	72oEX/mAcP5SscFvRWv9i5jsGAAYtUBut4TrKCC0kMy8if5OM5+9XM1P
X-Gm-Gg: AZuq6aIpMqCv4XW2Dh/WpVDsDIqFg0Il6oV4DuyMaxtCd8vtNH7prXCUwML9E6c7BtA
	TVr8oYE3Edw8w18iEuz3Ec62gA9iDMjmSfW41gp8bGD3TRSzNrslKKF3SZHdSpS/CI/solJQQb9
	v+AUCUBKsXRkWi6Qp++BN+QTAjKyuRShz+9YcvJ7GmVGEj4qDSSmXGlcd98O14wArKEc2lvmPa+
	SsT2ev6oBdJeQhH7XhCu0jUsL7enWMSPEVDDj5O1YBkDh6enKpPFG/ipPl4OOJIv2wvXn4Pi6G8
	pMBOGedv+9sl3yNBWDkC1ifhUE9wKDR3iZWnga86Cqq2WTtFZnzamcwtj6wjacMhkdBwFYtAic5
	bMpY6t80ZEyOFtjFGmI8IJe9uVcSUE1F0wXyONSnOND13AvS15fE2uqIt4DOSwysubri7A57az7
	R7XjIrEFljilAiJwG5EEyq/q/c7TROoDSN0MO8
X-Received: by 2002:a05:6a20:1592:b0:350:ee00:3cc1 with SMTP id adf61e73a8af0-38e9f16a07amr1775048637.30.1769361478645;
        Sun, 25 Jan 2026 09:17:58 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:35ca:7619:a2ef:5e6c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f2e12sm6924293a12.22.2026.01.25.09.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:17:58 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] media: qcom: camss: Fix pipeline lock leak in stop_streaming
Date: Sun, 25 Jan 2026 22:47:44 +0530
Message-ID: <20260125171745.484806-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125171745.484806-1-bjsaikiran@gmail.com>
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-90471-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 480128191F
X-Rspamd-Action: no action

When a browser or application closes the camera, if any subdevice fails
to stop streaming, video_stop_streaming() returns early without calling
video_device_pipeline_stop(). This leaves the pipeline permanently locked,
preventing any future camera access until reboot.

Fix this by logging errors but continuing to stop all remaining subdevices
and always releasing the pipeline lock, even when errors occur during the
stop sequence.

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
Cc: stable@vger.kernel.org
Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite, ov02c10 camera)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 831486e14754..242c44f97801 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -312,9 +312,15 @@ static void video_stop_streaming(struct vb2_queue *q)
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
 
+		/*
+		 * Don't return early on error - we must continue to stop
+		 * remaining subdevices and release the pipeline lock to
+		 * prevent the camera from being permanently locked.
+		 */
 		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
+			dev_err(video->camss->dev,
+				"Failed to stop subdev '%s': %d\n",
+				subdev->name, ret);
 		}
 	}
 
-- 
2.51.0


