Return-Path: <linux-arm-msm+bounces-21650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 216148FB963
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFEFB281836
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2A214885D;
	Tue,  4 Jun 2024 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="tZjIPass"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F32313D62A
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717519570; cv=none; b=Dzy504MT7zwKIJb5XtpaawEtO5Ibf4p0iAR+7KEY+NrIeCnc7FLhyIyByheVvBMt05U7aafcJGP91d3EFUeOeVHMmN4YzV/91KeLgDY1ssDtjWUnvVjaagXlhQH6i3tqaAsfQ6QsFQlOCH3Ktz4Yheyt1vZOPxW32RB8BuSarJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717519570; c=relaxed/simple;
	bh=V/n6N+TOSeadphevdOSNbz+/OF7dVHiqPrKnq5b76Kw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=caM81Rp4JJkID63SJ2Vcy0l62+UqZv7gpXLnWkoSsW4uLO2CCc6OfD3At7eJp5vD42aBLvgcpXbYC2YUH3DtcxBDsAyOC1emzvWWhEFLPhn+Qujryue3FkTQlUER/4UgVQyu3DejdvyCMcL+7R19Wux/8O5l67b1k4ximtTdqKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=tZjIPass; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35dceef429bso2590f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 09:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717519567; x=1718124367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WzX2crzner54qLH1BfhKB/A+YfwINCia8LSzqi1+8vk=;
        b=tZjIPassX4ao52fljki28nkQFowzi8xv85CYONNniqNGIH6acvTZyhWgHaEAetxVWt
         jlNt6Hr+6B+QS4m0ozSJMSyYJv1c2x26PExC5eVonXF6FlKt3ZAZTVviSOGMVDZ+y28W
         qA3VWCc9Kf435DYdG+mQtsaiD9ywX5bhrRUO6h0jI91Zskb3CV+jFq1yZNHYmbltTeV6
         ASLqzLYCGQ5k0a6m1qtB0II9WTTIlL9ORtnVe6055YUwOvEFyORyNARzbQ+33NMqBfGS
         GZnyFusmvBdq6G/jo9hSGjtmlYen7Z1WRH44niuUHWgUmdvefzx/plNIZ/SCreck+dYo
         YQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717519567; x=1718124367;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WzX2crzner54qLH1BfhKB/A+YfwINCia8LSzqi1+8vk=;
        b=bIYn5ZmJFLXYK1kPz5+tr+8wOORBwbkWYe9k7/2ABDbPxuETcjruEZtEt6TsuPufT+
         hHwgjC/2lQD4ixOBvPKGAI0n1zrMRU57eOnxqXl57WYodf8NJROr8y+DhWkZFPdO7TdA
         XfDpWFtMdz660Bq59dF9AL3Y6ymgMSNBdoCqg92vpp3AtzwF8zKHjA1nPmufia4nLwrV
         uW4I2OCSdPcnAGKltHIDAvysO12kniHY/tlVgP89l9i1lZMSjD5LohK1McY6b38BKBsn
         ty5y4SQNGXtR4+HWyALFXBv97oxBmEJn8aZDVPfcwass5ZjyFahPN122emjfKZI9vwT+
         Ch8w==
X-Gm-Message-State: AOJu0YyWV2g7p8BrFCN5p8jH3WS12HdNNsiWlhvIt1EQM2ngfImFIV/g
	4+8stLHHYnL07OzVG4MkGUvyW0yrZHlEgvXLEpIs2djsT+AGmLj02I9OOKcjAyA=
X-Google-Smtp-Source: AGHT+IHsjwQSpgpoULxOmieXHX2EY9bSw43cMW3Y1lHVNFwHiKurh8RKIaF8+RMv/nVJic85jiZtmA==
X-Received: by 2002:adf:fd8f:0:b0:359:f17c:134f with SMTP id ffacd0b85a97d-35e7c591460mr2636525f8f.32.1717519566817;
        Tue, 04 Jun 2024 09:46:06 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c090esm12634482f8f.6.2024.06.04.09.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:46:06 -0700 (PDT)
Message-ID: <2db42e45-c034-43be-be96-0e88511d1878@freebox.fr>
Date: Tue, 4 Jun 2024 18:42:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 1/3] dt-bindings: media: add qcom,msm8998-venus
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Language: en-US
In-Reply-To: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

msm8998 has the same video encode/decode accelerator as msm8996.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
index 3a4d817e544e2..56c16458e3bb4 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,msm8996-venus
+    enum:
+      - qcom,msm8996-venus
+      - qcom,msm8998-venus
 
   power-domains:
     maxItems: 1
-- 
2.34.1


