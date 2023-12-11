Return-Path: <linux-arm-msm+bounces-4230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3169B80CF56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6286B1C20C58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE954AF6C;
	Mon, 11 Dec 2023 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fq9dwi5o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8913DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:21:29 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dbcaf854e5bso301768276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702308089; x=1702912889; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/6gM179AhgbJYgtngtZQEEEqDaJNXVBNn+YvWsmBBJo=;
        b=Fq9dwi5oLIuAigPTV6XMIKmkWjm+9PYc4RLZd0mYDT/rtHyHHeqkQ3HYWM0/4BkCBk
         BoSrS/YoJWlIKWLTuXXT1VjrQcvyry82VNaC1jmJzH0TWON2SN1rgnNzqudu+twyMDsZ
         Y3fuVKRndci5VksUqJFGRv1lg6pmwpGIXsDpDzgUSmlDzox7V+4w2qaDJF2psEVt49sV
         pTyvuMmFaI1UDVdXxOMqMNoQuVPJCDvVzshbgZ2hfj6Y4m+JtDwklGkWBZ/YgsG5t8nf
         Wxx8eUCGNbjzgrIG/76ol4gbnQdT5C0BlPxZpsvZZyV5VzmGxX56pLtv1MH6nkePi4fq
         YfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308089; x=1702912889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6gM179AhgbJYgtngtZQEEEqDaJNXVBNn+YvWsmBBJo=;
        b=gmS0VkqjUdp6QyyTLss77q6Ysdw2Clp+4o42gr+wyuk6U4Thpq+K1YTwnnrRyVG+dk
         sP+ePCpkxY6zE5atxEg740NeUtKUzxg/e9ztp3ZiY1zyGE2XidzKXePt1eB4V66AU5HQ
         ccSQ7yWyo8dQ+oUF9IpJ+DL80NAD6eM+JtPEtUtWvj//oGmqaMpk1jrBpgHtpAcw8rvj
         bnyBCaFtKDHdiwgx8+rihnJ01+7UY1IyAl8xJnTN0bvqSY3MWxk6foTmLXfvClbi13CS
         3UEN64sM7miq1KlM26ffB43yPkv0K2eb97lKhxiaIAGmoig2eAu4hAemhJGcT54T81kO
         T6Yg==
X-Gm-Message-State: AOJu0YwPayuNwbzhtLvqv6Q6RE4N9iS1Gdjw6LlPg4DniAqfdF8hij9Z
	8VoPrNWyk7Bs/3LjantOknsIKswQGMnrsICvw2wQRTjD+BCD12Ci+4kRiHSP
X-Google-Smtp-Source: AGHT+IERgX/N6WxJ2f7s+W1y4IPQCtA9N5Au3g8U83QTHBFu4iTUR8qZCwcvhWlqECUYpewXIMLbccd5Gia20X1e5XU=
X-Received: by 2002:a81:dd08:0:b0:5d7:1940:b373 with SMTP id
 e8-20020a81dd08000000b005d71940b373mr3793149ywn.63.1702308088859; Mon, 11 Dec
 2023 07:21:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 17:21:17 +0200
Message-ID: <CAA8EJppn9=jwPL5WhK4Cr5Z=OKG6gVicoYq_x5YJ3eakKmyZUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: remove extra drm_encoder_cleanup from the
 error path
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 16:54, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The drmm handler will perform drm_encoder_cleanup() for us. Moreover if
> we call drm_encoder_cleanup() manually, the drmm_encoder_alloc_release()
> will spawn warnings at drivers/gpu/drm/drm_encoder.c:214. Drop these
> extra drm_encoder_cleanup() calls.
>
> Fixes: cd42c56d9c0b ("drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>


-- 
With best wishes
Dmitry

