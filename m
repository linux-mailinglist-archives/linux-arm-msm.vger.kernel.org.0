Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323844218B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236755AbhJDUxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:53:16 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.174]:22242 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237056AbhJDUxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633380672;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=cHGij+gAQJh8yR9ykjR0K1Im3U3PsRCreY04KgR25+M=;
    b=OZZT9zOmXMma2xhPzb5OEwOHz/23MZ782XwCWfwT9XgL9AJGtOWSKsKsuWH1UiCH8X
    73w1ynvGpQu1eXG7mssZkZgvnQSbBysY+mBBvNPSXBuXKsYGgRDloG6jIHL3LSlC9EX/
    XM6MBn5Y5uJVUG9o7J1LPTONCifs3+5UPLfF65bA68Iu4VyzirEZoyrBxi2Oimj4Np0N
    E4/DhTz7XR87Q1uWWvTZJNCFVrO2BMXN1zXGvWYG77oMB7fij0wwXnqkx+vWHCcaqinA
    TzQvcii2DvuHyfn2NqRMq58hfrkQct706+LoQVWtQl9CxK/WqMMXOVlOuZOeuSSgdcnF
    mgMQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KpBKSm
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:51:11 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 09/15] ARM: qcom: Add qcom,msm8916-smp enable-method identical to MSM8226
Date:   Mon,  4 Oct 2021 22:49:49 +0200
Message-Id: <20211004204955.21077-9-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unfortunately, some MSM8916 devices have signed firmware without
ARM64 and PSCI support and can therefore only boot ARM32 Linux.
The ARM Cortex-A53 cores should be actually booted exactly like
the Cortex-A7 cores on MSM8226, so just add an alias for the
existing code.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: Clarify commit message very slightly
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

