Return-Path: <linux-arm-msm+bounces-72360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A63B46340
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 21:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BA577C510E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FC72798FD;
	Fri,  5 Sep 2025 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxySlwBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7722279780;
	Fri,  5 Sep 2025 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099455; cv=none; b=jxl39JZ5LMAi4zLhqfnY9nikD9S+zODx4LODPn8cBLAsPc54JciAPANTKaD2avlPsNN8FbWUNbri6tvx6jXSCmt5DRmhnljggUEC8+bQCbrFDQ7nUOhTXWbaHAd83U3g3SP+BaXhEdPGJ1T0Uyn/5RS9S+Ydh9A3nuJxx19PMcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099455; c=relaxed/simple;
	bh=Nk5zP2DO34VSwnYJv0kbGdIuifvpafYcMEKA/jnTQG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pPeDn+6D74o/3A68/02TaH1xbYRHFNCZgBAy2WuUlvQzm9sEnULCoJgwNVUHIYcOKYwXkdpNsr5mLRbJej/IOrVOkoVSyOC3eDfVojiy+xUu2+fzPnQUD3b9AnSlG8A7GsrqkDBGzczFkjOyF2S1w4uRc0+sCYXv0YBl2G86mUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxySlwBV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7741991159bso1767846b3a.0;
        Fri, 05 Sep 2025 12:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757099453; x=1757704253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alhHR+QtptRnRvwvatlC5lh2g9SYK7bPKYa9zS8Ojyw=;
        b=AxySlwBVFKChLNTRrajfAJOiDfDhW3nZ+yb6lwXO45TVIPAF4+4dtkNVvIaaTB1jQh
         aqX97EFLUijDhHq5tz2hfmWCZaySUF54ubv8wkfGLx0L642CwjtJo+4QqA+6M3bi9ck2
         cTiFAOq0btW+A87FABle7vCg894idBWzhwkKhhz7UoJyiKwh5DWfInEbWCNd3PeSORj+
         ehCDSUHzrZYO+MKwR551XUDEQ1v+lm3lCgLh1V85t+TX8e5KYtkBXENK1nx5sJZvg9oa
         KA+dlnDOpsx1tsW9LX01pwl49K31xSRBP1CmEfkypJWYwjkApGaILxCh1PcsPvC8sbBt
         sNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757099453; x=1757704253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alhHR+QtptRnRvwvatlC5lh2g9SYK7bPKYa9zS8Ojyw=;
        b=SIh+fflF0Ga4Vkcb4VWAvAm5IN9D+CsnPgn5MzpXjg6ZLVsPN2hWiJq2Yln7FY2DVb
         Vwt/H0ynNs9y3l9zvhLf4jQps/y2DooX8oq2AWStv4AQg7QyaIqlXYy1gyYMwrGLBl69
         ifz4/wMwtA3PCXVgQ7RcPjH6/q3q1WvAIDJyPI2PT85fCrQiXMnL+YzYaqHOy5qQaHI8
         D8cFJGyXMlECjGqx+RXxkgJSv8Q/MkxqXmrj27c9KdAWPGqasdNSYkKBTkwzdzgWBBZW
         Gg3ArM+4QOsnc+S1DIfNjTA24bHZdV8kGsFF5PDVpinzhywzihtmcmzDnBuNNc4/xJ6Q
         BBBg==
X-Forwarded-Encrypted: i=1; AJvYcCV+JuMAYF8w8lMdML7a81v5/ZOJWDUjwmCWFFw2a9Tao7wnIicWjRfbqkOyyoVMKkBjXjQrTHEDRE2B@vger.kernel.org, AJvYcCXN1izu5FeR6jckyUH6S2RLU3mCq6UL0czMDJHrOEXfdOVgUqToOEJtjKi0Z5iQc9OgvXcrEGpdUwxxcpVD@vger.kernel.org
X-Gm-Message-State: AOJu0YyR10fr45xEFbNSo0a3vzjA1GrI7vZdQXJx8psrD+4cFvcoF4bI
	ab2ks4PjqrWviOpP+WPZslbxaE70kH+B59hIdObSTJF09A1L5/LAI1c2CZEWY2qpVGo=
X-Gm-Gg: ASbGncsMFt192vw1jp7eRrK1If9ttTzNdrECWQ4d/Lela2nzF7W2gf0oCG4yv8i7xeg
	Llk/ghve2yVdJxphZC3vkG9Mwt7TTSrU/DZw72ljcFrJd6OqIFAhHe1G1abPn9s15oWpNUVVq/X
	wznUmTFsAczScPrlJECZpMhuxmQBRYjiEzPQlFBg3MC8JY9v8+Z94Vr9mj5XssD0VgmHjXC6iQi
	mv8IefqCAGAs/3wF3RvRXfVezPo26Hxem0AdoXGdhbGf6+K3y5B5/WeooUkJ1qHoNv7DZeCQu+Q
	iGG/wR05e5UcScrg9TaLMIJ4bcWLhFR9nyseOVGqJOplPrs6F2TeMbO6c8c/ZgjwrmgjysxbAq0
	ut+0Z2QWEUwiDCfW85y6Vp4QEXIh7QPbe
X-Google-Smtp-Source: AGHT+IFUiKnNl30GdhfNxCYOAiZ9HGU/4iYryq74d+ZObbR4A7zt7xbgxw9f42g/yPzCzD/j9KBG2Q==
X-Received: by 2002:a05:6a00:848:b0:772:5d0f:6c9b with SMTP id d2e1a72fcca58-7725d0f6f0cmr23208889b3a.1.1757099452854;
        Fri, 05 Sep 2025 12:10:52 -0700 (PDT)
Received: from archlinux ([179.110.125.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm9102326b3a.9.2025.09.05.12.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 12:10:52 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v1 2/3] dt-bindings: arm: qcom: document x1q board binding
Date: Fri,  5 Sep 2025 19:09:30 +0000
Message-ID: <20250905190931.27481-3-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905190931.27481-1-ghatto404@gmail.com>
References: <20250905190931.27481-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy S20 board, codenamed X1Q,
which is based on the Qualcomm Snapdragon 865 SoC.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 607eee7a1794..335e93a02604 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1077,6 +1077,7 @@ properties:
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
               - samsung,r8q
+              - samsung,x1q
               - sony,pdx203-generic
               - sony,pdx206-generic
               - xiaomi,elish
-- 
2.50.1


