Return-Path: <linux-arm-msm+bounces-33013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFBD98EE3E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 13:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDDB21C20DF3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 11:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968D41547ED;
	Thu,  3 Oct 2024 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="QThd4GeQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EBC154BEA;
	Thu,  3 Oct 2024 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727955267; cv=none; b=TClgb5CzsR/5WMs3beLXZetzXN3ni618gE5hbY2lIRBY0RjsABNzJfNH40/TaL8MHk59e8D1rkmfvGKYaA2ZtDYjN5Ccdk/13ZKL1CFzb8RMK7L7FpDdXZJsv/BbMa1LFz7xudRRGZwApJyfOl3u9YjPJBcWhuzNuKVElvssZCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727955267; c=relaxed/simple;
	bh=lytAF6G7+96t/NGlepWrahjP5r+Dzd+z5hWk2x/EpQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4GGsw8zvFbTM3lwEd45caoQv8SjM+rIouYpyVbanEuIXtLjOFC1psDcdTs6TtYeBRXw0r4ZTxl3rfC8bROr/Q8jYOwUMM9KmYoO35iUhSGtm6WCCfd/j6ESzWucqt4/HYjJZQ5/X7OOg1xtcR/tJmKRgfmeblsGFJ3vbcLFMjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=QThd4GeQ; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from fpc (unknown [10.10.165.16])
	by mail.ispras.ru (Postfix) with ESMTPSA id 895B840B2793;
	Thu,  3 Oct 2024 11:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 895B840B2793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1727955256;
	bh=6xbHfOn/c+B3eQcY8hfAnIh4MQcoqrJCreQsyDmFveo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QThd4GeQjUw2J/0A7AIVrid/DjVOuRS/xg8RDRFkcYwz7iTbQCBo8QvzoXQwLSltz
	 qLFC6jEgisILQd6WGe5ADyiAV7vp4nmMGdhkg1FdT7Jb2Dp4ApDUpj8k2AE2pYp02i
	 RsblUiyW1SWJ0WU5cB1O/LyyVWuXR5YiHIUflPZ4=
Date: Thu, 3 Oct 2024 14:34:12 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Sujeev Dias <sdias@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: free buffer on error in
 mhi_alloc_bhie_table
Message-ID: <20241003-32e517bde58c5f895164efa7-pchelkin@ispras.ru>
References: <20240207134005.7515-1-pchelkin@ispras.ru>
 <883d5c25-e607-bfe7-1fc1-cad86e828be6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <883d5c25-e607-bfe7-1fc1-cad86e828be6@quicinc.com>

On Wed, 07. Feb 11:09, Jeffrey Hugo wrote:
> On 2/7/2024 6:40 AM, Fedor Pchelkin wrote:
> > img_info->mhi_buf should be freed on error path in mhi_alloc_bhie_table().
> > This error case is rare but still needs to be fixed.
> > 
> > Found by Linux Verification Center (linuxtesting.org).
> > 
> > Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Seems the patch is still not applied.

A gentle ping.

Thanks!

