Return-Path: <linux-arm-msm+bounces-41594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC39EDC08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E817F16174D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7C91F867D;
	Wed, 11 Dec 2024 23:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LAADO/Ms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B081F3D33
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 23:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960518; cv=none; b=QtdYwYcCqAayK2xV6FS5tu+0rZAbMurD1Nha18kHF8LlayjM87UQ3Z1TnQg3N62wFobDH6yuqhgMjJhwG+4lLlJdtpCTSrrW71j2U5nxMubYQqmUAu7cuQlXCxfP6SFyaZWl/esZGLk178zSOfTpvDTMWppFKbc0Dai4IXW0s4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960518; c=relaxed/simple;
	bh=HfzBNoNZ5YxREpp+zwNqWVRRAleEY/sLAybyceKsIwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kcWpDDK3RqXlrToqJ+GuhYlQi2jbb+p+d9bG0wsGmbmj7kTu5ABu+l+u92o52ikh1OrDZLmKbxWp6Ua1ePMpSwJ3jPTVCWOPFJplwQ7+6PY5zMAVTw0JSly5vlO9ohnC3vfi4kFhKn9wvYKMwQDtM8iByCcvPezS+uFgaRE9U1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LAADO/Ms; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53f757134cdso4660878e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 15:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733960513; x=1734565313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEwFM71k30EaN8cVZKntDI/qViIcrUeJPH3d95sXbSk=;
        b=LAADO/MsgaY4xMTpIteySAR03XnmnQDKF/ex2CwQBmajjeUigYmZqa2D5u5VB3ySit
         zod2L4AAnbcDQ+ixDDCMG7z2IkMUATsScvWrPuBx7AG2tgExxMq22CxPBFheOfl/YvAE
         2St7q+H0NRgHGtWfgiDTxuXq8BksSHu7Jt/hkm4UgWEfxNxMKXHYiTQBUonw6Z7CxMc9
         hsaqYo10XgN2BxS4HrsejrnKXNe2zJ+skpEwfZ7eiv5Azn3u099rVRLVPB66UWxKNnjZ
         HDZy2Ya3wSgsGMyEUBi3IetTCLfJpGYtOrVSTB2TVlwk5PdzM+MxuNWFBm8q38AQWzGo
         76BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960513; x=1734565313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEwFM71k30EaN8cVZKntDI/qViIcrUeJPH3d95sXbSk=;
        b=jpjzJsR834v1cQUixu2vZPL/pY9ZjItN/OsYvwHUa+yezGeWlY2LUuLHxbBNqP+xMd
         RNKMFmwQuPK6XkztWFfSGj3s9nDWeHsYQGDE7LSb+ProhjgznkKZxHzVPGs2WJPtQsK4
         y8F6Fmu+sNZnN3/qIJPmQFdmZGPVZATYwafonulChrsd8oWgA/vs6ZV622HmSqoIEUhZ
         26ul56pUKPh7dvrrRumMOnWJiaRv5ZK2/FFQ5oUDmkyXSJOY/2cnKxRAmiqK79lQgCbJ
         7pSJTUcL3LTkKHF0Wuc8bH/l5+Hk4SOGG/p5wSNZbihvMor4WK1aNUu/6Iw3uYAGhC3b
         hghQ==
X-Forwarded-Encrypted: i=1; AJvYcCW42EJe37A3qbM1YUCDPgRpAs4k73IpQuEA0NF2+oE6qu981XXafpH4i/tKR186gxDHKJKJQsf5mKwXPCPi@vger.kernel.org
X-Gm-Message-State: AOJu0YwxYQo/+CoJf1bccEWbOGBV1pu5cE8NMVBMcHVdH/8LyCoyjN3E
	wfIGZ7szv4NLvIskZXUKxFpp15CPC9/T6mvovJfrA9OY1siiOHChDf+3p16wYJA=
X-Gm-Gg: ASbGnctyWbET4fWD/elgrTZOjZgOjl4oSph26861dZjOMKKbj0Aewew1LOi9g29z/i7
	m+1qG8NbVmj3DMNg4y/m2CzD2rKEG6/yWPDE4jEgcIbk+1v5NcewtQRIDxFJrL4vi64hOPhcfNI
	Bx5ReKfpI7aHA80UNWyKIMy7fUrT8xfeLsmfZy+qz0UoWpl5Fo33gEQx0XBum6a8p/4VEB31wf6
	U7Xf8zQZLRzZGIJNtSJ1l7FJxaNcKhNtvwGw4EGicTKNBDxg7nMkdXHAHEtng==
