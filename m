Return-Path: <linux-arm-msm+bounces-16356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC989795C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 21:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C971CB2535E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 19:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2F71553A2;
	Wed,  3 Apr 2024 19:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l9PaDm5p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE4C155394
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 19:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712173924; cv=none; b=GIQPvlgjDRS9eK14D26rAADwfA1fskulPLINBpYi2J7Mf74k3ErDKH4iIC4KfvHn0UE4yWLt+99W4iH6TaPOd7ixvwmuqvaTIKYUMLlCs8PDhf5wLGenymYTBBtpDZyPuLN1usMJJMi/l/iZgVyxDqxCMtADn5yVDZQPRN144ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712173924; c=relaxed/simple;
	bh=E6/hGNZuv/VUHI9Dwqlaan9ffvpB8IRCvV9lU5wlBPE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PI+LcIresxXR1cLEcPOaZY0Qm5cx/iq6QFdLagVOKqeEUEFHB2KCQmDyF/vJjCu5HfCAQToSUGAiM/nL9MMLaW7vApnPAOK1dESoeCe7R0wP5vq3NHq/WP30aPc7cbYnQ158ZqzHYQUT/RN5/YLpmpbaxjxq52rMtrkW+/dRn4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l9PaDm5p; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d687da75c4so2580161fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 12:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712173921; x=1712778721; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLedOIV4IbUFIx9RiX1EzuAEXy2HWZd818qXPBl48uo=;
        b=l9PaDm5pq2NYZl7sgNx0i7vTV+LoLZidz/Epe4YGIatAevQ9bMLWtYsZ1QIH6BR+9o
         uVl2j4PR2p3Th96NSi7Z6XDGaoz7p4rnOqjQtNa12mZVlmA+r/F2YUVf8mup7tODLDpp
         OXJDDfIdwSJZa50uAKSeiOx46Cy4wOpzranM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712173921; x=1712778721;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLedOIV4IbUFIx9RiX1EzuAEXy2HWZd818qXPBl48uo=;
        b=viIxWDuzSe3sDjP+Y8qGVDeKhORhssCeX+xkkEVu6yDQTiXzyf1QyfQdYYyri3EUH3
         H+CohWdBvsNFLUlMcRhSh6G4HRlVFtoOSSIg3CPFSyWLxTdz/EDaK5niD7XRU7RKUvA9
         EU5d7CqI9dWB8+xLWgDiG1PqlCNM/PJQ0yK2HhtajJcKymt5glMee20Enr91tzR1o4q0
         U0M8N3COk0+yDLBU4FY/UymaFQDr643fGP9MyUFKuWeEt4mB1qIb6YqqDstKRRMe1hJs
         +qKVC+e8UgOKoChAQeWsAtIPKs3Wi85/qVbC0gXOIL2sFEhLA5E5gz8RIQm0hXELMEzL
         6Grw==
X-Forwarded-Encrypted: i=1; AJvYcCWvnrLePuiEyH0eWvOGb3mmKd4Tuuo2wwQE6lL5RvvFpikii68+CUkpnL6vXQDHeIcX4Ig6X9Z2XTSwm6UneVYOWNSWFtBEv9lou291Iw==
X-Gm-Message-State: AOJu0Yzsd4ZzBGPGsvHDj8WZ2f9jbi++q3o02l2psdzdB/Ij0d1Tnr3u
	2zLIKHPrSOpz9vOhHc9aSz/wKDf1Kn3CZAKk/ZVn/qGGjC/QMiWMEYErDZUHKUXyR6GipVgX+cg
	aZZA5NEICiy/aduw+LLQOsBWYFIBgyNlrQCr4
X-Google-Smtp-Source: AGHT+IG7N2SDMTbPzfa+yXCQ0HUxjbibr9tRV7f3DUYPSOrMBMyaNRQsZMgCus51dZ5hRG42yuWa3WupEQJ0EfwrKa0=
X-Received: by 2002:a2e:a4d6:0:b0:2d8:4158:fa64 with SMTP id
 p22-20020a2ea4d6000000b002d84158fa64mr382308ljm.35.1712173920639; Wed, 03 Apr
 2024 12:52:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Apr 2024 12:51:59 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 3 Apr 2024 12:51:59 -0700
Message-ID: <CAE-0n50Z2pDGH+ncjQq-huDsn9jdN=1SfaaU+qw229nZpUVCDw@mail.gmail.com>
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at phy_power_on()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, abel.vesa@linaro.org, agross@kernel.org, 
	airlied@gmail.com, andersson@kernel.org, daniel@ffwll.ch, 
	dianders@chromium.org, dmitry.baryshkov@linaro.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	vkoul@kernel.org
Cc: quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Kuogee Hsieh (2024-03-29 12:50:35)
> Currently qmp_combo_dp_power_on() always return 0 in regardless of
> return value of cfg->configure_dp_phy(). This patch propagate
> return value of cfg->configure_dp_phy() all the way back to caller.

Is this found via code inspection or because the phy is failing to power
on sometimes? I ask because I'm looking at a DP bug on Trogdor with
chromeos' v6.6 based kernel and wondering if this is related.

Also, is the call to phy_power_on() going to be checked in
the DP driver?

 $ git grep -n phy_power_on -- drivers/gpu/drm/msm/dp/
 drivers/gpu/drm/msm/dp/dp_ctrl.c:1453:  phy_power_on(phy);

