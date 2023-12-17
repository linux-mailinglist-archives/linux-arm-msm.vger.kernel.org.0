Return-Path: <linux-arm-msm+bounces-5088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23854815CE8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 02:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 289CCB231F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 01:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7577FA;
	Sun, 17 Dec 2023 01:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nyURErXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131187F4
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 Dec 2023 01:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e277b272bso766221e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 17:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702775096; x=1703379896; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hl782NtFmKPulrM6nPcx+9M9EkIbH3sXgzxwfUjhxxY=;
        b=nyURErXzBUnouIv8PEWeI+P546ELIriR97qBAAL/y/ErU6MPmwQ9kTXSnsHhWTPEqo
         KEGrfsKpQu8BSuFFjueEdSRfHNvWP91GE7ZoDkmOOb0kYHyE0JkVUq61I67s+DQ/ZhK5
         EkBYIw9FNJVeuwZ6i+hg3Qv8JrbPw5B6OaA6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702775096; x=1703379896;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hl782NtFmKPulrM6nPcx+9M9EkIbH3sXgzxwfUjhxxY=;
        b=dHFK1CBWUcLM7eHlgP0ONMX7PF6X0VN5BwEfEteHAmZv5f8pfVOSh3nRolw5X0Aju0
         48Yqtv1gNgNHPRtu+Bj1N7O5gPNR227yDI9gThKa+DYM7ILYMf072Ne+x3LIZudUN1gH
         DCDZO8NHbSLaUcC7WFL3mBiSzqSRyE3xpilJmlG6fmN8jiTJ2quXATema3ypkySAeKGd
         wXvISxtfLDKYR52vc7pr+3OCBkpNV7T9dYooUvs8oTHBdYumT8Dpj7FzJVRuprH1xQBq
         cT53YUPY5cK3tuxbIjHnW8GCTqBqkd5SCCB3Vu7iQK9y9153SufNVfEsWex+UqvsZjOe
         cGwQ==
X-Gm-Message-State: AOJu0YwBF89K4JrQJwucyq91Av9fAiQ3F6fGB+IYOBfk36yoPaTL7sef
	dN8Gq2/S0CjcIFEvuVgy/+aDuhNQtr0qYXW0C43DbQ==
X-Google-Smtp-Source: AGHT+IGI/qIxJ+tAk/PNQNrLNhT7HuVcrrKpVt70q44XRpAb37rhW3MUD7pq1ZTc5wUOEpLk5A4wOU9udQLAHzJod+c=
X-Received: by 2002:a05:6512:b95:b0:50c:2177:f184 with SMTP id
 b21-20020a0565120b9500b0050c2177f184mr9901201lfv.17.1702775095723; Sat, 16
 Dec 2023 17:04:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 Dec 2023 01:04:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
References: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sun, 17 Dec 2023 01:04:55 +0000
Message-ID: <CAE-0n52PqzgUJjvFZdURKvFCN9imR-bGxqadtphwkBf5XKJZDA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop obsolete documentation for dpu_encoder_virt
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2023-12-16 16:01:58)
> Drop obsolete kerneldoc for several fields in struct dpu_encoder_virt
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312170641.5exlvQQx-lkp@intel.com/
> Fixes: 62d35629da80 ("drm/msm/dpu: move encoder status to standard encoder debugfs dir")
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

