Return-Path: <linux-arm-msm+bounces-48240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2EA3893B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B6B618845E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5CC225789;
	Mon, 17 Feb 2025 16:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iiDU8xY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFFC2253F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810010; cv=none; b=epbteawba+YbO1voj6uN6CyMCLlGBiFESYiBN/qcm6uHQlsA5/fodvkIGQzsvBlqvjlpoIIubFh6gb995keMz0EoXcffFaLmz8A3+3TNphvR+tMSjTkMRjN99ySiWrWt7P067wpE+X9cNjD6jsbA1TDZPbIiIGzeVpMfssbzrnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810010; c=relaxed/simple;
	bh=zhDVJvHjB5Lzuhnk6MLMvE1kAvmruLGrFv1o/of7giQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaHT0dWfeFNtf5qZWg57dq7Ik+7Zk74ijOFyurZ3uxJ6zZE4rsYP/t+AviIEoxFILFrbQ6+ryQd8eg6FsnPppdrCz1wz9+3HeTtABVcA/SvHS9HsHVlZnV1ysm/mj3Cf3I/K9F7pjf6XAih2qVftCBbUEx8z21Pav/XnDHJcQGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iiDU8xY1; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3072f8dc069so46672871fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810006; x=1740414806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTk1JOhDFyU+6z9JRqVi4gh1NwvHjNu6gaxKn+V6LLc=;
        b=iiDU8xY1FgsqeFI4W+dqes3xnGgFaLSElW4iip+R97pYPVNyT8TqJnaM+qtti0W1CB
         VZBWVlsHP9LyVoB3HKajjMycFoBNhJ//aaA5hWBdx37fWd+rz4mzkNoihLVZSbncCzqf
         EAf6meAlL0VmK7+3eCZGQqubQX1mshHKFGSrILMnhb0EDsWFLq615PFZEDZtxQQCoTjc
         QCKN6tpBDgi7wWIxwjjalpTq89kHRIn8H9kmBTRmSTQpSckLiQ6jxiKA7u+lyi5ULca4
         e2ZmPjciRd85Ebix68cDY7fRO9BHPqNFjyoG5KbpwcLexoydfyGXmtwaq77B6D22bzGJ
         /AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810006; x=1740414806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTk1JOhDFyU+6z9JRqVi4gh1NwvHjNu6gaxKn+V6LLc=;
        b=p3jqfsSSjf/6hr1FKPABLgRgE9COKqkUZ0by4tctX4E0wLgm/f22rBcarc91untC9A
         /yRTVWKWtnY49o4kYguX3i8v9a4VX6ZcuTXP2ElkBFUKxK6BbQVoxvjvvRdnh/z0MhDN
         Ze4gku5peSTtyn0vvUkO2ni8EHjZC2nt10xjOZWO6azP6RmfUpPOP81DhYuwKwVJTi8X
         s+ida2RQnaaPntwTPQANEad6pcua01oIBuQ/TIhkZC83RW53LyiDRwLDrwp0X0+WuCQx
         dHE81dF0T26rYEtOPLMSzBuFVezBSdfN1JV+lkdKiVfJeRmnVQM2f/q1OEQDfyOGMXg8
         o8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXNDS7JUwHa/z90WqiD7m2EqlPjPbKS7nuEnstLbmXxx8UWiwGuzAb+2diPrI9jXvW7e0YGfs5HlOtfL3PT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8c4j7JTrh6DGakIULFdp+7sR5BO1W2WECIwi3XzdFZcsTE2wh
	jYV/CslcBOMbHB2zEv4azk5g9L/A/zwHL2m9Q/sdct+WaItX92E6vJpDynVz0x8=
