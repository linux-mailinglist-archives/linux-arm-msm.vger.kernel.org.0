Return-Path: <linux-arm-msm+bounces-32885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22DB98BE1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 15:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66EDC2853E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 13:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C4E1C3F34;
	Tue,  1 Oct 2024 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3LBZkwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34BB6AA7;
	Tue,  1 Oct 2024 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789952; cv=none; b=NPoPtfLlqljS9MsKl9UhMt5yJRE5tNaMXbzI+MaTkSFH9XT4JZazVoHB/hJAV7Du95hCFcIT9Ng/18HWbNkebxr16r99Wvuus8eNaL6onQOBhvfBz3JgiaN8/Z9c9/mb7jwNbMns19q55h+rKC/29vjr0g1SJSTmYOANx6lnngE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789952; c=relaxed/simple;
	bh=aw8Zi8+Zmdb80JGksXuvNr/EE6LmzOtQfwjx4i3y3Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liu1zGlSvtfwtZCH7o1O0Cpuv3b8zLleiXvP0ce22xlqhpvCW4sffoOVvM9w5NxlReUR7J14Bwl6U5ATHcmIsLlEQwhFyO5EVuTTFVuJdvw6UI128M7Mm0V1HaZQIQTMFtJ9nRqkcHmyq2pXUcKREr+2VeL6gJCkNkslPtf3tw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3LBZkwN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDD6C4CECD;
	Tue,  1 Oct 2024 13:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727789952;
	bh=aw8Zi8+Zmdb80JGksXuvNr/EE6LmzOtQfwjx4i3y3Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i3LBZkwNp5vUpwy3ZnUfzXzvbSGDmnlrmu2dQKB3hn5jfhKJ9Jy0OBNRLV7Z5WacK
	 01HkNEq4xPZ75IqOXU+ln8/C5A0L4Y91kEMIH0EwkvhA0Uq8FizFbLySDlZeM4b24b
	 TmVqLHE4Bhe9bhwEBiH4TwIkJb7e+o/vsEHd6oi7Z/YTuM/t6BI8iUN2eCGzsVpN3W
	 BLHwvdFeD3TAY59ktr3ddvli8I+LtOeU+UQg3xCDgQYg4/cdXB31duDRwMkNPV/Kkz
	 xOrt8E7opL6XntmLOHI6bMrMtuu+BUp54l7CYDV7dlpPXOKBWwdaLy9q272irAJPUr
	 A3LmkIiwEKRaA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1svd5r-000000003nU-21Bx;
	Tue, 01 Oct 2024 15:39:12 +0200
Date: Tue, 1 Oct 2024 15:39:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/7] serial: qcom-geni: fix shutdown race
Message-ID: <Zvv7f-3cQ92YlKik@hovoldconsulting.com>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-3-johan+linaro@kernel.org>
 <CAMRc=MeYSsh+MOrOHSabiHuyGOrZK330WuNXcGDtg-siJFya=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeYSsh+MOrOHSabiHuyGOrZK330WuNXcGDtg-siJFya=g@mail.gmail.com>

On Tue, Oct 01, 2024 at 03:36:57PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 1, 2024 at 2:51 PM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > A commit adding back the stopping of tx on port shutdown failed to add
> > back the locking which had also been removed by commit e83766334f96
> > ("tty: serial: qcom_geni_serial: No need to stop tx/rx on UART
> > shutdown").
> >
> > Holding the port lock is needed to serialise against the console code,
> > which may update the interrupt enable register and access the port
> > state.
> >
> > Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in progress at shutdown")
> > Fixes: 947cc4ecc06c ("serial: qcom-geni: fix soft lockup on sw flow control and suspend")
> > Cc: stable@vger.kernel.org      # 6.3
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

> I already reviewed this[1]. I suggest using b4 for automated tag pickup.

There were changes in v2 so I dropped your tag on purpose.

Johan

