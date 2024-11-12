Return-Path: <linux-arm-msm+bounces-37541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A93AA9C4D55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 04:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29819B21D7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 03:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C37207A0E;
	Tue, 12 Nov 2024 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tj8CsTYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29073205E00
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 03:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731381546; cv=none; b=cDXW78GNvZw7cuYx7dnCezUOOo0ySxjfFYjteeF1Z2FZhwRY8ceqWIDiEL/2CtN6INmr7Yi13yryEnacX5z6k+kcuQxF/IL40qnbArsZi2oxQmr3EFv0a5KSwaWy648mz60J6Ad45/NC8Utj3TkZYSlnfr/EhQnQbs3oSGihlMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731381546; c=relaxed/simple;
	bh=yQRCixh2ZkF3/J3DRO9bftX9zO4bUPMZm6ldnWS/5LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gHsNI4rLf9vcg1s70s7hJ2UXINzGWuV01XhPwsc/SXzYemP/TZZ2Anve8LM+cb6Dfdet/NvmLLZYegFXkj7l99HxstMiEaCMb3FZ1TfiuoFHvyii3W+tSrzmM8R/v8zwdd0AV5PbzbCfn7BhC8AmHB3me9HzXNRWKPtH0U93+ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tj8CsTYa; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a850270e2so947890566b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 19:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731381542; x=1731986342; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oIZCtXt4TQ04xJLqf1FpdE0pILm6/tx+QziF3KaXRzU=;
        b=tj8CsTYa0dsNkighXASM7XYZNd3f8oobQd0uzz2sHxMYW/VNSYDUL+PICObLS1F6LC
         YRVjcfV1obl0NDNF7OaXHOPK0cNBesH8/6Z6P0y5m8ZjKJDq/YkTJqk4wTOLk2MYIt03
         9mVHIriIvfqk8HZ2pFJ54tI6wOcgo4IrJgp5S+Hza/m6wQwT8MgNBuQN89LZIo+/7KKl
         hiq96m4Yz+jTG8A7JEixOMirUal7vX1C8LuHfrVdW0FR3lv3MHRTjC1dJctCzDygqJVq
         C6oa/HcD98Q9wduYRWeMsMvJrgNQrtp0IkE+PBlkEILJoHwLBRuK8KLDPqdkEvu4g7GL
         N3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731381542; x=1731986342;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIZCtXt4TQ04xJLqf1FpdE0pILm6/tx+QziF3KaXRzU=;
        b=JomPGY2rf7IIXgNHS7fBevURwXpbHNDNiLjJKpxOjND9lbfdmbbAHazVdZNPPeM+oZ
         u3ZhnvPEP5PFHdweIX90xMOm3KsBGnoQRYf3DpWCBhYgUCZ0ZutF6JrzY8qX4/1Q9y8l
         HCFIznFHUshFtf6NWc3gfm+IX9wHKuaynN1TQkae5DIhRVBOezevPL/NZ8YQCCVZ/IcP
         65lcsQnZy3N+xOwFwIoJWNDzJMzP1H7LDPI7PMQZHxIPY+A8oQHfB2sytQO/X0WpPxIX
         DHS8yXA+2qyxJI6f7FX+F8XtU57K2t3dr8nXT6G4+OUnpw1t8PeNmngEksTWJY9FbCbf
         X2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRzReJEQvGF0Fgd/EVVbGWyRHpRFNIkTQS/+AL8e6i8aWon4NAm2WAclIxw4J0SfsYpuOeTCN0xnA+lwj0@vger.kernel.org
X-Gm-Message-State: AOJu0YyeOal8jsyI/R4w7rg1iU1NkOuO2Be4+ulEpBQaMM09Fe4KBV27
	7MPDqpvcDSRJW66P6ZeyCB/C52OWyLuVxBUMFU00PMOH95qTrz3PIsP0u219LWI=
X-Google-Smtp-Source: AGHT+IEepq4U46vHQx+388cSqSZ7dYjmvbGbqe2P+IAhGO5esI0/fqqyiUwogKBqBM8siJyJaJSuXg==
X-Received: by 2002:a17:907:9603:b0:a9e:b5d0:de6 with SMTP id a640c23a62f3a-a9ef0016d4emr1401236266b.50.1731381542331;
        Mon, 11 Nov 2024 19:19:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc50ddsm672156866b.103.2024.11.11.19.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 19:19:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Nov 2024 05:18:55 +0200
Subject: [PATCH] dt-bindings: display/msm: qcom,sa8775p-mdss: fix the
 example
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-fd-dp-fux-warning-v1-1-705b527f5a63@linaro.org>
X-B4-Tracking: v=1; b=H4sIAB7JMmcC/x3MQQqAIBBA0avErBtIi7SuEi1Ex5qNiVIJ0d2Tl
 m/x/wOZElOGuXkg0cWZj1Ah2gbsbsJGyK4aZCcHIYRE79BF9GfB26TAYUOr1TjYqfdKK6hdTOS
 5/M9lfd8PUvtvj2MAAAA=
X-Change-ID: 20241112-fd-dp-fux-warning-c8764c93f787
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yQRCixh2ZkF3/J3DRO9bftX9zO4bUPMZm6ldnWS/5LY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7rRSeWfMV+iGi9bLjNSC2e4onl1X41i5xv1KrWD5p1Ji
 qcE3mR3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiKz+y/y+4/vVyRY/8VvWN
 bx9djg+d82vZS9W/R4/aFlZpPlyQVSKi/C4xL5Nn5QXl5qo1TGyXVvxurOmxsmF4eiLqcArXO5Y
 oVu13TkV50bWqfJE3/ov7X3sofZd/39b/J6qLmtecmLP8WYNlLcPBnF479/DpjSGsc6M45+Vmes
 n77916/onZ0knhB+Zf3H+Cwd+8V5LNJm+en7x9p+qxmdUap/l/C2i4pwYEG3Z4nNVitJznuP/nz
 kavU//b6v42sFjYLLqa6ryXIe5dz/p/iznlV24NN1PS+zjvRLi9gX5VAyvr+T6O+eyTBeuKmrb/
 Z/pRbjy/+9mS1CfTJC/rSIRsPekfmBwU4SGq73RQ7qU/AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add p1 region to the list of DP registers in the SA8775p example. This
fixes the following warning:

Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: displayport-controller@af54000: reg: [[183844864, 260], [183845376, 192], [183848960, 1904], [183853056, 156]] is too short

Fixes: 409685915f00 ("dt-bindings: display/msm: Document MDSS on SA8775P")
Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/dri-devel/CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com/c
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 58f8a01f29c7aaa9dc943c232363075686c06a7c..4536bb2f971f3b7173b8807f90c9af3e460bb01c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -168,7 +168,8 @@ examples:
             reg = <0xaf54000 0x104>,
                   <0xaf54200 0x0c0>,
                   <0xaf55000 0x770>,
-                  <0xaf56000 0x09c>;
+                  <0xaf56000 0x09c>,
+                  <0xaf57000 0x09c>;
 
             interrupt-parent = <&mdss0>;
             interrupts = <12>;

---
base-commit: ff2ce06d5e28be5ee399a2ff894d6a551c70a318
change-id: 20241112-fd-dp-fux-warning-c8764c93f787

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


