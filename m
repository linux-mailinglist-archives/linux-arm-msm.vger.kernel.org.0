Return-Path: <linux-arm-msm+bounces-3116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F38022C6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DB2D1F211BD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1349CBA38;
	Sun,  3 Dec 2023 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqnLKcIU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64FBEC1
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:38 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bf7bc38c0so13924e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602796; x=1702207596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DMMWg+w+KEomm3KE0TeojNDTcW3lAFkE8ZnpXQwhC4=;
        b=HqnLKcIU7bvjDGLP95U4RlWcHJd6P7rpnhJJDWnQEhF+JhX5zbAvsy0rKopRtEC20x
         bkmDGbBtNNXqOnEV83bNR4UF+gvYZ5dsDZPHl/rDOTLFlLd8S7E6n4ZODWXow6zNocnI
         NjWA1Gwz3oGGFX/PXXx+5J8H627Ux4/CTsPog/AyKIMmT/Ug+C4DRJnbL2GZ79GqhY25
         6Qg74cv1cytusAY++m+wOfh9FGMbzfjSjwGnmipEiQOmfFmSp7gBzfWqJVApu8Gx8CbD
         6IZD2EGt8EWxHn7BUFJ8B4EVPE1bgkvUUqm7jfcLuX+7zDfXLMSs79zhuRmb0Vkl/A76
         s8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602796; x=1702207596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DMMWg+w+KEomm3KE0TeojNDTcW3lAFkE8ZnpXQwhC4=;
        b=mzGinKQIPY4V5XZu3cXrKAyueRqExo07lyh+ocpdm98TC6LbmTtqOTuqUg3/Pn1jp5
         VSmNcgUA8gmpADOeXQeqNfWQCY+oU/HulKdtI1YHtJgBqkgqDJtdZ/tFtKhBhnfs78kn
         Xmyv8qKwqmKO3zBZ+s3aklwrPPgXQri9xiZoXZDRPS5dYTgY2up5AioDN0rtIKS//X1G
         JJHQfcIJTfAN1QJbSByGfuHZQ0VB/j4OYi29Um4qYy5bDelkxTkS9gssmHuseCxlwVGp
         pCF1b+kA6APt7UZkiwbs4PueCDMm+RWxSZ4edSa9H/H8kn5SCzsxYLLX0QSrp/NNTGHN
         zWKQ==
X-Gm-Message-State: AOJu0YwMqYcristHtLmS0NXe+wwcNl1VX/J9LMMx0EgtazkZnnwaTqlc
	TyAidBV6w0HVEdqZVYLmY62xKw==
X-Google-Smtp-Source: AGHT+IF9BgD9XAhn6Sf/Bs3wVNK+EAUvhkniSPZagdodJi3HF44YJ5v9sT3g28Y7D+kVvux+urdbGg==
X-Received: by 2002:a05:6512:1095:b0:50b:d764:64a3 with SMTP id j21-20020a056512109500b0050bd76464a3mr2893065lfg.88.1701602796774;
        Sun, 03 Dec 2023 03:26:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:36 -0800 (PST)
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
Subject: Re: [PATCH] drm/msm/mdp4: flush vblank event on disable
Date: Sun,  3 Dec 2023 14:26:21 +0300
Message-Id: <170160265544.1305159.14337780550682006214.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
References: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Nov 2023 00:54:01 +0300, Dmitry Baryshkov wrote:
> Flush queued events when disabling the crtc. This avoids timeouts when
> we come back and wait for dependencies (like the previous frame's
> flip_done).
> 
> 

Applied, thanks!

[1/1] drm/msm/mdp4: flush vblank event on disable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c6721b3c6423

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

