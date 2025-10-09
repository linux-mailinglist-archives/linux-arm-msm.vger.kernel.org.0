Return-Path: <linux-arm-msm+bounces-76576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FE3BC8304
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BB484F6D0E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EED2D8393;
	Thu,  9 Oct 2025 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LwwPdw7N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518432D876A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000813; cv=none; b=JwUjzWBnSEC7MPWe15f3CsJGmBoSeX79t/2JCyloLjkwbVH98DcUJT4tvzr66HyyhwVy2g07tJrkqfDwTfExRX+AEEhkkQbU2DZhkfw8JSBRfOkWEX9oZrZZrVBDows9fkDmIZ/YyNgk2ND9HMzhmNNS3VqVPS8gSgdxMj/gyPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000813; c=relaxed/simple;
	bh=eoDXime1aNSf41VKrWKqA9W9Sa5Zt7IvwdfTnUqBwWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QcnLJioKT9Yq7EH3jaLVYCM6BejklGRFdHBl/kQ7I1WKKem1FSNnz1ji90bCHWNchype8NUpOvNnDcro2ZfcAQvtWMxo5Zjgvj9pR3+NQcrKe9I1DaY3dS2M6qvke/Uhj7a86YS4/hBtwQDM61NNPXdZg2GN/0grsasp6ZaQQ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LwwPdw7N; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63a0375d7b6so473778a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760000808; x=1760605608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qacc+aeH081mkpeq0qtJjcgsPMbMH7mykJcba3R5N6Q=;
        b=LwwPdw7N3egRw4MfD7pe1hicZ2wlOpqsYAxrXXd7LEtom4gfQ7y58awj/aPdEEJ/qK
         5Te9P+DBYmNgCobg/aKKCG32uRF0Bz8xRdyiZ1DZHJsjeFooYbuguIRIZljLkfxHaJfy
         eLv6Ug/GvVhcNIgjq3UZItzZrc5uzY7HvkLyWv9g3RpufN6KcW1NlxHm6oas0ekHzbFw
         63uSNKLHat9yK5TfutbI0SCxxp8+pMR3FMzQT5sjXoEPIOgOvjZ3hmVZs9ZgOozL0sWb
         mLMQYH6jjiljBAbkootuZYB4W8lP7NjrGzvEJTaeLB/d9RdOjK/19TfRS5Au49hhkzJK
         HePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000808; x=1760605608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qacc+aeH081mkpeq0qtJjcgsPMbMH7mykJcba3R5N6Q=;
        b=xU/q/yGgu/XYJCME7Qdabspyi3OB5b5ov7gk0i0GWZnaTYc2GuhCJl4Zk9FEr+aT+P
         GYUQpao628QTvx4neK7xfBSrixzPqVZy5QzFIPWdw1arbwPQ3NJ52lcHFQNGDN0eR9a7
         9nQ3nWoYJ4vfUdVHIhfk01SeX0jEVNqXnn8C0wsYm0Q0jCW5P4j3yODYe22dyY7BexWe
         RhlvDPwJ6KwqQmXAKDOCiyxPJpGCgGs00PJarZJT8hfAyM87Gr7Y69sxpszXS2HcLUGv
         wh4k6u7btYLUZtkrCRX7GH8yM5BhvrVV+x7cwMZdwE5kKriNzWDyQr50uGP6LjCo1IE6
         IVtA==
X-Forwarded-Encrypted: i=1; AJvYcCV+4IbEHbUFrRMl7uGTN9NE/hXfl6H4n7mNWN4Pj0pnnR+wdVqM70rloXXKSeIYCyDwhuoTaLRlZOAJi2SF@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLMvznbmvolPjkzxfV5vTDsaEbeXMuCHABaDgFpsNBz+fAB/S
	EgLwthm2qK82VPpKCOTtrElvniuv0b7PZpEJjodYmn371TpOSPMmAQdthvIMNI8ESP0=
X-Gm-Gg: ASbGncvasusbjciCvR2XpNpOo5cWKdO5uRAXbllKf83+Fdq/lLQL1SAdTdVEyL29zku
	xgo9Vp49myDhzNl4qDZ+YWAz7fC9JdmRuHcUPwe9ALaPpBHwSpXdt/W48dVOeaz22ZUtOmIlcOn
	D0rESHdPz3uMFsQD1D1KOGTOlQr8KRG2fOuCrXxmO0cEUuL8QhJgTkq8ISvEmtEySKVVfKPITok
	6SVaAw2eww6mFh8Vi1iyNgsX1qI25TqTiVeWE5HMCsOoaWlyrzS0Z+TEIN2knhdl198Xqmg4GN/
	lYQi7yqteKjnhM3qrqXI0L/+gYdnLiDuQ8QZRsMLJl4GpXzSnYGZCA17L7+K6fmeKyxVfefy6NP
	WoqDH62eLNUNyhHvZOpG6MkpvuoQtAPsY7j7ODf38CYdY8XgqLx4PzqYGqreAvI0nDmyN9SvjWu
	pF5ZOVCyVVsoIHI1xryw==
X-Google-Smtp-Source: AGHT+IFYR8i0mrRw+zCNEV/pJoxI4LYGMGp5GEhXLNZfBhL4V0B1OriyeP/tbhf2zus+NefeB9G68g==
X-Received: by 2002:a05:6402:1d4d:b0:639:fd55:37f5 with SMTP id 4fb4d7f45d1cf-639fd554056mr1180673a12.14.1760000808515;
        Thu, 09 Oct 2025 02:06:48 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4109046sm1905755a12.44.2025.10.09.02.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:06:47 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Oct 2025 11:06:34 +0200
Subject: [PATCH v2 4/6] arm64: dts: qcom: qcm6490-shift-otter: Enable flash
 LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-otter-further-bringup-v2-4-5bb2f4a02cea@fairphone.com>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
In-Reply-To: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760000803; l=1008;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BxKFS95w1jXy35yaD2QFxAG8rJtE2kDnNaQVe3uTD4Q=;
 b=x8GqfoiMS7G+7JxFND0I9CxgJgnfeDYrwtV0yTVPxM+fe0P/ABKAFPdpoq5tfC+BrT4YAi2KN
 342Gx22/queCZoWhWVrxOWoKW+jIszc37AMo6FCvAgqDofedD+A5pSG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Casey Connolly <casey.connolly@linaro.org>

Describe the flash LED on this phone.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 31650c29b1ca..ac6ed79e57b1 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -605,6 +605,19 @@ volume_down_default: volume-down-default-state {
 	};
 };
 
+&pm8350c_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>, <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &pmk8350_adc_tm {
 	status = "okay";
 

-- 
2.51.0


