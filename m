Return-Path: <linux-arm-msm+bounces-58028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 485F5AB7D93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 08:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F8927A4318
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 06:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9504827FB09;
	Thu, 15 May 2025 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnR2lEy3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E161A5B95;
	Thu, 15 May 2025 06:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747289459; cv=none; b=HDQ6Y+hBF08stwvSVL1eQmjPgQ/t7sAx6DOSuBCHCFX+Kp8E37113xsvru4jVELY3FiBuFp8TjHfkxlRSUYmxud9zmZxW4bvE49dweERuHDhUlQt9mf+WmsAcdwnuX0/oTG4tS3V8IJkhGfp4TCKv07BZGkFd+EU3LjGyvYHuS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747289459; c=relaxed/simple;
	bh=uwAvIOKiGNt0V7PmuDj4HchROm9VjBjY9WBKCBQ84Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxoedsGJZO+3atYl2G5Z0s15VURroHEdwXkGeXSmFDcewmoWuDQO7Pd+95Ww5SzesO0XUiAfRZsANV8PMY2aNzme8EAuO67lC+g8mzpbLZ/Ru2jfDgyQoSe5OIVqV/OtqLTctl4eqz+oTz6eUmFXnQ3IBY/gAIwUBkRnwMB9Q6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnR2lEy3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFB8C4CEE7;
	Thu, 15 May 2025 06:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747289458;
	bh=uwAvIOKiGNt0V7PmuDj4HchROm9VjBjY9WBKCBQ84Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FnR2lEy3OYI8L29u3+QfR6kLHNYG5uKVEXFva5ImXpzBPvUaO6my2Aw3g3HOBWdlk
	 Uf3VH8l98Ytodmjo29W9o3aHMa7N4L4CHr3H1aLyt2aeedcu8pYXLEHde9ihwiugD3
	 F87YccKQCix44dQYaFuguQYij4bpo2xQ1czzJDceerUYkpZG1Tna25e5M8OYarjLDS
	 FxcR3pTAC5l+fp6mesqZz9wJKoqwoBjqBb9LKjmudVy15r3PXs4Y8xg+Opyc6dS0/P
	 LeeknhiFPRP+nli03LtsMR04uyawJKPPGjCH0Ldj3HvxNdyEdU3JLnmYaeKWjJEGJw
	 OyOUetgHd11Dw==
Date: Thu, 15 May 2025 11:40:45 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Apurupa Pattapu <quic_apurupa@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 05/11] firmware: qcom: scm: add support for object
 invocation
Message-ID: <aCWFZchX9nbZOC89@sumit-X1>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-5-6a143640a6cb@oss.qualcomm.com>
 <aCRkRTMFi65zBODh@sumit-X1>
 <CACMJSev2qqnxLN6OiSEKhUqxeewY09to0Jd2oPNoE39YFS6i3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSev2qqnxLN6OiSEKhUqxeewY09to0Jd2oPNoE39YFS6i3A@mail.gmail.com>

On Wed, May 14, 2025 at 05:27:44PM +0200, Bartosz Golaszewski wrote:
> On Wed, 14 May 2025 at 11:37, Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > Hi Amir,
> >
> > I am still unable to get the QCOMTEE driver to work on db845c. As I can
> > see machine: "qcom,sdm845" is not supported for tzmem based on SHM
> > brigde here: drivers/firmware/qcom/qcom_tzmem.c +81. I am still seeing
> > following logs from userspace:
> >
> > # /mnt/unittest -d
> > [test_print_diagnostics_info][31] test_get_client_env_object.
> > [test_supplicant_release][65] test_supplicant_worker killed.
> >
> > I think you should first check here for SHM bridge support. If available
> > then only add a QTEE platform device.
> >
> 
> On platforms not supporting SHM Bridge, the module should fall back to
> non-SHM mode. Isn't it the case?

Okay, I see. Amir clarified offline how the non-SHM mode works.
IIUC, the memory registration with QTEE is not required and instead QTEE
can directly work with memory references being passed as part of object
invocation.

So it looks like the user space app not working on db845c is another
issue with QTEE which needs to be fixed. 

-Sumit

