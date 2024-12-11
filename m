Return-Path: <linux-arm-msm+bounces-41480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8629ECCCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04E4B1887FCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774EE23369D;
	Wed, 11 Dec 2024 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+7ucMi2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862BD23FD1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733922279; cv=none; b=KpfBkV8O9ssKxs+QnQD9Sb/74B3qrF5xi0EAPwPOdzJK35+ciU10u02O9LOwjkfsW+UZZnNAtpyPBlw60nSLtcYV6Ci/nNdICVznlyXef6Aci6i8DFwyLIqE2MeNqJsG2TOt7uNEvS2zfK5jwmi/QC6+RANxYDfE833P18d4q3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733922279; c=relaxed/simple;
	bh=FUHQ0aZF7afF+UvlaYS5mgy99uzsyCnBxlW5sEXNdd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGjlCef2xWkLVvdFwEcZlfBG4I4L5JrOmPCfhd020YZfsInSdgf9A8D6x83k+LhXoJrOhTA9Eu9siq/M3tn40Bf0WO/T4Tw7CPLOG2TOpV9R0VxJGYYAe402kBcOrVhoIMgxk0vl3C9gPDh0ehTiHelJs1obfaJYp4Gqp/7wt7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+7ucMi2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385ed7f6605so3017176f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 05:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733922276; x=1734527076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsG+XSxCIlW+e472nR+/+67CLpCB+b/64oI2tAUQLco=;
        b=e+7ucMi2qkqSVHfJ6XgDRWRV7sa+rmljXATaUID7Ek5LfZ8cxFtxnWj9qJv0BRfcuM
         RK7OQyFTxCFrMyHZO3aE8gnLRA9/MOYyjq+XQlfMnULw4ttNmKaG7cQtsW+qeY5eM/Ph
         LtWFoLyHonpVutLtKlEOts6lN9a6PsPX909XhpF4Q1DFR6fR0WMIo5yrcUwwzKBptzvZ
         eg88rfSVvekAvIrC9TiU1fPnq04uUBgiM1GgnDxCJb23EMvF5YMn1n87vOFOUJyvS8/9
         Q3Dtx0VPcTM67zYxRp54oVc7QLkBInTA9U03ql4PQXOVk7rlBRMH4p0tmEwTVYAiJNhY
         qAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733922276; x=1734527076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsG+XSxCIlW+e472nR+/+67CLpCB+b/64oI2tAUQLco=;
        b=jN1cA5X+hLDiZVI8AGhE3CVnzsGXFqZPwb/V40qCbflBnK7DP/RjNCvbgNOf+6AVls
         SlOMdV2ISEB7I8cwVyvBLAFLpkzaGeWrg+Gp3y+bFx6VSJki2WXyI2R4iXZtr+ob5Gyd
         q3bzYRmG7H06Y4BsNOL6Kb4tVmBEr5yxElSnDaOVsINBCVhaTIPJnS+9maCc4HX80F1U
         x+tE1eLSxYwGAe6CFQ6Y/6SToOwrgCU4QrxBbZXXzbwfzmGkddlUgyNo1hsZbHv6jAKu
         vLYuAquR01n0dIHYzVn724uA43Q6dHx9efKZi449AYte/ZaGkV+8tHDX6mw73ZjK7Y9z
         dEfA==
X-Forwarded-Encrypted: i=1; AJvYcCV32WgaL+zrMKOvLrwRgPEyl6AY+AXZ8+7+mjLsRDBgxG5CJZfqFUrwRFsDt6roWCsh6u9wyXsVqd4S/aO2@vger.kernel.org
X-Gm-Message-State: AOJu0YzP8v8LqjZj52Xg8davIvnLq1w8FrR99bGSiSyeDnCdJkPhgEBg
	oUvFjSUQcfSBmrETAkEiO3mZQjgiT7apHJqIsqzqdur5Tlb0jihAqRq3qSsZQ6Q=
