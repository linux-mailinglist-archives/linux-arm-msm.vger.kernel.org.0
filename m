Return-Path: <linux-arm-msm+bounces-4233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582DF80CFE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12CD228218B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB6A4BA99;
	Mon, 11 Dec 2023 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Us+nlmHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916A4DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:50 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bf7bc38c0so5206195e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702309489; x=1702914289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEK43V9yIRVqJnm4P3NZA5kYSX3VWqUkzCX7w77Xo/Y=;
        b=Us+nlmHqi1BC0OK8Tm+EtqQHpUxIf/BZbmUHbnRbZ05IJULTrU5Yb9b/mzSfHxZNNN
         A9XdLYdjxPA9fky0ST6+zPfAl1OWUsAUhtmsxSTUIknJaF6ccacKqMTqQ/doqN06Hohk
         oGA9MxW80iQ0yLHC/YdMFwM8dD02smVltK+hgyhzI/6fJd+JkYMAPhoNDKPOV09BnWm5
         rIcB2Vxb7/gKKqIfpalufZu/Qc1vwVnk78ux13yVBGJQBsL7KeW1ttmYq1u03RcDc8sH
         0/apnHrfAQEnMVy2KtKrDcvS8peBxrjr3eX+WKtK9TKfJaWbIZ4L6id85wJG392uykzA
         mBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309489; x=1702914289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEK43V9yIRVqJnm4P3NZA5kYSX3VWqUkzCX7w77Xo/Y=;
        b=sjR2bKg7akRrAqi8Y4LDOCNeYLD5NIE0uugli+2/cS+YFCQ5mKYp3FbgV+4xVMz3Fz
         /8KxmCi6m6AKTV0tKkfYg/ABo05SXpXOVjStdB393DngN1eekSoL9zTMiXtMCKkQ+X1M
         wzcSoxVg2ul7V8sZDnU1+BVpZdWGvCKyVvuLX9JP3v/aVwa9eh4/OmWwvEEbv61a7PsB
         8J32DdecsBGwetsinYKzR+VIK0k/u1/XEA0LMuEJa/gYafoFNbLgG0QV9CZ+S7yF1tV/
         8U6wdi45ZX2bN6u5hPCxZscN/AJXqhYTBN57mDIMIHIFNY8SbkgR6cYW4zIBK3O75zM1
         mSAQ==
X-Gm-Message-State: AOJu0Yz+p5hv5mzvnilaqr1egWHRB6v+Ddp8MhjzKLTd7lNog+T9+DG2
	yakT2VCin6JW3NzCDzDmZGH+Dg==
X-Google-Smtp-Source: AGHT+IH9/Y+1gcwCpPn7xa1mzp2YcdXrFEVyvR6Ns3iDEf9MbtKQDoXsa3ElBa3w9w2aGvcdxQULAw==
X-Received: by 2002:a19:690e:0:b0:50b:f268:7ed9 with SMTP id e14-20020a19690e000000b0050bf2687ed9mr1865801lfc.124.1702309488635;
        Mon, 11 Dec 2023 07:44:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:44:48 -0800 (PST)
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
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 2/8] arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
Date: Mon, 11 Dec 2023 18:44:39 +0300
Message-Id: <20231211154445.3666732-3-dmitry.baryshkov@linaro.org>
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

Add required-opps property to the display clock controller. This makes
it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
errors when enabling the display.

Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fb41f91cefc6..153c531c1d41 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3925,6 +3925,7 @@ dispcc: clock-controller@af00000 {
 				      "dp_phy_pll_link_clk",
 				      "dp_phy_pll_vco_div_clk";
 			power-domains = <&rpmhpd SM8150_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.39.2


