Return-Path: <linux-arm-msm+bounces-40203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FC49E37AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 093AB285F22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC4A1AF0C0;
	Wed,  4 Dec 2024 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QmJLbn4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111A31AE863
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733308602; cv=none; b=lpiXwA2r+DtXYA5AAjswgbr/7EqNd1VcPPGlr1uuPF1gCgXe9vqyB+Afb6u+Gd5EeeahkrX14LJPrlmiXUNhFjaBcS54fed3waI/ZyCep62fAAJ8PYMa6yaHV6obZEkJNQ9C8d4fJBHEkucAvnqxRDw0HxsM8mFlMfxF80Ewx0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733308602; c=relaxed/simple;
	bh=peYrt415YULllPSwRUnKU5Qx+NDdGSX6LQbwju+FB9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=naGEkEr+wX2IcwHP78Q9KqqmvXfLqvj4PKYzxSX4XCfKvZUleunj1qB4KtSAOyXsSedu9cDUCr35ixsBuXu7jH+MKzyRJ1Kzt6s7EV9lQ8bIuE96M8TDa3ipb2IQPlJvuGWVRwp1Aoc/kwuBXj5swJxAvlrH4eltj8PoBxtpOWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QmJLbn4U; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385eed29d7fso487179f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733308599; x=1733913399; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CEBWDAJs2F15pzwyozxNKYhFYdToRnM6LzIW6iWekBk=;
        b=QmJLbn4Uiqj3a84BcIb4G5O87C3WVKkpwE+AAvZFKZ5k6C6gQWUuRip4cnycZBxhya
         HKckBnsiUGP5Lj5RbumcGpqn7rB4R+p+lvVEDHBtJ1RhlSv4nI/nGnI35v4GjIkC+v3B
         8BIce8cTrwJ8z09IvzWbvogSyhR52OvHGXiLZW3oyaTJdiXCcpPb9tW/s2+9fpfInZvz
         qu0yd2xGLmo1jxrxuTOCFxDcUJ2IH3Mz32JaYLXxAKyoY9D13LbaKlY9mcJvzhcpgVtN
         Obsgc7ZLjmvyLDg6C9b6UenBfhiG58S2mLpXlIZSGXuI4ps50FYT2aU2okY2m8/zWg/l
         DIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733308599; x=1733913399;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEBWDAJs2F15pzwyozxNKYhFYdToRnM6LzIW6iWekBk=;
        b=fyBhJ8VlQdbmRemVFn5xi81a+OufmZLHX4yTEnnQ5fsyjSi08Fx798sX583MSXlkwK
         6P7pgO05kLoV4iln17DEI9KczPSqCoITBn1LYpNRXB4zuJma0JdN4zVYzN/kI/9Fh7Vi
         wyzbnoPhmvWAL8M0i/GaN9DmTStckHPElTZ1M2X2DC4nqwFGl6mFS7Ny6936Po8GQ6zF
         qFBmnF7WU7Dzh6b1MULC6ez/tso8v3cWIEnuz12VzNif0FphgSJ2VK6KTI5qbwFJd4si
         +bS6hNWFTAy1Z1yYdsmQ0SW8JlFssJxMLjq01CFKxNsEfyUXuXn6Qr6cz1dUXST1W1fJ
         waZw==
X-Gm-Message-State: AOJu0Yye+hg6BeShQfrC26utuRBoV1gAcTQtZ5P2BrmCinC6bek/tPB6
	tKceJmXS52uDu7U6w8TS3HtdU9HJnFyctmPpS3tnj0k7iG2TrLPiqX0+v6yQSug=
X-Gm-Gg: ASbGnct11aUg9LjZg6MSHN/ZFg/9z064y/Sfeue+ZXvaXw6j9ytPabs8X0UtvQUu22P
	fYzpCReXlUs23Gin29JySxzOwshlU+YMSENuc8S18LFtqRe6SQOSXURXzuawAygnIbI0sgPA61h
	sKipEU9Zu2b70vEIbxs4zeIA0N3VSEG1+CkXn4qdsWVkDu5t7cKi0XcNKSXx3AiaxF6Fb+DMCru
	jukXfMOwN9pMKXZOybT4EpIYpM1zfT+gqHFJAuw/FiQ+S63bhG59GNHcMnm0lFDcbDW67Q=
