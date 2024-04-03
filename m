Return-Path: <linux-arm-msm+bounces-16359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C176897984
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 22:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF32E1C2767C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 20:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5D9154BE8;
	Wed,  3 Apr 2024 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tqr9/Yjl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA6D1553B3
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712174685; cv=none; b=pB7DLu05FXxsiJYYkAbJyap+oOUj95KXhqTDNUC2Pj61F5XVXXFSdYxUvK5c2t3laKLE73qzjtLGzv/TR0SO2XRR1gV5gGogWiQg33xxOZjCZJ+bJy27Ea+MQeDRLobYgAEC9/Iir/2Qx9sWCt+M+nX6U6hCGzOatfLOd6uKB4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712174685; c=relaxed/simple;
	bh=nte1yEPWtmTFWWFWa6iF5XCH+QggbDYqwUlZzf9i1xo=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcRklKBkEg91y7t7K7hBULztmlOkcOY29LpeAiOITU6gHeMaJTQW/3DWBFjMmL+pEUSk0JOmvTGycWtSfR19oGd/ZIGClZ+0kN5isSIBM0fSJ7GLUxPKUSzh2DTHV8hv5qy4NzRnk3z+vGs4QOS3BwQlPYiY2CqOLjIVasXDNSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tqr9/Yjl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516b6e75dc3so256308e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712174682; x=1712779482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1ldXuBtZD0meeLQ9ewOsNc58bmXcN65nhQZrzCO4+o=;
        b=Tqr9/YjltOOQ06yxQr8Bm5dR+ipNE6Q/9HQs/lrL52saNZip/FHZQjkr2yR+WNXr8a
         yzqJF8wlvpR/xqhYqRJJndJZ09Yy88V5jITa6VQdykyS+KutXLNtSEzFj+pOHSBmeEGe
         K5ZrGzulqy/bcPKxHkzVpg3L8mRHTvOSv3FnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712174682; x=1712779482;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1ldXuBtZD0meeLQ9ewOsNc58bmXcN65nhQZrzCO4+o=;
        b=Zv+Uji7+77FhtStCo1hgS5rWqASawe1L5Iwjj7jiY653T/27DA3nTroHuUN/WpCEtE
         i+AjKGpH0y1bgM/Ir0kZL65wxlgF2zz+JKwpt2YAkeclhcRI8F0GpDbooaztcPZFxAuh
         spEUl5qiOOiLqyy+dpQySQan3xwbxmIWXPiuRKKcIJ26qL8+ENdmsaj/xppV92UazIIP
         IVeRGolZGolWMtoFneAbr77X1War6DjL6q8F+T+yG3AHpmHmPsXokCVJnpYmr5EkevUJ
         tfBPIYCTtPbbeZj5H0pjDqxBilYFcfFIaL4lZxfmDFSf6PbY4Wq82ExC0cnTGzADOUcO
         yM6g==
X-Forwarded-Encrypted: i=1; AJvYcCXrc5GLy+KsbHwdGpo/0ywQpvE2nVrvrLP3AtHygQPeR7SJrKTaHF7oiTJeqtwOWgfpU2d6sO1A4l0/lepS/2xwUQv3v2LDdFJmingiiw==
X-Gm-Message-State: AOJu0YwYx5w11IYUISQlnu3Igt7a977q385cxy36i6K+tWeeDe4c1Foz
	o4kWYEVXB6P58litnKwTDDC3LqW/MHZnrPNVvbAheduATvSSMZO6kd1mTT18cDrHOKknPbvlpbP
	dDnET83coqpf2/fMDst8/OXfTz6WIH3F+HiRw
X-Google-Smtp-Source: AGHT+IEI86CzA7TT+IdyvGZ2GYs55lyyEY7kHHWG4VeBinBpm342IF+g/Z3YNKn5FTNDKtGHKVF5QpYrRF2JYfdtqg4=
X-Received: by 2002:ac2:5204:0:b0:516:b148:6d8 with SMTP id
 a4-20020ac25204000000b00516b14806d8mr354836lfl.50.1712174681526; Wed, 03 Apr
 2024 13:04:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Apr 2024 13:04:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2f509949-7e7e-cbf6-c1d0-f25971c2d890@quicinc.com>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n50Z2pDGH+ncjQq-huDsn9jdN=1SfaaU+qw229nZpUVCDw@mail.gmail.com> <2f509949-7e7e-cbf6-c1d0-f25971c2d890@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 3 Apr 2024 13:04:41 -0700
Message-ID: <CAE-0n50qT2mHOGiU89NAmHdADQAAgs3aMP1RFOTTV8oCUbZKgw@mail.gmail.com>
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at phy_power_on()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	abel.vesa@linaro.org, agross@kernel.org, airlied@gmail.com, 
	andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org, 
	dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
	marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhinav Kumar (2024-04-03 12:58:50)
>
>
> On 4/3/2024 12:51 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2024-03-29 12:50:35)
> >> Currently qmp_combo_dp_power_on() always return 0 in regardless of
> >> return value of cfg->configure_dp_phy(). This patch propagate
> >> return value of cfg->configure_dp_phy() all the way back to caller.
> >
> > Is this found via code inspection or because the phy is failing to power
> > on sometimes? I ask because I'm looking at a DP bug on Trogdor with
> > chromeos' v6.6 based kernel and wondering if this is related.
> >
>
> No, we actually hit an issue. This issue was originally reported as a
> link training issue while bringing up DP on x1e80100.
>
> While debugging that we noticed that we should not have even proceeded
> to link training because the PLL was not getting locked and it was
> failing silently since there are no other error prints (and hence the
> second part of the patch to improve the error logs), and we do not
> return any error code from this driver, we could not catch the PLL
> unlocked issue.

Did link training succeed in that case and the screen was black? Also,
did you figure out why the PLL failed to lock? I sometimes see reports
now with an "Unexpected interrupt:" message from the DP driver and the
interrupt is the PLL unlocked one (DP_INTR_PLL_UNLOCKED).

>
> > Also, is the call to phy_power_on() going to be checked in
> > the DP driver?
> >
> >   $ git grep -n phy_power_on -- drivers/gpu/drm/msm/dp/
> >   drivers/gpu/drm/msm/dp/dp_ctrl.c:1453:  phy_power_on(phy);
>
> Yes, this is a good point. We should also post the patch to add the
> error checking in DP driver to fail if phy_power_on fails.

Sounds great, thanks.

