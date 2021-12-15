Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CED4751AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 05:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239738AbhLOEfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 23:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239732AbhLOEfG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 23:35:06 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D247C061401;
        Tue, 14 Dec 2021 20:35:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 78F0BCE1850;
        Wed, 15 Dec 2021 04:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F87C3460A;
        Wed, 15 Dec 2021 04:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639542902;
        bh=SvMTDeyaRslD0+1QSsuP7dl4oIdZ/KKgvgWO8xpCdYA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q/Sb0xjWSf5DpYn3LNtk1sS/pt18I5jXmpRfEU5mTekAAyNlKW4OOAw6UMqfUpUx+
         QEBXeQ1zVt+8ZTgnAAJldu9TuODr+D9Ssmx4BICvmVzTwgUNcFQxBALmw+t7jyWk8H
         3bvZR5FHjBk42wTBZacMCMJ0rmIU8JmVlCgL31Gp9NRXLGZvV5ZTgqLB1h1B3lp5Cs
         zGvkeEGPn1xEehyCi7iILbdtMsDaHqPAnAYWEjTGogyAt7wYbb8SIeVYvjTM6JhKH8
         9/BYrRBXRj4j7Zk1vfA1JU1/aVrrNvxxsEV8l1rNL8jAXIJJGXOCLmNMYh/i+leRvX
         zp071FsT6kF6A==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 03/11] arm64: dts: qcom: sm8450: Add reserved memory nodes