X-Gm-Gg: ASbGncszHHsv17M+BP4LHdqtXRXP87kw3CGkITdtz8rym/8t1vWRXCU3sM8+QL8KtXQ
	WRbvaEl2vjbpDbSP6b9WWwN0Aqyr4A7TOikeTZJ/X+ZgxecdvXVHxkhcsvEoawkS2Q3SKGiDESW
	aSf3zPhPk+ArM6Cwi2L3hp7gQctCicWHaSXWUfjGyE+bcaxf0NfpUbQJoFjXxk2lFAVUl7OrhuR
	9ChXExW8n0phkwVRSLLCfmeoxo1oeJ1PERMoo+Ak3iHg+socRbHpg==
X-Google-Smtp-Source: AGHT+IH/N/7Qi5lOGS62q/FJc3jfg5/VFlEPdBezCXlKwuHs/rjy1qhhpa1z176oYyrAmrONn5isWw==
X-Received: by 2002:a05:6000:1888:b0:386:366d:5d03 with SMTP id ffacd0b85a97d-3864ce54e76mr2477280f8f.16.1733922274853;
        Wed, 11 Dec 2024 05:04:34 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248e633sm1288081f8f.4.2024.12.11.05.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:04:34 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 11 Dec 2024 15:04:14 +0200
Subject: [PATCH v2 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-3-d5906ed38b28@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2833; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=FUHQ0aZF7afF+UvlaYS5mgy99uzsyCnBxlW5sEXNdd0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnWY3YkQdfhiXDi2nEaZKtbiUO42rg8nSNvrOGf
 vp9Mu3EPd+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ1mN2AAKCRAbX0TJAJUV
 Vg87D/43/OKkPUILxMJlyOSUMimtMbjoDzsdQc5crRYcDXSJu5NcQncQ8PAkOa7LH0sqyI1kJCp
 3oBzSWaXT6m1lP2ZypArLC0oQUS9PbNz4UXqfMo+VvjiRQTTupMp+I38N3HJnrGGuafEW7EErmg
 PgP+3yfy89jne16xB09+sgMhx42IRpiT7yuNmJOXdQrZA5tfN0J+lyO8QKzaAZig+Ikfrwo7Him
 Ge69uNOlioLXwF8oaHH3AqWvOo4AZpJ695TYlonf0DLPo+6dlMcpm53wUToOqR5o4rIy2slxLnX
 kSwo94HXl7gTIb6nKElFhwvHrO8RnrrVZ2SUHRdbGlaPNb3nPX4emI8RhfIQMIhi0eBmDfTCdfZ
 Q13MXJPh+laLylGeqX9nRY+DQp0qZq2y4W0PNX6YbdiYMFeR5qBqXwWRJC1QNf1vY4r5vjN/63f
 B6yxKvjIcYeVQRQMuJMYAZjQc1ZQKJ5RqVHjzIvd0OhTJOFjMX1D1q95PMyqkTiVpbqxL2lgvnX
 UPO5o0ptgMPA3ZrI82TxcdqRFm0x/zBUQysMxvnZinLDHIZujfKJzrvIthTIWmznXHWzsXNeFF+
 0JYwupVl8Jbk4uwlyXpakXEHr2MhI5Nfzd5+Q2rl9g7Qleh1hzWfDSmyl+W5expId72lTLbCkMI
 cvs3aaFaMFtSd5A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index ea9b4730a176f16af56810248d1b66b9d97c5fd0..6982e6e9bcc8ab5f689ba1b02df334aa352a430c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -118,9 +118,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
 	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
 			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
 
-	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
-		return false;
-
 	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
 				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
 
@@ -145,6 +142,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
 static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	int lttpr_count;
+	int ret;
 
 	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
 		return 0;
@@ -171,22 +169,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 		return lttpr_count;
 	}
 
-	/*
-	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
-	 * non-transparent mode and the disable->enable non-transparent mode
-	 * sequence.
-	 */
-	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
-
-	/*
-	 * In case of unsupported number of LTTPRs or failing to switch to
-	 * non-transparent mode fall-back to transparent link training mode,
-	 * still taking into account any LTTPR common lane- rate/count limits.
-	 */
-	if (lttpr_count < 0)
-		goto out_reset_lttpr_count;
-
-	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
+	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count));
+	if (ret) {
 		lt_dbg(intel_dp, DP_PHY_DPRX,
 		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
 
@@ -195,6 +179,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 		goto out_reset_lttpr_count;
 	}
 
+	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
+
 	return lttpr_count;
 
 out_reset_lttpr_count:

-- 
2.34.1


