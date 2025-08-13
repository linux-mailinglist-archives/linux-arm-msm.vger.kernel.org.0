Return-Path: <linux-arm-msm+bounces-69005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF943B24F5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 142235830C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266592FFDCC;
	Wed, 13 Aug 2025 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgQZrjBm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD192E92C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100799; cv=none; b=W9oHgKHJDL/50NQgIshxbrz2xIi/p85NjZdpJcbeSgV/WJcAzMK9YRTAQywxtSo1RpAw3bdbzRUCDZSOOlxzEVtGJ2BTLDgrIl9q3ctlkE8KWfwbprpvPWi9oCkj6HyU/h81faiKRpL8DbR+y3az0jerF9k+odBg5u1FHOj0IB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100799; c=relaxed/simple;
	bh=OgMk5j+Co8fWzhu7wYx+EI0ZaqZ67Cwt5Pi9dhdbSdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6bSZ6aKg1bEunSW+f9wUcEE3hupOVa+Df6hvbB1Rd1E2a2ukHOt2VddTa8hPglEa5JBKCbS08ayQH5wZmQHY1ONpI1I3iAEOIcbenNimpOKMGBrLM6mCXR6r8T1Cw9bJFmWUy+3U8rhiu346COOZlG76vkDAaC7tM0D6qCFCrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgQZrjBm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a16e52e54so6288925e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755100796; x=1755705596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLGRK3y3xDP2UgJq++RG3r+bB3WSDGMIrhAQaV+dVpE=;
        b=kgQZrjBml0Q+5agHM39D+YsFc8d7o8Cozb9LYMhvApmYB1O6GT11jNa6MDA39hwlg0
         yZvFZvnWciKzBhEN03UzwJYFasUuF1QCAegactD/gO9rJQ67lsU+EPBm5Zsl/RKoJ3kR
         P3ova8/IZQByCnxkrobChyMbrd/2cXhFjLDHg5tp77S/finEOOXabNBl5PcSjhzRTtzS
         dEzQ6WVWehG69JA7QfPMtfsOkbhE3qDGm3F/iz2Mh6ixP4MnZe9FYTzRrCK8yYi2FB0D
         gjfP5rCsTR6vZKsVb5mCZsIcE4X85BA2I8r+vq6ZL7IgJNF6y/DzBJ2J9mPCip7uZghi
         5OFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100796; x=1755705596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLGRK3y3xDP2UgJq++RG3r+bB3WSDGMIrhAQaV+dVpE=;
        b=Wh7QzR+x0qzd4IA1R8KS2XrkGOzy2z4lsbc1YyVe0fIZnJGZP4hrEXMy1L6R9tS7Bu
         R/g2QErAt/BRBLAig9EFIJ3MGJH43l0iu5p5jwQnEv/AdFSokXMjH4d2OdOWO/yE+HTG
         OOHogAOB231hPoTO6w9DLmNbqva1Op9pEni77Z8L+vjPjwMo3HrLXRCYr1N6j843blHX
         ABJPew6Mdi3V6oIXQ1mUCwC0fzQHloBWIwZalhDqQXwFAkUdD8o/+PuGIXM97UTP/ZXO
         uxZhNl62/iB7Mh8Y/UNeI2eVKs4LFXTzJvl4YTxykmVTlha8OpHLD135bctQr5JV3uYS
         DVAA==
X-Forwarded-Encrypted: i=1; AJvYcCUP/uMILjrxpNIRJv4r0J15ITj/sscGLRndn04iGyPfR0+sefKgcjUnbaBZJNPHyzlbIm5ifdQnqpXJNBD9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu7LA6iSeSbypw6cxGfx7jx5HSERcidO6xWgfT7XrV5dz884AJ
	mMMNc3G5AZFReO7nid0g6tj13l+f81neVxVmwR/xuFQ9Zz3Byyk8YJFqM8FCXlTE/7M=
X-Gm-Gg: ASbGncsI1u0kFWPhzpdIzm2OK7HoI8w4dBDKE2J0RPq0TRjyP3EWY5aLN3aWw+/YQka
	QCv11E6V23J8Tsy2gzXikCPUKNoreSXpM4n+KjVign99hNvRbqVPGiskoa9DRBtSQXGsdyYbd0V
	U79sh3eHoo4Zrevec01wpF7TrNjQz1k+gKY1VF9z6y4iN06ICG9GszQpLp8vuhn+Ot0IWF6gENy
	NIwpmXtwGENXoLQgW+z07+o77jEbr1j45mxjAeuTLNf6GwuRsFkPsmRRb/NclgZzJZ9ecVTjOl7
	qYXutrc78vFMiTmWELoYlsh0x3r9a/iRNgMC2RKpYUrOvcGZwimvdDyDhA60R5qx6x/WOU3Ad2h
	D1r2D+EaocrXhfCR/3Oln6ZvqtEzLCffrDJyQpQ==
X-Google-Smtp-Source: AGHT+IF+mTd29GafsqklT6SCsgn+jqtFYZEv/RqV/gBRdY7DrlXQAky4D9Zbx9eLOt3qutOLKgK02Q==
X-Received: by 2002:a05:600c:3b13:b0:459:d821:a45b with SMTP id 5b1f17b1804b1-45a1660b4f4mr33427115e9.9.1755100795933;
        Wed, 13 Aug 2025 08:59:55 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:4537:5d58:c08d:204b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a517c26sm7087755e9.7.2025.08.13.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:59:55 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 13 Aug 2025 17:59:05 +0200
Subject: [PATCH 8/9] arm64: dts: qcom: x1e80100-qcp: Explicitly enable used
 audio codecs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-x1e80100-disable-audio-codecs-v1-8-af82d9576f80@linaro.org>
References: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
In-Reply-To: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

Currently, the macro audio codecs are enabled by default in x1e80100.dtsi.
However, they do not probe without the ADSP remoteproc, which is disabled
by default. Also, not all boards make use of all the audio codecs, e.g.
there are several boards with just two speakers. In this case, the
&lpass_wsa2macro is not used.

In preparation of disabling the audio codecs by default in x1e80100.dtsi,
add the missing status lines to explicitly enable the used audio codecs.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 9369b76c668b5c008fefd85d5ca18e87ab9ce93f..8deb07197ffd7c0da74436d8562f540abe4c4713 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -871,7 +871,13 @@ eusb6_repeater: redriver@4f {
 	};
 };
 
+&lpass_rxmacro {
+	status = "okay";
+};
+
 &lpass_tlmm {
+	status = "okay";
+
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";
 		function = "gpio";
@@ -881,6 +887,19 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 	};
 };
 
+&lpass_txmacro {
+	status = "okay";
+};
+
+&lpass_vamacro {
+	/* Not directly used, but needed for fsgen by all other macros */
+	status = "okay";
+};
+
+&lpass_wsamacro {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.50.1


