Return-Path: <linux-arm-msm+bounces-54942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7083A9678A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23B893B55D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29FC27EC67;
	Tue, 22 Apr 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IamtvFXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A3127CCE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321545; cv=none; b=lAUBDF6Dime0eQnFZbh6oDvZhembaRW49VPEGtPCEPo0NPpgLQhaOGw0qejxnIPxpYMfzTK79mzTYsk2hViCRdSBE2tIitn4x2vEAVK5QCzwpA7pbBdt+7TOntBt+5BznFawowBzaiqpe+GWmlGq8DQRD01OlCfJI8whWjaVHVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321545; c=relaxed/simple;
	bh=wGYGREPgrxi6WuzAXr5LbOApUa1Ex4cOowBsxUMIXVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFUq8PfGRXnuzF2PBjqF6iIScpxpJmZUbFyVP2jP4ZGm9WC0UW1SpEbt4ugW3dpXsEtQ4FsZlFOQCme3Dvt33ZbwIdypYAwRczJt/uONrMzNO2/rO2kH2pVu5OOxzU2xo25sKGk2+tX7SfxMUrMNDD2Xnce1NkOaDbt8tzOLfTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IamtvFXD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edb40f357so37460615e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321542; x=1745926342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DfqYDfj9raOo/s9JE1ASnrO01HBkLknRT/HL1x4c2o=;
        b=IamtvFXD+wdFthUWDRSiliOjHGYC9PqLspv1fhcZRRAKqJK0k8LBjTQFzAphR+ACBz
         ghvZ/VMaWs860Quxp9rJ788LLoTyCZPufq1d8GnnTjt12rkB4IVKOTtxCZjObU3BBHM6
         XsuW013G09Tcmtd+nLAEgApcDnr9QyYV0DvQKZhL5eSjS+g5iEwbwI3d9mqOPVgED3aj
         o4BoGoilravyQDy4tE6TWWwXdOPgiks6LajKBypxz8kPxZAA+w7NMJd5lRwuYdsjShgS
         4Ue+cf+8Ye3nrnBzfICjvxz1gdJ5u5Z7yU6xb5+tP952NzBlgWDihigpbaeVUjizQuWu
         0KAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321542; x=1745926342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DfqYDfj9raOo/s9JE1ASnrO01HBkLknRT/HL1x4c2o=;
        b=A60UC9mifpCeMyrT1xoGmWYoSziCL0dDn3hBKVxYc/0LlqRSF01HesWigwUqGoiHSb
         1dui6s1gjGNPtsvqD3VtzItk2mJg1+K3djTEhAT8QZURMb2wVTJtzBLWgn2navoGmffj
         BcZvMz4xIftfdoPViocz/SFebyyJeELvQ66sl/xRlGG9WHOOs61I/uMP5sF2brBW5Gk2
         35sNqqtx9zEladVSuqFMW9XHOxECz8HUm0zUFntVO/99iojiV5Rlx/XmlXQ4GLsWXktc
         vrbJLZNzl2MEc5+L5Ctkconk6hPtZW8VF9VslbKzikRysfHEinW67YMXPs8WaxTnpkjp
         sZYg==
X-Forwarded-Encrypted: i=1; AJvYcCXkFSxOvKLI1Eg62bD80hBWNcbx4TGmVb9LvQYit3AJ8BNTgq1YObKmDlmdxxw6HUyLTqhnhoInCDcWbrw/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+UuBNPqmfU4s0tCQYX7D2NsBAedpXGzp90rCxylIcQDPU/3Gz
	aJ45fetv2urAlYZ2AO8HMQYMqMYaFh8m9oI5l6HJGNNK9/Cppldl0EdONu8pSJA=
X-Gm-Gg: ASbGncsV5soWxSSuSiN7te5kIk/4XgWlwhuGT8U/2rvwXfvwvN+bp/XJ5ATAqIpvHbQ
	XrzksSIdrqJLEEHfbatDr2Taw2VmsYrcbQ/bTr7dmEjjSnoznbDgIc1ihPuPYlgoGWEfWyHAX+u
	YI6TEHjMSYyYZfDuFoRR+xz61HhzTe5AfavM1EfXbvS1FUCzVE7NkK+FlsqJ/ozF5wD4oKBQp9U
	9UCRdyci31lXfolRJQPUjUCCLbHjEaGrRybv8Ha3wJhBDXUGdK99L27DYmk34DfoNprPayfZTw2
	Z60k88r3DYwBHYqw4zWtDW7BfYN8NWyAdw1Xev2xuloqulflu//K
X-Google-Smtp-Source: AGHT+IHQ0JeqIGFr8hzfLBxr8juIP8XPWd5UgKDKwG2qIdIH6DudpvZkIFykrGXg9swWfTEAHGdAgw==
X-Received: by 2002:a05:600c:1c8f:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-4406ac21897mr105942885e9.33.1745321542268;
        Tue, 22 Apr 2025 04:32:22 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:21 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 08/14] kmemdump: coreimage: add kmsg registration
Date: Tue, 22 Apr 2025 14:31:50 +0300
Message-ID: <20250422113156.575971-9-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register log buffer into kmemdump coreimage

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 59630adf5dd2..077b65cae4cb 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -3,6 +3,7 @@
 #include <linux/init.h>
 #include <linux/elfcore.h>
 #include <linux/kmemdump.h>
+#include <linux/kmsg_dump.h>
 #include <linux/utsname.h>
 #include <linux/sched/stat.h>
 #include <linux/vmcore_info.h>
@@ -71,6 +72,8 @@ void register_coreinfo(void)
 			  sizeof(cpumask_t));
 	kmemdump_register("jiffies", (void *)&jiffies_64,
 			  sizeof(jiffies_64));
+
+	kmsg_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0


