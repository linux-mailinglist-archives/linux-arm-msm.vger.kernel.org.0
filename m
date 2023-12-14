Return-Path: <linux-arm-msm+bounces-4738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE5812E0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 12:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0346D282174
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DFC3E47D;
	Thu, 14 Dec 2023 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WIXHXeqN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CFA121
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 03:04:55 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5e36848f6c6so6942907b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 03:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551895; x=1703156695; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k4LjNhjVor5/6wirmCLkKeqg2J9GNr9MNYI9kwcT2bQ=;
        b=WIXHXeqNdWjdIrnmUNajxyol2FFxOqMnha/j8SYxxbnJcg1iSl+So08BNI+ghxeMjD
         5RbhGm5r9BI/1K9jvVSvg/xewbzZgbJ7GmRruOXTj1LgzdZU/p4OUdepOD+L7NZy3OvU
         AmUmbXBos5lXlvojfEZvKxs35A+u+WD2VBJcgbbFOFH0mjDdwyNRvjaYRchsWzAl5khn
         EukQuPChIJG3Ho2MwF414KGfzEzd9PzOI50BQqxLIfJrNtB3wIs67zdbSWJ+ANjES8Uw
         V2EYd/dnhR4SWFtAT4G4/kaFjSpLtXr8ugI9XrsfUPOM7RwYK/68PtpmMy70CD2WijWJ
         so4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551895; x=1703156695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4LjNhjVor5/6wirmCLkKeqg2J9GNr9MNYI9kwcT2bQ=;
        b=iyXBlc9oYZUHwetT5r6p4Hwl2GCOtIplFgmZjZOP6BWtuV2pzJmURQAA4gfPEDQmY4
         SqnjYwSTH+puYGQLqRSp8tLLTtMkf8TPjsNBCnIdSgGQMFwzd4WdnuOVnykEdiLNI3oA
         LQc0zWt9rulBSFxV6jHvpXP303kp301SuA7/npOCiw+Zh4sxUn7h/oQX6k0ibD8DRN2c
         Ad+zL6tbezahXvxmzS1qOZtkQ1Zea8QnSd+p6n9y4gAXky/1PQgIq2YdtXmA5yJityIf
         Pq8Cy2TV55T5bnAe2Mig6qgwd59gtQrOVkPRVu2ZOJePl29S0rMGKA/JWZoJFbe6t4dQ
         2qoQ==
X-Gm-Message-State: AOJu0YzF15GjfSCSI2Dmr+g+ZxdNUZdceyE2yyw3zVWqHIOt2wIUBLoj
	3y1e2g/dJdy/woPQ9X990JSfc4n/W0rzxBj3/EAGRQ==
X-Google-Smtp-Source: AGHT+IG1aVfgGukkmoWFZ26DkxbhMt3gFHTO1lxEdG4EQYpm8eoQSZ2vaSwJ0MuCmhGGwTkFAPs+C/QBMZ6dBUPpQgg=
X-Received: by 2002:a0d:ca0a:0:b0:59d:d85e:795d with SMTP id
 m10-20020a0dca0a000000b0059dd85e795dmr7736662ywd.51.1702551894820; Thu, 14
 Dec 2023 03:04:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213210644.8702-1-robdclark@gmail.com> <ZXqr0RFw9KsP876v@hovoldconsulting.com>
In-Reply-To: <ZXqr0RFw9KsP876v@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 13:04:43 +0200
Message-ID: <CAA8EJpoSvaq9imP-dT4p=4jveZyFmh=OoWOP7jWGo4OYkHQDTA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Fix boot when QRTR=m
To: Johan Hovold <johan@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 09:16, Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Dec 13, 2023 at 01:06:43PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > We need to bail out before adding/removing devices, if we are going
> > to -EPROBE_DEFER.  Otherwise boot will get stuck forever at
> > deferred_probe_initcall().
>
> Can please you expand on why this is a problem here in the commit
> message?
>
> The aux devices appear to be tore down correctly in the probe error
> paths so how exactly does that lead to deferred_probe_initcall() being
> stuck? This sounds like we may have a problem elsewhere which this patch
> is papering over.

This is a known problem. Successful probes during the probe deferral
loop causes the whole loop to be reiterated. Creating child devices
usually results in  a successful probe. Aso I thought that just
creating new device also causes a reprobe, but I can not find any
evidence now.

>
> Also where does the probe deferral come from in your case?
> pdr_handle_alloc()?
>
> If this is a correct fix, I'd also expect there to be a Fixes and
> CC-stable tag.
>
> Johan
>


-- 
With best wishes
Dmitry

