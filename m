Return-Path: <linux-arm-msm+bounces-4110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5548080B78C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 00:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1E3DB20A73
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 23:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E55E1E537;
	Sat,  9 Dec 2023 23:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QK2yLvas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34F310C8
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 15:21:41 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2cb20c82a79so25268271fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Dec 2023 15:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164100; x=1702768900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBuwfYsDiJwVlg4rvr4jjyUZUrTiG1ABFINzPvbdSwU=;
        b=QK2yLvasroc0Fde8BTJPyZm2szhT0yZ8sP8j28S8xyKlwDPLb047JK+xAYMjzNXzP0
         IGZgQw92Oe4ACyT02sbcXWthKuF1vXsO7AV7JEJzYDRQokT2bTdJJjsexLEMDoGQFLTJ
         uXxHI/cbW1KB+j+pNDhHFe/DWSEXu3ofgjekNKfg8H9anVvv/cTjnqPw/DU0/nooPY8P
         Hhg7PHBr98nRMjEkwC5ppxrQpt0dfyccqKyk5nZoq2Dqm7xyxwmFAYVh0iWGQd6oPhxA
         5oZGz5ehB/6khkd2Gwa26qjA1/QpUvtVjr882cBSvp505OjJek7r+0pMPrpom5gD2t8q
         Q+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164100; x=1702768900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBuwfYsDiJwVlg4rvr4jjyUZUrTiG1ABFINzPvbdSwU=;
        b=PYrQpivnrvh+CIJhwqfhFsz6mYSbr6a4NxpV6u4TkETW/B5x5vYUEymPdTxRHXNYiQ
         2AVk9xMZNfr1WhcKpKi4Uu3wVY1UEcb1m3plmHIoAc0R1x0DSJCZRBZG3s4WTz71wELn
         QyrCmASlcz2A4skwe0xeNOSm2py757FXpD5e5/7oETI1m6q1aVIKAuDjU3OYcHHN5zL5
         TxRWKMkmlCg/8T0FXKIx50tRqSAXWCcmV8Wz6ezpoCfzrflzjzbnhq9+bSQr41yffbWj
         eKYKYAJJAbRSRHQkz07d2HGOxe9grXkQMU0ZZKwBICZDOGUJBbGMTh4xBgP6gLteZQ1E
         cpNw==
X-Gm-Message-State: AOJu0YxtSDIEBpAHXoZmdRp5qOEdqLiSOJPIliraRqZzkY/woiAMEtgU
	xvccaMTpg3CamCJqrsUXl4TCbQ==
X-Google-Smtp-Source: AGHT+IGPXYdWbn3virBUu7OPjkz+CESPfgEyBwgd0JRLN8vDQrRqSbMdF3S8YNRY5tYiZx1Z4A6s2A==
X-Received: by 2002:a2e:a805:0:b0:2cc:1e83:65ee with SMTP id l5-20020a2ea805000000b002cc1e8365eemr29233ljq.56.1702164100179;
        Sat, 09 Dec 2023 15:21:40 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:21:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 8/9] arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
Date: Sun, 10 Dec 2023 02:21:31 +0300
Message-Id: <20231209232132.3580045-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand first USB host controller device node with the OF ports required
to support USB-C / DisplayPort switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 38423a9f8408..84f61e018d78 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3605,6 +3605,25 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 
-- 
2.39.2


