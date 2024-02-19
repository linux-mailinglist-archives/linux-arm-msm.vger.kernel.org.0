Return-Path: <linux-arm-msm+bounces-11676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27385A366
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EEB41C2376D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6BC36133;
	Mon, 19 Feb 2024 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yO180yNd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFE42E62A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345855; cv=none; b=IeEySXQT2o71yKJy2iOb1itYawo3J50dXd5a+8xl6Fy1OdoEwPJDlxW8l2HCgyW3jD5Tbywp/yjKHrI30owiQVoTflIbiag/NfV05RoX2B0gRMAxTvvQBzURO8kUdMJLtdoEGPcXd/UHXUdSrKf32Vsra44gEXXvoTXwhb4QsvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345855; c=relaxed/simple;
	bh=EKLaxwBrB50GWRQ1WzeDT80GjWtojq6PlSBGlmCj6QQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+9i5fd8hsdg1eNVhHs/PrjTNnVnNxlet2Th0rZ8311AnUcMrloxZGzEsylgp8as6BCmfJLYLG5je4pNLDXufU741zrde9hQK4j3jJY2h9UA4W+due2rB8F5FVhQSFuEzrRBlw3/yh0v2wyCAhxV2uZ8Vd01H4dMGk1w0k0Ptvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yO180yNd; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d22fa5c822so19483501fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345852; x=1708950652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hlwtv8HHmQzS575dzwLezHfUxs6dYPZU5AK2+ElAWo=;
        b=yO180yNd8gKpXtgxd63ucXZ88wv8e3ShiJ/uLAjAaaXuIOM00/T/M6LyeVcIyD49eB
         4MGMdJRG6Pm/MClaxH6ONQ8kvGc8+wkvrTTKQJVgbOKVSffbXAZmxQ14hzJSBIAAvNDg
         SFbp8U8PeJdnWgEDB1CQeyj9pf22X5RTi1Evqcc6iE5Yw2dZMHZpRMaGqqziLe+opSAp
         JtoOohbMxq4RNcydSL/1MDqcwG7Y5VQncLaeh0OEIf/Ct11cBDCP6cvzrYtFB1yqHRg2
         24cVEOqt/Ar/wn72IYEoDFKQykQCeI/x4TLp5cVgyi2gECZufnH5kDg+xP628e4+q9fp
         S5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345852; x=1708950652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hlwtv8HHmQzS575dzwLezHfUxs6dYPZU5AK2+ElAWo=;
        b=THew/eJD4g4Ohjt+7BBIKx6JmG8tYXO1YqDqk38NOoXvrSIIigS2cmeZzv3j6AJvSZ
         g8YIJzdoTPPRwjX2lc8Z6e9oTEOyN7TRZDb4WlYooFRj/OfGFDDhbBMA2vqzl0OOSzTd
         8xR2OH56o+kz2qdyFgOuKEzyMdrgkNRDEPf1wXZvXWmQEIia4WAar+TAggm5/R4SgJSE
         mRNZll2+LHlL06l5gp3ZDShGIAXNRIinzW+XY+b2O7kjlxv74laevjK7Qrg9LF5C8Mlp
         OGvZlC7XrfLWWZrKorNZbrzhPehQkarSkCNzdwZ0/I3fPHqNIG3QT49xlgVNfwwwDuKa
         4W1A==
X-Forwarded-Encrypted: i=1; AJvYcCVAjvuJ5NXTTCtFHzpBLxIV8k3dln4oYe9I7vIpSEOm4cX2CEuiIPv0wxf5EU9Ns0aJgWV3/s0Gia1dr2cgeTfgcO++FMyKFJgbg9aYaQ==
X-Gm-Message-State: AOJu0Yyf011dy/hIiLVujNk5vXCoGTFQAXqqtXNqoI0mSyWKGMWtcdhb
	F+p9h0UZvd5dbUqKFGS4IaJI2OmqFE+eBtlSDvEy+fhSTY6MJ5IK3Rb7K/wqCno=
X-Google-Smtp-Source: AGHT+IE0jfz4yHK3if/jDmCGu5CgI0XKOOQubHh6KWwBe8w3ElmHhuCgl7ia1FSM7je4L7aFLoWbQg==
X-Received: by 2002:ac2:5f70:0:b0:512:aa1f:669 with SMTP id c16-20020ac25f70000000b00512aa1f0669mr3244373lfc.16.1708345852317;
        Mon, 19 Feb 2024 04:30:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Stephen Boyd <swboyd@chromium.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org,
	seanpaul@chromium.org,
	quic_jesszhan@quicinc.com,
	quic_parellan@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix the programming of INTF_CFG2_DATA_HCTL_EN
Date: Mon, 19 Feb 2024 14:30:40 +0200
Message-Id: <170834569504.2610898.9861209755234701937.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201004737.2478-1-quic_abhinavk@quicinc.com>
References: <20240201004737.2478-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 31 Jan 2024 16:47:36 -0800, Abhinav Kumar wrote:
> Currently INTF_CFG2_DATA_HCTL_EN is coupled with the enablement
> of widebus but this is incorrect because we should be enabling
> this bit independent of widebus except for cases where compression
> is enabled in one pixel per clock mode.
> 
> Fix this by making the condition checks more explicit and enabling
> INTF_CFG2_DATA_HCTL_EN for all other cases when supported by DPU.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: fix the programming of INTF_CFG2_DATA_HCTL_EN
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f4a67a3894e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

