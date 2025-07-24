Return-Path: <linux-arm-msm+bounces-66575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4DB10C87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4219C188DDD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BB62EBBB2;
	Thu, 24 Jul 2025 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hDK8xxre"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172DA2EA737
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365410; cv=none; b=EBwxmLE3CR97DZQ1CojK5cjDlRhVTy8chY092CFK5no1qdCjk07bVZGyb0xkP5YJWxZhzwL8S42lkAS9Z77DZuuQPxgAsMoQAGb5nDWtV44hN74N1rteQX0K22qDl8zFP8Q2ksac8QHZ1jCkp4cHWNrIf4+Fg4hhOR/huqteRfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365410; c=relaxed/simple;
	bh=X7sQWVi2ES5AdRRit9jippI6XjHYlOeEQQ68I6dFb/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzMWwCIiAZ7xD73xa4/Wmqj9VtfWjYlzGhi7maKl0n5GkiNn65bZaB40VsVMujS8+tJqdd2f2tuCNvswrT34UaTNOIdz9GOV1izOvu/mPtxK8I1W2+iDuSyidvkPzcTpqHI/cIUU/m8huKM2M2t3u+Zy1HZgRzGdgaDvYGwnpYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hDK8xxre; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso11044435e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365404; x=1753970204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io4h5WAIvfQT3VZkI4AOHF3Wp3PwROfn1AQPtlUH1DA=;
        b=hDK8xxreujp3pWqlOMBgHmmfxII1+ZylRyCnatQz8Hk0KNv42+sXlYYp46lcSWd523
         4LuB40mwAABhQX7sjVmSidiHpqHylox331Mjz4+Lchqvwum1GNawBGl4vQ57S7M+BsH+
         vZkkP2Mv1RO4CpOAvit+S8EBWTHEIOFr3SehSdTDrky7xm0ndHSqS4Cov+H+OZSN1Q92
         o77CgsrPAOIQ51h59pGKu40MHnFCuMgl6JMJhv6JcB6E3QJZqv1yx31SbUUXPSj0Nv+s
         NwxZaXNRDj4Xckeql1Mrll1FKb64A8a/27wwvKfM9If0OvfszU/UF6rmMUUqGVbUJG/9
         acsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365404; x=1753970204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=io4h5WAIvfQT3VZkI4AOHF3Wp3PwROfn1AQPtlUH1DA=;
        b=JyUp1ofRh3CEazm4qItLlpfhIgi8wlt7BTzjyCBi0mr3Qpch+6YNtaCAV2gJsCc1sK
         iwwDhPbkpuR+XxFfItkaaEfsdUwEsVRLGd6ByvCoko32CkM1ZdpyqQ/G3yZvdpPERZZp
         qj0MfCjjz26fg3zt3AOD8jvnBvIksHkOd+i0FSpAZcCNdFX9GshLUzLpyMbpX3ozFS+B
         dsL06Pw6AHgplnD2xWtRRLWol/C988Q/fjEoeKe/UAxW9E5e0xytV8u8XYYNDAEr//Dj
         GpCF+ZN0+KsZicZnH3Tr9anMTNW1vMSSKAN9/H27kNFt7ogklFM9Jd82gUeSJhLxWAqV
         JJCw==
X-Forwarded-Encrypted: i=1; AJvYcCVBia/1PEZhcsEjIC0mozoIkEZvNVrJGlvwMB1kbkzK/OXOyHDU94oLx6meBMTfzJ3/p6AtxyaUYWDCkjGv@vger.kernel.org
X-Gm-Message-State: AOJu0YxzuHHEMGfOOoo70YwMXGTriawv0QJr6vIrEfXFcaMe8aFMqDNR
	awEUW/sut/NF5amfPYoK5/NM0/4NGY/+BYB16umvknQxo+Tudo+AGkH+o4ns7e9mMls=
X-Gm-Gg: ASbGnctRGlebQi2v1GvOojsDqcNAS9HYto1l8D0Bq2arunPs5ZyWByqUSprmwzfzxgY
	MwuociwVlk2KeiBfBgQM8hMH8JNMY03qmaTn9s+z77MdSQHlcYfSoZ71/yW4jnkevIgorYS0z/d
	v+989QREnylww0KgQurg3Hdrno0EitqvyzaXWH4GVdP1SbDwaCVypFhTMKWhrCPxy6m5kxRm+Y4
	9QVSyat68a6802AJhzv4fn0CCv+NL22bzEgG4yhvY5slolI511/ejbB9sIhc2Gp7z0bK6xH7myI
	gRnMWq96ZRVEdRH+w18FpszvU429Gnqp8n0pPBu5YfkOiH4bBk/6+HGrEMB1pPAej12b9+s7c4B
	rcmEwdm7ZKhJlSehanPDLzihtQCmEBoF/qJXe4j/nQ2HFkQlUu362+iuEFvdq2R7O6N/8mm3J3z
	7x0t6KohgtKds9
X-Google-Smtp-Source: AGHT+IGKgu4NRvfPslcwd+sSrmwQP//isSIOnofkVKYWLLSsjM6dUJOy4a8soeLJ5d7o54vF2kp7ew==
X-Received: by 2002:a05:600c:1c22:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-45868d31a2bmr69596125e9.18.1753365403699;
        Thu, 24 Jul 2025 06:56:43 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:43 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 24/29] kernel/vmcore_info: Register dynamic information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:07 +0300
Message-ID: <20250724135512.518487-25-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register vmcoreinfo information into kmemdump.
Because the size of the info is computed after all entries are being
added, there is no point in registering the whole page, rather, call
the kmemdump registration once everything is in place with the right size.
A second reason is that the vmcoreinfo is added as a region inside
the ELF coreimage note, there is no point in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/vmcore_info.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index e066d31d08f8..d808c5e67f35 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/kmemdump.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -227,6 +228,8 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_VMCOREINFO,
+			     (void *)vmcoreinfo_data, vmcoreinfo_size);
 	return 0;
 }
 
-- 
2.43.0


