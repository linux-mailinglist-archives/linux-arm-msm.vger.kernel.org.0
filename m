Return-Path: <linux-arm-msm+bounces-4185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3168B80C4F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D071D1F211BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C56125DC;
	Mon, 11 Dec 2023 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mSClpMA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8004EF1
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:43:33 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5d40c728fc4so30953907b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702287812; x=1702892612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lz/5LWYQ9vCAAHEW2rZf7mB1bPXiSim9HfJVePMJeJA=;
        b=mSClpMA8GLjez7TY1LH9D6wNOisuedNwz0pmO2WNsnFGX7kJXZlbMoSVwe2B+zKUqA
         PSeiRQM2YnoNR28UPoFh5JmPHpF+HmJp7St3FNc0Ka1ZvIpdBLPgY6fYMvZe1SEc8Ul0
         x6ZUypYkF/3+Ojk73VPrfQxgKbBA6pjnHr9oPipmrTbryFMw3Ah9UzvEurx3feyeDG5L
         uPJ/LLFbBp/Z9+A61iW2o4NJkzwVgRiOs+2/C5gEWzOABoutJXeWgpmrAXrX6upcUZVx
         BWUnygqcHdkTneSZEtGv/nyfK8lcQKJQnTItxcLDJvKUCZev1+zXGBdE3/SfOdo0WmOw
         97dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287812; x=1702892612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lz/5LWYQ9vCAAHEW2rZf7mB1bPXiSim9HfJVePMJeJA=;
        b=imxtWQcFDsGJVr8MtK+SSmm4yRCJRJdmgBU/2nkNlFpK63VtfE6ZwFJCiR6ULPgcS2
         O9uX2wVJZcUqM3JwVKMmX2WY8Yv0A6WoyMPlcrGNUUmgHG1ALBewf/or+KJidxJIMEHQ
         vSgpvSch+4yYfL21G6bcO+Rn8aAkdFqCs1mdqM4qM3enZEFUzRNe0cjmYfkLkt2ElaQE
         n+hByfaRaCgxZgWSaeru1wGxYgFoI65Lw6+itZ65DHFGxAh73cSYT7+O0SsKekWuJkSM
         qombzGYxCL38r+yszhxczfqkz1IlE5Qmwo3tRA7ugp+hltkJqdu8AlOHoUSILOYIRNgZ
         lkTA==
X-Gm-Message-State: AOJu0YwFB2KDTSdPJ4ci4a9traL3ideSs2KPGsY0Ta+joe9dRHYBZUDJ
	ImR8S/Jv8cuYsUuRiaj0x8qEYfqmN6QVXCkfCXM+NQ==
X-Google-Smtp-Source: AGHT+IEKi4Ku7IRu6pWDKJCzVJ/s4jXBemHFpwX7Qi6OsSaHMOkdXf7oYlo/rHGhVxs3rgPskGaX5yCo9la8aH1bJJo=
X-Received: by 2002:a81:c206:0:b0:5de:9003:7737 with SMTP id
 z6-20020a81c206000000b005de90037737mr2480793ywc.50.1702287812712; Mon, 11 Dec
 2023 01:43:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
 <20231209215601.3543895-3-dmitry.baryshkov@linaro.org> <48a7c36e-2fa2-4be6-970d-a4a301fdf8f7@linaro.org>
In-Reply-To: <48a7c36e-2fa2-4be6-970d-a4a301fdf8f7@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 11:43:21 +0200
Message-ID: <CAA8EJpqw+hC05QP1mWkA-SsKEehjp7ipb_HzUW2nyWjqZ8WkXQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: qcom: stats: support SM8150 platform
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 11:11, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 9.12.2023 22:56, Dmitry Baryshkov wrote:
> > On SM8150 the RPMh stats have 3 data records, but no DDR sleep stats,
> > which demands platform-specific compatible and data.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> I don't think it makes sense considering the driver could detect the
> presence (or possibility of presence) of DDR stats at runtime.

No, it can not really. We have safety nets for checking the offset
value and then checking the magic number. But I'd prefer to be
explicit here. It's not that the 'invalid' data at this offset is 0 or
~0.
So, I'd prefer to be explicit here.

Actually we probably should have used SoC compat entries from the
beginning, even if looks ridiculous for such small thing.

-- 
With best wishes
Dmitry

