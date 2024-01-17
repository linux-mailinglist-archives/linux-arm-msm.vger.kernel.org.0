Return-Path: <linux-arm-msm+bounces-7460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 872FC83077B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 15:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 209BA1F2588E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 14:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1594208A2;
	Wed, 17 Jan 2024 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j0DVEn6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3017A2030D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705500268; cv=none; b=Bndg/CGnFzU297QhB9ZDyG+11rA51+chrCQ07l/WVEZZpDy933SBkprxVrx/IoPDzoVZcX3/zpEkyDvec8ZQvsqrsMeESnWbRpaNtgbATUP3Bvf9IDAn6ENnfIoJiVhTTNytp4A9I6vfp1vJHLeOxxK/WS86QIe5BPpYWIpx8Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705500268; c=relaxed/simple;
	bh=BNkRiqUWArTJ0KVqmkfyrxNRNLwMagIurNBQJ1C0EgM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key; b=kmFaWC6kDURiSCtWoATjsJqo7xk6oU1sf/KBCS59+lAscsLuZs9YChBCXqD8PQwOgUDOOH53Is+ibNHq0j2/lk4NR595Z1p9gAbcS9+iMZpMmZdr1/dyANyp4lEIdGytLb67S16uPgqtN7BpEFdildluAbIXx1Lg8YVCafNJL9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j0DVEn6K; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7f58c5fbso15025595e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 06:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705500265; x=1706105065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbLebAsEZ6c2w85zme28SKXGx9zXJ3HsoqbiMbqoTy8=;
        b=j0DVEn6KgPuD66QTIQEJqjmHdHnXrTdb1IYNnLSR18By5HjEEFqXaL65p/o+GKb38I
         azpWlTWyR0xC93v295SF/7Hi4CheJVzg9KIiO0uDUfo95bxrEQv3FxJxzhE/iOnOtzDO
         0Vj1S3/Ff5tfMmEXqZtd6Qdvpo1+Qvij7VgHNDvCWfqndxFINhqbEJTtkLpNfuz/Bu09
         1pzxrZuJAt1pGuAReGfjdXadLZdVJNqX09miRfMbc/vpF2QoDi9wlLnAYNHQs7wS3CyY
         1iXKxfMY77hxE/FkH6zWnxhSo1vJ7+0wELDQw4pO0LCuXgiKdgXLa2woWKG6MNZBv0fi
         tHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705500265; x=1706105065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbLebAsEZ6c2w85zme28SKXGx9zXJ3HsoqbiMbqoTy8=;
        b=HYvLvlB/E6snZfDw79reJ32s4fJhB+JPn9YOZGknlMXqItFI/HKMgO9l3qh5vOVypm
         Q/pxo34pxujrbO4q5cgoajgPkjHC18oX+uQe6Vddbxh3KIvCjk4NOvQe79LXyhy+gsdv
         FVvPXD7SWeCHKGrXpX5AJ5Tkykh+ywHVWl/08xGm/urO+Ff2esWKKBXrx0jE5dkirOvs
         xliCSDr+8YNhg976sNAyevLm/KKKrx45eltY41QGxvXBl4q15XUzetCHXP8FuSxUfi5Q
         xjxmoBhB11Wqhe6DJatvbKfy51ncKJptouVVbfE9F46qGufTW8Zcf3B7op8y7ca5tgqI
         INBw==
X-Gm-Message-State: AOJu0Yyn5SVstT1BBizcfSeDGFn/2OoA8pCfvLOGgGd6tFeF3Lk8ePok
	UUASGpqWSybdz/vgy/WGd0aQFnXpwwlR0w==
X-Google-Smtp-Source: AGHT+IEci5w4VaCrjhPVRmsfWaQ2FL4MPwZ1X2aiAPUFUfEDYDWcAf7EinIhfVzeZWQw4HBq9Bwbdw==
X-Received: by 2002:ac2:4896:0:b0:50e:aedd:ed76 with SMTP id x22-20020ac24896000000b0050eaedded76mr3980995lfc.131.1705500265272;
        Wed, 17 Jan 2024 06:04:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y29-20020a19915d000000b0050ec7a26420sm269711lfj.204.2024.01.17.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 06:04:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 16:04:22 +0200
Subject: [PATCH v2 1/6] dt-bindings: mfd: qcom,tcsr: Add compatibles for
 QCM2290 and SM6115
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240117-usbc-phy-vls-clamp-v2-1-a950c223f10f@linaro.org>
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BNkRiqUWArTJ0KVqmkfyrxNRNLwMagIurNBQJ1C0EgM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlp95nRkdSUFFPVRgTFObupXEVUkGLJJlBCCc+Y
 tA4+bRCycKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZafeZwAKCRCLPIo+Aiko
 1XnzB/4sv93LwvfIhcO0GMpB1xK3Bj4hbNRik3mVZ2P2W9HQgPrO+EldFpGPvSnlD9GnXqk861r
 ciGeIO5h8aCdnKY6u2F7d+oBfPVeg4s2C/B+f1Ya2i0JLVz+pd81dyW/wRRdyAEcwNpDxxS514t
 nqz50x44sMVjk5ycRKMgUoq8mLmXAU8lIycGHSoKQr8tzL74bn2YX/fedihkVHBYIKIqduM09wN
 SLnf7Mp5HnQTIhah2Z9RyC+b+8AhleF7p3SVuNxybWM79FOaLsXXSi1vEMPaDMtYfgLI8UM2GXC
 EBIUOnCMeN4aBfmWOT9z5mb9DMLXVTgjUJc27Z196CCCq8fx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add qcom,qcm2290-tcsr and qcom,sm6115-tcsr, compatibles for TCSR blocks
on the corresponding platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 798705ab6a46..b97d77015335 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
+          - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
           - qcom,sc7180-tcsr
           - qcom,sc7280-tcsr
@@ -28,6 +29,7 @@ properties:
           - qcom,sdx55-tcsr
           - qcom,sdx65-tcsr
           - qcom,sm4450-tcsr
+          - qcom,sm6115-tcsr
           - qcom,sm8150-tcsr
           - qcom,sm8250-tcsr
           - qcom,sm8350-tcsr

-- 
2.39.2


