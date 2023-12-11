Return-Path: <linux-arm-msm+bounces-4237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8480CFEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A9B31F2199B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75194BAA6;
	Mon, 11 Dec 2023 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GNF7c2kS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093A7DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:54 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50e04354de0so397285e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702309492; x=1702914292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7zbPBXHSyKs8YSU00zvyJoXqedAJO62IkrIlwwzL9k=;
        b=GNF7c2kS90iJm3R33zQemaJwid59l5ZiDpW6QwKu+qeyMbOjgvnzESIznKCmJJ5OAv
         orIV4m/eUlziQB/neJ8G20lB+Qf9rHRJPRUZIF5zJ/+Beis0Hm/aEk1MzgIZJC9+NsDi
         O321Xr79UAZMy0mzmbgXmAy4WVqxWHvcJwcoXosTHCdGtJuEpEsh3vxg6T6cSV+XZ9Y/
         cVbkRYAmjSuvu3TWy6uKwomoBOkH9gcLLFCKOe+apDkj8b78LnFF+8QijEgQII8HT6F/
         p+AOM0Xvf1XTR8IYS+1gFvkrtseVPnsf8OQM+lW/zR4WSM2CaWmPMFeE94w5m7wDCj1r
         sHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309492; x=1702914292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7zbPBXHSyKs8YSU00zvyJoXqedAJO62IkrIlwwzL9k=;
        b=oijtD/gYLBostL00nX+mIQp5PrheGbnWRUn7dzPphJYYD7w3OxZR39lK8wb36BsSUy
         P5ItYh8YjdVNXSVZcVhg9mejTy71WT3vCVhfeXCz3eYq3RpgJJdYfBM8QLi3ELzDIeVe
         PGinVeuPZ3+EAhgPP7ekY+2na/tgzErCMixdwcQ+ui9H5ivSpE71Guty7QKIOGiwfzIh
         hEejl8XM8MIKivXrlHOUXqFYizE0yUMbRXqdia+iuUoZxdG22zFb3w4PTrMfKAQpo/H4
         sHAZHTlzVTL4QPjMemGrFtZGQyM7kNzMeC+ElNZklUIDP8NIjqaOfDrtkhVZJwqESJiz
         18BA==
X-Gm-Message-State: AOJu0YwMHIMwxTIzqGNWTBexHFSGGtFRm4++JTNTRT33woGWfqKCJKK/
	+C2JSMFV40TwvqktNxov96xmRQ==
X-Google-Smtp-Source: AGHT+IE9OuQEWQ5+fcXdonkIzS+wpF86y98xG8VCNxpAMGPUXaGzcDFlGvisOKQdi87Y32Tw2Zz1og==
X-Received: by 2002:ac2:4c08:0:b0:50b:eabe:89f7 with SMTP id t8-20020ac24c08000000b0050beabe89f7mr2030043lfq.91.1702309492179;
        Mon, 11 Dec 2023 07:44:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:44:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/8] arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP QMP PHY
Date: Mon, 11 Dec 2023 18:44:43 +0300
Message-Id: <20231211154445.3666732-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand Combo USB+DP QMP PHY device node with the OF ports required to
support USB-C / DisplayPort switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index ea7c92c0e405..77d32f4fe7da 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3447,6 +3447,32 @@ usb_1_qmpphy: phy@88e8000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
-- 
2.39.2


