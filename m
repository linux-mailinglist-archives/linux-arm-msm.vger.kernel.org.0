Return-Path: <linux-arm-msm+bounces-3117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2F8022C9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66FE91F210A9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24ADBA49;
	Sun,  3 Dec 2023 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3Dt6dH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434FF9B
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50be3611794so1526934e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602797; x=1702207597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYGb31/GvDPJsBFOKGrOafxuEsUy0gUvwyHcMJDnEIw=;
        b=C3Dt6dH0GoHne2XM5ZxLsDV5OeQAJQb114Db7l9SsOSjdYjLwFJnXP55eq5NQ1t5Ju
         H8Xgorfwpi6c9dKqrk4A5jHEMzalY3NGNMGc6l0ULDpn5Ifno0M9qM0P1Qg1UgvxqhLr
         EZQ8c1l59Rrdrz/5SG+u6Qc77ck3iT9RIIa55CM/BUHRav7ggZNc3kqJTPYhpYUT8YJt
         wRHGSWmsDFB2IzcaifzkEtMCc8IaKjf4FZXFa4SEOsd3AtRv1fkaPr4dFjmjxfoH4oKO
         ASb0hkQzr2XNFOKTZ5Nl6fYUPmYffxqjviaMb/qP3PU3ImPPgL9ANwVxiPcN1fExFk80
         07bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602797; x=1702207597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYGb31/GvDPJsBFOKGrOafxuEsUy0gUvwyHcMJDnEIw=;
        b=Dc6TesMLL1BLnpZexSkmSMPF1eeuyy/P7xt1XlC/cJd3s8X0s2ygBRP0VzvuGC70rY
         ziunnd+47a+XZLLtk/CZWo0e4+xIVunsb8f6BS2jiDXKHW1bQKj1ift4Gon8v73NkQOQ
         n0bQJVJs/UIHXeZj4LJSi/FmtR8POyUmvY0IuyonPsqgHviH7dIZ5354GPKv++3Tg+fG
         /aUvmk1oAsLapn6G8BlYefC52NzlGh2aD/tWUM7tian60bt9vQ4fJjaRg3LYKVgZmIcr
         x2huukm3JKLYtoHTkJ1mkGycGIwmj+dTnHI265qtOZTGQ1sLhKIdwvIqo34ewgdLfS+e
         5qRw==
X-Gm-Message-State: AOJu0Yz3ZySqeinqOiHAKR8erND6+iBtdYYlmkqNyoLGPKxEJKHYUTXv
	o1D9oZB8leLlbFWR1THnHNNFjQ==
X-Google-Smtp-Source: AGHT+IEizxhWQJi3VQazccosbJ0mirj6XMMfi7nH6/rfvt2MEcHPNTAfYO5Vehd0QrtjXGShm8OT5g==
X-Received: by 2002:a19:ad4b:0:b0:50b:d336:3170 with SMTP id s11-20020a19ad4b000000b0050bd3363170mr1969173lfd.12.1701602797619;
        Sun, 03 Dec 2023 03:26:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] DSIPHY RPM
Date: Sun,  3 Dec 2023 14:26:22 +0300
Message-Id: <170160265537.1305159.8541320986435504084.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 Jun 2023 13:43:19 +0200, Konrad Dybcio wrote:
> Some recent SoCs use power rails that we model as GENPDs to power the
> DSIPHY. This series attempts to make such configurations suspendable.
> 
> Tested on SM6375.
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3d07a411b4fa
[2/2] drm/msm/dsi: Enable runtime PM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6ab502bc1cf3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

