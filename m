Return-Path: <linux-arm-msm+bounces-72257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93848B454FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBF457BF17E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB0530ACF9;
	Fri,  5 Sep 2025 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yUR4/P1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D1C3054C0
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068868; cv=none; b=qgGjfQPZAXlluy/bt1MvZLl99cGci5A1Pyw/fu8IXKL0pfZUjFms4ZkKTWlL88njFFU6jJ+a8pyQHwg/4hH5z0Yq6gVQ/ahjiRcyrHFtaY3mp98yrrOAAutSM0fWi2symKxX1Z8twlCBG8t13sW3dFJRXVuTvUKTAuEBL3iRVac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068868; c=relaxed/simple;
	bh=BsquXCSdmRv8hbIvUjTb7dUQJIWJ4+iHdiZoxAVtdRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2HaO9ZRGxPBfqqbZcQW8jq/WGH2Y4MNOZjytG7gFV/Zikxb81VRgj0MqL92wfTGNNQPwQlgC4AcUhl9iFkxzcTS+d4+7bRQTGcTr8BMyuPeQLR4Tk14DD1lxjBRzCdOIylAkd9qC3LD3bSU3bUrhNVzgFPaK5/knNZOotvtlGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yUR4/P1h; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e07ffffb87so865950f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757068864; x=1757673664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vq4GY2r0cceMRd0WxojTtWDxH4I3aOXQIER+mEWrZpY=;
        b=yUR4/P1hbCo9eoUFZPWYduHC/ELgVqflahkT8UskbtEV1IIvcy5HLCPfvmgNZYX9tS
         3NJruTXoUcfOFx9nK0yblOZgUxuJZjwbFpW8rDQNMDUNNX5rqHo+3TPXYxolwVb4iP7d
         SyxI487AbppQI3JaqKE6xL30A2bLwX4fvYa+GE9E2lbCHrGyK4fO3frBz/IRyTBBwVkC
         dzrWOZgU2Tm38NQ1LlzY7Y22H4+Z9AaUfT2Z4Usj9xAzK4Q5Hj2S3TvatOzIqONITksj
         VqG+BNv/I00lHQSqmBxleunFi+SXj7iZRkSizi6Hn2VIpWGr2ZaVtSCqiCirszvO0DVP
         nmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068864; x=1757673664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vq4GY2r0cceMRd0WxojTtWDxH4I3aOXQIER+mEWrZpY=;
        b=IAIegHchM5l+ctmUsXBlqjamXEBs89/JG816+7dFrY+WO/bF2iMwDqVAPn55XcCzLm
         XHSkcySF1HFh3a8N4rMr4UAxru7VTZYwxqJp/zi7FXVfnieAQVKqwJTWBwsCVN3PRtMT
         9DOONvkJdJOoal1gSnWQZnLmmHfKfhTN80sC3t2MFZ5zg3dY6RMZ4jIxYsG0zRobwcoc
         oZZxR7d5F1eQDaXODOBNP7XIphS6unXifvEaZ2BTK6cujTSu+7Avo1FEzI6J9ijvnQJl
         j/Sw8/E/7pSjXX+qj5neGBMqgntWJk1OLS5r8h4Jr61K3GEz9JTAhot7SNegsIhzq6k3
         Rwqg==
X-Forwarded-Encrypted: i=1; AJvYcCWVs58cpq6t/lRZsfyhuRe1rYH6p2lZowf7DkQ9SRTMPDVA2kHCVILY+aSXDuPGIva6g43YVTYoxBuGuBl/@vger.kernel.org
X-Gm-Message-State: AOJu0YzSl08iKPcN8/WCchR0jgtKDPxp/Ry6fInv0uMi5Ft/20VXwENs
	1WiSOdo0QNVC9v2eh3arimczaLB7rXuSff7UXcQrAp1gx/v9NoT/MFiITeinenoNt4g=
X-Gm-Gg: ASbGncseAk27YKpBd/id3T/AdHI0rp0iXyyXffUcKWIxnbr/d4eK3dnfSnZqJRTEfI4
	GCqSrM4gjGgHrJQEW8CfDTAdLFFOqqt/pQHbyFLn7spjyj4KOs00ADFqt8ye3vcFxiO/YnmjDay
	19Ih/pz+2A8nKc6y0QzaCZV5ozpxqbT6R6STp32VBNRTkyPiaq4jamIJr5mQ5oo1nJqxqG+f9kZ
	IsVORVZPYxqNvMru0or7PBpy3fBH4sbgskCigXa8FFNSofm8HB0AiPNmQL6thVpJrX6+4VG8/2T
	crdRyrGU1Ile5rN1QH+GJvwow4lQ8MY8b1PeX6IousQYF/SkSeA7fvkQL0OjxgrFSYsVAO2T9Vz
	+QqsyreTE3K87aav4oS2xt6T5DQSmxZpv4YlSlsYJ53TH0S/AZk4uxBy0965bxvas9UbrQHyhVt
	TSHtEQ0pQWVuBpI+C24kTE7snymoHgxw==
X-Google-Smtp-Source: AGHT+IHG8nffzwD4YN91CRrTsA4vU+N2ZBbmAzmBwvrFMUoXDd0zamtpz6w9o1A53yZ3pJ3Fdfiedg==
X-Received: by 2002:a05:6000:2910:b0:3e3:5b4:dc27 with SMTP id ffacd0b85a97d-3e305d3632bmr2626788f8f.47.1757068863712;
        Fri, 05 Sep 2025 03:41:03 -0700 (PDT)
Received: from [172.18.170.139] (ip-185-104-138-158.ptr.icomera.net. [185.104.138.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm20990738f8f.3.2025.09.05.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:41:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Sep 2025 12:40:33 +0200
Subject: [PATCH v3 2/7] dt-bindings: crypto: qcom,prng: document Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-sm7635-fp6-initial-v3-2-0117c2eff1b7@fairphone.com>
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
In-Reply-To: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757068857; l=922;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BsquXCSdmRv8hbIvUjTb7dUQJIWJ4+iHdiZoxAVtdRQ=;
 b=DufvbWhWfijv36FttwJUJbmZnqswuL+O9y5KlTf3evp/rae9jPjUvTHmnGQuHkt4QK2UESAbS
 xuhpq1+V0Q+DzEy1kFhJr7BCq7NmiM9RtK0Ej98vvt2HYMjZaC8HrYH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document Milos SoC compatible for the True Random Number Generator.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index ed7e16bd11d33c16d0adf02c38419dbaee87ac48..0fdef054a1a30c363e0d99518351fb18124904f0 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
+              - qcom,milos-trng
               - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng

-- 
2.51.0


