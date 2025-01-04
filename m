Return-Path: <linux-arm-msm+bounces-43934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB63A012B8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 07:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F7B51884C61
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 06:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4B517ADF7;
	Sat,  4 Jan 2025 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tEmPytfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4160170A1A
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jan 2025 06:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735971571; cv=none; b=q1JzGgGmZk7RGNnT+jNidJzhYaeWSzs9XwgdexsBWMw1IyDdkepWYQ+c0joSTw84bDOBDX4eKeCV0x4BBVAwt8U9TTHbNLCPv0H8qOpozkOtb6xhP/0tGYkl9JPx0lHljmdgrO8Me4eTd9XHMlOPtGneSLzqyogh6JTSWs6i4rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735971571; c=relaxed/simple;
	bh=bFoUxd13xqGzTL8i0Uke1VWxv8nz0uckVKpDL5fYKp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ROggaALu+Fn0/UMawsEa0vIbUfkqP6J8fZ46cc+Ofl7UJD6Wbk137CpDlZMDxPNrSdHgefdfcW+qs0XzTr89l4WCwRBB2kagArBGvoHQxV79l56kQLBIEXGv3G4ok+Kl9DBW5KJQPKzty0/on74sJwy6TBn6FxbS11RbqRghOJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tEmPytfG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3778bffdso14553761e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 22:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735971568; x=1736576368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBnHSa/ei6D2pomsNrU1v/8n3usXWfC08yobzI09Jro=;
        b=tEmPytfGwPblgfFsAxMgCekrqnZ2Nfxt0RUikjxEXKJiimePGJaPHMSDTQCR0G7KSL
         PfgYhWMZeyExLv6vmfEYsv/6yDvPr9Vqw7Y7kQxt+azHFqOdmo8VsyaPChh1w9kpAlfH
         LL8SAOTVdDDvZZZNRPbNl6JvnisQr814nsShetzZ0sxPYqUWbfUvk6+0unJGBEY/JNJJ
         DNqPAhGV3sI6FcvkqR41S7wX0QvZV8TfKQC2WkDxiNIA9X7yrkE94TDNFQeHgKSCALMl
         Xr3lK1Up/czTBl+QfjzQwZcDC5b06iIG0x2WbLMb1Gw8c2zPAfHdAEf7Ur/FOiFmO2ej
         mbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735971568; x=1736576368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBnHSa/ei6D2pomsNrU1v/8n3usXWfC08yobzI09Jro=;
        b=WIz9w00UEeVpXrRtrG0l0Gum2KyAoveXJPPkyTx84kUYSL3hc4eT0WDjz8xwQ/jtYX
         ajZV/zIquuPKg5JqCdiGanIPpHiOt5KAI+sFsXMdW5UDjOhSXYB9IslpwQ93MkjUnqwu
         ne4MqlBHBydqlZksU2mHIYQRWEaFg5Z3XosL9R1vbf1+6g/tbjk4XYVwivfmQcQYBdO/
         dmBHqUUwuvIBVHer0/J1N1K3f5plrqUpfn0APgS6iAF+ULREOPDBPPs/u515wkWu0Xni
         3g5p7EGBxuMGR9qIRY3YMSZURhzNtkQJczMdGWRQnQBxQuwjD2iXHreqWtb/nHmpOxsN
         kHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhF/ux0FMOBH2sXqO/1s73qMmKQ5XvKn0EqTu72S57/nSuCqb51mbRkHuZzVgB38uIVRatExOrmdD3daKB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr7ESmyk38K5uoVOogxWd61dt6Ek1s7S780h9hIFDLWZ4cBL1E
	HpxmMe60DMWxl1PZnFtwrADV++HiU3Unmf4PJZ5dhlSshILW+vLJRy4+KHowi/c=
