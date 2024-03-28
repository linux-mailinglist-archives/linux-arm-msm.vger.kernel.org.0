Return-Path: <linux-arm-msm+bounces-15552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA588FDD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 12:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA6D2297B97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 11:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643167CF21;
	Thu, 28 Mar 2024 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnHb/NhA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC490374F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711624342; cv=none; b=g+AurKcE527NXTttyOFnAua5BdFT16tYcgMG4hXWOVh4ld7KjHOohHN/Ei3zzbdEnWB11VI6Z+jsbHMF6qvfmsbhwYQnU4U2DDCgcEXiwXVFcebqz/hsORnewLW9q0jlCkmLL9XEZmxFWQSsA0SmyM0iyjsNHDuH+2WiD0OJUPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711624342; c=relaxed/simple;
	bh=7/POMsW6HjsVJWUdcNvVgHUqdBXzb5wMKW+ROAa4zKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DLO6ElgzpnL94V23xowsr16QZwdKrHWzi51g7vxS5bd9tfF15c+nWg+JBohjhSbdgI5pgrCESviOj78ECC77sm8QS8XlMQAzZAwKgVNmeiMkX2Sks0XrjkFBcAwtRDER1PsJjROe5fwbSgOFAS5pqAixigqKBmCadjwELcxKYIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fnHb/NhA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6b3dc3564so727080b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711624340; x=1712229140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLELEYK3dmk1bj+WVnvKaUvN2XnDOjot5qdxPMzZado=;
        b=fnHb/NhAqzj/wMVKNFjKP00vlNPqxllTSFKgEQVX/PIUbGr/uDpuz0ElTAcMUgpl9C
         oTsawRJaIdLjbiordBnTppMhSdS7A731Iuw/A52ogeIGsE149ZaAHMmtoHBBcNyuteV3
         Djs/sWB0vYpQPBTWYb5ML1Q6PVGlg1kNPKCtM9RohhVOZ3erKbaeU4FoajlkH2PJUn3U
         STOldHxM6ojBlkeFOla11U1uswq56LVxAfeZY/oUCb5Il9RjBkPubmesEqxjiDH8oUWA
         0d+7tFQw4u5ibis7A+VKe52hUUJzp752B50Nb5N1qg02zammu1btMQ9VERJ24Wcw0qk4
         COAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711624340; x=1712229140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLELEYK3dmk1bj+WVnvKaUvN2XnDOjot5qdxPMzZado=;
        b=NKDk5J7oQNEy2I9fjB3Y8IXahi2de0HdF9Z7QjNDmmNV+LYNdx3CAszGSg2xK8dyQM
         k07a15pidqJfOnKxCH9VvAQpSJAjOLevnDHrT3Qa6S5puz49EGCNRKQgO9C0Byn/TTqW
         Z10pZD3ApliEZjYBaTtnqj4Xjlaxa3/QF80AT+PaLh8o5HLrh7kVg+DlaGfaQQCW1gtd
         sYzkvyIA+HSACXS9yUCvx4KTRCfDAIYAOG9/DLR6hdXWok49R+WUzJlCrkvXWpyNL2IE
         V5vWPh3EylCCCy9sGNUzsQOg3GHmdkRoGjPxTg7qtPK7RxzvUqpWVCXEDeNh/ZWLX428
         jOyg==
X-Forwarded-Encrypted: i=1; AJvYcCUSHb25NTkehJmbBJsd870PriWtGdYNCDfKb3KKaA3zt8pPcAVvgTf7fvy8A2MhLaQwu4WFUFMAblboW7roi0mHzXQyAOhmWDgzcZVjuA==
X-Gm-Message-State: AOJu0Yw7nATZbj9FftRhSB9Ldbr2hn7WGX2gUvVDw4UT2tS/DYFhd+85
	mRRGTeqH0oS/WuxkaB7NpD82N5ewtsHSN4ryrj4qe4rvVwB0NjqLCg7Av7foKaA=
X-Google-Smtp-Source: AGHT+IFLXKC5s6Z3XmJzfcHVzUC7h1Aa6EP8dyjaeT/CBWRnkZMa+UqmlnyIhHgHNoCLgPYqi6OHpg==
X-Received: by 2002:a05:6a00:18a2:b0:6ea:baed:a15c with SMTP id x34-20020a056a0018a200b006eabaeda15cmr3091585pfh.4.1711624339083;
        Thu, 28 Mar 2024 04:12:19 -0700 (PDT)
Received: from niej-think.bbrouter ([112.65.12.82])
        by smtp.gmail.com with ESMTPSA id k7-20020aa792c7000000b006eab9ef5d4esm1114607pfa.50.2024.03.28.04.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 04:12:18 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org
Cc: sam@ravnborg.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	quic_parellan@quicinc.com,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	robdclark@gmail.com,
	seanpaul@chromium.org,
	swboyd@chromium.org,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	marijn.suijten@somainline.org,
	sean@poorly.run,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 2/3] dt-bindings: display: panel: visionox,vtdr6130: Add mode property
Date: Thu, 28 Mar 2024 19:11:57 +0800
Message-Id: <20240328111158.2074351-2-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328111158.2074351-1-jun.nie@linaro.org>
References: <20240328111158.2074351-1-jun.nie@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DSI mode property and compression mode property

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../bindings/display/panel/visionox,vtdr6130.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
index d5a8295106c1..36ae94fa96ec 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
@@ -26,6 +26,14 @@ properties:
   port: true
   reset-gpios: true
 
+  enforce-cmd-mode:
+    type: boolean
+    description: Set DSI as command mode. Video mode by default.
+
+  enable-dsc:
+    type: boolean
+    description: Enable display stream compression
+
 additionalProperties: false
 
 required:
-- 
2.34.1


