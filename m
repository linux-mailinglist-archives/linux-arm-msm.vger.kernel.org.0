Return-Path: <linux-arm-msm+bounces-35242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A97FA9A67F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 520EA1F22854
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7F21F893F;
	Mon, 21 Oct 2024 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVJJHWnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584D21F8905
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513077; cv=none; b=KJQRAAbk5XGl6fpfWDQHBUiZFlc49AkogjlDfMsIHw6g9CRNL3pT5WeaXpM3BNffnutsgniNV5JF258uLNXX0mBdU9c5hXcfpYQUJzIFZl/BYirWtpjpK680aMDwD+bdZxIRcdh/BkMA/dschp6uG8Kt6A+ejs8J6/PxiOcGnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513077; c=relaxed/simple;
	bh=D9V+xTdETJ8ksaQ5r5b/gY+O3zvjqoic5a/qlmpRsW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T3hgEJIFsRriafXtMDox/JZawEcS0adH7Gol1rq4pBVlhAs+ikBwCqFGrSalH5e0XtomThC5TqYIuU+lEkc2LwpBmtaZIIpUE3Aj7G5LJ3+F6ze6LAy8ZLw+B0x+mueTauKnO4TypXStDr153dwppcBFvdtK/Pfi0SmkHke47b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tVJJHWnT; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f6e1f756so5065605e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729513073; x=1730117873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++p6IK2xyUkmxIiDtF8Kg/j4cQViLTJqoFU8d2o1atw=;
        b=tVJJHWnTrNT8cTlWKDsDbJVxXw1wsxXI5hXj0vdxiCq4qpGbOX0zG47qGvJDkudmZM
         uoTBKcGj73Be6DYytuGCsCfQHhWB27WgAim2dxmFsjWjh6lQAkduDgv0QDRaLZpH9YQj
         +5BoUZOBL9blJ8+1Bf7sHd10HVcBiStpRgiku18EKjaK4kXb33BN8d05ZyjAjs31pxBx
         NlKphNml6dqTGf305Uuwc/XdHL93iIxfm5ABDU9+JpFp2btLeZtXnAQeBOCXbAbC+zfK
         Xb6sHMr33D9zsiS3rDwTFqQ59HQ5Od8sIHV3urxH2BNGQ+XgbAozGLJkt7RjGbk/2aau
         KUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513073; x=1730117873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++p6IK2xyUkmxIiDtF8Kg/j4cQViLTJqoFU8d2o1atw=;
        b=phBE0g6TgI2PRhAwY3S6jh8DNzTYuGEk4rembUrVDBYvwzSqdZ4FfzJT3rLja/C/a6
         qmteOOBy7L6ng+xA99cDS+5P26oVcEIQbtybgMWp/sccWvCsc+7woYD0VFkca9oAuJAK
         Av7KKWU+llti7vUjqVg/fl5x5eeEJqV+goJ32gah7cZsqoiu7GrhjJI/pkDaFgal4Mfn
         UtPKcJuaYaYUoCMPVaiLOWonml+jv/tg/Xc2ilLonTFmae7rNVtbQ7gvWoXP+m8XRtoe
         cNj7BAaWw8/Oi7C+KyVt6YvTFKnE/gbSYglsALy5s5hyYPG4VvsFp+OioyWGUMUOY+DZ
         6zKg==
X-Gm-Message-State: AOJu0YyinIR/V7Ea7UrqfEUHfqkm0UX/ammftD591eZGqKKXZ9EBDqe/
	xG955WOZ0vplb4kNMhbB5t+fEuaWG5GdfCzA0xHqJOi1MKbC9v/oaA4+i1yz9EU=
X-Google-Smtp-Source: AGHT+IEaBDgO0bJNd009iFuyYoVj9ZrfomLRDAMi/yxMGgNzbZQlm++57S0iUYR+s+bCy7ZAO9vNng==
X-Received: by 2002:a05:6512:2356:b0:539:e317:b05f with SMTP id 2adb3069b0e04-53a15229d00mr5612912e87.28.1729513073320;
        Mon, 21 Oct 2024 05:17:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:17:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: vkoul@kernel.org,
	kishon@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	simona@ffwll.ch,
	abel.vesa@linaro.org,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_khsieh@quicinc.com,
	quic_parellan@quicinc.com,
	quic_bjorande@quicinc.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	quic_riteshk@quicinc.com,
	quic_vproddut@quicinc.com
Subject: Re: [PATCH v5 0/5] Add support for DisplayPort on SA8775P platform
Date: Mon, 21 Oct 2024 15:17:42 +0300
Message-Id: <172950935864.2053501.518573859877352853.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241018070706.28980-1-quic_mukhopad@quicinc.com>
References: <20241018070706.28980-1-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 18 Oct 2024 12:37:01 +0530, Soutrik Mukhopadhyay wrote:
> This series adds support for the DisplayPort controller
> and eDP PHY v5 found on the Qualcomm SA8775P platform.
> 

Applied, thanks!

[4/5] dt-bindings: display: msm: dp-controller: document SA8775P compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c51ff89a8139
[5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dcb380d19e58

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

