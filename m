Return-Path: <linux-arm-msm+bounces-31153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EEE96FA80
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 20:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F5781C243E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 18:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E981DA102;
	Fri,  6 Sep 2024 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tkhIcCUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EC11D7985
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 18:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725646054; cv=none; b=AkZUczbBJK6Blv0kjdp0dwYVR7YT0BF9Owx9XJf7F+jSXvkETQZO5F0O/Do3nYXMQTFpCh3hizWY//PmAd1lpemZ5Fd/Q/32Tl5vrnePxY/vOGn9P863UO/SNZA4aB1Lh0M7Ff4xR6cWgQXhKfNZ5BgypgFWjlk15Rn8w72kE30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725646054; c=relaxed/simple;
	bh=ilnQcQK5Wy1pBXzDgHykq4yCmc3ANcBFrm8jF1kC9ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlpU9/2UCG0PXt3pkaWz3S+mbCdxCjGWEB1jEA6SDCUWMxAeevcEbIkReg6XwDk0o7DayuzxZJipPaqvvpRE4T4MnOrgy3F+Q0dZdy+9AgORJJ48DGfPBz22mw6KMBx8TRVDbyyBajiZ6uHhSu3QZaAlV5WCn6QxsaRmEQe6Jig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tkhIcCUU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso24558275e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725646048; x=1726250848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQvGanjtStSrRxyUv2DuAjHXlFYYXgU+MB1dIZTWF6s=;
        b=tkhIcCUUeRuUCeLoARgRmi3Df8GMuU1DTG2YALeZAiiuxY23M5taSh4c8RPuFJA4Qo
         7P/l3HlOSqJlTMGbcAJK2A5w3+0ABKCtfFwIrtY7p1bPINcZnvR0i2bYE6AFynDw3htF
         pwUwOhJH+lWYZrmyoFi6qaUh91Gz8At7LWtPh81fqugnuktgyQRMOqMOz2AkA24SlVeQ
         WsIQZ/yg/Mom33Yq1DSLXUhfimEsMS1EwjFG6RSuLMRCovOB0/hEvOju+PTTXgKxUlT7
         EZtnOCJ4HA3y9DaIe198oL8+Qk8OV86x402cp5gXz98H2iQ6/OKjduQbWP9xfSu0aSGp
         +E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725646048; x=1726250848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQvGanjtStSrRxyUv2DuAjHXlFYYXgU+MB1dIZTWF6s=;
        b=aO+QIvmeNO4sWxWCiC12CMJDNj7zZ44tnRY+M5PGXLoOYhOdidcKpR2QxGP0tQusV7
         zO/ojudMJr3ADLSUMgJ7g6tN0KbKiOqGXYnnhuOgvEFojmj+CzfbbTCld54ndM1V3nS/
         FZDHsdQsFWLSLIunyUa4dlpSy4ENPeWebMBIxn83LE7ddecFYgujOWtQ6FmcdL1B/mvx
         y4QaiyRRXLJfpkVyzIt5E8bf8jfIgd8UQsSGx8t/J6ZoIW7m9lpKYWBN+doyUcQIdNfB
         LBossP1wIM64oCPqZzyq84D8tTflD+hxQxlnwC5+AGL87tTqAeR7XVa9ufW2pNJFFFmv
         tuVg==
X-Forwarded-Encrypted: i=1; AJvYcCV4Ou2y0xE+1DGdVb37oHyiKBaFQkOmnDe+G9ZQUBiZUhdPww+qPs2PCbKT7yMcEsv8yZrZqBRgU8NNT+Hz@vger.kernel.org
X-Gm-Message-State: AOJu0YwOftorb9m8/fL/ocYBBnyI90G4sP8Hk8+BzIPsReicrD49FQe2
	Qx0q3qX7ibXNXah/IzqYI75Ci8tiyUEJIIWNmam6n6TAxtZb+HvcR/iqO9nVmZs=
