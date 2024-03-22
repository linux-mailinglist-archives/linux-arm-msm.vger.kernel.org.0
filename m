Return-Path: <linux-arm-msm+bounces-14826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D3886BBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 12:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B8F61F21733
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56CA4087B;
	Fri, 22 Mar 2024 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SzzfDcth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99873FE28
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711108704; cv=none; b=fbaOO4Cm7Fg38FDUw+VHPt7xbwHaMYHTanG0HYiEwH3Af0IlMpkVWCqvxZ0bOU1bXT21y0d4SV18S8kziE8KJarT/h6zJSsO0NI43NHvWeSgwFM7gL079veC1yklVdFQxoHoM3bTE65hXMiPo1QAADeGxJGLntqEY5rywMTJ5p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711108704; c=relaxed/simple;
	bh=klWITmiUJAw96kWolfMC0LTldb0sS5vuE/5wLwzaZNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZ65xdej0zdBt1v9v0sV609wdwfIydPSmxA0tDa7js0Y36y9z6uDur7a5tjKaxbaii4dz2Hq/wc+xZwsUad9z1gciwgeNdG4goPFFI9bVODl++TxWMMHYy2vdQVjpjJoxrOk/xlwh2CEGns0hT+3W/TEZc2mVG4eK34cM1zjpHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SzzfDcth; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d46c2e8dd7so25217031fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 04:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711108701; x=1711713501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOWVWVwj7EdMUJukxyKvzjZ+DIbrq76QkkLK8E9WRBE=;
        b=SzzfDcthO+6a2qZQvq+NK5bxAS/fTyYpohbMDzA5hqe0HH8Kph+RSCdTy6bWnrLDVK
         f/wYW/XrbK6d5FqNFl1FqDUuTjkyT4OUeAsDXnLVJHOXFXV+8ITvop9V8FttcPyt4Tdo
         VO6fOF8/fqJBXZxgGMe1ko7CJ9jg/EEei/XOR4GlI2jRghE0QFMS3bg+CYlZP8OltFmD
         LkV1X32YyiAyljDvH4lClHHs2dW8r8ROV4I7TpGv1aae/kvZh68Juf47KjjkN4i1/AdF
         gzyVV1hxhL1JAJq0vEv8Co+S5OQSlIeEEyyhVe2zsrAzWthSuo8+vR4Ccu+D2/bmkQ1X
         hvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711108701; x=1711713501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOWVWVwj7EdMUJukxyKvzjZ+DIbrq76QkkLK8E9WRBE=;
        b=In4DrkWB1MjOWJkWNtgtmCPHWUz/zsc4jj7LLBesF7Q+dkohJgTqcClKtEtamVaiYt
         +RywBdwVNa8uK5ku+Prdt2ohYU7dYViteyEwRXavS/5Ge31xNNB1tNmXVmjb4oqdMrvq
         f0qBuYnkG3nXftReZvLCtj4lLTIu8GXTbPa1eQaQyPgKbl3Gb5vdDj8sQ3O3G2jGIqNN
         uyppmXKBcm1+/XZCD3OCuy2g0GKWoWBOkqQnb05bT52PGGFVRSm89pvzpNLLHSPcdM/n
         yyXGHAgsdH2pe+CcAG6r5Aw5Oh58HkZBB8uuYyvac6EhCunc00d3OscvQKoE9BIO2D7+
         UWEw==
X-Gm-Message-State: AOJu0YxGhBfrx1mN5TjD+tVqC4tQRuRq3eS34d0A1k3X5qyr3FKf0U/M
	a04ko8n9iL6UUqxAsF64nc4lTUzzCx5HxbFRzRpZwpKZolQxQCqIpp7QH7aQqAY=
X-Google-Smtp-Source: AGHT+IGR9a+AlRedQB1hesUDjGcqlXTZnqhz3FqST8/6tOBZhQJ55bnBd9X17LxajFBPn0/r+xSWjQ==
X-Received: by 2002:a2e:6a12:0:b0:2d4:2af0:82dd with SMTP id f18-20020a2e6a12000000b002d42af082ddmr1614692ljc.23.1711108701304;
        Fri, 22 Mar 2024 04:58:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d7-20020a2e8907000000b002d10daeb6dasm307430lji.126.2024.03.22.04.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 04:58:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 13:58:17 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: add a link between DWC3 and
 QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-typec-fix-sm8250-v1-2-1ac22b333ea9@linaro.org>
References: <20240322-typec-fix-sm8250-v1-0-1ac22b333ea9@linaro.org>
In-Reply-To: <20240322-typec-fix-sm8250-v1-0-1ac22b333ea9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=klWITmiUJAw96kWolfMC0LTldb0sS5vuE/5wLwzaZNg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/XJY9dDW/dpFrSrExyz91hnEVYf666AvKdGua
 PDyoheR51KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf1yWAAKCRCLPIo+Aiko
 1X8RB/9n5scURPgViJl1VJYYtVMKsNP5WP4dVhy0Q28t+ySGo27BT8UKeubreNO9MBBJNd3jtpk
 ZklTwIL3zAxW8CIjhJt5z0wGQaGaxMyk/h3+Hs8ctDlO4E9XF9+HnvI7P6ymaa7ka/t2sHgUykx
 dvn+odliSvU4kN7rQ8dqB2cZ0jafTiQqVOKUSgYI3FqEviuO63Np0oNeZdXg5r63ymGazNhEhS9
 UXNnQgLGgYtb56syElR+P5qHE5OuEnTR/CKIUAELJm6IuCp94jG57U+T7j6lzzL0lpHyBFARN1p
 +fQyYmzjnLdLAmf6RlwbMCTV6uzOQUOQtP86sMUbFDBYUH4b
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SuperSpeed signals originate from the DWC3 host controller and then
are routed through the Combo QMP PHY, where they are multiplexed with
the DisplayPort signals. Add corresponding OF graph link.

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d57039a4c3aa..e551e733ab94 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3917,6 +3917,10 @@ port@0 {
 
 				port@1 {
 					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss_out>;
+					};
 				};
 
 				port@2 {
@@ -4195,8 +4199,24 @@ usb_1_dwc3: usb@a600000 {
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
-				port {
-					usb_1_dwc3_hs_out: endpoint {};
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs_out: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+						};
+					};
 				};
 			};
 		};

-- 
2.39.2


