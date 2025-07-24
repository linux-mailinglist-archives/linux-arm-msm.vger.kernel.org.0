Return-Path: <linux-arm-msm+bounces-66579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F2B10CA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAFEE586A98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5B92EACE0;
	Thu, 24 Jul 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+yP+DjN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B4C2E041A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365412; cv=none; b=P16c/jpizVzn/3vRtva0m2nQ1XsnZxfObv9hdgrx3wwfvCAf9in9xeNdP1IKfvGr66RKxV+jhQisbOJEX49SSdKYhhH+C/U3com90UmZJMZ9vcd1qA7GXXw+ldRbef/Tq/uxWku4XmfFPe1no2ZMEHz6Xw94PHhNADiGyMf89W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365412; c=relaxed/simple;
	bh=SQxu0R+MOijEBbbV34mwRJA/GN24qy3N7mFo2kprDqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCpfrfe2i6F+1PsM8nHYWSddz+dQnlYzbsYT/wHpLSB53ldGhenJDVuKdwY4cgPtKJs3OXyoBdwnNuWLMwv6VS0QrpVK1VOffI+418CDz4v5w6D1Nw1IF4CayjwMhJ72sHt/drUExK2OPyAXOaVGnGy60U61mvRLCkWnlNAOKpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+yP+DjN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so7764985e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365407; x=1753970207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVVaZTfA71hNG0BSuf2xrM/AfoVAw+w3Csdp+8nmO5Q=;
        b=V+yP+DjNiFBdmZX0+X+1GT/0jSDVJQdpQWqF0ppRaNQzc49toUn7rWNbIPLNzBTV3v
         wNWkiexWDjY63ikTVsoU/ILyqacQjZ8QacKphScsC4/f5U/YePpcxYSjHSY+u+V5+Ltx
         sskxvykF7Bu6ijU8AFPBb6/AO6OoNgxwzH9F4MeY4v26sSuSak4sPl62uaKzjx8DkVRd
         jLbvBD4ef/mS8ygVvLqsdORg8bSZCWfz5Gmfn7oatkWV7HvTa84xItdTnRbb2envSyQ9
         LHRe94Xf+/ggX86LXMsDhr6R4dQIHDZ2xL7nhc31q42I1RLqBZCiOXI8TCGbKrwR9TTW
         712A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365407; x=1753970207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVVaZTfA71hNG0BSuf2xrM/AfoVAw+w3Csdp+8nmO5Q=;
        b=hYFKgdcxMlRd4hqrz81EcgQoq/ylhai+vbhf1/BYZJj8iRlNnmuzv3E+OKs+yry4HO
         UV7T4+qKFFKdh00YurRJpkcPKkLTb2OdU9w3T3VIduRjHzWKhA4YBhceCN2X2hbpMv6h
         LiYMC0OW89ayxreHSNwti707dyA/aZHXdB1PBOwHa4HMLcbWlCc5m9Gxcm/kHdXyVVyx
         YrFG2bSAzQkbnyYryMtMTAMSiOvhYBlX4teCkLojCijDcDAqvU4agq+WHhOjZ6whiaJb
         QyKk6tkg0+mnF8xxe5OXFJtDQdsEkmY+gK/OiQeWTJQ2donnWVLeQoulifKWrImDs9TI
         /bNg==
X-Forwarded-Encrypted: i=1; AJvYcCWIkHpB38jnbuuTsc7IuEtT6+0tqPnEzKfOIubGIhJNcpJ84zJoyn5srFrhZzvbHrpJ9IoxNnCG4S8d49a0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7/sWqGeEO7nB8rd+j0S5F20X+U8HN3BslEGcQRZwCxDT+HQlb
	l1DXwNL5lgEOW7xsR5JLWC8B3ruoqX8RakVgNbgOp+4UHRxvkens6bFzf6nkZhfpuDzYjOyCa9q
	xKRua+ZE=
X-Gm-Gg: ASbGncvpX95WpUD/lkAmV7Aej6FjDDYp3xxlzGY5OP3w6laPWNla+PP1DXKeU3fLuS6
	R3sL8IDpFRkQsTX13/CvosmyMP+OGSg5AvUMaEFdPdGEo4TchUYKLbxWCkmXe+U0L5azXwWV1Cf
	IujaUBU9aChselMcmkcXRqsRbD3HKSDLEdANSC6OkDOkIXn/roSLrkqxMsysuhbVL3h67gX5baL
	cUm0ohhUPh+Jp9VqRps6inbSCLbvHK+pz7uiszKi+BvRw7Dli3pQJN+2mXNW4EgdK4P8XSQQeH4
	lOQQ4TeJVkBAshvLUAOt5Zpzrkd6ltUpZ/flnDR1No7tC11zhLqzdJ9A7sNi3+j/M/VKs9WuLoV
	dfEWNbA56n70zM+3/g7akSeuayNfD3OdXvzc105tl8e7kpnSd7p4HtlACcvZKy/pxt4mzij3WLA
	RRE3TNA6L/LfxN
X-Google-Smtp-Source: AGHT+IEY/sSxRS3Okztem0YstmxIRhVbZi0Ba2eKMOhhVazzTllUuYgXqZyOH8eoFni3mxJ7gmSmCg==
X-Received: by 2002:a05:600c:630f:b0:456:2bac:8f8 with SMTP id 5b1f17b1804b1-45868d485b0mr79331075e9.16.1753365407522;
        Thu, 24 Jul 2025 06:56:47 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:47 -0700 (PDT)
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
Subject: [RFC][PATCH v2 28/29] mm/init-mm: Annotate additional information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:11 +0300
Message-ID: <20250724135512.518487-29-eugen.hristev@linaro.org>
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

Annotate additional static information into kmemdump:
 - _sinittext
 - _einittext
 - _end
 - _text
 - _stext
 - _etext
 - swapper_pg_dir

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/init-mm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 2dbbaf640cf4..01ff91f35b23 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -20,6 +20,13 @@
 
 const struct vm_operations_struct vma_dummy_vm_ops;
 
+KMEMDUMP_VAR_CORE(_sinittext, sizeof(void *));
+KMEMDUMP_VAR_CORE(_einittext, sizeof(void *));
+KMEMDUMP_VAR_CORE(_end, sizeof(void *));
+KMEMDUMP_VAR_CORE(_text, sizeof(void *));
+KMEMDUMP_VAR_CORE(_stext, sizeof(void *));
+KMEMDUMP_VAR_CORE(_etext, sizeof(void *));
+
 /*
  * For dynamically allocated mm_structs, there is a dynamically sized cpumask
  * at the end of the structure, the size of which depends on the maximum CPU
@@ -51,6 +58,7 @@ struct mm_struct init_mm = {
 
 KMEMDUMP_VAR_CORE(init_mm, sizeof(init_mm));
 KMEMDUMP_VAR_CORE_NAMED(init_mm_pgd, init_mm.pgd, sizeof(*init_mm.pgd));
+KMEMDUMP_VAR_CORE(swapper_pg_dir, sizeof(&swapper_pg_dir));
 
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
-- 
2.43.0


