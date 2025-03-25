Return-Path: <linux-arm-msm+bounces-52485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A95A70A36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 20:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDA011897E58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 19:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894021F193D;
	Tue, 25 Mar 2025 19:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJo06LQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F95B1EA7DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742930508; cv=none; b=CzvGI9oLx3iNj9WbJjcps2Ypk3uHcJXSJOJwxIy6tUM3zv6YLmXjXGNDgvSj6Ui3oz2zgqvNZY0DT8LvlZrx4YeaM+MBJBgcKNQ/IMiICD8oEAzjIQYSMKUAmwWdDVEnrCtG3XVfgqMmY+U6yI4BUS7rmRej1MwRqz3vrq/de0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742930508; c=relaxed/simple;
	bh=q4tddGAYfNL0u17TA/snEFeNG4/qEjinNjCLGvABuWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MCfD786XIx16C4Pf4J323OttfgqdmyfLFsH0Bc2cOXDH8beOOcYd26na2TcwYZA5WgESGtuxSLt11B+hN0eLuc/4hE56Y5saQglkIKPTBuFCZO9dQ606c6XKvMkUMnGmgvNOL5dHZAy9pesYR8A2/1vOz7jJwSzoN9ZJ1Md3T40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJo06LQc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso95144f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742930505; x=1743535305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxvqkTdGvuGSjqhrzVUrIUOoBiHSaoV6cZ2RGP6GPns=;
        b=mJo06LQcXz/wtWHWdvR2Fpbv3Q/1E3QpZThqJ4l+0ZOhd1mYs4tRoiwkM4odZjbb+x
         UP2kh71tdPAeo97utbxME9h5o7YtsFr/IrIKycdu2DQ2m+z7CQSz+XDioeNEtWF9S/JP
         gWyStNoabCGajozVxophP399llFd+BItZu4RDwNfFNr/Gh5IjKycpk1O34CYpF1uDvjV
         TfQ+TJDc9VIg1LramxNmXxAXViZ0YslB76l3+rCatVUv6lqQHpM8mwMTbQj6hjR6M2aB
         vWzJScyO64NMqS3eNqacgzyChvYOAaDTqt31fMTOCQka45yC4wRF0lWpKWboPGV0Vziy
         KPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742930505; x=1743535305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxvqkTdGvuGSjqhrzVUrIUOoBiHSaoV6cZ2RGP6GPns=;
        b=rmnKM44pGQssxZr5X7Svv4CXTaHs5nuH1m89tUlw15YawwTW38BkmLhGxtMXWH6phn
         j1yvp/7TPKjOR6XLJK/MPhj+RsQ8b1zOFo7sxcLbFlHyPW2gx2aWgeoOlz/UodfdSFJ3
         dBI3+L3r62sRueKHW7UrinfT1kuvMpGxn44EKS7Npret+LdQJonn+o+5CUSQNjiotmn3
         rlRokStqOkxehKQNgAX5Tkl03QcAHrF+W+wg7VbYITHaQkloNwrmExTEXaUen8679I5j
         tbfzJDQJ8FOUjHi3cqLMU38v/xVZNAM0eYIVTR74yO6d8sy5b5oyt+zULsAXYyzImGjP
         sS4w==
X-Forwarded-Encrypted: i=1; AJvYcCX+8vZtnYRmS3sfeGfZmwV5mbUwD3ZCp0cBpdOGfCKWqW9WLuc7m/Z6/Rk5iRQA7JB2cm4mpngZ1i7e+kzz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rm2AgLzm8D5M6wM96EWnmP1/U8ys3ZM5aOWTvRiyqE21tAxf
	n4vvcpNw+gNqOE9XgTAqrwS0ZE2k925QP52MW2KM6UmVcv9gDTZB+p63XYZTG+0=
