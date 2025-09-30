Return-Path: <linux-arm-msm+bounces-75600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AABBAD31D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 16:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 732927ACBB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 14:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C843043D9;
	Tue, 30 Sep 2025 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ofl5p9HW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7C9303A0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242761; cv=none; b=d+AMlJW9dicdaOPRVP/DC0Pk/raWNNrfbkCFhWPKm6l8XMvpGUB0IR8m7Q1/Hse/v7X5w2AnJeNEmIG9jNId//DglZwvmtGIPL2Uhf84wxYnOEwukaftTHbJFiWt9IUVJ1UaiK4Pye4yO+14Kt+b7a5ceu8y1Vh912hRUftig7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242761; c=relaxed/simple;
	bh=6XDKwZQKKm/HcS7Zce2mlrECQKgBdlxp14xSsBBMKeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hb7WQht6G7UAWvEF6yRMzExq9uvcwme+0xdsKyhS0Ec+IFN9llKtAui4wf99mY3A6yvO/ponNY9iTglrMp3zgMfB/T2gZh91ZZtl7Oviy8yROB7GWpQlf/Rtt6A1XKawqVxsREHvWcUmvsQpUw3ZHTQ4HW+VXfQbAZkpoNiue30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ofl5p9HW; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so395491066b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242756; x=1759847556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpqDsPljIbI1ydAAYbBHpL4t7hGd6BLoLJu9kFhmW2I=;
        b=ofl5p9HWVxP6mVHwljTBWJBRTcn6XoAS+z4rAO+OceyTP+aRnPEoqGdjtqo5Qn2S+q
         IYBtkgFY1xwtQpg8nWEAZoXVYCzkjEzFHNR39U+LjqTHdFQv5ww1VAldJpMnlnCtczdF
         CZEvDL/qcQVblV7ySz4fVUv/RodROa1Hw3fyl29ZoowKPm2Zhgny0ODymrs/WWlvmY9G
         +37nc5r++8OIjqmlO1TsGvvIs33hoAbqySVG0XdzsShkPjTIc/no3iFGdZYBXvEb5s5K
         eL7oQEsPAvUNqw070L+YefsfsKr4Byx1l+XI77TR3Ew3WVcVSuKP/wiDaupnu5Y09/n8
         w/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242756; x=1759847556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpqDsPljIbI1ydAAYbBHpL4t7hGd6BLoLJu9kFhmW2I=;
        b=oRHPC5FjAUIYH5jplMqd244XpOlLr5gmMjDijswUn/J3DTL/DLPrxgV26iRXMRglf/
         h3YsYmNGM+9yk9qElDt7Y3WYkIRGcEnwj5d4Fk+kgZuC2yuQsRpStV0IBMe7MUa/ga9g
         vpfnH7JThJDH0DwYoV3DqpFSt3Q8wudRGY8GA3qdFla0tV509BUd5By/8VWDdSEAzIyv
         6TCm14JsVcmm8bZ7xYmAkOLe03b9n7WYQ1Z44uM78nnl71IILPaBgLH34fbqJm4e5PAF
         T+hPVC7a1W1tJShRlIaNHQSBEYoIieqmCEOEULNKInqphCqSPjmituGe0gwtXUIFW/VA
         H6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXSde8vYL7oY5EbGrkagbMLPyE8OkgIkk03eAivXjkJhlpL3pddplCQO67It7J/HUNf0g0qaJVoVwPtOBfr@vger.kernel.org
X-Gm-Message-State: AOJu0YxQrtDgtygK4CzwK4dBfOfwlKh2Ix/qaQ36cW17Cr7g4b8naExh
	YCk12RisF3fbE1IHrRKQF1D63dh9CJhx8N8RZMFIr8QVa8/gz9AftIuJcCMr4DUE51E=
X-Gm-Gg: ASbGncuTQfwoO6wA8a7LUBgzxUk+ek/V2o91hDDFrkMjajLDyTsLP+OGDvtuWOdTRkp
	dmMM4fz5U0UW9BoNDYbzocFM6+h4JmKA3+1uMXZgNiyZ+us7iZcLgx5l1xSOifuD3VdO7fORQ7e
	WBIpBHMeVeq1x+BviGZItWV4S5MogY/+6Vjmkbs2TACR+fVQrp0yTQnZ2s6z+E+6IegeGbhzcRt
	p69L/z1Yz06hgJdyjbjx2F2YdU6O7gQUVj//pu1NCxlcDI9oz1XBpID6AyOIG8KMqNthBV5vxLi
	EV5DMQBYNY+yOCPZPhF4f8CPjoG+cnxvTxEtVCdrghbz5kUBjvsO73aa4XqdVi5FZQKMxaGbrFV
	V7w/eE0CvpeI+MDif/3+j2g6dx0iW/i+xCxgLTWU5X/XnzkjY28xwb3kPIzmDVqadRqjjWZso2R
	bga+BqyE+HTdMd0rTlhQ==
X-Google-Smtp-Source: AGHT+IFyvbxwgP3khFMfvK8Z3FvV7VS3kFyp8CZVMqy6iYYE4fRT64Yn3WmDZTXMdlLdYOJtArGTow==
X-Received: by 2002:a17:906:c349:b0:b41:822c:ce76 with SMTP id a640c23a62f3a-b41822d0d02mr385052766b.14.1759242756474;
        Tue, 30 Sep 2025 07:32:36 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 16:32:21 +0200
Subject: [PATCH 3/6] arm64: dts: qcom: qcm6490-shift-otter: Add missing
 reserved-memory
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-otter-further-bringup-v1-3-7fe66f653900@fairphone.com>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
In-Reply-To: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=1048;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4H+1X8ibBwQxx6F2/tlczJd/Zh53oYpIpneYTVnsrY4=;
 b=MkEj4fc1gplW3XRkFyG+YTnbELDyh++lWP1rydH0MJ5KRTho9D8HyWL4lHZBs9ii40y7yz1h/
 I0/PtM4t3HBAl9nJXXzVR7cZtfEEkrukBKYGAJP4Of2svukfI89BmB2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

It seems we also need to reserve a region of 81 MiB called "removed_mem"
otherwise we can easily hit memory errors with higher RAM usage.

Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 2efcfb631c3683456794b0a0cc5686f00efd329c..ce794ca724db6deb39f7fae47912c3fefe974573 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -118,6 +118,11 @@ cdsp_mem: cdsp@88f00000 {
 			no-map;
 		};
 
+		removed_mem: removed@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x5100000>;
+			no-map;
+		};
+
 		rmtfs_mem: rmtfs@f8500000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0xf8500000 0x0 0x600000>;

-- 
2.51.0


