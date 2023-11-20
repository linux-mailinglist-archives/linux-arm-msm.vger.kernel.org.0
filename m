Return-Path: <linux-arm-msm+bounces-1189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9297F1846
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57B8F1F251A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 16:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5151DFE0;
	Mon, 20 Nov 2023 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+M7JHDM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1141DFC5;
	Mon, 20 Nov 2023 16:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31264C433C7;
	Mon, 20 Nov 2023 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700496979;
	bh=0MaPFqn+cznucJKrIbyiZQIJbG+WLSHKNg43LW6FYzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f+M7JHDMHn8ZVIT2JxDub7nG01OiwBdMwf6+zh466edwZ60K1AAqZ1ZksTXL3hxiZ
	 MLK4KeLxSkakqe6D/mrFe48elNTGrewsWACuaJ0lazdJ+mEzQUbqbCTL+uGj3RsN3m
	 HecodNDE8QVfthebB1KO9Gz7/wvHdqbTksKGf1+sGZgbpWngA+D2HcGpy1+3xGvCfR
	 fHsmBoa7Sv2deofSjvPqwZZ84mF4G3MC2a2lM+OH0E5uuuXpqN9TA594gFju+HuDMV
	 cbkqKZgIWtUeCmKK94wgRU+N8EvCNgoGfQWkLixLSSt/qvzVsOU88JpkZpz+76nVEf
	 r94+ZqlFDwTNg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r56wm-0001vo-1x;
	Mon, 20 Nov 2023 17:16:28 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] USB: dwc3: qcom: fix wakeup after probe deferral
Date: Mon, 20 Nov 2023 17:16:06 +0100
Message-ID: <20231120161607.7405-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120161607.7405-1-johan+linaro@kernel.org>
References: <20231120161607.7405-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm glue driver is overriding the interrupt trigger types
defined by firmware when requesting the wakeup interrupts during probe.

This can lead to a failure to map the DP/DM wakeup interrupts after a
probe deferral as the firmware defined trigger types do not match the
type used for the initial mapping:

	irq: type mismatch, failed to map hwirq-14 for interrupt-controller@b220000!
	irq: type mismatch, failed to map hwirq-15 for interrupt-controller@b220000!

Fix this by not overriding the firmware provided trigger types when
requesting the wakeup interrupts.

Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
Cc: stable@vger.kernel.org      # 4.18
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 10fb481d943b..82544374110b 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -549,7 +549,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
 					qcom_dwc3_resume_irq,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					IRQF_ONESHOT,
 					"qcom_dwc3 HS", qcom);
 		if (ret) {
 			dev_err(qcom->dev, "hs_phy_irq failed: %d\n", ret);
@@ -564,7 +564,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
 					qcom_dwc3_resume_irq,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					IRQF_ONESHOT,
 					"qcom_dwc3 DP_HS", qcom);
 		if (ret) {
 			dev_err(qcom->dev, "dp_hs_phy_irq failed: %d\n", ret);
@@ -579,7 +579,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
 					qcom_dwc3_resume_irq,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					IRQF_ONESHOT,
 					"qcom_dwc3 DM_HS", qcom);
 		if (ret) {
 			dev_err(qcom->dev, "dm_hs_phy_irq failed: %d\n", ret);
@@ -594,7 +594,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
 					qcom_dwc3_resume_irq,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					IRQF_ONESHOT,
 					"qcom_dwc3 SS", qcom);
 		if (ret) {
 			dev_err(qcom->dev, "ss_phy_irq failed: %d\n", ret);
-- 
2.41.0


