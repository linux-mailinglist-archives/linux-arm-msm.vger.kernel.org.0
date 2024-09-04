Return-Path: <linux-arm-msm+bounces-30774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A0B96C601
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 20:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1B35B227E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 18:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BF11E1A2F;
	Wed,  4 Sep 2024 18:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cjO2MaxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440401E1A18;
	Wed,  4 Sep 2024 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725473342; cv=none; b=MAGAIKGHHsHOLxRGv1ZdUmp7fZf/mu9fz8IVF4B8gH7MF61vbhgDggLMQ94jbWzlZRY7QhmWtahvRsC9oAoRnJBMGNAZOpV4h5JlE0LEJ/iVQxrlJJS68FYlndfdShmFTddPWQwdkkevU7ihaTnRF8VYZQXwNEp0ga+GmnkM//0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725473342; c=relaxed/simple;
	bh=l0DM/F9pT9iRieeb6jTA/2NiCKWy8nvfiUH+NKPnzgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVAaW1T7uqZk5VKAHrYi5WozG3LOwFJ086vVWJLDhcNm9OEUMXkFBSOzQm3gmYYmyUPDXluIWpVFScCcNs1gnw/2nbIWFhEFesDdGnkT5ucJP1krYm2E3kUOk3687rO/Y66NSD1ROa3i70CF95snfjZRZ5R01GT1KGA6e/4+lKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cjO2MaxK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725473337;
	bh=l0DM/F9pT9iRieeb6jTA/2NiCKWy8nvfiUH+NKPnzgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjO2MaxKRwFea3okgn3X8h+EkZs/+TQRzli8vFDp60TZrqSZj6uu8UnJqHR/x8oOV
	 TpQ+AEGw80k3VkUOKHvyRX7WQTbwj0Gs2vGwaNVXqRZedw8C2fmIfVrhaKvsbA/agt
	 yjVnRhx/U90oUEo+OF+9pZcMecUQkjjJBjgkZe3FocKy3Y5C4rtJE7FvxvtDgP7mIr
	 ptCMfJHQXfYKRNPdECfCX/2MgBfTe+j51wwi42euNB/q8x9YfO6N/WYB/wGF8d+cNl
	 fdOIJlP+VUAP7VRrucD+1+yfk8WKXVKbk6QmlKYumj46zIENUbPxvOVXxOLjlvVSid
	 SI7/mGORk72eA==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 622E817E35E0;
	Wed,  4 Sep 2024 20:08:56 +0200 (CEST)
Date: Wed, 4 Sep 2024 14:08:54 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] serial: qcom-geni: fix console corruption
Message-ID: <c47714f0-045d-469a-9edf-e4e4cb5090dc@notapiano>
References: <20240902152451.862-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240902152451.862-1-johan+linaro@kernel.org>

On Mon, Sep 02, 2024 at 05:24:43PM +0200, Johan Hovold wrote:
> This series is a follow-on series to the lockup fixes [1] that addresses
> a number of issues in the Qualcomm GENI console code, including corrupt
> console output during boot, which is a problem for automated CI testing.
> 
> Johan
> 
> [1] https://lore.kernel.org/lkml/20240704101805.30612-1-johan+linaro@kernel.org/
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
> 
>  drivers/tty/serial/qcom_geni_serial.c | 133 +++++++++++++++-----------
>  include/linux/soc/qcom/geni-se.h      |   9 ++
>  2 files changed, 85 insertions(+), 57 deletions(-)
> 
> -- 
> 2.44.2
> 

This series fixes the serial issues we're seeing on the sc7180 based
(sc7180-trogdor-lazor-limozeen and sc7180-trogdor-kingoftown) boards that we
have hooked up to KernelCI. Out of a 10-job batch of boot tests all succeeded
after the patch, whereas before most failed (7/10), due to a missing message in
the serial.

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Looking forward to see this landed!

Thanks,
Nícolas

