Return-Path: <linux-arm-msm+bounces-69728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA57B2BF3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A26C3A97E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26617322DB9;
	Tue, 19 Aug 2025 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dYo+8Plh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5691E21507F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600338; cv=none; b=UDle2kEiOoYkLadP5Yr/QqUFMGEmBsMaa1eEEYruXJdg+ZXBGv7rUcIXcculJ3kcRI5mgtiu0P9c8ayVItH6m03Zr7joc/0TkW667xiQBO1ths5t+mzxJxrZtr+nSIwVyrsTXX+IdC2iSQEkPc/YNJnwYqGBrx45hEZPK3rY1cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600338; c=relaxed/simple;
	bh=CoGnRVCEsryh+FbJQYTFV1jTmW3dnOmX3oR1hC3xB48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASmJPOn57jjG+MJPxnp2PayC/c38XQLEjf95PpmqOn/wImxPe6Gtiq2N6wgywgV4ZfMCifX9rJMkF9mNVdg1L5WatirATh1SRZjq6MdpAal+EjGztjG1kZYBcAL9Yz/koIrpkhpi0sI50XYTRA9AOvKRjA9aWr/+TzVfIIG/A2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dYo+8Plh; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6188b7949f6so9539140a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755600334; x=1756205134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNWfg+jnR/IJfZkh2W9jbuKIKGtjrjEx/l7JEhyxTVQ=;
        b=dYo+8Plh534a3EXzfPYL0+N/Czr2HKWjO4hiXtpOFMeJwMudwbhoWaVCeqEjhI4TTa
         T10k0JAHQaj5HOFYoMj/rcwEKNetItXqSXU19yH4VgHJmslHKQrkVlzxq2P76VMxy4AX
         7drq5i3EWDrEHkpVW8Pc1a8fRWQKhDNkgaVDUDHZrq+Bui3DWBnBVJzZDqZsT8k3N6v1
         soMtYLj7ePTFjZGvb5BJm2OQs+DpYiWXEwo+mD/MK01aFJ6D+ypdSy8sBr2cNexF1DQY
         Y0v7ZQi31r8nuzbW1IpCkLDz2D6ghuTEzPoYmjlqYP6j2jafwBsYlZX6aRNBMMvfil0d
         831w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600334; x=1756205134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNWfg+jnR/IJfZkh2W9jbuKIKGtjrjEx/l7JEhyxTVQ=;
        b=bxlRryUhEcpzEbSr3u4MQrP47aiu5cXEqJBsFWHnKw2PZEghAy0FLRN41GtMRV968R
         avsSI1Gm7P+ggIB7A199Vgb1XudMGru+d/2HNGf9usZNHG6nRrjuszY0GdBU0BlAPBHM
         w7sdJVbUuAw/xejyFLkuNY3hF6CEXCMB4AEAoOeikYwZdQ9kDhVr4FfGIa7B05zXkVCj
         z2DhJQ7aqwSscR/JRVgAbf6P3iUau6V4OPrLZp8xuYL9zQh3MAJ0AU9KdszkhVliIZae
         4QYP2tAFRvB4TPML9Kbl6p/LKxQDZE2XRsC3RlmWtHFeX3/ezJJBM3rkAaxE7S03wrZT
         V72w==
X-Forwarded-Encrypted: i=1; AJvYcCWo1ziXDDaB0FsoyZJig2HQGAz8REXsKpo5D3tBQZAHf6sLyK9fz1aVz/0ChVWqVY1C5EhPwVY0hkDzIhHf@vger.kernel.org
X-Gm-Message-State: AOJu0YwkKkIJnO756nQRmIHFsZpe8DRl/PnPu/3BlAbQ8P22Tc4L8bgR
	GoH8EGhuDWerxStHjdA9yXuh2ZCcULEu/J539gkEiUF0Sr7uyYmhX/Smc6pEUDhRQLw=
X-Gm-Gg: ASbGncsH1LyeqS1Zx8Cpo2PA4kxKM8xWn3Jo+LtCieX0uicEAvwVJI8yM9wtXXcCeXU
	rVMP2MKGf/O6pQ3u4/xwrVMD83aokjSA6FZdVEOwPqOu2LisxDnlGQGWKjtH7/cOLxPAOjmq6fa
	RWo6ZwFk37Zbxpz9jAipx1qdR+dD4fXt72Yv3MJHIHlUkNGHcDLlV4JP7+uk7LQfT4pZdQeRjiM
	EovBax5u6ygjw9lqTEoM+8zkeY74hwGkQsyoUxui8sHWEZYOcUKLAt6buR37gNf9GEcUPBz43wp
	0L4z7jRwTUgQzGH/wIhqHtfqW8Wr4vpLCwVO2bzPiGnnT690kxcpzeQ1mXxok/mn2BZkMFbFez8
	jrESTMGYka/dsgs5Br4ecI74DfKHLbDcrt/G2pg==
X-Google-Smtp-Source: AGHT+IEE/a1cKOzDFjQ1Qc8gYfnMR8SKLgI15DshI4v7Whp0lmGCWNGsKtl8WSrbZmbUgtPlX0xdNA==
X-Received: by 2002:a05:6402:5247:b0:618:6615:30df with SMTP id 4fb4d7f45d1cf-61a7e70bb70mr1435647a12.15.1755600334057;
        Tue, 19 Aug 2025 03:45:34 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757a48e2sm1469787a12.40.2025.08.19.03.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:45:33 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 19 Aug 2025 12:45:21 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix
 swapped USB MP repeaters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-x1e80100-fix-usb-mp-repeaters-v1-2-0f8c186458d3@linaro.org>
References: <20250819-x1e80100-fix-usb-mp-repeaters-v1-0-0f8c186458d3@linaro.org>
In-Reply-To: <20250819-x1e80100-fix-usb-mp-repeaters-v1-0-0f8c186458d3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

The &eusb3_repeater belongs to the first port of the USB MP controller and
the &eusb6_repeater belongs to the second. This is obvious if one looks at
e.g. the CRD or the Dell XPS where only the second port of the USB MP is
used: They only have the &eusb6_repeater and already specify it for the
&usb_mp_hsphy1.

Swap them to set the correct repeater for each of the USB ports.

Fixes: ffbf3a8be766 ("arm64: dts: qcom: x1e78100-t14s: Enable support for both Type-A USB ports")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4cf61c2a34e31233b1adc93332bcabef22de3f86..e04df29a8853797c0e36cb60ebc2fb3161a41d30 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1543,7 +1543,7 @@ &usb_mp_hsphy0 {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
-	phys = <&eusb6_repeater>;
+	phys = <&eusb3_repeater>;
 
 	status = "okay";
 };
@@ -1552,7 +1552,7 @@ &usb_mp_hsphy1 {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
-	phys = <&eusb3_repeater>;
+	phys = <&eusb6_repeater>;
 
 	status = "okay";
 };

-- 
2.50.1


