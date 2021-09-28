Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2217341B4FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242019AbhI1RXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:23:30 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.173]:25450 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242000AbhI1RXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849691;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=+lHs//hdp8drmhyzzqs+02GJRw3C/ibC5yhs46Irwmw=;
    b=aJTQri0Mi+41n3gBQvP34y/ARHAUpME5v+18gH/Ypvtph3LZ+ZpawRDxXy2qiC5sxt
    2JP6Rgw538BG9lAjeXE9ZjwJuBokYJX1aDtm1eklmkLN28aHhBelEX/2xl3ZmxFyjl/q
    JSAtvVvGgNg1efddkupvMLR+hQM99Irkct4hrFhUxpp0UiRQ7t3zWEdkQVI5aq0bz6TB
    btCwnNvLgRF50AGjP6ju4bEQqRkIUXj2HYhAMY97d1c1rnnOExnwTgrPbsdRuayygcfI
    3O2iNHr4yKFUK4SWTbOojEI0DVDJdc9J4F8q+sHEGrUNMck6HDX6YKA7P6ahTqXbEBAY
    cPFg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLVoBP
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:31 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 09/15] ARM: qcom: Add qcom,msm8916-smp enable-method identical to MSM8226
Date:   Tue, 28 Sep 2021 19:12:25 +0200
Message-Id: <20210928171231.12766-10-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some MSM8916 devices have outdated (signed) firmware without PSCI
and ARM64 support and can therefore only boot ARM32 Linux.
The ARM Cortex-A53 cores should be actually booted exactly like
the Cortex-A7 cores on MSM8226, so just add an alias for the
existing code.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm/mach-qcom/platsmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-qcom/platsmp.c b/arch/arm/mach-qcom/platsmp.c
index 60496554c6dd..58a4228455ce 100644
--- a/arch/arm/mach-qcom/platsmp.c
+++ b/arch/arm/mach-qcom/platsmp.c
@@ -385,6 +385,7 @@ static const struct smp_operations qcom_smp_cortex_a7_ops __initconst = {
 #endif
 };
 CPU_METHOD_OF_DECLARE(qcom_smp_msm8226, "qcom,msm8226-smp", &qcom_smp_cortex_a7_ops);
+CPU_METHOD_OF_DECLARE(qcom_smp_msm8916, "qcom,msm8916-smp", &qcom_smp_cortex_a7_ops);
 
 static const struct smp_operations qcom_smp_kpssv1_ops __initconst = {
 	.smp_prepare_cpus	= qcom_smp_prepare_cpus,
-- 
2.33.0

