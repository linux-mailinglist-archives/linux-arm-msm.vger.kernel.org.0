Return-Path: <linux-arm-msm+bounces-19663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FF78C243B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC48328BD34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B93174EC5;
	Fri, 10 May 2024 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="chaiPx2t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AECA172BDA
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342392; cv=none; b=P4J2UZ76cdShEvs0efvG+x/LSXdNT+I8P7VwKkMiPSS9B4H93cRPnn3oy2Qxnrw/yQ4RYLto6Lff3vIOVvH/ucPebj20LFHPreH1/WJjhNEuXA6DOj5WaNqlrdn0hkXHamKrb+42Jd94ZvWN8ruM8LkX6iKHF2d6cZLr6CI5sq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342392; c=relaxed/simple;
	bh=KAn+kavu3FsHnvY0/+DTDzbjChWpqLzdK6RSLCjGkL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D2Ns9Qpbqa5M9lNXW46FKtb8M1rZjxSnyNdtmkWQ1XRM3KgHoJizLkV+DeQ0Czabr/7aQTI7+XkB/cjubHDArYBcnqRIQV4f1Ey7uuLMiZuQLdNklom/Pzn/DMU7LxprUG611Zww8Ib2VJrD4jNmuPAESk4u3ovNMSumbSiBc3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=chaiPx2t; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a59b178b75bso397797166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342389; x=1715947189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upnYxftIQgqA8SAtWvBXJGkDwPY3ijyI82SPZyS/G88=;
        b=chaiPx2tqUs2zKn9q0w5aorbYdl6fVW2gIHZLFj3eu0gzxS8YOpmIYkIn1jft1VWUN
         9ra31Ei923w57Xm5arrqhuwxtbtechvcWMzyhGS/uWThCwOaSlAty+3VVcmk9fdUsHfQ
         Q+vIPYU95XPoBh3zERO0FIgFoXb30URgQNph9qPXT7LepO2iCzeqztssgAPANI35X6Xa
         4Yi14B1qc6kIsZV/AaYnKGycO8vXCyvR7a9kDN3dljmNsbbUYNU1klsD7bzSZZZ7BCOS
         zQsJ6KyB6m7YmjhVFD19I4mSq4Im4CQL9M6NfJxlb6vgn8Jv/frRsdSi/UGdnLpoYnfH
         MT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342389; x=1715947189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upnYxftIQgqA8SAtWvBXJGkDwPY3ijyI82SPZyS/G88=;
        b=UfYRCKt3guc8Gid2uu1FSUKAcEwMgiAjdj1L19hvL5sULuHuDAxN+BhaX3EGmCeAUP
         Niyk4YkmbHnTPfHTczw2+QJnRsZQFccR9tUep3dhmOQ+g0yDJ6wK7TgYGv4uTI6jAiC5
         yrDspgCUlNokQ/Waa1LAG74WMLOXpk+/PIuOfANAev5zEzadQMN3E4AAaJU/R1kshle8
         Y0pfZyJZ1cQXupBexgTVxktQKridCB1syiFQ3B5n4fF/8naRsVMOMT+WKghQ6qZMzLPN
         u45it804AtBm86bUkhqlqnASGhubITeKpAZ44s82F1mLUT6yzmxB/QMn9PpTryVmNBqa
         k8ZA==
X-Gm-Message-State: AOJu0YzAk4nSq/dwbGuUoHq8FO4Rnhv5lZ2jAm+sS2QgK7C0Osq9oUAK
	s0oWmbBV2TLP7HwwlMYDxBKtqny6Hg27lEfmGBbrTfK6aHydGZ1M/V44gjhI/RQ=
X-Google-Smtp-Source: AGHT+IHY0fWuvCys1QcyAuv+r+TdQfXqlllAZlDO3NVBDN4SQT1xHqodNhNJPz4n3IX1MJ3N5YVL/Q==
X-Received: by 2002:a17:906:6716:b0:a59:9e02:68fc with SMTP id a640c23a62f3a-a5a2d5f193dmr153936666b.44.1715342389104;
        Fri, 10 May 2024 04:59:49 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:34 +0200
Subject: [PATCH v2 11/31] arm64: dts: qcom: pms405: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-11-436ca4218da2@linaro.org>
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
In-Reply-To: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

All of the thermal zone suppliers are interrupt-driven, remove the
bogus and unnecessary polling that only wastes CPU time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index 461ad97032f7..3f9100c7eff4 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -12,7 +12,6 @@ / {
 	thermal-zones {
 		pms405-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&pms405_temp>;
 

-- 
2.40.1


