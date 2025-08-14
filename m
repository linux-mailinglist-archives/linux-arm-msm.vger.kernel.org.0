Return-Path: <linux-arm-msm+bounces-69228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A21B267D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 15:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BA2218946E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD4E3090C8;
	Thu, 14 Aug 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tiv6WCNN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44223002D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178251; cv=none; b=ABIY8slt0WbcIXcpFyNRGnbw9Buo1IVzShZLGx3CuPBO/UAaV8JiWAnlAGv4TUVT+P5ank6W/rSH2jNHwNPwMwi7IIgf6322D0vCXtNCfNo9JGhPb6wBgIgbPOXk1NQ4qs2l27jaVG61DO2i6JCwcLTi7NsX0SUWnXsSecrhzJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178251; c=relaxed/simple;
	bh=JD7Iz56B1NuasqCqHygE01CXivCqvfulWdkwr+dDppI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fme602Li4K8DFAOSGq2ODCpJWHdxCNXJzqHHJ/tsYY+y/Oyl5HLblXNSi1uE7bn+Ry4xoRYlZFuUKUx8xAn6iimr+cW8j3p4J5WlIwu2J7zFDCITpq4MAylTatgqx+ElTpz+uXjqZbvD523xEsc+7F2AU723rEwUyBe5o5VeaQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tiv6WCNN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e414ef53so803781f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755178248; x=1755783048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ma2FaZO4q4SUf0neaLVzF3UOz/5ZhDRuzt2WBS2VTCU=;
        b=Tiv6WCNN/8bB0eoiTaUwpHYkFtfS7fs8ThmtdygBgMcYKA755QKepWLF9N1Gs5QJuH
         uUZ2AB/MvCteyYFKgqWtGEay95MlhlUs4pSawYFROvBLKYeSVkCxcKfeZBFfvoFMdls3
         dtw9auVmNntllno4EBpNsbILixblVdZy/muzPmNl+tP9R3Qgk+qWYBjfb+py+SSrq0M6
         uVcR9Fiub3av+zumZxpnPU8kDSsvkvW4MpRVF5oHIgXbwLBJ1WoWV/8FFJkfMV7qvy05
         jjJAlmyQUfBh6038gqg94z6gU4mnYfEuS8qFIW7b5djbyJPjh8Q6nuwSgMNERv7AGnEW
         zLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178248; x=1755783048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ma2FaZO4q4SUf0neaLVzF3UOz/5ZhDRuzt2WBS2VTCU=;
        b=DiZ5Xp1PPceYNc6IbpFq6qdbanPGKe3tThw8yf3tobjHQuZ1lqT5rOah37PvKK6hxn
         OqKhmz+zosF/g+PHj1RSd+G73C82exsC6pZZFjYuoy/jFp4HjI6CmlimlVNvn6jlmH2Y
         L4JA5/zqM+0XtEPnK/HJDIt9ySAquohYMx/+f9SOMv1+rQ1iNTjECeAk5rzZvj/soyGS
         CiFzc7mGlxd9Vp+xJTBIyuNMsdJmyLZfyVn1+Pw24jYz3lTJY5sL0AWvk07EkklPkRGq
         Ck+AkNYGWatal3LNmGEdqTt0CaIoKyHRRc55aWdwKj5KRNF7axZol2xoew3sHYzS2SJf
         Gb/A==
X-Forwarded-Encrypted: i=1; AJvYcCUfCMSS4oLtAiqi9K3N7pobcgJvOHzkeAt2ys31p5ctCyf1ChWZZ22Q10lbQvY7fSTYM05+xdxywN+RLV0i@vger.kernel.org
X-Gm-Message-State: AOJu0YwoscOjVsG0A2UZMpm6sS9/kMRtUiFVOasawlWlq8mmpdkl04nh
	DPIH3IjEhLzJSpJNYDAI71d9MxhSFdq/+f22SSVnGADpp64Nr5Bi/0v7KdIxWZDtnKs=
X-Gm-Gg: ASbGncu+v5lBLXsZ6zhNwAVkjp1fLYVj0K5tkyeQ5fDbtHcUnGTAnOJffFhqpbbgFmc
	GbVFVtjwrlCmajsGsTQU7Tr6xquIJWf4BMgYAakqNo0QZWt9r6jWHIFeQDKGRx5pW07kE2WAuMQ
	8oU89ooYC9yhFa4Z8ryphqCoDcOmcXNdhutCp9RHJCUyWDK9a9ZrxqhnjS7PaRkZ0kx0g1Z6CZU
	wdYwGO/SVK0dv1B950dep2oest5pZBzFOpyBHhEnhHlOlJ5QzBooEDjab1CmsMR38UCDKT3SMD2
	CtzUi1vS8fB3XjAhuDmEgFewj/7kk+bvFtHxCJ+xXSMqn0IsLw2ik0PSs8qHRkIGe6kOn5AlGpu
	cg8hFGsQ9YvWlsnyorUo1tFIgWe7sAX1S2gXr
X-Google-Smtp-Source: AGHT+IF3TLFfaVAD4ujisRsyv+NGcTZTPBV+2G6MawMPLF0SodbaBG4IlZiHYCWx1+FV3Ud7Gb9UPA==
X-Received: by 2002:a05:6000:2010:b0:3b8:d14b:8f86 with SMTP id ffacd0b85a97d-3b9edf4458fmr2741632f8f.45.1755178247795;
        Thu, 14 Aug 2025 06:30:47 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:9c1:e029:fc81:a800])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc85csm21468385e9.5.2025.08.14.06.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:30:47 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 15:30:34 +0200
Subject: [PATCH 7/9] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 missing pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-x1e80100-add-edp-hpd-v1-7-a52804db53f6@linaro.org>
References: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org>
In-Reply-To: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2

At the moment, we indirectly rely on the boot firmware to set up the
pinctrl for the eDP HPD line coming from the internal display. If the boot
firmware does not configure the display (e.g. because a different display
is selected for output in the UEFI settings), then the display fails to
come up and there are several errors in the kernel log:

 [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
 [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
 [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
 ...

Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
bias-disable according to the ACPI DSDT).

Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 71becfc5e6f649299b05b0b93cf74b81dea9fa57..2d9e78d515a1246ed46f00d5575e4b83bae1ef8f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1086,6 +1086,9 @@ &mdss_dp2_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {
@@ -1345,6 +1348,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	edp_hpd_default: edp-hpd-default-state {
+		pins = "gpio119";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.50.1


