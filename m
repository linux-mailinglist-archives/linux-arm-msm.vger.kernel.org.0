Return-Path: <linux-arm-msm+bounces-10387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C74584FE5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B66A9B21748
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9063BB5E;
	Fri,  9 Feb 2024 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vkfta0ap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBEC3CF4D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513007; cv=none; b=oHJPIt2fKoUxzYIYVXGlWJXuLzZ5a8zLl4vOWP9GXxRdgpG6n6x0Fe38kYMn1zhbGVSxnD/9OlPTfhI75Oq25RnV19Duux67HTVqqNOpu8puNnHgCjMlPzM4GQmUX1UiUK/0Pqi0348osCtCH4zlcj8msmpw657tBn+wUGi2LmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513007; c=relaxed/simple;
	bh=Nc8bwLF77VvKlbJugx5YChhzVAEJFQcCZ1haIFmgnXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBiV9cDZ3On6+3gXImHjrD8EwPULNJ9JhvaX5ZgOLRP9IwoAHhAA0qwYJCfp/MXr4eKy4b0KlNop0FFxXSU9y955pDBMtHxUc61LhQadTl+4bYcd0fUW7qlkEajJnVLqggbHrt/kmDmdjgkstz/zuvkucMXvDYFgxqXuay7bJSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vkfta0ap; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a3c1a6c10bbso21197466b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707513003; x=1708117803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBIdOxdSkaLnpY2Xy7kKGuuvDn1LsIy3fb0GF15YoEg=;
        b=Vkfta0apVABq+LMrD5q3GGh8pkFOIBg6oShfJe0sspOgu6LDgYSb9FEQB/jAsZWqXH
         t8wZFMU/wUHtgjlLq8NkSmayeHZu1t11oSZT7kobhVEpnxOJmtfxX5IZBjcmI8Niv1MY
         YTesAQSLCQCddsR3IWya1H0wTH3earHz4VN5tN4m6apPka9KPPABHwV05zVkeLlOEt03
         b0aXRGjxJDT1YQ1VIiBpc7z4Uf35+ytYnJsukbZlyrC96l1FTrOC9yggVNxC25y+imny
         /S3QK35VJJiUGErHNmX7eBoIq6Z4tegcAbYY+pV3yhN3uu/W2XV98iHq5O2Lg8XTW364
         Y1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707513003; x=1708117803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBIdOxdSkaLnpY2Xy7kKGuuvDn1LsIy3fb0GF15YoEg=;
        b=cpVeurQdjua4+M1wcPRy0ubq6XCjPYPSIIDM35mOURfgcInBq8dgL6G7Tl+6fCMwCv
         hF9Nl3PRGWr1FvGk5NHN/7NnbUMBEkAapBGRSfuTPtWmynZJG77/drnFF0yC+kv0dCbU
         tJPkXWiDm1y5GWud6nijaYIMRU5OLDBV5vJQYgVBo1IyV3YjxHKvPWYtFA+mHvsZRzBN
         I0EQ2gS/7ztku8kKXJVriEh0Kv2COCZQkx0Ypt//MZjKH/lE1gmTcXRDQlbMxEUIDuDC
         iARn5coT/hdJH4M1xJ/0jFDiF85nAgwk7jWizbHG01w9333XdAwpIN1LaoL6qYT9MXyn
         P2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzYROoptyyBmybnHoJPxuN8E9Sypq80+mJjp5/jbs1+ZW+yZo5XvotmfqPQhUvLrwS47ke45DjYyLI6oZWPuP2qzsU4tDDjAO8IDuuoQ==
X-Gm-Message-State: AOJu0YxTtxLGCd45Li+HP62844Cb144CIJSxjZcVqpGavlu120U+ngVG
	YIItFSNUt2cA1P3Gwbx+PEP0mPROx/N+e5PNj69hwlHafphnee6NlkH6ZRnBn1w=
