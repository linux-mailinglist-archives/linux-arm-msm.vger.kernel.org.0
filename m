Return-Path: <linux-arm-msm+bounces-3930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B480A20E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 594551F20FCB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C543B1A72B;
	Fri,  8 Dec 2023 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQ82p9zw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37ED110D8
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:21:08 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5d719a2004fso16428437b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702034467; x=1702639267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rmazC+0qAqQxSPROFc0xc84GbFdhI8sWUlQpFJfzTOs=;
        b=rQ82p9zwU6nbWWZ1nqwXyrUgOMgNkjJ7ZVbyVRXagbyrdFGBVxXDOyz9/IFBoI0Abw
         96wpE1CjrDsdU9wq3rHNL9+sU87W4XZX+uZAQOFlO2G/1KKIJuCataR/wEyKwAnpA5Ia
         4ZZgp8zuKB+d7l4JFTqopeViNmdEAYHmOQeRz58/hqvv2RIrWlbPtKppQswdmOVdwvPA
         09WDL4v6zuMHKE4gDcalQD2XMiH0rYplIN1gkAD+a8gI3LCFvXLj8v7QrOKBih8cemid
         Ci1SImXuVz65rZWoziQKxMObppgHke+A9pHLnMTJgewi8ESHo4dRh1pUmgNdhfI17pim
         A5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702034467; x=1702639267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmazC+0qAqQxSPROFc0xc84GbFdhI8sWUlQpFJfzTOs=;
        b=OYZ+NdCfAgc5pSWvi2X0Dhc81AOOmYmKWmQo6Pc5EDI1qZOGB+qkbn7hiBwgLBqwps
         CGQoc3D0qdd2gdagcCzNW5vw5QjWAp5pVTO/AFMYalkd8dNwYJ87ufuFMGt9V03Co1eu
         AZ3flEDr8G7uavgzByb6JaqPJh/q5koXmxiu2E9yDIpWsmsuR2SHCc8Tx1bBQV+57/JX
         A28uSj/W+xasmveaJYeDIGHWomLg8ryHhgkKUSUBVfJzcX4N3ESnJ/qFvuxL6X+Tbct0
         eO2xfUzxS2CvclMbu+bZywNuy3e5Jo+SA2k9Q9SwC2HGZM8Ki6weyxFyCtMUNmSmUtyc
         1Djg==
X-Gm-Message-State: AOJu0YwlgLvEj1NQ2x+JixvMA5v3OKN6oaCe1Lqv8GsXsPlqWcfIrHAE
	0t5Hga8y9BRptD0wr1EPpObgSE35raTRuwOYkPbL4A==
X-Google-Smtp-Source: AGHT+IHp0377Ybzxt5w6KqA9E+DZI6lyM8tdxkXwFiDkF9togYRg3F/ti2mcvG9rIQBDUE40O7+YuoHQA1vFqx87rvE=
X-Received: by 2002:a25:2f96:0:b0:db7:dacf:4d66 with SMTP id
 v144-20020a252f96000000b00db7dacf4d66mr2502085ybv.98.1702034467396; Fri, 08
 Dec 2023 03:21:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com> <20231208050641.32582-7-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-7-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:20:56 +0200
Message-ID: <CAA8EJprAu-4Az07oztew0Nf3SO1yeCcASk2bhXR-938YnzSgMg@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add CDM blocks to the sm8250 dpu_hw_catalog to support
> YUV format output from writeback block.
>
> changes in v2:
>         - re-use the cdm definition from sc7280
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

