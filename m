Return-Path: <linux-arm-msm+bounces-3521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 512B1806AD5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 10:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C838281245
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 09:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B921A713;
	Wed,  6 Dec 2023 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jK55APV8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE011A4
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 01:37:32 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ca1e6a94a4so10031181fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 01:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701855450; x=1702460250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ItQcBmsL2r9XZ0WMeX3boO1FbhGGcPGgQWg1e57u90=;
        b=jK55APV8S1avrnBb6u+OuUDfzvwYnUg/4Lp2ekhJc7lcPQYA59joRAyT/+95F7TElc
         nK663KmNMtGfHhMLn/ltKZX9BRiT9d6YmE4iIW25/cmJHLXnBhlZIrMd2rD+IaxDh2tk
         C7A4d+Vcgz9WbvOt1ixiuSB+5eMxnmx8hIceHWY3QKl5LgVla+vOYF4cvmsl8MzisxX+
         4O11qG3zQ86XRt99/GeW8IMqC4UmBFf6brhi+uGo5/vc61Kj2jfJJPvY4u/xernJDCxu
         vf7znwuxbnqM7sdmqs3zBqJ1d+AFF9NhAKDirCzKhQGosyQiuNg0ySmbpXpWKp3U9VYh
         22qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701855450; x=1702460250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ItQcBmsL2r9XZ0WMeX3boO1FbhGGcPGgQWg1e57u90=;
        b=J8bibsQiegU/t2m2X5enKrUx1UCTxouv0TCK7OQUXaXV1FCd+9UX51YvWZldder5WH
         0ptx5w3va03XeTtP9eI2hUOvOHZ5DY5w+VDy4qhr0zyb9ah5FiAtsvQYZLJOhsk5A30K
         GYslfnWSzl14NzGAxtcpPDHcSyGv03RiESS6j55iJuO/ziH81haCyctnDsKZXHQGj5YJ
         IeYnMQh8IqssQrD2KmlJpBCHppt1W4MgEgozJq/pAR044yEnqSU+TSBM4vsHDSfF0eQa
         CFBYYtdf3eDRKaUqdGPild8YyIZuJUmg04vYNCGGxGrVA120RPFMNJOu732KIE8q/Arz
         MIwA==
X-Gm-Message-State: AOJu0YyxXBsgp7QKZVw97HD3uyBctjj5cShDXJbCu0EpiCu4BWwFQJz0
	u9U884uqsIfzlCeO/G2Hq/1YXw==
X-Google-Smtp-Source: AGHT+IErHnk3T1QVP9AqjVyKJIvrgjfXUiwTq5TMNV8j5mo651YqfQoHFtH/DjPR2zF1KdPul9U2wA==
X-Received: by 2002:a2e:9d8d:0:b0:2c9:f8c2:574f with SMTP id c13-20020a2e9d8d000000b002c9f8c2574fmr332537ljj.103.1701855450682;
        Wed, 06 Dec 2023 01:37:30 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b10-20020a2e894a000000b002c9fbb50770sm1120102ljk.90.2023.12.06.01.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 01:37:30 -0800 (PST)
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
Subject: Re: [PATCH v2] drm/msm/dpu: correct clk bit for WB2 block
Date: Wed,  6 Dec 2023 12:37:28 +0300
Message-Id: <170185542751.1626201.5071198750166633593.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203002437.1291595-1-dmitry.baryshkov@linaro.org>
References: <20231203002437.1291595-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 03 Dec 2023 03:24:37 +0300, Dmitry Baryshkov wrote:
> On sc7280 there are two clk bits for WB2: vbif_cli and clk_ctrl. While
> programming the VBIF params of WB, the driver should be toggling the
> former bit, while the sc7180_mdp, sc7280_mdp and sm8250_mdp structs
> list the latter one.
> 
> Correct that to ensure proper programming sequence for WB2 on these
> platforms.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: correct clk bit for WB2 block
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e843ca2f30e6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