X-Google-Smtp-Source: AGHT+IH/TIy7X8EFV828kV6GDBQNmCkaZOa/+/wNDX4c6AkkZd1gyri5Htt6OghhH7g3b1kTKySOZA==
X-Received: by 2002:a17:906:2988:b0:a2e:ad24:da8 with SMTP id x8-20020a170906298800b00a2ead240da8mr196858eje.19.1707513003245;
        Fri, 09 Feb 2024 13:10:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGxDG2/AuEOpnUYKbMxOy8gJOwVXXY8PKb/8q91Orcv8ZA37JyCZ8VHWHwyt9OuW3GPX18oh+D8dN/3w/r14hxtqtcvPBzAcQpBKVNx2w0j6qv+cpF5VWoj1arHgaSrkf3FpGhIyAhSLwOw9jHhTE/VAgYxtJlEGMxDMvyxbZ03Xnmw1N3KFGxe9346YBRop2lj25mooETIF2gGH3d5IPp2XwbbXETECgn9ZR1Slvq6LykEAU08qWGUlKgZjahAjYPriHuTeqg7sa2FzV+C8kNyApDaT1IjqG2EmxkTCGVkr+Ru4yEbpaOxgpmFFip79jHiHEBhJ+Tt31REZVvjgN9L6RSlQt+kKUuF0EnBygeEJWkAYMTf+g8fQ3dTaeTtwU+Zu4PdLg9FeKi7L7i6fmX1lzDw4W+iDukgBa8hkRMS2RaXOxXgb+LLWT4lJmEd8+vy2m8SfzUINuuoR6UdMfX51RG7mIGxKrxdD3z3isNdNuYiyjgsZkjLlz/BfqrrIxzaw==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:10:02 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:53 +0100
Subject: [PATCH v2 09/20] media: venus: core: Get rid of vcodec_num
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-9-3dac84b88c4b@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512985; l=3437;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Nc8bwLF77VvKlbJugx5YChhzVAEJFQcCZ1haIFmgnXs=;
 b=Nd+zrzm1xfFXbo15AgzTjIPqJpUpwEHOn9xZqBbwsZ/j8927xZCb+EQYt9O6uFq1THjP3Wuz3
 Fh8rUawPtmPBXcezt5bFmEfM9N4XVETwds6JQbnCBIoHJz5ZPNGnz6L
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

That field was only introduced to differentiate between the legacy and
non-legacy SDM845 binding. Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       | 5 -----
 drivers/media/platform/qcom/venus/core.h       | 1 -
 drivers/media/platform/qcom/venus/pm_helpers.c | 2 +-
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 83ac68f1566f..1307aa9cf951 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -651,7 +651,6 @@ static const struct venus_resources sdm660_res = {
 	.vcodec0_clks = { "vcodec0_core" },
 	.vcodec1_clks = { "vcodec0_core" },
 	.vcodec_clks_num = 1,
-	.vcodec_num = 1,
 	.max_load = 1036800,
 	.hfi_version = HFI_VERSION_3XX,
 	.vmem_id = VIDC_RESOURCE_NONE,
@@ -725,7 +724,6 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
 	.vcodec_pmdomains_num = 3,
 	.opp_pmdomain = pd_names_cx,
-	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
@@ -774,7 +772,6 @@ static const struct venus_resources sc7180_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = pd_names_cx,
-	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
 	.vmem_id = VIDC_RESOURCE_NONE,
@@ -831,7 +828,6 @@ static const struct venus_resources sm8250_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = pd_names_mx,
-	.vcodec_num = 1,
 	.max_load = 7833600,
 	.hfi_version = HFI_VERSION_6XX,
 	.vpu_version = VPU_VERSION_IRIS2,
@@ -890,7 +886,6 @@ static const struct venus_resources sc7280_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = pd_names_cx,
-	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_6XX,
 	.vpu_version = VPU_VERSION_IRIS2_1,
 	.num_vpp_pipes = 1,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 6b1887f7d9cb..22f998637618 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -74,7 +74,6 @@ struct venus_resources {
 	const char * const *vcodec_pmdomains;
 	const unsigned int vcodec_pmdomains_num;
 	const char * const * const opp_pmdomain;
-	const unsigned int vcodec_num;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	const unsigned int resets_num;
 	const enum hfi_version hfi_version;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 6017a9236bff..8412deb68ed1 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -622,7 +622,7 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool lo
 			VIDC_CORE_ID_1 : VIDC_CORE_ID_2;
 	*min_load = min(core1_load, core2_load);
 
-	if (cores_max < VIDC_CORE_ID_2 || core->res->vcodec_num < 2) {
+	if (cores_max < VIDC_CORE_ID_2 || legacy_binding) {
 		*min_coreid = VIDC_CORE_ID_1;
 		*min_load = core1_load;
 	}

-- 
2.43.0


