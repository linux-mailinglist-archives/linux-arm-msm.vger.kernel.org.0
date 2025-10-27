Return-Path: <linux-arm-msm+bounces-78966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0FFC0EC77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E92681888BB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0C630CDA9;
	Mon, 27 Oct 2025 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qmymfqiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F88030C626
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577188; cv=none; b=AxyfOgUHci4e3BO3I6VfFgu+SsRyUsRq/yrg9siiB1+XfElMh6YaLrcC2RipcQF5jQeQEd1/WaOi9SLVmym3LrHdm1GbQ5qngIMEWaU81k2CH9yggCYzSDxt7VIzW5z1A6NiTc9UtplFNsuX9L+028dApptlzJc8AVpTFYF/rLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577188; c=relaxed/simple;
	bh=m/Ryf+3/Ba7bj8cfGk0q+ZCXj08lxgpxWe3j8JBvzwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBAmEWw7pLjL682oz88X5YwFojRd6LHHPbV+G0oIH9Rlixum+n3Eh9VRohK/7AVY5UOqbCGRO9BLNiLr8NZ4vkxQVdLNUWP8vwbTLvGADrNRxM/lsg349T9Me/0W69atPln5i+11S4OltQePJU9Dm80/dsaGDxzWOP0DQJ/kQQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qmymfqiB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-471b80b994bso67383845e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761577185; x=1762181985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqsKQ8///0zondjUQyLirrRSCHthDErDWugJZ18wpKg=;
        b=qmymfqiBsR60du8RWiWwIg3biF015IVMQmnM2lvPpt9lwgBJqvA3BFddX7k5hV+9TZ
         IXYNSxwr2MRRxidnkN9ESrgigg23xD+VC6AwH2bamrF+oUTaMEr+Ou+wQaGIPcruxEqa
         /17WUVu+0oRrSu0VDe3PzZqOLgWERu/RJz8idjGP0F/cfFF3nSyPWvkAYa/mRvcWlfzu
         +lUSI64Gyp9y7SsT1OkRySzzbNp2QtYt0K2zK2SUmm5ZRSN/ZCvxY/m5BucdV3jYxDSQ
         y2YnBlXLfz/avIAahwkTRm6Yro4q6Ho8VKJZegtTC0U0lCpitU5JzpqqxLeEh9z3rGB1
         QoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577185; x=1762181985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqsKQ8///0zondjUQyLirrRSCHthDErDWugJZ18wpKg=;
        b=h8T/TSUtoGRtDvM9ZU4/rFH7Y88Ertc2TV6AFb0jS3Bc7c5VwNDVmtFO1hV9ypQmt7
         iOYygF1JWdgRIwnFBjL+BmyfR+5SP8NnYvf/R0uq6Wa2W5Dgt0UBHcrCtoiXXrsmAKEA
         WPBfhAf7MISlH7LQAb65KsCCDcqPdXghHu/yNxuVjYYA8CgrH/eb5rFsW7WKTkiiVggH
         8fFhpIBbL3eBEWhOmw+VhvMmgTW78Of09shHQEb4DSw6I8RZVGXUiZywFStCkYSTXxch
         Ohmt6Apriy0qYRSJTHWGM32ycpi30+3E5JI1prxWMzp3IYLQZI/9e0V84Vxa2J2AYFmB
         6Jxw==
X-Gm-Message-State: AOJu0YyILYUVgF1fXbm0SJOT2GswufSvzugSZfIk6E1ADnwfGYL36k0m
	Nim2DZAC0KAgABuwidPkll+C32qDUQSJ49Oo+ExAEzuuT/RA18c5RmGdmOeGZwuI7ZOM4dhOznA
	ZkYbg
X-Gm-Gg: ASbGncv/0uTg/NsPFa1TyE+uw4yfHszDBwcTe+CsxLgN2UXowJT019leSWCaouveTVy
	EpxSzZEJQ+9GsdrVyuPnwsUdY43XRbQJSDEyq50fD8Zf4SIL0rDTiLPbCDp5Fetin9h1NF6TJ1X
	WkyYotzbKPizMNTZ6GzX4RqAFw1u4CNqHPqbeVjvaBEuoyCrRt+qGaq8LpglLGxkjHJ2EZRSsV8
	zMTWTb1d2SXgNrtWgtRh54SzQpam0r6/R1DO4ppAny+L2LVkSC2onykTJVzlZJFy274CtH3OSlq
	dlXGN0TyiGpKtKTADyREh4/an/YPSgd036Y9gnQapZVVSRKBIJkumApz7NVnk/WfhC9YWYxt+kC
	4VsiQJne7C+URgrZ2dcbcbU3rQ0xsP1Cb8wQ75QK1Jl6ASe/QdfhpD0yMs3uYo3aQwxpvCXAuzL
	EFUvQ2Au2l
X-Google-Smtp-Source: AGHT+IFO7Got2ubevHRfgj5QqQ+su96RPdM4Gxx2kUrMjZfw7k7B7E+Ut+HnbXiTZsiZtBSeBGG6RA==
X-Received: by 2002:a05:600c:83c3:b0:475:de68:3c2e with SMTP id 5b1f17b1804b1-475de683d45mr63857665e9.40.1761577184642;
        Mon, 27 Oct 2025 07:59:44 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:59:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 Oct 2025 16:59:21 +0200
Subject: [PATCH v3 4/7] drm/msm/mdss: Add Glymur device configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-glymur-display-v3-4-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=m/Ryf+3/Ba7bj8cfGk0q+ZCXj08lxgpxWe3j8JBvzwU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jQBp5H4dDRTqI5TaS3RfQjAj9H1dixDkmAz
 ixmM0LiGYeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+I0AAKCRAbX0TJAJUV
 VsLgD/9+wwEnPPeWGdL3dWWtgOTfnTcC8jpTFqVVENytsh45QdKu9O+0P/fh1WSXFMjpsRrAbs6
 WKbRfNOvZ03Kmw/sVbytPerJ64AkkPGZlGirnte7kXlFkveP0Ecghp2yBfQG2QC09wehxpJz2v/
 PlHSdIQ/2SFYE6cqk5A+Pcf24WkliOJ2qsLI7DORwwZzSD3ThX7woyimkMSVzC1ircRJTIMpeDw
 QlGQUFaTPTuXH+NK1Nr9k86yqaTUACN0Taao4LLRtu9IbruWMZn30BCWHAgdm1+TTpLKVZtSUpL
 y9DPFsoqv08g04uof6sf+iKJ2s6ipoYUHFZESnu8PbB5fV1Zyjuf3mNbC+wbNuZG3XTZN+T8G6g
 rGIQ118FHxRuUOjcr6FlAacjRo+Ja0vq6LSAemYm++pPa3pAR+ArtAvSpq1IFj17O3J90rSZH/K
 zCNy2Hc32837x3/jwgJm2T59ASUNXnJMMyhUiFCkWWsjIsPFMY6Yih++ai84+ft64EQZUa1w7AL
 2mjbDUYfKDEL1CsNDfoKPsUVkPc4D/ILE6LTsQBfr3DLIsbME7fgIh6UPnemG/pSpud0TKg5k38
 yDSl2yyq9Tubt7bwohbnH6rADGfrdlFjIVjkbMmmhTXD0HBdncIrt3bCJeHJm2diXhvfrVdQYeF
 iYhgQ0RhQ/2E6sg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add Mobile Display Subsystem (MDSS) support for the Glymur platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..60bd6af83a8846f2ad751ea625a20e419c80638b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -553,6 +553,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.48.1


