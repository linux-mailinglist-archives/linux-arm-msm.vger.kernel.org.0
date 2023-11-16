Return-Path: <linux-arm-msm+bounces-770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 075EB7EDD62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 10:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC5161F2369C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 09:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E45814F93;
	Thu, 16 Nov 2023 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4nztDxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77188B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 01:08:59 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5afa5dbc378so5998347b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 01:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700125738; x=1700730538; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WiMYfZ+A2iUQf2KOkcm1PZ8y14NGTAvuJT5UyKjiI+k=;
        b=V4nztDxL/TIIeGz5teRGcDNkB8gdv2o5er9FL3RSWHZdn1Adpb5Fjlo7vZpyNeZdva
         TBCpkb7/z7LG5ZVAjp0Ho7dXNn1fHXPwnOm9X13Eyb85t5vF6k1oghpvFAVVsZ04VNMO
         KQg6jkG5eWUz5Qqu+xppxDrU+T7t58NFl5cneNOqiYbxdu8nel3SxHzXQ3YdWV5QWXza
         U9n93gos9garvYxNgK3qZv199rxcUytURUj6QZpnGexn2SL5BBL7l8IRA2JcK+WYqf04
         zh1I51i+ed/xOi2Q642M8jQEBK4YwJEdjJt0tWDMtzZbaWH4B9k4TiyBHHamkhTwsiYo
         TgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700125738; x=1700730538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiMYfZ+A2iUQf2KOkcm1PZ8y14NGTAvuJT5UyKjiI+k=;
        b=CFwMtjN9IDY36Yxv5HMwsbfK+Zp/KvPZXXttJKTKTOclWNfqy9Ty1S8HXXIqeuFG/q
         Akd+/4Z54PfrT3nhHCIZgOMdj4Tz9c/n2iNyjhB8rQrgDnNY8vZONonkLbQg5NKZLYNu
         3WZaUcnsT108pwRblqyMYExDdphpXahLv2VnyYE/NyGJrNhsUeBhI4DC6K94NYV6IHpA
         Kh8h7PUkvCO5b0nryPWgwAKYi18KJ8NOwSTicIGyOCu7JZvoebKp5XSfUvTIeA6UvVxI
         zgDJ6jvbmQAoR6U29/c4A7Q0hv1m0VdO1p4g0ealWzhCK1A428+3cHq2I5j0ARb60J9k
         l9pg==
X-Gm-Message-State: AOJu0Ywz4CPLuaH8zOcBjsph2In2yy9d+Kq9NlsAhjR8JdNRiZHHND4c
	RYXPS7YJ2Z1TIWQDL4hAEmsz1DWvg/rAa77J4KRafg==
X-Google-Smtp-Source: AGHT+IF6BBUkRdHTNI4kLc4++AIpEBe+uTcg0DjjGG/Wn2eQ+g10P4WlTdNo3niQqqPA2ZwbBUy7TUyzoVG6AbyLKEg=
X-Received: by 2002:a81:6d14:0:b0:592:1bab:52bd with SMTP id
 i20-20020a816d14000000b005921bab52bdmr13791072ywc.39.1700125738621; Thu, 16
 Nov 2023 01:08:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231116051401.4112494-1-quic_rohiagar@quicinc.com>
 <20231116051401.4112494-2-quic_rohiagar@quicinc.com> <CAA8EJprzSFrb1qC-khPmTTac5o2ZX8azYBNPmT8DjyeNo3SAZA@mail.gmail.com>
 <6ba4d0a9-c370-4851-8631-4c8f952b44d9@quicinc.com>
In-Reply-To: <6ba4d0a9-c370-4851-8631-4c8f952b44d9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Nov 2023 11:08:47 +0200
Message-ID: <CAA8EJprB=Jsiwb_K_9n3ypwDzns_2QBeBYO-o7PX-QPmhSHKBA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: defconfig: Enable GCC for SDX75
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, konrad.dybcio@linaro.org, arnd@arndb.de, 
	krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org, 
	nfraprado@collabora.com, m.szyprowski@samsung.com, u-kumar1@ti.com, 
	peng.fan@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Nov 2023 at 10:42, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
>
> On 11/16/2023 10:56 AM, Dmitry Baryshkov wrote:
> > On Thu, 16 Nov 2023 at 07:14, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
> >> Enable Global Clock controller framework support for
> >> Qualcomm's SDX75 SoC.
> > Please add:
> >
> > ... which is used for this and that board and/or device.
> Sure will add something like this
> "Enable Global Clock controller framework support for
> Qualcomm's SDX75 SoC which is required to boot to console
> on sdx75-idp platform."
> Let me know if this doesnt look good.

Sounds good to me.

>
> Thanks,
> Rohit.
> >> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> >> ---
> >>   arch/arm64/configs/defconfig | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> >> index b60aa1f89343..d1be1efa8a23 100644
> >> --- a/arch/arm64/configs/defconfig
> >> +++ b/arch/arm64/configs/defconfig
> >> @@ -1252,6 +1252,7 @@ CONFIG_SDM_GPUCC_845=y
> >>   CONFIG_SDM_VIDEOCC_845=y
> >>   CONFIG_SDM_DISPCC_845=y
> >>   CONFIG_SDM_LPASSCC_845=m
> >> +CONFIG_SDX_GCC_75=y
> >>   CONFIG_SM_CAMCC_8250=m
> >>   CONFIG_SM_DISPCC_6115=m
> >>   CONFIG_SM_DISPCC_8250=y
> >> --
> >> 2.25.1
> >>
> >



-- 
With best wishes
Dmitry

