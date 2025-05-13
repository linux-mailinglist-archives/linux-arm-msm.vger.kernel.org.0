Return-Path: <linux-arm-msm+bounces-57714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E573EAB5703
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36F0D3A60AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 14:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01472BE0E0;
	Tue, 13 May 2025 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpn1+7So"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC72BE7AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146257; cv=none; b=CMOgaVotuL21BHvEl8D1wVou1lAjAVK/oLwMqOBv77jEfHUJIFUQlvg7s68dHih2v7uWC3K3ZYUDWp6N02KYAtzxKK+KksT8hNYt6/KNIeLfO17+DzZk3fLCkmmMiZWwXcVB9E4ZFDpFBNdaYPPZaREf/bs7IePjl9hEkIM2Ab8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146257; c=relaxed/simple;
	bh=xuTTjd+g462s92piJzO152zSuWtKaJvpLpSJbcZ7r7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V1XeYxJU2gaitxQMk5O8kbLsJtKeXGbZSB7Vk5DRExrdMiv8YVlfrB+952UEYjVq3zA0aQoL7zBpY72hSrW4OwwJ09sfZxacL+EXUbi849rnmnthRUah2G7SZExDj3RYK8QKIVINCfFnDKXTLsb0fdjWsmlJ/1hegUfxTQa8thw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gpn1+7So; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54fc1132006so807380e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146253; x=1747751053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jbp09rP7yjvsBo1LKOhlRvBKJcU01MMyhu8zUDGFwjs=;
        b=gpn1+7So1bBB1yAq2YqdQad9Eu3XhiQ7KYKOOAYWGY9pP2EV//WAtn0+6+HPoZFLkl
         pf2qeUQy9IRPUl5IGo3lxZji6UVl7Fxr8W2wcvBpuBPPiz17LQzfHMAFXfAvH/a5RSu8
         OtQjxAI8fnpDSvDHBxFSTFdqwTAMGeaATx3iuHSRVvBhPNbMOj6Ied3VnaMcgN9lTLAS
         vf1Fe6kwcTux7TkxeWOkNjVD2yvYPZrlV/L3MPmRvGLkE4k83CRPOvZVr5h3HZssv0OP
         zsHA+NKv+XpUjMbSVIqMRjAjyl+7Ruv4io0fnww1yRASn25XVBXeQr4DDAmx77Lz/eLM
         CMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146253; x=1747751053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jbp09rP7yjvsBo1LKOhlRvBKJcU01MMyhu8zUDGFwjs=;
        b=lLlFRST7JYZsVJtYMyYTQTMTsiTc4LQNQjaI5MZx3lVSmFWMm6/q/fk0X0Afxj3uVf
         zbbsG2Q4vnRMfdemVp4DyfW5amb+X2E+Q2k6mwJdlLN/L6ki35Yco6sywXhQvKKcgtPr
         VwR8i9mG5IKsMySfKXqMwxi9ii5N2Sc6Rckh2kvFr9YBv/OIB95DdR0e8Pcx/gcl2gx/
         CBRYzghjr54aQTpMZX9gS1sLg+2OzNxlfMP7nJvAFZFMTECC0xN+dMNMTQeTkrFre3EH
         KrUojDX4kSqoWCJerv0dcbLxpoa1S+dZ5vZhFVuOEPJO98TgaIup/b2glZv/+qka1iuF
         cutA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ed3IvfPKIim+j9wD8xk5Ao66iRysf5oqIKdbRpKFSvGchsBujo4j4J6t+QVNf306PaHefvpth7ZqtyZh@vger.kernel.org
X-Gm-Message-State: AOJu0YxEzTo+bAM1XuJKJtDhdCXnBBHQMm2fM6YJwKIXx7sqKwspBg+h
	I5J6zZvsUbgbMzDhJb3qpj1RuHAnZvoNKSK43IQnobPd0CTPHLdsFLowO490suo=
X-Gm-Gg: ASbGnctiy4IwJKiScLpY9HHDUgrMl7AeHFJdXtVTpQqw6CQrr9GRrO7mMpAJaxylFSi
	RKZUMavz9l4gwGrOQmCN8LTgMmnQEWVtBI14Li3WAQKgbNuPF0YwTjYKbWfPE8wuHlLdDL8cIDs
	qQ2d6kjlTUJePmmmyUmYlmbGCeHoNyB0egLHvqLUMRVnnBqUbpyyDGAWRAJuL7Jt5WhLVDG/d8W
	Mg43Q57/UFqDcVwl+Ska26t8ZqzFV0m0CfKE2oDr0G/jQAwblpG0xxZHk1YA+1zUB6tm1zhRVtx
	TYPYcYzJEyzAJRKKJ3dJTCeooxf8Tcl+LP5X+jFBDe3rE9fpRpniufHhtG0Mr0iNkHaJM/c9vTS
	GCs5k4geJ5NKgaid43LlDJRnWLA95hYJCNMBfdhpUqJgE1V0PaYc=
X-Google-Smtp-Source: AGHT+IEysCfN4QoGm+Kt4uTCWGC/FxersV1Axm+mK3Qn1WIeyAnenQCAPHpytZp/YJF6w/cpc4ZOqg==
X-Received: by 2002:a05:6512:3994:b0:549:8c32:78ea with SMTP id 2adb3069b0e04-54fc67bd4e7mr2176139e87.7.1747146252969;
        Tue, 13 May 2025 07:24:12 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:12 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 9/9] MAINTAINERS: add myself as a CAMSS patch reviewer
Date: Tue, 13 May 2025 17:23:53 +0300
Message-ID: <20250513142353.2572563-10-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as a review of Qualcomm CAMSS subsystem patches.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dbdf02d6b0c..9b973c0128fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20135,6 +20135,7 @@ QUALCOMM CAMERA SUBSYSTEM DRIVER
 M:	Robert Foss <rfoss@kernel.org>
 M:	Todor Tomov <todor.too@gmail.com>
 M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-- 
2.45.2


