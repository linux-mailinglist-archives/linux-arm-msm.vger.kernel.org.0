Return-Path: <linux-arm-msm+bounces-86686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB38CDF7D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 11:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 120143002D6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 10:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE24275844;
	Sat, 27 Dec 2025 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVXl27R/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C60E24113D
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766831325; cv=none; b=E9X5PF1htZ4cnwcfJ4S5pgDhl6EFDVb2d5E1rbRzA039EJ0tTnhCcxuEX5TNu/mYcF1RQHD3NwDzsLykVClMfTwihsG7NXuzEDEtJCn9hIvpLbZ7rZ8GvvVWfhKJ54husGFuTdMBYnI8ts6+AedqgcsF7/Qp+GlVilzop/BHKXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766831325; c=relaxed/simple;
	bh=7ifwGnwU2gSMG4rlAGg9IHam02eL0qNZQeZmcuAb10A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ogInWMXiR3fG+5a/LCxLxGroKePqY3wxCcpGhBUO/2xLkSBEpnXwA9qMaQjmK9hJTfhtHJ14vj9HTYOk9SP2efhc0/qKGXW7plX9orVuDZ3UvapRx4FTjj0qSiO1KS1YRMAK0uRifciPY7J4OM7EveoRNFrvapiwwe7j3tS+WTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVXl27R/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59584301f0cso8344288e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 02:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766831321; x=1767436121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dyV3/IfGZSZhz5jBAppPai6Eu+WvUPDRdhge/3Q6vjo=;
        b=NVXl27R/inmgaXapaDqKU5H1P0FV30pOP9pBvSNUU4FiKLuPeTUwsve9kdk/B987Sa
         TQdi8NgexOawYNtyV9SNVHAYT0aiVga27AcBJZZxwndinmhslZtk8EOp6CrSuoItsjq1
         8cm/LiC4O6gXQcsyalj94r1Zz7vKUQb44ov3rCWUHEdvdxpPf4Xuf/IurOiiPwNdrM/3
         zANeLdukFXwnYLBEFSkqpvIiA3eEKd33ZfOlzEDtmo2d/5VK9CaK1AVkWo6YI5J73BK2
         on1cnhrzVaGsPZAObOfia8PLgD0AI1UlOcebPqGpXLV/LkFH4GGKzJ+xYPKVARWfl7pz
         9fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766831321; x=1767436121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyV3/IfGZSZhz5jBAppPai6Eu+WvUPDRdhge/3Q6vjo=;
        b=ptJt1R96lD8BSIQnqF2TyHb7lympfIpDzh03juS1gpCglOXqYEeJh5Et/4elzJ3CWO
         Mp0cO4cKrcHznK8bdgveVqV6gUmWLZR8OI2By35nsmP9PpyQJsbJrYgp2saWgeK7bHQw
         V/MOAnbtKVpUXkxtuqvjdKQzA+zR4v2GhMsHLyqIF1UfQbtlm8xzJR8apJjqrRUif1q3
         K90KDyM5uWCtJsaByo8Dm99FIZNfZaRsLSScSumDm8vH3y0RhZ3MNzD7nJ6WIjqHLAb1
         aHbeXLGM2B15ATRMsrEiSSY8cLtvA5ZHloUkM9SAkgwSZQxkC0BbT/CaWztdEq3QVPHw
         cK3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5wsplbphf0zhOR2/lizW6A9nM1rN0UzW4ual6tWuLc+dIVCkL3gyS+kFbJrZcXolPLMIiqY9WLU23CaJq@vger.kernel.org
X-Gm-Message-State: AOJu0YwyqRGrLti8OS0MtHEYee0ydb8uBJU4KlRxaEQ4Jp0i+HIg0cB9
	qbW68RBmzWTOtX7appLseV9w9O6X4z08Ov9r16TucknpOPJcI0xEbKfJ
X-Gm-Gg: AY/fxX4OaXwCB8UquYEhEC7YAVj3VTGkKX5+8l2x6ucIl2eq9JLE3lkkh5I3z9faPu7
	ouXfQldTNems1WPs/zLPhHP00K8jNllvi766qlwVfgO66O8aLBV+Bhv230KbO2VvDNHdg2tWc4x
	ZTUgeDbYL2z41Zvj1GnieWtQLj3sC5FdCvitrFBOBoC/8L2xT4zcv06vajVJw6cTJFtTng9QCKO
	bVOSPwfWNKTGOYxvVvkEVdW4MNNNjlM0fx7HGESUK+CbGpbODSM7k3Oajgn3bXFTEHX2Dax2+u2
	8vdSaHndB1SJu4AX4x7tH9qSNcaHLe6cjXGXZ8+y+6IhxO0BGCxbXH4odH5JI0MZp/HO8mjq13o
	hbBVusAWupdYEt5PcTYcScHVr+V9A7c/sGmc2k81TKceAyytJ0UdO8Ar5WROhDR6+oLDDzkBu8x
	fEZYmsY54BJcP4DDYRixfjlisEqpI=
X-Google-Smtp-Source: AGHT+IE90WFoUZjrTLGRhe0P8f2Vkr/jZhcbkZMYy7AeoSZMCzqYFaNAxbgBLHqiUPw8Nc2EhLIzFA==
X-Received: by 2002:a05:6512:3b0a:b0:591:ec0f:fa92 with SMTP id 2adb3069b0e04-59a17d18184mr9594424e87.3.1766831320381;
        Sat, 27 Dec 2025 02:28:40 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.121])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b2958aae1sm3054055e87.41.2025.12.27.02.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 02:28:38 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_update()
Date: Sat, 27 Dec 2025 13:24:41 +0300
Message-ID: <20251227102442.44989-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfe_isr() iterates using MSM_VFE_IMAGE_MASTERS_NUM(7) as the loop
bound and passes the index to vfe_isr_reg_update(). However,
vfe->line[] array is defined with VFE_LINE_NUM_MAX(4):

    struct vfe_line line[VFE_LINE_NUM_MAX];

When index is 4, 5, 6, the access to vfe->line[line_id] exceeds
the array bounds and resulting in out-of-bounds memory access.

Add a bounds check to ensure line_id is within valid range before
accessing the array.

Fixes: 4edc8eae715c ("media: camss: Add initial support for VFE hardware version Titan 480")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 4feea590a47b..fac111135c78 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -237,6 +237,9 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 	struct vfe_output *output;
 	unsigned long flags;
 
+	if (line_id >= VFE_LINE_NUM_MAX)
+		return;
+
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	vfe_reg_update_clear(vfe, line_id);
 
-- 
2.43.0


