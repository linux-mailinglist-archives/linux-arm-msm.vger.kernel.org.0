Return-Path: <linux-arm-msm+bounces-4490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B60BD8106BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DCA91F2178D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 00:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09C515AA;
	Wed, 13 Dec 2023 00:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="so9U7L81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C041ABC
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:42 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bce78f145so7318354e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702427861; x=1703032661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyawuRNxUOJx4krMuVIPeAGsZD64pCzULSxldkl4c04=;
        b=so9U7L81tX9wygfCAlf5taDnYOo6Q7aQPEvHp0Xe01TxPXm8X8kwVUsfBzSqyFWAzT
         mHjbZPjsOw6/Jidc0fgAjoorMoXZvEwQV8iNco6yMbKihaURWWK40L/w/Zw5N3cZwfac
         /jonttLThDQwgtrOdDV/aTGtPKIcsu6TCsY5sT5jvjQemwgjZSLLJQC7+j4INLzsYAPd
         saUPO4lXk2jQ6xkaLTdwOw9XSbu4Mb1Q1vRE/CxeM+tWfHEUSqqJgyQC345ZkDQMbY8Z
         l5gwV+o3lui5K+dIlajk2NHF5YElsE5t79PE+7HCQ8t16IYrQLW/QVMeTGGbQVhp8l+a
         SO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702427861; x=1703032661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyawuRNxUOJx4krMuVIPeAGsZD64pCzULSxldkl4c04=;
        b=RXZTC+VDSZAboZHW0xNwECK6P9aPdvsuGPQkqw8qPgWDmQOMJ6Tb9i1sa240VMNafj
         YHyvRHgD1oSg6beA0mkEQFUN2OdLGKdaXH1J4zQW68KEooOvoYqC5qTAB6vM5Qu/irY9
         vow+Z4+rf9I948piDmkizMLtw5zltpx7BeCD6sk/+aQcVI6O0JZkjtWVFbHdm9DQWaNg
         8YqRsLl+MGazHvhtlPsUDTokdcAOsoOtNevCPiNgJsPnLfVDCsI72kDdhJfAI1oAIfgV
         esXrz/d/VVnBk9wu5Y1PjS9QAem+nxUggw5dR1VbWMNl1G+SLnepHz69CWgTExyy8NhL
         a7Xw==
X-Gm-Message-State: AOJu0Yy18Er9S0LF0XBYzDTLW2bfpu+V0yIyHrfDl2le7Aj9sVTeAG4n
	xeIY3Nw7L1vntLgphcD0bZ+QyA==
X-Google-Smtp-Source: AGHT+IELJg6xtBV3YwWzHW35+oAMMuqoqq9emUlpwuefa9mMo13YdC5VxvXXbHCtbJlZxVgL/oczQQ==
X-Received: by 2002:a05:6512:12cb:b0:50d:1a52:7760 with SMTP id p11-20020a05651212cb00b0050d1a527760mr1929464lfg.149.1702427861132;
        Tue, 12 Dec 2023 16:37:41 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 16:37:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Ratelimit framedone timeout msgs
Date: Wed, 13 Dec 2023 02:37:34 +0200
Message-Id: <170242755506.12964.11418268791653188536.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211182000.218088-1-robdclark@gmail.com>
References: <20231211182000.218088-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 10:19:55 -0800, Rob Clark wrote:
> When we start getting these, we get a *lot*.  So ratelimit it to not
> flood dmesg.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Ratelimit framedone timeout msgs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e37cb117b819

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