X-Google-Smtp-Source: AGHT+IH1QkmmVpZO/Pg/SpdHahghFnMBF6YG+qG36mDKqoik5hsrq9KQuGm23VIxfOMfJ2FEjMd/oA==
X-Received: by 2002:a05:600c:190a:b0:426:6857:3156 with SMTP id 5b1f17b1804b1-42c9f9e0a59mr26109775e9.27.1725646048056;
        Fri, 06 Sep 2024 11:07:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b9fc:a1e7:588c:1e37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cac8543dbsm5880485e9.42.2024.09.06.11.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:07:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 06 Sep 2024 20:07:05 +0200
Subject: [PATCH v6 02/17] blk-crypto: show supported key types in sysfs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-wrapped-keys-v6-2-d59e61bc0cb4@linaro.org>
References: <20240906-wrapped-keys-v6-0-d59e61bc0cb4@linaro.org>
In-Reply-To: <20240906-wrapped-keys-v6-0-d59e61bc0cb4@linaro.org>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Asutosh Das <quic_asutoshd@quicinc.com>, 
 Ritesh Harjani <ritesh.list@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dm-devel@lists.linux.dev, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Eric Biggers <ebiggers@google.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4301;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=eXYBlq2yaUMqXfUV/YG7MSDNKrLWqz5dkzbaRWcU/Cc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm20TVnwtwifTOUUqDpse3yaEf0083Tld0LXqcP
 yPeS+XQL3KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZttE1QAKCRARpy6gFHHX
 ciC0EADE28MXIlmhSbAQubkeu0rl1fkMrZm7wS0+FZWiZlexMbPUcTpuopGXB6JcFueBC0BSY5E
 bcQb2m9KP4aeKRtyxPrHhJRoONO6bA+w0gz2fHRQei2MBSzLnaEnGuPAY4QyY+9wX5vn8REIJta
 J50e/zhcMQxnc9jKWh4dOGcKdhqL+KMZ0mooxMruJIS2NrzyWrx8QhMvUDawEpyySN3edMxMDZu
 2xHAVJ2KxvB3QDqorZ405SucwvvVzGPvgLJTUVPfown9jsZ+3zp7uBI2D6o8Uc3I77fuwgHnQX/
 UdrFej2XITQGR/uKV0i4fSkFhXYYT1H3EpWKw8vO09urTgzHFkk7DrmZ0/iGZkWBLWsPyW5jfPf
 qru+ODbVlG245gXMGR/L0t2zV5n+QTAhcHm+hTmBD4LxGf4n+517VQoc+fLoeUIlZJWRy7zLqiJ
 JEKKNrC0oga0/5oUOkEfJkxuwOLqEysDUitUoWfFK7CwOlXRn1wbHPT34CuOK9uVY5Fp39SIVI8
 QVTuzfnoIqg7/4B4Cynifw8pj+FlmGwKFCf9IzQZK0pHtLoyFTFcUo3wzUh2c6iNvxo4pqkrNgr
 qfySMYNOXQNCTUujdWD0xdx8WJ4+QUJuxF27jII1dZzRHG2eRcsleqsuHS9UTrMiZo2GVELoBes
 JXm+M4MnGyvYzyQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Eric Biggers <ebiggers@google.com>

Add sysfs files that indicate which type(s) of keys are supported by the
inline encryption hardware associated with a particular request queue:

	/sys/block/$disk/queue/crypto/hw_wrapped_keys
	/sys/block/$disk/queue/crypto/standard_keys

Userspace can use the presence or absence of these files to decide what
encyption settings to use.

Don't use a single key_type file, as devices might support both key
types at the same time.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/ABI/stable/sysfs-block | 18 ++++++++++++++++++
 block/blk-crypto-sysfs.c             | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-block b/Documentation/ABI/stable/sysfs-block
index cea8856f798d..609adb8dec0b 100644
--- a/Documentation/ABI/stable/sysfs-block
+++ b/Documentation/ABI/stable/sysfs-block
@@ -229,6 +229,16 @@ Description:
 		encryption, refer to Documentation/block/inline-encryption.rst.
 
 
