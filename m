Return-Path: <linux-arm-msm+bounces-39412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA22C9DB5A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 11:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4FCD161D41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 10:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9424B19922F;
	Thu, 28 Nov 2024 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5u1Cu1f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E38198A1A
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732789556; cv=none; b=K3jXZV//+oRtZFsC46DBbP0n0UkifNOowZeqhQ0O4l1j0wzcDooXq4vAqKpdA5mI9JF5fhKNDLcZQuezg53T1SmE9IyJztokuiIqOiFZQHSNfi0poOqVuoRLjsHRR31cyLMMgHebS76yVUPtspwug61b/n3xAopqRCclaF1D+zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732789556; c=relaxed/simple;
	bh=924DT6oTDMvCY939ECy/haC6Lh7oI4FgArQiNZ+Ppug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNUR+67jQQ+iQLQuJYjuJ15jxAwu41zVRPkrVfjdmja+zKxpYA0dBvWQmpoOiSAYNRPbfSISpHj04HZVOwjMbvBGBcmvcPBPIiiaaCLHcZzp5d1QbNab3OI4w3MbUdGn/ankSQlrTdnTdpzC3TgwHzXZrlHQxbhLHt3gJurAx5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B5u1Cu1f; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a9f2da82so5395925e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 02:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732789553; x=1733394353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onHZLTuuortukCIGD/zr91NsXEjXLUPL7AUDe8ckj8E=;
        b=B5u1Cu1fMtNRqZKQM7wttKGD/v6nzDRQDcCYc5GixTugGMQvTkxLhlBZlKeYOO0h/f
         646NB7OMjjIopH9mG4EtxlsFqlWAcrI/AobI8gHOTQ9y0pr6ZwGm34mTFwrxuIPwQzsn
         1X3qhiiJTJcv3fcyzjvnjKwqSpSF0hxGVYtBMA8mWKqJVVmVtbAOzAgQD1Gk02fK6lYM
         T4O6dFKER9Oj8W1Rf04dyYJ4wlauI8aWFoxa7L0irFf899SpoPbGW3r18u/7/sQIdxMy
         bpkU3FU2HTZWzrD771v3xBGuA/rqlPVfXjSTc4GckI/NwFQ9eV4fTQTDmg7Kse2fbH8Q
         NARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732789553; x=1733394353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onHZLTuuortukCIGD/zr91NsXEjXLUPL7AUDe8ckj8E=;
        b=nGyQzpGZ/Kpks4O9DUVdQ4+keJgLtSlEx88H5zc9gSuL9OBXCKBg4Ee02NHO+Lk3bJ
         JYutt+0lSPidVxw9IAqHAZq6RV/+FaRGSClSm5BRfQ5nJWGTxayWpQoYUS8Pq8Q4eoot
         4s7OyhuODkkRe7CXEWRqS4UHheBSYMYhwY50+ySr5D+zgh2Y/iSAA/+MbkPo/j58y4QN
         mTVOiDlsRw0qb50N3qBqPt15MjA6LiaOSSmw4ZPBYM1q3KsuQcV2hXmM4q7KvGNAkc6m
         1KLHRFaaRRPaaun7uoWAJwUJlsIfYP/Det1soQ3GliqSayF+M9z10vkisZ8NaHO8UjSW
         1fXg==
X-Gm-Message-State: AOJu0Yw2TAOG6SxANMy2O3wY5S3MWiOnBPaULpIsXPcqPfaow2cNQEn0
	zF/zN5KG0TfhbRr5752C+lEr51U4qNrQOuhEuI10x029Y1ECgts9XdVKUCJSIpM=
X-Gm-Gg: ASbGncsce/OJYXmPq5b1s10M7SB1D/c/Ptrr3UQ1qfzVZ5WrKkkad3dvWTKG8Pkli/w
	1DO42ea9RE2rfp7zU2CzAesKX8aWTuK/GjDZRle1h4dq2AzFzm+RvCeBh7Dl3mw2UxTmg5vh9VA
	MKHHwszgl2FwhkxW2ll7wiUrHPQ298gpzmeAtHBb6wkfNSa1NR/w3fwmLJmr6b88754BFe/4beX
	2vWXCmK73jHp9BefIXMCwjZ+rasa1I+r7apKpA5wBhbUgX8ROZyODNzmj+o0VuneDfcQrI=
X-Google-Smtp-Source: AGHT+IFc8baEE4obV/t+dZEaXnJYfvSi4j1JSnGZb5upEN1OOzGRPJoCXriBFRWmZ8/pRLNl0l74RQ==
X-Received: by 2002:a05:600c:4f0e:b0:434:9cf0:d23d with SMTP id 5b1f17b1804b1-434a9deca10mr51252185e9.25.1732789553016;
        Thu, 28 Nov 2024 02:25:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:25:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:45 +0100
Subject: [PATCH v3 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=924DT6oTDMvCY939ECy/haC6Lh7oI4FgArQiNZ+Ppug=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUpWCTm1P4HsUDHmzl+hSPFrHFr1Uz6nvhjAh0U
 ag9joeuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFKQAKCRB33NvayMhJ0TPmEA
 CKNYmQ/3wwTCYJIWif0Ir+v4DtzD2ni3Il+Jkwn+SGIGlDWiB+kPTLReVehrzVtdJE7tMfRqCxHk7s
 6j7H/H4Shl9fa1uAdH3ljKBgyGsvhytbWLsy4G9dVenGN+ps84hteAs8m/FPfQkGiLrHGrlYsd3kbv
 WXqzevlGmH1wL2GLJgWXikowi3pzHt0PCFdo4euBlSm+GDl4dPunOfQO44atfqOLVkmke+bJr//TKJ
 dcTA6qFZMYaal3iMUtzN+73AzuXgr+NYBTUC+VRHvdW7MymRSa0kAbo4HcBulVuEw3O6CLfG8ZiO96
 B7z+zOwqz86rsDDtr0dNhsagJHSP6te1/aCrSvBxUllDFAVpFDxmWcdvqP1l5J9e82bmO1UneYi1TA
 TLbvt/DjQrfSr5LJz6VywB6fFumm16csyVIEPv/QYPCLtvaTQrYQTcTKXXi1+kQD7hD2Ui5fTPfRaG
 y1KIoQogg+OuI25+n86i4vHX2QgpZK2bfYi2Esnod7LnC0V5j76Jg3nAh/e4sjRzsx+XdqKTcI8yM9
 Uf2TBYKuw5wXkOi6haDShbQNXeHGh4RF28bG0rvQrWh0L/HPCiwfxNtDAYUdoXc2AptTpa94gm3Hfo
 6BqjfzI23rQb09w23GW2t6L7AV8+sopHmzVmN9q/IQ/5wsiP/neDNPGjqjSA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
is in place, declare the Bus Control Modules (BCMs) and the
corresponding parameters in the GPU info struct and add the
GMU_BW_VOTE feature bit to enable it.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
@@ -1432,6 +1443,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,

-- 
2.34.1


