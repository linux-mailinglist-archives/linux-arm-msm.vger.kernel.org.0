Return-Path: <linux-arm-msm+bounces-11667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC9885A351
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C4CFB22308
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB25631A61;
	Mon, 19 Feb 2024 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o30itB6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139D62E856
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345848; cv=none; b=IEDxTGvqUE9YpnzG3wT+FTTYxuUKLVCPMSHjaA/2qkPCNzAWsS65pBg4yFH3I71lAQjw/LSCl77pi3Aqtu3ZRHsymyVd9RuuQ2ij8u8Lxhus6Ul5Uv4+J257F1vavB2/i/AnbJ3QnSdXIpkZvyNL6oSlGoneNrH2e1rMIWURZ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345848; c=relaxed/simple;
	bh=GJgOGooayRDTyLr6i4tPW1k7jU99Mh6mP6UBWIsy4FQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=So3k4Dn+q7Nmtoq/GHipvFkvNI2P1mn4+I06OKFnZWyfyFGkidj4SWFAGtZPE+0yXWPqeMMmBnZdrA/maAnEKDRvOXIvVH2CbqBOsPpeGQynmXFz8F/QfodNZEw9LuBG5fGpK2q+chzV/FUddUnC261hAoqiu1ZkjC5yQbicCzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o30itB6h; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d240d8baf6so5446231fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345845; x=1708950645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TU3RgHxGlzb++qXf2E7iGo81GOpfMcen8bTfd0uPCOw=;
        b=o30itB6hROinxdtx0Je3Hup037sap3JLVjyBRA4x9HrbbKox7jwfFzuM5cBiY/OxPL
         yKb298cm4ib+RQ580LHp9DT7e2jpzQuPKo8xBkj8V6MRuTFTya4y1ftb+s6NtUqjmXyJ
         Uv/N8UTq9fyONETjXpkMS8F1G+7BWQydrEYT4k1/DhC6Q0q43KejDPlhNcY52UWQKK0N
         KJp3uosJXih5LSsGSbgzBlwOsnn0COSesOBLtyEZVDeW2wq+EOELXRhjNT9qwgtYFjkS
         Ut2+Sm8C+nmc+rDuep8cMx+SSg8ezPR105iEqWizD6j333/2mKPAPX6ruh+OO4Wmo+A1
         eJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345845; x=1708950645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TU3RgHxGlzb++qXf2E7iGo81GOpfMcen8bTfd0uPCOw=;
        b=IaA76Tx28FEEP3UR8er4T49rFhrquXrjUuTTCZoHpwEnWqsxjF7qGv4uDvem3iq6f7
         Lf6I7tU96CjWX4CJ2TCK5nPMOw5t4YDNktFAtxZ9zQn0873sIvlOXj21gIsQnWb3FkDw
         b4XnWqaq7Pf8GxG+kOZxLCQ49l5JTBcysAkenLSm12s7R/rLKQU0Y/HUjAohlojloKvx
         RoGmeZULlpgRRAXmZlxPq+sWgtX2xr0C0opjpJCqpck+PzOkBtZiPo62zwRQ67RpGeUv
         u8SmN2YqmBWd8RoaK6Nm96Q2XT8PUQ0LrpKdPzDHYsN920vFEHE+wBZzzL8eBUyWwmGH
         lVwA==
X-Forwarded-Encrypted: i=1; AJvYcCViUKdXTdaLOW3UN5CD1Hw76ZA7XYI+DbOnOzln2yLVY6g5D/ISNSvIfkbmPtbgsxqbNHe8bpdpo/7FY5/L31pj2NLqHcmYS8DbrtofXg==
X-Gm-Message-State: AOJu0YzPmR6QA0it5PyDlHpZKVLtoKfj+Axa1x/EXTn8nidMzb649x+p
	q/2jGk3dd12lGXFWNZF8nRH6Z9b20wYMtlrWRuQHfuB/Z40Mbjbj3iZ7sq9tclI=
X-Google-Smtp-Source: AGHT+IHLK/rYF6Py4Eo3rBlxE89glGNXj0zjcGYdPTtAeNi/U0O/DpqKeN1TdI78YmnZYby2duc5vA==
X-Received: by 2002:a19:5513:0:b0:511:b3fd:76b0 with SMTP id n19-20020a195513000000b00511b3fd76b0mr7566336lfe.23.1708345845307;
        Mon, 19 Feb 2024 04:30:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm/dp: Fix spelling mistake "enale" -> "enable"
Date: Mon, 19 Feb 2024 14:30:31 +0200
Message-Id: <170834569502.2610898.13062983632738279958.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212091639.2397424-1-colin.i.king@gmail.com>
References: <20240212091639.2397424-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 Feb 2024 09:16:39 +0000, Colin Ian King wrote:
> There is a spelling mistake in a drm_dbg_dp message. Fix it.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: Fix spelling mistake "enale" -> "enable"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fb750eefc492

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

