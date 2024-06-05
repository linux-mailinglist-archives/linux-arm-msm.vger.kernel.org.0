Return-Path: <linux-arm-msm+bounces-21788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532A68FD363
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 18:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B46DBB24E92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 16:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C97192B6A;
	Wed,  5 Jun 2024 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JAMCk30r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEBB1946DE
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717606641; cv=none; b=OfKQl/LlRsNIAdQ+JmEyFZ7P573876L7arXDQwy3u78CjEKRoN9HMPba82aLHp6m4CewW0dnsF93LzT9KTo9SPSomvhC+qFsJN84Vf3hiUfBHYtqqqCh/nCzPHT1MvgZ7qwPnvh49bxfGlQ6uofcZBXzuzA2YqvJvOmHcV0AFus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717606641; c=relaxed/simple;
	bh=HeZmvhi6CPGt8WwcZwf2umJdFyeYu9idarBijvCBonk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXE2ELwIELcRSjW4snI1ochMCx95HY/o8JpZO/R59sl5AryJ6bUa3FgQFaic6QdK3PjcFwWqo0enfX6dj3lfS3J1X6aLrj8kGkpcr1OQxsv58yHmOMZD5wke0b1Qo+g9CUv4nhIjM4rHUSZzNDVlAjBzp5iKd1nj7/fOlN+hfE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JAMCk30r; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42139c66027so528375e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717606638; x=1718211438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZAJIsxJR2vGTpYF0CVR0FVQsZVBz55ydImqGnGisaY=;
        b=JAMCk30rAmF6fQ9tqvyQhrBORi56SsGoMPKWgPCeT1axy/9rTJwZv02qBeIyqFA1jE
         O1WSEKuQJVt+qXTpys9PLqjsEkNOFI7O1Hzv9H0brFcxW4UJ/uqfT0XPVgfWs7LO8ibJ
         1VUascnkENhE//PCD7MyWEIjuI7CvZlHlureQw8vo2Pt3JURSvPK9TP9iQDvB8Q++5/B
         l1oRu5gXHATNEG4US1T5JUkwxBui9xPRPQrGQmAwDhuetLGKPjkOaQYjAUqHtBaMy5sF
         8G4FRpeedQtx9WP7rHwUi+VhJqGQOPXtzBUYt11TMI2geYyjr/4FuzwPVXkbVJ6iwVoX
         J2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717606638; x=1718211438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZAJIsxJR2vGTpYF0CVR0FVQsZVBz55ydImqGnGisaY=;
        b=v0Pe+s1VsVAIUAtwPxcCywzvflpAgaAaG6IHjtDt7AAKPYGF54GkxQXNwmXMEJAtej
         00oFVs21OWPG80n6twNTmjMuMSQmelNz9J828A53AeEHA5Y8sD0n7v/aFkvSY2m35Dob
         kUdW6aRy8G1wNNSlJzActftG/IgIsCKJJ+hhwf9SRv9m7nZnMGUe/VYXPYkbbJMy7WkJ
         9kcdY8QxxJS6WKfg4zEUHdj2/Hxrq5S7YEWp+vhEPU+6n95xiCdVoaY3a6CP+EGzgypS
         jAknrLMrVl0pj828xfSXNqqjGOafwmzqJfqfFnmobTdInkudVWr35qZRR6Xvag6jgEaS
         uTjA==
X-Gm-Message-State: AOJu0Yy4dvhFmrieu3F2TmPGfRujZFEQHu9IqMOeLZfMpuUKCzBlGlzO
	iJ2ZpUO625yzioOEQNmKOyxpBYkAoIK9yxmTb5SMR6UO2uC2CHOq1XEwgjh3gvM=
X-Google-Smtp-Source: AGHT+IE0vdgSk2jq0dt4or/4md3DIrpCzlhJO+8PeCEv9vXjjvGlYlOLmHn0K9BBeqOIWKvq1jwMNQ==
X-Received: by 2002:a05:600c:190c:b0:421:418d:8f7 with SMTP id 5b1f17b1804b1-421562cf5e3mr22320865e9.12.1717606638273;
        Wed, 05 Jun 2024 09:57:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421580fe343sm29099175e9.6.2024.06.05.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 09:57:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 05 Jun 2024 18:56:54 +0200
