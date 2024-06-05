Return-Path: <linux-arm-msm+bounces-21779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0828FD23E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 18:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD4351F26411
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 16:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5890114E2CA;
	Wed,  5 Jun 2024 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Re92zsZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8282A1DF
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717603238; cv=none; b=EH9Y7yE5l1o/+YRWaiz/B/eEj8hBH9MPVYHI3v79Jyt0W9HrkGTFtvoPNQ6zfAAYwfZxMYeLp53qahW9yNGMJo9zS0/mmAxIuAFhOz0kj93FtcTsI0mRh/bp7XZU4BNowvmGfsPKfEm9pnhRA8JPnIFe+4aUQlffDUrgk7to0Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717603238; c=relaxed/simple;
	bh=OkPU434HzNDB9Zy2Ni7fqW6kRWxa+k2mi0HjkFDCNDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cLiE7w24YtKbo6UXGWTev5TxUWShmqvwS8VVWPKQt2G1/Ytktd0uhSZZkqPhtHc4EVi5giYswFSno8H8EMKzBmB78xc4ozzBLQe3drGC+KN5/p6XD/FCx2ahmTkOB1orJ3kKSE0A6EwiJ7YKlgOe7zhXgMGnC6WsbMHKkmcd7T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Re92zsZA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35dc36b107fso5797903f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717603235; x=1718208035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50R7nvxQHynUojAseHkwFUtQ6Y11lIc3pU4/cZlSRlU=;
        b=Re92zsZA+ZacZRkqP48MLQUV4m/+BluWE9wvQCU9ReVP6FdqVgKyF6bs5TEoHt2rLO
         WxbgSXHI7UrviGdn5dtN186hAgI42ZlX2EVr9CQOr2O/kuHyfvR0YmBthRBfD2qynbZ2
         TadQDmwQY/XUCwX7fNtodIWh+tChcEB4hkyYGE7WJScDYKyLxdYHwtAjlFDjA5KbU1jE
         ctHfGxj6hvjUdwRqCJKzDtgvT1opouu1PDm1mQDNNNcYbcei7RduU59/rfWs77h0J0Bk
         F2f2TwedxYxL40qmT8Iw5ZsI0sBYjAkZFlVilYeGcQ3+vAylWcj5vx7ThgtIK07YC8Eq
         zIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717603235; x=1718208035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50R7nvxQHynUojAseHkwFUtQ6Y11lIc3pU4/cZlSRlU=;
        b=k7l6g9xSKsfNgnpR3/yoQZhdwG28PhgUirsBDW3BGK02+vCBK7ctr/ERm3et+/zwYS
         OpGx4ghdLhXwfK4XFMOa3bwDQq3cY2pgQw7bp4SlQ8iZeDEDhnWFtd9vfmqGVHfmezlP
         qItOfyxiNm/0s1GCttg+EzxUu6cha1iWFSlrhjREsJFBt25X/+ci+WZwoqMkXhC3xVSm
         S4e0ozB+xj2mIlY5+qSXINbrgd+rGdtnwLJlA3zVkBVDG4LBiYqFal2jQvDbtMaE6jm/
         nQzkjbxCO4U6maygIDz3nF9mV1ZXJXp03bFu+mbN0Wn5rn3Z145ODCAGhix2+XqMd3Se
         wkHw==
X-Forwarded-Encrypted: i=1; AJvYcCU4H8XqPmLAflZ3nO/q5o0CZXHRcHwknth5zCLNStbRgerxNinb1Fi8FZcxNQ6xtp+NKBwl5ceNMukx//qsxWrXmF81/StoD5O4JJwN8A==
X-Gm-Message-State: AOJu0Yw3Ts3ktN6mBIz88BsoZuN2yQGVieDh0FJ+EOglbzPRnCaV1AIH
	nRQGxzHKvN8TUMZErhc1nuN0ENYjv15/+6cV3zkpCRISNP2pTaEU/WlGygyhPhzVwNV2WQtrzed
	6cIQ=
X-Google-Smtp-Source: AGHT+IHRPeQqL0o1tDhRPns//LIK3Qj9qE56wtDCYLQoQAn7bt3M2TI9iVXx5am/KB0iHE9ARvPEdg==
X-Received: by 2002:adf:e9ce:0:b0:35d:cf2b:9106 with SMTP id ffacd0b85a97d-35e84070ea5mr2075681f8f.26.1717603234938;
        Wed, 05 Jun 2024 09:00:34 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158149008sm26288975e9.29.2024.06.05.09.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 09:00:34 -0700 (PDT)
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
Subject: [PATCH RFT 1/4] arm64: dts: qcom: sm6350-pdx213: correct touchscreen interrupt flags
Date: Wed,  5 Jun 2024 18:00:29 +0200
Message-ID: <20240605160032.150587-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Interrupt flags 0x2008 looks like some downstream copy-paste, because
generic GPIOLIB code, used by Qualcomm pin controller drivers, ignores
flags outside of IRQ_TYPE_SENSE_MASK.  Probably the intention was to
pass just 0x8, so IRQ_TYPE_LEVEL_LOW.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 88ee04973a2f..bf23033a294e 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -293,7 +293,7 @@ touchscreen@48 {
 		compatible = "samsung,s6sy761";
 		reg = <0x48>;
 		interrupt-parent = <&tlmm>;
-		interrupts = <22 0x2008>;
+		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
 		vdd-supply = <&pm6350_l11>;
 		avdd-supply = <&touch_en_vreg>;
 
-- 
2.43.0


