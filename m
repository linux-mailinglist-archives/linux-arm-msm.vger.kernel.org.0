Return-Path: <linux-arm-msm+bounces-35241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6AE9A67F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FA6A1F224C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671491F8927;
	Mon, 21 Oct 2024 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SzWqTv/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4436A1F819A
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513076; cv=none; b=R+Ss9eTseqVJMOoFjJREgZSTdvd4PKfu2UEevRRvPZetLn9APNS3P1Eubg/CZsrp5ytJ4zHNZVS4fOG13PUcCGwSRvBAAJaa5QSym4Clg8l5l4LyE+Y4TcJqM3hlxylr6Di7rhAu8V8GlvqRvMXDMF01WN/lR3ugNYlvl10SgsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513076; c=relaxed/simple;
	bh=sjMvdFgTlY4RAU0wxseZJBfhIxEWpkhyIyccRvnoatU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l4DtGwl4VEfzFfPXWlOCJcx1KDZa7E+dLCTTAqypqBWMo8VOYMCxT85HM96W4dp83DxXfQUvPS7mt9qAZktOFD3GJMByeVdOguH35kgyAbmCdtEKpa2AKWSFUqbCojddgmrS7Pm7Xi+qot+z/LkOekkn/sMzqUeCo+/cr+IAZrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SzWqTv/p; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e6c754bdso4192467e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729513072; x=1730117872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTNe+XnRvU9RR5VCLLOhfvM31yZ0+TUCEsnqZ6GIS1w=;
        b=SzWqTv/pHAafkKOaAojza8UMl5ms5RdxA3jnjjzrxHQnFh6O9IivnM6u1Q944pT7lo
         7UFsZZv6GVsVbWcVjHSlhHyPYPyyW+TubZGJ1XAAd51AGpxBSWrZ9tfoaclYsXYm5GxK
         7q8Eaepa3pizxIqt2Aa5DONvNzzZLd1BfycNEW2Q+jhjDee0pYNY6kk/4Qh35Hkh7htb
         82Z+wq2q0AVVSOxbEqoOzVHUwKIRN4QJuA3Qc0ZuJmaVlEMuamjSdq70BYjAbOV7HFCf
         wfDlJCsQpmF8LgdjyrGwfvIQC0DhHNXmZeiwhEkfoFxVGZuuuDnUp7Af1xdirgxkLQaa
         qdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513072; x=1730117872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTNe+XnRvU9RR5VCLLOhfvM31yZ0+TUCEsnqZ6GIS1w=;
        b=JFHHXcYmT6tcXbKjRzsqk7bmx1z1jFJs0OHn1bDW9xV+UEbiP3lQ2/YS8iN+oCVcD2
         iQIctD18ThEvUFTNoPmFZd+E2iSDXyX2TvQv5XpKVl3+isKMQlJlbTA9oALxQwRki4tu
         DD6ovob1yoya/aSVWTAnUF9wauC+cyhKiqYluc9uYX7PXucSTAglyRzasQkyv8/RWzcT
         Cw5OvhX3Evcp0OHicR4X/rEVjSatSB5vDFvkqNTKwGWYUBfDvf+levJxv/AQdtIaSDsf
         llU0leu0JyjgCtlBEw/DBa2soGRZoN/9G5QiMB6E0mwmTIDnnlWCP6CFzyPpcn4jnsZQ
         USjw==
X-Gm-Message-State: AOJu0Yx+ZI+U/O7b6mCHQvwAI1THWdt5xc3JvSxXOcIL/HS8joZTrU2h
	1VbugDNCszaGh/kJB7lpQYzTEbaUzEXMPGtofW/pHJ1E5hhbaiTv1FGUUFfeh20=
X-Google-Smtp-Source: AGHT+IGHZwUBrGOlbOuGK6qQAG7Djezp3PB2cObNy0RjKNlSnT2HrV0co8D0CLg5sUkYjuoFUJOwNg==
X-Received: by 2002:a05:6512:3096:b0:539:f7de:df84 with SMTP id 2adb3069b0e04-53a154412e2mr5181215e87.10.1729513072223;
        Mon, 21 Oct 2024 05:17:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:17:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	Jayaprakash Madisetty <quic_jmadiset@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/5] Display enablement changes for Qualcomm SA8775P platform
Date: Mon, 21 Oct 2024 15:17:41 +0300
Message-Id: <172950935859.2053501.16314780424128815600.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
References: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 19 Oct 2024 21:14:52 +0530, Mahadevan wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> includes the addition of the hardware catalog, compatible string,
> relevant device tree changes, and their YAML bindings.
> 

Applied, thanks!

[1/5] dt-bindings: display/msm: Document MDSS on SA8775P
      https://gitlab.freedesktop.org/lumag/msm/-/commit/409685915f00
[2/5] dt-bindings: display/msm: Document the DPU for SA8775P
      https://gitlab.freedesktop.org/lumag/msm/-/commit/546f8d6c3ed1
[3/5] drm/msm: mdss: Add SA8775P support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4d1cd4c3faec
[4/5] drm/msm/dpu: Add SA8775P support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b139c80d181c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

