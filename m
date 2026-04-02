Return-Path: <linux-arm-msm+bounces-101411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEYCN2nazWmliQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 04:54:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAE0382DE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 04:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E949F300692F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 02:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0895234EF08;
	Thu,  2 Apr 2026 02:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQO/zxZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E600E335562
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 02:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098465; cv=none; b=nwWLR5yjFxWz2UBOwj3nVQuVnJbm+kgHnOpNaVP7uqV+zzkyKhk+o5WQzp7fN98m5962j1nH9imrMGakShV/pxneei4L74/OzCGPf/t00QLlOpPveQAD2awhs8ZyBmTqEJV8wQ2zqW27TAQ1cGSpiH6sZvoyXZSp5tuSXYRZ/+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098465; c=relaxed/simple;
	bh=Y9HeYqp2YKkuGvR76szlppb+czL55bb43Vv2WFkSYbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hYBx+Cm0jw6feqfu7t0VZNsbc/IFtqCaSJPduOGBkp0fphUDv3oZvkFaazrqlVBY5I6yN4cQTU4DyGmZ65Kuh91oL2XwMs/kCtviyrqepEjy96BsN9Q0uTuAAgMXBv6syImPkAKfbOcVa1Fkf7Nu4x+BFL2Kkj861etS0Hf2a+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQO/zxZS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b23f90f53aso3498155ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 19:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775098464; x=1775703264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5sr9v7Zuu9iHxuJmTHoD9xVEpDewDxOWpTSIoGG5k0=;
        b=lQO/zxZSCxdD5vMlyZOnqaCHABxNry3oFJ81fAFlnYz0PN8j9LUkcDaeCTlOdE3lRV
         2SPz/TY3WCijeMRQJDIh+GIRIXYFPQuuyq64apdYu5wxMHVJXj2FSiAHQZp40hbqA6cw
         9zeXQQlzslFY9Ugm6BGIvFDQ3MPXid+z5KffQjv4zQpUc8iQ0m+WUakDrp5osc1xQacy
         Mk5ZMQC6j9eOwlr8umRqnEndMRlGDMEVCWQO/6rrnv2FJI5TzpvZZKUQyNBUKuVmUC9G
         pZfT9XW8tPccGH3jehcBkFFTiHxxa+Q2yl/jyXRIOC22XbpJGstJEa9EMjwrsZIlPF2r
         FjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775098464; x=1775703264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5sr9v7Zuu9iHxuJmTHoD9xVEpDewDxOWpTSIoGG5k0=;
        b=ovg5mPKFPGmDcqRP7G8j0HGW4AsLBUEtVnbmp9eRIwI7naZe7DVLqKKJGjsqu+fZ5V
         968XznHXDGcaVgX3ZIqQXzMi+WbUd6CUGGktdoWZZRnlzUU5fU3R416Rde4z6MK7ODwQ
         9llHunUBRUUiJ1oUHw106iI1H0RPi9V7uJ9zVaXPuZp+KJydC9h9XPFESxyW5B05QDyH
         obUJbNC5KpsC2pv8Exy1eSCOdYo0RqkXBK3+oDRnX3MiAs9CJTm5rfDfx+COjlWZjFnq
         3pLg/5J7kN8CWIuDwPEakw3q1xv5DzX2w57wIylicRV+bSjgrl7CIJeNjxzxjazfx8J8
         SaNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWftVz+SVvdNpfa4uGn8VVRbo2rUWYfOBCSokF3Q0Y43eyuVYkYs2l/NWVCKkk3K1Y5wrdIK1wL03xHy5Se@vger.kernel.org
X-Gm-Message-State: AOJu0YwiJYLQSsrxdL6TEaPVB2c9cl/JbV9k1fd3+/Qc2CrIJ1q9MGwf
	oDw0YrqHy1nIVujVddA7M5vPx/0iyJltORioc86EzWZHuV9qDllt7vNR
X-Gm-Gg: ATEYQzyVfd5D6YqmW1Cvu8EjpRFwxbDKuUJE9GBTlFKKf0q2XmVD7K82tBMIWC1WR1k
	0KTNQ62cxYOlZBBa0O/MZPA4LVINkRNpgP3Avpr4yLHuPrfmatddDOxu17DKa8Xk4++9+tKDpRS
	OtD+TM/gQ2fhB3guQYmt1wTBS6WIeYuWaam62eGxytEQ3225HDW9CtvatGGBwwHu+uxjn/2rc58
	ImULTW9wfQi8E+Ax3AYL4irE10ei+glCOBFPYu1dw2JdzAo/dfxrgQm68D7EIIYIJh891mlio2Y
	Xpo5zHOItqeuSQHRho6yUTR0jqAsOhIpn2WKTPICV9WfxIOMhs5gPL3PqPAd/VS51Udb9iQXpIq
	3EOZ4AOi6WzXhf9QuGtIoJ9JQ/GCSntbWEMSckGyPNkvPdvf/ruLu4ajHQWE0K3YvNVMhrLX434
	hi8i3VoUo3cgiNr9xzbncwF5Fo3GMhk0Qz66fpR4Jh0C3ybb2lEr9OG5YObHO3ki38kA==
X-Received: by 2002:a17:903:2b0c:b0:2b2:4697:78f4 with SMTP id d9443c01a7336-2b269cffbfbmr60342125ad.31.1775098464152;
        Wed, 01 Apr 2026 19:54:24 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749793b9sm10875345ad.48.2026.04.01.19.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:54:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pmdomain: qcom: cpr: add COMPILE_TEST support
Date: Wed,  1 Apr 2026 19:54:06 -0700
Message-ID: <20260402025406.94272-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101411-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CBAE0382DE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allows the buildbots to build the driver on other platforms. There's
nothing special arch specific thing going on here.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pmdomain/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/qcom/Kconfig b/drivers/pmdomain/qcom/Kconfig
index 3d3948eabef0..72cbcfe7a0c9 100644
--- a/drivers/pmdomain/qcom/Kconfig
+++ b/drivers/pmdomain/qcom/Kconfig
@@ -3,7 +3,7 @@ menu "Qualcomm PM Domains"
 
 config QCOM_CPR
 	tristate "QCOM Core Power Reduction (CPR) support"
-	depends on ARCH_QCOM && HAS_IOMEM
+	depends on (ARCH_QCOM || COMPILE_TEST) && HAS_IOMEM
 	select PM_OPP
 	select REGMAP
 	help
-- 
2.53.0


