Return-Path: <linux-arm-msm+bounces-82538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE02C6FDB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BEC904FD241
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8303358D22;
	Wed, 19 Nov 2025 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POzM0FwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DB32EB847
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567131; cv=none; b=Ay1E/gCeQnsU/X2MHk57gNXIRjFZKFkYt+wjyXimtQmJfpxyeNaRXOq0yO3lOXVKPZ7iDrUphwqG+9HzwSjcTIcjoTn9EsuyytZuvzHKiufxu7N4tXQnmocHFbsmo0c014k4Stn3R4xz0ZJ2dRU43TArD5/AwlisfQmayMyWgu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567131; c=relaxed/simple;
	bh=uHw2K4abduiDzGpZ4eX0j1eSGliuYPoG3xQUhEMZuY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCkIi4CqV61qKcoPmGalZJK1iJ7c6r5gaiCnjpGlQmsXhQEPFhuDYyFKH3yBp5aEF5Tnd8AXFFqGoh23vkIDEPVuY4HtXoDgFY1nBfP+MX4lRO/X2W/SSTNNdak01zLAIJzm8wmkNhVK/6+6JEECOnNSYis04iINCOff6TDL5gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POzM0FwJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso5104989f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567125; x=1764171925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3irtgR9V6ILkzi6aCmzqNOzM4wzsrVUTWgR/+hcFNWM=;
        b=POzM0FwJqd/SdL87jP2GMAUIGjXey4fOCpL7ccvdQFlLBGoh6TpPgeAOPAXKPy3rC6
         2f3BvlcDX4lGoOR84lem+RbdtLt8RPGa2tbgMBuPxaKNO9opaYqdf80cop3Q/VowQgGH
         YYkotKtpK0JABL5JcU1bH7o5RsJIPKV6mp4ED0W7ecl9GKcdZ79YCxbL0muGEPLcKqMz
         V6THVAxGDvUJThgal+ibL1TYjlGAVALilt5bF29kE3NJAqCBjI75PkcU1CeyuwyN4uq4
         O4kcmlKLnYIOJl89JsWU9g848fXyvYpsKSEPvVHwlzHnJpQY5MTIgruFA6oe0bBx7Hqs
         kNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567125; x=1764171925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3irtgR9V6ILkzi6aCmzqNOzM4wzsrVUTWgR/+hcFNWM=;
        b=t0YMhuuVbUhWF7brtQiJFECb80g7e/SL8JnYC+YN559juk+M97ufgsXvGxlc2lmAKb
         hZYThgMA8vj3F3u4FteR7S98Z/+7idBUsdrRYpc4wlBzu1tQwuteB1wZgZZopkcJNhr4
         HnYM8PT1pnnqNw23d6MAXeXpNBbvmk+/Kw/cHY0k5px8oQrDBI/eCcy8Ge1iD6in5DAI
         9qX0p0xnwWHLZzKioqBSosmld66GkK8jmBoZnZQdwexi6j4kw1xbPHOpwCPZVGiFPQY1
         nPQbepigiNOj55eHHl/8OQv5URKaXyBRy0pmdk/JAYSFRYtleT+cokRKzFl9SB/MQkDa
         aVfg==
X-Gm-Message-State: AOJu0YzFmcMQDmcg8OYA1kMcCzqcg+X5wVE2f/d5PC0yR5nr8pRKq3bA
	zR3ciX9n2ON91t4rUrtRj01UXp7ArNiY4MOLbEHEIwF6S6vc8h+QrPRLMvUb/trfDynzFJuxG/Q
	yXEjSVugLzA==
X-Gm-Gg: ASbGncueZh+Q2oQJC5kPdd7KjgP9LXSnKGkIEdEtanAekWOIM3HvaY7WrGXFJjJDJ5z
	ejfqPfoD6iRfwUpI9pOM/VVJDmv4dj98WUDfZYD3eqcnO17pYLUkmi1GFfRUHfbCLDetfuWYXxx
	S8U2qKt25LeihhYUFSEdlJvQduL2AaeYSkrzFvmT9/4we4eZzckCxSuAVYtOgKZgAArbspAuBpB
	QGalnDHmiE4/WJNAQu8OOYuLvlpAN5NNKB+nJSJvGvjbVqBEubVnmnVxW2cwJttYh5DvBzFW8Ps
	btonkxP6V8jlF1fXAWXTvudodAOhXBIKlfvUilZIEICUFNmOzeg8w+REIMU8ghUWTBtD/WyjpZy
	DkcRU/sPDOBaF2nzhv1OrwbdkCOTFtSomEaywkFOFLQ46LX3dcQrrNR15IdQ6NbM71/rq47WUSs
	4apH5WEWVx6LEFpTy0YUc29vlWEUlWTg==
X-Google-Smtp-Source: AGHT+IH7OiMHuWdKqmUscjGj0hpAhy0+8U72IgAGXn7ATooehRTT7HxTJk0qp9VlE6dzqjBsHdcltA==
X-Received: by 2002:a05:6000:2901:b0:42b:3e60:18cd with SMTP id ffacd0b85a97d-42b5933dfdemr19022522f8f.11.1763567125510;
        Wed, 19 Nov 2025 07:45:25 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:25 -0800 (PST)
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
Subject: [PATCH 05/26] genirq/irqdesc: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:06 +0200
Message-ID: <20251119154427.1033475-6-eugen.hristev@linaro.org>
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
 - nr_irqs

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/irq/irqdesc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index db714d3014b5..89538324a95a 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -16,6 +16,7 @@
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
 #include <linux/string_choices.h>
+#include <linux/meminspect.h>
 
 #include "internals.h"
 
@@ -140,6 +141,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 }
 
 static unsigned int nr_irqs = NR_IRQS;
+MEMINSPECT_SIMPLE_ENTRY(nr_irqs);
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.
-- 
2.43.0


