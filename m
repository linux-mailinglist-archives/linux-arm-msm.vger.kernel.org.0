Return-Path: <linux-arm-msm+bounces-3803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22F80989B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97FB71F2116D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AEC1854;
	Fri,  8 Dec 2023 01:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPuUou0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A091717
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 17:25:22 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c9f62fca3bso19549491fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 17:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701998721; x=1702603521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cB1OKrbRDLzBqraa4AEj/IskXYNJ0qKZbmReSLdVQ8g=;
        b=mPuUou0+EhHZPFEOxSH1fTrUZrVvupMObVatf3uQJT8tQ0cBIFbUXSb28fkTz+tCkv
         mGzXJtnSgwl30MGg0/utaly/A3G4TXkympRvOThg68lpCmIO9o865z0YjbGSkbcOo0DE
         DZF83Qr1qm/8Vomj5dWLCF1z2jmCa3ufF5YxW9IFaOzh86U5YR3gjYyrAvSeDu+C4jfB
         hUl6a92+OCjTuEusw/ZFw8c6VR5R3Cwy1GOPg71Pwg3xb5Gj5EJWdEQ4B0Hgcj1DPiaz
         bvIo97F+BgbaqazpfQhw3NgXEx9TSVUbuMzqXeMMss4BWAw5gWvqyX3HK0xwgeB6b2dv
         bP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701998721; x=1702603521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cB1OKrbRDLzBqraa4AEj/IskXYNJ0qKZbmReSLdVQ8g=;
        b=KFSBkVGt6DgcL1dZnl6MrEo0j73haJ476fMku7hmBkmGiXJvPzAfBym0/4VtqXpRHO
         mur2u3ARo3htaR/oMqsqCEXpts0pYCzertZ+aBhtXR8zBL2q5J4prrMsN3vqpZvFHA9y
         AUtwu9GRaMTwR9weFGQ4kZNJxVc0t5ZxuHqnMpNo/eLc3LH3/v/LnnuvL0we3NgqtNpI
         XmWC/fDyBi7hVOLJ0slGFVSGyZBfFIeoy765BXhi7uQHLm6C9/ScxJ3G3dFGVKVLuGdN
         0rYsCgbTlSVKD1dE5dIeNup5VhTlnvdKX30LoiYh7V/wG+F0hTPt5ZhEIm6CSQ0xJgSd
         iFow==
X-Gm-Message-State: AOJu0Yx+etHq7dlS/eTgtQO98FQBy0p6xcRIErRedunT93kLMtUP4No+
	PXgbUJ9BHezhT+9/G/H1tuVOUw==
X-Google-Smtp-Source: AGHT+IEG32ibemvnVqzQR03JIJcqGTySxu7bxTXGMkWfda4JV4s8UhuVGuCzkuvEh1tmv0A6UKKcwg==
X-Received: by 2002:a2e:7410:0:b0:2c9:fb42:cd28 with SMTP id p16-20020a2e7410000000b002c9fb42cd28mr2201824ljc.6.1701998720821;
        Thu, 07 Dec 2023 17:25:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g26-20020a2ea4ba000000b002c9f58169a8sm88639ljm.120.2023.12.07.17.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:25:20 -0800 (PST)
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
Subject: Re: [PATCH] drm/msm/dpu: drop MSM_ENC_VBLANK support
Date: Fri,  8 Dec 2023 04:25:18 +0300
Message-Id: <170199868359.3399536.11819408317863820491.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004031903.518223-1-dmitry.baryshkov@linaro.org>
References: <20231004031903.518223-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Oct 2023 06:19:03 +0300, Dmitry Baryshkov wrote:
> There are no in-kernel users of MSM_ENC_VBLANK wait type. Drop it
> together with the corresponding wait_for_vblank callback.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: drop MSM_ENC_VBLANK support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d4c74a150cce

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

