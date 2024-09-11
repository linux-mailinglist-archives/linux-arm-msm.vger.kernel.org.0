Return-Path: <linux-arm-msm+bounces-31446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E4C974A50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 08:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52CB3B2330F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 06:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122AB76048;
	Wed, 11 Sep 2024 06:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsW4wBYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A1537FF;
	Wed, 11 Sep 2024 06:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035529; cv=none; b=NFu9FESMV3w4nl7Ct7+VmlQJkjPdQcoMygKEG5rufwNYVDQFRoab6wsjehkrwZfhdWGKlzAeGLgaQzc1K4hO3RrtOSHJAeCYyv+rnaNIP75bP05L066KjSMPqqydqYyEm1azl91FB1pVFpss3K6pydjLiC/f5MIjnzxXAznjGfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035529; c=relaxed/simple;
	bh=FgncPijHWGaOcb5Rv2z5lQnokUUiFiUNYC4AMcv8WyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=po6dDP5dSdDqhCjwravaEhAfv6zkz6GH9Slt8RZjQk4y0XEsNGii7AErZaC6d8n20LV4oRx9EAdDNk/SnoQxGxE8hSVMkxSd49+rUVaOYggLb0HmeX6u9OSjcrlv3ZnxsZSiVa01WPuoNHz2U4zTfVAGG8YjBOkY74rGt0XES0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsW4wBYa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D320C4CEC6;
	Wed, 11 Sep 2024 06:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726035528;
	bh=FgncPijHWGaOcb5Rv2z5lQnokUUiFiUNYC4AMcv8WyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LsW4wBYasptu3KFd3WYsZJBgZrTiRbK2o7mvL4DqS5Isly+eNLtZGqYtG7PHoVajb
	 PZarYu5gNg1HEs+//Oirr6FQUxkwp4Fq9Zi5ziPwN8AdrUadJJKOfRCoZaOKhJ8L/v
	 T0taEBJotJhGZzm0uGWfDM/l1Z/K7nz4rE6lg3jJHYy62+KrieeMqnQqa1aqcA5bB5
	 IDilWqtCYCKyFB6TsmCTbhbAufXRZzA8de1tiXjFO/KhPsrc8INLFohllly/4JUJCk
	 trnpzux2+UxacXQUjyz83IEhzkrgOP6AzuygGXjPqakiQS61ZB6K1hX7gR6qywNRRr
	 p4RXv5Xu4B1Aw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1soGh0-000000005jl-2E7A;
	Wed, 11 Sep 2024 08:19:06 +0200
Date: Wed, 11 Sep 2024 08:19:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] serial: qcom-geni: fix console corruption
Message-ID: <ZuE2WkMMkdRDzRFQ@hovoldconsulting.com>
References: <20240906131336.23625-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906131336.23625-1-johan+linaro@kernel.org>

On Fri, Sep 06, 2024 at 03:13:28PM +0200, Johan Hovold wrote:
> This series is a follow-on series to the lockup fixes [1] that addresses
> a number of issues in the Qualcomm GENI console code, including corrupt
> console output during boot, which is a problem for automated CI testing.

> [1] https://lore.kernel.org/lkml/20240704101805.30612-1-johan+linaro@kernel.org/
> 
> Changes in v2
>  - determine poll timeout in set_termios() and avoid hard coding fifo
>    size in calculation
>  - move fifo drain helper under console ifdef to avoid an unused function
>    warning as reported by the kernel test robot
>  - drop a redundant active check from fifo drain helper
> 
> 
> Douglas Anderson (3):
>   soc: qcom: geni-se: add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
>   serial: qcom-geni: fix arg types for qcom_geni_serial_poll_bit()
>   serial: qcom-geni: introduce qcom_geni_serial_poll_bitfield()
> 
> Johan Hovold (5):
>   serial: qcom-geni: fix fifo polling timeout
>   serial: qcom-geni: fix false console tx restart
>   serial: qcom-geni: fix console corruption
>   serial: qcom-geni: disable interrupts during console writes
>   serial: qcom-geni: fix polled console corruption

Any chance we could these fixes into 6.12-rc1? 

Johan

