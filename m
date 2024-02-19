Return-Path: <linux-arm-msm+bounces-11674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC86B85A363
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E9F21F24873
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287522E646;
	Mon, 19 Feb 2024 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMnKzNO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727BA33CF9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345854; cv=none; b=JQBhfVdKheUAiPZuBeP+mDwl+MqR1daCODZE4ZN/wyDeB+2cqxFWfnKTvbPCyL6U7tcL+jVHDlieWk5xeip6SO+kU2VQI8lQMhMWAhwg4/U6c3IdtGIOFnhbCLoOl0z/WeEaJXl3YbY/+xztKHz/UF011rovO/LxmpP8ilIbdt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345854; c=relaxed/simple;
	bh=CIqMEmdgqI3t82Rv2T7Lko+CSlpgqA71kulwLGRRhy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJt/YrD1VbKeSQu+vRB1SkUmGFDBfY3+zJf1NTDcxjBlR9RiKqUhUoPwVORBoWKvWmh760u8UHibNeIFlcE1YRBMAx1LFSRPGbdfSUUWAv6uLvKnO7tDmmlFVSteLOfZb9fY7nlaiQzo9aMsukJrp4Y6KSRkYMX4owLykU45nI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xMnKzNO1; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512bb2ed1f7so600167e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345851; x=1708950651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpAohRwTwYbAuMyXNWeiGCD6UdiTEgdchbEGaanHYJ8=;
        b=xMnKzNO1Haz7g7XhiQW7ec3cPruY48C+JJCqaspPX0Hh1R+VfmHddfxqmFkywdou+E
         Uvsmae7EY9LU9X7R8MrY3RICNbmqa1KEo9MV3Sh+VVAOYLvEFMtFdU4OWX/DTMNoJS2x
         zuNOYxMnYqdhcr+RK2X32HgKoZNEUAIJxyIJlXOjzmCOwloSlzoJQ90ewJylbyrWo4Tl
         xxAum3W3fdcSwfC/L9gtmGACLUdMVpt/W+MUMrM5GnaogBGNk0WI6XXC1X/atkYMPst5
         UTDl9k6La+hDSbkHY1hibbtKd+mua34OQQt2RNdyCv3e5LO2QDVS+67oFDmc4Cql/k/P
         IJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345851; x=1708950651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpAohRwTwYbAuMyXNWeiGCD6UdiTEgdchbEGaanHYJ8=;
        b=PPfSSVps2gpT84pgqpyQDbE+5KtBJIXp9MMXZoA50w5mxprK/Q2Xe7Ia0e78mh1xiU
         Xl738nCJJqCGuCgyuE5isT9wkWZu5byw9jWNfz0IcZO8YiuTtC0yxFP3nnL/A0eeFpT2
         2atWeVl5n696Ca/miWQ2+zLAsijJb2E1UId6H8svFUc4WYLtP2o0Uy0tP2j0wv71CITs
         IabwXssUyzkdxmu2td31UsdqAJcQgBnIQF7DoFNNiZ0SHnsQWDC3sAZpRCuvh50QWBGr
         Z/ZOlijVtugH8Q1dCSylMLSS7eOCF0st44Uv1nxKWXvP3e1V7ZVBP/6hpg9sBFeUt5Pd
         Afnw==
X-Gm-Message-State: AOJu0YyzqOwSzvenau2YtvwHeFc+zOIPtslZ86uSPZ8Tknc2FZW7j4GO
	tmjmGoX5fZN7TWf0Uy7+8gX/+X+5ATBiCBMxWJUeo20CNeaNaPCibeM04nBqaIk=
X-Google-Smtp-Source: AGHT+IFlu6VTSkvuiYZTha+WVDfU9F1rby9AFqQIs6ooFgMJwGVOj+HHMKyt94DNvUTyn3MOK1rWAg==
X-Received: by 2002:ac2:489a:0:b0:511:5f38:76e with SMTP id x26-20020ac2489a000000b005115f38076emr7448667lfc.1.1708345850792;
        Mon, 19 Feb 2024 04:30:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH] drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge is enabled
Date: Mon, 19 Feb 2024 14:30:38 +0200
Message-Id: <170834569503.2610898.6715741555434645771.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240204-dpu-dsc-multiplex-v1-1-080963233c52@somainline.org>
References: <20240204-dpu-dsc-multiplex-v1-1-080963233c52@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 04 Feb 2024 18:45:27 +0100, Marijn Suijten wrote:
> When the topology calls for two interfaces on the current fixed topology
> of 2 DSC blocks, or uses 1 DSC block for a single interface (e.g. SC7280
> with only one DSC block), there should be no merging of DSC output.
> 
> This is already represented by the return value of
> dpu_encoder_use_dsc_merge(), but not yet used to correctly configure
> this flag.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge is enabled
      https://gitlab.freedesktop.org/lumag/msm/-/commit/06267d22f9ee

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

