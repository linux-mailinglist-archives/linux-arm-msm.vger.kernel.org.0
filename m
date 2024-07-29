Return-Path: <linux-arm-msm+bounces-27261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A293F5DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ACA41F22B3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E602714A09D;
	Mon, 29 Jul 2024 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMEIOQvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B773E14A08D;
	Mon, 29 Jul 2024 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722257383; cv=none; b=HdS6rGWeb50Wz5IMGi/Wpd9Wv+jTvd9c2/+81sntm69XXDavJ3a1QHBu74920XEBMgt5avtG4qv/wBe+bEb/yMXcEOu8+Ypn5mFCB78BuVcwTJpiuPiO8bgsFSAG7gHcd/ZEIS32XVAlN609Y6pvGayKh82KTCiyLdhyTFzNmjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722257383; c=relaxed/simple;
	bh=nQGvM2ffOyyckVEVORwdxjX3xtz5tqK6vFCOtu/m4SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3mNHlo55l0jEPjcTuyBobrlOzDw1N/21JbsLDDy6sDHzWTMM6nhdro2q3hO2J9GCSCZjdaP4aeRyA27/eYTL+nBy0sQ+iVQrLBu9dT+Qo+FZDsdzzF53YXSn/LvoHmv7FNM8hwOio7CAmGx/a6DFgx7SDXGMEAvNgdsk5LmiIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMEIOQvg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84377C32786;
	Mon, 29 Jul 2024 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722257383;
	bh=nQGvM2ffOyyckVEVORwdxjX3xtz5tqK6vFCOtu/m4SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MMEIOQvg5mYhWaJVuTiToITfRt+RI+BRm52y4xcu+mpa2tFd0krJMkVBehsIXOkPd
	 66sKg5GN/FpyzhV6T9Ca/BYCdz3g6Cs07+Ymbzeom6hZkc8IN8j8eQebWmQzDOY5Ow
	 o+NB9O+ojDSpMs587Y81rA1+4eW8XFkfTR/+HBjG8DRsi8VD3n0Oa9YZaE0qIZBuPT
	 y/0gP+5nQUWnaHUnZ+B5FX4fdsLLiShPdpTu1QgKDSQA11Fj25nRG2GL8MgupqNuVw
	 vrTWoNtR/baw4riYHSxayXcALe8sny8+yrdFU0zFaI7Bbi9BOGV2v63kSbpvXFu6p1
	 wHNZXXO1nCQVg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sYPoy-000000005B1-2cuA;
	Mon, 29 Jul 2024 14:49:48 +0200
Date: Mon, 29 Jul 2024 14:49:48 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "firmware: qcom: qseecom: convert to using the TZ
 allocator"
Message-ID: <ZqeP7CqEoC5iWAdL@hovoldconsulting.com>
References: <20240729095542.21097-1-johan+linaro@kernel.org>
 <CAMRc=McuqEv1Sk9O6kn4aHo9wOfzskZS0z2QxzNM=q2N8XZ3zw@mail.gmail.com>
 <Zqduv66H2OczRgaH@hovoldconsulting.com>
 <CAMRc=MfEkPcKUNb7HbiNrqv+7q1n0wRD9sKQ8WrydoR4grao2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfEkPcKUNb7HbiNrqv+7q1n0wRD9sKQ8WrydoR4grao2A@mail.gmail.com>

On Mon, Jul 29, 2024 at 02:35:39PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Jul 29, 2024 at 11:58 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> > > >
> > > > This reverts commit 6612103ec35af6058bb85ab24dae28e119b3c055.
> > > >
> > > > Using the "TZ allocator" for qcseecom breaks efivars on machines like
> > > > the Lenovo ThinkPad X13s and x1e80100 CRD:
> > > >
> > > >         qcom_scm firmware:scm: qseecom: scm call failed with error -22

> How do you reproduce this on x1e?

Just boot 6.11-rc1 and you should see the above error (and there are no
variables under /sys/firmware/efi/efivars/).

Johan

