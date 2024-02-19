Return-Path: <linux-arm-msm+bounces-11646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A485A0DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 11:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF8C7281BD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 10:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255D025578;
	Mon, 19 Feb 2024 10:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZ6kbIYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7BD25626
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708338197; cv=none; b=k75QEJS4YTgVXyvc7tyzzpgNxKRiI9omZu5YmJue9XQ+9c9kHs4KpBgqgB5gjTZZWMr2KiL+jvvihOeSm32hEQg4cf3d5/4bznu74tI/U3G91ueoCnTWmL2lIQXexlqSakb2EPr/2z47KtQO8wAIu2n1sNVc4RvnylV/cavZFHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708338197; c=relaxed/simple;
	bh=RWXNHUGEvBUqJCoB+kDBknBCopB3TrSyunf4vw0H9b4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCGc7ivfP198xsG9eHY9c8A5ti7K5l4C0qd+8U9bJPB179hQg+WQa57DIjSBeqnOC0PmhFCR0K1PS+shCiC94dyKUrYgeNl2Xk0TNIAbKEC2Qvdg0GjoJci55hmYqV1UYNguSRtQY77GtU4GYUarXcqGKBkaBck3WK+fz0EuDPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZ6kbIYt; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so3650508276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 02:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708338194; x=1708942994; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P1ZbvUj4g/1dmV9lTG+hpiBDBBa56SEI8So/qgiUsAU=;
        b=kZ6kbIYttBRbtKi6cPWzdZ7AOKnsKuiU+45xK5OibNJaM8rvdWGITOMrZ5JLM2Cf+E
         79AmBdWjmPNqB1wIYLYRJIuyW0O7mrPHqZXYTq/x/MJ3jzzrCK+drSD4OIAD7HIL/1NL
         nwr4iQwIi8NTHnMb+L065r2LJTqK9zpy0/v35hqV6g1xOVCoM8Emhx7fBL0cRJ/L7xo5
         dzUJCzJ5oT72zQaNm2f7go6xPfXiN7WiUedol08PSU7gGPkaer9dF09/u5Px+OFukkkV
         3XtBf8k+zzfzvV3Xa813+x2AQHqjgMlDRWORJ1NpoEK4RaVVgA8YKwu3w7IgzCRB28uS
         t8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708338194; x=1708942994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1ZbvUj4g/1dmV9lTG+hpiBDBBa56SEI8So/qgiUsAU=;
        b=iusYsbF3uOxnSnZmlpWfiV/i6Ia46cEQBcAXvD4I0+Lfkh+4hqW3sJu5eeUcLfeewb
         C9Bh6EixdqQirkYVquBppe7XuwFTiv6QJdnxwNcLrxar6WKI788e+Nv/uZ979WQiVi4+
         4+KzAHWPXelW58FwelFSigQpMRRPhdsSLyRH5mDdIEY9ZzYsLyyKz4nlAJqgEV6AObDc
         TdP+qKX6H9Ki3ArQInUpPZpomd5hMMMzeEfyUacrLi4OmLBzRdLAzSCWWpkmABJTAS1L
         8+0Nq88mEtYwtMg4CE4+bG6OY7GJ8u9mR7aq4BWNVAUQlV6XNhwqE/spF8O2raaV2Piz
         BhlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlWLyzKWUkQ021VRIn5TrK0J7MQDBnbm+GJ5RMb3BHnJd2X5V/wXiURcG7VO6czr5xCm/QD9bG8hiA8mRV8M5ojwwDjIwJ1fAD5o89ew==
X-Gm-Message-State: AOJu0YwBHOxRWPMkMyzkZ7/s/a3ruqwokbZaXB5t8DIKHVMxgEuFXcBE
	rhhfB00mdyk5QSVJfgOnzoQZpVaX4BhmpDqTDfa4Oev4ZkCwREOk80AbVXzTmeNa7pMu4RyaDpu
	GiV2gf30Cz+K6+7WlrFKi7r9Q4VXuGC7TFwj5dQ==
X-Google-Smtp-Source: AGHT+IH5oIcfK+pzIlzufb2Y2g0Srso+To9j4nOMGd/Wz87mtK+W4F/PAtewgD0Ixr6xM+851B8U0nnEnWifG9DTxEk=
X-Received: by 2002:a25:a348:0:b0:dcd:3663:b5e5 with SMTP id
 d66-20020a25a348000000b00dcd3663b5e5mr9035958ybi.25.1708338194451; Mon, 19
 Feb 2024 02:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122-ipq5332-nsscc-v4-0-19fa30019770@quicinc.com>
 <20240122-ipq5332-nsscc-v4-2-19fa30019770@quicinc.com> <7a69a68d-44c2-4589-b286-466d2f2a0809@lunn.ch>
 <11fda059-3d8d-4030-922a-8fef16349a65@quicinc.com> <17e2400e-6881-4e9e-90c2-9c4f77a0d41d@lunn.ch>
 <8c9ee34c-a97b-4acf-a093-9ac2afc28d0e@quicinc.com> <CAA8EJppe6aNf2WJ5BvaX8SPTbuaEwzRm74F8QKyFtbmnGQt=1w@mail.gmail.com>
 <74f585c2-d220-4324-96eb-1a945fef9608@quicinc.com> <CAA8EJppuNRB9fhjimg4SUR2PydX7-KLWSb9H-nC-oSMYVOME-Q@mail.gmail.com>
 <d518dbc1-41aa-46f9-b549-c95a33b06ee0@quicinc.com>
In-Reply-To: <d518dbc1-41aa-46f9-b549-c95a33b06ee0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 12:23:03 +0200
Message-ID: <CAA8EJppP_bAPRH7Upnq8dO7__xQPOJ6F_Lc-fpRAcutKKzk0eA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: qcom: ipq5332: enable few nssnoc clocks in
 driver probe
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Feb 2024 at 06:29, Kathiravan Thirumoorthy
<quic_kathirav@quicinc.com> wrote:
>
>
>
> On 2/17/2024 10:15 PM, Dmitry Baryshkov wrote:
> > On Sat, 17 Feb 2024 at 17:45, Kathiravan Thirumoorthy
> > <quic_kathirav@quicinc.com> wrote:
> >>
> >>
> >> <snip>
> >>
> >>>> Reason being, to access the NSSCC clocks, these GCC clocks
> >>>> (gcc_snoc_nssnoc_clk, gcc_snoc_nssnoc_1_clk, gcc_nssnoc_nsscc_clk)
> >>>> should be turned ON. But CCF disables these clocks as well due to the
> >>>> lack of consumer.
> >>>
> >>> This means that NSSCC is also a consumer of those clocks. Please fix
> >>> both DT and nsscc driver to handle NSSNOC clocks.
> >>
> >>
> >> Thanks Dmitry. I shall include these clocks in the NSSCC DT node and
> >> enable the same in the NSSCC driver probe.
> >
> > Or use them through pm_clk. This might be better, as the system
> > doesn't need these clocks if NSSCC is suspended.
>
>
> IPQ53XX SoC doesn't support the PM(suspend / resume) functionality, so
> that, can I enable these clocks in NSSCC driver probe itself?

There is a difference between PM (suspend/resume) and runtime PM.


-- 
With best wishes
Dmitry

