Return-Path: <linux-arm-msm+bounces-84007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD71C987FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 18:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C905D4E235C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 17:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA43337BAA;
	Mon,  1 Dec 2025 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCxTMZ8O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEAB337BBC
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 17:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609758; cv=none; b=AXdxZAMsYVMXhQFYbAF+lU6VBbS6aHBK4X3FjM1WQE2qQ+IQUGHtn/svB/coKwDaTeQz0Qdm/0bitvRLr/LVLJiwV9vL5iI3qs61T/l/KAtGMu5ZunGHAicmMeDTlUuE/uoQ0RFzRVH9b8s4aXxQNN64lGeJBIobc7Y0TeY3Rg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609758; c=relaxed/simple;
	bh=zfksRdzqKJhRlSNkDPTjQcTPNmX+bLOPlYzuDXVDI+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VlIM/uWdsUso3g/vGhpmbUuNv9j/efdkaAEtRjj4BfB7Mea/5h6l5dBtMPvuWC1fRFbGxmLCg6CSLxTgIfZ2Csv06HyCZ1Eq1+lUqQMYCniU4mBvJwTlPTYKEygDU8qhe5z0aY5kjpbI9uMM0iTLzWrvRn7tE9b2U58wQ+RS5Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCxTMZ8O; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29555b384acso50298155ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764609756; x=1765214556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKekkA7djcC5xOnYLDnvST4x7vzTTfMx0HGr2gLWVgw=;
        b=RCxTMZ8O20ssgTKE+0sI3c3NqN9uvo9j4QrLthJKyuRGCCq37+nfQeTr47yJrLrvRj
         EtHV17cxqOoazmmkS8M3YPYsCqLLnXg7ZLTqPrnZ8qL+Qq2wc5lbwmTZA8oa7ucBc02V
         qgeR3+VG1hHdEPSvAcMjsgaMZtF1LparWnt3Fz0x2QH0lP3VBdAQWA/CVOUQV1ZpHV01
         U6a9y5wU+qHSWOE2UtXO8WHEI8kzmp6uYh7gbs7HDj5yGihKiF9LyyuRqxMUI6mUxmKl
         PRwvov9cfmxvhD99Zlnn95K+IbugZ+h3AfV/RLjkR0TFWN4PbjMlji2W+ybcavTsA1Sz
         wHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764609756; x=1765214556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mKekkA7djcC5xOnYLDnvST4x7vzTTfMx0HGr2gLWVgw=;
        b=EDPYeHfeO8u2dXy6Gx4MFK+AqtJOujRCZVoddNXmplHN8BcQH1+Fqqfg4sX+7fVDWg
         T+Rfiylyfap2YRHrq6Zhth+XhomHl98Hw+UTODWEOgaz10tfCX3KYaKK3G15O9RmfL9C
         axGUcNCDsAHZAOoIjs4SfX6p6IluaMrXX+7WL/6PE3YQRiO/ct5Nm5MwLVZiHXdMzpVP
         fTHHfunJ/RiB/BKYSqNI/jI5aQL7UZRt19jkX2XWwI0Lx+oMfrdrct5GF1m/45mxwLqi
         6RSSnLf3TbS436mcRG77vLubPlZV4xh/hAt1igxWp18LGZ9lfIjlIh1nevpebQXlQs95
         +4vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTIwhPH8CFvL4au531l0KIszC9w4Igt6ipZPEFlF1T+O3PnX3U+3SJ5QlYKyWqmqSwJQtfJQWpZaqQ43t/@vger.kernel.org
X-Gm-Message-State: AOJu0YzZJ9sh+v16WVuV/blFPYeuAj45xkBEabZgnJp37ils3Tz9HAsw
	zNKSZD7BDj3gzzd29l3JEdul52tsnBIruOig9JbTGsEdbuI1VpRRANUN
X-Gm-Gg: ASbGncvjapaOVfv8oBveY9JxAP9tVoWFZz3C1H0SLuWTExjZwetg1uaYW2ZM6XAx2O0
	qYYSMTeB2YBb4MsODBkOTMkbhikm3UzyhDF4vSxnHcV8CUpqJxUFd5QXiVMSjUsWk0jL6HrVsc+
	3VvPR0mqJ5Lw+YarIhTQKsgC2FvbgShzLd07jvXPOnka8Hkt3VtKupygyW+PLnpUTXFmEN08GsD
	7OjduNKgEU/0oyExp/8aswtiKhFtu5j4i8zuhmeQ1A0G8v+PRYLeKCc3IEU8FegKOfk9AzNPfAW
	9D1fXLG33xM25LF2Zgmppsp/9cIn4BeEvq6/XL9c0eFfd2xQciAYeufVOT+kh4B5aGe+ycpxMJA
	X3Kk/Me6P44TmvO1m3H8cdgVhfdSPRA6GXapw5WNSpMPGK89fNrcgWL5lpOYkEoxl3kFVhAGpGR
	j9Iplu7Yluz3JZQ82+UriBBI5ra/+IknPqaHMY
X-Google-Smtp-Source: AGHT+IHajsBE9M5OfPzzEsueEtGU300FnJa+0lw+s+UauElhRmmhmgyjHyw31TaW7ZR7NzYoMwasRg==
X-Received: by 2002:a17:903:1a06:b0:297:db6a:a82f with SMTP id d9443c01a7336-29b6c5088ccmr450628295ad.24.1764609756453;
        Mon, 01 Dec 2025 09:22:36 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce44270dsm129876935ad.34.2025.12.01.09.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 09:22:36 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/2] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Mon,  1 Dec 2025 22:52:21 +0530
Message-Id: <20251201172222.3764933-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201172222.3764933-1-tessolveupstream@gmail.com>
References: <20251201172222.3764933-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0a3222d6f368..a323be3d2ba2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -862,6 +862,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1


