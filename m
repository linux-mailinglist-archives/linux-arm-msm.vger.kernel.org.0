Return-Path: <linux-arm-msm+bounces-15044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9073C88A854
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 17:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABCF5344707
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 16:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85F86CDC1;
	Mon, 25 Mar 2024 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jScDh8yJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEA16EB7A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711374614; cv=none; b=be23UfXU/+/Hc1sq0YJexWh6YAwYfN4neaNSkTjqNGRU/U0bYadjNPPdNs2D8Dob39QiI4/a/pePCdk7flQK9GDc8/s6ayNdIIqMsta/ZE3q+jYR2cS81/nIrCma/6VRFfGm+LS17tyz+HAXwJSi71it+WPiMnTJWOtm4yHvTJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711374614; c=relaxed/simple;
	bh=Q/O4TzucTAKDX/kg7bNrMLHybrgmo/JFI2rvZKGDjBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftv27uLsJKQ/gJsIKfvuj24iN78RhmQeSXGfekGWhMu8SjiqoTb4CuiWqMaeiKB6x470elLO+CK0HBStbG4JegNN6k+MzEAU9zfY1Lj5qEltL9jXlDRzV9ZtZgK/a58T6jwUPEaFAsNZ42vE/CgGiXJpGUN8LJqltXxoyoka7Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jScDh8yJ; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso4265552276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711374612; x=1711979412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xY4s7Y2TDs9zFkoIeirDMHTppdLgQXMLcHGPVUr4u2w=;
        b=jScDh8yJSyXQXu1ywGwkBZCVALCAObT5jLVPpzSwKXYaAuWnlSzgub5700nFX8VmKn
         9BAAF0MS7cdkfr8UjaUDQJrn56t3gbfTtqHMW5/jphkAv0aGkqz276n/JaTyPjPXYPqW
         gNfpAD+HNcfvfk3ygNL6i/F0Yd/FFSQfGnyzb5BQCjijzDKDXigQ7WsNbHcI945iNSpD
         c4H5u5xvI8svMEAxXGr2XN4hDQaaxUVVCkXvKHprOEldPRCmO6npNztMBZe6kDPZ5RjF
         SVzZG8eDhw2Xu5/9Egi/BDtbieCivgDFs5Btr3YKPTVvoX7hfK6q0zMWH+nXmmyWm9CY
         TEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711374612; x=1711979412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xY4s7Y2TDs9zFkoIeirDMHTppdLgQXMLcHGPVUr4u2w=;
        b=W3d4HypG7bUa8G9xrgC2vTn7ezPXC6L6zHZ1XwU5BUZQQcjOua1wiwZg+3YrrigJr0
         zkLOlTJRjrwhkRz93caHAUjUiJ6iFSAWkoOcKBXzmWO8tbMc84a+TGPPwS8AGG0MQMqv
         P0rem0gk78/oDjmr3U9h8Ln3ysaxSPUO+7aO3Ezi9cyLbN1IV4Nn0+U0F5qvcmegKktr
         sM+T9u6W6k/RjCYxLTjMKUKaERY2KCxj3hK3/Uu7Xv+hyhGRs9YNElkPq1yUNoEXs9Il
         NJol9EWVuUb7dd4COzfB9W8rW6NgtvMyANxi18iUxfBAdPrzzELTebDwdtLwDB2pbHzp
         IWXw==
X-Forwarded-Encrypted: i=1; AJvYcCWIFy4/a7pmTkDCNNcbmfE5FmTPEapQU7uZdtple3OuMz6aNg0baabqBX7E377a2yjKb0rO33nxjIDyScO/tD/IvcckutdLJZ8lyqDKjg==
X-Gm-Message-State: AOJu0YxglwsKEyoKZXT/rO4gPPKKdxGyRXNwCOzx0NuQr3N//Q/iDFb2
	71xEk/w0McfEDW43tv0Obh5QDp2O0czOMR6oWo7O7VhTULN5DyL1by3vSntgqQFleFsX36Z2tZ0
	XKihLl6SKKYzHhfL7zBxpSRX1idjyTtJVwZ7eow==
X-Google-Smtp-Source: AGHT+IHYjl0eFIojoJcLVm6Q3FikVODclbSrKrXlRZtK626pzzHApRK7eCpxDKYvNTGQRZ5CWm9dXvBcGq57I2cLYIQ=
X-Received: by 2002:a5b:941:0:b0:dd0:76e:d630 with SMTP id x1-20020a5b0941000000b00dd0076ed630mr5054565ybq.53.1711374612032;
 Mon, 25 Mar 2024 06:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org> <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
 <CAA8EJppO8zMq5R7hBPG04Zsr9c3-Z9mqpnJQ88Dbjv3uYDbrUQ@mail.gmail.com> <20240325133252.o6taik5ezrsqtl7g@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240325133252.o6taik5ezrsqtl7g@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Mar 2024 15:50:00 +0200
Message-ID: <CAA8EJppK6o0gsashG8yCLrOLbSVFDbHYEgzqBgP5ts65uTWgfw@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 15:33, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Sun, Mar 24, 2024 at 12:57:43PM +0200, Dmitry Baryshkov wrote:
> > On Sun, 24 Mar 2024 at 12:30, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > >
> > > On Sat, Mar 23, 2024 at 12:57:02AM +0200, Dmitry Baryshkov wrote:
> > > > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > > > need to push register changes to Mesa with the following manual
> > > > synchronization step. Existing headers will be removed in the following
> > > > commits (split away to ease reviews).
> > >
> > > Is this approach common in upstream kernel? Isn't it a bit awkward from
> > > legal perspective to rely on a source file outside of kernel during
> > > compilation?
> >
> > As long as the source file for that file is available. For examples of
> > non-trivial generated files see
> > arch/arm64/include/generated/sysreg-defs.h and
> > arch/arm64/include/generated/cpucap-defs.h
>
> I see that the xml files import a GPL compatible license, so I guess
> those are fine. The gen_header.py script doesn't include any license.
> Shouldn't it have one?

True. Rob, could you please add copyright / licence header to the gen_header.py?



-- 
With best wishes
Dmitry

