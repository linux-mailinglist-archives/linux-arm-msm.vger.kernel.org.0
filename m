Return-Path: <linux-arm-msm+bounces-82539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B92D7C6FBD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id CA9742F264
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADA936657F;
	Wed, 19 Nov 2025 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZ/ijRdZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BDD3538BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567133; cv=none; b=SVfOTonnYRcyEfwRC7QB0AKXXYQRNlMPCSyr6GLIkgaTNa6ZAovheAC1TwQMK7lyy7X+DOXZJgKgE0Gf3QIlAxryYNjjRAj5CYQLDom1NQpd18xmM6Vf5jFn/Q2Tf4KrNWXWdAnhS0gvtpy4JWFM+7HOmvC+fEkbIohQYYq96vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567133; c=relaxed/simple;
	bh=VU47rRSEpIhBbnpqxo3Mzoi4kyXh9HmEgVPJi/PKKQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOZ69klYB780YuyBSFn2mZQabjBbs/Y7FHvIkU4oFVTBAr6R02EuXakD7KXDEOSera7T2kCJKfhualAsEkxndJHQyg4JMbp2BopsNLNVIeLw1YphSrzIKbTZco2kmYBPywf8MYAo/VBAImxtLKexHMrv56pqsrzNnwEv/N2l7Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XZ/ijRdZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso3706151f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567127; x=1764171927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjfIjN6LzAYPexJPKxlzOegJPOplIDmw8UmBc2QBBmw=;
        b=XZ/ijRdZu5x0OvTVmkMq1wPbsmeKFbLQbYrPafVtvHT+ZqFCKf2Qcp9C1tVp2N/J0D
         knNKJXhbr9JziRTGWFdIQncXLZViZHEaisM6DwHPeG9AVVqt8e5GgvS/eZ6W3CQ/wgNE
         eUAxxuNkPdWWUIiLOxyTbNxpAEDi0zbJRjyi0M/skuHii8wzYx9Fd2XFdKA55bwmURB0
         E/GzFp+ssYwIxqtSwO6ujSuf9arYgXH7dCM0Qa9fwXjuXaTftH8SAdowmnTn83UEVeRo
         Dr6xOSIAlKga7MCQloURP4hs/LnWJvAeIdLWYMQ+WB3ui+rujTltgYm6XmZue5TsfJXv
         q+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567127; x=1764171927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjfIjN6LzAYPexJPKxlzOegJPOplIDmw8UmBc2QBBmw=;
        b=A7eCp+DKr6lEs5OkAJ3PuJYsU0WWHJG10AhGiRd1W133D81vW1x3N9vcsXmJdEhxUy
         +9YZCATfTK4+3sTN0vY1Vp6QwPkl5ujD17sgmYc6qy2VkusUFaVOMYNR7qDTYxZ9BwMl
         B+ulGRu4RzT5gUF9MnkcG2CSPOiPV0dVgplWAZ9LaH1L9NNBFPSrYz7Uz2Bdq+QbiSu7
         /vm7XkRFcL0kNGXS+1esUpzV66meP5W+0F+2w2LL9zPcPQqd6i4Ch+GLq98c9t0Lz9ML
         AoRgl3EJTfyJxnOY1pX0JXNfArZTt8UMXRcfQv56oYcSztieT9t4rdFPDKwUHeMASPh2
         Mufg==
X-Gm-Message-State: AOJu0YwnJweMM2V66b7vhIncAwdoKw3Ee02m1OL4PHgoRXO/lHy19sAO
	+DFv34ofJlhrvjINIPIK+ynKo+vmw+ECgSP1Mcfzj31Vz2MQnjEpc9CKa95nXPGeN/SV3LumRHI
	02n9vlqpeLw==
X-Gm-Gg: ASbGnctq6ab5pJLvlcrRHRWifkBsVNfJE0Rkv0OSYr14FFD+i0xMYKCytCE6/dMNnJy
	hkiBckleXBpjruAQZM0g9nRxZHhB0hDnSRR5DrXF5faWlh8P3n0LOCWKRGA4i7ndXyMBomADDoZ
	eHVdtUfGLRlAVjb90Utkg77+vcxKy/70gQfHTfxZwGJ9PvSBXLPy+wiL8fHmVruYo2tI2zJNfWX
	zJRjYyw5D/DE2kj9B7yr5luSjDKnhd6rb0FiNsikzvUyCMEpN8/RH5+J8ZovXM2OffYqK0oieqR
	82eRJpK/XBGVU12GuammT/aDe7WS5oj6Cf/jO+DjabkzhF/+QB1tZGNkuROEGLizian3v/nLF3F
	rd37l1n2m4PHVXMqGEUu22cj2IKO4f3CtDLyPkdvXLqqWGP5bvo49OampUERzb1QghLArWjKmEt
	nPMctcV4zjyTCyxlAIjtSkLtEg15OpBg==
X-Google-Smtp-Source: AGHT+IEfh56DkbcMOsGMiLrQQwNoxfW0lTNMGX96p1i+gi2+G5lC/DiQdo+bbBRy4PiX1VmL8kOK2Q==
X-Received: by 2002:a05:6000:2a0e:b0:42c:a506:9dbf with SMTP id ffacd0b85a97d-42ca506a058mr10726960f8f.39.1763567127227;
        Wed, 19 Nov 2025 07:45:27 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:26 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 06/26] timers: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:07 +0200
Message-ID: <20251119154427.1033475-7-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into inspection table:
 - jiffies_64

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/time/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 553fa469d7cc..c6adea734b93 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -60,6 +61,7 @@
 __visible u64 jiffies_64 __cacheline_aligned_in_smp = INITIAL_JIFFIES;
 
 EXPORT_SYMBOL(jiffies_64);
+MEMINSPECT_SIMPLE_ENTRY(jiffies_64);
 
 /*
  * The timer wheel has LVL_DEPTH array levels. Each level provides an array of
-- 
2.43.0


