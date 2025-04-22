Return-Path: <linux-arm-msm+bounces-54946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB2A96793
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D65AA1899109
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256BF281352;
	Tue, 22 Apr 2025 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mlPpLfVC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A537280CCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321552; cv=none; b=SVB/NYHEtLkpVay7AQBlj2NOXkAkyrZX0Sr4nH2eCDHPS7ZmtOSFXq9bWcvcv9ZB9FFwWOE712/mOt62g6er6RyR2h2NgfYSgymN2l7iauKMh7ypxD5gryC4gjNOtBvk9gkW2i0JohrDj/a2wDk4g/0HDL5sBo59S7/YYBfLmI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321552; c=relaxed/simple;
	bh=ZFDuP50cM3MaZ7k24hjB0hKAUp2z1/JdcCExNP+BxkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h68sK779L4/GvYm3VbtiN/3uAxdz0VOrqdKClPsFpgaWO9I/PFJSv5qBPMYuMjAc2Hsv/K/BdYsfFk5oP2BIVnyKtwG2VuFE2v838k/QN35ExJqvqSFNuoMyDodPnpbXENHAgbKkSe31lK+0OD2ctFVR7rqcFPFGVWCwXZ5roNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mlPpLfVC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so4565350f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321548; x=1745926348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWRwjTKda8Cr+xTaLfEjNwhn6lD2r3hsck/mBkqRC78=;
        b=mlPpLfVCiSlJjJ57uNkNvxe1RSlCRtZ3r1wXGH8e8b5QSUtIWkZsm6cruZ9pY+ZenM
         dBDL6VLPhizQxaqxNMi5rkOVpuizigdsm9YyIKM8adB9tELEz9M2/E2oPZAaaWKTnuXO
         qmC+QLStMbC2JuCvk6nRiJcXalao3i47qxlH0YIkGj3NnhhVlJsq5tdQj6mH0KPnIJPj
         dtU7B0dvfYkCrvOVW85SKnFukUBDg4bSqtxN4cwTJp9CGvZp5gAzjK/hPU7dI7WyZnxU
         d2ry5zadgGRGbZTI+DVHEde/VzbnkvM/La/YDvktVsQszqR1+coYS06wlrSSyPe21htK
         IWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321548; x=1745926348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWRwjTKda8Cr+xTaLfEjNwhn6lD2r3hsck/mBkqRC78=;
        b=gS2VDT5asb3o3pACAuzzfNaJarn0g/XaNX6UZGDTsDLw++yE06DqPvZ2l2eQEQV13k
         17tSHHG+z668UnMJTNmMCcxGzHV8Dxct80p5TXG/zobkDIpDGBZX9olaF00E7sXSazhv
         SEBcldNHeYphRSnWFs6LFOkQ05ZyA5Q+mu6PfFmkwE7p8nznJtIih64JF2axTzMJ0a6K
         JLAzZfl1i/GU7F3ZQ31oTAcqEkhtgmKSbkrOEfJ4+x5+X5lFz3xT0aKktwKv2hCjp3fI
         z6cRqajgv5Y06PtxVTnQyY+vp3zfVwBEaORRNVa0uhL3izWjz+48xy4Vu2vr3NHzG3T3
         bryA==
X-Forwarded-Encrypted: i=1; AJvYcCUxUJDlHy4vqNGzHS0Z8Rym8svUN58FaDG1sPlGqLvHiCpLJgO7v0OtK9nVwp1cEa6rUunqTFwSdVUgn9x9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd50KyTYzhbO9VTusbQMnRPV4+/A5O6pAV2S720koKE1y39+S8
	VpcBU0lYtswB9H8/0E/nwTSFrxudf5CPOi4vErI3kRb1NwGXtsgTkVHGJFlfZdM=
X-Gm-Gg: ASbGncsF27lYKXaiprH4irEuAKLKdEubdxEtUgMVwdBFNO81Fy+i1PqNYkQAdbizDvf
	LnA4m7RkQSPbPNITz7Hhz7k5KRYGubkqJnmQZC6tm90h0WB20kxsuusm7j/VgIAwqdqcNjHaiZC
	Gssj5ofoz41fYIzTF8vZuCAQIODSdf2BKyYgEHSWRt5VT6u/91O/8NxSASGC4jcfZgSmKYLHDjs
	mMfdxazTXzR+43HjH6KnGD36BTpMYqMCSAfCVDgxgAVRGOjgraQeG/jgw+SGhHL0qPQaFln10u5
	aIe4ZvaoxTG9//hfjGJqSoZWrsNBbOsOdifwU3Lc+AsO81+LGCpE
X-Google-Smtp-Source: AGHT+IEEw44a5vK2IjFWiYA0X0j2siN1vTRb5HOMU7dDGydhv1gxPnFyAxYzd0KC7UUWKC3HvgVANQ==
X-Received: by 2002:a05:6000:4304:b0:39d:724f:a8c1 with SMTP id ffacd0b85a97d-39efbb020a9mr11656442f8f.47.1745321548490;
        Tue, 22 Apr 2025 04:32:28 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:28 -0700 (PDT)
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
Subject: [RFC][PATCH 12/14] kmemdump: coreimage: add panic registration
Date: Tue, 22 Apr 2025 14:31:54 +0300
Message-ID: <20250422113156.575971-13-eugen.hristev@linaro.org>
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

Call panic registration for the core image.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 2144edcc6157..7f3b089b5739 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -5,6 +5,7 @@
 #include <linux/irqnr.h>
 #include <linux/kmemdump.h>
 #include <linux/kmsg_dump.h>
+#include <linux/panic.h>
 #include <linux/utsname.h>
 #include <linux/sched/stat.h>
 #include <linux/vmcore_info.h>
@@ -76,6 +77,7 @@ void register_coreinfo(void)
 
 	kmsg_kmemdump_register();
 	irq_kmemdump_register();
+	panic_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0


