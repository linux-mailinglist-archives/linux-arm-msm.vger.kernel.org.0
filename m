Return-Path: <linux-arm-msm+bounces-39869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F4D9E01B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 13:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A447167CB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 12:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C9620B205;
	Mon,  2 Dec 2024 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mAJmYwsC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A7F20ADC9
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733140992; cv=none; b=MMhSVI6wiSqrAMytJ/bKB5gP20lqTlU5zcA8u4+E1vCQUrTgJovfXIgsPAlofrVVqf36WayaMqGIBHbDp+gf9FyndzupzfA13cGl0m/V1HFAjJSoNsgGrdPgqcWnRyOpqqHJh4UHcFepteZEgocKpzcd2NdzibO8qV2+FJ6IDZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733140992; c=relaxed/simple;
	bh=tLil8meoc4gv8jDi+YbsmsnrrlmnezAGx9Zmm7GaWVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGRAZdnzt9i/mjNW7Uh/JASE18wMJ6HeTYWiSiJANzL4PpIC9dG5w4a5BYEMDlJ2/D49LV7wM/Cxd0P3pdikxo5g7WXrr8Bn8YKaFRWTJ7paN7K36rDy+dQEUXqI6+XC4vw76lr4jmmcAc9ssQwNFJae/H7nRYS2s1jb35QJLMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mAJmYwsC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a45f05feso52445675e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 04:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733140988; x=1733745788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sappCm7n6rv8bu1mrPLrVjny9xNCVnDXbUHbfHv3TVM=;
        b=mAJmYwsCFISYRNzpOBkL0EHECMrr2BZS2RT+1QTOrxyC1gFopIc9rzIGuAltNLJZ2i
         pzHhiaE33Ips1b5ooXRw0D7tuYJSPCe4kHz5WcW0+at1gkWvblTUu35pSvH1z+DbxM83
         /2KyBq8vVb+8bCROZ9KWAleL3o37oNksqKuQV3vEeKWCFf/xgoumMlMbGLUJuJg6K7Z4
         5q5YNFRcNGRSyyc54e10darWK9CPl0Z3xN0EdYvk8Dry1RSluq94YKFaS4nGv27bUrPb
         XnVKbeOY61bmAwmLIR0FrnFmyeaeZGwpdF8iGzAS/IczCNqZerbCJz7trMlSAp7zpMGt
         zgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733140988; x=1733745788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sappCm7n6rv8bu1mrPLrVjny9xNCVnDXbUHbfHv3TVM=;
        b=mOJN5zU17iEOgQn3pPNqrvh5qLPf2tyFBdqtj0gtmggeil4lGbKm9voubbbBXrUUVv
         gvlquvb3BL9TAekpFrhXM7KD1onPDNvOhsC0CpVHk5RSundBwPUl2XSmTbeehp3ZqpGx
         5AjVo9CcafyhK4UvedTyQKZGKRqQvmT9xXHqoDw5/+O4F3Oa5rrwy3EDOeM+SngIQ3wf
         ojSJntUASnpq1fBsixXCwXwmIDm0S7WCDKOd4fNP5pz5QEcGdy4WW+LQ/FNiJMRrVtCl
         +HmUbrtPlgcSt39I4BrHFwSvgDG52OnVZSiDa6ey8/pF63GPfwMYrPr5WExCs972P34c
         frbg==
X-Forwarded-Encrypted: i=1; AJvYcCWvVZanO5XDwQop3IEv0AgvVltYLoqhpsBFI+AnBkgH1W2ptIIvVj1sQwd/arjxLb+V+ONnQACRfmdzI0R0@vger.kernel.org
X-Gm-Message-State: AOJu0YwOaHMIacs6GKLKxno5vvrvO54N/1VSb2A9T7aNP16CdhmGaYtB
	4MXknXA100+EYfvKAOgacUi2pZq3yv4Q4/UON5uVFlMYeoS7qe2nF+a3k18rJyk=
X-Gm-Gg: ASbGnctqUFRo9ZJSw6IFWBvRwIPYZLLBMhzeKuGnqKLjgw8eWHeU3JGSUdrjSt2dpK8
	+V5yEe8dQDeLhq9s9vMC+CVpUb8SxYMPSi0HEsK4JK732DCCwDCOV5qwCRdzbcGTo+NoqH7mTcB
	TjVHeJPi98QkidTy4v7KPSp/i8GH1CAlK3/Y8aDz0drOwhJpz19NufBceQgXiW+Z83hdyvt8t6X
	M/0GSKbszvqrzOtXE54JeM+E/2blNZKbeFRp9KV
