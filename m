Return-Path: <linux-arm-msm+bounces-78326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B8ABFC183
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 79A63561B17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 13:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274D8346E76;
	Wed, 22 Oct 2025 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z+fZpotz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B3E3446B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138663; cv=none; b=F1evoLwl+UvbZbRXk4N4eUGEZwJ8S34Wtk7l6ODl709b+enw5vmJZ5VIjQPXdVmcCExvp6D7KaIGKNDjv3YdigVGuFwfEu6BxuBggSY3XnlKtEDlHEbPCxHEX1StPKXPESciiarWIyr4HmLW0i1ZDktTVwnieyyxhRhS7+reDOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138663; c=relaxed/simple;
	bh=BLrlpEi+Tf0y57g8++fj5PBGfPPtXYf9LwcXnw/5/Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=boYiXZURz6UP+YBhpgXJcVgxvqm5dOk8VsOCdLOBaAMM1euED5OsYUpIRzOXEY3Pf6zu/39LZ8pyeYScMf9mqxIlUl4zdUehst+QtKSH76UMHNL2Nt0v+Ah8IdK2B04fsL+73+kx3A3IYffuPwDpHlP2J7tuRZatccqZEBNdlqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z+fZpotz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so64945615e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138659; x=1761743459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUL6O2x/NPPlAHvfQ/3YG+cqGSjBZP8VuHP9QkP07I8=;
        b=z+fZpotzMA1bNc01WwXOuSIuv9Ohb/dnjX9TBI/ENZnyR5wwVRzbGLdoYu+gyfgdEQ
         NHda8i3XNmV32HjywBBuThjkQrv+kzKIfwU6y9fxqBZdejP3GGsyGUlkavt9ZLimZZ9L
         9ZhYNcgpEiOWwZOQIOKS+wFLEI407gP9pdgDTs+ifAOycL3Ut1//CYqJi5DxEc1apzzk
         btUxfffc1CRskL2pb/Z56Iu/+DCtWB5wvwPtAMVbcFpj41rv0dJlOLa8dsG9f5uFQAe0
         ijAdjSdlnqzhDx5BbwJukV7uzW52mQVpB4WvPMFFOwQsaUfNJbgsOqsSs3OBbN2xfPjG
         /fHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138659; x=1761743459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUL6O2x/NPPlAHvfQ/3YG+cqGSjBZP8VuHP9QkP07I8=;
        b=pdG7Gh8KPojWDWi47try4kdx1xPhyINEicqKJP/ycBB47A27gIUKyrgilVndSx64Gi
         44vyZJLrTjyN4Y5An2SnlTkZvF+j1aOP3UCtcdF950IFLNEUxX0V8XTJGCe0ToQDNv76
         ltv6mReIAJJVE89ppxIznyuNM41Yl8yRYGvg353Tk7fzCA2o6BGVSk64p7m1aW6UMkDv
         Xv0cEhDtyZdZ6AYMZXuptsMup5CaFubS1YbjrqRNDfkmud1BL8G253Sp44ukru+/qrCH
         X9BjN8IqN4ytmY6VKu91ZdZdQ1APKvnYXfzEEM+RX7zb7rvfI9Itu5V98qJSNrRPp7n9
         Zppw==
X-Forwarded-Encrypted: i=1; AJvYcCWnZpr2TGGSQAx8PgzaLK9JUf5UM/dHgsVVLtJZx9qea9sAmz/IVMJFxse98338E85vDFz+VL5j2jiGAJr0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+jPqf6LB2TQ4te00NwA1nIq8dulEU+OUuvUmBzs8Kiyug0K9
	jyneGS2nDmyZFbAxfj3v4FmJVRIOnK7N7E0ffGG+cBy78d349qK9w9TeZZ/sBMp8d1Q=
X-Gm-Gg: ASbGncsOaDMiM2fATY51dfckbl52ia6Dl1vzK735liFS8QWoG8DO74u1rt9vO5EKTnY
	SibotARV3V/pBtammMOiAgvCLMzYae8w6IqCGX5wgQp0xDmZnqEQApdWTH6RQmcdr6xCtA6NASZ
	rlyHWbV+iHquZZMC19LOnUBwic/zCDfifkBpFZeA09c4T8FiJa6ijw52sSK8WndBa5ohUcCIklH
	5kwhwTY/2p5UQkNliANriFG4d8uFxy4O4c2ay5ORC33CsLVeDmYa2JRhKyX6WwRCm1ASMlHXeR2
	46gOpz4JP/8TsJ6Jzu5TbBmOg7tcz8jlbz4TAXYScBHaEwZSGVLZU9NzNtxtmDbNqYoxHGhTh31
	5WMpqecDCwniGX/sAwKL5ekIREbrxPJtUKZYw/Ir0f4VRwqHImuXxD+sqFKmXMHyl22jkiZs=
