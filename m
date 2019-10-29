Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDD6E8DDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 18:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390690AbfJ2RPo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 13:15:44 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33066 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390598AbfJ2RPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 13:15:44 -0400
Received: by mail-pg1-f193.google.com with SMTP id u23so10037703pgo.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 10:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EPvOmc0/9TpQb/8Qxi0JQ5la+jao1khGxB6lKFFKzew=;
        b=R7+usZpBcWpVXE+FLlVBsTM9NuG0BoC1IIax/WUN+gFKQeqLG1uQKUczFVE/9qDH8o
         ACd1hNgjCpebJHt0uh2su5/iCVyoHoTJZTJciPwRzxrwbfU6MAd45umkzfetCrcfpfQa
         VeCjcXaoKY2k5CRrDv58zVmykx0Dbj4fS2okoW257p9GbITirHjYuNFJ9+XNIcKyKArA
         fDSKC0stgRsH8I9w5CjsPh+hlXMQywP31glkq89/yjMS2EPtJsLK0nBYlMGe9Jd/NzlK
         ad9PyLFTjXxVmGk09IRLRq9tjD2IqqKpj3rmQ4+qAOKOaD7OwXbDqEvfJnwSMg2UsmPe
         +ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EPvOmc0/9TpQb/8Qxi0JQ5la+jao1khGxB6lKFFKzew=;
        b=qII1MKmhhgmRt5sVgO2T4T4HC23MW8CETsUnkRuvoYyJhGJsnber7fC/Jd8hYlVWs8
         529FqMtTnHcI3dNtg3u/J4rDwi0v4XzsPNYTAIxYQuw9F2LoqlSRJBifYg5j+a84r2uM
         n3Bwvv7V86I8yQT1mLdAR7Ugr2MnOGb5uH7+3HKoXl4zuTTlXastxhj/UvC7hjc1Uano
         JS5a5kAK+/VOPNYvcXvptRZpPVmeJ8DRrtvOhnH3ORxX1zQXoLR0lK5MPY6FMlF5Zee7
         6/Cr5ndNJhM690v2srvyf/Nd6aTdChbHbzgjt9xxhCwoAC8EhrotCysHXYKhLk49l6F5
         vwMA==
X-Gm-Message-State: APjAAAU+dtJXoIJ836CWUk87RDi1zRme8Vw4R0ty+G0hCINKKKfCgxKf
        jOZS2XV2Qq27HRmXXI80OoxiQw==
X-Google-Smtp-Source: APXvYqwcArvskwTt/briK2R0NWofQWUQRavqOKZNfIuUedWTw3VXeZ3Jg7wUlLPyePGdTau9dKnA4A==
X-Received: by 2002:aa7:8287:: with SMTP id s7mr28672910pfm.82.1572369343750;
        Tue, 29 Oct 2019 10:15:43 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a5sm6449894pfk.172.2019.10.29.10.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 10:15:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] arm64: cpufeature: Enable Qualcomm Falkor/Kryo errata 1003
Date:   Tue, 29 Oct 2019 10:15:39 -0700
Message-Id: <20191029171539.1374553-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the introduction of 'cce360b54ce6 ("arm64: capabilities: Filter the
entries based on a given mask")' the Qualcomm Falkor/Kryo errata 1003 is
no long applied.

The result of not applying errata 1003 is that MSM8996 runs into various
RCU stalls and fails to boot most of the times.

Give 1003 a "type" to ensure they are not filtered out in
update_cpu_capabilities().

Fixes: cce360b54ce6 ("arm64: capabilities: Filter the entries based on a given mask")
Cc: stable@vger.kernel.org
Reported-by: Mark Brown <broonie@kernel.org>
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- s/ARM64_CPUCAP_SCOPE_LOCAL_CPU/ARM64_CPUCAP_LOCAL_CPU_ERRATUM/
- Dropped 1009 "fix" as it already had a type from ERRATA_MIDR_RANGE_LIST()

 arch/arm64/kernel/cpu_errata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index df9465120e2f..3facd5ca52ed 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -780,6 +780,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 	{
 		.desc = "Qualcomm Technologies Falkor/Kryo erratum 1003",
 		.capability = ARM64_WORKAROUND_QCOM_FALKOR_E1003,
+		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
 		.matches = cpucap_multi_entry_cap_matches,
 		.match_list = qcom_erratum_1003_list,
 	},
-- 
2.23.0

