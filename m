Return-Path: <linux-arm-msm+bounces-36644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE89B8802
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 01:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6ADAB219EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 00:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFC53A8F7;
	Fri,  1 Nov 2024 00:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uIN1077A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C1A27470
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 00:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422775; cv=none; b=t9RIUgl90hxZCpeXDOFXHs6zvhkYFWzYnEuCbnPjFKPPGXBR65P81fhbWBZE6o0KBM/libQBxa4ca6GyKKaraYE9hwGiB0oVPeYZBmGsKqkDkHQg0PBbyscgBqJpx17J9Z1sXQy1+UVZ8x224LS188GjSQgJiPrric4CvG0DfPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422775; c=relaxed/simple;
	bh=FU379s8mvRva31rty9JujdS04YmHXrpAzztd4t/2fpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TibRNF7TWtj4i/6KozDZzkxBo2zMoI2ysuPdyqAPHWB7JVN/Fs7F0b0ES3RfcqLI2Nd5EGrl+ZnZZ7AjvxlzdYRuWpptplk3kWm4qJkc82gfVlpkNYeajcwMuXddXObeWBolDPinxQAKXqmvdknTDIdfQVWeys1e79pLgC75R2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uIN1077A; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so1069409f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422767; x=1731027567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PieXQqSCHfmGnEpV2Kk4rV11C01mRedDjCrdFDNwM/M=;
        b=uIN1077A/X2v+to07XBgxxdLeE7ruJlTTbDFPDVIXAH4VvL5PuVIHAxkNqlEOzlRX7
         v88OPsOM15PElyrDlthMm/xGw3KlRd96QnqWjmo7hu/TLvrC7hvU0Fy3bPOWieloAdhe
         Dftcdh7lkK8eK0e8GmKrsPvj3vz2T0eD28U3RIXXNTZVuux5hfhh3aGSw1XNtCpVhdR2
         A+BpdrRfKBpaoAEDxDhGPpioXyYwhmxmTPgGXFGO3IrEnOUnB26Sctdj25MIlKXm0S5B
         C2YjowzuZH2r6KPmGjiFsHSLDwmy7hls4/L0sjF5/iQPZxIvyXSdkHQJtQBFQ8ptL6tn
         B9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422767; x=1731027567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PieXQqSCHfmGnEpV2Kk4rV11C01mRedDjCrdFDNwM/M=;
        b=UX+CjlXXDjsXfg7VrPmpdmjZgH5th4t5/I5QVU1dp1CBRtUDx/Ztqr1h2i2MK7EWLG
         Mjb+Ppjnum1tG1Is6aaoPsrgEB/tLrfDnSbvz+NaN8jtP1WZWqjb6c9Cq+naxdFPH7mK
         awz60xtoRkxvPPrEsXQqZddq6I279TaZmGZR46b5Jz7bMbGtfHczjy1SA+JezOFR6bfr
         t67evA+k4cPdGi5jRrHhcyzx6oCmdUGHRLwBOdKVmy9HijHMaSIvihoBf+37h0WRcdpB
         6bzhHLk4l3KsAVysvnggvdUez/Oi7g6E22CNeoN681dF2reLSLuydh1VZJOuqkhdhj58
         h0ig==
X-Forwarded-Encrypted: i=1; AJvYcCWoylU6j1ZFDkGvB8LCgBzkQzT9EInfYlrJsjz8h73ixS+wOlU1VE3rtTdfpg2IKaVO0hDMZ/g3DrgffSJG@vger.kernel.org
X-Gm-Message-State: AOJu0YyTDRX8eYsy/VXcs19/cHita9mz2biYH8OHl2uLuXJARsCLIl6O
	1F+0vc1RTAauCxNBrDmGB7UyBBZl2yiJuPGYHEeBUJY4GtKde/Yr8YjpO4p02cs=
X-Google-Smtp-Source: AGHT+IHqxItP2cM4Ot5dUREUP0W2CMB4uLuKVDROnIDTI+B7l0A6vFKtvV+10MvfFiHBZobiQ48BUg==
X-Received: by 2002:a5d:584a:0:b0:371:8eb3:603a with SMTP id ffacd0b85a97d-381be7d6144mr4596700f8f.27.1730422766456;
        Thu, 31 Oct 2024 17:59:26 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947a9fsm74208035e9.22.2024.10.31.17.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:59:26 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: [PATCH v4 0/5] qrb4210-rb2: add HDMI audio playback support
Date: Fri,  1 Nov 2024 00:59:20 +0000
Message-ID: <20241101005925.186696-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebased on top of -next, re-tested.

Changes in v4 (or since v3):
 -- cleaned doubled spaces in the last patch as suggested by Konrad;
 -- added Reviewed-by tag to patch 4.

URL to previous series:
https://lore.kernel.org/linux-sound/20241018025452.1362293-1-alexey.klimov@linaro.org/

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

Alexey Klimov (5):
  ASoC: qcom: sm8250: add handling of secondary MI2S clock
  arm64: dts: qcom: sm6115: add apr and its services
  arm64: dts: qcom: sm6115: add LPASS LPI pin controller
  arm64: dts: qcom: sm4250: add LPASS LPI pin controller
  arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support

 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 59 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi     | 39 +++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 87 ++++++++++++++++++++++++
 sound/soc/qcom/sm8250.c                  |  8 +++
 4 files changed, 193 insertions(+)

-- 
2.45.2


