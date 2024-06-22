Return-Path: <linux-arm-msm+bounces-23732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792409136E0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 01:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3141A283FD7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 23:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57208174C;
	Sat, 22 Jun 2024 23:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOWyIiOw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ADD3FBA7;
	Sat, 22 Jun 2024 23:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719098759; cv=none; b=fGcyJFcR6oFj78qQonYJmVgCAfyTBh2ooGJKN+d/3Lfsl/psguRd6mX/r8oiBVoFvGDaNQjgriOxh5XpRoPtvXekfUxp+jHYIjjIOUV6mipk5gsyDlfBUt1SurSAwmgsfIHpCqULwgQ6GFovWcuNc5VjBAmaN3DnJG4MRkQXG78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719098759; c=relaxed/simple;
	bh=2Xrp4BfEH7oom8u4Kb44md8JG1fUZgQoZXMJPeOIVuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnXP2oGzAC7YQsfgNDlRAZB9SWDNKvJAnQHtDOePb5JSEtPeLm9p61G8uTrHl5iJgrS8pWnPwiFEVN58DRhFrnq8kHJja+tdqIRzdeSqY3yDkbr0VVOMGWltUPurPdRalDpN2DCVTM1BCD74M6Z0+oTZFBwPAIQK+EE4Oe4IuEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOWyIiOw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42121d27861so27796475e9.0;
        Sat, 22 Jun 2024 16:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719098756; x=1719703556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWHAXFFmaSZgvBXZR/Mxp9Pkz4SLmkvmM+jATo6r8UE=;
        b=TOWyIiOw9Ws6fytGuEUAGZO2BhNTBXKJovQtvpX39D1U10CNVqLB0Y6Fi4y8H4RMYv
         KQ+qHLvGj0lGWKvwpGCyjYBioREn6P24MzENm2HgCtSp78X6ZXZM9dV2Wl+wfudgApPO
         yGGyO4u1tOe3UCRAsUhAaqX8EQ6eidMvATxW/XwujLGywDTEIOhwhJUVpCEn6CLIe8qD
         sCxGiKKJuH2uevy+c/aCchSELTyjg6BFDVMrSQ9z5zTJTbw+67T2tIBIrXB8kViHAI6L
         lgBpTz5ZfL3WCemGMesHeUqAET+VgRdMJ9YiWG5tpd2gNknPzJUOf/88BRDx7DADxvzj
         cKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719098756; x=1719703556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWHAXFFmaSZgvBXZR/Mxp9Pkz4SLmkvmM+jATo6r8UE=;
        b=sWwi3J+1ls4hL06IF8e4og+xuTZwAa6N1lEIPCJ9cVQ4Csq7VJSGod7RsW6ba6qlWT
         yw6sQewzSfAh7wzDnWJp1dK4MnqK61Y/rfXt0fYRkAl/3lwIheDr+vFN1lX2EeEn+5QI
         eRDGkNtkUnY7LeeeZGzfm28nRevgGtxLwxV7G+yayaLXGONOTuDL3ymKUiRCfSxH8+vd
         9uuLwUbaR0+YpZ/+AMYlnI0uhfwVBqdvfRTqtKbi60KhCN2XrzaZ5NdR6krHaVyMjow8
         SPAfUxCXpz1cfaZTJ4NQEgjvfh+m8s7U2Ju1m0+jjZvozrrxIPmm8zt00urkQbC+jwNe
         Ns2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2BqGmMQsjYc2lxeLkK77b2kdT/7wUjg63b1FsKgOS9tT77sJYRoGUa4TMgfGP+4F19UBR6cWdzlqlv3HDILvMDeEsAD3YktC5V7R3HIkw4oGxsmnVQrLkOGKq/SfUNVURkkQkmQhb2Q==
X-Gm-Message-State: AOJu0Yyub/ZDSj0o3pRCZ/z1jrHyEOmWi09xjv7XnpN1coMSX16wEAab
	UuHmK96hpKv6IOdTuwgLeyxchiWrl40YdZQRVcOmXI0+bbu1WPP1
X-Google-Smtp-Source: AGHT+IFhTw2K1zlg7CzOin7QPXHZw+j792pc9HEAWcyNu9FkjvzuZaBZouhfEhzH1nRepX8KYSZ8Ag==
X-Received: by 2002:a05:600c:56cc:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-4248b95d0edmr11914775e9.10.1719098756419;
        Sat, 22 Jun 2024 16:25:56 -0700 (PDT)
Received: from [192.168.1.90] (20014C4E18129200DEAEE2020304A5A2.dsl.pool.telekom.hu. [2001:4c4e:1812:9200:deae:e202:304:a5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d2190desm120301875e9.48.2024.06.22.16.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 16:25:55 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 01:25:51 +0200
Subject: [PATCH 1/4] dt-bindings: display/msm: qcom, mdp5: Add msm8937
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v1-1-4ab560eb5bd9@gmail.com>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
In-Reply-To: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.14.0

Add the compatible for the MDP5 found on MSM8937.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index 91c774f106ce..e153f8d26e7a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,msm8226-mdp5
               - qcom,msm8916-mdp5
               - qcom,msm8917-mdp5
+              - qcom,msm8937-mdp5
               - qcom,msm8953-mdp5
               - qcom,msm8974-mdp5
               - qcom,msm8976-mdp5

-- 
2.45.2


