Return-Path: <linux-arm-msm+bounces-30826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8424096CD48
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40710286F41
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325C6146A62;
	Thu,  5 Sep 2024 03:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFDha7Fy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F44B13B5B4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 03:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725507223; cv=none; b=Xl6l4PyrRYVyarx+/275Ho2TzZr6TmkdTfcwn2fv6k13LhSyqJmgjUIBbbh3rHa5jAHHfjn3PF7FD4wXZp8nRCbX9NBpS+Vp7f2whmQ0ts9paLXATRVSGfccn2CfY7dgUTLRsu6ej/TG43HOaBw+Ynf2q2VCVqxZXw+qFOkUnV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725507223; c=relaxed/simple;
	bh=Zk7CuvNCGglePje0MWpioiCBoDt5MfGEPMscrIFpuTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LmO4tWJ+4kNO0JfQaMzkOGSk1kSyuXE0hIaC4g6x9U89M9gISYoQVq6gGQd4RPjQ2kWR1tlterG1MHQdMes0aNHDmS/kIzomRtIm6mnYi6TsAfs+oP60uTM2swU3GP57YnFo2OKJ3Nuq+/9A2ZSa8unjnWu595OnTboId4QGNtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wFDha7Fy; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-533488ffaf7so262190e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725507220; x=1726112020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHqDfVFz4e4ch7Qvu8SgYzoITxtA7TzKSa28k2tmaC0=;
        b=wFDha7FyDuKPJM+JrWv9DM85Xje5HVQw7oYYTxV3ihWImY6n/yRPeDbhIDbgT0mzm/
         kFZiZzP8Ut3+YXRiQ5h218CKKPuy9jKcPeyksr8kSNLnC6w0Sc1blx9H5P7qlyZ60ZHu
         825q5j+1qh40VCy0msXOwAo8RqkFJnRz7YAFWcxOjZCSq2dB9f5QUHGUDoyb6PUSujcG
         2H764iDGQolxXaKt+y5GiHBP/+tBbK5ybnjWNNishnYVvumiy08gj7gybZ15VQ2628/K
         LTrh08/LNNMUA/7cpTHHcg2ovvX17qPMmTlD9dnOXua1VBsr6WgqfL+mNkM4pUPdy+Fb
         VpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725507220; x=1726112020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHqDfVFz4e4ch7Qvu8SgYzoITxtA7TzKSa28k2tmaC0=;
        b=LLBG/mzoO1OHe8V7nT2iciDW8d/kzhsLj71UzL35TwP/h3zXvPsRJoJ80W2D4VHiqg
         HK4vek7PAkRzMcCfHbgXLZRRWGZKLVltf9eFgRn+1FbKX+7IQgS9jTiBlAVoFpvRLMVu
         r0IP6YScelKxe924/4z3Nsxroso+OvkUopxo87p57zKjcDVlMrdV9sp/PmKoJTLMUZOZ
         3a8O1IiAjr8HfPDC/ABYJP0C+exLJJWPR4GmQCNINegIG43qXmRQtem8kmPy6rhSnKot
         UBFaP3AjUEW3TgLlAKhA20eIBdZ7x6dMmkkwlM0FHGCaVUrF+m3yAXYr3deb8oMZiTEd
         PRCQ==
X-Gm-Message-State: AOJu0Yxil6Hf0eJdily/s/5JBhX8pKdfGvdwGGSnrsXptU024uZh0Bfw
	6eM4I3Qc2Qs78pWnG+R87tWboAZL+ZXqW3WdfFPZ3xiVaMr/FlPxjHD2GXIfwcQ=
X-Google-Smtp-Source: AGHT+IF8RYrZhm6Rb+d5KJJUucAgU85MelFmmJWy0tHStryL1PjwkJENosRYCfI0WLW1G2JNywVluQ==
X-Received: by 2002:ac2:4e0d:0:b0:52f:d69e:bb38 with SMTP id 2adb3069b0e04-53546afd7c6mr13901020e87.2.1725507219347;
        Wed, 04 Sep 2024 20:33:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:33:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Robert Foss <rfoss@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 00/11] arm64: qcom: set of fixes for SM8350 platform
Date: Thu,  5 Sep 2024 06:33:33 +0300
Message-Id: <172550712140.3299484.13498001864474908780.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 04 Aug 2024 08:40:04 +0300, Dmitry Baryshkov wrote:
> A set of fixes that target stability of the SM8350 platform.
> 
> 

Applied, thanks!

[03/11] drm/msm/dsi: correct programming sequence for SM8350 / SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1328cb7c34bf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

