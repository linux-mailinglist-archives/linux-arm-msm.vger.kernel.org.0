Return-Path: <linux-arm-msm+bounces-47386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB4A2E7CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CD597A25C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095381C6F70;
	Mon, 10 Feb 2025 09:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqngtpzW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305781C5D66
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179975; cv=none; b=RRfUHVL5UeQaoF51eyTtkY0yKwj2RcHPjsXCDLWdhw4VLnZkoV1kL208GZ7hyfA31IpF1Y9+kpbeuEigXyow4zYFaiqEVOsFabSY2B3Oru1xrGgFao4z1ctLviBLiFOKsBNoL7+CIbX5SRbhjp9hxzHCTIMqxKHy5w9A4M2eUvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179975; c=relaxed/simple;
	bh=98TJ0BDq/B4YwYQuRbdQZDol3K9UssuD5yxrzrrb764=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nkYaT9Id4O5T908ZfP9h4arNEVC7xDr/9VG5K5rT6wEuMDi/4cBkqe/Se7qgJNDqTcyWtJlV9QFUpvtKsHCUfjrBWH6tVpiNMSxLU5f5/JeZQv2WiBer7qluqEr8jq3zfung4nb+MCG3oTid7KbTgmIfD0yg1YBj5CDRJyiXFWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqngtpzW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43634b570c1so26870015e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179972; x=1739784772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XcabXVD/YPnR5KMwd4hd44jlah3xNkdzGjeWtc1T2sw=;
        b=oqngtpzW/reIWI5qWeybXCwWhTUcOde6DkNV9+eobuJ/sBopwuaKc/R3LzV+l8bzkI
         ultE8mMyiWqDTR0lScK1IwnQNsAsRkYjdbnBKUEu7xooZtoKbMfULA5jOCEcYOf9XsFv
         WxTyMUqxeErfOAArtcB8uLGku+qyApEkjOyExz+V11yR+acSrO9hDTxkls1bpf6Lzzs1
         RpoMcYSX1SO/NZvARGqbTtLTr00pUphLZSxH8fzn3199sq6EaVxuDYMGVaY3U5B7qv8D
         +dVzwJ+b6phH+OUQSe57ljvHD5QA70WbmcBe9y9CPPvbJ7Y25Xt1fx+Q//JBuhM9aJ9n
         lqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179972; x=1739784772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcabXVD/YPnR5KMwd4hd44jlah3xNkdzGjeWtc1T2sw=;
        b=CzBElWHSKd/Fx5+VIjEgHyip3V10UuNfRPeTvQjmQlJJicnQRXN8qbTZVCjpIexaRS
         ewrzqk1dkUSZ2g1gQnWXIB6ueny1ry3SnKtNr0PJjU1otwfHBU6bkKR8R+GBOHYZscH8
         vCMPYqczBGWlL8uWSW1vdeAot374aMFWDizqzyVHjP5mCM4Z72YlM+wWACcKofeu/hqZ
         tDn5Mfh83qUTSu1xVP9qRzWHoeEvx7ZJnEre8+4GbEF7ebxRYg3Yq17YS6Oq5MU1VYE1
         AQvf2V98tie9FHWnn552xOZci2hnlTGzSmGDfFJZ0i2fF4BKjPnE/f3lkad/nh6WMKox
         7MKA==
X-Gm-Message-State: AOJu0YwDQSisCL3PMkw9W87wDj69Sl2eRY2sZ0McOsicRbbSNKDcx9Sc
	yhxOKoRPGLwbHcRadApxzzBYRhQsGFzeEh4qzPEHjRk8RnUW3U9CmjGWGifTeF0=
X-Gm-Gg: ASbGnctW74vVv4Y/Dh+eDX8R1NXtK8KS8w4zogwvOf5qC2mCK3QhEfTKbyWKXpCZ46m
	/ur/NToGxHLU9e86lgosRJlLADOzNAKvXWs9IC26ny2Fqmhn6ny0J2qVBE/Bp0DD282SaExdjaM
	ajxETVlHnr03MC4OpKURvawkiFTZJEuJvHNsIw0BTz8zYuY/+IORt+J4fCOqv1Df1XaEyh+1Imw
	42f9CtlBAJ5awGbbJMalkHq4RF1ggS+Wlojzx9JivxuntGTb3ZQFfo1W/xEFjpng/59TDKP8taO
	j8+PzLfiZ6tjL8ZNlisXkhQBX32bjPrLvza1
X-Google-Smtp-Source: AGHT+IGPRsAVtjDP7HsM+NAqH7eUh/kQaI2NDFRRj2xr8IRtRWGH/wInuxqz+Xygr498MK4srrSfQQ==
X-Received: by 2002:a05:600c:4650:b0:439:403a:6b77 with SMTP id 5b1f17b1804b1-439403a6d76mr40653435e9.10.1739179972563;
        Mon, 10 Feb 2025 01:32:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:32:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:42 +0100
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=98TJ0BDq/B4YwYQuRbdQZDol3K9UssuD5yxrzrrb764=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce9m/jhlaXw4GK2ZFw2r5HIIYWGI8wOs/vFs1bM
 4LUMLfCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvQAKCRB33NvayMhJ0f1EEA
 CVf2PbRt814BXrKgCeDeA2obxDBQY4vpAFMPuW9T9FH8C0VmlsdRjFqkwhVNLcHre4+GEdx94UbecB
 2cwG0tLoWmlqT585vcpdMXvE26mJLSIHdmJpBfwYStCD1Jds3TrPyv2Rk8GYCi12jON2yAF5prLkPf
 g7hsylbkRM64QR7aeeC2QewzmRD+6i+6Dc01SN7cGfVWrxKpyGpJPsnzJlbQ+b6zasx2AeBM7H3W6P
 yYRQb9Xvi3Xb6wnTleV8hcmfKaqQ2MYYWfn3ccIZ2FM4fnqWQ9+VccI8tjFSq/yqLi1j9cixhH21bx
 gVJ2O/GDHRRha1ljW6ys2TG9FwQEHoNKUyPrCk6FQEggzmL+q5o9R8d5v8/KVqLVP1lWOiGa7r21LP
 F1Xb92S0KrefOBnAkP+5q8UE365lcAQoE4Y+4GGvr9GwHVnbHHwgi5bpsRJ+QEkmEetq1DWOnxW7kv
 5olTbozq86vjVFhls6KXGIQpMerdjlw4i72rvk2yA6YI1n64pqk3eYVP7L/ZJPt+XXsRJR5XPenQ4q
 j4yl1WnqjfjoUGJgidJ+R4GEbdwr7yoH/wWicOu6FqHHW1ARu878vtyh/Gs1I3gh4VemvZCSuWRlrA
 MvlSNpXVJIYcReMfFExJsSX+6+rah1WR9y1I47D/a8pcibKIDoQQJ6CmNxWw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
add the missing cpu-cfg path to fix the dtbs check error.

Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..e89a2051648a97ea8a5870eb6f0a6e0fa7e880a1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3656,8 +3656,11 @@ mdss: display-subsystem@ae00000 {
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem";
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 

-- 
2.34.1


