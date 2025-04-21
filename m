Return-Path: <linux-arm-msm+bounces-54846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5AA94EAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 11:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0D61892C19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 09:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2781DA62E;
	Mon, 21 Apr 2025 09:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsKCMx0E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464DC19ADA4;
	Mon, 21 Apr 2025 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745228009; cv=none; b=X/EoMWAxNy/x2REiBEPk1edG9pKktUTJ5Ls4BPOK25qNqtk/HOmqi4s33BwvzFQQfO55Ptf2AHHR0o4G2AKtLhH45QykPfYYqLp9Tlk5ZIAsx+TfziRCkAUGnTRAhRlerCYGRGVFU/hRLt+1yC9ml/jZg5CQev5VdJol3cvnluU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745228009; c=relaxed/simple;
	bh=bCswh5FBBRyF2VqJQOKVkSI9+RFrKt7H073L5B8LSVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJ4SvWe1JZe7pQ3sZRr7R7LZN1Eb8njM8lv862QNUgxUdDBA8tsWQet1gfx3NY02QLF3W5/CB9Fvv7AiLOqlm47HrUCOV51boqHrjjM5H0PhqEQFFdDpbnqovadqviwec/Ezn4CUFsSQ9X+S72+eOify5YfGUR8GEgLD5FqtwuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsKCMx0E; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso4334264a91.3;
        Mon, 21 Apr 2025 02:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745228007; x=1745832807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCswh5FBBRyF2VqJQOKVkSI9+RFrKt7H073L5B8LSVE=;
        b=NsKCMx0EDOtwtfBkK/6tHptgElCVixq9fdKDHotuhWK6FfqvX8pNVaJ6delVKzWBcm
         lEAz4ZhmFE7Ayqg9Zjz7UBpsdJVQiHQ4vpgMXtNXTDNzV0D4Rf/k+PLea/HDxJ7KjQ4q
         7VJr9as3Tfu+T2262mk/zIEzbFsalAKvdO1qevPKtbCoWPZxKX+Ra8BO94kWRzcNnr/q
         C7tOmr5UkKmDiJdIJ035alsLnyvsrYDLiR6Pu7RCJk5HEEu0xXkvqSfK7EFjeD+jDiuF
         t21dznQWunnqsWDPwqiIrXsCpYqzHtzCSQ5Xvl6dqQTo7L8z/VdA4BI16237EWfmratH
         HSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228007; x=1745832807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCswh5FBBRyF2VqJQOKVkSI9+RFrKt7H073L5B8LSVE=;
        b=F3uj/iLY5VZrRq7K1pcpX1xyAI6AjgwpMdGz8pY051EYI7iuXDlNCUzU0d7hbt1LIA
         RlxxnzDX35+HZUdyJfIVFMZsti1IJN3ziDmt91RmeYq/WqgMOhwV6Rj9dfPCST1iM8wu
         Xn+OiogcQJPeBtc7DdfKMjx6MuHx6fVmr38mb/ODs1x0JyLHCj4hJst1U+0znu/u+Dn1
         vhXJPuBjqguVDzzndj8ZIddfsrxSmc/LcS5gauv6UdO5UZOgcefNlhNQap52QYSfp8l1
         IdIg17kJqdgZrWJgDGxhimEKmHztikNdaDvQlgDvMXD2P4Ats5vWGvIl1Kiqcwibnoct
         PVkg==
X-Forwarded-Encrypted: i=1; AJvYcCV++/CVr04WF1IRjdOvn8vOWapNO+DnOyYQwBupoZ0C5MHroHm51aT0Ysu73m2dC5yhWaG/8dXjfQcAsSS7@vger.kernel.org, AJvYcCW7avKsHF7xSx+Nulu9cgsHmy/B3a+5jAewop8IDJRE+GGw+0VcYrySo5/4fvjzWA/6SOK4SJq5fj/B1okZZQ==@vger.kernel.org, AJvYcCWEiUIYkP9Ov54qI6oZYPTi/Q6gow+rfVNv2eOgyLqlRK+pGxrqIpYOL8LFi2XcktNrfkbO+09yL4U7@vger.kernel.org
X-Gm-Message-State: AOJu0YwWRXAn+BUdRSv3Y+VC/4XROBa7rIWCyJGIVc1YbB9XM6gz5oL3
	8xfUPsIX32pu6ct7ZpyzufydA5SBHhyqX8hYWoOxEBLc7On23Sp7HTA2Geu6/LIOr0qv8YzS7ni
	Q7BBOuWSwTf1+YgeD3aTeQVMAOFc=
X-Gm-Gg: ASbGncuBgVICiAJKuZqZU5DbKXsG3cWlDeTre6QLoVWS2dEbUOxglYaw9c0KEDJJr/q
	1sq3q6HrGZt70UASLvRibWB3eps4JcvALcVa782Mo5gaH+oKbtQSv4q/nUgIyKnOqM47Sg3jy14
	asgl8Cl8Ww1GFg+1bJvhvdqP+8vjBcJwK198IhCgI94WHxUSwrr4bTVw==
X-Google-Smtp-Source: AGHT+IHrv/CfywC3Z3w3v+tLaCUyWoTMwBYk/eQj5k5woE2zOueaVZuMH+tFBRRVB2z8ZWvLPsMmutvF4JK+qBcJAgo=
X-Received: by 2002:a17:90b:17c9:b0:308:5273:4dfd with SMTP id
 98e67ed59e1d1-3087bbc19c7mr12876797a91.26.1745228007374; Mon, 21 Apr 2025
 02:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
 <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org> <nxv2k2ofiao47w7gmqcgfgn57heucs6yp2og3lkzlavjarado7@p5u4663yw3oz>
 <4688d4d4ecee7078e535bb940b6055b9@mainlining.org>
In-Reply-To: <4688d4d4ecee7078e535bb940b6055b9@mainlining.org>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 21 Apr 2025 12:33:15 +0300
X-Gm-Features: ATxdqUGr9nPPKaBUMkNhLDRXQwqcoCYwQ0iMeD2IUAxFlF5xQe-JH9lP3m5xflQ
Message-ID: <CALT56yOyowxkeu5a7MixkujYh8UmBb8wy-L2y3m5Pp-zEZ6p8Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8953: sort adreno clocks
To: barnabas.czeman@mainlining.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Apr 2025 at 12:22, <barnabas.czeman@mainlining.org> wrote:
>
> On 2025-04-21 10:16, Dmitry Baryshkov wrote:
> > On Mon, Apr 21, 2025 at 05:09:22AM +0200, Barnab=C3=A1s Cz=C3=A9m=C3=A1=
n wrote:
> >> Sort adreno clocks in alphabetical order.
> >
> > Why? The order of the clocks here matches the order in which they
> > should
> > be brought up.
> Simple misunderstanding from previous attempts of documenting the
> alwayson clock.
> By the way i have find out a508/a509/a512 clock bring up order is
> different from downstream.
> Upstream: iface, rbmmtimer, mem, mem_iface, rbcpr, core
> Downstream: core, iface, rbmmtimer, mem, alt_mem_iface, rbcpr
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-074=
00-sdm660.0/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi#L85
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-074=
00-sdm660.0/arch/arm/boot/dts/qcom/sdm660-gpu.dtsi#L87
> Should I fix it?

Good question. I will check the msm-4.4 sources later.


--=20
With best wishes
Dmitry

