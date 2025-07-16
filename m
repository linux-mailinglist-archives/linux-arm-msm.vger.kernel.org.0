Return-Path: <linux-arm-msm+bounces-65192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F7B071C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 11:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 840F3582021
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 09:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDE52EF67E;
	Wed, 16 Jul 2025 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2eVHaAdj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4849C2EF646;
	Wed, 16 Jul 2025 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658517; cv=none; b=M1bMcgw/pL2Ff4yT192Ph8LEGa0iPEfu57IjHdfO8fkGNAkpLASvla75D9h0DVmbrrIGdDAPRExzLtuf+JFO6hmJ/E/N2woIWJp9OIBDR8AYiVmY57I2raJ30qzE7//ivsomZly0B15OBd/dmVBCuxySBQgBG7gRRHDrew9cAoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658517; c=relaxed/simple;
	bh=SBVO6v4SK+YzY8tNUrFpy/1O8sbEkX7yvLiwFjd+QU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFH8rX89LaeWq03XIAkWRsBUwXEueTF4YCbSm8d3XmSpgh8seJaLUb+xabLE7IFY4aqeecR3FNX3ZoEwdqb4xMW4uF8HqXZsK8lyvmTo4VDEGoDohofK0EtRygiMolRYQPvIanMxaJVmYTCNeNcUde4ah1gQVnLPDpK0QSETTxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2eVHaAdj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47998C4CEF0;
	Wed, 16 Jul 2025 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752658516;
	bh=SBVO6v4SK+YzY8tNUrFpy/1O8sbEkX7yvLiwFjd+QU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2eVHaAdjsvmm3lavlM0+UnfSN9bylMSPfiY41gJATe3GuLgojgUFoH1JDSfQgQvx4
	 8zVs+8k8zCjovL63AzxOd2wNi5/mnIlIt9JaLR2IkUolZ0Zr/k/g80bX04r2whHs1E
	 wQP5dQYfAJwH9rPz+P63Ti3AE421b9ur8aqbJniE=
Date: Wed, 16 Jul 2025 11:35:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Yan Zhen <yanzhen@vivo.com>, Sujeev Dias <sdias@codeaurora.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/3] bus: mhi: host: keep bhie buffer through suspend
 cycle
Message-ID: <2025071651-rake-rake-7a13@gregkh>
References: <20250715132509.2643305-1-usama.anjum@collabora.com>
 <20250715132509.2643305-3-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715132509.2643305-3-usama.anjum@collabora.com>

On Tue, Jul 15, 2025 at 06:25:08PM +0500, Muhammad Usama Anjum wrote:
> When there is memory pressure, at resume time dma_alloc_coherent()
> returns error which in turn fails the loading of the firmware and hence
> the driver crashes.
> 
> Fix it by allocating only once and then reuse the same allocated memory.
> As we'll allocate this memory only once, this memory will stays
> allocated.

Again, no, do not waste memory like this.  If all drivers/devices did
this that would be horrible.

greg k-h

