Return-Path: <linux-arm-msm+bounces-33812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F266D998132
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CEF21C26FCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB457196450;
	Thu, 10 Oct 2024 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYdzosLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7AE1552FC;
	Thu, 10 Oct 2024 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550636; cv=none; b=cUWjMyPS1U6lWqoFAxT+mS6uPKHebymRE4VRPFLExthAvJ1Jj1c0/LwXLeWgQ40F3u33UmZED6LWCGNs5pI/3/y2jaiWbTJUXfkqphb/Lu+1h9IJUAe5umWOadURnr6kW96F0QtlbwrlpK5Iw5gMoUrfzYIuGizrC7K3ggCVQUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550636; c=relaxed/simple;
	bh=6sNyy2wgEy72PeaKNSBkxaTSPm+UvrsDcqkLCxxJSdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEGcoYX6hUTV4AInab5vFcVkGSTifUgO4l2IlpCRmbwQHEEsHkE4pDatyLEaF6nyUuonpnSbQDj907MEEj5oYkpM4gUiCKFTatHvMQ8IusLlj5+mEai7tyOc5sLz15Oy7GSIVugtRzrEfQcqUscVz95MW1xIIokBbbVpSIHZCPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYdzosLd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9FAC4CEC6;
	Thu, 10 Oct 2024 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728550636;
	bh=6sNyy2wgEy72PeaKNSBkxaTSPm+UvrsDcqkLCxxJSdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYdzosLdbV2ULLpOeu2IinVI0L3ERKz9kh4YnwHgvwVnues6qkOiPnpn8IlR+J3gR
	 ctwKMVUGN+Dzl6/L1An5nPJD7SZsSJuWIUhz8ytDnvgNFRf+WSMuSdLB3zjMUhAmlz
	 4VUhIOyPLqY0ga3Ge7Nm+sNffC5c98fZe7SYhL5iTSZWX249yYT68179sIpKvKu94G
	 1Ycet9zeuSEYFRuYDVGwUDcoF4lgzJi1iNwWf6D+PSz18KE9TGkpMvgNdZkCZctqfC
	 7isuyonTt7+FRo9xZL1WXDCEG3O1ysfSXKDepNWT6QCfODlEyaG41tvQzo5gUdx74z
	 GHDuMiF2MdPNw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syoz2-000000006uB-2IwR;
	Thu, 10 Oct 2024 10:57:20 +0200
Date: Thu, 10 Oct 2024 10:57:20 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
	abel.vesa@linaro.org
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-t14s: add another trackpad
 support
Message-ID: <ZweW8CAwCw7cwYGU@hovoldconsulting.com>
References: <20241004130849.2944-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004130849.2944-1-srinivas.kandagatla@linaro.org>

On Fri, Oct 04, 2024 at 02:08:49PM +0100, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Trackpad HID device on T14s could be found on two possible slave addresses
> (hid@15 and hid@2c) on i2c0 instance.
> With the current state of DT boot, there is no way to patch the device
> tree at runtime during boot. This, however results in non-functional
> trackpad on Product Models 21N2ZC5PUS which have trackpad on hid@2c
> slave address.
> 
> This patch adds hid@2c device along with hid@15 to get it working on
> both the variants. This should work as i2c-hid driver will stop
> probing the device if there is nothing on the slave address, we can
> actually keep both devices enabled in DT, and i2c-hid driver will
> only probe the existing one.
> 
> The only problem is that we cannot setup pinctrl in both device nodes,
> as two devices with the same pinctrl will cause pin conflict that makes
> the second device fail to probe.  Let's move the pinctrl state up to
> parent node along with the parent pinctrl to solve this problem.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> 
> Changes since v2:
> - updated commit log
> - added missing parent pinctrl

Thanks for the update. Looks good to me now:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

