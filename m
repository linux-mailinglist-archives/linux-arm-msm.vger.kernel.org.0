Return-Path: <linux-arm-msm+bounces-16530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFDD899DF5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 15:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D97D1C2196C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 13:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9C71DFE4;
	Fri,  5 Apr 2024 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8DpqgcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A820F16C865
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712322422; cv=none; b=aCUj54G5SlZ6Yrx7C0s0sh/D3YL+0M1dPhWayYY+9cGM5szGFAhJXbLlzw140OhrdDFHOL/r1oxH5BdOMOxmvLCbfLNq2XD2ddBmw8mds3xjFJlSAgpTrpBmzDJLtFzmbnrLdRJhDBbFhEsNiR9GM9irqz0baHyz4Zi07cRgTHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712322422; c=relaxed/simple;
	bh=Gfxrmcvh6kSk7xC6ujx6BI/9h6RE9IEZFYKVOKfG6Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQsAyj9o7FNqeXWtMeRHL5TspyHlMfFSerc+5n4FfNcgy0vgss6k5v1+8uI4OQMWwcppulrRYPmYDvODtNGUrI3kTH9D8W36NRmddrrP3r9FCX2mykkCPDmaAdobWWHpr+mk6Ct7XSm0olYPlqCgK4AXM1Wyz1o3ELtQ3z4n0sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8DpqgcB; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6e9eccfc4b7so981036a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 06:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712322420; x=1712927220; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iU1YdowZKR4NxwS1m2fNh/bSZUDHJtarrpZbW985aMo=;
        b=N8DpqgcBCTUXFYpdZOM47cu38eP47EUgauodMH1kdCybZMZ5PjmJpP8EVm9XnP4Bv5
         0vKwBwf7ii/L4Nr3b/T+cBTSPPyfBKAjhEdVrlooLoMDqwo+nCCW+ebjQEStBPMfYGCD
         KObOi6nmGTLkZ+pJmhsq3v5X2MoSe8LnMLuAcG66AqFbA6KDD+E6mevOndPebg2Mg+no
         UB5QslatXpGMWHLL+jQhRB05fe9LTlcP7L0xctroKnRbeC9pfwUi4PbQp67YUhjve8R6
         7He9jUGTxGUdm12T1N7x1o2Fk4zAAv8KsgGaL25vnIU/DtVuP4ggQwtaymkZauE2zT+X
         S+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712322420; x=1712927220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU1YdowZKR4NxwS1m2fNh/bSZUDHJtarrpZbW985aMo=;
        b=QflkS1F7+MscSo6yG+AUdcE3dIc+Hk61NyFq6BQFlWEZlzbFYIZtWKBQAZkL6d1BCa
         9vGuEyC2WmaafboHttMzFvdvXcF/5ElEx8ZC2I837V3NlPKwwHO30LiQ1iTeaD5OYYmB
         QMtkF6Aov2pGji+8Z/t8Sdm8RuGl593UG1TNnSG+wPy5lSEbbA9E5/AyaEXBEnSsz/K2
         X5m8FtGOFJe/tjkoE6AwLWEgM906nLl3RUHMnV587FKfA+FMi9MczhoLEkQzloggWYYA
         lJ8ORH1OUZX1GiylD3AMR+bZ/zy8Wrlq6shX1QZR4Y2SgYyLA+p/6nn1xh4Xg7fy9Ttt
         hdOA==
X-Forwarded-Encrypted: i=1; AJvYcCXn2dJ1exiulOAEFcF9Mo5/Z73Fp0h/KpohH5hioLr7hzc8AK/qvKrv5MpIhcZ3SEW6n2gkgkycDOx1xiCwf0nEJcagEVhFOt+AaomAdQ==
X-Gm-Message-State: AOJu0Yyf8U0Y/CyYWHNu280PViVBi8R7+Dkb0tJjf+AOcgi/LWPt28BH
	gjtiTiStzsfBVVVzUUTUgZRhOAr6bkvlSmkv++AEgzV9xMZJss5zZKV+7pQV35ZTwoCqAn7oxFc
	OPoPCRtNMnT/35wCgn6sOPDiOgQh5iTOOFuRzag==
X-Google-Smtp-Source: AGHT+IE+c2hDr24po6hk/C0dtlrmRnWazW8ArZW5UqRYqD6PC4fukxRp5eNcGAEsjPJWC/uAs3K3YzzUWmogRx/P+BA=
X-Received: by 2002:a05:6359:100c:b0:17b:5fda:a544 with SMTP id
 ib12-20020a056359100c00b0017b5fdaa544mr1738518rwb.24.1712322419701; Fri, 05
 Apr 2024 06:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
 <CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com> <875xww3tv8.fsf@kernel.org>
In-Reply-To: <875xww3tv8.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 16:06:48 +0300
Message-ID: <CAA8EJprZTdDZZ=NSzn9xEBGB0kp0s1HHLffF0X7YSLyVxy7ZSw@mail.gmail.com>
Subject: Re: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990 devices
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Yongqin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 14:57, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Tue, 30 Jan 2024 at 08:47, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >
> >>
> >> The ath10k driver fails to properly handle fallback from board-2.bin to
> >> board.bin for WCN3990 cards. This happens because the
> >> ath10k_hw_params_list doesn't include .fw.board* parameters for the
> >> WCN3990 platform.
> >>
> >> Add board data configuration for WCN3990. While we are at it, merge
> >> common pieces of BDF support: drop .board and .eboard names from struct
> >> ath10k_hw_params_fw and use the common name instead.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >> Dmitry Baryshkov (3):
> >>       wifi: ath10k: populate board data for WCN3990
> >>       wifi: ath10k: drop chip-specific board data file name
> >>       wifi: ath10k: drop fw.eboard file name
> >>
> >>  drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
> >>  drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
> >>  drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
> >>  drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
> >>  4 files changed, 14 insertions(+), 45 deletions(-)
> >> ---
> >> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> >> change-id: 20240129-wcn3990-board-fw-a2d97507a712
> >
> > Kalle, Jeff, is there anything pending on me on this series?
>
> This is in my queue (Deferred state):
>
> https://patchwork.kernel.org/project/linux-wireless/list/?series=821157&state=*&order=date
>
> Unfortunately there is not really much time for ath10k nowadays so there
> will be delays.

No problems, each maintainer treats PW states slightly differently, so
I was trying to understand if there is anything left on my side.

-- 
With best wishes
Dmitry

