Return-Path: <linux-arm-msm+bounces-13179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B1C86F5B0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 16:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 067F51F22B55
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 15:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EB867A16;
	Sun,  3 Mar 2024 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Qt2//bnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AFA67C44
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Mar 2024 15:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709478097; cv=none; b=IW/s2mIchJToliLNL4KqB4YxROsQJUZfmmJs2+yrH6MJ8ACWCENzpULNISIKEOlaHAEHOB26miGJGYVGvl47aPq9LmTe0s7WmJAn4MABw0k9iAaJilLuY4upAqIkRV8dpQ0GcpylRxMdNU5xpLBJJ4ESZ4mXGAQcKcVE3TKuPzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709478097; c=relaxed/simple;
	bh=BUOiJMJAEpUEY/4J8P8EFUX7DemWfjIpSlIVs71qurE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GGD/v6dnTnvrfy97xdXyLK6GPRvjqlppdZ5sCeu6X/Ulab5g/52EqJy0eQrnaE8FTKUY6PeEmCKXV1Vtj6JBmrbkzO21GHvGrGsDeJ6ksqagvImAIUsZONLBHKlKoBks02xKwq6384uzBYS/IRs5Pw9wA6s59gAspvVRxbLGCkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Qt2//bnh; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so645284866b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 07:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709478094; x=1710082894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L12WZQfIjPLa8ST8Z/BOMDM6oqnRCJHCQVsMSwzBc0M=;
        b=Qt2//bnh3TZAGI+9m51FSvWPjhRu3YnmakxQix81idiR0cfKUQUpwVGxY1I3TTXgRS
         BHFV8PnzZpBKTSw/CtTeODNwM9PyfBkWo1UDYrRTrCyHLMNPbE8KaxpPacW+AaXO4Sfp
         JRsjFi3fdoAn3FcknjVrtP4WHSEe44hq0uM2VHKMYxC1uJ2F8rtZl4HpklVaddAzWdNE
         Ecfl0H3Q6jJ1j8p9L1Cvcg3JwUgy3ukekthDhar5JPV4hxupobyCBJ9iuzyUByqAoUrC
         602IafQhESNUoomwdYoWYLwcML52syDaJwLTrWfxN1fJjFz4vM6rlqNW4qhe1g2TmSSA
         LzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709478094; x=1710082894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L12WZQfIjPLa8ST8Z/BOMDM6oqnRCJHCQVsMSwzBc0M=;
        b=pEH4aH3q6kL+vImxWfr1q4PvZj1cGlZHK/hDykGoDJ7gCOX5t0f8pQ+r9yCQZxsbB5
         tsU+OHr/6gNcMhLdJrJTXNEKY375wdQV9lhd7VGj7LpBO8+DGglDtQyk1MQWFT1PKuTA
         szlNEC8wzJaIsDR7CEsXvaUcFVxk+yEbe+zpz50UEcd4nlnVVkxJFA7hzLocFRteNgfZ
         q+Wjlq/ivRxOwp2sldiGSbOVBF4b/tiYNcVqUWBif84zeL+qdKk7lri2XvAJ6auA9cM/
         00GxpmgKzd2ExzIgf62GZ4xgluLAs4xAebdv02KHkFD+eQs11XQQVkfJJGLisTr2fAmP
         BazA==
X-Gm-Message-State: AOJu0YyLK1SX9ySgmK/xVT/gu216KFRDINLvK2r1BMv/CASxATN83fbY
	/klbIgHOVifI+6X4NlXiYDkM9g5hmI+xJYTSs0SlQZOBnYPV1jPZvuxGcytXm+w=
X-Google-Smtp-Source: AGHT+IHW70cWGZpmNZWU3rtJ73z8LCBjIZw93+By8b7kiMvBnTYxyj+8PGipVGYRTU0OyQfXajoSsA==
X-Received: by 2002:a17:906:4f0a:b0:a45:46f8:a181 with SMTP id t10-20020a1709064f0a00b00a4546f8a181mr125275eju.46.1709478093972;
        Sun, 03 Mar 2024 07:01:33 -0800 (PST)
Received: from brgl-uxlite.. ([77.241.232.10])
        by smtp.gmail.com with ESMTPSA id ch14-20020a170906c2ce00b00a42ea946917sm3740293ejb.130.2024.03.03.07.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 07:01:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v8 11/12] firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
Date: Sun,  3 Mar 2024 16:01:14 +0100
Message-Id: <20240303150115.133633-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240303150115.133633-1-brgl@bgdev.pl>
References: <20240303150115.133633-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The "memory protection" mechanism mentioned in the comment is the SHM
Bridge. This is also the reason why we do not convert this call to using
the TZ memory allocator.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 811f93edac7f..fbacc959b6fa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -566,6 +566,13 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
 	 * non-cachable to avoid XPU violations.
+	 *
+	 * For PIL calls the hypervisor creates SHM Bridges for the blob
+	 * buffers on behalf of Linus so we must not do it ourselves hence
+	 * not using the TZMem allocator here.
+	 *
+	 * If we pass a buffer that is already part of an SHM Bridge to this
+	 * call, it will fail.
 	 */
 	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
 				       GFP_KERNEL);
-- 
2.40.1


