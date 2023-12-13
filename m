Return-Path: <linux-arm-msm+bounces-4485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C005C8106B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A4752823AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 00:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D886110F0;
	Wed, 13 Dec 2023 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZzmm5pY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1585292
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:38 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50e0d1f9fe6so791545e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702427856; x=1703032656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcCa5+8uedoJBpp0MnZ9GK2xI8dvU5dB8nGMr3vqEDs=;
        b=FZzmm5pYEk5h4NYC40Z9GO7ZR5iHB4lOlNg1KhCj2Npvk/gfKr7RVRLDXHM2QO5pJ5
         aaKXnDIG9n4uMdtT94lCbPI0q4gocTkcanx1P3RzoN5dOnOksvpJiNuVt/XSRLHKD7B4
         PQM2TuIQbcB/ngbzEBenvHPK3tNBM/y8IlvppRqRhXeqk3HUSLkrwxpYHJ38zMKKP16S
         ySfqtOaRn8IKDAL+aRumRql9HdfUE4hw9f/zEiUPjqYhXuj99+/VOjBA0GQC2TbnFtVs
         rmpqI6/SOP2gOSt48psTyQ3aGgmW+Y6XLKH7bgXb3Kb2uI/cMzjXiv8Hv2OQGYo5rW6U
         YtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702427856; x=1703032656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcCa5+8uedoJBpp0MnZ9GK2xI8dvU5dB8nGMr3vqEDs=;
        b=UOqyUKavX8WFX55WVR70G4rMl70h8NgnQ6J3TIVNw0deyJMJ8oFZ6a3li3SeHQp416
         myiFjuo2MBg+QXPUE48pmQktlU+8buMuA3d+HfABkLA4le4g+y3XwX7/pnq/PuTPHkBX
         o9HrmiYp8VPmgr8rQzMUGMHa8n47YOiS00ODZ+0+2gNLyDac8fjQlBGv2mB/TxBlrbEY
         C6NNLZuLkEG2615Gj8TDw6JYd3c8/oQFLhyYzuvWBMu0iHZk7bOenek9EO7zeRpfFdUV
         RM2LQC0Obeut7iPMcjO/IcIRtKk+2zq2JbGUXUs+DnlHwFGxoKyqmBmWKWbdOg9FYanK
         BxEQ==
X-Gm-Message-State: AOJu0YwB+4Bw8Euct2zSfRSU0aK4hAui1cLJbUTpukP9VCSyoCANCb0K
	OKULkgBN4rxA92GiLl0yRWGjZA==
X-Google-Smtp-Source: AGHT+IE+GQRoA1ZiyYAq2jc8Dda0H7QIS0w/1Sgg45+lga/dxNeYCdMHKNs0gNMWttXKUS5dDgrAcQ==
X-Received: by 2002:ac2:5585:0:b0:50b:e635:be52 with SMTP id v5-20020ac25585000000b0050be635be52mr2676783lfg.78.1702427856319;
        Tue, 12 Dec 2023 16:37:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 16:37:35 -0800 (PST)
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
Subject: Re: [PATCH] drm/msm/dpu: remove extra drm_encoder_cleanup from the error path
Date: Wed, 13 Dec 2023 02:37:29 +0200
Message-Id: <170242755503.12964.6049183129158135242.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
References: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 17:54:40 +0300, Dmitry Baryshkov wrote:
> The drmm handler will perform drm_encoder_cleanup() for us. Moreover if
> we call drm_encoder_cleanup() manually, the drmm_encoder_alloc_release()
> will spawn warnings at drivers/gpu/drm/drm_encoder.c:214. Drop these
> extra drm_encoder_cleanup() calls.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: remove extra drm_encoder_cleanup from the error path
      https://gitlab.freedesktop.org/lumag/msm/-/commit/014a07f72a33

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

