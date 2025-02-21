Return-Path: <linux-arm-msm+bounces-48905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A382CA3F894
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC90119C798A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD79213E8A;
	Fri, 21 Feb 2025 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m3tqdZXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E81D211470
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151500; cv=none; b=ciIG1QHAUOqm9GFtD2OJf9LSv1vhDjdFVywnYdNU4u51J8LK9HybQbZ8JUV2ZXT9K7ZIitaz4b6iYNKveZcWcF3jZpqkoXUEPUjAOuScIYd+O+xbdSCcYRaiW0KgWdSgs1DIivGMkp2Bh6Ws20Ve9vk5V16Z8ZqlgmklzqRxVtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151500; c=relaxed/simple;
	bh=g6ZcIsYl2/jMWfZyQs4pXVAtZzsF1td/uQveud5buEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrpoQRuVtwJkiZ9cEnL9KqFlxBn19rVJy5wa3l1LjxhWGn0siHZD2YKsSbi+KlCMi4IfoQ2wPv3MQjjZSaEKUaWfZPcEaPzmnf0WV2ZBDwCjdy5kGi4s6/1ybu0fBtuIL3qWG92AkEAUiHyr5IrzDyOzALwRjMXH9GypSTbci8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m3tqdZXq; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7c4350826so36622166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740151497; x=1740756297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YV1kRNxec3hf47euA082/GCXKE5VaU0R53exCWfzts=;
        b=m3tqdZXqpOihr8wLQzG71fyySMZ0zFq5i39/jsPgUSqFhag21fS8w5mGiicapUCrY3
         LYesgmLVaF3psAYZi417fbA+WsTAXTSy3V34uJeSx592gKQ1cHibDus9iL1zsvmKhBjp
         cX0Uz00MXWiKYHF5l9O1ZO1TdffzxoMXYWO/L9WSlRu0Nx3hysVUA8algg9yZjGFN+0O
         vE5vqA8d46kA2TZocIwJvWEhpl/eyqzmmI8Eto9kYnJ2NRK7p9VTjT3fAFUbwismC13L
         LbMyBR/XH+nP18+IfjfFw8ACoMZV47JqrCJCdA/TSJM1klwvU0v8PVsiyb83LvzbMPpf
         gYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151497; x=1740756297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YV1kRNxec3hf47euA082/GCXKE5VaU0R53exCWfzts=;
        b=MtiIhGtzDeQHL0UmVniwby36ICDbbRQSg4g5ProyoNUzurS/JKi2TYiyW8xrpE8/0l
         6peIqnHwZzjVDGV+bohRzadJn6lAh8Hbtv2fxDaWSg//PQ7mIwpzOomy9TOMRw6KNinM
         uVVlEpn3nDNW9R+7T8P1R1c6iXhyis566V4Kv0LSE6xU22Nh8HlzgYFx+VJKk9+PgBSR
         0OvMsXCsOZRrNBzyGDoEh9IqqXhQLbUzB66KIJStZ6qp7Lq247xYU7FcIGeSjpkkvDgo
         7RQyDFn5s4RYqAOu8lfXwpg/WlyCBrzvWiliDUdB5kelyz5pb2pILieD97Uftr9KOf3S
         jCKw==
X-Gm-Message-State: AOJu0Ywi3F3oAqPN4rGFtyhSFWrHqsCEp2aziki1nC18RglG4yjaAfpw
	mkYEy5nRQfEksvzGOkMzTMKwTpYlS/sEJdDbFCKlfqogQSap3gP4R+ARPMAv+Rlr3SA8zngsb0V
	HFpA=
X-Gm-Gg: ASbGncvHAZ6ksDsxJ/MPjdFgZyjbN1ruWx4g8w6mEW8zY+ympwVpb9nrOy6hEXlFebr
	3DABvF98m1AQteCZHsTDu33x2UZs+kE/wbvM7zeOUyoZvGVgrEd3QsJn3KVBc743nkvHk5pm4Hv
	91bO+zI4MURfUEjeRmRetcBU8na6iv1KpwFeJ/WUz8AV2Dv90sJNcclQ8IufOTOfeUPdIeBnmzH
	0Nwrj54iRavEn7wTi5/iPgGDn+KnpG7jX2GTj1BmMDDNgxiitjd5/vmlMiv9P/A8K692ju9WCKb
	XEpKWEj6gXDpQg/Z5VSwuGiXBVUDtfQR87IllbUaMe1O0yM8SvuwhpbFrHZ3VKRamspbve+D09j
	p
X-Google-Smtp-Source: AGHT+IFy7EJuGr6YFVXKBajfG+1j7y8/7XeV4koN/V1krFCJVQBIIqPb4EzGvROCXQyRnjjcFYi9VQ==
X-Received: by 2002:a17:907:1c0d:b0:ab7:c28f:de59 with SMTP id a640c23a62f3a-abc09d2deb1mr120158266b.13.1740151496644;
        Fri, 21 Feb 2025 07:24:56 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:24:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:13 +0100
Subject: [PATCH v3 03/21] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-3-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=g6ZcIsYl2/jMWfZyQs4pXVAtZzsF1td/uQveud5buEk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJquIDPKcX+Rx7v0CVf58SDbQy7/9H36p4/X/
 QyftRnNPe+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iargAKCRDBN2bmhouD
 16XdD/0T1kAqTkR8/1WysMoQpb12phv708f+gdkkG4acV50G9LWjjqz+b2Ded/v8aPyeo+UTkA2
 /t4MDCbN28qtDRJnlqyQfB/SnUxsBePMyNVKJ8J39/4FhyW0EHHm5aFJTGSoBI0WZYJEjoz2WIN
 ouNcGnvv4jN0SSe0abH0SQMf57qDYiDy09m0gVfxJrXCdlZjFaf1KsCy3gQA7Yj0ZskTbRl9up8
 tOLm2OLtDMa3GdZ8DimxLq9iT0qTzXJETfBaCQwptWuW5LbviyZ3YrTH3gz/afgIrjATO0q1p/h
 I4D3ZbeZokDfAvu+bEmXFeHeym1hu3gbSIaBrjMwheSryMTruJfoYmvmtOM1vUTAVupDGg+DLOg
 zk7pAt8Tn2AeuuFVk2qXVjxR4aJYD6AjTUTToZukc1/xeYSJnG1aIDCdKksNufm2LnKVn5DD9lP
 NRU5esfanBdvwmUvDpivrs6BDEFiLY/eHCHhjOTsVWs63nQ+Gf0aV0kvKVjtnJGZIPwTvhsMlM1
 zi7s72NCqzbxD7dHbeS0LOEf9Sxf9m2EiUvFnJeubyWbIE8KwG0MWnBqnEycbBaXiwBMh2BjTZB
 KUKyfNPhkOIRoWP5Mb+mq+i/786xSoWann2Y9gDp4MPmLVE3estoqc2ZcQUrs4swL9N9zE2aanB
 +pisvvLP96aBSaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..4ac262d3feb1293c65633f3b804b4f34c518400c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.43.0