X-Gm-Gg: ASbGncsY4gl784hM6yWum2GbdREuE8MXfXbn6I3VfJvDmcqfg58oknl9hWQvYnl8wcv
	/ybSshIzkZhJhAMV7f2kcTeOTbUBeKfAV2NiQQCa9MOG9ttXDQfjOUduBMNDBEDm8iN/MOpT+bn
	kV1/HMy0W546Xm9vEnsLfdXQULjDhmoXtcnB9bAlp+Oc4kevumtu6Nxa4sL/wUqqUMZ3WfQLhZu
	nhStyD8GA6xf4gYrv3WoNE274INf7tm+PU6LXbflfmflHUTkktD+TupZR0+j5QfPc7cGwiBoJiO
	lQu7iPB5LDftkMnobFsY4QxIcdpdYi65k4RoYgxiUYdj0bAWcIFj/myw724=
X-Google-Smtp-Source: AGHT+IGzI4BEq8iQ8ebMwalu59c1aO+y/rKFu+C3kD7LqJ5UE6HVzDUxUsXxpYOyGfa6H+jPNWIXDQ==
X-Received: by 2002:a2e:9ad6:0:b0:308:e9ae:b5b3 with SMTP id 38308e7fff4ca-30927a2de98mr27830941fa.1.1739810006210;
        Mon, 17 Feb 2025 08:33:26 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2cef18d1sm5695991fa.76.2025.02.17.08.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:33:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 17 Feb 2025 18:33:18 +0200
Subject: [PATCH v5 1/5] dt-bindings: nvmem: fixed-cell: increase bits start
 value to 31
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sar2130p-nvmem-v5-1-2f01049d1eea@linaro.org>
References: <20250217-sar2130p-nvmem-v5-0-2f01049d1eea@linaro.org>
In-Reply-To: <20250217-sar2130p-nvmem-v5-0-2f01049d1eea@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zhDVJvHjB5Lzuhnk6MLMvE1kAvmruLGrFv1o/of7giQ=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBns2TQfC4FtXqBdUxy1mAiGozMMqn5scy5wXUU8
 MOU6EDgxoCJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7Nk0AAKCRAU23LtvoBl
 uF0iEACudRVZ6tx6aH1ir2ml/AYJM9XCw5Qet5H7mXsmcis7xR2iVsfGOH6VGoOLbnSDAKUp/3P
 39wzkVXSptHiyxFHWaFqNKKJ0yjdWeh7DnPsI72+kmg8pTYKKuqzTpz2YdgbAPJhUHirHX9G9Be
 3UafGfWFiyPIH1wLiWaGfcY2n86VyHBwHx7WZb7+bvnBFLN6BeoKsmhqD5AMFDA0zbNaoPOXX2/
 T1PskCjspTRWUBp6ZjU44coFzodswxmoT8wOgXLe0Kbfj2pYMm6UMqNJ6vIEqcceFD2GbWOMruX
 rA2Bb0xr9cC1YIYWl1r8kFXI/2dmnDoA9GrKjHvwj//Vxc13+hjorWayBRroLbF4J8kDakUlOHY
 EI8ZbUdQteaI2XLUX80dyDlaaTe5rNfWUx4F3iE4/sgeHBKXrt+e0IObiuffg62+7rgi9UwBP1F
 KWrjvv4zBYHElX2ZxAEUBP8v+SVPCn4ExYila5NNxalA+Cbsr7tpTIBjgSeFSCBZ+orRNYp7V/L
 rvyIaJwqWBws7+5euGB1yT+Nl7oSSsXLRUl0cMNLFAvTvEyTkAc0I8zJ8fHFvvX2rW/qu47v45X
 7DnMMHbC7tGw3LiuEOzeTzwAW5oHZKGV7vHxFKFJ1bHNnngKEhnb/bSvYLIkHkTz5WDj5EKWqlN
 LJapm1xwV8ebRew==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If NVMEM uses a data stride bigger than a byte, the starting bit of the
cell might be bigger than a byte (e.g. if the data comes in the second
byte of the 4-byte word). Allow the staring bit to be 8 or greater to
reflect such usecases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 8b3826243dddfcf9c9bea531541c55d3fc04a3bf..38e3ad50ff4fb6200023f22b4c70c506349142df 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -27,7 +27,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     items:
       - minimum: 0
-        maximum: 7
+        maximum: 31
         description:
           Offset in bit within the address range specified by reg.
       - minimum: 1

-- 
2.39.5