Subject: [PATCH v3 4/5] arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-sa8775p-iot-remoteproc-v3-4-a437355b8c7f@linaro.org>
References: <20240605-topic-sa8775p-iot-remoteproc-v3-0-a437355b8c7f@linaro.org>
In-Reply-To: <20240605-topic-sa8775p-iot-remoteproc-v3-0-a437355b8c7f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10709;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hAumvR29CA4QmnPFouUEmid6Fe9FTeAJPQyQAnI0BM8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmYJjmv2/lk/vuwp26FWvmxdihHf30zoMasNNdj
 MrH0sL9PG2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZmCY5gAKCRARpy6gFHHX
 chusD/9RfT2CyNZQXTIlvPs8sKO5V6luq3ebmMnDLENI5j/5Cw04oackOQLQyAc9fh66VIoKw2J
 he239SBs56A/LNdGJ2Wnqn7SmRJZhx+x26Ubhd/4fpTbKNO/P1z/tyKCYMr+1Fx0H23La05+C7y
 VodxSu5xS2qQzqAZ9vwyxagkR+8FoC5YCKymWFwSsevhaecr8htVA7K/sZX2+GGdFALtsWlSGei
 d44eBz8pKD/GrlHdMT1aVSDoaY8dG20Um7eFYSFiJhSqvasJsTB1E7pBG6j3gpSi8g/0inM7ren
 GR5OK4qyc8/6jWG5p97QW7JFrTFsYUIRgReaj8QboaXNbK/pUFf0RijBTnavZpH3222FWwI8mf4
 ilZKZ0EIwglqRRAOoKEX1oYrj0vZ8WcpbwRpqg8vegVh9UTBasIkjzjRAmcv5peML1ZQN+3at9N
 IvnIV1rQ4rqPKfJ/8PNPkVTLdNeJLZiS8JoziWqS9mQG7k1VvdW5EwmGQ6L8WgwQRuVzje2Fj0x
 fcqyTY8aK5znYJlXG/C77voACMVxWmjxlLXV1+Q178zSq3ologM8xro9Cm0ljgpG408uN9JBjJr
 61W+zCKhkNcdzPwLBb5HsoDDK1XygXsNO6GbDKJlrSfQLCjLmJv55ZDRmRJkxdkIbKqq22A+aEz
 tB6Y3dlkOI9HUfA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Tengfei Fan <quic_tengfan@quicinc.com>

Add nodes for remoteprocs: ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 for
SA8775p SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 332 ++++++++++++++++++++++++++++++++++
 1 file changed, 332 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index efd588fa2abb..2aebc2a95e5a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -557,6 +558,121 @@ cpucp_fw_mem: cpucp-fw@db200000 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp0 {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp0_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp0_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp1 {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_NSP1 IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <12>;
+
+		smp2p_cdsp1_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp1_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-gpdsp0 {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_GPDSP0 IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <17>;
+
+		smp2p_gpdsp0_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_gpdsp0_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-gpdsp1 {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP1
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_GPDSP1 IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <18>;
+
+		smp2p_gpdsp1_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_gpdsp1_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -3438,6 +3554,92 @@ cpufreq_hw: cpufreq@18591000 {
 			#freq-domain-cells = <1>;
 		};
 
+		remoteproc_gpdsp0: remoteproc@20c00000 {
+			compatible = "qcom,sa8775p-gpdsp0-pas";
+			reg = <0x0 0x20c00000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_gpdsp0_in 0 0>,
+					      <&smp2p_gpdsp0_in 2 0>,
+					      <&smp2p_gpdsp0_in 1 0>,
+					      <&smp2p_gpdsp0_in 3 0>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "cx", "mxc";
+
+			interconnects = <&gpdsp_anoc MASTER_DSP0 0
+					 &config_noc SLAVE_CLK_CTL 0>;
+
+			memory-region = <&pil_gdsp0_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_gpdsp0_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_GPDSP0
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "gpdsp0";
+				qcom,remote-pid = <17>;
+			};
+		};
+
+		remoteproc_gpdsp1: remoteproc@21c00000 {
+			compatible = "qcom,sa8775p-gpdsp1-pas";
+			reg = <0x0 0x21c00000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_gpdsp1_in 0 0>,
+					      <&smp2p_gpdsp1_in 2 0>,
+					      <&smp2p_gpdsp1_in 1 0>,
+					      <&smp2p_gpdsp1_in 3 0>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "cx", "mxc";
+
+			interconnects = <&gpdsp_anoc MASTER_DSP1 0
+					 &config_noc SLAVE_CLK_CTL 0>;
+
+			memory-region = <&pil_gdsp1_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_gpdsp1_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP1
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_GPDSP1
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "gpdsp1";
+				qcom,remote-pid = <18>;
+			};
+		};
+
 		ethernet1: ethernet@23000000 {
 			compatible = "qcom,sa8775p-ethqos";
 			reg = <0x0 0x23000000 0x0 0x10000>,
@@ -3507,6 +3709,136 @@ ethernet0: ethernet@23040000 {
 
 			status = "disabled";
 		};
+
+		remoteproc_cdsp0: remoteproc@26300000 {
+			compatible = "qcom,sa8775p-cdsp0-pas";
+			reg = <0x0 0x26300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP0>;
+			power-domain-names = "cx", "mxc", "nsp";
+
+			interconnects = <&nspa_noc MASTER_CDSP_PROC 0
+					 &mc_virt SLAVE_EBI1 0>;
+
+			memory-region = <&pil_cdsp0_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp0_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
+
+		remoteproc_cdsp1: remoteproc@2a300000 {
+			compatible = "qcom,sa8775p-cdsp1-pas";
+			reg = <0x0 0x2A300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP1>;
+			power-domain-names = "cx", "mxc", "nsp";
+
+			interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0
+					 &mc_virt SLAVE_EBI1 0>;
+
+			memory-region = <&pil_cdsp1_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp1_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_NSP1
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp1";
+				qcom,remote-pid = <12>;
+			};
+		};
+
+		remoteproc_adsp: remoteproc@30000000 {
+			compatible = "qcom,sa8775p-adsp-pas";
+			reg = <0x0 0x30000000 0x0 0x100>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;
+
+			memory-region = <&pil_adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			remoteproc_adsp_glink: glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.43.0