X-Google-Smtp-Source: AGHT+IE1eKytGYhN/G2avEbscWDzaqM2N9y7QbNLOqIY3WvlHqBjWYhCRVwGHZqF/ZoYxBdvoZSCOg==
X-Received: by 2002:a5d:6c62:0:b0:385:f010:e5f4 with SMTP id ffacd0b85a97d-385fd9b6c06mr4026493f8f.28.1733308599326;
        Wed, 04 Dec 2024 02:36:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385df74157asm15409391f8f.0.2024.12.04.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:36:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Dec 2024 11:36:37 +0100
Subject: [PATCH] dt-bindings: display: msm: sm8350-mdss: document the third
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
X-B4-Tracking: v=1; b=H4sIALQwUGcC/x2NwQrCMBAFf6Xs2YVsrFT8FfGQJpv2HZKWrIhQ+
 u8GjzOHmYNMG9ToMRzU9APDVjvIZaC4hrooI3Um7/wo3o383nZELrDIVu7Xm+OSzHhGTaiLcca
 XZXIyh5yjhEC9tDft+n95vs7zB4azNaN1AAAA
X-Change-ID: 20241204-topic-misc-sm8350-mdss-bindings-fix-1701baffc1aa
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=peYrt415YULllPSwRUnKU5Qx+NDdGSX6LQbwju+FB9U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUDC1nleUyZQQLS9gEd7//NknovstellbNGR/a7EQ
 eyLt7XiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1AwtQAKCRB33NvayMhJ0YhkD/
 9U3qDvqecaANAURilULho5J/RjI0flxgZwbAVSkj2UH7c2Ifm0TEJm/PNkwLJgE/jIYZ8DP4o7qTt+
 x4TRZVYeu+QVirVM/e4z8PMgI0scaCwmrwkdjy1dyUlUxXxyZc2tUyOSpsnBmBSqmwb8SCvUoOKhSy
 NTXIvoP2J0YLDMTUryjNP0av/W+9k3Tw8wgy7lse1tXil3MhdXbufiSstkS2MZs9bFuYOvz8leUOR7
 8QE3Fa7FTMYdTWEU9dEwIPqnMBcmu4C8yfbXiWRnru075t6rcT2BKyvA57BY/PYjSYFqO3BTOt7HND
 YcHxVfEDXY7pNe0j1mZ+HQce2nCGEjtWyS8LUDPfntDpf3PaySc0ESyeu32Xm6Z1+2fvufXlUds3rV
 +Le2js2U5SQq2nFRXXzxLltckVq+6122EV+MD2N9ElD180lTFrNXXqSxEHHG+S+KlhuYTGRX1pHBKg
 iNrRGeE+97Ueyk9r1QXJ0whDnFsz32k/VHI7OkelttMYUdUm3HXDuTqyDN+7GcJdFgLZXwe6FFbBuN
 sPd5SpFM+y42SNCOMeiXfZ+DoACTRda1hBRWWGk2oO685P2uFJV21NN7b32MOQ9CJ04CXRQi/d26aK
 jvUGV67nUXQyNFkZiU2Ndxm28uPmob6GYdVFptyfrE08LgbJ8tRqnB1fB74A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the missing third "cpu-cfg" interconnect path for the MDSS hardware
found on the Qualcomm SM8350 platform.

This fixes:
display-subsystem@ae00000: interconnects: [[121, 7, 0, 77, 1, 0], [121, 8, 0, 77, 1, 0], [78, 2, 3, 79, 16, 3]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 163fc83c1e80cf07383f9aef510f2f58a26e1ecc..cd9c6c78413f887c984b522f83cc7e437ce97d25 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -38,12 +38,13 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 3
 
   interconnect-names:
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

---
base-commit: 667ff2368867af7000ce32a8b3fc025c2b3226b3
change-id: 20241204-topic-misc-sm8350-mdss-bindings-fix-1701baffc1aa

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


