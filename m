Return-Path: <linux-arm-msm+bounces-3673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C575D8085C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 11:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708A41F2277F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102F2358AA;
	Thu,  7 Dec 2023 10:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WIFpfyPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83343D54
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 02:53:03 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c09f4814eso11118305e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 02:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701946382; x=1702551182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzAkdCe8GmigS9meJGB6RLFDC8CgmK6hEzQqiVyayPM=;
        b=WIFpfyPfJxZp7EzuHYsbL/8Cuffv8AteYGwTv0eQkEewXhqBEVPJm9U1ng1Xanzipj
         SXfup3xW3emIXT2ZCuD6ErkrmWcSuNhKfNY9gGmS+5vcpRG7AFSRy9cc+dmk8qMMBkYd
         2Sn8JquW7hRuDbKhoLZeUrlrs11y4OKWxJvNfMbbT3M7FWAh7FRokR3Ed7wCDBtuwyyu
         D2Q+Q8o4ni10SoZeYnKq3poqgZc/xeRSBTy2sE8l6cf+RyhzIW+5+0QCp4pQefbzW5M+
         ifikXRlzqRWEsKqIjVqx0waaWmbkvcAfnsYedrKEWbopedGn6h4b0ZkQKhpzSP4ZQFem
         XQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701946382; x=1702551182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzAkdCe8GmigS9meJGB6RLFDC8CgmK6hEzQqiVyayPM=;
        b=QDmUa7wVbrodxrAYkEKxoG6kIGZOw4vUBuhciLa4/YiIaGzbRTxvI2k2Y68ipSkKaU
         cSvKdGxdq7qiLoSVV/K2K2Bf8fTm0y9/+685twRQf7FlL+E+OnrugUhwRbGa+J9CoP6H
         KSET5HAVpuLjMr5g5UbwlU4fC24zPvKEYIGeN1GMegTZxj+I+KDuSFTICp87LdSp/mG5
         Pcm7eQ5aAYaV1fqV9NEPR9iQPKb5MY0z7aTbHq36AYTUuqg2YejtB4DEq3yuI5VJUQ7b
         krFy0iiwqbwmajBD3XvsnALH2C6UnWbqt0H+7YLEPtAD1iuHPi7p0JMGFhKX69ouG9kC
         Bp7w==
X-Gm-Message-State: AOJu0YxB7tjdvgDqEUkrCglJY7Y2Wm8CsKVZ/FpFLMSoIs3bHrfhUhmU
	OWQ+tRCVTHkDREqiKfKKR23sGY6xPbtdk4qBWqw=
X-Google-Smtp-Source: AGHT+IHRtGdot/NsE2L3XoU8qXrI4IhdWzOZdCj+ecTyhBAvaBVisMbzzrPQ2/3t11cv8c68fwqI2A==
X-Received: by 2002:a05:600c:2901:b0:40c:2699:b625 with SMTP id i1-20020a05600c290100b0040c2699b625mr795852wmd.138.1701946381938;
        Thu, 07 Dec 2023 02:53:01 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id k23-20020a1709063e1700b00a1db8b08610sm668700eji.148.2023.12.07.02.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 02:53:01 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 07 Dec 2023 12:52:48 +0200
Subject: [PATCH v3 1/3] dt-bindings: phy: Add PHY_TYPE_EDP definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-edp-x1e80100-v3-1-576fc4e9559d@linaro.org>
References: <20231122-phy-qualcomm-edp-x1e80100-v3-0-576fc4e9559d@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-edp-x1e80100-v3-0-576fc4e9559d@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=559; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Hwpu6tM6RD/JKvU7jn8nmPGWlA4+6aqHXvdwplMfgcU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcaQHvtNBoyFoDqGxYZdSuJ7V9rS3o4tMgMa/L
 /rsakNygxiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXGkBwAKCRAbX0TJAJUV
 Vj/ZEACqcEFqs4X3nCWLQ3UkvPUu21OX6QLZgnucuhOQy2j5+YN5KcFbAopZrh2tFu72hZV0YhZ
 BKH00j7k1sah0JalC5y+NP4CVfJiptouXa70dSe5DHUDEgsrV4FBEvsL0cuIs9zx2zFyCTF//7A
 Qzn0quAZeGog51ywahMduGZObO8YbAjMsaBtloLS8bQw7ghNRB8RgihW20v5wjmHGlIJdXuauhM
 7umWswF85EQzZ/yQrXRLRnDjomUWC8R6aRsZiJ3e7oeD3MWzki9bniGavuNXJ+fX/6nJyfbx3vs
 mXbJwTInK/4+jcnb01svlQhMOUf32EMxS9gQH+UWvgZ1VLL4u7WwPa/cu9TnT9p0DGdZUyEg0uj
 OUMXkD0hRL3yyBGFPV1a51r1huH0+JENQqbnCZHHb4hjtz9AfocmZeTB7XKcLv+mhSGLPT6HRCl
 BuMeaGdSNmgBV2YKu7BkUEde2flczzvN4tT7+8LH00alp8aoJLaF8GaQ49GCrStIhQ6/S2x0bao
 tNgQWBYfQQEntMS2UV3o9iBO3w7jVceHxr7gYlCbRuSvrYjcF8lgc+QUMjUq+xnVN/OJBl+9K0O
 OP3hxaTXJzb0vXwlsWm0enJTJtZfhbm2wbK7V3gMlrd613LJ3FfEl+aDOnTBgYwwkuBp3hrOPZt
 m/shR67U6aGSMDw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add definition for Embedded DisplayPort (eDP) phy type.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6b901b342348..b1a64508d937 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -23,5 +23,6 @@
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
+#define PHY_TYPE_EDP		13
 
 #endif /* _DT_BINDINGS_PHY */

-- 
2.34.1


