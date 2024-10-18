Return-Path: <linux-arm-msm+bounces-34833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4009A330A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 04:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7AC91F2399A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 02:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512341547C3;
	Fri, 18 Oct 2024 02:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Akjjmvre"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3E4AEE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 02:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220098; cv=none; b=tT/fa/I9Z474RHKM635S8Q7lJccelechnOxp1Mp4JRTTAOkYXSEt4tVY+HMJSX7AEOcvEBsHVnlBS5wPouFA+O5/T6PlxsnlgI/ehxNkqlAkzO0o8UWVdfHwJe+l1Sup5z8Vd9D/paEZsikpa03FvKFawydbRKneuSfyXAwrSh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220098; c=relaxed/simple;
	bh=n8QGjegVRsMuoxCZEGmylSDsnFJMTMH0NrzMsCUnIP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VIZclgpf5H0GCd85srvDPpXrFHBfgTY6Mm7hGYHm1t5k74OjUk9s9+YW/zidIVZKjgt8aPI5q37+Sm6U18D90IHsZS1EjRZWRFUp/VggKzRK+YeMU1NOzeuqszCXZVRo31FwwBhRR62RpBGsn2K8r2QqUmrOg3NLvTtaBF1PbsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Akjjmvre; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d51055097so1080952f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729220095; x=1729824895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1LotCQ1z2NEQ+5bFgi6Zyo58U+aBsfVFC+loNQpeww=;
        b=AkjjmvrecQsT56YU1yLV8GKgWDxe505X6mqTnJ+oG718KI7/zeDGxnlLdVTNQbX/DA
         Ev1MatfPgG12MK6nWptbB11ASHF2RVejEg4uf3vTF9nI7gy6/BpBNY2g4yG+q2slZWBa
         /8IuJMQGtSzrWD0ijqTT6GjpQE0p9/jWV7GG63XobRCGt2e4G3oaPWd70GfiKTBdujQy
         oOWxgVbaSEod+obkODUqd15dN8Es8uG9uCtay46+PLwxXF8fa5SsmffWRK/YAq3i2s/Z
         cjh8rDdaHdlFihUzscQP+z4g4P/W4P2f7PiWAnic7PLFmhvlT6FrH+lEXBuF2WTScpNb
         hedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729220095; x=1729824895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1LotCQ1z2NEQ+5bFgi6Zyo58U+aBsfVFC+loNQpeww=;
        b=RSfc47l7KcygVllIfPP+7Tb7u4kWAJDvtt1eOk3xazEeysiW6wfY9BqtXdAmFc+7gC
         p7nxetBAYVofDDqwnbgXbe17XnvYs/BQ8V042zfbQoetZFK1JCVnvPUVGjRqJJsmCD72
         Ssk4wkz50YH8Az3VRJX1ffYx4th9hIZ4FInpNHONVWfigGUKZDdCbrMZ7ZB0EddZ7H9v
         VueFMzAiqjHX6cZE+mgJV7RtyBcTk2ziFUnMolHpqis9IqlghBXt7o36lLhvVB1/qVOP
         /88cwPt4/GrkvbZNTTLD3XcYiG+aY12MOxRzI34tlUepfdFxsWA4yxKBHeZ40fWTBCqh
         MoyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRTtk2USpHRlJIbH7OoTlnqKSoycIeg8MC0n/glnnslAR1HmIVT5c2aoMCE1kPysOKG+2HiS7FmsPHzpyZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxPy2yOIUz+l35yl1KM6fPO4uqqDqXg2aprfZVHvs9lb/j3k85s
	LxDYhyhGZX+IJuER1mRvPbWxTREJ6pZG2ELODgvL2kXBBWkm577O7QOBWUlTJqk=
X-Google-Smtp-Source: AGHT+IE08/qDHlnXCkBlFCtCmUwhii5YW2Lnw4NJgvIvWxqfM+3ed/YHb9Vb6kd1W+z23dzqqegv2g==
X-Received: by 2002:a05:6000:cc7:b0:37d:498a:a233 with SMTP id ffacd0b85a97d-37eab4ed47bmr463560f8f.43.1729220094695;
        Thu, 17 Oct 2024 19:54:54 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed599sm596135f8f.69.2024.10.17.19.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:54:53 -0700 (PDT)
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
Subject: [PATCH v3 0/5] rb4210-rb2: add HDMI audio playback support
Date: Fri, 18 Oct 2024 03:54:46 +0100
Message-ID: <20241018025452.1362293-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebased on top of -next, re-tested.

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
-- stopped Cc-ing out-of-date emails;

URL to previous series:
https://lore.kernel.org/linux-sound/20241002022015.867031-1-alexey.klimov@linaro.org/

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

 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 55 +++++++++++++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi     | 39 +++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 87 ++++++++++++++++++++++++
 sound/soc/qcom/sm8250.c                  |  8 +++
 4 files changed, 189 insertions(+)

-- 
2.45.2


