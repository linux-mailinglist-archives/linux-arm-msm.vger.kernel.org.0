Return-Path: <linux-arm-msm+bounces-84565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6956CCAA432
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 11:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33D31307978A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 10:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3662D8360;
	Sat,  6 Dec 2025 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbFDulp3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED91F28D83F
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 10:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765017379; cv=none; b=OLLMKC2oivvfGuRAiEW97Oj50/UDNKSVmHo+zwDHh1FRokYIwjMG4ISAEH/BP2tNlPh4mq4JgOYsGTMlejgNHmkzpQFkbsyxtX1Oq2NFkDKSy/2hB4RMRtleW1GQHm+0+rp9i6x01c1ldfcUo9yxd1VNNNWtzhGo5JoDklbGYYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765017379; c=relaxed/simple;
	bh=gpVV63iDglnfpaEWSXD1aX6VXDo3O9ua7snWNryoF3E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrW2ag762ZHWsRMkbd4q3dj+Ub+Rh9/MQ+7/++GEqbNAjaF67GYDlsXsMHwic3yeePKapaDC4YuDkjw6jomdcznw7Q6KNVia0jf7BvLy1siEdBHb6crraE/b5G4b23Fe9wBYSlIJABG9cdTWlzrO5L1tdckfL+9vmMZLT+xqRSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbFDulp3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B94C4CEF5
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765017378;
	bh=gpVV63iDglnfpaEWSXD1aX6VXDo3O9ua7snWNryoF3E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=EbFDulp33Na/XwDV8Rj+879IbM/RrrGGlifCyfnX1JMWpyYjydOGCz8miKqhE9Pfd
	 R3CLkdrN+Sb9GSB7jNMq/hCCkcmPVuR7uB3L7noF6DCXamUVjKFeWzrScPGyUiFm80
	 XifYXEuPppSsfLsBL4awLeaxM5YuS5YFUrQbbUtcGOaZ3x8XQQdNkbjc+X65Mpu87G
	 NNdZNzswphu+3+CjmKBclsKbG9Oo8LnLeCCHxmcqI7wkfjxSi5pU7qSRtW35X3OkxQ
	 RyFUgw3NH26/fxcXdzMMYIUgV7ikowqijQ9dq23eHk22fSr0WQUHy+4ZedXm91Zy3S
	 6dUAtln6UMP3Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso3302427e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:36:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU79QjiLuwiAX8ua2EVVHzcFA8gg9HdOPIosyHuoCPlVva7dScGYzd1HO/KSoPKHTKK/EJiIylOqWN8A1NZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZxoE1XHjZtNQ3qufcVMtPAfturBHLSQkMygf/36H9AE4K56GH
	WqCbD04L+bd4ypcouYka+ehYt9jo9INdPasIMQ2rgmNbsvOfGvCaFPpmwonTGc2pS4861DqO1iA
	9Bo6WZoF1z5cipl84va1CN6HZUHKPJCCXPprd3pBi4g==
X-Google-Smtp-Source: AGHT+IF6DtV7OW+BejuKVtdzjK3twTb49WoGKkQvitpJR/41yEScXdRbSXUcqvOsFNEJ72Er9XF4YpUdDXF5/uploMQ=
X-Received: by 2002:a05:6512:3044:b0:592:f5f9:f5a9 with SMTP id
 2adb3069b0e04-598853c29f9mr536908e87.36.1765017377296; Sat, 06 Dec 2025
 02:36:17 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 6 Dec 2025 02:36:15 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 6 Dec 2025 02:36:15 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
Date: Sat, 6 Dec 2025 02:36:15 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mcx1E3w7roY55HhKZg6pqV+NRkp87KYa5=BUEVJHOXVLw@mail.gmail.com>
X-Gm-Features: AQt7F2oWdedln7_1XCoDS6sUsiV3R704Mi2gnvY4_t_P0x5kXui4g-3uZj4PJtM
Message-ID: <CAMRc=Mcx1E3w7roY55HhKZg6pqV+NRkp87KYa5=BUEVJHOXVLw@mail.gmail.com>
Subject: Re: [PATCH 00/10] Fix up WCN6855 RFA power supply name
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 13:47:19 +0100, Konrad Dybcio <konradybcio@kernel.org> said:
> Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
> closer to reality for wcn6855") renamed the supply representing the
> VDD17_PMU_RFA leg to mention "1p8" instead.
>
> While the supply's voltage is normally 1.8 V, the bindings should
> reflect the actual naming of the pin. Moreover, almost all DTs define
> the output as 1p7, so that ends up looking a little odd..
>
> Ultimately, this is a "fake" regulator that is consumed for the sake
> of DT sanity and this series is meant to bring uniformity and squash
> checker errors.
>
> The last patch fixes up a less-trivial warning.
> sc8280xp-microsoft-arcata is left out because I don't know whether the
> mounting of the chip is on-board or as an M.2-y card (although I would
> guesstimate the prior).
>
> Depends on the long-ready-for-the-merge series by Krzysztof (per-chip
> bindings split of qualcomm-bluetooth.yaml), mentioned below
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

I want to belive there was a reason for it but I no longer remember. :( Is it
possible the schematics for the lenovo X13s laptop had it described as 1p7?

Well, anyway:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

