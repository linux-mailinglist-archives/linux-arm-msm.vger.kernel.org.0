Return-Path: <linux-arm-msm+bounces-16179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0588962C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 05:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91604B230F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 03:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8D81BF2F;
	Wed,  3 Apr 2024 03:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0Lo2DMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B461BDD5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 03:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712113732; cv=none; b=JmZBkr+N5wT5nFDaBfamuMfSfemxNXVoBnMUAElLH0JtqLy7BZX3fCQ0d0sOlAQMzC0pwW9RSePONwRnTaBR3HyP24VcwJJEaBm1vANiQzgkvdQj1yUCMKzm/YQ9ALjf3VNo15CwisrDAuAQb5U9RyJ6LLMlwUMB/uJ87sPwc3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712113732; c=relaxed/simple;
	bh=JNaloNg7IAffGuYznhJyHxVMJLnQeiWsK6eJCMSM1lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASKiIHliOdeLjuQWHnXjtCVXzw36hU0MGj3rbkFISYxu1Z1puL8Lzk8FCNYV5aKffoDkdgkRagrM6ZiDp9+1WKE0OuYquJ41EloCaKKbnQvgKRiUlZ1FVg+wHoGJfUQgpsHBduQ0vPAK7K7tg2kw2/KzZcxtIHvSuIL107nqT2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0Lo2DMB; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so5588570276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 20:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712113730; x=1712718530; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SLZyQwWsOZDMsjJgKKASz9enfm362tPeU6p67BPPPcA=;
        b=y0Lo2DMB+RHXQVqn5l7qJxzM67eEoMfTLlb8T1sKG+VsZRT49biWUCwWcKYdTK/v1+
         KswUEa+ylsVuyX8/kIVx2YVmOnqKfuBl1IOBWMZ9FIUriAQA+7IL5bFtSKqUZqxdl1Cp
         yBFV5I6z9Qm6AA6jY4pCQVc/KkNRxhypaB9y4M5WzaZo+Vx+adB3KhqviG8f1Wh6r+Kc
         b0Q4IMrLTkU+qM9pifGelxuv/+UZtugrL33sRTxUPHWkqFurxBF6YK3fOKLK2i4eGUNn
         FBjrI30NzO+bSXsNXFg+OZLbTAjOOSN1cwKFtFrvo0py+KnDANtLpQRtUiOtnHa2RQpb
         baqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712113730; x=1712718530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLZyQwWsOZDMsjJgKKASz9enfm362tPeU6p67BPPPcA=;
        b=Q6lKbtd753gkahw0rfG3ToU4qszsRhASI85w4Lq6TczW2ig3rBqB+l4V7CfLSwVzmu
         JSKIuMZqoAdyxlE+eJipFS1dVc76lls4DKHBXNAJShkNVzLiOPFbdD6E6vxP8ONuYFbX
         K6k6nINsbvAg8+ldXM/xurDOxoL2BpAZ7AbqWA3yZco/jDLxsRMAFyAquoNydTU1ymuy
         YA13cL3zFbCwgyVxW+lYBH7sie4cxyYX1ogq74vdfcVhCAYLonVuzqabIQx2DMZjiu/h
         e8+ZM+VoZ8WVdTo4WO7hDxV/h48LtsQ/8h9v7Hs56CcBoq9+7ylfqubOJKiPUGAeB+rP
         fTNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCB2boETBeqaCMEc4GxZR9VVccmdR5y0vHKV7eXBKhh0Z1Xq3FkGDfW14bt3xMKIG/WdoTqVe9J93kgWfNowAJKhhDcVLpSppxRYCVRw==
X-Gm-Message-State: AOJu0YxrM6PFLLFFhQBtuyqSQ6yEcuMZN6J9Bt2hMdaRD0eL/6zG8ERj
	zxlg5ppe7S3LZQ02P7HIxTkqR78JagSsNXtObifAjHBkEcs1yGFVKkW6SBepGpxfqJGXNoc/QT9
	n9hzt89rdXQYH4IgQini7ssOhw59PcuRpkzQrtA==
X-Google-Smtp-Source: AGHT+IE9EKkUidiGL+XeA4Jbotmjrpuh9J5aIMY1ZE+6LKcfeu03OjvrZFEzBWZxBUNuUXBXoDTkhOq3x4vkxpn0sWI=
X-Received: by 2002:a05:6902:82:b0:dcc:140a:a71f with SMTP id
 h2-20020a056902008200b00dcc140aa71fmr11987883ybs.60.1712113730070; Tue, 02
 Apr 2024 20:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402-pmic-glink-fix-clients-v1-0-885440b81c65@linaro.org>
 <20240402-pmic-glink-fix-clients-v1-1-885440b81c65@linaro.org> <bnxrstkmjmmbhzrqncfwwnxa5vpx3ioysykqr3sbiirlatneu4@vlewrjturppo>
In-Reply-To: <bnxrstkmjmmbhzrqncfwwnxa5vpx3ioysykqr3sbiirlatneu4@vlewrjturppo>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 06:08:38 +0300
Message-ID: <CAA8EJpqkU2bBwkdW5aQ=ZKvPBoRWaxFVQAxmg76zhLQqV4C-UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: pmic_glink: don't traverse clients list
 without a lock
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 20:56, Andrew Halaney <ahalaney@redhat.com> wrote:
>
> On Tue, Apr 02, 2024 at 08:07:06PM +0300, Dmitry Baryshkov wrote:
> > Take the client_lock before traversing the clients list at the
> > pmic_glink_state_notify_clients() function. This is required to keep the
> > list traversal safe from concurrent modification.
> >
> > Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/soc/qcom/pmic_glink.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> > index f913e9bd57ed..c999358771b3 100644
> > --- a/drivers/soc/qcom/pmic_glink.c
> > +++ b/drivers/soc/qcom/pmic_glink.c
> > @@ -168,8 +168,10 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
> >       }
>
> Does pmic_glink_rpmsg_callback() deserve similar locking when traversing
> the clients list?

True. Will fix in v2.

>
> >
> >       if (new_state != pg->client_state) {
> > +             mutex_lock(&pg->client_lock);
> >               list_for_each_entry(client, &pg->clients, node)
> >                       client->pdr_notify(client->priv, new_state);
> > +             mutex_unlock(&pg->client_lock);
> >               pg->client_state = new_state;
> >       }
> >  }
> >
> > --
> > 2.39.2
> >
> >
>


-- 
With best wishes
Dmitry

