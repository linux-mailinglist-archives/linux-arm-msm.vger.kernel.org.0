Return-Path: <linux-arm-msm+bounces-35202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D399A632C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5BF91F21341
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D401E767C;
	Mon, 21 Oct 2024 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="njaWEZNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8B11E47A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506652; cv=none; b=MiPPcuYMswcvPV38ovDqPRIXViG8BJ5i/uOygIX3Z1VanbrkSZTxX3uyIM1YrDvYagK4IpZrgBCetlWx+0aZK/qfLyKxlu/lVHYcGli1gtxeswIXtBwI7LkZ9qtHXlEoW1XLuiup321VcrsrXQAkJaAtiqZ8pFiyrsKz8dpHeic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506652; c=relaxed/simple;
	bh=mHXA679fTLSBfLWh8pBmR4AEa9V2nbcklgPIdka6VnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQbzKBQdEL03oF8/y2JpPtCrHl+nd+aTs/++NVT5TI5/LjbFw+T9Usv6IauWH87YBUEwEiA47tSAA0LTbHOULiBw8JzGM+2ZIDiK1yGPtA0rZ984VcUbxGveXVrVwOMrQsHmk1Qhi1OBn8WzDhri1m3Y7ocldUaeFr2Sw3JfKzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=njaWEZNT; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso40429541fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 03:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729506647; x=1730111447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yljl+967ibX2I7aSbp1Ln8dspkbFoWgzBqO671H8u2g=;
        b=njaWEZNTbIcrhz/OA46aFMMoNFr+IMuEbZy2Eo1lmXtMUeN6GAXf9K9HK7dAUhOV8A
         VkKoKPLNAS9xBmk83JZYAgPWU96crv6Pks8oQJTv/ONS5jbFFR396dqAj4ptKfVnxNRX
         2ZVFQG62ystPVlSmLZtHKnijKpDPIdCgjKpGSrCYpbvLkHw+K9fXZEZCC4RLbhq2Wxso
         5KPcm2iW5k0kSWHLwMJxTumHJal3uhiqZyaIQDm5KR+3wZ7pZwOb0w8M/3z5K726Ck4F
         I7gKjO3BmtzUt/wom2YSsycIK4MR/HWVMF3PpK72a3VWpcffX+Yaj+w9mN1QOv8cXqKF
         dTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506647; x=1730111447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yljl+967ibX2I7aSbp1Ln8dspkbFoWgzBqO671H8u2g=;
        b=Hj682vGE5QW3bXaNiXRxQ3JM4DRmaACf6SrnAL0X93PyTUoU4YiivZ9sHRKf3YM+Tk
         LkPdzoUUuL2ycNzioSCUMJ01XmiytmL6L0SLgQ65IcWP5BQbHnWXfR/JcDFE2J7SRlJd
         YpToLXY6t+wdYi7BcqzJ8qXceuxrVC0fGxllyUhMIRZ+59JwMZPoK5eYDBuigbmUfyj3
         bITQcWlStPxXPd6+7Op1hY9aHu31T66MxR0h8HhJvLr7AV51U7qzG9F5WafGzyLcCmuX
         O9nrtts/hqwVnFKa/IitstyHVeQw39zaVGlUGd0B3mkrII41K5cvYdnIwhyk7y0YvjBV
         2lKA==
X-Gm-Message-State: AOJu0Yy7F6Mmczj322wCQm36tS3D7wNqq1CreLQAGd/CcbNdE7DQQ3uy
	qLfvbrhRWJ5ZUqXgDAMQdhos4jHlJpvwIQrger7XOgKU7dZhnMSCv0zq2tpchm8=
X-Google-Smtp-Source: AGHT+IFEAf3VsRlUag/HZ2RQfkkbpZqeK0Id0wd97oP1fQ1EGym0ZePONYk2xJyG4yWaKOBBq70Diw==
X-Received: by 2002:a2e:4601:0:b0:2fa:fc3f:d603 with SMTP id 38308e7fff4ca-2fb8320b9a4mr42369251fa.43.1729506647492;
        Mon, 21 Oct 2024 03:30:47 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae1217bsm4522711fa.112.2024.10.21.03.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:30:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 13:30:31 +0300
Subject: [PATCH v2 03/11] dt-bindings: clock: qcom,sm8550-tcsr: Add
 SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-sar2130p-clocks-v2-3-383e5eb123a2@linaro.org>
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
In-Reply-To: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mHXA679fTLSBfLWh8pBmR4AEa9V2nbcklgPIdka6VnY=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnFi1KzpKNHxm0KklRhMIDLdMwM8nwLkURcyszM
 JWpB4MC48yJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxYtSgAKCRAU23LtvoBl
 uOUYD/0TiKxC7WnLDWWxq/kXnj4XhcUn8cX8UB7h/KNcei4O3u60vBCtey+mOEv12DkguL6FqDE
 g4uqOFyMbBmdliC8Ml11Lh3jnfudWGWLWGg88Vr0QOhHmGwERJR4pOg2b3tNCKJcJGhkLi4hCi3
 jG/zjAkwNodFJmo77JMciY9KAogHsKDrt0Kd+UtJpEzsx1Le//1jITU3B2Vm/q3cvq4LMK+OdLD
 FpUGcAVKFYyEdxSRSGcF5fmAVfiHlo72c0l+CE4n763ZNdM9GRbu9CVTnST2ukCKUcZP3cOYlgf
 aLQkAI5sV5SGI3T9SjTVZiVvZAEUTv1vKoKSf0C6+mrkngESo/tnNbxIaDXqm83r3+zZXOSFf/6
 ZGoSF2juOhU7loiB4djUa2btlAB5oor49nLsC58yemAsGDCBsw+UtEvlrpRdcNb3rKlxaFjN3e/
 TkG/tYQ0lJCRrDb5Q6YOs/YT64beH4eU89cn5FF8e7iaCc/Dm5WBdb8/I3aPkbn2HRwpOLcsems
 BXtx78EfpnwlKuYghGfmBkrtJwv0uWqUQ4v9Ysfe43rkaU757HR3YMVVnOm8TAODdPRTtGz7F9B
 En25yl0mbpMNs8rZUkW+tuL1w2auZ1arvE2hQ9S0hnb0Rr3T9YST/ggkfeBHJncFekCz5sGsEho
 RFLgGAEVqGbEJOQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the TCSR Clock Controller on SAR2130P platform.
It is mostly compatible with the SM8550, except that it doesn't provide
UFS clocks.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 48fdd562d7439424ebf4cc7ff43cc0c381bde524..3b546deb514af2ffe35d80337335509e8f6a559d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
           - qcom,x1e80100-tcsr

-- 
2.39.5


