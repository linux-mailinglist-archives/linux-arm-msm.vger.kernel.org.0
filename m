Return-Path: <linux-arm-msm+bounces-4825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C757813AA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 20:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0D4C282516
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 19:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB3B697AB;
	Thu, 14 Dec 2023 19:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bSJZn4cG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E081C6979B
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 19:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5df49931b4eso61833517b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 11:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702581780; x=1703186580; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yG7suejrqRA1mYwSLTmp+LIk2/7peq/L7UWtxNt32fU=;
        b=bSJZn4cGo7LJh1FIO5gymoMZsJbzzV8919jgV95Il/xsRpzFjJ+691HAj9K7mocS/p
         9+Ql06k/s6Mz1H9Fhras7Yzefg1anvQ9966K+zrUZhCeCSooI6Oh5WTRtrKMWLreIv41
         u7Rgr7stBrph+lP4PcWxS5LXHsaSOpua1T2Fy8LLHWGtbv3fBmpzxx7uKOXXOH++I+kI
         9hYCrFRM2M5RTn2aKqhHhaqPHe2dEc4J6QSw6tVXj6y98ncbuot3FivGzaBPC2Axx6w0
         PKgftb11QJ3/Iad/hSFl6rlAbZl7DL5nOoxKd8zcSJhKpXRx2wOwCg+je50SEfon6gC+
         lk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702581780; x=1703186580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yG7suejrqRA1mYwSLTmp+LIk2/7peq/L7UWtxNt32fU=;
        b=QOc6nERk7O3fWF+3KBNcb63ns+yW+rCCztm/AWMN+MqxMd2vPH5ytqrCsXP4/uh9Lj
         t1109uOnhDz/0hikaoeuFpWdhXWOXngtgNy2eh817vBMPzH28KPBxy/O4JdBTHcfRpJ1
         cRKIRmbdUfwCGs3Mq4SIC66/wXmGJVNafiwUULVAk4a+jIpEnEU01opRR/yu9TKoO4aa
         6d/qCFi3qj5MgPPqnhvLDb7vOm4AMWM03yI3jjNIOA5AFIfsqcMTVqstvVFKI2fMNsNA
         mqbnEwlooYrJLs1B/zI0BjFMZkczlUW4Lml/e+8oOqwVO51WpJkGq5RZVCYIvNFkNa3P
         QZyA==
X-Gm-Message-State: AOJu0YziklCd6XFXcPDSUzZPksznst7C5X3+0cFKojTQfUMopPOpluXh
	OjhhBlUY+s8+bv5HJXCaGe692m6vNKZaklHagomtNQ==
X-Google-Smtp-Source: AGHT+IGHgEYjjKO+laGz9YkrYFuIJVcK8YCew+uKOMkZmZYgNxF3CHdtysJHXl6PvN6SIOfG66h1mq9QwrAZVits0sI=
X-Received: by 2002:a0d:ff44:0:b0:5d7:1940:b389 with SMTP id
 p65-20020a0dff44000000b005d71940b389mr9313100ywf.85.1702581780647; Thu, 14
 Dec 2023 11:23:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
 <20231211154445.3666732-3-dmitry.baryshkov@linaro.org> <6f3c4692-ac87-4852-9a60-6df64ad8a803@linaro.org>
In-Reply-To: <6f3c4692-ac87-4852-9a60-6df64ad8a803@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 21:22:49 +0200
Message-ID: <CAA8EJpoVXs4SmcwAwG57ii+C5j=W=z59XBdBq46eacG=njiEag@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sm8150: make dispcc cast minimal
 vote on MMCX
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 20:17, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 12/11/23 16:44, Dmitry Baryshkov wrote:
> > Add required-opps property to the display clock controller. This makes
> > it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
> > errors when enabling the display.
> >
> > Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
> > Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Only patches 2 and 4 made it to me..

Hmm, interesting. I'll resent them.



-- 
With best wishes
Dmitry

