Return-Path: <linux-arm-msm+bounces-7756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA01835F7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE5201C2307D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A74B3B780;
	Mon, 22 Jan 2024 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m9upLF7N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD1E3A8ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705918934; cv=none; b=OJQ9QGKGV6tq9ar0+Usq0vA/yDh0Sc3Q11A/UY7HBDuufy2e4AmJzlba2WU2k43o/7I6Ul7WQoafJ34MYaVJEoZpP3vL88yek0ttO4/pDr7Fs1FxDd1gBK964zj4/p6LZWtORSKEmuplG4jEvcqHAZfxGfm4tvShyE8S6q/XeGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705918934; c=relaxed/simple;
	bh=hMzsleAxBtBbguc8gCAikfvgC+u6v027CTjRT8cZCJM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jr2XWa028GjOFf12/PqB+wFOZ3J00Shh1i8oTGDLH+nz4nQ7Xm0kr3Bg88zg3DgO14aJUF4l+xU2ywPQEuFlKJJLxdc9mJavAnSatPyyhh3d1n9/GWJHXTl5lmftndU+VJh+h5n4Ru73WQxbVIwxOTY8TnNVuphGbwqSviJOx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m9upLF7N; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33931b38b65so1014622f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705918930; x=1706523730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ky7A6Q6k7ixaopUQaNLMQkcUAky1WorEIskukk+Y5Zs=;
        b=m9upLF7NOvs2FdXIv/IF/ktuhfw1UDY2POZT5aQPWrMF0F4pIXRQtD6zJHWi8x5Nt8
         4j0Yad73SqtSus68dUIGrptxNmDk74L1tB0L8p/8yI1z787277lgjD3el2HTciqD4xVf
         sDpi7giNShDk6yfn5wng3cd8Tts+o01rSL66OdVvXN/Aga3iD7e7uvox71df9zDJQC1X
         h7ZCVOf2R5ZzqUA4OkO3ismN3KTWs0G+1kw6CjKpAJXUc9ApnVU+BpRlsC7TSxdLLlAm
         QMmgB9SJJZrhBVqXtP4Ze04xlp5ayr5qSdd0dGEs72d/+/XvoRjnb0b8DWlJsInK8AL8
         XNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918930; x=1706523730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ky7A6Q6k7ixaopUQaNLMQkcUAky1WorEIskukk+Y5Zs=;
        b=XnlQLrRNWV13MBGX/3RXtRu6Su34ecGzzmIPIFA6sGHYRKcZYXEoKGzNkFlYxM99Xz
         nTaXbWIGw7DiXYxRn57RnGBl9xHxEuXj9wD7NDGn2Lqckil2aeLXODwEpEzUZ21Juq09
         BEaUsOeNVutmLUaPIXR+o4oEimD0GjWk4O0z6/pmjIgCqvVJR+Wlsv/RgtJlup27mW0w
         xwiuaoJtXaQhDXCnkQ51/9PqxNnfwS7ZoPVEe6eytFaIUr4BPlUoWSwm1N4Rg5yC6oog
         ng2yzoumNynOsRkzzjiTMn433BKpP/92kk09fkkKScocsuTDUfgr2QVYuEG3QmFW/IKy
         vryA==
X-Gm-Message-State: AOJu0YxXe5RKx4zmjNc9t7hUTRxkWloc42pqYvOmqoiL51/0M8GV5bf2
	bsKJqrj8GTQ2IppB4soYjxYacdyiLCHEHg4UeljOVqPFWR3oIvcIcr+Qv1maA9Q=
X-Google-Smtp-Source: AGHT+IGDLuCffdMW9Lj9tUJzf7vxOv7j1BC9cFUwhDhb7FRKBxSwFxj76m+ZfTa9+Lav7Ez4vfQTJw==
X-Received: by 2002:adf:a381:0:b0:337:c030:aac1 with SMTP id l1-20020adfa381000000b00337c030aac1mr1124936wrb.153.1705918929832;
        Mon, 22 Jan 2024 02:22:09 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:92a0:6172:d229:1898])
        by smtp.gmail.com with ESMTPSA id q7-20020adffec7000000b0033926505eafsm6377904wrs.32.2024.01.22.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 02:22:09 -0800 (PST)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [RESEND PATCH v6 04/12] firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
Date: Mon, 22 Jan 2024 11:21:49 +0100
Message-Id: <20240122102157.22761-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240122102157.22761-1-brgl@bgdev.pl>
References: <20240122102157.22761-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 71e98b666391..754f6056b99f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/arm-smccc.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/cpumask.h>
@@ -998,14 +999,13 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	struct qcom_scm_mem_map_info *mem_to_map;
 	phys_addr_t mem_to_map_phys;
 	phys_addr_t dest_phys;
-	dma_addr_t ptr_phys;
+	phys_addr_t ptr_phys;
 	size_t mem_to_map_sz;
 	size_t dest_sz;
 	size_t src_sz;
 	size_t ptr_sz;
 	int next_vm;
 	__le32 *src;
-	void *ptr;
 	int ret, i, b;
 	u64 srcvm_bits = *srcvm;
 
@@ -1015,10 +1015,13 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
 			ALIGN(dest_sz, SZ_64);
 
-	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
+	void *ptr __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							ptr_sz, GFP_KERNEL);
 	if (!ptr)
 		return -ENOMEM;
 
+	ptr_phys = qcom_tzmem_to_phys(ptr);
+
 	/* Fill source vmid detail */
 	src = ptr;
 	i = 0;
@@ -1047,7 +1050,6 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 
 	ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
 				    ptr_phys, src_sz, dest_phys, dest_sz);
-	dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_phys);
 	if (ret) {
 		dev_err(__scm->dev,
 			"Assign memory protection call failed %d\n", ret);
-- 
2.40.1


