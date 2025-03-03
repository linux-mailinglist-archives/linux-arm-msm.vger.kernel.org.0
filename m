Return-Path: <linux-arm-msm+bounces-50081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D438A4CEDE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 23:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3183D1898622
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 22:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DDD23C8A7;
	Mon,  3 Mar 2025 22:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xne/v9LK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A1923A9AD
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042539; cv=none; b=oOQ+UOeY3oZ3XmHD4CCYc67LYYBwGFz5Dxm/Eg8pg92eXxMtSt0dqXXp8fK1+JQh/FMS/sDVhPk6JFeiME2gKlUO6x80qIMf5vWe4ujl6WyWLrzmC8iWgoekTunvf7GNdboT62fgdkYsCzzotpVaisyn1TuQVNSksa17g41Jy00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042539; c=relaxed/simple;
	bh=2l4XCrqCkQucTXgYQNWv2U2oS7DHD/QEgRLBR2QDT7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8+KclUkVvUfnDWcnNXI/l9N8b/aKCZWN3+6GvxAn5eUb8UrcOZ1WwKDAFtip8SZ5MhuFgQ8FUKkUL+JS54szL9sK2ZFMPKnDp4KmCTspbZkb819Y4tCIsgeEDU2QGSUt+7LzZU/lErG6r1Vy/Bd3DYT1Lxj1lxO+IyLHlkH7fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xne/v9LK; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5494ce73f2aso637531e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 14:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741042536; x=1741647336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIOoOtxpcPHl7i4MSdteBkV3xiIgoMMcqJLCqFrKEb0=;
        b=xne/v9LKOVWBHlawNhNDhNqQOd6V7eTkRyrT28AAgXRKO1WjsaWyrQqgGnEEAnfZgn
         1pacN8ek52MqN4mciiNcLTBu8wkHWsLb2pjG7IIn4CMvaVwtebuW/QqCDUZ011JSOs5/
         3xtv7LGEWo+jwz3Q7deka90+R3vfB1+bLCcpWkX9/SyucxjfZSRoObkm8Siq5PK1Cwfz
         plsU9lvzeHtTgQMxKj12EnkNC8UwjIDB0oQ3lZ3EaqWL5PTWk2biiik/+DC/lL7uCNuw
         cTl9HIEYAMVVgs+veaj5N0QSsVFN/1O0yu/JXzzttRlJFg2WQkjQOUyWrhQvD0alsGrl
         2jIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042536; x=1741647336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIOoOtxpcPHl7i4MSdteBkV3xiIgoMMcqJLCqFrKEb0=;
        b=EU1Qqy44IpSXutuEgKqfVlJSPmUwe9r0P6x5nxAU0TtA2BrsFSpdoQb0A+6xwY+f4O
         kQnKIhZsboguwt+nsuwTKPRwsS2vsUqRYdG8MW6Cse4Lof7Zq2uzimuNax1fioV5ymjN
         UoWlsJdQ/qM4WVQyqcnGpVfIiImcyoYd+raf8+ODemOhfHFU+41tGihnjDm0RteRjBHG
         n/M+9OOX7/YVPjEiod3OYQpLfmtCUptSe76CimU54jH/2dnN+P8bXzkzpSBPb+OZpWI0
         QH/t8FiyIFCZnj967rxBQ6wn5ViliR0OtJLWmsyjBrDwi7LnsZwMoglU3AWOsi/hRK1B
         64/g==
X-Forwarded-Encrypted: i=1; AJvYcCWWtvFl4Ydzj41RB+bonyG9NQFNQ+3bU5wSKp2GXiEHbe0j4os9A562E/acj8aaIdyFnAG4Kwe33LZuMJgm@vger.kernel.org
X-Gm-Message-State: AOJu0YwZyTOIb59VxC8TDD5jhakDT4q/x/IxUTDgItx0VKQJhxJsrP6S
	andDSo5W/aGEg377enadHuLBRWVOS5C7YZND1sd9XhNq8pujv2n5X9sXGwmDr14=
X-Gm-Gg: ASbGncsVHc+ZQsLOocIPadcoDCXz/KINpbD9bYoWedfAbkZxxP9C0GgOWtf34zzb7s4
	Hm/oXHIiVPV9TIjEESCXH4pEIqrPz6s5dk43d8iV+E95ER47sv1cPgu8AjSwCuRzw/QE1GVyXb9
	zZTakD1bNPQcsOt7BK/f77YsYXcBaJhuPyl+T+yp65QDWRCcu9dCUik4vEbUuNCQTxtgXDqI5bD
	CWHnd1IPkATy2tXZpleFwS9Jq5r5LfeR6VEusL4+cqLp2TRVDUNXi4ZbzNH4P8ummYB84MKAkPC
	bEaJ5CPFAbelqYs9Ky3BfzR1cxcvJyiddIAKGLkbG5Z0djkhizl2sDu0vQf3+P+7Ucky+f+nNzs
	GbiDPa2KtSpHJuO3oNWS21foQjGipat3XkQ==
X-Google-Smtp-Source: AGHT+IGGU9cZXDSw27YYxHElxCiZpERaWAgIGFnaC31uzKIbcLL9ZsjIMNZ/+x0WMmOpWlMlmbI4fA==
X-Received: by 2002:a05:6512:1245:b0:545:6f1:948d with SMTP id 2adb3069b0e04-549763cf7fcmr45673e87.7.1741042535641;
        Mon, 03 Mar 2025 14:55:35 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495f630cb5sm662059e87.212.2025.03.03.14.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:55:35 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
Date: Tue,  4 Mar 2025 00:55:20 +0200
Message-ID: <20250303225521.1780611-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the tests it was unveiled and later it was confirmed that SM8550
Camera Clock Controller shall enable both MXC and MMCX power domains.

Since power-domains property is not specific to MMCX anymore, its
description is removed.

Fixes: 9cbc64745fc6 ("dt-bindings: clock: qcom: Add SM8550 camera clock controller")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 9e79f8fec437..d7fc9e5a2d20 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -37,9 +37,7 @@ properties:
       - description: Sleep clock source
 
   power-domains:
-    maxItems: 1
-    description:
-      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 2
 
   required-opps:
     maxItems: 1
-- 
2.43.0


