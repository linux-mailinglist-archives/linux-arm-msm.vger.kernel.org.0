Return-Path: <linux-arm-msm+bounces-4624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DB8122A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 00:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F1632817F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 23:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C9F83AE1;
	Wed, 13 Dec 2023 23:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ujTrE0lw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05930D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 15:11:14 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50d176eb382so7949815e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 15:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702509072; x=1703113872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=410xmMh9wI0DlKXfJYLEsw8ynh9trsmOzCZvI8MRMUk=;
        b=ujTrE0lwSAOUN/1oe8O2hUcU5Y5lypIyrfDCsF9z4DSU/k3KEqlDXK1hYbJ1AXKcdZ
         8jqg8qPdadRQB/L6f/Vg227KrvJbK4eLGJdElUIigx5HcAb200Nj0RXK8srSr3g1zhah
         9aUXmyC8rvr0Itd+0Zuqvp01fr6v1C/tUkXTEshnaCTGlZ5X42pAGVc4HpyHiYL1rK+E
         azQipE3+HGwUsxxJicwQojPNN9Lfy+qkh3PtyD0Di4mrWTJWukAHiQlsZ+MxsrspWnzC
         tPQ0+Vikveoo3ngywe+DBIEHlGV1XncObeZqUjm8B0Z8Hpxzc12WCpRffd4XzaxPGzTf
         YxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702509072; x=1703113872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=410xmMh9wI0DlKXfJYLEsw8ynh9trsmOzCZvI8MRMUk=;
        b=ghYVyj64Gpjd9moZxa6vh3Pb9VLolEK6G94nQDGwVa9wkhziY7TnvLAscqe+6JuVYj
         8xnd8Vv96DvZfst9wbpTYHcNZ03Oz/YdaN7LWfl5Tr91YqKgnPfVj/4LKVE+Ff0stVyH
         uuTAhEKdbrEqPqAzm6RLdY4mYwgiDYxLx7JaEtf0//P/ude81EXaq8VSYuP700RMnUwq
         HqmLKjsFZO+zzxObN3DOQ9qO0zEgCdNCfkbtzxp6hRfow6E0e0oky4rLQ/Rf6zvHbyWm
         ljb2NPdbXwJ3hoPhwIbe0XjDzJ/gqQwnKBecTcp1nKKAcF75xMR5zzuWrB5ZBaBtpVc2
         zqnA==
X-Gm-Message-State: AOJu0YypngjbDIP9V6I9nlGvvaF4lz46Zcme8tO67hrfOak1+NIZbkvq
	qIMQxxkmXIPoRIpiUnD4JcF9Dw==
X-Google-Smtp-Source: AGHT+IFW0HTuKja68bq3+gufhbCMqXQOdE6R3AajcRo7Nwrfvtlw8J4+0aqI/UQucNrWQb8LaPTBgw==
X-Received: by 2002:a05:6512:2350:b0:50b:f3fc:1261 with SMTP id p16-20020a056512235000b0050bf3fc1261mr5416444lfu.1.1702509072176;
        Wed, 13 Dec 2023 15:11:12 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u17-20020ac248b1000000b0050c031e2873sm1735908lfg.288.2023.12.13.15.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 15:11:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dp: call dp_display_get_next_bridge() during probe
Date: Thu, 14 Dec 2023 01:11:10 +0200
Message-Id: <170250905096.800728.7488984518759894282.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
References: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Nov 2023 02:43:33 +0200, Dmitry Baryshkov wrote:
> The funcion dp_display_get_next_bridge() can return -EPROBE_DEFER if the
> next bridge is not (yet) available. However returning -EPROBE_DEFER from
> msm_dp_modeset_init() is not ideal. This leads to -EPROBE return from
> component_bind, which can easily result in -EPROBE_DEFR loops.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: call dp_display_get_next_bridge() during probe
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a242720884f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

