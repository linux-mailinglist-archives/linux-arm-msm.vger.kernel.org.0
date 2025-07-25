Return-Path: <linux-arm-msm+bounces-66658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB02B11A05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52AD73AC7D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 08:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286FB2BEC5F;
	Fri, 25 Jul 2025 08:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNaxeKzo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CC02BE7B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753432545; cv=none; b=fToIhBt9USstoKuozTScWScQbY4WgoHy6fPYbDMFTWORsVlSV41xK/7rqIpxoyr1ntqjp0S1TQ7HXcAC/QHAfjlwJZqkttuBtKwC8sRcX8QrM+jhEvC+PFd+kPoKKPs28UF+vLjscv0IuoWqheTN8Y6vhUBtIbLX7gjCUaGfZ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753432545; c=relaxed/simple;
	bh=l32ZnZnJaY8M12UcGDnVxfUY50z/wxHD+58gB924aYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e8voh+9JqrmJvetDwCyUTJzbKgtvUOq6qvlGKeVPiRLyCDzpTDIYYVO6FyWvB4qfL2Qfp47wLxgRt7NEPSAk5lR7AdG8MdIcZO9+uwUhSnZj0jiGYG/I3HTHsMRil3k6Rh4iS5bmGRh3SE3mM+UVS4q2DKj5IdvNAMH2QjlzAe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mNaxeKzo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4560d176f97so21568745e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753432541; x=1754037341; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gin53vNvFupvLdVYbgZj+tpdzrgweTRWwLmZPfysc/4=;
        b=mNaxeKzoFQt+It6T1us4CjJODAwkIJLRZg3i4AA/kzYT7bkgUNED6PsL6qhwC7s+8u
         62Kp1VYg+X/1dlk1esXxVUaXoSpeoRLIES1l/b4ZKjGOBuOxpMMsoWZMLNVhJkObaxy4
         tA1tkH1DuqHVX+ELoxbOrWe+DhVbQAH8HvJR5C2+rjTs8ZXPWI1vAG7Cpa3xFBYzavqP
         72h0kjpWOPYxC+NAI8Q/XlZqBf6yF+QQPv2Na+5xYC69hM9ucKqdKXb5SpT3r7od8E1Y
         xAyGURwqM3FWUblxf0uuPagKIl0GO4pHUGOQEFC1V0t/3nm3QAoNrlKryhIpUmSeoWpf
         rouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432541; x=1754037341;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gin53vNvFupvLdVYbgZj+tpdzrgweTRWwLmZPfysc/4=;
        b=LIMFEbMvD1BnUvYvtdiz7oiuvT+I9IvxBksIH9S8VK1MyVR6jHbYP+xfoKbjuN2JvE
         EZaMQA+Gt1pkrwWAigvCAiH+VgAs70PPgOUx26hQVjNITwFGPSlXAQzo3iPJEwsJpX0Y
         z3zBD2ZwoX9qC3T33DVVL0ljQrtM6VRhWvPQgjqFjAVVQI4MbtK8DXPPCKTNkVtErpr3
         +kCPFg9A6xS3uYanQXTOwKCNa3wr3GeJP2UDb1lKm+gW5cckjDk8NvlJ/tkRa6c7Xlty
         rTGKqUbTq53JdBRoJ/6AKj3d2I8purYqLtuhxtvh9qu2ni/Ag2TrsjLgGdbGDdDeNxG2
         tmdw==
X-Gm-Message-State: AOJu0Yyg/5Kw4Tp/+pYWVGzeiqqtnf/Y2+8v82KfFB0+1bDxcRXznwDL
	35W2Yqn2UxM8lp6IfV7rzG2fY1a4iklhRVvFmHduWzJBoP1kaVW2qqQ4RmcM0kf8TWs=
