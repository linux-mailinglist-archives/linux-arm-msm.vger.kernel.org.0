Return-Path: <linux-arm-msm+bounces-62378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A6CAE7CC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14C0C16C501
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7672EBDC1;
	Wed, 25 Jun 2025 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5ln4Yrsq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EC02EA161
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843151; cv=none; b=q+nfFzElLrClEY33iFop6mfUM4kwJWKktiP2AQWvZF6Ey4CI3u0j0n57IHQL1m0nD6N2DG/iKrHTFayiHKHaPNkI2buDrSFvNiKkDkNZjFbgu+rxlvy+Fs3QnB6OaKjXn5jNxBaEDYrDiSDwRSrU7SYZvt+TS5+WQ0O7iMhNH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843151; c=relaxed/simple;
	bh=At2HBbsXvVHz9rxjvswxCr4eB0qsSfZ+uDiTlrusbVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2WDOQaXvkZ772KJtuzTfpaRpyXzNoscoY+EUi5p0FKJ0PuCceq9MrSipVqprm0fa+R9NVMhGRI36Df/Yz6oZMKBzEGqKjW2H8H9uWSPqLNGZ3PYRFYaP/hfkg2I+NM+nH9/fEE1rOF6yuqWnl5D6rZLdvfeWtKbItC+Z4H4Ai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5ln4Yrsq; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so10039293a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843147; x=1751447947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNd3fbEJo95yGNYgF3KFEKSMuGFIZiFKw1iK0PL8zKc=;
        b=5ln4YrsqZY+GnVgKLiDiELO8HL9wh+hKCgLlumv38bMmDeDzWBv6oJB9biOZTk/0k8
         NRNXTQ1M3Jdk393sP04alOb+Ca7qaRwWxi1YtZpRr70RqbVbjjCbgQ1GMvuD2fY+EIK9
         gAwJE2EDRZ5ru0ZYOHQ1DiwhmBMB01WzwJ36n2dNY8pBdLch9GsFDawib5A2GNF0ICt+
         PsRtZnZwL7aSzDyIRHQa2tAA2AIHNuX3OdDWFrOgZYV4wcorLmBmYuTBvH6pcVO9X/24
         eajZfm44ci5KBCNHscM2ceknWlKzDWv6c23fQujKexnWhCmn/ztcq8AlNa+eH+1XQRLh
         t07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843147; x=1751447947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNd3fbEJo95yGNYgF3KFEKSMuGFIZiFKw1iK0PL8zKc=;
        b=rR9vmXHhNCSdbD9q0NK/5WaOhH3uJzjaB9CICZ7tVDan1qQlU6ObTlIfmF3cJOI/Qe
         1W6cYoNg6+RifX0oVQZTnfy5v6AzLnKJTFWRIVxiIcP9c1fTOK94+dPwtkv/iJQD7ZI6
         Vt+6QTJxpa8ZKgXCofyp+C11ryVtPLXZNcIi+AQGllBcZLtmrBAl/PTPPzEOwvn+J/zD
         zv2sJ5knCFB6S86EsvPEINpg14G3muXlPP58XMXKhZnkuVSzhm7rQPVCkLGNr7H/enAg
         EbIj62Ft1hX532ZDCZI+2mX6lWmBKveV82apdKoqglCVDpz//CZf5RRcIkw+SxPy9eUa
         bVOg==
X-Forwarded-Encrypted: i=1; AJvYcCW7R5jyz9J4dVXZHWPI372XSvgL1HJSczp4ojKpImvhaPueNpMk99G8z11SaaRHcxoz0n6yjcKxw7fGHPdE@vger.kernel.org
X-Gm-Message-State: AOJu0YzgA5+/T6w4ubvxDC/VrCJFq56BjEqYUaU9TAzuf7U82TZ+C3e7
	E6UHa7mCLhRgGsn8UjuAlEuIJ3LqIHaJBz/z7yV/TsiGJp4EzS4zEuQDKhwzax07FnglWeagihO
	oW48N
