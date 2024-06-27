Return-Path: <linux-arm-msm+bounces-24454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE79391A675
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 528B01F26880
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE76B15747E;
	Thu, 27 Jun 2024 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wbSekzxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B615687D
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 12:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719490824; cv=none; b=gcL/k6nQvjc6fLHgHhiQKBzJpwH9f3J+jp0mz3jVL2F20Jt3x4sQwtUTWspePyGnRbdarjd8IS5oPvzgi89y4H+qHCQI5RFCY1BSlNcXqEs/ypf1tZH3VMSVjjTR9w73WMr//Yd8iUPLuqVgnqBurBJ1oazv6LcIe98Rrdslhe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719490824; c=relaxed/simple;
	bh=sUkdPuQbPyTADqcRllGyHnJ7Vi420C9DZGnZln1HFGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUe3zGDD6X8zAV7oVtcPEoL04RQ+yQuZ+1G/Xg2PKD+2MXI9eqI9LhX91qergnf+wYGIBqA7VrFKnAXKHoH9Ei2YAkuHcEWjS5T6c33EUfWCkSUYwJqTtJ0VVNaPBoyMhVBGJInIznu/wnBfRfO9qd+NTqyMFqxPvoJYAHQyrUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wbSekzxP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so11057845e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 05:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719490821; x=1720095621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzuRu3TYFUavJ3fIbGrdOxztoebeEOJ4/hLXJ9FwGMw=;
        b=wbSekzxPnztQ5CuzVX6FiYkyBle2uwLKMtJ6Ffrkrc/kn/iWgzWBtILHoKrH//4Dgg
         /M/fouotxviBfHeTbILWuF4cI54NvBonhh4QV57wiutpdJiTMthiFU3BOYMcxEYf92zM
         ukal4uN33zsweb1v1AcUEj42+1En0+DL88TjPy93+w3WS8rWwl3X38nlHJOkqoa4uTL3
         2AC4QTFpE2HiocB+3sYkalH0MZfXVrq5LfwYCqeqx0gaa/V3hbda+Io2GrKAvkYeT0xL
         U/jNKcEd4jwpwWjWZp4BKU6IRledkCbKN8uIx8ncgKeunISpnSG6fCpuLNl7Tg/42SCH
         oMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719490821; x=1720095621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzuRu3TYFUavJ3fIbGrdOxztoebeEOJ4/hLXJ9FwGMw=;
        b=DSWlSO1qUO+x//wRJ4+LJuJsjDLret9/8bP3s+QUVCEKaWn5uSFTZktb/EC9+IFts+
         Fqw8oG5zJKbr4M+qmJz69r/HFHbIdyapeGE8EOXsOudhFs9xUKfQVls1D5pZN+nj8Ow5
         WPHgitqT2o57p3ZsNpLZWecg6v/3gCpcVbj23sYkfxossGPtP7Wr9RGMicMkYozEN7nF
         jsrkTxbWPuoHdAp1yWd1j6SB0Ulb3nk5JUgsCVh2SclKgnfJo3WDpXWPiYTQvz90Q95a
         KIeKQ/hWMEeA7icz/6myHWQf+QdHITDLYYpVNlCC+iCKP1UFQNdtuaic7pAwTlsOD4er
         aCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvq9Ar3LGhWsDYgqVtKir4zbfhFfyrdW7NvXCsUpR2CvUljJmazuQrFLwpjgAAEXUtIMYr6KvI5wfFWriyhpXw5gu41TE3SFlKWJLkaQ==
X-Gm-Message-State: AOJu0Yxa93BSnTw2ffPURVz6kz38gGg5LFe9hq3/aLh15ApBVQVzNmYI
	IptTfGLaivnwOG4DUFC67xtcNHy5MY8xlQ4WSAPasDT9pCO0r7eeGZBU6GtjMfA=
X-Google-Smtp-Source: AGHT+IHXhFgxyEkcJCCrWQdO9Ydbw+jJMliEDlzXzFMU/AuCxMArjpiJIM4PdWhK15j/MHAd79vk5Q==
X-Received: by 2002:a05:600c:19cd:b0:424:ade3:c6b7 with SMTP id 5b1f17b1804b1-42564502cc7mr15766815e9.2.1719490821344;
        Thu, 27 Jun 2024 05:20:21 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8424b43sm62692885e9.32.2024.06.27.05.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:20:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8550-qrd: add port mapping to speakers
Date: Thu, 27 Jun 2024 14:20:15 +0200
Message-ID: <20240627122015.30945-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627122015.30945-1-krzysztof.kozlowski@linaro.org>
References: <20240627122015.30945-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add appropriate mappings of Soundwire ports of WSA8845 speaker.  This
solves second (south) speaker sound distortions when playing audio.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Bindings:
https://lore.kernel.org/all/20240626-port-map-v1-3-bd8987d2b332@linaro.org/

Can be applied independently, if bindings are fine.
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index d27820fb5fc0..de40cb623c8c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -935,6 +935,7 @@ north_spkr: speaker@0,0 {
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l3g_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845, Speaker South */
@@ -948,6 +949,7 @@ south_spkr: speaker@0,1 {
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l3g_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 
-- 
2.43.0


