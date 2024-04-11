Return-Path: <linux-arm-msm+bounces-17156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 794A18A06CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 05:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D2BF1F226B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 03:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71D813B7BC;
	Thu, 11 Apr 2024 03:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tx0YkMiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341311F176
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 03:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712806410; cv=none; b=tvm9gPfQebmvAb+x1aIvoo9aBgVlWV75cM6LvQQ3I7dcMH096gR60KLC3WM7hJlUg8gNoPOY3jlv5DqXIROHDQmt7RxTNBQp2r3wRmCKFf5a5wk8Jli0czvhNHNLKjf0KHGCCKa4ZWhcr6XmmuTxk2vataGcaV1scqyvti7hylY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712806410; c=relaxed/simple;
	bh=DkyyV+DeeXtw5y1VitiFHacAfDUajfdXO3Zb3F2s9i0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EkyuGIwegKmoVSyyEFbGxaNdYyC5IyxqgmFvfnuzX6AbBErSB/VoWiZpa+QsRpInHW5LhedS7Isjr3m0XMVQVO3aFRBdyyv77rWzh4aKl8eBOIA7EQZfeJiUxYkyZqCjqgivQQJj2IV7XL1iySDck/CUQo82sDC7FZ7GzaUJ9W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tx0YkMiF; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso6676285276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 20:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712806408; x=1713411208; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NLQjM3XNXLTRHzsj7zKKY6yg7lqGV8iGkVr8wOADLrM=;
        b=tx0YkMiFaowpNMaXxd/x1z3H3a6lfsEmiLRUvUGHWPBKVf21qAJZm907JIJSbnJV4e
         +claqXTCCUAyA73QsXNkP+LFjSp7i3w3M7I3smC+iM3k8zP5KG5eUps8Z73nGFCrAQlJ
         vAMXIHkVuDoG9A0tVodmtNb7PVAs2xF/UjWkiktgZ8MGZ0nF5pIvmK8rfbNPP6bsnjrK
         72yTqPNQOrTHlsusshy+4DuXOKWS53t28C3G90HbohRigX91wq2sh+bbsi0lsGY7DZcS
         bGIejhYgaRgsDBV+uGO0DekVw9fF1L1KVPCfJ+QOP3iIoBvzlPNE72mG3skSqxpoZG7D
         VkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712806408; x=1713411208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLQjM3XNXLTRHzsj7zKKY6yg7lqGV8iGkVr8wOADLrM=;
        b=intCC7SNmDuVr3VTGiArZbhA5eqb55Wf2sams8obkNjiatQLtw6YkQdhZcxkGM81Ri
         kjJ347w/NjiwLLyZ0Ua+qqh0fDiZmU1xxYk2J/RhDNfrwBBrueS71BP6qL6sbhgVywQK
         yNLuJWFDsCsmIaWS+iaC4Yn+pTDqrBxhYPTueDNtKZiysgiKcbq/YX5EDGbgMcNh1J7r
         Sxj6vQYiPbAZRVnz6oJyaowjmFkNz053ESy2onfyk7HbTBI444zlObjRkOcwoyz0uJTX
         W2FQbOWzvsyRq18tLA41VOSNePpOJyk4RssNNMhuhYcBkzo0TlBruWe+w+N7l6AWme0P
         MXXw==
X-Forwarded-Encrypted: i=1; AJvYcCXplG0erY8iYM5d617/szoWB/ZYE12NBQrHqrde6ORO+g24uzjjqv26gpZu00ISfZD14fxjlxz5DAsSd1n5DU8QmzEa0hMXKrGeJhR0lA==
X-Gm-Message-State: AOJu0Yy9WTLRP+BWdgI3yeUfqo7vg594sLNwjgh7znkbcbsvZgzOjcJy
	yyRGyFaHtMamakxR8xA3sd6uLNdEqHJjYgrGcHCUCYFqyqcBLVaVggvBtDH02tPV7xXkcWSuZKn
	tuudOf2WINQmlLJrhuhemTxO9lcEGXxXfOZ/mtQ==
X-Google-Smtp-Source: AGHT+IFTiIuDXnmNCiBX/58irNEJ1EqJhyoG80H3vr69UmLV6KIPu7hyPEBLc4eSkGSuiTbVejoGmZTAQzSohJ2OBjo=
X-Received: by 2002:a05:6902:2b8c:b0:ddb:2e97:4715 with SMTP id
 fj12-20020a0569022b8c00b00ddb2e974715mr5351388ybb.46.1712806408138; Wed, 10
 Apr 2024 20:33:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
 <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org> <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>
 <xzb37tt5e23pbsi2usdvtaamxqbjgivwfgd3lbpukoahkcziox@5mwat7kaicjl>
In-Reply-To: <xzb37tt5e23pbsi2usdvtaamxqbjgivwfgd3lbpukoahkcziox@5mwat7kaicjl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 06:33:17 +0300
Message-ID: <CAA8EJprDPtmzzoZCQ8eyZXYydR6=13TsYFnO9A-StK_GxL4Gpg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as module
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 06:19, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Apr 10, 2024 at 01:12:15AM +0300, Dmitry Baryshkov wrote:
> > On Tue, 9 Apr 2024 at 23:02, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > > On 4/9/24 20:27, Dmitry Baryshkov wrote:
> > > > Enable CONFIG_INTERCONNECT_QCOM_SM6115 as module to enable the
> > > > interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > >
> > > =y for console?
> >
> > I think with pinctrl being set to m it won't reach the console anyway.
> > And earlycon should work w/o ICC driver if I'm not mistaken.
> >
> > Several other Qualcomm platforms also have interconnects built as
> > modules in defconfig. I really suppose that we should move all such
> > drivers to =m and force using initrd. But this sounds like a topic for
> > plumbers.
> >
>
> That currently does not work very well, because if you probe defer the
> UART into the future e.g. systemd will open /dev/console before it
> exist - with no interest in reopening that later.
>
> So, if you care about UART, that is suboptimal.
>
> Resolve this, and I'd be happy to see them all go =m.

BTW, so even if /dev/console doesn't handle switching behind the scenes,
Systemd at initramfs opens /dev/console, maybe fails, loads icc and
other modules. Then it does pivot_root and executes systemd on the
rootfs. At this point the /dev/console exists and the systemd should
continue without any issues.

-- 
With best wishes
Dmitry

