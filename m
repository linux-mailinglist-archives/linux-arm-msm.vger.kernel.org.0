Return-Path: <linux-arm-msm+bounces-50167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B907A4DBA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 12:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F82A3B3354
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE47202998;
	Tue,  4 Mar 2025 10:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5qYO908"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718541FF1C6
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 10:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085893; cv=none; b=s41saRdZqQM59sdwfy27pjnPK2p4pIQxBuXFfsnI39psr8EO0csa9ndRyM761IDgElZOAdJ+Nfbu0SBPcbQ/7pqcBbzLnP4X77j0VcgZZp4PwmHNidsEIdRKZUZzD+dy98sNRpW9WT5rwgiv1PE3EVd6R/7+Q4Af4gE/qYNCZLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085893; c=relaxed/simple;
	bh=95ZioWTOFYyGeCgq7GdjvtNHse8rEA2pxGA2e/BaNy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qc4F5BuQGT3Is5F4xgQFGI0PFNUMOFCFUPr3A4xqa/trfdy3xZAi/agxI3Aj6cV/NYz717hnTez8JVmav1K8pfTb6S7iYmugSAMVmxcC2oskP9Gps7KWpV9Wvmen1FU95Cp33U1V8u5mhwkdDnJ8ycm8MeaKV4H/gBA8sKnaWCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5qYO908; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so9845676a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 02:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085890; x=1741690690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkQiSZ/wmeIK3Ln89KuiJp4g0swVb994H9Tz4aOmNUk=;
        b=u5qYO9080uqddyn4hVisTDfmbhR+MST14GMcGkAaKbIqZYUTSt/AOP+QfD625X8ONb
         HAXo6x21ugbn55RfPZOGkpdAkzpbM+sWjJAdG5HVIdk7GJtaHpS18WAm772ZDVhyFK82
         WD50g+QMAY6aZhyEWBzNhf1witXoqJAiwxVnO7jEnTRXr70P85rg5O3OPJmPug8gxU1x
         Lzn+iizmrmiXtlI7zYLlIHRBfs4HeUfsj+Z/1LXt0go/bcuUT/jr1ugb2e2KFVVC/6sF
         DxkGimQP8CM35FC+SxkngldATKTxaVfUfFt/rOpNCBSmz5w+bOaKvkJx7tihy4pBAQ1a
         lyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085890; x=1741690690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkQiSZ/wmeIK3Ln89KuiJp4g0swVb994H9Tz4aOmNUk=;
        b=UiU+PrKHM71POayVLWge5KMRBo31DmKw163eq6vCMoPaLthvw7q8fmJBJwZayW9GNy
         pvGnsnvPwO5a1WtGyoicL5LPQZygbImXVxjVHGyt6AFqWjJJrEo/omyTIQKLGwseYpRa
         0hsxmE29hu39frx5CMJdNu81vRsubClOY2+i839Dfmxe6bCgTh7hphHxZxaXcKExju0O
         o6KjqWuNUu5PjyLAFsUauFS6ulJimVAQsJ3CYOXxiZHOfy5NlpLeYGrShKzGD2vsRb0Z
         4qhmeD3id0vsFxLoOBzid2RyGOYzZtMIg47/l2CyhbLCYglwtLcilDl3pP0C3LKecSQC
         UHeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXJFTEnVP3NVT5Uc9b9ADFwgvCg38nPYZjOdUBkk30ksh8emU7ApnXpw7R7jTThhygEF00OOnrFgQgnq34@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+jVV/oN5UFeK0lcKIaFOHYuSXhHcptDCB8XztQAdb5vxDz3MV
	Dp6TMj0KY9UmRLV7nzxGqY/eCUeHNRFmEpH1QsnKkdIZTUN0j7Ia9opZ2vrXkco=
