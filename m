Return-Path: <linux-arm-msm+bounces-43000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1559F9788
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 18:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 341CC189977E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B9C21A95D;
	Fri, 20 Dec 2024 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CwFFs38L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A416E218EA6
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 16:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713751; cv=none; b=PMDTorw+wZ3zBcE/lxU3Ghp/2mzht9HzcOwytgg8uddlqyyqjsFFjO3x4RWUndCH4OB1lgjUEMPkOC/lHBLw2mr2UCDUhnfjO0SMc8aEsl4VvHpGSrtRt53ZHJ6/zdG0fCpQcAkpGvhZvE7CPHU+X5Gz8gQn52CtiqP2nBk74rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713751; c=relaxed/simple;
	bh=ZJ6BlFTh6Cd2QrVCVjLhtbcAD4DALAZMyCALpAZOwdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s2R5MngI0H6JuPhn8we5mx4ydReQNOhEwncJ6Ghq3uw9EK3qepUzaVRZDByK+tw+dONW+NdbXVtndLLZrGiLE+l2HWAFEiW1WADTGFEMjh1lpJrzdgQiMi4ZqyFrVUI8K5ReGW/+pvgfnzu1RoxhuKxcY0KhHXvwz2EKkiHHnHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CwFFs38L; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso14993525e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 08:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734713748; x=1735318548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRMVd2Ct+RJM9mKq4M10JLL1AVbRbgv8gECSUOI9cfA=;
        b=CwFFs38LKnX2qjiKc6bbdAzbp+KdKtYBLIujleUiabOgYkHbqcGa0k2A/rafCQj8oG
         zTm0dUnZMLWXNwoeaINUX8puistLCf+mec9B6KJg/Dd1/08WkBe5YDgz9zn/QUYmQKGB
         oiRyBx/B/Yh+7Y2D6Rt1Pe4j1/Y/fu+ElvY0hmgyQqfz3TaqNTk+buN9T5tWZDaNQDDM
         nhGemds2do3u37g1NHKApqv0C0o6rjWrC5j0kcSDQgxAIwawT8gXybXxafX9Fmd34x0L
         JV40zfdMOszC3960x/BE44M4ycp+t6oWjo9DK4Zwh+F7GGW1lwc/f1KvMu3kKCkywWjt
         OmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713748; x=1735318548;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRMVd2Ct+RJM9mKq4M10JLL1AVbRbgv8gECSUOI9cfA=;
        b=el7QBwEMgcVSdVR9Yww6uS6HRS0ulWLYStSKH/omrZD/ZTsLkb8Loz2vaUyWpHyT1M
         LQ2jdGfSb/bxCOCD04zN/ISOmxbeUGTvin1zhNUmjYYjd0Du8jhk+jioCrrU757D8uhh
         W/k14RSfN9uk58ku0ELWjMl7r0MaZRhX1+xe/LvVbiXMGPvmwS9N4xqh4bOZfkAHArtM
         ObXxi5OqGh2SpSVG2m6e1zRViAaTFWNCz6HNfSwrawn/5hi/MuE1Fs/9moBAZpEtQ/8l
         76YBw/l68Ka2BwSnOcMbaO9h3FDXuGAaMbXI65xh9Qs7gkH8I2vSpz7UOThNvDm3749J
         bkKg==
X-Gm-Message-State: AOJu0YzYx6+Qs3g+XZUsXgvN/cS+YvDGDuIBOS4cAXRRo9oDSj3cW/4h
	M4HUL646zXOen/ijWmrnzRxHt2n0WWQAK2b/Thu45gZoikwWyHYdHaTLKUgd1R4=
X-Gm-Gg: ASbGncs/ue78it5znucPa5lyTZQyi/w1cg8pKHBXP4OSZokihuIYYwNG+RXeW9Xadww
	gwVjtaau4mlweMkCOpV1oZGf1Vjy7MSpAfYJBSccMAxGpHCtupuABUQx1iGBfEDoUfjbMS54Eei
	S+IEazLyT/0JCFHXcjx21lNtiDyuAZGI7ZlJ0V9BYtXu+XyluoAKumLdEuNDAxDFOWP/EZ1jXh5
	DQwwt9dZ3FrEaz89T747baMpM/Bv5EzYUqTTiQf8T0yok0ZpuPzeuDnj/3p7fdHJyzKpky8i9c=
X-Google-Smtp-Source: AGHT+IEdH/GxYvmGV9OhqkZ4EH1vTHNkVaouX931hJminJB7ZTbk13vFQOd2dc1W1czg+c63hAfImg==
X-Received: by 2002:a05:600c:1c87:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-4366864320emr36500145e9.9.1734713748019;
        Fri, 20 Dec 2024 08:55:48 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e261sm4491454f8f.76.2024.12.20.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:55:47 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
 Dang Huynh <danct12@riseup.net>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-msm8917-v10-0-35c27f704d34@mainlining.org>
References: <20241220-msm8917-v10-0-35c27f704d34@mainlining.org>
Subject: Re: (subset) [PATCH v10 0/5] Add MSM8917/PM8937/Redmi 5A
Message-Id: <173471374655.224301.13708019576127725452.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 16:55:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2


On Fri, 20 Dec 2024 12:26:13 +0100, Barnabás Czémán wrote:
> This patch series add support for MSM8917 soc with PM8937 and
> Xiaomi Redmi 5A (riva).
> 
> 

Applied, thanks!

[2/5] dt-bindings: nvmem: Add compatible for MS8917
      commit: be7eb69d5db54ac9ce794c4dc7d278890a78e0fe

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


