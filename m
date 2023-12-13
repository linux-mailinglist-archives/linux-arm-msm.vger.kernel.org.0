Return-Path: <linux-arm-msm+bounces-4487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC578106B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9881F21A1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 00:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A48A49;
	Wed, 13 Dec 2023 00:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IhzdJAnb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7221BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:39 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ca0d14976aso85425441fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702427858; x=1703032658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7k/V39rRtO0gu3kma7GBDeady/50PeXiMUR6JPR3gM=;
        b=IhzdJAnbQgst3fssoFz/3lSaPMi9gzpaqtQXMng4Wvd5Em2kskf/UomWI0Wptz4L3d
         ZMHZ97p20K+euuHU9htDVoTmscAZclzNO4w0N60RRh0bsl20Xp1Ehdg2pe0FWQjijaSq
         69k+m/6Qg5tSFdTia+gD1JRqHRTF+/pQNPuL2d9K3o6IqS6meLufWZtFJIzadGNUlxeD
         0xZGV5DzMqqA9U1j8MgKe+OPQOes3am6Q17a9HMNGw0WAMecy0WQKLNBwZafmhoOOuWS
         ulTV7Urlo5KIYmO2ZLpeNJyHglb13Ydt0XBrtUDK0tTTq9Rz2B95eWNVFZ5Hx1MelIRH
         lkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702427858; x=1703032658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7k/V39rRtO0gu3kma7GBDeady/50PeXiMUR6JPR3gM=;
        b=twlZgkkeZVUz10aUbjmxfqc0L4SOJEoKrB0azQQTkvI+CXI5tyeqzgBb38AisVitd9
         l83tbRaFe9zSOZZWuDwu4Zidiy8MY3AjEgVLQ/wVCqDvHeSTL2f6aSkm+fszvgPX4rus
         GGQaVb2G0RlePEHAKW5wkkwiDBWcJZIjpTrD2CKFt5QVJzO3onJubHR8RwhtasqChPSZ
         2IpdGn5N97JFlf39AR4RGMxLmKNw27biNIGH6f4Sq0cpcdiw2c2KAREYGZvl2xS08uYo
         irsIaq2fTPOSUk/STg0+ieLfrjnsFRyXeDXcqd1JAu+LqozxA7vwABOHst1COg8hlZVY
         UpDQ==
X-Gm-Message-State: AOJu0Ywsu0h3WL17PeT/THP6TQztPy4G7qMSsgOWBggqGNoVNt0H+oUp
	vdYWt16asdOFDyuhoT7SimunPQ==
X-Google-Smtp-Source: AGHT+IGE9Db6y1Dp0Tz5IuwllQVF7GN18pg+hEKPwP1GOohVNZRzQKzU5fKx57ILT9BVICNh7+Ixow==
X-Received: by 2002:a19:7706:0:b0:50c:f227:ac0c with SMTP id s6-20020a197706000000b0050cf227ac0cmr2893314lfc.10.1702427858308;
        Tue, 12 Dec 2023 16:37:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 16:37:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm/msm/dpu: enable writeback on several platforms
Date: Wed, 13 Dec 2023 02:37:31 +0200
Message-Id: <170242755506.12964.4576140189504852980.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
References: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 03 Dec 2023 03:27:40 +0300, Dmitry Baryshkov wrote:
> This enables writeback on several platforms where I could actually test
> it.
> 
> Changes since v1:
> - Fixed the CLK_CTRL for SDM845 platform.
> 
> Dmitry Baryshkov (3):
>   drm/msm/dpu: enable writeback on SDM845
>   drm/msm/dpu: enable writeback on SM8350
>   drm/msm/dpu: enable writeback on SM8450
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: enable writeback on SDM845
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d907efe518e4
[2/3] drm/msm/dpu: enable writeback on SM8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1a8dfd51d6e4
[3/3] drm/msm/dpu: enable writeback on SM8450
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e512b4a8ec37

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

