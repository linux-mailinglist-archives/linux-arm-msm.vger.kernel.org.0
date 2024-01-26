Return-Path: <linux-arm-msm+bounces-8423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2AE83D901
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 12:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0180AB3BE4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3E25BACC;
	Fri, 26 Jan 2024 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSsS4Hg5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936605B202
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706263243; cv=none; b=HElYrCHj5jC0pX8zPr5ZcUzMKwzgsroR6nXYiYGkCbI9D54NzzN5yBGZyuSVgOcboH5RmbY27gV8xqEh51WzJRaDgzB5BaK77MawHcxjVHrDaLueKDFQfCkIi9GehHk6QJVDEX3KCOS/q4XKOj7s0mteSePwu74rw0WW+eD+f8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706263243; c=relaxed/simple;
	bh=9lrK39yGWz+mMVNX3fo7mSMQqmbiZ6p21a+lgh38MTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDZ8PY5/K7WHl22mszjlZtTBEpMh4LgxQyhkMTDHDtczjJyCOHiQELbvwIwWUZbPEY0EQHA+UsyBbF6wvdZq5FEaIg5/CEp6okJ50QU9CHM4PFzN3vuN/8V/CIWVfzq1H7IGbbx7D0BTiep/uJwYfTifkGa72lwluRUcOkQq6vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSsS4Hg5; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a31914e7493so23802666b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 02:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706263240; x=1706868040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOMNM1cIuCUaGhFmJAiF8twDPA35g39fPAYJ946kJ00=;
        b=oSsS4Hg5tiNdjlELaIW98B1nKkcmFTaPlpNPmegu0diqlsTDZJKcPNnBuBgigkVWJv
         fRZar/ktnEqf2QQOfNlnaChyP/HcCVJX85s+CzfMjs4cctcyfGSIHneugr3qxTcMMeNr
         tiU5TDgu2NLRAy4nhL4lzE2VUjcTJRaPrL9mbliYdtxTKyl1dqnU56r0/ZZIXI6pdQRW
         F2ELBqUPYhzE+VkbF5Nqyl2tb+MhsGd57c3tXyed1miZQaqzclKJOmbL517CdmocJfrX
         9qJNQ1qbSIax0uCNiPs8vi/X9UYrIcHSztPtZAZNqbdDgmiMtNdLGOlQ8vKeNzleYp+K
         EPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706263240; x=1706868040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOMNM1cIuCUaGhFmJAiF8twDPA35g39fPAYJ946kJ00=;
        b=j/Pm4heydlu1R0wt3mKrYyDMCHMHtRoVN2FCcHOLh1xJgxazIfWXelSNNYmQDZ2196
         SYVn/IlwZYk9UMWZxc3bBBpYE3E5eX1tGE7Em5LHrayVBI0PDyl6a6qr+jNoWddbSPvh
         f97aYwjsulyT64wynxsV7JXlGe7dJvq/BWmsyKsddGMTxiAPs05KoCWt+sIk1arLC+Q5
         QrZlrIds81WgWJfLhZoAn8S8yhvHfD0b0y+P5dA+kxeC9e6c1vHgcDKrCuq50yhMOFIj
         o+nDnlC63FgsowUJBKqv+u1jPzqHFaH6/mawOhS7MYtuEdZlAcf3zckopDrgFnJFrJ5R
         p9Vg==
X-Gm-Message-State: AOJu0YwaTukEUAOpGZRnhlBEET1ygLG84BOWxr5Lkir8KTFSJxt+Y2vd
	+DrcYMCArlLbQ3XUv4ir6Xpb6qMBkPf2cY9nkDo8TiJnoDlMPztaW5kUFg1hPY0=
X-Google-Smtp-Source: AGHT+IHSuLkgeI7QkxXZVmksxECG2VmFCOGDlb2DX2o1Nrvx1R4dxJ8UsQan0cdBGX9tZomIMzj/4A==
X-Received: by 2002:a17:906:13ca:b0:a2f:1466:a3e4 with SMTP id g10-20020a17090613ca00b00a2f1466a3e4mr496034ejc.25.1706263239779;
        Fri, 26 Jan 2024 02:00:39 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ox27-20020a170907101b00b00a3221b95ce8sm448494ejb.77.2024.01.26.02.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 02:00:39 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 26 Jan 2024 12:00:15 +0200
Subject: [PATCH v5 04/11] arm64: dts: qcom: x1e80100: Add ADSP/CDSP
 remoteproc nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-x1e80100-dts-missing-nodes-v5-4-3bb716fb2af9@linaro.org>
References: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
In-Reply-To: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3499; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=RU2sVakWDTM6FIOT1mP+9fDqahd9wnJzAdPildXmazk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBls4K5hG4IiZx1wFkmb8aGH0l3jcqhrzb4XSnVC
 KVJEroux/iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbOCuQAKCRAbX0TJAJUV
 VpxEEACktQWla4CcYyg90/64lfyIAzceYv7OdU3+sRNHB0sreUYRIh/1dThfAFB0JVZWBRBzSOS
 2aHzxusCvIlVZ0zsPRQ8wy32w10xDDZYQDNCsChp+5qJadlUZqkY2EbU4GlHPf0dFKunT8fNyke
 E8Pxqy7oW8Fc+78QmiEWLbo6QP4mWyknnPMgi3FrrxBziQPpY/uxTiOwUbo8g4qGzA2tXIW9u49
 X2SY4gLOrHWzgXZBup7/LLpxeVBr6DNBvU10T2QRdDWbXxEK1Z9EeQX2gizZeeznkd5ryeeSgUr
 r0kHB8bgdQ4HmPOvn2nNkhu7qdiyLUJrTuuSu4OiOOGuIVpWNmI6PlisFqLg7OJxyuB3C6uRlKx
 s5YMl27hL0ydg1cbGTvC3/IAlZBfg+lF+Wl70oSXDgSlJuyYDYMioNzlyb1kRWp0jd/sHL/o5ri
 njXLqj+0l0JHXg01QQRRRm0LYiPfWc+GXCC8GNYIVW6ZdDVAJOsd+BYwqoIktlUARZ6cSQ2t0Me
 MXCmLkotTWcX7eH8hpbE1z3RHR9ZkhOhBghsOFo+Ge8ygFroYYJYtJG9Ekjk1cnLxoL7ReUheza
 Bvfl18JRuX57dsQ+ODkZiwSUbesXfkvuP4uPDn87Ezw2AVXOjiYiDIMoIFfh4kHGDknXtNh68um
 K7lEOp7TOuoAaaA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Sibi Sankar <quic_sibis@quicinc.com>

Add ADSP and CDSP remoteproc nodes on X1E80100 platforms.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 98 ++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 3790d99eb298..be69e71b7f53 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3590,6 +3590,104 @@ system-cache-controller@25000000 {
 				    "llcc_broadcast_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		remoteproc_adsp: remoteproc@30000000 {
+			compatible = "qcom,x1e80100-adsp-pas";
+			reg = <0 0x30000000 0 0x100>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&adspslpi_mem>,
+					<&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
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
+
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,x1e80100-cdsp-pas";
+			reg = <0 0x32300000 0 0x1400000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mxc",
+					     "nsp";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&cdsp_mem>,
+					<&q6_cdsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
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
 	};
 
 	timer {

-- 
2.34.1


