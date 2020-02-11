Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA51158702
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 01:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbgBKAwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 19:52:31 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50525 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727763AbgBKAwV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 19:52:21 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so533421pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 16:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GYcfh7fMvYAlIR4aXXQzSt3C06chntR52at8wJa3tek=;
        b=SjRakv+7HKKrp8NEOCX6VIPeMG11xHX8mJW3D+GViIV7v/rUbknzfoWGD0potFL2Ya
         TrH3x9E6SmsvIRYJXb+wZzcUZG74z3A4hCT1zGy6vaWGkoo29WuZG/Juz1fNPwu3dZ9i
         zJVy0AN1d12ARHC111yN0xNgL1xmfRiN/v6oLaG1sYZw9+rYZVpLxti/3vV7gUCpyk6n
         sjzITxfb819yxQs05nd58woWMNZmuSyJJguUK+OjN1cRYKgRCi9yZJmDvp7nY/m9XBuw
         5cOnSiqNgDHn1viFutg6GcTlXZeQH0PxU1/DoDSkcmnMkKmMDcjYWiOLw5bpZmlNo3UA
         OI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GYcfh7fMvYAlIR4aXXQzSt3C06chntR52at8wJa3tek=;
        b=O4GuVmu35FzFYlbmFniWMwbxXQf91Z4cQRK4Uf2SDEsWgUOsU2SUieEKAVEme72Bbp
         L/UmaCjw+0OG3FzLA41OadPRI3J0z/x+c3u0u6Ywi5aOqfd/wnm3bL1TLkxcDUxCpFNt
         +30ENUsdgly7BUodfPKxnOY0eU+QO0HlZnsh6w8bmXqrRhMwhco0XVxiEY3BIh6Zr1Z6
         uxZM3ap339jOVJEge65TJFfRQquFfCVkByp4ktpxE/xZ3IeUEFhic31bcgL2vgfNRipS
         01tLL0zoNRWWI2zan+TDIb9b1x45OaLY3SjLKbgIGo9uwrYxfK/qlJOBRUrBI8/G5aBG
         Wq2w==
X-Gm-Message-State: APjAAAU42j0heVy3qi7Ud2fhDNJ6uyclSfFNTr+KKeKXBzT3UClvGpuR
        BPe0f6kwD1cAxVAOyVSIjU2SWA==
X-Google-Smtp-Source: APXvYqy3iW4pbURn69ZVNZ5cxr/DdFPKQ0xbucqlfM3QXmYD5SG1FCE8u5y7dSubB0s6uoRDoGzQFg==
X-Received: by 2002:a17:902:760e:: with SMTP id k14mr590560pll.119.1581382339888;
        Mon, 10 Feb 2020 16:52:19 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:19 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 8/8] remoteproc: qcom: Introduce panic handler for PAS and ADSP
Date:   Mon, 10 Feb 2020 16:50:59 -0800
Message-Id: <20200211005059.1377279-9-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make the PAS and ADSP/CDSP remoteproc drivers implement the panic
handler that will invoke a stop to prepare the remoteprocs for post
mortem debugging.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Update return type and pass the return value through

 drivers/remoteproc/qcom_q6v5_adsp.c | 8 ++++++++
 drivers/remoteproc/qcom_q6v5_pas.c  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 19f784adf91c..822881534d37 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -291,12 +291,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
 	return adsp->mem_region + offset;
 }
 
+static unsigned int adsp_panic(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
+
+	return qcom_q6v5_panic(&adsp->q6v5);
+}
+
 static const struct rproc_ops adsp_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
 	.load = adsp_load,
+	.panic = adsp_panic,
 };
 
 static int adsp_init_clock(struct qcom_adsp *adsp, const char **clk_ids)
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index d20ce3c62256..ac38624fb14d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -242,12 +242,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
 	return adsp->mem_region + offset;
 }
 
+static unsigned int adsp_panic(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
+
+	return qcom_q6v5_panic(&adsp->q6v5);
+}
+
 static const struct rproc_ops adsp_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
 	.load = adsp_load,
+	.panic = adsp_panic,
 };
 
 static int adsp_init_clock(struct qcom_adsp *adsp)
-- 
2.24.0

