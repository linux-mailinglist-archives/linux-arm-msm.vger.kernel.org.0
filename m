Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602B86564B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 19:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbiLZSza (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Dec 2022 13:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiLZSz3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Dec 2022 13:55:29 -0500
Received: from mxd-1-a59.seznam.cz (mxd-1-a59.seznam.cz [IPv6:2a02:598:128:8a00::1000:a59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7024AF1D;
        Mon, 26 Dec 2022 10:55:25 -0800 (PST)
Received: from email.seznam.cz
        by smtpc-mxd-695c6957-5rhr5
        (smtpc-mxd-695c6957-5rhr5 [2a02:598:128:8a00::1000:a59])
        id 50e26152e6c2de0950e5df25;
        Mon, 26 Dec 2022 19:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
        s=szn20221014; t=1672080907;
        bh=sibxaTeX9saX1pYCBEMQC2W5SKW0HvJK6JNxlYg2dcA=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=Lwz9IlMjlMPjlLnJD1d7tOuGXpypDScS32DMgnbIuF4eg260VBmRm4IeZCOKmrU8L
         Cm+IyCMrAINph+N3zT6dNi1cqZpaL7k9oAsJBcWNU9blflLHqOVnISSB5nWaxwCHjf
         JwVWwneaNQaryFDUWa7ZvLR4bJtzUldLHXoANAeZFZPA7pZxNP58cRj2OY4os8mQD5
         pO7I+b6iHuDnV8qcxk+qFq1qNkfNNHkMzJkiA4fytP1jMh1zQ3Yx5yo35/0LbXcrMU
         zFVuWrBN1WgO8HxIMZwE7HcA06/ul2XwhmTNsu205dv9XcsusMFaUlr8hYtP2SwMfH
         zadz1JYiEM85A==
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
        by email-relay17.ng.seznam.cz (Seznam SMTPD 1.3.140) with ESMTP;
        Mon, 26 Dec 2022 19:55:05 +0100 (CET)  
From:   Petr Vorel <pevik@seznam.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 3/3] [RFC] arm64: dts: qcom: msm8992-bullhead: Fix smem_region, mpss_mem
Date:   Mon, 26 Dec 2022 19:54:40 +0100
Message-Id: <20221226185440.440968-4-pevik@seznam.cz>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221226185440.440968-1-pevik@seznam.cz>
References: <20221226185440.440968-1-pevik@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Petr Vorel <petr.vorel@gmail.com>

smem_region has a different region on downstream than on msm8994, it's
defined as 150 MiB [1]:

[    0.000000] Linux version 3.10.73-g65a266a (buildkite-agent@lineageos-buildkite) (gcc version 4.9.x 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Mon Feb 24 10:43:08 UTC 2020
[    0.000000] CPU: AArch64 Processor [410fd033] revision 3
[    0.000000] Machine: LGE MSM8992 BULLHEAD rev-1.01
[    0.000000] cma: Found secure_region@0, memory base 0x0000000000000000, size 150 MiB, limit 0x0000000000000000
[    0.000000] cma: Found qsecom_region@0, memory base 0x0000000000000000, size 4 MiB, limit 0x0000000000000000
[    0.000000] cma: Found audio_region@0, memory base 0x0000000000000000, size 4 MiB, limit 0x0000000000000000
[    0.000000] cma: Found removed_regions@0, memory base 0x0000000000000000, size 34 MiB, limit 0x0000000000000000
[    0.000000] cma: Found cont_splash_mem@0, memory base 0x0000000000000000, size 12 MiB, limit 0x0000000000000000
[    0.000000] cma: Found peripheral_region@0, memory base 0x0000000000000000, size 28 MiB, limit 0x0000000000000000
[    0.000000] cma: Found modem_region@0, memory base 0x0000000000000000, size 100 MiB, limit 0x0000000000000000
[    0.000000] cma: Found ramoops_region@1ff00000, memory base 0x0000000000000000, size 0 MiB, limit 0x0000000000000000
[    0.000000] cma: CMA: reserved 152 MiB at 0x0000000000000000 for secure_mem
[    0.000000] cma: CMA: reserved 4 MiB at 0x0000000000000000 for qseecom_mem
[    0.000000] cma: CMA: reserved 4 MiB at 0x0000000000000000 for audio_mem
[    0.000000] cma: CMA: reserved 34 MiB at 0x0000000000000000 for memory_hole
[    0.000000] cma: CMA: reserved 12 MiB at 0x0000000000000000 for cont_splash_mem
[    0.000000] cma: CMA: reserved 28 MiB at 0x0000000000000000 for peripheral_mem
[    0.000000] cma: CMA: reserved 100 MiB at 0x0000000000000000 for modem_mem
[    0.000000] cma: CMA: reserved 0 MiB at 0x0000000000000000 for ramoops_mem
[    0.000000] cma: CMA: reserved 16 MiB at 0x0000000000000000 for default region
[    0.000000] PERCPU: Embedded 15 pages/cpu @0000000000000000 s38912 r0 d22528 u61440

But that conflicts with cont_splash_mem and cont_splash_mem:

[    0.000000] Linux version 6.1.1 (pevik@dell5510) (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for De2
[    0.000000] Machine model: LG Nexus 5X rev 1.01
...
[    0.000000] OF: fdt: Reserved memory: failed to reserve memory for node 'smem_region@0': base 0x0000000000000000, size 150 MiB
[    0.000000] OF: reserved mem: OVERLAP DETECTED!
[    0.000000] smem_region@0 (0x0000000000000000--0x0000000009600000) overlaps with memory@3400000 (0x0000000003400000--0x000000000400000)
[    0.000000] OF: reserved mem: OVERLAP DETECTED!
[    0.000000] reserved@5000000 (0x0000000005000000--0x0000000007200000) overlaps with memory@7000000 (0x0000000007000000--0x000000000ca0)

1) Obviously there are more memory to be fixed, e.g. modem_mem, but
fundamental is to find out whether such a big mapping should be really
used. If yes, what is the trick downstream uses, that it allows
overlapped memory? Or memory is not really overlapping and I cannot
trust the reported value? What base and size should I define then?

Angler downstream defines crazy values for secure_mem as well [2]:
[    0.000000] cma: Found secure_region@0, memory base 0x0000000000000000, size 300 MiB, limit 0xffffffffffffffff

But then in mainline is defined just 2 MiB at 106 MiB:

    smem_mem: smem_region@6a00000 {
	    reg = <0 0x06a00000 0 0x200000>;
	    no-map;
    };

=> should I use just 2 MiB region? But at what base?

2) Is mpss_mem equivalent of downstream modem_mem [3]?

Kind regards,
Petr

[1] https://android.googlesource.com/kernel/msm.git/+/refs/tags/android-7.0.0_r0.17/arch/arm/boot/dts/qcom/msm8992.dtsi#278
[2] https://android.googlesource.com/kernel/msm.git/+/refs/tags/android-7.0.0_r0.17/arch/arm/boot/dts/qcom/msm8994.dtsi#272
[3] https://android.googlesource.com/kernel/msm.git/+/android-7.0.0_r0.17/arch/arm64/boot/dts/lge/msm8992-bullhead.dtsi#148

Not-Yet-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index 4bceb362a5c0..fb4879b4acbe 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -12,8 +12,9 @@
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
 
-/* cont_splash_mem has different memory mapping */
+/* different memory mapping */
 /delete-node/ &cont_splash_mem;
+/delete-node/ &smem_mem;
 
 /* disabled on downstream, conflicts with cont_splash_mem */
 /delete-node/ &dfps_data_mem;
@@ -60,6 +61,11 @@ removed_region: reserved@5000000 {
 			reg = <0 0x05000000 0 0x2200000>;
 			no-map;
 		};
+
+		smem_mem: smem_region@0 {
+			reg = <0 0 0 0x9600000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.39.0

