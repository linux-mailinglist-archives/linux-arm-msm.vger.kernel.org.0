Return-Path: <linux-arm-msm+bounces-46628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 732DBA247E4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 10:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F38CC166026
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 09:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A61A14AD2E;
	Sat,  1 Feb 2025 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQKKSnD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5684A1494D4
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738401508; cv=none; b=OfMk3idFdGJSVdE4xu9su46f8qeR+Yok+b/d5rocP+qKOj0P+JVmPYreFmUVGbYrlwgZB4MhvH+J2EdZyX66XVFtno/kU7ELttl45TBW+ceY5xMePqjmGcI7eijA5X50Cyla1q2XuqvF+WT2u52tPjZJHR2OcrtJ+0sTTkFhuTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738401508; c=relaxed/simple;
	bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKqu/rMstGAICbHagNclGwzDC2GIyIeetdvCULOX3GfZj8Sy3UExQyvtN4m6kN7RrlugvmOebpKAhzEkBf0XP+pbmsxTh6AHCa63VOE6iVPr9jQc8WuwuquuttF5GSEH1ZDdtoq5Wf25QtW9CzkICWXgNJLx5D6HKGXKmLBu2/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQKKSnD/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54021daa6cbso2965101e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 01:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738401504; x=1739006304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=JQKKSnD/ZD0kAB7DVqyPgBlNlTx8Bh2RPkCa9drpt1jqlqGWZTFAJTION916lMKi3V
         gvqbAirFaagHFBUZnoWgWqiczdR6/Ip/8ygjgdZDh/5m0a85czdGki3ORmBDhjZ9aDJU
         vrq+eHABBY8NpmFgQsMuLXvmPZS5HFx9S2GtVghba6dN0+HRHuiZPNIDHeVrb+HxB73R
         6HjhvQYaMo08gX0K4vleWhZdL5tNoWOWpQyvJbpOq1thnXXMCkZbyR71kGMt7RWGQFC9
         yxqDJAcXM8LuSBIPN5MSAtOWSHFNroGFBfAEeVgmHJ7taf7QD0dZJpxgENOrCmrB6a8G
         lXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738401504; x=1739006304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=KGQrgdH+r7ibpcZGE+0ypCx9S94/y8yFG9p+8jzkS/ojKjK4wdQquamsC2R7S0dsht
         26rOeiE4wVAsceJ7UcBqhAgjIJmjc7ESpVGH+Otxk9QWkWZEEmBayYeDhmHbir9uB/5E
         T9UPIqNQ0/JOBfKyjtjnK5zMLc31ND6NFOOOknEv+F+Dn2lMf3fBTfcesUAoYEPe4wqO
         Y17o2t0WweMw6+TvTntMElz7Gvj5U4851/nbifV49mvplGGoYPmz+v2alI3Ws7kt80j7
         gGX0GxyXxzVk2ZgzFlyuEGx/Wxul0zR7SURaJsMQloypwM7Kjixqka5PaK0ejaVlPBuX
         ziAA==
X-Forwarded-Encrypted: i=1; AJvYcCUs4COnPBF8tXUajLgNGXa/sb8yuLF0SYndVr9Gh4+xqqGZ9knO/ivWxXyD5wXxeJoh4EgOorah0V6C9UAL@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxlg9zgfjea+rXXjEcvhkpitA11yWAx57IoiOVvR+hfLqEJ7D
	xao4aX3BDTG2L8v5LEDkPLojJsBwKwTxJBu526Vl1XmJb9IP3G60BM6SiF8fFK8=
X-Gm-Gg: ASbGncvNmgQa2tl+bbHcNSDztqBjsKpwZoBNX39/IYwnsYV5zvaylo4LVTyVglWvROQ
	sqcH86EwSh4hjrLjPuZTCLru7zrNyj96Z4pyTzFGGrS3cR3YbqN6OvWH9ELUsw/dmezb8vsorm5
	06ZvnklSq5dHSojTSAleoK3ozEdy3fWB/WfNB2Q4ww4/m8f5puF638v1qiXD7wyU0pUhB+q1zyD
	DBTaq3eBHX0XqMX537hInhdr8gi2IiJ3d7AQ9XFaqA1IeZwywdATGgxavE3Yvjeru2biR98dqhR
	EBBeMmlJgstTXkIcUIe9q/c=
X-Google-Smtp-Source: AGHT+IGiRfjDKtaRtE74/3E32Xgbx+xUI+Z6VTOl4MviUCpPu0F+jCWREENY9yhpuR/ad2XyiVRB8w==
X-Received: by 2002:ac2:5d6a:0:b0:540:1abe:d6d2 with SMTP id 2adb3069b0e04-543e4c3163bmr3579004e87.35.1738401504395;
        Sat, 01 Feb 2025 01:18:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0ff47sm711234e87.93.2025.02.01.01.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 01:18:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Feb 2025 11:18:12 +0200
Subject: [PATCH 1/4] dt-bindings: net: bluetooth: qualcomm: document
 WCN3950
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-rb1-bt-v1-1-ae896c4923d8@linaro.org>
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
In-Reply-To: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnebbzl89z/LXYWIUNKnCvqLJKCCBTEZ+5EeSD
 phOp0niv6qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ53m2wAKCRCLPIo+Aiko
 1XTpB/wOUCuCsDnm0sv7LN/SmT6GcnhouDa4Jzkklz/k4zPqobHgUhqUwI/h/6OgsmjprUbDiYe
 neToqxBkjZPhARR2AppFVLNNVTkixM9TjItTaVkF6jnEkPe400Zmc7Spqa2SszmRkCOn9CGBF1j
 b01MJladUlpuRymUxSB7/5pWjqKGhlST8/5zi6iXQsHYGrN6Lptb0j5ZF4tqVSwelW6AcSkQxOS
 3p8hExOr62p1ckoVY57dfcfJ1CCsW3+BhSKu7xqMk292Mb2P6UxQBj0hfcrPy2VxL90CH9gLAIu
 4Ns/oCBKjIFlU34yhCVieV3C93JnLX5eCxCMlUmwfn8tJfPD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

WCN3950 is another member of the WiFi/BT WCN39xx family of the chips. It
requires different firmware, so document it as a new compat string.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index a72152f7e29b490003114dae1e36df85cba384df..6353a336f382e4dd689d1f50a624079aa83b2ffa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,qca2066-bt
       - qcom,qca6174-bt
       - qcom,qca9377-bt
+      - qcom,wcn3950-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
@@ -138,6 +139,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,wcn3950-bt
               - qcom,wcn3988-bt
               - qcom,wcn3990-bt
               - qcom,wcn3991-bt

-- 
2.39.5