X-Gm-Gg: ASbGncvfQUo/RBkMOBAdewTtHosFg9ZMJh3rDzrVR2e8xQMTzwIj+rUxMH9yWBoWzIg
	7I8rgeYCUUy9paNBiQ6zXg9JsX3I/Qv2IaF+RkzGO7k58uJv6SNyIaHpP7ed94lT+c3iJUaI2Vh
	Ww5lHSKYAgHzNfX1ns5cAk06aD6jXLCZSkzbHum0UC0Zxz6xQkUqz5pGOpetaqbke/PzICUSvxw
	u3BVw4KlmhQHh2UiwaqvWb0C0hY85919qYEwz6HGrcajmEAiCD6SRu5LS4/9Lfu/g61X4IvhgGk
	B3jsWlDrD7vrPCyavlUUdeINlyUVKd8KBVfrma8v9rQ=
X-Google-Smtp-Source: AGHT+IFlevWIsVV9QpmLVmSKI0RDAqmBsSPQlBY6GR6iTVQNwReaXcAb8Esi43q7fS8EvqvXaJbk1A==
X-Received: by 2002:a17:906:6a14:b0:ac2:13f:338b with SMTP id a640c23a62f3a-ac2013f37d0mr56922366b.55.1741085889677;
        Tue, 04 Mar 2025 02:58:09 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1fde3f585sm38973266b.53.2025.03.04.02.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:58:09 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 04 Mar 2025 12:57:47 +0200
Subject: [PATCH v6 2/4] arm64: dts: qcom: x1e80100-crd: Enable external
 DisplayPort support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-x1e80100-dts-crd-t14s-enable-typec-retimers-v6-2-e5a49fae4e94@linaro.org>
References: <20250304-x1e80100-dts-crd-t14s-enable-typec-retimers-v6-0-e5a49fae4e94@linaro.org>
In-Reply-To: <20250304-x1e80100-dts-crd-t14s-enable-typec-retimers-v6-0-e5a49fae4e94@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=95ZioWTOFYyGeCgq7GdjvtNHse8rEA2pxGA2e/BaNy8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnxty5tnc4mm2cJL42Y8k/gxcQiQEBOFLdKb9AN
 qvlhiLPXbWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ8bcuQAKCRAbX0TJAJUV
 Vt1HEAC+bgP7BwSGqeBs6xep8USVAdmKde7YNd3q4vyossGxD8kR2AoS/cLZ8OvF6uJUjqFUg1R
 Cc3Mq0PsHMRkkk7gNkf/1qVWqraeXAOCq2pIMb9ihMB2VXzwwYUX+mJcrgtce2D+d8EYSQ25dY2
 ut+ZSicEUSz+ESEsodc81SiKzXz+3LYSKH4zzjQ4+Ni3xjtwFmIUSNPZVHvFzVfTl32wIFeJ8nu
 9ddXJ0Ot2HkirGCDZuvHyr+boFm69ejzZG11sswWOHTzF9O+KDCQFmMnXucqlhuyfxz2825L9iJ
 EoK2KJz+OudxNLDOIj5xWU/GyFISHJxDt+I5GeNMdIH2JN6KSuE7HlUhbK5z/PwW8IKEBf/rqEM
 v1SD9Ifac/ckXoq2Qjw3HNlIKsC3wGYG1AJXrx+4GUsS01RCE7uFaTav4cQPN1Vt7u27TEP7oKP
 xsaM4Z6vcqaRG0IAvtZQjyWT+CBg8OHHEzuaFXvqjbzybvkdxTqi+SpwBn288t3DFzFiLCY2QCF
 GiETw4g1LPz8CD4EEyJXN5QEjnZJ2eJmzjFslqKC2NU4Mmb4yMFQ1sX1vupVY0SkueHMvNEIffL
 99zHOPuG88xsNzE+4/1s4IVPzbjTRkFJZ9+NvDjHELclSIdIgD6OEaWiGMAqJZTGiA+EPkv5K7l
 m7zHvqEFEPBBR4A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X Elite CRD provides external DisplayPort on all 3 USB Type-C ports.
Each one of this ports is connected to a dedicated DisplayPort
controller.

Due to support missing in the USB/DisplayPort combo PHY driver,
the external DisplayPort is limited to 2 lanes.

So enable all 3 remaining DisplayPort controllers and limit their data
lanes number to 2.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 34e203fb7a4bfd781cf268429b3e4174e8d19bf9..53f329c320190afa263fb8d8028828022464fd99 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1117,6 +1117,30 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;

-- 
2.34.1


