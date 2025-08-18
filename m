Return-Path: <linux-arm-msm+bounces-69518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 486CDB29E6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF24E189C9B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 09:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAE630FF10;
	Mon, 18 Aug 2025 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IHDrVGCp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59C530F817
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510689; cv=none; b=A3Gq5TtLPRAL6oHVRKYHkHc4ut8lEU7rIvdIzq6cCtnIDytEJlBJjUle6FWhX2jvMBakNZxbR7X8gHQ6b9JAUIJR6g+TuKX9C4owNgtFPSvPkyiIgntE8KUvtu1oSW04THBu+KLUN7OHCZjGw3dkF6GXPw/QcdfAgcmUiEPSDNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510689; c=relaxed/simple;
	bh=QBBhmYV+UQ2hXTTLPXbJol0ycEg/rF+5oel04wpKfk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aUBy8hkeaiuNusXydPkRr6ZoH7/2hHBpUnubceCDD/2dkLAR0L270axxIGHK/bBwMqkdZp9wqa9W6gUF9D0N2vzWdZg2HFkvKfSXeyWmnGz7Y/unPKMu3nOqqE3ffQMN0ZkXANGpRpHpYucYH7fx1XLUz2H9cJOSn0k9Ohkwfm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IHDrVGCp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso29409255e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755510685; x=1756115485; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irOcbMOZce8tdkmOmvyjdJd5jG31cnXbJF+FtwR0pdw=;
        b=IHDrVGCp/FquoRUHRTf0XOvSxr4KJQROWnVCmET1qDWwS1PJJKmDnSB2leaCXJov1W
         dLb5He/TfbWLypOf1zVHX4xFMDVAZ3cHxZhPkrbPAjvJN465isZY6Dr6sbJojmvmsopo
         JYKCTSvAWzSsD6vs4/d1oaLkX2NnKHODGD1NT3Lr3HDNMO64EIir2lqdeEUF8PNvegsN
         sqFns7x3fpzCBKK8CbnjfHdxL0XaCUgqp9K8haj9r1Y1mzwZPha3OjVazD8s5DnIq0UC
         fCkEmhG+r4H0PxqY5TVila62dKnbfQuXC3LY2mFVQzBZI0kSLLIenWzpafsYZDtMwAEJ
         Q1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755510685; x=1756115485;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irOcbMOZce8tdkmOmvyjdJd5jG31cnXbJF+FtwR0pdw=;
        b=JCmGgyp51EmS7yQgd1ULjy66LlTUAZ2qeOsn63rhihwV3JkvLjlfaPfdRJJO60SARx
         sPCnvBTOKmY/wOumzTiUMEbwAaDOKkEquvh5X/MCY5Fy3WVTHRpoTpOOOGF/KqqY7kil
         zz6d08Es3pFpmDjKoRQpGrfgG7gKiASBsKy3LhDvu0On9TZ+eUujQ+FPdKr0mLrxgmSg
         AgJconZOhI+TjikWzpO8YapcmKk5divs21TFQnwj1RAJCKNMyFPG4QC/HedNy37SsNkz
         WaKnmfvdRYzmfRaokugJKmbnaQoPl/6KNNwvQ85EdNWIRiBkOpDvyuXo6fy0XEn4djoz
         0aNw==
X-Forwarded-Encrypted: i=1; AJvYcCWZF77hBlTcCVkN96YtBNkuFvNTKnBtFpuy1arYGhDCyC6LpkfPwrol8Ju78Fl9Ph7BHp2hzRWFDOLluBkm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9Pt17ZgLJd1bqNrtMlU3AqTt0zeTodcBBnrWwa6WnjM9PvHn
	jtfbdqs4OZsDd4O4AGmE0lQ3HCKtntGNtxqZ1twTEt9+K3IdDDrz00gd4u4ct3TIbUM=
X-Gm-Gg: ASbGncu0nEvCe9uVxrYytKzGNA8xaKCeZqG6YKQBbgdcZk/+QsgjgmAeGALOgN7ghuV
	0RGFsjCQR9E1TihjjBHmeWCqeKyl7+6xXp/77ufkOte0G49EbLzfhcLs9yNk7FpAJTGAJ5Qadgf
	c317t/+ZWTyXMo74uS0U/NuEhOBT6cA/vXEsbkLdZ4A8ZJxp7UwI/ZHAmAs+q3fljN7O95YIMEZ
	kViCXSvOHyrU1UrpWSjtdpf87OZGTo1Jw3xZWUindCdCv3tb7H0hHivuRWQzke3HHRBzlQTrqnq
	9uK7s8LxWvb4tFZaoBp+8fjZmwrJEmwFxqMyXPLc3SduvlbzB7cfIUCqwoqE+ZFg4DXA50bmq9g
	ijcCpsElZOPwUqNmiIHbaQeZjWP2yifoHrKIJlw==
X-Google-Smtp-Source: AGHT+IHU8L5zc37ViCmI7CAJbkfEFWeKIJ6N/OF/IPmJs52MJ5SlIlIojdXPEOIrX5ObGymSXBjkOQ==
X-Received: by 2002:a05:6000:188c:b0:3b8:ffd1:80d2 with SMTP id ffacd0b85a97d-3bc684d7c2fmr6672591f8f.24.1755510685037;
        Mon, 18 Aug 2025 02:51:25 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7049:5418:d1a7:cc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bc4afe7a63sm10157016f8f.15.2025.08.18.02.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 02:51:24 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 18 Aug 2025 11:50:41 +0200
Subject: [PATCH] media: iris: Fix firmware reference leak and unmap memory
 after load
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHD3omgC/x3M3QpAQBCG4VvRHJuyWMmtyMHiw+S32ULJvdscP
 gfv+5CHCjxV0UOKU7zsW4CJI+omt41g6YMpTVKblMayqHgeRNfLKXiBm7ktujxrewOUlkJ4KAa
 5/2ndvO8HphHEP2QAAAA=
X-Change-ID: 20250815-iris-firmware-leak-b6c43bd1ee85
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

When we succeed loading the firmware, we don't want to hold on to the
firmware pointer anymore, since it won't be freed anywhere else. The same
applies for the mapped memory. Unmapping the memory is particularly
important since the memory will be protected after the Iris firmware is
started, so we need to make sure there will be no accidental access to this
region (even if just a speculative one from the CPU).

Almost the same firmware loading code also exists in venus/firmware.c,
there it is implemented correctly.

Fix this by dropping the early "return ret" and move the call of
qcom_scm_pas_auth_and_reset() out of iris_load_fw_to_memory(). We should
unmap the memory before bringing the firmware out of reset.

Cc: stable@vger.kernel.org
Fixes: d19b163356b8 ("media: iris: implement video firmware load/unload")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_firmware.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index f1b5cd56db3225d0a97e07d3a63c24814deeba78..9ab499fad946446a87036720f49c9c8d311f3060 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -60,16 +60,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
 			    pas_id, mem_virt, mem_phys, res_size, NULL);
-	if (ret)
-		goto err_mem_unmap;
-
-	ret = qcom_scm_pas_auth_and_reset(pas_id);
-	if (ret)
-		goto err_mem_unmap;
-
-	return ret;
 
-err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -94,6 +85,12 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
+	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	if (ret)  {
+		dev_err(core->dev, "auth and reset failed: %d\n", ret);
+		return ret;
+	}
+
 	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
 					     cp_config->cp_size,
 					     cp_config->cp_nonpixel_start,

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250815-iris-firmware-leak-b6c43bd1ee85

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