X-Gm-Gg: ASbGncsxyGeKSvQRp0gNMrLkHq1O4fsnyjfsGs6TJ8nLL2gb/ktqA5XomRB2bMCiEs+
	cGunDApEZVe30H2zjCYbH5KXoN4MMYB38XsFth2r9bSbgm+pWfCcXw20PpFdYWdhOli+p9JFopc
	cn1O9Q+ElX7yW/pPrUTfX/FKj97FcvZHv9JKFbc1nC/DCt5Fct0S6InIDyPjE/JaybZivbLNDt7
	ZGNMMYyeXy9NOaRyDsKlUJuN4SD9SSh3C4plXn/NLoDeKGfG3fRmlYwpYSUqxrRb923hMYXquH6
	Wr0LNeuGJJiXr76/A/hdtztYLoiw2sdBO3cMSj0j25wcmLNLP87yA/Fp
X-Google-Smtp-Source: AGHT+IHRlceyhZlACr4GcEuFhwMZV5G5wdPH4kkq8OlJkmWPgi9IdR04WHfFTNBmt5EJiPql7Pm1Bw==
X-Received: by 2002:a5d:6da1:0:b0:391:21e2:ec3b with SMTP id ffacd0b85a97d-39acc466003mr790595f8f.3.1742930504728;
        Tue, 25 Mar 2025 12:21:44 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9e66a7sm14478968f8f.76.2025.03.25.12.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 12:21:43 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 25 Mar 2025 19:21:28 +0000
Subject: [PATCH v2 3/4] arm64: dts: qcom: x1e78100-t14s-oled: add eDP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-3-e9bc7c9d30cc@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=q4tddGAYfNL0u17TA/snEFeNG4/qEjinNjCLGvABuWw=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn4wJFmq6AL00WXVDlYzrdkH4CzSmxYGmTXpa0m
 u9TljEzfDeJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+MCRQAKCRBjTcTwaHBG
 +EmJD/9D3NOaXAF14BVPpU7PBWUrjNq7cBfm9Bg+9/4H0Sn+syOkiZE4B/CUorkHwU3lRIoJwBB
 6m01gITDRd5Ar9cpudpi6QIVYTINRG5losXPeaYdzQg5kBCfcTwzmDSBL3rkHvbPIE55jmpQ6uG
 ivlQAixqTbZpt3HbMh3odFL/RRdhADfBnMlqH4FdJ0BgcoESYXaqH+hrN3UWAY3dlAR2PGr0PVE
 zFDUNSSPNnWYf3gcl7oxgG9Af7Se6sd5RXHNoYS8nyv7ASL3EHicwoCtnqJqbdzKcw+5LpyGwuk
 dJlROQeTGK3BTzm5K2cfXhXvCgyp3Iw2LkFUysgTmBzZOm0FlE0OPEVDFxbRPVsS7jsnOhJgmie
 qKvxiQbF1g/NWxDVTKHSFraFu1clWl56VxHw8T1D3ivEhzTL+Ihr1/rHtVIZdjjnM5uquI+kQCR
 ButPiDFpKY4GA5yUczVKZFQJ68GHBdkLo53+ukerMEhL1cRDWT+CE0LHh/Wt/uODWfDV1G/h+dZ
 l0kqSSxckL9iUzRRoWcAE+PhbJFvyp56uUQZoN8M2nOdxbB2qisZ8/6vS6tD2K9vpUtUvddBvb8
 ujH+DkS8H+g0EyikonqP7V84j69UQ0WvcMFY39m76Uxvt/wUn9C7JSNiHJo6mtb0J94r7dSJQo+
 YoAeeN6WoYtTYuA==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Add the Samsung ATNA40YK20 eDP panel to the device tree for the
Snapdragon T14s OLED model.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 .../arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
index be65fafafa736a0401a5872c40f69cb20cfbbd90..753add73df41050565e71b9faafee62bb2031b75 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
@@ -10,3 +10,13 @@ / {
 	compatible = "lenovo,thinkpad-t14s-oled", "lenovo,thinkpad-t14s",
 		     "qcom,x1e78100", "qcom,x1e80100";
 };
+
+&panel {
+	compatible = "samsung,atna40yk20", "samsung,atna33xc20";
+	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+	hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
+	power-supply = <&vreg_edp_3p3>;
+
+	pinctrl-0 = <&edp_bl_en>, <&edp_hpd_n_default>;
+	pinctrl-names = "default";
+};

-- 
2.49.0


