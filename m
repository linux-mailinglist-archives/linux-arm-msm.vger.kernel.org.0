Return-Path: <linux-arm-msm+bounces-66326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E99F9B0F518
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BB351CC179D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1227D2E54D9;
	Wed, 23 Jul 2025 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3V+cuQLA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF8E2DEA89
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753280375; cv=none; b=ipiZxysW+KUbPI2LlttCqKWKZP66znEWB/0f41kVOvmr5CNtgJXvfYCwen585YQGy0IeS82duaSZoBsyXwa0W9CBaBJ/b/cq6yb/i/QNnTXx67JMOUE7SrhIB9wiF2n2oAhIfaVr3BG5rpk6mlTEF7hE8mhqLha8r8VvURUABUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753280375; c=relaxed/simple;
	bh=QW2CvOpPX0RGg4TNbm/CsHQVu6u3IR3q1BZtVWV+tqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JuyhGxAQcEqPYnb4RFuCE+Yujl/ciFrfGXflRseOZSUZqOFz0QYqvjAa+/deHH/cEA1rlah4yx84EgjeVbLdxxJBfPfDpfTiBqF34lOc0OxzzvQ1wzJ3n9iu3R5HfLX6QF3n776FD/Xuh1MqbyJ4bOOi7jSQpd5o+vQiYi7tqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3V+cuQLA; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-611f74c1837so12951337a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753280372; x=1753885172; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuMc2tx0byUeAusEePA8R+FLNCjRgYNAe/ZQenWndDM=;
        b=3V+cuQLAXCoi0BnsG7EBXju6fzcZk7nEBjIXnuFYObLTmLJ15JRK/NuhFgEFzoODF3
         zAN7iStH2XeQj5soOAHKuUfxgLgQFoRXh8f916Joji+RjHOrF09b63l1bZPd0JCzdMo+
         7EwYMZpHHHp1LPO1qGkyAq8WOotVi9rwhcmLm7ma1OYGYgAbBjHMh0lNBMcyGUwXxdOW
         pEsOhfbFnt6M9D54mX1JtotUYjdPqKU+fHjazKunwqPPHRc9NThnY/MIhv08fbR2rB3r
         Geyx8vdh86lVtwV0lE9qn95VHiNPbE2Q/kh2aYbSiaQ+PO3WkGTjAIAzCerjqawaI51E
         TvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280372; x=1753885172;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuMc2tx0byUeAusEePA8R+FLNCjRgYNAe/ZQenWndDM=;
        b=j3g1e1Bx0knIvm68LAie30mGV5BazjuwdCRJDnxmBzIWt+c/lVGLLr5xobPr8CPTEI
         9B0O8spbZ2CpzDRk73lxBCGjMa3XBRDYhwaCSPjG4Sz2yND2UW2aj2Tbia79fxeNSzgX
         VYnLwDxG+2BJm9WYH/aDH6vdCDi7JbgSMvosGs3tdDkZTRKK8BigE022TwvP8Twuziy0
         WbXBPCfOGg+fN78preBo6k6cWN676Ew5xzCk5CqyliFqbhGaOHLMBLrnLeoFrimyzT+p
         T/sPncNwQ/kpORKlQOf+Ke57iodX3k8WXHCYn97kxw4nHTB3Ieu4skQtcfC6xH8RN5Qu
         GKPw==
X-Forwarded-Encrypted: i=1; AJvYcCXcDkkCQ9y192Jo5QlPX6rtmZFrjrHi3rpFKEHBJdy0lOvgbuSYOWwZ3eQJW/O4we5PT4nNVXrjFIo/9iyN@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZnjcGO5FAxuRy4bmzCl8AHEttleKSEHjWj6VYQ8RGtujLo+S
	lbHLP4+k7Vs/K27DYBuzAxmOjy4dH8BvLaUQ9aOg7mXfoceVGzUEW33T2K+o2vWU8HQ=
X-Gm-Gg: ASbGnctM+2O2h/RSq7kpi+GisSImnLZ0GCkYr4O+LOK++vuIBFkv4oJC+LEfjmfCXHm
	klUbRs2GoLqhO9T3D0bzdfzsp0oieBtllB3PF8hq5Po0nQGR4XYfXRJ1diCtMAQSVqEIRGPBjVV
	yukmLu+bm+UhcGNG6UtC9x9JUdfrBuKUvZ6HJiBfGrP+rwoIwF/O6l93HOleXSGEfJMnihXLRRv
	1XNrruG0MuKAfoOQfJVpAgdnE6kbWL2nSQITurtgzR+u6x3ZNReBxbJaXGaOvLizoQGZDpXOarE
	117rlV/JX2IMw++sbanMK26MDXLcdlw2CtAHgFy6hoVsZewDOk6ssqYy6YZh5JvNmjMuEZdMNeX
	gizJXrZqY3Z00sgbDvPy2P4o1zWCnYFuswWuZ7rnIQ6A2GMRHZ7QbwDUy2CqL6reUoHTcCL3CBl
	LwnsU=
X-Google-Smtp-Source: AGHT+IHijsL9WlG4D6LnAPldkrlV2x7ROPiWCM0gsuvK3Z3YqcHT9NVWAy/PRI6Ld9Bq1jn5ZuV9OA==
X-Received: by 2002:a05:6402:50cb:b0:60b:9cf8:b218 with SMTP id 4fb4d7f45d1cf-6149b40fbdemr3169269a12.7.1753280371626;
        Wed, 23 Jul 2025 07:19:31 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f37026sm8667447a12.25.2025.07.23.07.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:19:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 23 Jul 2025 16:19:22 +0200
Subject: [PATCH] soc: qcom: ubwc: Add missing UBWC config for SM7225
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAGnvgGgC/zXMQQqDMBCF4auEWXdAp0ioVykuTDK2s0hsM7EVx
 Ls3VFz+D963gXIWVujNBpk/ojKnGu3FgH+O6cEooTZQQ11j6YqL+3rUaIk6bG+OrSe2LgSoj1f
 mSda/dh+OzvxeKlqOEdyojH6OUUpvEq8FTxiGff8BCc1/Lo4AAAA=
X-Change-ID: 20250723-ubwc-sm7225-19be7c2e7bdd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753280371; l=1334;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=QW2CvOpPX0RGg4TNbm/CsHQVu6u3IR3q1BZtVWV+tqQ=;
 b=t8MCkD9P0tP6KMvC+0Hz2ljwAISBiLZSQo93HAmnKuk7O9nq9mbLlWzY/h7ViD/JtPd92TzVx
 haCefpvuLYqDgFv9oZOyeTeEWr48khNhuLONkM2WCwBCbZBsjeszdFz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

SM7225 is a variation of SM6350, and also needs an entry in the table.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Note, due to other bugs on next-20250723 I couldn't fully test that
DPU/GPU are working, but this seems to be required in any case...
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..9fdd169f87a78a486bea8823083bef08bc5b9521 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -246,6 +246,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sm6375", .data = &sm6350_data, },
 	{ .compatible = "qcom,sm7125", .data = &sc7180_data },
 	{ .compatible = "qcom,sm7150", .data = &sm7150_data, },
+	{ .compatible = "qcom,sm7225", .data = &sm6350_data, },
 	{ .compatible = "qcom,sm8150", .data = &sm8150_data, },
 	{ .compatible = "qcom,sm8250", .data = &sm8250_data, },
 	{ .compatible = "qcom,sm8350", .data = &sm8350_data, },

---
base-commit: ac3f0fb04c50a909908fd375686c5ad6b27bee98
change-id: 20250723-ubwc-sm7225-19be7c2e7bdd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


