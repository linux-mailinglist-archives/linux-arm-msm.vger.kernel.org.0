Return-Path: <linux-arm-msm+bounces-23790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F4F913E15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14632281C05
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A381185084;
	Sun, 23 Jun 2024 20:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCdO4vtE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D11D2770E;
	Sun, 23 Jun 2024 20:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719174646; cv=none; b=J9JXm4ao7+9GbAUtzBXkkM6frnW+0Zhr8ilFrloJioK91ZM9wdcAzYY6UKJRbN+5bLYEGGgBrDKZwW3Jc1bxdiAAtUl1pK8SfmrXUkd7KHjAWLmLScpov4/gtKk1/GSzRjeER43ZppRZj3FZjM0yHPi9KWhX+RmTtgK/dSCxsqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719174646; c=relaxed/simple;
	bh=bMhj/YQZs4D4i2GoPnlP3guRHvmHXiOnkZdfadjnTvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BygkaI1CVmA5uwc2xqQT6sHuX5a6nE5xV6rsyKEpqyC0hS1qMemLyLC5789Kc3Jy0cKg4yJHH0aD+u1ughwjoUGgZVvJ8ULxUFk479RdsS3CiyLNBp/HBCsEQ5HxwALy2Scc5uuo9x8mFi3zVUAqt7kUlYMCowNYsvukFOT+cu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCdO4vtE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-366de090da9so1187199f8f.1;
        Sun, 23 Jun 2024 13:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719174643; x=1719779443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/H5C81Y675DpCKTHyrBPsjadWIIyfe3/F8KGCSH21I=;
        b=hCdO4vtE4JZdsqfDY1YAE5R6T7wsrxnK1ZMhd8rnqalMNwVSTNyqi4PuTx9/95wUyl
         Pd7GuOTocQH/xuZGtGxLDmpk1OkKHH3BIjXsZgZfTY3QSsPJ/g/P+A8BHgqm/Tx+NKqB
         MQGU1Bm1PUYsxPQFAu8Kl46X/fo2hKL5q7pkdmKtt3f3bxd8xC79AXhkw5ZAD0kZU8ys
         eKnHMVeOxHBnKGIc6NHEZq2+w/mWvAPuKtYaN02FItGw0WlzLHCr3JOxNn/jXoK2ZDai
         Q5iSmY9kwSHnCyBLCJWzNg+HWIADtehn4r4Wj4eVAOiHD61sOBHRD9Eu16FzXM32rWS6
         lGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719174643; x=1719779443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/H5C81Y675DpCKTHyrBPsjadWIIyfe3/F8KGCSH21I=;
        b=lI9bItSW+maw/ca7xIutgw5SENk+l9zgIbmVAn9UCGJAXvukY79hX7E80++/LJns6C
         gdZuqPWURncJVT1JY/tX0D5Io+yOmwumGgjq4byNhKGkXl9Jh01R+rj+EwVBPFDXcOiL
         ZPIWbBFZdfuVgtFtLO5LHKNCzc3MYCwYLxyNXKmgO4ruUdYb1M5dzzdHSf55/nldoh3P
         MrUfyJc9dQJRKEkoId1FUUkctuisNp1OzFEjBTeA3i8dfmYIAd0uHwVzOscvIyJeBoRA
         PbMa0QvHO6alg1Dm3W/Na111GSWoPSs18oX3o9D+9ZaVuyBxADQb8Auz+IshpQbOluJq
         wABQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFa4Twdm+arf13sSYCBojwr/ER/hr2S2/ejSZS0hhRSbKl4udBoVnQa+vcZJIOgkkPE/WAVjdWNMb+g/62EyOOSMDp9i2prJEydrLArO/kArheqOW24u9+33LQRfos819Hufl+XOjgXtnqliq1lv9H5Wnj2xZX4UJzNC3qCV1sfKc5zgxt
X-Gm-Message-State: AOJu0Yypo1CQfj3ppi4cd84n6Tli3u97owXInqyaILfNRPJCa7DrLZhM
	r+iKTG1yXikNjuZDrAuj3E3Wa96OLD/uhKmZ45ZmqPndLSQw5xqK
X-Google-Smtp-Source: AGHT+IEwjjtcQORbdGpX3Q7URvaTjVDJl8ms7m20O6UywXTO6HIij4s86Eygram2ppZwdFy1YumRoA==
X-Received: by 2002:a5d:47ae:0:b0:366:efa2:f2f7 with SMTP id ffacd0b85a97d-366efa2f485mr915943f8f.1.1719174642725;
        Sun, 23 Jun 2024 13:30:42 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8ad2sm8088599f8f.33.2024.06.23.13.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 13:30:42 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 22:30:36 +0200
Subject: [PATCH v2 1/4] dt-bindings: display/msm: qcom, mdp5: Add msm8937
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v2-1-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0

Add the compatible for the MDP5 found on MSM8937.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index 91c774f106ce..e153f8d26e7a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,msm8226-mdp5
               - qcom,msm8916-mdp5
               - qcom,msm8917-mdp5
+              - qcom,msm8937-mdp5
               - qcom,msm8953-mdp5
               - qcom,msm8974-mdp5
               - qcom,msm8976-mdp5

-- 
2.45.2