X-Google-Smtp-Source: AGHT+IEnvVRRAOJVEjWRQWTGwHp22oveK1WwEh+juBK0mIY5I5V6RUTWWmdVE0kkT1ZZUSSqgRYdrg==
X-Received: by 2002:a05:600c:5254:b0:434:a30b:5445 with SMTP id 5b1f17b1804b1-434a9dcf2b6mr228982825e9.19.1733140987582;
        Mon, 02 Dec 2024 04:03:07 -0800 (PST)
Received: from [127.0.1.1] ([193.57.185.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bed7sm152396095e9.8.2024.12.02.04.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:03:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 02 Dec 2024 13:02:31 +0100
Subject: [PATCH RESEND v7 15/17] ufs: host: add support for wrapped keys in
 QCom UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-wrapped-keys-v7-15-67c3ca3f3282@linaro.org>
References: <20241202-wrapped-keys-v7-0-67c3ca3f3282@linaro.org>
In-Reply-To: <20241202-wrapped-keys-v7-0-67c3ca3f3282@linaro.org>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Asutosh Das <quic_asutoshd@quicinc.com>, 
 Ritesh Harjani <ritesh.list@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dm-devel@lists.linux.dev, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Om Prakash Singh <quic_omprsing@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gi1rUYia1K9GFiqOdv+A9A7WV4lUw8MkRuPETlXFN6A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnTaHWPhF96W8ta0sCsu5xIcmZfLZdnO+UJtTSV
 wzlGPTq5gmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ02h1gAKCRARpy6gFHHX
 co/FEACxG2K3W52mA5oFbkrWPJHbaBrdjs6ZZ6SOuehliuBdNm+Wz2Oy8crOCOYPqWebYcc26eb
 yPbA8sjRYDkffqLtV/s9YOqk6gpEXdWN9ajsb40qdBMhQrYutHku2TP5/VKW9jaqfNfdcjZ8AaO
 8nwx/ItU7yfm4ZayW+ipCJVMqBrRnq5uYZK2GVWbYZ+ze16foZqM+e2rvspmK4PCdg5v9daW11n
 sDy39z3Wop5EmNv8pHEcZl75vgIdi491tNZez659SdK4PL9HTxtnUYcUQp6P+5/TvBQjxb1KnZm
 uoykfHHiVTy/NMiSOXhcdScRPj8oX5w5nKsvm8Pa1mtyCkOaAgq44uKYg7tLLGLY2nZO3eXftca
 cYRJ03ax17LjdQK3JKgLXm0O6wZG1OyFsTfNYyLMm/sKTXXNTymFevZcLU5npYV8hole5/g6Rmu
 qkriHdAQWNi0ijA3MuvyGJWherx1iRu9nD4MBoyy9HUiUe5yc99cTb6f3r1v5lyZMvm2u5Hcv5o
 E4lng/VeJ3F/jFbopzAX0kcv39GpsNs9bKVW3t6lQG/aBBj8Hz9XnSftigxj8EVXt+Lp64M61TA
 Uvp78T+A5eqi5vt1WMGgtCdKqRiamJ7EdRat88mL8ZGVEHOkgsDKOobNebSsLDJP2Pp81sSm242
 HSMB1FMpcMha/CQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

Use the wrapped keys capability when HWKM is supported. Whether to use
HWKM or not would be decided during an ICE probe, and based on this
information, UFS can decide to use wrapped or raw keys.

Also, propagate the appropriate key size to the ICE driver when wrapped
keys are used.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 44fb4a4c0f2d7..fd774531cbbf3 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -129,6 +129,8 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 
 	host->ice = ice;
 	hba->caps |= UFSHCD_CAP_CRYPTO;
+	if (qcom_ice_hwkm_supported(host->ice))
+		hba->caps |= UFSHCD_CAP_WRAPPED_CRYPTO_KEYS;
 
 	return 0;
 }
@@ -166,7 +168,11 @@ static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
 	    cap.key_size != UFS_CRYPTO_KEY_SIZE_256)
 		return -EOPNOTSUPP;
 
-	ice_key_size = QCOM_ICE_CRYPTO_KEY_SIZE_256;
+	if (bkey->crypto_cfg.key_type == BLK_CRYPTO_KEY_TYPE_HW_WRAPPED)
+		ice_key_size = QCOM_ICE_CRYPTO_KEY_SIZE_WRAPPED;
+	else
+		ice_key_size = QCOM_ICE_CRYPTO_KEY_SIZE_256;
+
 	if (config_enable)
 		return qcom_ice_program_key(host->ice,
 					    QCOM_ICE_CRYPTO_ALG_AES_XTS,

-- 
2.45.2


