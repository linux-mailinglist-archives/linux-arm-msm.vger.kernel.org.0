Return-Path: <linux-arm-msm+bounces-11151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC83B855DB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 10:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BD811C22426
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11CC171B0;
	Thu, 15 Feb 2024 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lGzFFgtZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE97717592
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707988835; cv=none; b=T6WvwJ3eb0YQRlRJZVqJf1d10t7PFHPHvucH7ej2lWe3ypt+OeUF55YAtYVB6ceUphPkc49+hOFn7FDAv5FM8LDEEfJcK0j92yQ1I7mwHm/pK0dkzG67Ci7xLSNkU4kvH7DviPqPcWfAYy5geQS4NC0wyJMJyxnsyr/AAU+5V24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707988835; c=relaxed/simple;
	bh=QCkz/HAlxsbVXDc+FMCgFBx5P0nVAWSA4UynpoVJyfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nlkl8I/eq9lnxzigl4KhLpdxYg6+D2N4pdF4d0nm9kNNS4TxDKteggKH9F5gatntc2X6tfLjgdHRMd7uFJnS5PjkWtZAN1yeQF4ub7JiKQz7oXufAk2eHRRz3HKQPfuGxDQI4lwHNUN9chHus8SAWgYyU9yOcJBWQaaT6WeHOSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lGzFFgtZ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d0e5212559so7383361fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 01:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707988832; x=1708593632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RMgnrHnFvnkqmQ/HYz89uTL6/4/6fzEmMqCiEApO7Y=;
        b=lGzFFgtZA/fn31PIAbZDA3SW2rGnyHVTqmtZH11z7UEWKpNKHtxwJZx0bH4gVyrsNj
         4Y8Gg/5+Obe3v5EkUk++5Rl7CZrnWfAknPPcgdUaXWxGWtPmw0E9RJCYZ68Lt3ngzdxr
         i75kUXusHP3VAwjIB+dqx2DmQLAqIRXHsFtiMDEFoeqEg7fhsdWLmTDoL8HFp2ZwUtTu
         TsuizPmVFywGasE4VVu2YLJ8EzR/RtwZx2F0s6qAUfxzTalcp3m+xltMcE4o7aTnN61a
         jk7124DC5M4i3btsAccIHL/H61KREs8tqW8p14Quyhs6dwSl5YG1fMrbTrDmakOYehbw
         wRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707988832; x=1708593632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RMgnrHnFvnkqmQ/HYz89uTL6/4/6fzEmMqCiEApO7Y=;
        b=wEGHpru+J19uEdmw2w2l3M4Yo8bV2LFZqZR/BlO4W7jqC379yoCu4lLC0aMU2QUgfo
         Y6zRqI9k11teTs3/c5s9YJfxH1O42pgEuil+urQFnbqMZzCalww3p0uVLph2WS4fm+i9
         T6RzUnewU9wHOfdNKN2gmOBI8c40/R68EBkRRQenp2FWZNXt9Noro4xObkVQdhvALD2+
         9JjyycaQDsWV2clNKey3YbjmrvSxsIRXzlAqnOHHljeiOqWR2jJ3gtsCAZNySGccbiVj
         jyhN318qWnFVK5TjDuaXnRGiFymEYwe+Tz4pu4OoKa6EmNauDBWdyturKpx75BPu9uV7
         gkNg==
X-Gm-Message-State: AOJu0YxH4mTHLwpAjng0P+IJ+IvVg0vuT029CUSPpOOfOdF88dJ3+2Ga
	ZL47uuZHbE7fVJzYRnI7u+e6ABK+ptuCffACOeLrinWf9/PwWXJKVxLa6JHyZJ4=
X-Google-Smtp-Source: AGHT+IHjoLYwjQO2evmWDkGzS21OU9pSICDlRxJhWfQtTk/vibTdzci6Q9CTyCXn5Ys3Glr07s+Xqg==
X-Received: by 2002:a2e:a1c9:0:b0:2d0:c308:5f6e with SMTP id c9-20020a2ea1c9000000b002d0c3085f6emr771443ljm.44.1707988831872;
        Thu, 15 Feb 2024 01:20:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l8-20020adfa388000000b0033b66c2d61esm1156435wrb.48.2024.02.15.01.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 01:20:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 15 Feb 2024 10:20:23 +0100
Subject: [PATCH v2 1/6] dt-bindings: display/msm/gmu: Document Adreno 750
 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240215-topic-sm8650-gpu-v2-1-6be0b4bf2e09@linaro.org>
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
In-Reply-To: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QCkz/HAlxsbVXDc+FMCgFBx5P0nVAWSA4UynpoVJyfQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlzddasnMca9nUPOla3cwN7PCE0JduOPzXxA2qqUzW
 e2kOVoeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc3XWgAKCRB33NvayMhJ0Wj9D/
 0RrWe9Gn5RAb867YZH0V9YAQVDSuc+HT6lV+Agq2y2GLHtzIvXJ4JsruwNsmuq+ZqPe2MkIMFnx+/X
 MjUYuej5kzmpVhL6yKUf8hm1MGWPg603I+yQpGGDbRtv/LMwkXU/25tTDKJVWNA51megauxy0xhMcE
 iyNW00psGC5hAqM8sz7hoIfgxkH3en1jUV1FRO/SqwecGflASYiAu3ipm966nrm0+slYNljFvYHhfs
 KsfSSCFLpDtSF32DZxeBvCEXlqWpZ0iatAC16NfWMcxvwnVDRC5Uvg8zZ2cjXR4HJCH9UG4xUI5MjZ
 5R57NvkOFIENTbZlLisDk+KCJrKjwxia2SYeIXvSAt8tXtRC0ptAu8nAjQlukMpigIoz3qwnDduS0x
 Xc7RSPzhVpLd7nayvRfGvqKGJrpoyQYQXCK/WKvln+fVnOJjKCkxJW0OSBSIIXl7s4CUpLU8PNhRiA
 0VGRhC7l6fpzGNMKk3ROgQ7IEQIJpqr/Sk0HtuobQh+a8hid4CV0EDYZylLf7neHtwD2dIK6N8WML6
 tTK8CC0A0vJYJOUlYuSfXlQU0F59EBeq8S+5xUI+nLMsVPaOr74uQjXV+uXpQdemascqVz3dWudKwF
 MJat0Wecksh1yK/yjz0ofkVSRa5Bdv/rpEx2JhojBfqBnGuGL5yEJp2AMPQw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Adreno 750 GMU found on the SM8650 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 4e1c25b42908..b3837368a260 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -224,6 +224,7 @@ allOf:
             enum:
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
+              - qcom,adreno-gmu-750.1
     then:
       properties:
         reg:

-- 
2.34.1


