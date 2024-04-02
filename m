Return-Path: <linux-arm-msm+bounces-16087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0298895196
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 13:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96C802898D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 11:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1847F60DFB;
	Tue,  2 Apr 2024 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtz5tf/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB765BBB
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056630; cv=none; b=dCR7c9v8byBh46C1vtmhvdEtwfcrKFGHUp471Znedn/lZpzBWXIGGAdkR4kSCf0B+MVqgQiE2jNzEB6IVv8ByYURpkgQO820zn1uW9OpoJmdR4OjfCqhW76W+NngWJKvoEbra5ACyUMCsqNXtFCgvjU4I/S5jNow76kbdZ1gSPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056630; c=relaxed/simple;
	bh=xYEx1wB0KeFh5dfJ6HSa7rT6aZpOvWbEWZUcFmvpOYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/jRalVmDuGNrBFIT9bue4ZMiE1lD22eLHoUnt92aU9t5h//20P1yOpIhBp5Y1eZ6cTiQxZcHJLZ2sKirzAJB5qPrst2qW1Ojoc7ctQj4pOr2HG55O0xCjmB8qC1vpnGQIiaWK2/PwQrXlqtG1S6h3yrwlKdvHKjWZ6UYqlxDpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtz5tf/Q; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcc73148611so5147860276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 04:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712056627; x=1712661427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mFAn5q7CQFxXq7JaY+/0V77lsWhz1Tz0icfhEeQZiIA=;
        b=xtz5tf/QsdMLoKnoqx6rUztU2p56/IxKm4kRKm+X4rVcFkrg6e4owC085eK/kYL9kn
         1tjX/ujIHU2cSIoDXA+qTG4MG/rMfvW26UTiwox3tRNqJOZ89Rk+y3ptLICVRhzHPQ6x
         jkQbPlQehDn2Y+KS9/2U1QRPC2pEjlrfZbyjnzhgecb4F638Q1Nyz44id0neiJPxZLI6
         qk/2LfRlq7Me3H7TwhUfQHDas1GKcuIiVc0CGuTn2F6ZLc2h41wtu7/tw81J7mVFKcap
         3mAT8KO0GKbRQ1WL0Wyuc+RV03yzIC5f0jZ3AuBZT/oyofHnXGfIP5L9Or4GyuZLT078
         Xqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712056627; x=1712661427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFAn5q7CQFxXq7JaY+/0V77lsWhz1Tz0icfhEeQZiIA=;
        b=vcG3Skig6FIODu6+RSZbtTPc9WMNrexff/RgThI4h7wLp3QcsTxrgbT4g5+iSxbXCe
         Kb1Ovv+4rAT3SuoxzmbXstq7q4q8v9AOIoTsKWpCCENGjjxIWZeNlY6hEDpwrlLAay5J
         klbS9Cz73bGcr6DYzNJ/kYRC1guMz1v1VsVBPrNr5TEvOEZsjWjIDroFLYyUQ+9TsRoH
         9yAsNkroPLMHJKjZdPijWrzsWXhTIexNA8t5zYuhWEl82prwdtkD5p1WoUa6eXFB05GU
         LlBcrP2EzLZKlkdTpJ/TgmUPTUrGACb+a8xaAhD8nDLv6jLrIbDmWJjIR4ksEuqwi3h1
         9Qzg==
X-Forwarded-Encrypted: i=1; AJvYcCVPeKB4J4wSLVcwuFMRdJex/X34GObJ6kuVKvCvBKs9duHAZEBwHQHUZWfqvzvQtB07HJ98p3GLyDwn+ckoGiHQJ95EZPeKdDInR5BRdg==
X-Gm-Message-State: AOJu0YzFpZ0bG24NeGxg4m466SHayhrkGa+HWQkQVQ6LrWD+LqY0FN69
	RKm3c273rgEZ7gUj5F7QOTJz1vA8/7PmFDFcnL0M17aHZ4NURpgPOjL2CIfB1a8RUfxdXRb17BP
	9VAwuxMMWOMGtmJ93UxebVuKAiTH2oNcdTmXwpA==
X-Google-Smtp-Source: AGHT+IEigHxfdu3Sh5IlyKpDafnA1zAw4DSQNtZfWejv/aZ9zNxq090wRE2n00r1tIubWICmJpip1//6zCXSEBerIZY=
X-Received: by 2002:a25:640c:0:b0:dc6:cbb9:e with SMTP id y12-20020a25640c000000b00dc6cbb9000emr10783156ybb.41.1712056627317;
 Tue, 02 Apr 2024 04:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402103406.3638821-1-quic_varada@quicinc.com>
 <20240402103406.3638821-4-quic_varada@quicinc.com> <CAA8EJpphk_kqzBE7cKb73ipdpTi29t9ZSOOdSfq7pAGSs5NKeg@mail.gmail.com>
 <CAA8EJpo=TMhu+Te+JE0cQzmjLOTDPi-Vv-h5Bch0Wfr_7iVi2w@mail.gmail.com> <ZgvlrbvvPNA6HRiL@hu-varada-blr.qualcomm.com>
In-Reply-To: <ZgvlrbvvPNA6HRiL@hu-varada-blr.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 14:16:56 +0300
Message-ID: <CAA8EJpp2dgy0DcLoUuo6gz-8ee0RRwJ_mvCLGDbdvF-gVhREFg@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] interconnect: icc-clk: Add devm_icc_clk_register
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 14:02, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> On Tue, Apr 02, 2024 at 01:48:08PM +0300, Dmitry Baryshkov wrote:
> > On Tue, 2 Apr 2024 at 13:40, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Tue, 2 Apr 2024 at 13:34, Varadarajan Narayanan
> > > <quic_varada@quicinc.com> wrote:
> > > >
> > > > Wrap icc_clk_register to create devm_icc_clk_register to be
> > > > able to release the resources properly.
> > > >
> > > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > > ---
> > > > v5: Introduced devm_icc_clk_register
> > > > ---
> > > >  drivers/interconnect/icc-clk.c   | 29 +++++++++++++++++++++++++++++
> > > >  include/linux/interconnect-clk.h |  4 ++++
> > > >  2 files changed, 33 insertions(+)
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Wait. Actually,
> >
> > Unreviewed-by: me
> >
> > Please return int from devm_icc_clk_register instead of returning the pointer.
>
> Wouldn't returning int break the general assumption that
> devm_foo(), returns the same type as foo(). For example
> devm_clk_hw_get_clk and clk_hw_get_clk return struct clk *?

Not always. The only reason to return icc_provider was to make it
possible to destroy it. With devres-managed function you don't have to
do anything.


-- 
With best wishes
Dmitry

