Return-Path: <linux-arm-msm+bounces-82684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E9C744DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 14:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6016235ED13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1130A33ADA6;
	Thu, 20 Nov 2025 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqEQugTO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74C930DD35
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645722; cv=none; b=ixr33EfE0qUQaTdFYzpi+vMea18D/zlS1eAzYJLRasnqehPJXL5GeGb7vGCN4mSJlTuO6Nv1mKJQk0OTFSlWxr3Ld39fsbYGKDU2pGLb9Xl5zq+xZySRuujdNvZyHGxrbOj2xaEIvLvtATlmmDJ4N848AntmtroaHriMk1ezo/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645722; c=relaxed/simple;
	bh=G8yIaxqlMSXlJp1hZsvZsMSWwE2jQYO0tbip8q7uWvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iKuyE9XeSmEhFfyq5epfQZe58ED/lNzHK+fbJQb2ol/5OXyKLYHz5bJ9S5mYqeFTijL7MFcHDwNcX8olSslYO5qaJRovQfEJH4jmT955bkDzkK8iV7aLiV2+Wb6gWTadQoJpXEqRtIQJHWyH1nQ/arTHwSJB1Uw6Keie4hSlPak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqEQugTO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3c965df5so513142f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 05:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763645718; x=1764250518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ivhCsjIpN+rKmvMKFUskFMdd2JcJlk5CTRXG/6h4Fp8=;
        b=iqEQugTOred8HLJgcAfQm7em4J/hXa9o0ZJZ/EmS5wekyWk2Ndes/ez0hvJe4J8s4a
         A4FpdGZ/INvrVktFiPUyEsbSZA02311oCI712gaqd8N9aE7fV0boJ66f2c0D4J3HvB0o
         mDZFk1yB2I/9nOUmaeQLgukkeXatazFz/dE9xyE8kstyut1yVRfbh0p0Y8+BCjfxyz/x
         Y9TGppKypP4YI5D3v0foPmwbLaNJwe/Y2Fvu8QTCp8Z9t3gI90uEudf8qSqi9S5ilqNN
         c1bxVGmYzQHUxJfVF/YNNe9jFTDaRfF28wSUIM+fFfjxS5JAzOmpNl3HR90WdA9w9JnX
         QRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763645718; x=1764250518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivhCsjIpN+rKmvMKFUskFMdd2JcJlk5CTRXG/6h4Fp8=;
        b=JhZl3mo3fpdNOz+Afz3EVdesZfdJmtx3XVPDVgzrNtsMI14kWv6I386GMnHpwZauXw
         ffNL9RM4RB4aocdM14fyWzwE3FisXdbpLFxwax0LHxBsFivCinUg/Z5etnRqEZGhAyBT
         u2xLQByDlpuTL2rtyRXyb1WbDa57hQnZoybJRj8KRepWpm44xI9EwXQT3RF/coSAFYfU
         hoJbEYfM+QysDc6i/uDRY2+mlShquyaT/w9ptvW4xpLZKQGB5OL5jSNE25SPF65DG+FL
         wf3D7NcnSbRuxXCS2I8zlwBUH6gTDNXZ89YidGmpzTeWrxuMwMjK+mi/keZWUeda4nfE
         pYvA==
X-Forwarded-Encrypted: i=1; AJvYcCVQcHcIDiQ6y64niehkZKbZueoh7i22FX1dWJBNEDVpZg6aWxKzyMAtev96/y88nX4SOuNyuLi9BHb04TuC@vger.kernel.org
X-Gm-Message-State: AOJu0YzwnKiqG0Zv61Tqz92F2KihCA0Sxbn9sObfhLpnGInNC86ICxr0
	N7exwvMt3p+5Uw0gIJMRdZU9PMQx91RIAjzwrsO7zY23Id3doEO6m0p8
X-Gm-Gg: ASbGnculIokVmk1Wif7N0ZVWz6h2hi8ds6D2F1dxSZd/GRUjn58v8AOs/zS8vqze+ky
	Pwntd+L1F1gNt1qQ4cQJ77JasNgfmK8kpTJ/K62Oi5Ebq4QG4JiJH2mS5lqTSAxMF5PNsFiU/Jt
	vY4j11t9LDKtbjaxsr4u15P8C+b5gkciDLgN2GfFMK6Rs6kYfh/cqg87nZkwcChQoNvJfX7uoGU
	pTs12h/EbRZXsuTrsbBiNm8uMMLcIUa0QAk77yn+KE3hnv7YzYLSZ5lAz8lJ1Z17FGMNHVsZuRG
	9iEdixPPWIYZcyudk0bjnr2dgMYWeLxhub2scBTlEzDj5D5PWn/PH6FaIc7AHoTLnQVtj29xQMu
	eUMhry1ppuCssE45QZInTHEYS9OFU5GbgZIjALVnY3CHjVA7Ow1wx2VyEegOWUbrik98n9DYSkF
	p1H9FbTnDypQLmNA6pmhkxNMJdHuWiuvl/bX0J3h+z
X-Google-Smtp-Source: AGHT+IEMS03klaZwAAJMz9PSOT0oih6Mf5sEnZyDXJENW4M3aPZN+qxGbLvqwcRRah/8mB+rsAtzqQ==
X-Received: by 2002:a05:6000:420a:b0:42b:389a:b49 with SMTP id ffacd0b85a97d-42cb9a60870mr3180090f8f.28.1763645717940;
        Thu, 20 Nov 2025 05:35:17 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8c47sm5724685f8f.38.2025.11.20.05.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:35:17 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] cpufreq: qcom-nvmem: fix compilation warning for qcom_cpufreq_ipq806x_match_list
Date: Thu, 20 Nov 2025 14:35:02 +0100
Message-ID: <20251120133508.4237-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If CONFIG_OF is not enabled, of_match_node() is set as NULL and
qcom_cpufreq_ipq806x_match_list won't be used causing a compilation
warning.

Flag qcom_cpufreq_ipq806x_match_list as __maybe_unused to fix the
compilation warning.

While at it also flag as __initconst as it's used only in probe contest
and can be freed after probe.

This follows the pattern of the usual of_device_id variables.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511202119.6zvvFMup-lkp@intel.com/
Fixes: 58f5d39d5ed8 ("cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index d5af74bf71c6..6c3c125f6818 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -256,7 +256,7 @@ static int qcom_cpufreq_krait_name_version(struct device *cpu_dev,
 	return ret;
 }
 
-static const struct of_device_id qcom_cpufreq_ipq806x_match_list[] = {
+static const struct of_device_id qcom_cpufreq_ipq806x_match_list[] __initconst __maybe_unused = {
 	{ .compatible = "qcom,ipq8062", .data = (const void *)QCOM_ID_IPQ8062 },
 	{ .compatible = "qcom,ipq8064", .data = (const void *)QCOM_ID_IPQ8064 },
 	{ .compatible = "qcom,ipq8065", .data = (const void *)QCOM_ID_IPQ8065 },
-- 
2.51.0