X-Gm-Gg: ASbGncuBAuwREqlHKKE56N5JuqbHQnS3HMvW/WKeYKMlZyWh02PtHWh9aWkpATdw+2F
	4y6M3M/YO/lOPzs5GDMszIbliwK5CgUy82Fl187SOxKs24cDYsNN6oqCh8zc07JamL9I861g+ya
	q5g6AfxMVZCuU3frNpzoemWBF1r+A8bqkprMY13zi02VnUq84zGZ9dE/aiXZygQr4T2B2TzWCtB
	yZxGJp/nu0Nfx7B3cu9wxsv4VDi2giI8v+IajMH8uM1uzoXuDrxQnyfCD1XQdEyztPkcRA8lqkZ
	uGAuKNX/XfotPIK++s12JSZ38t1ChKG5TDFHQgklNTZs42VpSIvvldrA1DoTIQORgH1FpPX0qGn
	QKogojlTl/hypBWFbEG4ktFoNdeVGbxZNig6yoeWDQ5g=
X-Google-Smtp-Source: AGHT+IFrWmp3wGgOyhTgxlPt9IPhlOttoTglpXWgze+zdtqVFSVHTWvXHVCUkPD9wTziTvQxUHBaXA==
X-Received: by 2002:a05:6402:2712:b0:606:c388:636d with SMTP id 4fb4d7f45d1cf-60c4de1f0f7mr1624510a12.27.1750843147213;
        Wed, 25 Jun 2025 02:19:07 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196f84sm2194802a12.14.2025.06.25.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:19:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:58 +0200
Subject: [PATCH 3/4] regulator: qcom-rpmh: add support for pmr735b
 regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-pm7550-pmr735b-rpmh-regs-v1-3-cab8ef2e5c92@fairphone.com>
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843144; l=2162;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=At2HBbsXvVHz9rxjvswxCr4eB0qsSfZ+uDiTlrusbVc=;
 b=WxMVah8khmrJdoPsiT1CStb1PKFXN7peOrJoknPgFsvU3lLgAlpjKormdCGiDOBOPg2x5ce6s
 Ux0+q9cGoeSDb8awLllnJmDhpFxOlOsKC1z4/vwDLs+6YPJJJdjPqbj
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add RPMH regulators exposed by Qualcomm Technologies, Inc. PMR735B PMIC.
It has 12 LDOs with 2 different types, L4 & L10 are LDO512 LV PMOS
and the rest are LDO512 NMOS.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 7870722b6ee21ce487c2cf911760fb4a385fc44b..7b1743d51fd145a44f98dd8e605b4ca410046654 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1476,6 +1476,22 @@ static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pmr735b_vreg_data[] = {
+	RPMH_VREG("ldo1",   "ldo%s1",   &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo2",   "ldo%s2",   &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo3",   "ldo%s3",   &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",   "ldo%s4",   &pmic5_pldo_lv,   "vdd-l4"),
+	RPMH_VREG("ldo5",   "ldo%s5",   &pmic5_nldo,      "vdd-l5"),
+	RPMH_VREG("ldo6",   "ldo%s6",   &pmic5_nldo,      "vdd-l6"),
+	RPMH_VREG("ldo7",   "ldo%s7",   &pmic5_nldo,      "vdd-l7-l8"),
+	RPMH_VREG("ldo8",   "ldo%s8",   &pmic5_nldo,      "vdd-l7-l8"),
+	RPMH_VREG("ldo9",   "ldo%s9",   &pmic5_nldo,      "vdd-l9"),
+	RPMH_VREG("ldo10",  "ldo%s10",  &pmic5_pldo_lv,   "vdd-l10"),
+	RPMH_VREG("ldo11",  "ldo%s11",  &pmic5_nldo,      "vdd-l11"),
+	RPMH_VREG("ldo12",  "ldo%s12",  &pmic5_nldo,      "vdd-l12"),
+	{}
+};
+
 static const struct rpmh_vreg_init_data pm660_vreg_data[] = {
 	RPMH_VREG("smps1",  "smp%s1",  &pmic4_ftsmps426, "vdd-s1"),
 	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
@@ -1667,6 +1683,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pmr735a-rpmh-regulators",
 		.data = pmr735a_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmr735b-rpmh-regulators",
+		.data = pmr735b_vreg_data,
+	},
 	{
 		.compatible = "qcom,pm660-rpmh-regulators",
 		.data = pm660_vreg_data,

-- 
2.50.0


