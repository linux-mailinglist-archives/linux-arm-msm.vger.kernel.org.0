Return-Path: <linux-arm-msm+bounces-26345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ACE9327BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 15:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBC4BB20A17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 13:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC52D19ADBA;
	Tue, 16 Jul 2024 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PeNXiryn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EF0199EA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721137488; cv=none; b=ug4K72nn8dj/bjCrowfZA1h4s6IK66TDosfnXQiDKXviCGMOUK4ZrT9tkBd1XsfY7jaFgZLY8ck3rEMP0O8NSN7P9QMsj8LR/MgEH5qAoNGfRlbYN+KNkqoTRg5ANZX58Ce5ElqZXCHCzHHS2bPxHk0P4Be05lmfdhpkn5pzz2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721137488; c=relaxed/simple;
	bh=qF2z35+sMltHxOc1VgxTfEf8aDED8ki06NXvVuf7QCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JY75/qQPez/S8rwQPIoO18v24EhL30ffI5qKV1h30q0XxluvD99xjiv4EzH4WObw1QJ8tgHCL5X9iSNmzZ8wPCElz8sOfBqO23I6DLLhwnq/l2F9AZ4UJ+VzbO6yJcZXdFYtcQNHh1NJwfFGooBZrLQnudV094coN8LeiyfG2Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PeNXiryn; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6634f0afe05so10712077b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721137486; x=1721742286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hMSSp6veBmjTrsSFSHpHaaBnQdaSZwPgrQ/EgS/wyFs=;
        b=PeNXiryn8BdqicRO8oh2b9XMIACUhk9asPxHm7+2NqB1FlmdS2iYbpMAAieFMaLDSD
         XE3XQE8uh5NjhYI04P+A0YODI1BkU3jepL0eHz71VGwDCPjYtUfx3veCZktS//XXkziT
         u4sK9Fnj4PpjDFdYiaMSwdqV29OD660WSOJsZpF6MIA7H/pz9WSHBDWgtAX88qCqoTe5
         bMCor/54WsCDESeEGDUuxrSU7B6M1GZ0BPu84un9Mz4bZjijCK6NJO/+Hss3dWmgcelN
         uL7VH4cKwNRpcToV9aRXp5j1xD+RHV35Gb4in6eUs+CEiBRk61O32lc2aWMwh1BtPJNg
         1L2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721137486; x=1721742286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMSSp6veBmjTrsSFSHpHaaBnQdaSZwPgrQ/EgS/wyFs=;
        b=Km0/9DEFv4+O5prf5qAxgo51KzEw/s8rN4CoquNM8qLDZR8j2xNEn4Fc49qckEvoAa
         Ch89UwD5pMaKkV3wv1/QQaJkCqgIcxBEsGDJYYmRO14o57wYOxgXkcWPiJSqp9DJQtlN
         TuehlRiayeSvbG2objXmBKtf9pXrsgxuFaJ9OZ67aDpuODR37yy7hOMFxjgJyUILHH5z
         Ngx2/NwF5YS4BtVSZaLqcqibXk8zegqpaQ6U/vTgzX2vgo+BZ/q51xVE0Ls6SYE48gxS
         jaKvoRxKGX2HlOrwxdZK5e0RClXYI8oFSgemRsayO5v/oKMT02iWv6FqOWfv3WTPEx6L
         RqQg==
X-Forwarded-Encrypted: i=1; AJvYcCXkgM76mawu8f9kAkhlLK3g41mTkp7DvrjKCOTrGSpL31yUioiPglBFf6RwTZSfAVtl8Wv1N1Fz9+Z9FSG5aWqCdKWsmQdCv6jemxLFbQ==
X-Gm-Message-State: AOJu0Yy6J0GiScyvohQkbKxdKiuvAKVUm8VS8cRJmAZDJrJYihzhr4TI
	0mdYle3/RYzkypn518+HM1AfVaiTlgjYMYFI32lZ2/4KS3xZ3elv08NEEK9/IwMXYrnFkJz3TSB
	2hPwA2AklKqSTek7fe2HzgeY2vrO0Yfa3Any+TA==
X-Google-Smtp-Source: AGHT+IG/rzM+ieKCxdAt0e72AO2CIHO0AW2zvcYWqKkpa7h2Gpwy3XK13dCbfyR1XJ2KNkhxFbb/u/RN2U+IHqQ03c0=
X-Received: by 2002:a05:6902:c01:b0:dc2:5553:ca12 with SMTP id
 3f1490d57ef6-e05d56cd8bdmr3129594276.14.1721137486142; Tue, 16 Jul 2024
 06:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
 <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg> <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org>
In-Reply-To: <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jul 2024 16:44:34 +0300
Message-ID: <CAA8EJpr9L+AKDhuHfQa=Nco7fvG9vLH3a+gxVhENrhz12b3n=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 16/07/2024 13:20, Dmitry Baryshkov wrote:
> > On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
> >> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
> >> and byte1_div_clk_src, the clock rate should propagate to
> >> the corresponding _clk_src.
> >>
> >> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >>   drivers/clk/qcom/dispcc-sm8650.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >
> > This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
> > rate should not be propagated. Other platforms don't set this flag.
> >
>
> Why not ? the disp_cc_mdss_byte1_clk_src has CLK_SET_RATE_PARENT and a div_table,
> and we only pass DISP_CC_MDSS_BYTE1_CLK to the dsi controller.

Yes, the driver sets byte_clk with the proper rate, then it sets
byte_intf_clk, which results in a proper divisor.
If we have CLK_SET_RATE_PARENT for byte1_div_clk_src, then setting
byte_intf_clk rate will also result in a rate change for the byte_clk
rate.

Note, all other platforms don't set that flag for this reason (I think
I had to remove it during sm8450 development for this reason).

-- 
With best wishes
Dmitry

