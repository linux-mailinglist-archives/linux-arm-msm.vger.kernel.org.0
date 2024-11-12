Return-Path: <linux-arm-msm+bounces-37535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E569C4CD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 03:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 366AC1F21A60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 02:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2D6204F79;
	Tue, 12 Nov 2024 02:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lqu8lYgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2749519CC0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 02:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379993; cv=none; b=jMNAyAcwEN5Sda1SYt8M7iJKqLSDNmS5ZmMxTtRtc57VnQ2031L6BrzHyBPvTbHnSDHNRTuKszZeAyfvGAYcQliU4veKwKlVVkMBJMM3x9ldGKU7caKXbsPaPgvPlaRdTmVEttTVNkIH2euS247ki9pifO+zLWR4jH+8WkpY4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379993; c=relaxed/simple;
	bh=zRjmLB73FoKBtKABZdlS/4UbbMfV+Vfzmmt8HeVipXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uTE+7Lb6MV9lGekSTm5DqN5q3DPlze8ULrCRRZgI9E+zClprxifsz2ljL+rptJX3ENW0UhfCBT4nvowR1FHE2z7dLymTGGGQz50DZOsFFtJ2KeJhrswS68POs5A4/YHUHasVPO8KkbAOsyBPyXtYIJIiI+sykGp/OdvV/lyXhn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lqu8lYgo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431688d5127so40604325e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 18:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731379989; x=1731984789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18HziUDPDuk5Q3iAQWZEK5eNd/SL/SlFF3wmf8V8Iy0=;
        b=Lqu8lYgon0Nq8So+W0/5o1+x1R+gSkfX0n7AIybPobVjScKZ1Mcg4SYVBmAeN4lgK6
         wVbPiydPR2O96dmmnZpUrToHwITFwm10NRWWtTpeEeTWSaTdT+iKcXtySuX7LmLW2SZ4
         WxHod6+D+7eROJAIyWidGwHjOm7Ld58SeVsKK1blkHhBV2isAeRbk6GddOg4sWpK/E37
         zD/HNA1m7IdHKCfU4MiWPrh/4V/NnUMfd2AJvYphzJm1Er7ECCIfYCR08z1e5RhqM+jv
         0oBOzQ4RFWOSG66DRBxxl5x/FI+e2F5bgomkHcq4i+vnhlUVzpysurINI1GDoIp9LrEB
         ftlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379989; x=1731984789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18HziUDPDuk5Q3iAQWZEK5eNd/SL/SlFF3wmf8V8Iy0=;
        b=JuSTRAjCBuCpYTIrD+8iAn74T262zsdpOvFVth75RfO03khfZzzvHzpKq9Ph0U2Dhe
         WKtlYC62G9k5N9f5goZumTCzMen+3ERVKGuRuKRSFg3RqdsY2uo48hxGraWTFFOmlJC2
         st0ofgjR80XP/HR7lJV0fpWFjTlepOhGJHNMEmpQ0eUgvCyZcCzuEG5uRvQivA+860WQ
         BSsmdzLZ+POJF9+wrutfA7WCL6LFcNsf9ngkYBTEkaEgwTNxAVyl5V3bdMOSedp/TSBD
         CEmHFBTi9rf7LpaP+hY1137iA+aUjWBe40U14MuhD60hNbwW9J7YDNn37qFZv25zmcum
         U8dw==
X-Forwarded-Encrypted: i=1; AJvYcCUUPc8ADWHOuIQQKKdCEzxHwbHP8tVQfaBxyLDpKKI7GPrsWk0IoYpiCvtGyru3tavAe835es/gqAiKS5Fo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Zrac12b0iLM68ERDpX/kgDhGcWhi6YNiUi4b/joia6xhSmAb
	f0fOzrbJKMqf/SzK9Yk0EBrVJ5GUCbjPsf2ho3esExZPdTp/jhvJD0gc+QTZuEE=
X-Google-Smtp-Source: AGHT+IGXBhvjg18rNz8X8SGfiBMEM8XCIEey0FZ/8rDRwsOHEf6SS9kM97100SW+eFpnCAGUW2ZRsQ==
X-Received: by 2002:a05:6000:784:b0:382:5af:e993 with SMTP id ffacd0b85a97d-38205afeb31mr2179145f8f.54.1731379989367;
        Mon, 11 Nov 2024 18:53:09 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed999e0csm14056380f8f.59.2024.11.11.18.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:53:08 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] qrb4210-rb2: add HDMI audio playback support
Date: Tue, 12 Nov 2024 02:53:02 +0000
Message-ID: <20241112025306.712122-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebased on top of today's -next and re-tested.

Changes in v5:
-- drop MI2S clock in sm8250 patch (seems to be merged);
-- fix gpio-ranges in lpass_tlmm (Dmitry);
-- added reviewed-by tags from Konrad and Dmitry.

URL to previous series:
https://lore.kernel.org/linux-sound/20241101005925.186696-1-alexey.klimov@linaro.org/

Changes in v4 (or since v3):
-- cleaned doubled spaces in the last patch as suggested by Konrad;
-- added Reviewed-by tag to patch 4.

Changes since v2:
-- added tags, updated commit messages, added Cc;
-- updated LT9611 -> LT9611UXC comment in qrb4210-rb2.dts;
-- updated addresses in DT to 8 hex digits as requested by Dmitry;
-- added lpass pinctrl to sm6115.dtsi as suggested by Dmitry;
-- added lpass pinctrl override and pins description to sm4250.dtsi,
pins are the property of sm4250;
-- verified with make dtbs_check as suggested by Krzysztof and Rob's bot.
-- dropped two patches (they seem to be merged):
[PATCH v2 1/7] ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
[PATCH v2 2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
-- stopped Cc-ing out-of-date emails.

Changes since v1:
-- removed handling of MI2S clock in sm2450_snd_shutdown(): setting clock rate
   and disabling it causes audio delay on playback start;
-- removed empty sound { } node from sm6115.dtsi as suggested by Krzysztof;
-- moved lpi_i2s2_active pins description to qrb423310 board-specific file
   as suggested by Dmitry Baryshkov;
-- moved q6asmdai DAIs to apr soc node as suggested by Konrad Dybcio;
-- lpass_tlmm is not disabled;
-- lpass_tlmm node moved to sm4250.dtsi;
-- kept MultiMedia DAIs as is, without them the sound card driver doesn't initialise;
-- added some reviewed-by tags.

Alexey Klimov (4):
  arm64: dts: qcom: sm6115: add apr and its services
  arm64: dts: qcom: sm6115: add LPASS LPI pin controller
  arm64: dts: qcom: sm4250: add LPASS LPI pin controller
  arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support

 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 59 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi     | 39 +++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 87 ++++++++++++++++++++++++
 3 files changed, 185 insertions(+)

-- 
2.45.2


