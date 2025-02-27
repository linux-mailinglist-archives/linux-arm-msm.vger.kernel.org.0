Return-Path: <linux-arm-msm+bounces-49620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA52A474BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8AB13ABBF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251FE226D13;
	Thu, 27 Feb 2025 04:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHeNWJAT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437422222B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631070; cv=none; b=r2CKSVHSFIVd/jSKB6RFo8A0L4jzyNso+VVjOtxB+ewkDkn1OKfw/zqZ4zqi+Yr+H/12f/I33t01NqjktPb7CNijacTGKfAW1udKZYBxwKii/zVfR07R8XZA/O2KR5L1XO8WfPPl+aTuBKFIJneN3sclECXCUmmHqvHNgrigCXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631070; c=relaxed/simple;
	bh=vpCutPqoDxQnJQCPEd51KBxUZ5j1zIGXF3PAmD3Zp3g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uIS7Ro/5zXnV+FONfYc/HUbaXvIE5cBltYX5WiBiGXNEB5QWmnXuKBIaEIk0jlogkPbDsgVKuXhf18NEZHhtzxWEVnojzTVm7ZXmayS100JY+rJbE6Kl0OhFUdaqzxNnlhBhFi7oZbhsGI9kFu5fPjFbN1M12WMKW3EitA+Wavc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHeNWJAT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5452c29bacfso437727e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631066; x=1741235866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pb4hUKvEHYfmi+I4u7PNH6BBXGvHJ7207dDOff1Xgt4=;
        b=UHeNWJATzpJq11M/5kKGiYpV6MsrvqFG/hjtQXX8KqPjQBTiAIk+oNCk+SG8H31BcK
         p7S6Yth7r+ddb+eaQnQcUUOd/twxEyxfRR60VMxl00gziFDEgcL/3aJHR9MRNwEvrl7I
         s94S9gm+Gkv0m8I3GDh8rBuvP7wxqzTn57pfflcaBYtG4cueU5EMstqGe7xGfTOJulPJ
         q7gzWbJWq71bX+qEHlUAjJ5SzUe8CC/4a00olJStu9QsSmbfFRU4yJLUm8QtiGZYcoA8
         kF6V+zGhhHuM3TzDHMh4TFj2hwT1XLmaGpttDxcXgpnskW31QNkWhG8AYZ8RCXK0Boq1
         We8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631066; x=1741235866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb4hUKvEHYfmi+I4u7PNH6BBXGvHJ7207dDOff1Xgt4=;
        b=M44H8fHWMmvEAIp69RTO1VWWxLZkhFt/bV9/pCG7j+dF72fEwTJ+v9l4ihOD3533F8
         oCNfjVG/M7u97WXNbiS6C1MmU3Upi+zBn9mKzTdoOZRSEZSfPmVoGyJ68m94T/5aCk6d
         i350PBaIgeEORURAHPAg7Okd+QyARKA4JIG5wv1Q6+Mm+NVZ5A4Bnq/FMHnQKXuI4TBB
         uA4/ypQaiFRM8Rfqd1Aqw04j2aX5T4dgsnG74dM1TYRDAEHCNZnK1EigNJT+HUSk6+mo
         qT0JJBe+h4vVdWVb0V6EMzAKk3Omjst+soz+f/DD7eUliytuHH/omjMnsj6Eko6QVJtP
         WqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkjkmRjObHIzrdk2SAQGH6rpi3TQbMtp7qD2UR6D4KqxZINbBjXgkGNZAf0Y6v+0riLxhkvjp668dgQIMD@vger.kernel.org
X-Gm-Message-State: AOJu0YwUemseqgLb2lQgye/JoHahaWw8tubc15JPN406UlLa0VQ8fWaV
	Xahm0HU4cGgp2M02+zPQrc/kdVPxIlVxWuijPolk+jOmRga6eVpLLTC9sik80oI=
X-Gm-Gg: ASbGncv3AOCEyKzDsOqkPokyvUlxdRZe4BtcO6d6dYya6VtZ4kqcAqClUf+MhV95UoJ
	E0gzuoxVeyY1OwpkyRX7GhNOVkKNR2Z5P/GwMxvnNQ9wIaS1E54c00iA9txv/DCsGczbyEaodak
	enbh2lEiYG8JRu9XzbHOHsGlPRmgX/yJQec55KxKrwTSgtLF4sI2nZEB63yCGZPnkifV0bEnpFN
	zTMzl50mJ2x/69C+a7HqTy5P0M494xt5WntPxnw+cqyrFCBitjw1MYf/0z8D9pIhxJa0WTHj8ip
	174+RquxQfSCVSCR/8GtBEFtPFqwhxGdiboYEcE8JQ==
X-Google-Smtp-Source: AGHT+IGd2rBcbdDnOO9mUn66I/dFLYCzyc1GlDdtB8pQVwoJ0TBIn1SVa4Lymy/rEO+PlXQ6q8GIig==
X-Received: by 2002:a05:6512:3d0b:b0:545:aaf:13fd with SMTP id 2adb3069b0e04-548392717d1mr11821826e87.51.1740631066310;
        Wed, 26 Feb 2025 20:37:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:37:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with exposed clock IDs
Date: Thu, 27 Feb 2025 06:37:25 +0200
Message-Id: <174063096233.3733075.8120055678466952428.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Jan 2025 14:21:04 +0100, Krzysztof Kozlowski wrote:
> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> two clocks.  The respective clock ID is used by drivers and DTS, so it
> should be documented as explicit ABI.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display/msm/dsi-phy: Add header with exposed clock IDs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d1f28e30a525
[2/2] drm/msm/dsi/phy: Use the header with clock IDs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5100ae76b5ab

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

