Return-Path: <linux-arm-msm+bounces-25487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C0692A29C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 14:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14790B251B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 12:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F06139D15;
	Mon,  8 Jul 2024 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExEiBYs5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B773136E30
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 12:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720441393; cv=none; b=f49HrHTrrVr67ztoL3JDdMcLR1GxDeM9iGkVhqn4VSt0HKAjD07drbO7nDlYRFkyyFv4+TrA7dVeMpKVVwiN6+6M5M6BLGP9f/RbpVm12ykB8NRQ4zaAB/Pqi77cLA0C/k7yfAvfWC2yvLwAb/ITnaruymzgELKtOH2Qoh4G2gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720441393; c=relaxed/simple;
	bh=lFhFm8XkOz5Bskd3D5+xaH3dSN5OhtVheagJNvAQMPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJbIBB0viJ8oaWngVxZtjx0D2t/i96n5Ran+Sv/bnshU9xjC54VcxIq4IXzToag5OvYc2T26KfwHxpYk3FbU4/opGWhklBTRB2Rgatnz1ZdX+5+zSOQk2h50zpaWKsBwHTjp7TBBaeRrKCDYa2uez7TQhg5F1u9kZ3FsiGhadps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExEiBYs5; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so414816566b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 05:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720441390; x=1721046190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1uTwXH469EZcpo+8MN3uCbZzqBdHjB+YY0ngrC8PfI=;
        b=ExEiBYs5gOA+1F78aNQih8+kOiJjznrm29dTDmYneXcDG/QGJbhexi2eEumI+vn447
         o6cWOBn9O2vXgTLrgp5NGCaeimlPnK21hatWSZaB/5RpbgGNwq3vyBstLTTJGqgbD/1G
         Zti9YIeM1E/IXNETxKu88ha+zU63mt0Pq/V+yj+UjW+BCqc7FRte9qDLlsnsOh24fmKm
         lg7lt5aPad/siS44zja0JaUdjp0FBBdEcLgsx7Q4uonW67/Liie4qWbl9SX5pye1Fe6c
         ZiYzCZXDLTueC0pZA1U1curYXti1AgdubAPm7O4G56eqo5oR25dUIvYWLzafguC++83N
         5PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720441390; x=1721046190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1uTwXH469EZcpo+8MN3uCbZzqBdHjB+YY0ngrC8PfI=;
        b=HY1vEn1akmzA+YSDMYpL7QbMdu4QA4638COJBkQrxFEs1A0kg8zG8zf68saf4Ed2PT
         vuhrcsHTd5pvBNosobdQNbB1IlOcMs2+xjhWgZ5pMupIR/IS/W8C66QyId0ei3vwa+8P
         qs+SuN+I8MZ1OfDQ+u0BWAzvRQfxDmBggsnXrBwoafLNgfMfAwmq0zohAH2kRIIP9MDa
         wca13ZteVg6RXLA57aIZPsPRC2Dn4AM4BFpENSSsApfa5gryIV9N89Km7w9Y5Sjkr9lh
         IWtxttMvgqVC2sXGc7YUnd20CCkiUhYDEgxwmlZcLFYUjSO2DTg3smXLDP8wO/QAoqO2
         pzIg==
X-Forwarded-Encrypted: i=1; AJvYcCXW0xH7LBIVPFtZAQZ9BrHhZNSNmlIVybyZDM6o/JTUOwuK/QoWWuSVcWp4VqpMGwqqREHSfk6+8MfjAgeOh76+ZRedpddpDrvX8kmEQQ==
X-Gm-Message-State: AOJu0YxoTSy3Ba+snuxywDNQFe7m6bgRWP5oQyfUhJAKDCT17BrUsQJb
	yCFuGvOGfL0/hRksBrph0q+4VbTRLm9RkeSrmcKPqW36JgDE6Jo5oLyLjakyTts=
X-Google-Smtp-Source: AGHT+IEzrIE8nTDCnmlFyNmQLCQDmburyEgzq+VfZPoE2qFHfdKrbEcZLGwxoqFHstrY2KSjFmvBDg==
X-Received: by 2002:a17:907:7212:b0:a77:cf9d:f498 with SMTP id a640c23a62f3a-a77cf9df683mr672501166b.40.1720441390300;
        Mon, 08 Jul 2024 05:23:10 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77e52ccf19sm208983666b.147.2024.07.08.05.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 05:23:10 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jul 2024 14:22:37 +0200
Subject: [PATCH v15 06/10] soc: qcom: cpr-common: Add support for flat fuse
 adjustment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-topic-cpr3h-v15-6-5bc8b8936489@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720441372; l=2082;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FEkMInUlFGjcpdQZXJiXJbXnI1fSzwAHTqwD5lohyQc=;
 b=NK+iXcizWrvtLUoUHu/vS0S0kTwc1u4mGLBKv+flCXlPGC3SJ5V91qAvPd1I7NOa5WZEltNRB
 zQe4a73aENsAHL/qm2+6U71S9C0Oqb7IKxclklhO20xqMzrg8/TpLad
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

CPR3 makes use of post-calculation flat value adjustments. Add the
necessary bits to the common functions to support it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
[Konrad: separate this patch out of a bigger one]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/pmdomain/qcom/cpr-common.c | 9 ++++++---
 drivers/pmdomain/qcom/cpr-common.h | 1 +
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/qcom/cpr-common.c b/drivers/pmdomain/qcom/cpr-common.c
index ea85f6b4bef8..44c681bbbf13 100644
--- a/drivers/pmdomain/qcom/cpr-common.c
+++ b/drivers/pmdomain/qcom/cpr-common.c
@@ -49,7 +49,7 @@ int cpr_populate_ring_osc_idx(struct device *dev,
 EXPORT_SYMBOL_GPL(cpr_populate_ring_osc_idx);
 
 static int cpr_read_fuse_uV(int init_v_width, int step_size_uV, int ref_uV,
-			    int step_volt, const char *init_v_efuse,
+			    int adj, int step_volt, const char *init_v_efuse,
 			    struct device *dev)
 {
 	int steps, uV;
@@ -67,6 +67,9 @@ static int cpr_read_fuse_uV(int init_v_width, int step_size_uV, int ref_uV,
 
 	uV = ref_uV + steps * step_size_uV;
 
+	/* Apply open-loop fixed adjustments to fused values */
+	uV += adj;
+
 	return DIV_ROUND_UP(uV, step_volt) * step_volt;
 }
 
@@ -119,8 +122,8 @@ int cpr_populate_fuse_common(struct device *dev,
 
 	/* Populate uV */
 	uV = cpr_read_fuse_uV(init_v_width, init_v_step,
-			      fdata->ref_uV, step_volt,
-			      cpr_fuse->init_voltage, dev);
+			      fdata->ref_uV, fdata->volt_oloop_adjust,
+			      step_volt, cpr_fuse->init_voltage, dev);
 	if (uV < 0)
 		return uV;
 
diff --git a/drivers/pmdomain/qcom/cpr-common.h b/drivers/pmdomain/qcom/cpr-common.h
index 1f2ebf9394cf..0aa227617d2f 100644
--- a/drivers/pmdomain/qcom/cpr-common.h
+++ b/drivers/pmdomain/qcom/cpr-common.h
@@ -22,6 +22,7 @@ struct fuse_corner_data {
 	int ref_uV;
 	int max_uV;
 	int min_uV;
+	int volt_oloop_adjust;
 	int max_volt_scale;
 	int max_quot_scale;
 	/* fuse quot */

-- 
2.45.2


