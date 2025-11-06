Return-Path: <linux-arm-msm+bounces-80629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FF7C3C14E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 16:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1081B20D49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 15:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD702E0B68;
	Thu,  6 Nov 2025 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="CxGpMew1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A21A29827E
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443090; cv=none; b=GUjeKd0z4njseFoLcDVehvw6l3GO9N7SvfbS8JQA40zfCz/yo4koM98pC/tz1Aj+kR3zWNUaclZoMe0u81CmK8v2g+QCD+7nQLeWoB3lgywomL5qGl1UXhwmNFTtKo4hs6yLhcHjwxa3R7JNKWBEpcfTMQ0iGO9aAwR84AxZ44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443090; c=relaxed/simple;
	bh=d46gMm7iAqkq5ja/k89Jqo7GJI5rgDOyd5tUdQbUG1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mV4XU9QuA/vUut7CjMxsGoAfR1CzyaLht/B3YNhsW06s67zGe4hmgH0+58g9+0wragNEAb53XZubNXy4XkepYdcT2fIIE70CYpgZIH6wo6zmTq4CjrQqNSP+OrLEzfsG4fgpN9lSLYFrYPvAqwGaniEnGq3Kz+D+sGCBfP5aKlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=CxGpMew1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429b7ba208eso695351f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 07:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1762443086; x=1763047886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaXeZHBypXQ9AI6NR5KHVtefsgfrl7pnV/7arSANDLQ=;
        b=CxGpMew1KMsN98nuVQsyY87ch6ieaQFk4IdU/auNxZQ+3Vdr/xDHwSjwBm1kwA0SGV
         rIXs1dXXsRN/XSbYwzsLcZF2vMmS1/uo18bHtz6F8NfEyJ/LIOUW9qmuuO9R+eHk+8FR
         NJuzYCGDYqx79pL2wV9A8mKbq2B9yvXF2Tygs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443086; x=1763047886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaXeZHBypXQ9AI6NR5KHVtefsgfrl7pnV/7arSANDLQ=;
        b=qt/L8P3Kv9MMtF9JwaEVOrDGpOTdhCZyrVC+6ODD2n+fRVLPiZSzqmX+8pL+M1huO7
         Avr/PfBtRoeaZbButAyYcOfmA+5/DC8kWOqbNzI2VWdCxaf0rS7/NRkJOwuUvQwEp7Le
         kdNSpAtrZ82vByMd1CTjOw5USTNudKSU6ywGngghB0xxreG+G236c+Q1BDR18PM0+7fY
         LysUDmaSpnc6hWKN3dA6YWNYtgbPCmoceNM/OCuq4PNnUdfPDuX/HYEECb9BCuEpGzqk
         n/s/5tvHDem+X0RfJ9D8fW8ENVm6J0YwVRU2Ipfiii8jZfpgr/bMgAdPNkG79maoiiqT
         qJtA==
X-Forwarded-Encrypted: i=1; AJvYcCXTcVV/cWqQ9SIWSBwWWr78u2RV7NZu3CQYC0xdTBH8FOdABLjVMLZKf1DpYlo6gyEydGOsPD/gmO5TQ/Mp@vger.kernel.org
X-Gm-Message-State: AOJu0YzkcwZ07jHtmBGLndkljt8WWknH4sk6w6z1CFkvrj+x1aYKvK6Z
	VTkYndkyeRmgKsOGUpoMR9zlnG3+oopjX/+MXoRUv+lo6H417PhVGZYeYBqAzeM8FOo=
X-Gm-Gg: ASbGncuT2zWgO18jC5UCOLEv5AsO0Amvi26M1iqRtCJBtvJcblSFazHT5AjsDtL6mo5
	GrmmU4u0K8dcY8WhYGW8adBUtvQM69uj1mqLc3KoODpGCAsvd07Pp9VKgNoVHFtJ+j1UnF2sUfr
	1P0K9xkrnRFw+VOVMaMBGtpPrejDC+1k7YXl5ZLFewiJdRQsYvvxvNEj1y6jDU5ztieKsVxUhmp
	KO5kKnjpAn5WeDjJPtwdMzPVKN0uT7t4nH2sU+EK4fu/pl9sJSTCmio1Mq6NKwbhfFN+t2tlneh
	BQorvk0oHkbNA78OtBwhx/HDIH8FPzR5JKQ1OjpoFexwZELlqAVbq/P22yopD4DVNYmneGy4NbC
	Efu2cJlP7t1XuIM/LLRTkDfTLfGpOXseL36zPeL7SD0janSaqq/q7jNhx9vzvj/t+Z3Xo3R9dZt
	no2oLDfDukWUDjDYTqfovUgC0c
X-Google-Smtp-Source: AGHT+IFyU9B6PrVivm8Ey9C3gGeg3vLDWayLnp/yQBozk7q8OZ+iEgdw4cIjtCmIUPVOhruID2h90w==
X-Received: by 2002:a05:6000:647:b0:427:6c6:4e31 with SMTP id ffacd0b85a97d-429e32e43e3mr7999624f8f.22.1762443086154;
        Thu, 06 Nov 2025 07:31:26 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49a079sm5966719f8f.32.2025.11.06.07.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:31:25 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
X-Google-Original-From: Riccardo Mereu <r.mereu@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	farouk.bouabid@cherry.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	mm.facchin@arduino.cc,
	Riccardo Mereu <r.mereu.kernel@arduino.cc>,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 3/5] dt-binding: arm: qcom: add arduino unoq codename
Date: Thu,  6 Nov 2025 16:31:17 +0100
Message-ID: <20251106153119.266840-4-r.mereu@arduino.cc>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106153119.266840-1-r.mereu@arduino.cc>
References: <20251106153119.266840-1-r.mereu@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu.kernel@arduino.cc>

Document Arduino UnoQ. Arduino UnoQ is a single-board computer
combining Qualcomm Dragonwing™ QRB2210 microprocessor with
STMicroelectronics STM32U585 microcontroller.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..1af19245b1d5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -336,6 +336,7 @@ properties:
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
+              - arduino,imola
               - qcom,qrb2210-rb1
           - const: qcom,qrb2210
           - const: qcom,qcm2290
-- 
2.51.2


