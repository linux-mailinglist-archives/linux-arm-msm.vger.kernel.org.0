Return-Path: <linux-arm-msm+bounces-12352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE368613D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 15:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B2FEB22CFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 14:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFF77F7D0;
	Fri, 23 Feb 2024 14:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uuix5bik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF567EEEF
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708697903; cv=none; b=h01doJKAhx/RNLnjcFHFGFuiZ6G/eHmo/qqpKU4vFjHzGPOlsa6CVqRQ35FXAemMWBIeKkQuX/AWw3F909xymJJCAknYhQUBOOYtIRAycDL8EU+y44l5IJHG/fm9s4RWnwgPZ/KUi3NSPrYMAEc+VkMCz+krAHTtH3GT+5FwAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708697903; c=relaxed/simple;
	bh=HX4TUSWSsGsJPJcz5laMwy2GWSZ/MRJtO55N1YPwBtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlLdjxfeL3jMz+kT1qdIXQCa0GvMDiZFXj00ioOLgHPs9FB6Rb9BJpVs/AQIeDcSjY4f6EiPwmTZF1pCJuKI+GimLt5TQgF/vs0l0m5Azao/7QrJZ/wf6yfoa2TQ11O8Y4HpTGFyJvlMPnyfQYsFZzfu1qFS0s0m1V5C0G8xvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uuix5bik; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc73148611so927243276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708697900; x=1709302700; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R19d00zAe0ESb2W1wfQWoMVwkbh2mKJoTeu+62qXKLU=;
        b=Uuix5bik05hshGSFS+elh24cUmuSawIIxz+Z0ZYmu0RAIJ6/qMBF92f+Kf25yC54jj
         VDJnu211xVQPfp3BLphWiWw0wPSjlN1E0hZeBnPd/iDETrxfTDBb05oRFWiBaRHdq8UQ
         Ai9JWsdO3zPhWL1jBk7z9yDiY2bSHw9Kz4ee3cYRBs0OViy8zsGxNduqb9A5EIHmYTvi
         F+43srEtFbOf5VYQSjrkj6fObI9uc/jdZVxN9BCV5eyS1EApJWnlWG5/aeMi1MJC5L83
         wutcUuYT4opGw0F5483FkaQVGb2aT6yMpTCx9x0+WBK19tuUVQqdjsa/HA3oLWRUmWQT
         p72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708697900; x=1709302700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R19d00zAe0ESb2W1wfQWoMVwkbh2mKJoTeu+62qXKLU=;
        b=SQ2EoIt1Nq4U+W2DNxjPawdaAM7ya4F8ehO28tYmYFl7+DtPjwLkaCbOdWX5Y/Qssm
         cbV8NTP0PJqbH7mkZTp74fLM9pFWU4g/FhbsFUmX4PXYZ6vrSkQfOXmpBcHa3uWoKT4X
         Ixinbl+UpREC7gVwDn8u/r7fnuodwE/5mxsGw7ah3xTSOykiBtmeDZ9VSlWqJgmwAFOL
         nOFhUV8R4uPgLCRF8TSTX97moxPQWIo/iEfOP+j7wabJeXQBtwKYnXjS0K0SDNjBGVnE
         goPwKBi+fHiqjLwsf1jBiAczyLE8bnLpBgTX24cHKLjhjNS8E/JpR23Lxb/YaczgvSIA
         lTnA==
X-Forwarded-Encrypted: i=1; AJvYcCW3cubhb3EHQFW2wcchCfeRoFjkD2oqRkRG2uHOQTmkCPbdoTBiCGr0w0bgfZlqC/O6QXi/1RItr+zFVlVyZG1jBeqiXvWdDWCLKtGY6w==
X-Gm-Message-State: AOJu0YwuOvURXFytrRRc7yRXpj8j5HopF4zl+nKzpIef8Eaqx3XKXffs
	kes16ehBFlqz/FDiDi+RD3IWHrkpHylu2Psmv2iCM1NG5b6ZDO41sx3iYTPphdwqGFchXGEW9fi
	LD1IeLiFmFAj78F698ihljZZJ/3XHb8om7wI6ww==
X-Google-Smtp-Source: AGHT+IF70UF5LUoWVCUdf5eKhR2KmxVP4WJANJz9muRW2tleCLa7psg2DI+FTnDe298CK4P04Z21/Fhm5EKyGZLzPvY=
X-Received: by 2002:a25:6b03:0:b0:dc7:32e5:a707 with SMTP id
 g3-20020a256b03000000b00dc732e5a707mr1990018ybc.61.1708697900641; Fri, 23 Feb
 2024 06:18:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
 <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org> <ZdiU2z8rzo542_Ih@hovoldconsulting.com>
 <d4049823-ad24-4426-887b-9c66cdd96318@linaro.org>
In-Reply-To: <d4049823-ad24-4426-887b-9c66cdd96318@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 16:18:08 +0200
Message-ID: <CAA8EJppYHdSmsWMk-u=QaAaHWqjFj8zs4CF947eeex6iV4dsYw@mail.gmail.com>
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
To: neil.armstrong@linaro.org
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 15:52, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 23/02/2024 13:51, Johan Hovold wrote:
> > On Fri, Feb 23, 2024 at 12:03:10PM +0100, Neil Armstrong wrote:
> >> On 23/02/2024 12:02, Neil Armstrong wrote:
> >>> Hi,
> >>>
> >>> On Sat, 17 Feb 2024 16:02:22 +0100, Johan Hovold wrote:
> >>>> Starting with 6.8-rc1 the internal display sometimes fails to come up on
> >>>> machines like the Lenovo ThinkPad X13s and the logs indicate that this
> >>>> is due to a regression in the DRM subsystem [1].
> >>>>
> >>>> This series fixes a race in the pmic_glink_altmode driver which was
> >>>> exposed / triggered by the transparent DRM bridges rework that went into
> >>>> 6.8-rc1 and that manifested itself as a bridge failing to attach and
> >>>> sometimes triggering a NULL-pointer dereference.
> >>>>
> >>>> [...]
> >>>
> >>> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)
> >>>
> >>> [1/6] drm/bridge: aux-hpd: fix OF node leaks
> >>>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9ee485bdda68d6d3f5728cbe3150eb9013d7d22b
> >>> [2/6] drm/bridge: aux-hpd: separate allocation and registration
> >>>         (no commit info)
> >>> [3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
> >>>         (no commit info)
> >>> [4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
> >>>         (no commit info)
> >>> [5/6] phy: qcom-qmp-combo: fix drm bridge registration
> >>>         (no commit info)
> >>> [6/6] phy: qcom-qmp-combo: fix type-c switch registration
> >>>         (no commit info)
> >>>
> >>
> >> To clarify, I only applied patch 1 to drm-misc-fixes
> >
> > Ok, but can you please not do that? :)
> >
> > These patches should go in through the same tree to avoid conflicts.
> >
> > I discussed this with Bjorn and Dmitry the other day and the conclusion
> > was that it was easiest to take all of these through DRM.
>
> I only applied patch 1, which is a standalone fix and goes into a separate tree,
> for the next patches it would be indeed simpler for them to go via drm-misc when
> they are properly acked.

I think PHY patches can go through a usual route (phy/next or
phy/fixes). For patches 3 and 4 I'd need an ack from Bjorn to merge
them through drm-misc-next or drm-misc-fixes.


-- 
With best wishes
Dmitry

