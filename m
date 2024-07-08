Return-Path: <linux-arm-msm+bounces-25482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D3D92A288
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 14:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D377D1C21695
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 12:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FF680C13;
	Mon,  8 Jul 2024 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/oWj3bK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BAB80624
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 12:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720441381; cv=none; b=QbauwtOJ301xdN2J/rmy4sHFyiK54GFCeN1VtxSwTFdRyGIvE21uIw8LGH7xNu7IfYuIWn28qCDAlMxuZwq0dC4EMVUruTxx9ZFP/KZLn8iPK08Mgcc8KTvpDHczFL7vf3PKWAL38CaZDRZ2KoVU2XBE/2N48FOgGIuh4nmzkRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720441381; c=relaxed/simple;
	bh=zdfsoAzyLAbSewXaL8pr+o+HVHsk0A6l8l6d96EVyr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HiaZPfkXe+p1++CBiwNq5vdDFCG0H77778lBSeUj19VbYFABWeIbc+W+vlAdk3VV0/x1wZ1hUlyERLR361HGgPNQwaAtheHpVYBMCpuqvqa2bRCT1mKJh4xelFgiPlPaPvbtwOyJ5+Se3igqOU/LlTrD2pPpWI/fPeVbbp4ZYBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q/oWj3bK; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so56719571fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720441378; x=1721046178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbLszSI/br9z0FG/eAMCh9e/nJJvaShjV+30v8TNl/U=;
        b=Q/oWj3bKCiKPckqHELh720Jig2MQETxY8RwxmOFm10uPs82rH00A/k+YI4TeXU9kuS
         jDWeWu847YZVv6gVXnOwQI2XfGm7u4XerevceId1DQQ9CdwsNVi9astNRA91/tT96+iR
         vs3pDXENd2g60yHKugLOqz3CktjXUfcU+k7jahFg0E8FX1ASxYkywahYyXdps1wKLoK5
         ID8J/DFtZ+DCxHNrKHScKExQjpgpjzALyuf9ZJ4ZX6rX+O4bch4QxWq9mJ9kXjhlFMik
         5QTB2NOEBrl9R5dry6/NEwJb+CSBMsztJEvox+TmkyxKPIfIvcG2mRM3A7qyqwtak9QY
         OS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720441378; x=1721046178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbLszSI/br9z0FG/eAMCh9e/nJJvaShjV+30v8TNl/U=;
        b=ZUENvZDbLbUJ2yBoP4MtGF3cKXtDxGIVGbB83CR53URAuWaO5jv0MyUi/cluTOpWtL
         OW45Bwm3LROS2mu8wZ1KzLbj2HEebfYhNWLGLbPHtZxqq7ir0Eq0YZM0l7f1VzSTrRYD
         u6/mLg2v62W7cYo0cOYArqVvAqaYiloJ0AacAonH1jV173BayW2mNUSeIym+lXEVZTi+
         tMdBoflH0e6eQ6T3SGGaO3Ot3AYUUIB35PRHfJIQITku2NPy8LYy1hK3v5KPTLhA3ndR
         MvVzaT3y618hsmVsIijGXFt8tX9MpimwXfmrrnSge/E8HZ2Fs1vIz0YQhv9bg91YsK74
         GbrA==
X-Forwarded-Encrypted: i=1; AJvYcCX3bG4zYyV2ylHinaMRnnVcwz6ZvyQKu0sy/SLhby+jPO2D5gYcWwK2qWPURAXzmHw9V+9aMxSZmOG2Ah5CaOwtoSndTT+kK8sDYB2/PA==
X-Gm-Message-State: AOJu0Yx/OJ6zjdZgdW8bK2WsiAl9NEX9EpeUpQfN8qM7xq0sGPvQGEbZ
	oqTSNV/Jh7kGw2YorVV1t+ZoYZJKWpVSfMeXxhf7fkVuNk1imO1ZG8zE+lfaUmo=
X-Google-Smtp-Source: AGHT+IFn77trltQqWJUC7HwUwAV9/FoLFv40dOZn7MBfPPSTS8mslfo9giZi2I2GuxPjd5Q2CxipSw==
X-Received: by 2002:a2e:891a:0:b0:2ee:4a67:3d82 with SMTP id 38308e7fff4ca-2ee8eda7b6amr103735721fa.28.1720441377480;
        Mon, 08 Jul 2024 05:22:57 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77e52ccf19sm208983666b.147.2024.07.08.05.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 05:22:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jul 2024 14:22:32 +0200
Subject: [PATCH v15 01/10] MAINTAINERS: Include new Qualcomm CPR drivers in
 the file list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-topic-cpr3h-v15-1-5bc8b8936489@linaro.org>
References: <20240708-topic-cpr3h-v15-0-5bc8b8936489@linaro.org>
In-Reply-To: <20240708-topic-cpr3h-v15-0-5bc8b8936489@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Niklas Cassel <nks@flawful.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720441372; l=1035;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zdfsoAzyLAbSewXaL8pr+o+HVHsk0A6l8l6d96EVyr8=;
 b=LpwqLXpJhzhQfa8V5wMBtIxnsqOXE/ulRmNbkCS+oEfoVwQUK1E//z2KbxitZfkiSCZH8wb+x
 8M2euuAiPRACqG/MjCHRX/sPC9Xiys3gtAm9GuPfIP3GLvj6TvPw8fd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Expand the Qualcomm Core Power Reduction section to include the files
concerning CPR3+ support.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dcb37b635f2c..f3e013a52c16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18687,14 +18687,15 @@ F:	Documentation/accel/qaic/
 F:	drivers/accel/qaic/
 F:	include/uapi/drm/qaic_accel.h
 
-QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
+QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVERS
 M:	Bjorn Andersson <andersson@kernel.org>
 M:	Konrad Dybcio <konrad.dybcio@linaro.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml
-F:	drivers/pmdomain/qcom/cpr.c
+F:	Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
+F:	drivers/pmdomain/qcom/cpr*.c
 
 QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096
 M:	Ilia Lin <ilia.lin@kernel.org>

-- 
2.45.2