+What:		/sys/block/<disk>/queue/crypto/hw_wrapped_keys
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RO] The presence of this file indicates that the device
+		supports hardware-wrapped inline encryption keys, i.e. key blobs
+		that can only be unwrapped and used by dedicated hardware.  For
+		more information about hardware-wrapped inline encryption keys,
+		see Documentation/block/inline-encryption.rst.
+
+
 What:		/sys/block/<disk>/queue/crypto/max_dun_bits
 Date:		February 2022
 Contact:	linux-block@vger.kernel.org
@@ -267,6 +277,14 @@ Description:
 		use with inline encryption.
 
 
+What:		/sys/block/<disk>/queue/crypto/standard_keys
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RO] The presence of this file indicates that the device
+		supports standard inline encryption keys, i.e. keys that are
+		managed in raw, plaintext form in software.
+
+
 What:		/sys/block/<disk>/queue/dax
 Date:		June 2016
 Contact:	linux-block@vger.kernel.org
diff --git a/block/blk-crypto-sysfs.c b/block/blk-crypto-sysfs.c
index a304434489ba..acab50493f2c 100644
--- a/block/blk-crypto-sysfs.c
+++ b/block/blk-crypto-sysfs.c
@@ -31,6 +31,13 @@ static struct blk_crypto_attr *attr_to_crypto_attr(struct attribute *attr)
 	return container_of(attr, struct blk_crypto_attr, attr);
 }
 
+static ssize_t hw_wrapped_keys_show(struct blk_crypto_profile *profile,
+				    struct blk_crypto_attr *attr, char *page)
+{
+	/* Always show supported, since the file doesn't exist otherwise. */
+	return sysfs_emit(page, "supported\n");
+}
+
 static ssize_t max_dun_bits_show(struct blk_crypto_profile *profile,
 				 struct blk_crypto_attr *attr, char *page)
 {
@@ -43,20 +50,48 @@ static ssize_t num_keyslots_show(struct blk_crypto_profile *profile,
 	return sysfs_emit(page, "%u\n", profile->num_slots);
 }
 
+static ssize_t standard_keys_show(struct blk_crypto_profile *profile,
+				  struct blk_crypto_attr *attr, char *page)
+{
+	/* Always show supported, since the file doesn't exist otherwise. */
+	return sysfs_emit(page, "supported\n");
+}
+
 #define BLK_CRYPTO_RO_ATTR(_name) \
 	static struct blk_crypto_attr _name##_attr = __ATTR_RO(_name)
 
+BLK_CRYPTO_RO_ATTR(hw_wrapped_keys);
 BLK_CRYPTO_RO_ATTR(max_dun_bits);
 BLK_CRYPTO_RO_ATTR(num_keyslots);
+BLK_CRYPTO_RO_ATTR(standard_keys);
+
+static umode_t blk_crypto_is_visible(struct kobject *kobj,
+				     struct attribute *attr, int n)
+{
+	struct blk_crypto_profile *profile = kobj_to_crypto_profile(kobj);
+	struct blk_crypto_attr *a = attr_to_crypto_attr(attr);
+
+	if (a == &hw_wrapped_keys_attr &&
+	    !(profile->key_types_supported & BLK_CRYPTO_KEY_TYPE_HW_WRAPPED))
+		return 0;
+	if (a == &standard_keys_attr &&
+	    !(profile->key_types_supported & BLK_CRYPTO_KEY_TYPE_STANDARD))
+		return 0;
+
+	return 0444;
+}
 
 static struct attribute *blk_crypto_attrs[] = {
+	&hw_wrapped_keys_attr.attr,
 	&max_dun_bits_attr.attr,
 	&num_keyslots_attr.attr,
+	&standard_keys_attr.attr,
 	NULL,
 };
 
 static const struct attribute_group blk_crypto_attr_group = {
 	.attrs = blk_crypto_attrs,
+	.is_visible = blk_crypto_is_visible,
 };
 
 /*

-- 
2.43.0