X-Google-Smtp-Source: AGHT+IGj49Hwcak5BEjIpvDLC2UjxrR7zzU83GvzRN86z5UCN6Y2OROY6cNCNFctuKn9n1eJTKzqpQ==
X-Received: by 2002:ac2:4550:0:b0:540:2a6e:3732 with SMTP id 2adb3069b0e04-5402a6e37e2mr1112849e87.9.1733960512905;
        Wed, 11 Dec 2024 15:41:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:41:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:37 +0200
Subject: [PATCH v3 02/14] drm/msm/dp: fix msm_dp_utils_pack_sdp_header
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-2-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2640;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HfzBNoNZ5YxREpp+zwNqWVRRAleEY/sLAybyceKsIwk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM3DM6YSvmt2KB7RbnsOnGAh/wrprvgKkoMe
 OrfWcUVum+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojNwAKCRCLPIo+Aiko
 1Wz8B/9dQvWgr1iQnpRunRBkLYJyJCll/ef1ZtgyMOqO217j1/Xm2FAqJf3KSwA0uJVDx7SG98m
 m8E7CG+nA1nOgkU2d7I8ViwHAKLAPcjR6eqNx5/rPL7+1VJSwEf6xvCeqvfPflT3Y9R0X8to3k2
 aUrzJnfknIxSDuHvIJyE/A2r1Pj4QVnXxKIiaishOFgP5Oo3YURVgmPSpunloMpUedd6iVoUnw3
 WyMy+aLAjKvY95LYjwLnJigcEjOK/6nrJKCbLl4h+PlBvmvJdkRIue+ReqWQ8QK1K+oKZ38byo8
 gji5iESruB8ZF5B1VvEjztHiAi8RKeVILuj6LJw8NizsR6o4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The msm_dp_utils_pack_sdp_header() accepts an unlimited-size u32 pointer
for the header output, while it expects a two-element array. It performs
a sizeof check which is always true on 64-bit platforms (since
sizeof(u32*) is 8) and is always false on 32-bit platforms. It returns
an error code which nobody actually checks.

Fix the function interface to accept u32[2] and return void, skipping
all the checks.

Fixes: 55fb8ffc1802 ("drm/msm/dp: add VSC SDP support for YUV420 over DP")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_utils.c | 10 +---------
 drivers/gpu/drm/msm/dp/dp_utils.h |  2 +-
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index 2a40f07fe2d5e20114a7692d1269bb8fd5bddbbd..4a5ebb0c33b85e3d55eb974d74c1f54591301b35 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -74,14 +74,8 @@ u8 msm_dp_utils_calculate_parity(u32 data)
 	return parity_byte;
 }
 
-ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff)
+void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2])
 {
-	size_t length;
-
-	length = sizeof(header_buff);
-	if (length < DP_SDP_HEADER_SIZE)
-		return -ENOSPC;
-
 	header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
 		FIELD_PREP(PARITY_0_MASK, msm_dp_utils_calculate_parity(sdp_header->HB0)) |
 		FIELD_PREP(HEADER_1_MASK, sdp_header->HB1) |
@@ -91,6 +85,4 @@ ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *head
 		FIELD_PREP(PARITY_2_MASK, msm_dp_utils_calculate_parity(sdp_header->HB2)) |
 		FIELD_PREP(HEADER_3_MASK, sdp_header->HB3) |
 		FIELD_PREP(PARITY_3_MASK, msm_dp_utils_calculate_parity(sdp_header->HB3));
-
-	return length;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index 88d53157f5b59e352a29075e4e8deb044a6de3bd..2e4f98a863c4cb971e621ac24b8b58f035236e73 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -31,6 +31,6 @@
 u8 msm_dp_utils_get_g0_value(u8 data);
 u8 msm_dp_utils_get_g1_value(u8 data);
 u8 msm_dp_utils_calculate_parity(u32 data);
-ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff);
+void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2]);
 
 #endif /* _DP_UTILS_H_ */

-- 
2.39.5