Date:   Wed, 15 Dec 2021 10:04:32 +0530
Message-Id: <20211215043440.605624-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215043440.605624-1-vkoul@kernel.org>
References: <20211215043440.605624-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the reserved memory nodes for SM8450. This is based on the downstream
documentation.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 221 +++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index fb93d53d3433..d9439c6ebfa2 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -310,6 +310,227 @@ CLUSTER_PD: cpu-cluster0 {
 		};
 	};
 
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: memory@80000000 {
+			reg = <0x0 0x80000000 0x0 0x600000>;
+			no-map;
+		};
+
+		xbl_dt_log_mem: memory@80600000 {
+			reg = <0x0 0x80600000 0x0 0x40000>;
+			no-map;
+		};
+
+		xbl_ramdump_mem: memory@80640000 {
+			reg = <0x0 0x80640000 0x0 0x180000>;
+			no-map;
+		};
+
+		xbl_sc_mem: memory@807c0000 {
+			reg = <0x0 0x807c0000 0x0 0x40000>;
+			no-map;
+		};
+
+		aop_image_mem: memory@80800000 {
+			reg = <0x0 0x80800000 0x0 0x60000>;
+			no-map;
+		};
+
+		aop_cmd_db_mem: memory@80860000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x80860000 0x0 0x20000>;
+			no-map;
+		};
+
+		aop_config_mem: memory@80880000 {
+			reg = <0x0 0x80880000 0x0 0x20000>;
+			no-map;
+		};
+
+		tme_crash_dump_mem: memory@808a0000 {
+			reg = <0x0 0x808a0000 0x0 0x40000>;
+			no-map;
+		};
+
+		tme_log_mem: memory@808e0000 {
+			reg = <0x0 0x808e0000 0x0 0x4000>;
+			no-map;
+		};
+
+		uefi_log_mem: memory@808e4000 {
+			reg = <0x0 0x808e4000 0x0 0x10000>;
+			no-map;
+		};
+
+		/* secdata region can be reused by apps */
+		smem: memory@80900000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x80900000 0x0 0x200000>;
+			hwlocks = <&tcsr_mutex 3>;
+			no-map;
+		};
+
+		cpucp_fw_mem: memory@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x100000>;
+			no-map;
+		};
+
+		cdsp_secure_heap: memory@80c00000 {
+			reg = <0x0 0x80c00000 0x0 0x4600000>;
+			no-map;
+		};
+
+		camera_mem: memory@85200000 {
+			reg = <0x0 0x85200000 0x0 0x500000>;
+			no-map;
+		};
+
+		video_mem: memory@85700000 {
+			reg = <0x0 0x85700000 0x0 0x700000>;
+			no-map;
+		};
+
+		adsp_mem: memory@85e00000 {
+			reg = <0x0 0x85e00000 0x0 0x2100000>;
+			no-map;
+		};
+
+		slpi_mem: memory@88000000 {
+			reg = <0x0 0x88000000 0x0 0x1900000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@89900000 {
+			reg = <0x0 0x89900000 0x0 0x2000000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@8b900000 {
+			reg = <0x0 0x8b900000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@8b910000 {
+			reg = <0x0 0x8b910000 0x0 0xa000>;
+			no-map;
+		};
+
+		gpu_micro_code_mem: memory@8b91a000 {
+			reg = <0x0 0x8b91a000 0x0 0x2000>;
+			no-map;
+		};
+
+		spss_region_mem: memory@8ba00000 {
+			reg = <0x0 0x8ba00000 0x0 0x180000>;
+			no-map;
+		};
+
+		/* First part of the "SPU secure shared memory" region */
+		spu_tz_shared_mem: memory@8bb80000 {
+			reg = <0x0 0x8bb80000 0x0 0x60000>;
+			no-map;
+		};
+
+		/* Second part of the "SPU secure shared memory" region */
+		spu_modem_shared_mem: memory@8bbe0000 {
+			reg = <0x0 0x8bbe0000 0x0 0x20000>;
+			no-map;
+		};
+
+		mpss_mem: memory@8bc00000 {
+			reg = <0x0 0x8bc00000 0x0 0x13200000>;
+			no-map;
+		};
+
+		cvp_mem: memory@9ee00000 {
+			reg = <0x0 0x9ee00000 0x0 0x700000>;
+			no-map;
+		};
+
+		global_sync_mem: memory@a6f00000 {
+			reg = <0x0 0xa6f00000 0x0 0x100000>;
+			no-map;
+		};
+
+		/* uefi region can be reused by APPS */
+
+		/* Linux kernel image is loaded at 0xa0000000 */
+
+		oem_vm_mem: memory@bb000000 {
+			reg = <0x0 0xbb000000 0x0 0x5000000>;
+			no-map;
+		};
+
+		mte_mem: memory@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x20000000>;
+			no-map;
+		};
+
+		qheebsp_reserved_mem: memory@e0000000 {
+			reg = <0x0 0xe0000000 0x0 0x600000>;
+			no-map;
+		};
+
+		cpusys_vm_mem: memory@e0600000 {
+			reg = <0x0 0xe0600000 0x0 0x400000>;
+			no-map;
+		};
+
+		hyp_reserved_mem: memory@e0a00000 {
+			reg = <0x0 0xe0a00000 0x0 0x100000>;
+			no-map;
+		};
+
+		trust_ui_vm_mem: memory@e0b00000 {
+			reg = <0x0 0xe0b00000 0x0 0x4af3000>;
+			no-map;
+		};
+
+		trust_ui_vm_qrtr: memory@e55f3000 {
+			reg = <0x0 0xe55f3000 0x0 0x9000>;
+			no-map;
+		};
+
+		trust_ui_vm_vblk0_ring: memory@e55fc000 {
+			reg = <0x0 0xe55fc000 0x0 0x4000>;
+			no-map;
+		};
+
+		trust_ui_vm_swiotlb: memory@e5600000 {
+			reg = <0x0 0xe5600000 0x0 0x100000>;
+			no-map;
+		};
+
+		tz_stat_mem: memory@e8800000 {
+			reg = <0x0 0xe8800000 0x0 0x100000>;
+			no-map;
+		};
+
+		tags_mem: memory@e8900000 {
+			reg = <0x0 0xe8900000 0x0 0x1200000>;
+			no-map;
+		};
+
+		qtee_mem: memory@e9b00000 {
+			reg = <0x0 0xe9b00000 0x0 0x500000>;
+			no-map;
+		};
+
+		trusted_apps_mem: memory@ea000000 {
+			reg = <0x0 0xea000000 0x0 0x3900000>;
+			no-map;
+		};
+
+		trusted_apps_ext_mem: memory@ed900000 {
+			reg = <0x0 0xed900000 0x0 0x3b00000>;
+			no-map;
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.31.1

