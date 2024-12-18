Return-Path: <linux-arm-msm+bounces-42700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 389CE9F6EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 21:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 931CF162273
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 20:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C7D1FBEAC;
	Wed, 18 Dec 2024 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0Yw0bHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8D71F7096;
	Wed, 18 Dec 2024 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734552791; cv=none; b=Hqzokc9bw6tnYA3KCcKz2WrPVlv4C1cTxVtshOEp5IML1NnTq8VImD1JAnrrSYeKIZY/2GA7Tu8NaVptoJa/08q5ASlmZ+yaNtozef+HfachyeiRBsqNp+uBkMrRIYpoSFD23gpUTZ1BFk752s1jBGOEi4PeL8bW/khIyXfEvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734552791; c=relaxed/simple;
	bh=Zu1wkLlLpFxiSSSSnwPt2KRCeanwRhzomPiVjRGTZdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vA8Rx2NAauFDGjSmMLis/i+qJClgu6zASjxUjar4opKJrWAV+Xxv8SjT1qZuK8Y4bP602TRs/yG4jdHTQNg3XHyHkrgR0kt2HISAJVDqw5O0hbtR9T4MJJ3HBnRjTXcObZeVxsldENU0AdW6VyQv+75JvFx1pNMBD30qTkPIm3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0Yw0bHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E6BC4CECD;
	Wed, 18 Dec 2024 20:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734552791;
	bh=Zu1wkLlLpFxiSSSSnwPt2KRCeanwRhzomPiVjRGTZdo=;
	h=From:Date:Subject:To:Cc:From;
	b=l0Yw0bHlNyBpXe+Bbr+Hc4t2LVQHXYOLBLhfiwDcMOPA3iTXKQc6gb4eHdyM+1tNm
	 7cohx3wtAe9LKNXTOjxUhg7Oc+IV8hImwHt7cJ8j4B+hjEe9gE92UNXA+iA4xZ2Hqi
	 cBJrOFoOyYN9pCTpMhsQJXb5dX4rXzG4H7Jxkctox2h2cg/+yx71yAYHEDwFSgjcbI
	 Nv63qs3A0UrfC1PVvmcqzoNaEd/fGq+urlpCrL2G08211YXllfMegfesSuY9qBDveI
	 2yCmxRNwNEQ03Cfo+WDSXqscec88EnaxgAV5mu8Fx/iH0+OgpZcUY6+snosYC5nDHP
	 0iRloX47FCUEw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 18 Dec 2024 13:11:17 -0700
Subject: [PATCH] crypto: qce - revert "use __free() for a buffer that's
 always freed"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-crypto-qce-sha-fix-clang-cleanup-error-v1-1-7e6c6dcca345@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGQsY2cC/x2N0QrCMBAEf6XcswdJWqL4K+JDSFd7IEm8WFFK/
 93Dl4WBYXajDhV0Og8bKd7SpRYDfxgoL6ncwTIbU3Bh8sGfOOu3vSo/M7gviW/y4fww0RaprI2
 hWpUdJneMMY7jHMhiTWHq/+hy3fcfqCGl+3gAAAA=
X-Change-ID: 20241218-crypto-qce-sha-fix-clang-cleanup-error-0e40766633d2
To: Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2945; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Zu1wkLlLpFxiSSSSnwPt2KRCeanwRhzomPiVjRGTZdo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOnJOldScnuvagWpbr02rd7DkXciq1+G75PimRHVReyhi
 6xYH97rKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABNpOcrIsKDwWaTPjD7bdmGb
 qsWLDG7tsnbcP3d/kM5tE30J0/S2HIZ/CoJO++Lv+nxj71/7wuxTmGrGhv4JJ2ouMrFcfSbHfD+
 bDwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Commit ce8fd0500b74 ("crypto: qce - use __free() for a buffer that's
always freed") introduced a buggy use of __free(), which clang
rightfully points out:

  drivers/crypto/qce/sha.c:365:3: error: cannot jump from this goto statement to its label
    365 |                 goto err_free_ahash;
        |                 ^
  drivers/crypto/qce/sha.c:373:6: note: jump bypasses initialization of variable with __attribute__((cleanup))
    373 |         u8 *buf __free(kfree) = kzalloc(keylen + QCE_MAX_ALIGN_SIZE,
        |             ^

Jumping over a variable declared with the cleanup attribute does not
prevent the cleanup function from running; instead, the cleanup function
is called with an uninitialized value.

Moving the declaration back to the top function with __free() and a NULL
initialization would resolve the bug but that is really not much
different from the original code. Since the function is so simple and
there is no functional reason to use __free() here, just revert the
original change to resolve the issue.

Fixes: ce8fd0500b74 ("crypto: qce - use __free() for a buffer that's always freed")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/CA+G9fYtpAwXa5mUQ5O7vDLK2xN4t-kJoxgUe1ZFRT=AGqmLSRA@mail.gmail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/crypto/qce/sha.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index c4ddc3b265eedecfd048662dc8935aa3e20fc646..71b748183cfa86fb850487374dcc24c4b0b8143f 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2010-2014, The Linux Foundation. All rights reserved.
  */
 
-#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
@@ -337,6 +336,7 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	struct scatterlist sg;
 	unsigned int blocksize;
 	struct crypto_ahash *ahash_tfm;
+	u8 *buf;
 	int ret;
 	const char *alg_name;
 
@@ -370,8 +370,7 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 				   crypto_req_done, &wait);
 	crypto_ahash_clear_flags(ahash_tfm, ~0);
 
-	u8 *buf __free(kfree) = kzalloc(keylen + QCE_MAX_ALIGN_SIZE,
-					GFP_KERNEL);
+	buf = kzalloc(keylen + QCE_MAX_ALIGN_SIZE, GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
 		goto err_free_req;
@@ -383,6 +382,7 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 
 	ret = crypto_wait_req(crypto_ahash_digest(req), &wait);
 
+	kfree(buf);
 err_free_req:
 	ahash_request_free(req);
 err_free_ahash:

---
base-commit: f916e44487f56df4827069ff3a2070c0746dc511
change-id: 20241218-crypto-qce-sha-fix-clang-cleanup-error-0e40766633d2

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


