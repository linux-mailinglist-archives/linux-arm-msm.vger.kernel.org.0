Return-Path: <linux-arm-msm+bounces-87684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9548CF8611
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 13:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AF3C3008990
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 12:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D6132E14F;
	Tue,  6 Jan 2026 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXfrnHZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ABB327C13
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767703672; cv=none; b=ujWzcrIk7D22srGjuox3BhhW+kaz+XSc/dg6y4i9jUxI/SYg35a7tuXVdiuVGnbo17ggqTG9FdxgJZIAfaUdpbqaLooWdNzGC3ELwUnIYI7hDhOwYh9tyi10EyxIJf5/YI5qPyeodlbMKsUZq6JNIS3j4/4FimN9E4sKbOXBVVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767703672; c=relaxed/simple;
	bh=NQGC3hiDPKKTWfzYg1u7VRePemVOOQK0yPtv/upFZiI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G04EoIgt6GDyvmb99Otdg78MZnL0WXJCsAcZ1teq4yNsVUXmgWoRfumVKOlk4AQbKpSvSgZWAbvQnva0EtDsIIzDPnI+5ad/CqdGueYmwycdWLdgQa2dTVN57J69ttX3G/QO2f/rFlbMdH82jQb/ESkV4uT6clVm4qEw76x995U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXfrnHZ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCF6C19424
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767703672;
	bh=NQGC3hiDPKKTWfzYg1u7VRePemVOOQK0yPtv/upFZiI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=kXfrnHZ1RhCuhF4Yu67ji1qyJgyC88rFVGpH1nILoIwnOxZT9D0bLQi7WdN6rPIxr
	 2Zbc7idacOWCrZz8nWANJnNnR66Xjjm11wqKOjgEmfbnX0TMJp5OqNJUuL6hlre6ND
	 o3IB0bt1Gup+CkaHsHu+AAkYM2zI+iC3EArf6rhspAHdTIhuGEqNZDECUortPoMVvc
	 qy0tgrx3vYhxM+JtNi6mXvzjGNJ3qBS5yahjtpQypWuI9N2BcgiAlHz1YHHfuKsoYF
	 WDJr/gEeaVq6+OxOTmkFe8++98SWcqBNvsjZrjl5PUKcYyGh/i+KCHXH3AfZNDu/ky
	 2wshmTxo9BoMQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-594270ec7f9so1070632e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 04:47:52 -0800 (PST)
X-Gm-Message-State: AOJu0YyM/ldws9US/dZm36/0pBZB68zKNhJNBi4V6u0+RIBArF/RLrd5
	5fBzBpoMRj6+OnBMAd3LXFb0v+pc5BacIZjgbyT/VKAj3z1uqA95glzgZWiAS9slOCEHlObyOBe
	eWGXmsZpY/mR37X6/15g910F7VMnoO5d48JEIhY7VOg==
X-Google-Smtp-Source: AGHT+IHsOGMS2kWnD7UXPpC7pq1fOQ4U2dZYY2aVj4WcmZGkiBh+z+fLu2SrOhDgKkUso98ZCQ3YB27/lj2jbEkRPpc=
X-Received: by 2002:a05:6512:3c8b:b0:598:ef90:3e87 with SMTP id
 2adb3069b0e04-59b6529257emr966684e87.18.1767703670946; Tue, 06 Jan 2026
 04:47:50 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:47:47 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:47:47 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260106094310.784564-1-jinwang.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106094310.784564-1-jinwang.li@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 07:47:47 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdYUq6q76ZbBA5EWh68BRLby9veWcYG0bgWGkMcSV9GJw@mail.gmail.com>
X-Gm-Features: AQt7F2qmIoZjhJuRB9zmBna7dKx8knRdQqrxaDyXpjctjFf_Lgxa4niRZ3OzmEk
Message-ID: <CAMRc=MdYUq6q76ZbBA5EWh68BRLby9veWcYG0bgWGkMcSV9GJw@mail.gmail.com>
Subject: Re: [PATCH v4] Bluetooth: hci_qca: Cleanup on all setup failures
To: Jinwang Li <jinwang.li@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, 
	shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Jan 2026 10:43:10 +0100, Jinwang Li
<jinwang.li@oss.qualcomm.com> said:
> The setup process previously combined error handling and retry gating
> under one condition. As a result, the final failed attempt exited
> without performing cleanup.
>
> Update the failure path to always perform power and port cleanup on
> setup failure, and reopen the port only when retrying.
>
> Fixes: 9e80587aba4c ("Bluetooth: hci_qca: Enhance retry logic in qca_setup")
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