X-Gm-Gg: ASbGncvD0svZU6qEDCJA44hR9ZKQ9KJSC3a44+Pg/p+LQMubTLvyWB7XfiFunKNthSi
	fPnd9P4wyYFSJbiaW6V4cx8sSyeHe//D+ZC3SESx6e8HpkmOXq0nKVuUebEi1VXh/fr6QATfyTH
	rKGqDNnhziuliL33ElzjgSWZieppidI0QaY2J9ygjNsro/qfNb3T5j3Z79MzeisPruJkKkZTEFR
	ryL20R6bsAQz5ORUXT9LQ7Ilscb/X9HHslbfknZdvw3RndB1KAmXGZCb1XcsBtlJ+PTNokHHFm0
	feA5ejN+1SfCz4jSjJ3eu0z4
X-Google-Smtp-Source: AGHT+IHG6D8rXjBCZV1R04Mi/cfBbzZz4AP9LW1gDrG7eocadcNWBOJlbxNnDyUiEI4vQ3lyhjs1NA==
X-Received: by 2002:a05:6512:318e:b0:540:1fb5:3f9f with SMTP id 2adb3069b0e04-54229597f4dmr14710329e87.47.1735971567889;
        Fri, 03 Jan 2025 22:19:27 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c1bsm4261655e87.280.2025.01.03.22.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 22:19:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 04 Jan 2025 08:19:16 +0200
Subject: [PATCH v3 5/5] dt-bindings: nvmem: qcom,qfprom: Add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-sar2130p-nvmem-v3-5-a94e0b7de2fa@linaro.org>
References: <20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org>
In-Reply-To: <20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=866;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bFoUxd13xqGzTL8i0Uke1VWxv8nz0uckVKpDL5fYKp4=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBneNLi6C4BN5w07vW1+FlSRUwGypwxOyvceoOsm
 wD8QJUyaAqJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ3jS4gAKCRAU23LtvoBl
 uG7LD/9Y+ossUhXg316WNkGflavyebf51WMudywcI05PSIjNbdoupaXq4xN/qroZXsnUOxLr/se
 b1PQeBMen7GSiUInRXZ0Qs1fWqEM5CkK6IWJjCpsdx44eWjgcpx98SSxNyFPN0B8u8o5wb53H5c
 NtPUFZUmWmq+okJC1QeLuDmaCdSOQGH9dbuqCpNelnxBl38jrbKCl7eHHGcksRzkK7RfMQjG46L
 tOYjDcnwgtXsw2Z+PA4isr87lpsn75hq+iOzbtyffNZciJxroXUhzkXxf8ZhaAOUkuzjR+6iP3w
 2mziN5r9jEwdlHZtD7bEKiytNrvYhxtijdiO9/m//sRdYfB26pdM/XfdTa9MIwBh45rrvQmZg7R
 lk3lzaCAYzyAWd3OzbGE7+xAodFP7K6bqEe+kHZEtPxrGbNm9BQ4WP2xMOGCrUA+olUmjKiMbBA
 s+rvyX7W0MdDnkGH/ZK5/qbWdrm6N8D46VrFQtMraJ1EymzgxBx1kIHzAR2n7Qw3yAq1KfCvU6B
 D6S/9+ZpBYug9JNrkGWUpA3gLNrUXUzA+peOBuFW1qnGy/n7r3jr+Q+/+SX1wSUhdtqnQoiX7Ey
 hc2AJfnwgSC1a/ZAEY2L22HLuz4umZZXYsavbsekqeqM2hF13/P+YRng88DcUHxVKPr82lYdF46
 ua8cgAAIcdKPNuQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the QFPROM on SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 80845c722ae46611c722effeaaf014a0caf76e4a..9755b31946bf9d4c1055a993145d06c274b61a37 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,msm8998-qfprom
           - qcom,qcm2290-qfprom
           - qcom,qcs404-qfprom
+          - qcom,sar2130p-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom
           - qcom,sc8280xp-qfprom

-- 
2.39.5