X-Google-Smtp-Source: AGHT+IHy0lW8aRLBPmXRjIDPC8mTab5QUgEvOgdYolOwgCBdc19L3kJXN3yUq0gQwRUG/jyV9vZrlQ==
X-Received: by 2002:a05:600c:1d9b:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-471178784c2mr170409895e9.6.1761138658987;
        Wed, 22 Oct 2025 06:10:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:10:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:40 +0200
Subject: [PATCH v2 01/10] string: provide strends()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2913;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rk7LOdXp57F1p1eS/LT1Bp//+s+MccpAywVrjh9Sj2I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfcwDJbBkx5ucXuoY0STS0Fcr8BiHjfoYGjt
 abNEB3nZjyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3AAKCRARpy6gFHHX
 chePEAClv9rma9/Zj1+Dd1V5rBFn5At75Q+ldrHq3TX5K3fNqcCjqaoImr/yOEEQjFrLDUYeLnj
 NGBGbLb/pTLbHgU/ArVoFpORHOVW8hDXMUFIvZISHEdDrxd40KdxpNu+i0PGUjd476H5Bqu8mfJ
 x7v/yITPxj1qGDRIwPrBsrs1wJki3I9fEN6p71RnqG1nVcj1NTBxCw4WZ8RWakrJfwYF6As21LO
 o5jULMKY+FjNI/cmniaePf+8TtDVoxhVRh00CaOD5piXun7mZT+AhqUKJLM2j2UNM5/MPjn++Me
 4kvIppPGLUUrlTim16CxEYB5yFpGSz577krytdShCv8ewIxfIF6zxo9gs2owtKfB6nFzXY19xfd
 /01Hmy4DkiEyOTULKBFebihOzNF0MQW3sH30dwVCkhulfrRaUBA5m94LPUs8bldT/i+0d7k1sxn
 Kknrw7UqiNO2OTSVubi05FaW/epIRiv8tXhzgALAVFKbBqHlWB4rEZkc23v+jZ9kBerQyXYQ8k6
 lFDvk7iO/DjhBFatKLbzCxpzP40saFcoPL8Y3QSRg6CRQ+tqWhYHSNmBuX1zFQfHONHq/kEY0zM
 5e2oMXpXVh/P5XVP5ukSCP48w3PLStmha+wgX0TtjxAjF4uIxm/5T4mRRJNrrulH0JTbIawq+1J
 pXHRdgnjg0JegnA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement a function for checking if a string ends with a different
string and add its kunit test cases.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/string.h   |  2 ++
 lib/string.c             | 19 +++++++++++++++++++
 lib/tests/string_kunit.c | 13 +++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..16149404fc3aed535c094b9550f7bd7c9b44a0c9 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const char *prefix)
 	return strncmp(str, prefix, strlen(prefix)) == 0;
 }
 
+bool strends(const char *str, const char *suffix);
+
 #endif /* _LINUX_STRING_H_ */
diff --git a/lib/string.c b/lib/string.c
index b632c71df1a5061256f556c40a30587cf45dce18..ac18313d9c52b38132f0bfdd952cdec6b1354d76 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -880,3 +880,22 @@ void *memchr_inv(const void *start, int c, size_t bytes)
 	return check_bytes8(start, value, bytes % 8);
 }
 EXPORT_SYMBOL(memchr_inv);
+
+/**
+ * strends - Check if a string ends with another string.
+ * @str - NULL-terminated string to check against @suffix
+ * @suffix - NULL-terminated string defining the suffix to look for in @str
+ *
+ * Returns:
+ * True if @str ends with @suffix. False in all other cases.
+ */
+bool strends(const char *str, const char *suffix)
+{
+	unsigned int str_len = strlen(str), suffix_len = strlen(suffix);
+
+	if (str_len < suffix_len)
+		return false;
+
+	return !(strcmp(str + str_len - suffix_len, suffix));
+}
+EXPORT_SYMBOL(strends);
diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0ed7448a26d3aa0fe9e2a6a894d4c49c2c0b86e0..f9a8e557ba7734c9848d58ff986407d8000f52ee 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -602,6 +602,18 @@ static void string_test_memtostr(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, dest[7], '\0');
 }
 
+static void string_test_strends(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
+	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
+	KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
+	KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
+	KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
+	KUNIT_EXPECT_FALSE(test, strends("", "foo"));
+	KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
+	KUNIT_EXPECT_TRUE(test, strends("", ""));
+}
+
 static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
 	KUNIT_CASE(string_test_memset32),
@@ -623,6 +635,7 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_strlcat),
 	KUNIT_CASE(string_test_strtomem),
 	KUNIT_CASE(string_test_memtostr),
+	KUNIT_CASE(string_test_strends),
 	{}
 };
 

-- 
2.48.1


