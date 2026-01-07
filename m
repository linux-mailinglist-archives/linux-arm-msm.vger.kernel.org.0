Return-Path: <linux-arm-msm+bounces-87796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 311BFCFC534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 08:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBC0630022E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 07:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC36279DC0;
	Wed,  7 Jan 2026 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xSNEt9uh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD0627464F;
	Wed,  7 Jan 2026 07:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767770726; cv=none; b=arUPKvqk4nBm/tsOFE+GYB8fSTXGLEshxPrpJC+9CGZ16L/pPOWX6sJ0InZ0LxsioQ/o8sLSzELkJW+s4zZ5Eaimn65Uk8/0vEQ0A4+Vs6Ygn3TJRXC0TUtHjce6NkmyGMXDiwQQZ5ZwmpK3nJauC+Wi9UwIRwd+uHZIFE73uRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767770726; c=relaxed/simple;
	bh=thvN0uwh9YXtpsZeWiYP8vtN1ZIvl9+T57j472g1vtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+vKret2GGjmH3OHr0A1oz+nAReKXdu6w8kLQTRQjdglBM2o9oqclPeBbkFuVXT/5/HQMQcdtBOfZjdZ3EANOiZkXtwYBoVWC4WCW4fwaTCq7/cYw89IbFnVflWNzup9SmzxFwTnwhDk1vjDxBSQM+O2R01hrozyC/VPfTwdVcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xSNEt9uh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E243AC4CEF7;
	Wed,  7 Jan 2026 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767770725;
	bh=thvN0uwh9YXtpsZeWiYP8vtN1ZIvl9+T57j472g1vtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xSNEt9uh6FURccWWG/op4JE2Hj9fZu3+Gikub2zir/ZSlbNAMKO83yYi8eM0F1yaq
	 VGmzRkGp7iy2JQs3ywAsXQLpTKQGHiWa6kl9UXD3X390xOwP64O7W3c8oOfp9KfhId
	 uKlZMsYN8kxtIJSqWfH4DtEd0fG0q8zygEZdB83k=
Date: Wed, 7 Jan 2026 08:25:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
	andersson@kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com,
	quic_cchiluve@quicinc.com
Subject: Re: [PATCH v1] serial: qcom_geni: Fix BT failure regression on RB2
 platform
Message-ID: <2026010708-bucked-backstage-fd78@gregkh>
References: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>

On Wed, Jan 07, 2026 at 12:18:34PM +0530, Praveen Talari wrote:
> A regression in linux-next causes Bluetooth functionality to fail during
> bootup on the RB2 platform, preventing proper BT initialization. However,
> BT works correctly after bootup completes.

You mean "6.19-rc1", not "linux-next" here.

