Return-Path: <linux-arm-msm+bounces-32659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83189988286
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 12:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F612282AD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 10:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB372154C0A;
	Fri, 27 Sep 2024 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pEdJHcSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8DB156864
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433141; cv=none; b=gVEF5fhCUPCAHuFDuBe0hJTqwaE5QeI3QXyvfmhPh4s68+HwGyDPZ4uIiRF4apxkDG8vVbs9eDh0iBvCbjG/gI0FZ1QeBIeB7J0Q12+an1Sk8WNV5w7TCihyKzBM9+h50HhQ/B1FiSi2Rn4De59RmWP6zg4sXx62vOVGZX9/WI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433141; c=relaxed/simple;
	bh=5Q3cmv5EQmEMsB47Dt0/46SxxuBAOTXYPTZ6B+4yiFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6GWlE79xUGM369F8MRN/VSIkwdJ42hWa6D0fAXY5lIHxyHBnEYHSHcucxUaJ1hlj9w/Ye1SMgN05egMImZowZqRwnHvZ0uC1isfSDLg84Efc9BHEaRIpEwFJg7mHJibNvqQRhoOswbsv0c0f06bzvAILLNhI2zWikrR7CISl3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pEdJHcSl; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75d0441a8so1256141fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 03:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727433138; x=1728037938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52wlC560kwOQzivXvwj4mN7rE9VozvLwChFkY3NipRg=;
        b=pEdJHcSloeIA2nNjUUZqdJXtydxoTHlc1Vkhi/GLrsYHgO2rN+CCYZbyNoMbmMS/KG
         sgmlz9Y1mOWlU/rpZO6pVQ3ZIso4cadUphaWsceLawiEf2xtIRv9R8zC9EtzeOeIcpyO
         P8eI3EM7oBGcJY8NdmndmdW4x+eSnjYfd2AFOPHgCDLgjaV2H62mkdqbMzgISTDhrsBg
         LU5Ck9v1ggoyNcECqig59ebk8GBZK+0oQMi7u61h0IacuN/r108wwKSdbaNbDEU53mFW
         PYBZK5MPQ/SNUwqcQV4Drp1aRNe0ZwWGy0X191G5XhmDYp2CySauzTWc+ya7Ji2P7DLM
         vXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433138; x=1728037938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52wlC560kwOQzivXvwj4mN7rE9VozvLwChFkY3NipRg=;
        b=QXbU5ne5MyTWV2Lu3VFQSbjakN0S3QVOFM5LfYhrlzkz8Fn1EacvaxYW5kwYiJnLg3
         tif4Ot0TtZrvqPmc0i+3Zi/zywH6J3T6X66GFJF7PdRuLqOBf3d6xIMu18kemEi6b5qe
         6KQLcdo8FRartIkRomHABs4kILMIH4U80NKg5S4BZXH55am7b2yfgyHjMqDRhuPSMSaZ
         /lOAPPDpDDZSLFgONByD9PirZUNZzz9h3nLtffT+bjTiRrxD1eyfy2AsyyNivDiQin+t
         OT8ecD8uGwi78RW9ognBm1P/ji0DlUDzjGfp4jh1CYVl3fw28RB7u4SzVP7Vqfutf7q0
         u6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX7dsd5TbRSjptTfu7r7V/AnJB7K/t7Aq66RsxuZzmdvzucjn1ojlGiYBobX7kf+ucIIVBRpQa99AHtZzND@vger.kernel.org
X-Gm-Message-State: AOJu0YzY+jK6QWzjkSvAawzVJ+jNNPKXt8DuKnYfOdmXFi4150XtlzUS
	9bcgzt00fssbngoRFbeWBseP8Ox/gzJ1JKgsDdrTw2yZYqdURw6mHqF2nJQaSV4=
X-Google-Smtp-Source: AGHT+IEuem5Ukvnh7hEKUSiof3sC+jX4FK3/GktzYOT5D48aCARk19ZzL5cPvnEJ5OxdISqq4g0xGQ==
X-Received: by 2002:a05:6512:3e0c:b0:536:9efb:bb19 with SMTP id 2adb3069b0e04-5389fc399b0mr443073e87.3.1727433138192;
        Fri, 27 Sep 2024 03:32:18 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e333sm259724e87.76.2024.09.27.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:32:17 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: clock: qcom,sm8450-camcc: do not restrict power domain to MMCX
Date: Fri, 27 Sep 2024 13:32:11 +0300
Message-ID: <20240927103212.4154273-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
References: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was unveiled that Qualcomm SM8550 Camera clock controller is attached
to MXC power domain, therefore it has to be reflected and generalized in
the device tree bindings description.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 26afbbe65511..9ef967523987 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -40,12 +40,12 @@ properties:
   power-domains:
     maxItems: 1
     description:
-      A phandle and PM domain specifier for the MMCX power domain.
+      A phandle and PM domain specifier for the supplying power domain.
 
   required-opps:
     maxItems: 1
     description:
-      A phandle to an OPP node describing required MMCX performance point.
+      A phandle to an OPP node describing the power domain's performance point.
 
   reg:
     maxItems: 1
-- 
2.45.2


