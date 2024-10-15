Return-Path: <linux-arm-msm+bounces-34381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC099DAEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 02:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B3201C21438
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 00:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6DA4D8DA;
	Tue, 15 Oct 2024 00:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="dWGElcM0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12E24B5C1
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 00:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728953607; cv=none; b=aG/zsKjPi+fHcyAbbKkiNkSVFHDTEdHvjk85gGQ021A1AZgb3ujNU1xvHjsqKk5brV090h81e5768gzUhMQPWETevs7Sq8LiY6o82l9xvST+0rRkh14fXHljt9AI6PY19cBpvLHs9+NKHEUtZwzunO1rMuBAR/4PhdEO8jEtg1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728953607; c=relaxed/simple;
	bh=dvNjYFdkB9YBWF1uKqg2XE7SQj8DOkKacGpixglHlcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kb4R6KuAQkF4prWxuJcBUVDbfcujExclP35SDmxaSczCeLyb6l8p3qjoUG2UJYEchLQcL7VriHlZy0CuoXB5vERMdHA+I737hBxoBSj0PShMkrTS2L2q8sYwiOooQn5C0p9vzsJSjH25KO+u+r+AkED7QklyrC/DXVhfuX//Vho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=dWGElcM0; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6cbe53a68b5so31606116d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 17:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728953604; x=1729558404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uda+QHOh70dpYmmcKG6PZmo8FX69gZoytF2iY+WgOps=;
        b=dWGElcM0hTAPHWsUseKmLqyWJSaJS3/A9VnvaLekSMmhCpLwZ/fEfIABHws2+mhBu5
         JOvml0jg4Se0MGB/L8JTFiQHBCVjzXNJOq68M3XFudx/eQ3DSqJ7jXC/x61wbYf5caAc
         dO+HLaQKQH6d+vqym6KMVBHEngAmvt9ZDc0R4xaojbvcxQJZfel0WVF4O8pZfkCWcT9Z
         5ZOkkS8oLr0cKlsZZZrjDlT0q/6G2mdQ2vyXACgLrnmNs4TEchBj1+K2DS4ovWBs1dUb
         ty2Rd/ktQ/P0CBLLbccSHCOZcwYPjJZmRsKr6Dl7GEGSvHddnAShe4jqeUh4kR/1ARqP
         Ceew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728953604; x=1729558404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uda+QHOh70dpYmmcKG6PZmo8FX69gZoytF2iY+WgOps=;
        b=JQqtNQTjMeQ7+HMKiIG+jHoce2r+kne8aHwdzWPAr+TZXrjMv5TeARSc81jdyJ8uyV
         TLLZfiYw00mjLWLHsl8yFRWr4K0nqVsgvCxg/TfyiupfRK65A4IJHWtkRQQJYUwNJpE1
         CAaI8BHXS/HzaTpqZXr/6NpQSlt0i+WMe5mHciuNQdS1kQPhD4FVRbxlW6G1aZyu+fyt
         VqF6FwSVRtcgfIQIQFGCG2v0NGzm0/2e/6t400hegnCHEcovRSyKJ8g8WkVBsFngXxrm
         3gNRkOKkuBKA6C0NGot5WDb+KhzCGc77SXwUADGapnF1JeXiB0V7XqHrhJgs9JCnsRvR
         mceA==
X-Gm-Message-State: AOJu0YybpvfkKf3ZrNzWjPg1zG/f2e8PGstQJXs6hrPyDnGNqrJKTmuk
	7nK8g4KtUhmhtzGkssw8WadvtPCJ8f3ZHTP+ikqjKN+6rj3V+CodEZ3/jy9vpYr9oa96kSnVQPP
	/o/4=
X-Google-Smtp-Source: AGHT+IGujS0YltsUyvVwBJrnueAylsfkK9nEY0qY3I5hzXRc4d5fo+ZlRzW83dHau6iTWTFjwpcg7A==
X-Received: by 2002:a05:6214:46a0:b0:6cb:e452:2cee with SMTP id 6a1803df08f44-6cbf0074708mr283404276d6.23.1728953604437;
        Mon, 14 Oct 2024 17:53:24 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc22910f0bsm1213956d6.16.2024.10.14.17.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 17:53:24 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/5] dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
Date: Mon, 14 Oct 2024 20:47:27 -0400
Message-ID: <20241015004945.3676-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241015004945.3676-1-jonathan@marek.ca>
References: <20241015004945.3676-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
Thus writing to RTC alarm registers and receiving alarm interrupts is not
possible.

Add a qcom,no-alarm flag to support RTC on this platform.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index d274bb7a534b5..23a5316efadba 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -40,6 +40,11 @@ properties:
     description:
       Indicates that the setting of RTC time is allowed by the host CPU.
 
+  qcom,no-alarm:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that RTC alarm is not owned by HLOS (Linux).
+
   nvmem-cells:
     items:
       - description:
-- 
2.45.1


