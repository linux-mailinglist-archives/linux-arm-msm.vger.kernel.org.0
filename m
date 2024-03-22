Return-Path: <linux-arm-msm+bounces-14904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9D8874F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 23:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A840B282C74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 22:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF5082892;
	Fri, 22 Mar 2024 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIz7ygwI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C597D8288E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 22:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711148222; cv=none; b=bT7kcC55CFscPu6E6mvsJ9e+ouRV6zXEo6/O5bCXFEu+B7W5s3Mje84gGjUyToB09QtFK8vk4mUWLE99DOOhA4mbAZEIHnFR5ljsTa3OOLfLSxhiNXHcA0EaQ80mwX2TymL8ovsfQbjrf3DOr/WzSbyMpel/2qOQ9LWXwNZ1j6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711148222; c=relaxed/simple;
	bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AI+KNkjky2I1TbEE+/K3hKjwxHEV3QfPQZVjzNeWlarGo5KFk51J3GzBxvTwHVzppx0R4DsoyH0ZAb4EDgMYuAESJaYeHcZwDYqrRwQjXXDopy9g0ghMeZ8broLZJJ78q87yGkxsQmRO7G4j3l4GqbLPemOKT+7OLDmyFGExLFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIz7ygwI; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513e25afabaso3060649e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 15:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711148219; x=1711753019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=EIz7ygwIsXytZsFUFcojYJvZiPFale4/wWZ2VDkwjlBrGt/q2Vur/YiVWiL+mfZgwb
         lzsOXlR5NUElC1+4A08lE7xNIR2B6i2IC+b7f7lSq1IqfZBW7Te0AnmZtuYpF2X6khtj
         /XnyWnwe+uBN52bXFWlZvInAOQZXDrCO0q2KtMDI6IHze8AoSUwGxXCORozFK2ypwktB
         +Fb47RL2CqRUIqFSCM78HQRpbpxBIpRHL1yeOoueAJJiJlbeUKIxYZdcS0UaJhnfh4VK
         NEZTMpdtod+U1i8cgzDDXmIRJThPcpdvCB1hWaeGA07k8pbHWOJAM6k9BIB4ax9gRVBg
         PCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711148219; x=1711753019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=MKXcNl1+EuQaGiBe59Rl22a7B0pyY0YHEoDKSjl53TV8HeE9LzbqHG7ShHskHrBF2+
         cMpUr7v91b6WumPtXacVD8Xu6qJjRTgP97aepzYLWidtTE4aQuYacOX8ujoK6J0LT8dK
         lWpfM4Pkb3+r9G4+ROhW373RLj4SUMr6Vdtt/vqRdtfKJY9qvtyqByAa1m5BZzm6CQAr
         sY+uo5egwwZiriN49AL1jWhIiuDMabOQlC5Tegb27PU/FDGu1cOJqXkmCqCENyKfvJ+8
         yD0NmlQZ3Jcu5aRlDjfkirfnLMyjU+V8Xnj7U9lZCSXjl0YuQiFudXrjGh3U2856gNml
         yc8A==
X-Forwarded-Encrypted: i=1; AJvYcCVkv+JhY5Cb9WEn6kGofACThSJbaECmWRZ9n2r2epqxEV5qv+5wYRXgBIo94jPc6J1JRZq0M0VVJmPd/8PLfrlaAbraKlcz/KUaLIx5UQ==
X-Gm-Message-State: AOJu0YwRx0Q0zymqHPoRFepAK2NhM0KbIps9Z71iZfN57ELiNzYLnkkA
	XQBHy8mRHaEDaTPRRMDo8SkJeyI4bfy95MNWHPvsmz9gdAD7ceW2lPoJxDwo6i8=
X-Google-Smtp-Source: AGHT+IGdp+o4CDbwmcSah48K76ZnFm8Lpri3RosPHxDjMy+zNnVHyIo5UxLjLdqY6Hh1qIxp+YMhZQ==
X-Received: by 2002:ac2:5611:0:b0:515:852c:c77b with SMTP id v17-20020ac25611000000b00515852cc77bmr463629lfd.39.1711148219036;
        Fri, 22 Mar 2024 15:56:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 15:56:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:56:53 +0200
Subject: [PATCH v4 01/16] drm/msm/mdp5: add writeback block bases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-1-cca5e8457b9e@linaro.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
In-Reply-To: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+o/nm0v9VxfyjaFzlD26OA0ztf8G7XYN2DKnPv8nz8cv
 /6rdFNhJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmMlGWg2GCr5C8843Zf6Lz
 GObIBh5dunfTo+2mXFyH6tyKmz4091r4vOZvONnbekz6mbhQm3ko54up7hYCLzoflwvzBVta1Vt
 tiAxjl9DNTpyT9o+v4qrW1ens25pP2LAeO8aza9l76WjepmdHbjIUVm/8bcWpr9AdLPrw6deVMg
 VHu5fU9UTOq9mz2zprtqUa24d7M7Uup9uVW215s6zTLKkptdfRpTtMdj378fSiFbNW2h1481Tu7
 M+9U5bf8VNQTrU6vpm1mdGkdQrDA9OiwpoDuyJfGkVWHAisbX7wR2ytJlP7+00e9zkMjE+4pkmJ
 Jz4PDPTM/3Fm9sepmud/XJO9+y3g8zV2SVWZaKeOOKW1AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2


