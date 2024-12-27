Return-Path: <linux-arm-msm+bounces-43499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BC09FD4A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 14:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 854A418849CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 13:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DF41F3D3B;
	Fri, 27 Dec 2024 13:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2JWP4gn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864F1F2C3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305138; cv=none; b=JhCr2wUDTAUVbnRic627qhGNmhL6MiLc2mR7eOZ1ND+ZJozfiicgu4Mkzx082uMsluP3VQOChgb7VcZCKDyCdaHaR0nMXd41ZsQGWG6G2OpacAdSy3+Q3Rxrp+e0kNQ2DDlnnoM484qHU5tZQ2JskSFuU2yXp0rk4mCjRLw3KhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305138; c=relaxed/simple;
	bh=W46aOzgaP6TdX6ichSpQ2dPsT4ngVEhSZ+rnWAPjmyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1qtW9xz7Qx3PpZdg3doNGIim6hTGNimKXwzw12UYVsFEJoj0x1AK68+sFYIQzwfjXdqXrt730HpRHBceGTap/K4RyM5fHAy5yksLTLP4qogSGpZIX19c+larwQh5bHnXe1xZiXTyyu1ULb4C7kSw2Qqfy+weEwsyRVWO+3LVoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2JWP4gn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso6146063f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 05:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735305134; x=1735909934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enHviFwSFCpeHQweyddaphrH7Y3AaJTqZkigXyqmGJw=;
        b=y2JWP4gnfb9CYD2PYlpcGp9WI2tSRM6ZZjClZeEYXyyfv/BdKgXmCaDXpxrGwXnvHz
         sE6aOYkwt1TBrBOMB8Ge4lHNJ00fUXs60xIvMqvOXrafygr9lpTbXkTV/3R91GgXQ+ug
         xNYikVPBh1sBEuKF3hK1VeUhSoabb4xCq/rns1lBprwgsTKBFPZP/9YvSN5yJneHY7gq
         vpQwzs/mV2ZtNGxT/NOMKL7NU/vK0HW26mWevzUNURX192LWfD4e8HfcLH1lwKoLkFKc
         j8F1REWCIbJ0fABkoAFrJjtZ2/yuDmWcHr6QPjfWfAgm0h4Zbvf3qbiAXeJtHzOBPPGt
         zw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305134; x=1735909934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enHviFwSFCpeHQweyddaphrH7Y3AaJTqZkigXyqmGJw=;
        b=ARjRlr0vIH/qU6AtPoqFOraKiPOHqz/9XuYEhfFeqYq/suOhrHzXtqKj7nhCn3u8AN
         0NfmF9F1nX3fLGbshcVHyYxCnhlf4olT1+24z+KSQSXDU59lC3tgFBAuRiYdCKuAx8zF
         ET8xdNsEI2qj9a9pF45RQfEZmsmQUcfq8bXzNGu0TPEWDkQaaCHKIVygeeAaf3ZwcA0t
         r6uQw0J3LYwCxtDIDOHvJfOJs0aBxjugDGO67avdc/Erg5haOd9SKJu0Mz8BVpYrlbo8
         ek90+gkCRXoY0h8LGys2xNDh9X+AO7zZepNyOuLuXfbNASZO7W1rguLFyHs+k7QQLG6d
         6q1w==
X-Forwarded-Encrypted: i=1; AJvYcCV6DIPlfALv7+la5qEW2VrGXfXz2q+DsA7omAb4yW3BA+PtbIGqXhhOhznPM6+vfSO5Nz1k+Kxck6vs2ARe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5rhPbshwedgFa+mLEUumZGg3DuRdDdp58HOP2ImnXdibdLfD4
	fdgIcSNzUU6Os3KbQ0bFYyFU/YBBM5K1uE7vSFbbjDnCUu0edx+nuE9G4RNa9QM=
X-Gm-Gg: ASbGncswU08HhG5Pum6h8H9Rvo1m6Ah23U9CVS48xu0gh3lyHEJpfDiHv8OU+Lmqsqo
	+7omrjcpBw/jgcE7WA8TYWukDAREj1gZLru8rDKC2IdUNErhrXWWReMXzUcTdgnu+rfNQWmf3/c
	G+NGtp61xF942VHnyNHhRLoeM+9D9SAs4Zz86CbsAzgC/xnd/mTMZjtPB+HuW5+57Sayt/fmuMQ
	OLzZu0pmamG2v42CpAoAOOoh5Yk9WZsTl2kMgWYFKiN07aaTDqvqGzQCVXflLsRUg==
X-Google-Smtp-Source: AGHT+IHOR04wC4k4ghQc7+WmGypE2kBkaWFaqs+gZ0PoCMcLtBCwMwyfNpf6kNyKRiIob3vJkPHJow==
X-Received: by 2002:a5d:6da1:0:b0:385:e5d8:2bea with SMTP id ffacd0b85a97d-38a221fa065mr22623129f8f.20.1735305134373;
        Fri, 27 Dec 2024 05:12:14 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm298899425e9.9.2024.12.27.05.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:12:13 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 27 Dec 2024 13:11:34 +0000
Subject: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document x1e80100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-1-06fdd5a7d5bb@linaro.org>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Add the x1e80100 CCI device string compatible.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index ef26ba6eda28e95875853fe5043fe11deb5af088..73144473b9b24e574bfc6bd7d8908f2f3895e087 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -34,6 +34,7 @@ properties:
               - qcom,sm8450-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
+              - qcom,x1e80100-cci
           - const: qcom,msm8996-cci # CCI v2
 
   "#address-cells":
@@ -224,6 +225,7 @@ allOf:
             enum:
               - qcom,sm8550-cci
               - qcom,sm8650-cci
+              - qcom,x1e80100-cci
     then:
       properties:
         clocks:

-- 
2.45.2