X-Gm-Gg: ASbGncsf5zm60jdaMRbP99NnVsrKziAaIn4Bl8S7tQv1JqJrjRSQ2P+YLv3lusKc95I
	zcwwpknj4PBwlwLY6a/A7TQuvvQ6cI4lGOCeYBdDk0i97OoKiFOrnclKVdz6T4cN5mDYrhGxxBV
	26raFgXeMd92D1ZpElyjU3xBbxgLVG8haDqTMvej33JNcUxcNITDYCV5imFW5ibsggdWveKtCw9
	/s1n60eyyERK4IWKqi0dq3chWtb2WvHJewDFC2TfA1KMTJRx6XECDX8B0QGZgFBgb12zdU1DBiR
	cYsMxO8OGDDyCzlx1zOOmOYyJ+8BKy32PAV2jeQucPm1qzLf7zSJYIbAdSe37ZunbeSkHRLbU8A
	Mg1Ksedywo9RDqutRtyopydzLA4g/RuUKEhxZBLXPoMk=
X-Google-Smtp-Source: AGHT+IEzQYuqh/IiTLBym5ZDC66c7FjRpcqseufFtGSPwdvaTCU6VfbvjsMwyUs7AAIP+rVKjPrSUQ==
X-Received: by 2002:a05:600c:1c86:b0:456:1fd9:c8f0 with SMTP id 5b1f17b1804b1-458762fd0bamr9033325e9.2.1753432541475;
        Fri, 25 Jul 2025 01:35:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45870532b43sm46236695e9.2.2025.07.25.01.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 01:35:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 25 Jul 2025 10:35:39 +0200
Subject: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
X-B4-Tracking: v=1; b=H4sIANpBg2gC/42NTQ6CMBBGr0K6dsxM+bOuvIdhATiFSQwlLVYM4
 e5WTuDyveR736YCe+GgrtmmPEcJ4qYE+pSpfmyngUEeiZVGXWKtCRY3Sw8r8QUJEYb5Bd07uoX
 B2L6oDFouOVdpP3u2sh7te5N4lLA4/zmuIv3sP9VIQGCKqiLToa3z9vaUqfXu7Pygmn3fv7l1r
 BTDAAAA
X-Change-ID: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=l32ZnZnJaY8M12UcGDnVxfUY50z/wxHD+58gB924aYA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBog0HcXl/+HuB6p30tUGDOC33y4lXB1W9Xm5oJMOIv
 xyAFKvSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaINB3AAKCRB33NvayMhJ0fsDD/
 90a7IXGUNpSxgZkerFUhsDwKgwUNxi5jH1qs5zw7JfiQZyWepyqKo3ISc/nwXG9yWxiA+mFDaMI1Ga
 sJLMSK2XmjwYnjX4rbjyEoU/fQxGbMUBls6oap0wJ6QGgUa0kITwGfhVAzVGg061Lq3v6jyDaykmKz
 c6q4uoc0okIsStrXp/zh2cRQxOXhupQKqyTfUQttIlDQjMJMUrxrvqZ8fOt6vBa9F7DOIEIzZ1f78L
 LWLp/vRw39KQPansEC0acd8c9vy0HszDQcrqOSrb9H1sk9X4t1JneFl/nrrVP1t4pnWeAPevkqb3NR
 H9dSoxENH7MbnEY0ki1hM1QP9f1YgW3WzhV15ZbHWqmsFg/WSuK5IEEiLM3iaoeO/5WaxF7cwIka+X
 nzxKXVIL+jXuJ/STHy/GK17zzp7aOgDkWOtqNXMVPXRMjmDkVZ8mZ6mWXFbzEoM21pXr2yqHPvT5qf
 g62BeJ3S4PQMrDHfZQsTPAYi85lS2PFsIYYObgqYYViR0jRprp65ke+og6BXHwWObI8ZTLHY6T29uV
 aKUIwcbTGkCijsfL4iwz/kNPgwWITjG7tqAtB7z9VsEetNzwH3qnc3732zVjAyTMO14Fbau4a97jBf
 rVxAfGIaUyXqAZ34J3poo7wP6JgwlqgbyYjMA1EP2aXm8wO4OylutaIdCjPg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
the Frequency and Power Domain level, but by default we leave the
OPP core scale the interconnect ddr path.

Declare the Bus Control Modules (BCMs) and the corresponding parameters
in the GPU info struct to allow the GMU to vote for the bandwidth.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Used proper ACV perfmode bit/freq
- Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.preempt_record_size = 4192 * SZ_1K,
 		.speedbins = ADRENO_SPEEDBINS(

---
base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


