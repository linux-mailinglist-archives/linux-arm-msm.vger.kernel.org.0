Return-Path: <linux-arm-msm+bounces-3384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBE18044F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19ADD2812E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 02:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83A7CA72;
	Tue,  5 Dec 2023 02:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="syemLOAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480E1CA
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 18:34:09 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bee606265so2646676e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 18:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701743647; x=1702348447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhRAfItPAzMnDYBgmUAMNh2g7r8OB05QNjxhfx4Zxeo=;
        b=syemLOAj2BXN3gQTLGqpxwfkQNd7M9NIOFcrVGR80aIUkhypzqM9FrYT7lXSXiG24v
         fisDu0c//292GqFTP8H+Z/Kx5LQFF1S8jziOczasDIvqUW+ynAkry6hj+9+YcFFQyuwS
         iZS6ZpxKtc1pHqa9GKzUeqzhIIW1gePg3bqGFvgnlOub4fvloStGT09RkAtPRuH9bHn2
         avJiHLXUO9xu9Mm4CvFvzgp6dsK4wLn5x0hR8F1yczDBS9bOt9PnIVqpGZlIBwDHFSOc
         6znV7CfYHtauHgs4ExzUStz1BgFkl188ar5EA7LVPE8Z6s7G4tnfpPqhQIeyFMAdbpeQ
         EK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701743647; x=1702348447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhRAfItPAzMnDYBgmUAMNh2g7r8OB05QNjxhfx4Zxeo=;
        b=gxY+XAZ+iZSEdQNSisL+9zbZTvpPTdfK3wTUNXtHmUKGGrJ0a+1hxVfCMsddFOSwy/
         C4/TbNoMs1D7SRR1bXcF8sgoV85ktKtPAw0QL3Ll4fR2pLpsIoXUBeCcGR63TC5s2r8Y
         9ufeI/67NPkkkPhPkG/BeEQ4bljxJFo9usMN+VLAqJhCTXfeJ5piq2EsUyD2TYCC/pOk
         bdQ7PCMYOzg5GvgOQqzb9JjD5QRxEqL4UEphBR3QUh0E/Yo8rS2kZmHWVw6p2FE1aJzr
         s+HjobGzAjvlp8dlAtWgjSpx9Oipy6Bbbzx0GzjOOsKelRejsIy1xCyWYbmxZSOpiCNN
         mT6g==
X-Gm-Message-State: AOJu0Ywmkeu0zKs7vY9cGeTUgAq/80m3TfiJanpJxOxDYvJT//gti+Aj
	U5RiRq7x4bFdeXP6oLtOsfzHKw==
X-Google-Smtp-Source: AGHT+IHIN9E/fHUtnZe09D2pmxsbjqYlprqqmhLcEbCwIYJTWISDKsi1X0saj2S5NUUNl461ONRdsw==
X-Received: by 2002:a19:434e:0:b0:50b:f478:a12c with SMTP id m14-20020a19434e000000b0050bf478a12cmr1209579lfj.2.1701743647480;
        Mon, 04 Dec 2023 18:34:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi3-20020a0565120e8300b0050aa6bd6d8csm1415483lfb.178.2023.12.04.18.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:34:07 -0800 (PST)
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
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4 0/4] MDSS reg bus interconnect
Date: Tue,  5 Dec 2023 05:34:03 +0300
Message-Id: <170174354266.1582017.3052319983064321564.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 03 Dec 2023 01:42:43 +0300, Dmitry Baryshkov wrote:
> Per agreement with Konrad, picked up this patch series.
> 
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects. from none to otherwise
> inexplicable DSI timeouts.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/mdss: switch mdss to use devm_of_icc_get()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ded61d7dc5a0
[2/4] drm/msm/mdss: Rename path references to mdp_path
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fabaf176322d
[3/4] drm/msm/mdss: inline msm_mdss_icc_request_bw()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7323694e118a
[4/4] drm/msm/mdss: Handle the reg bus ICC path
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a55c8ff252d3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

