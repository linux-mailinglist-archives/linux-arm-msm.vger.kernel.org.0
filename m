Return-Path: <linux-arm-msm+bounces-76471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924FBC6453
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0137A188CFA8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C531A2BEC2B;
	Wed,  8 Oct 2025 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQWqA5uC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3552C0F7D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947680; cv=none; b=n9F3unF0hFl9ezU4IL0Q5UXUO4hTVmY4XKxVnpYm/vbnixY+cynFHJJHvdR32hZO4o4tPGtyeFD/o4G3bQkxFZSwNbyO4Pvkksybzb1gYuwrAZfUbbDIPRXEBrM6hutNMmNLDnkDCmYF/rljkSCf1wmRInrCbZDpynq0rQxzZyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947680; c=relaxed/simple;
	bh=p280qPQj27zEghzXtASKe/5ZJm4NWAcJ5opk5rxq8ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozOoI6MrTNAzzoifLYDuIHaD0tNjTrY7qHhWamUs4q1HLYgJSyScRWB6OB6xnwP9Jk5qwFDPoqsVtjcolYFb892VHkY0Hl1nZ+0p9htYqyvZOlrh1mbtWw2n3wTLvaQms3ZacpNIMhmCGGpWjC07kzjTYGH3vMINYFugRMpQxMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQWqA5uC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-579d7104c37so179481e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759947676; x=1760552476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpsQ648q3C0xKugj4mrt9FABQZLoyanw2vv+wH0Qsz0=;
        b=CQWqA5uCO6YrLJLyD5Ag8Q3OCQsbBEifreaWauVDNzX2aEBC836ib+3SnmlWYT3fCK
         y4834jY40lwR1p+j4LU5WfmvW1InKuq+iFaPHf9RUBTjYxq7/fWnLgPdvBDbOvrK2Yci
         dP7cqHTWkkswyjeIZVHA+p4skXJxjHZJRVURZ0t1Vyi23GD8XBUQI/u90teQW31uqpnC
         HrE5Vo+y3UF5wM7fRoXAMYZcq/M91mqibD3DME1NJpCsXqnN92PxnsL38YlFBtjWZGV5
         8xekXeCXLnLU+WVzwORjkk7fOid+I18nUpTBs7o83SIhHUAAT7p3HDOekxzAfdq+E620
         ferQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759947676; x=1760552476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpsQ648q3C0xKugj4mrt9FABQZLoyanw2vv+wH0Qsz0=;
        b=kLONm2uUzowGKHV8XB0Wtws7bZWsFZcUqGDJ4gPpSmYUC3M06ykaQdt3DEeygrVG5H
         TjffKpOxso9jsn2ulgGFEmDIwaWP1jITa3hKIJOxPkFMrRCKtDwXw/GwFHAQ4jNUCRF2
         H/L/AdvC4wqWYe/nN/brwFlzwlefg9OJL/ogkUFc9eM8FDvxirKyPaiDgJiJ7xRValrU
         Ks4kgZRzOf5mUv2f9ukKxDEMdDJQB3yV4I+LzQmLTXPD8QhjOMyHdGGym6RI0IE13M0o
         l4nurhNpmyh8+/1rS1KQxImOiZDIBm401jxUlLpOJ9An11YOqh8JuEf3xcllq8DOWrMg
         rLzg==
X-Forwarded-Encrypted: i=1; AJvYcCXR+4negmsytVWrM7q9tNYnpg1B5IczwWMPB6JrrQmnrN9rqLM5n+8R2lG9OjsEYI+KT2eReIAw8xjhY9qz@vger.kernel.org
X-Gm-Message-State: AOJu0YzUgz3VcZLrWuZyW0FgbrN+fUUqzRwbgsrbKA6oXs8YsjiFffUR
	QyKlakfiJhQsMf4/nojBSmRpmI+dmT4syz2/OpPtTZy3UT7g//MGvsuH
X-Gm-Gg: ASbGncstUGlmkRlBbLH8AgOnLhe96PXtQ7PiCZRBXXdTwRm8DrEUuufrbsflRTuPMdv
	TEGq+INJRFMyaB6UtEpp1uJMR5B4bwJfKpRMv8aJqe2G919jrYvT7Gglqn9QqCjx8xLemcNQTGr
	vX/+pEIvJMunCHi7kfPxSIYkLA0+tR0Rz90XOGNZ2BAargHfcVxjQrRJ6nbtZ4cqIXODk0Bg5AM
	Mgk0ZhCcrGV8nF7TNLZ1vMAoinDVRnomZ/uxCsFOOFIFyliT1J2nH89hpjBq9Dy93alGrCoEen1
	Sw7AP0Qvh33lIxPCs6c096qvol1T3UXQyh3yuT/H869CVdoNJQLF3eGKJ9fjwwYoquFjcd/O6X/
	kOJZOOtBV2gGdl1S6WqNZONGdSOeL+Z/azFhSG6iVwZPu
X-Google-Smtp-Source: AGHT+IGBB7GaBBYuVPaybijJfuURxVJRXTNlNl7L4zMNhDPdwFslzUyqDTqQRf8bzBEjERm8JtK7mg==
X-Received: by 2002:a05:6512:1302:b0:58a:ff9c:d107 with SMTP id 2adb3069b0e04-5906dafc4eemr1434243e87.51.1759947675777;
        Wed, 08 Oct 2025 11:21:15 -0700 (PDT)
Received: from crusty-box ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb1268sm223930e87.90.2025.10.08.11.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:21:15 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
Date: Wed,  8 Oct 2025 21:20:19 +0300
Message-ID: <20251008182106.217340-2-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008182106.217340-1-xerikasxx@gmail.com>
References: <20251008182106.217340-1-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Asus ZenFone 2 Laser/Selfie (1080p)

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..1ad77a68fc11 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -88,6 +88,7 @@ properties:
 
       - items:
           - enum:
+              - asus,z00t
               - huawei,kiwi
               - longcheer,l9100
               - samsung,a7
-- 
2.51.0


