Return-Path: <linux-arm-msm+bounces-65193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EBCB071D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 11:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F2B77B7584
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 09:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D09C2EF9C5;
	Wed, 16 Jul 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UwtXFol1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0629231845;
	Wed, 16 Jul 2025 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658528; cv=none; b=JkcAnZ+9knM5slS0HKWrELhdZJAuM1t908SaTNxEvDUKLSlSyUA4h2b0IIWDndyLgELuImBq/I5K1CrbmPvh6kjtBYg/pSc7kD/pN8R24l/JlXiMjFaA9OK0p0D9x2Ep7JsWXl9juvFgGnmrUmZIS+gkonmFs/SFALprWYXuKEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658528; c=relaxed/simple;
	bh=+UoP6HakjsOu99hTXGfwuCAynf8EiTySmto4OressMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Izkf7CFK4O0BLLs51Kv5QR81/96oz8RWUzIPXsh5p2rGIL6UByM8Mc0x6QGvrUsm0A8FY1E27geUw1tkUnPDq1MID4YDDxV8ycLvBg8tuAMy91q19t7UppVkHupr9bnruYCbN+8tVnIVRE0ePaxKGmaDTzn+GN1VEPRNfndyK2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UwtXFol1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75DBC4CEF0;
	Wed, 16 Jul 2025 09:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752658528;
	bh=+UoP6HakjsOu99hTXGfwuCAynf8EiTySmto4OressMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UwtXFol1yfKvnmLnKQjoSLFl7YDvUGjBX2FlB0Ei5up0DhFSE1M+dw0QjBqQjG66U
	 hztQUKKSeeAD3UCmXBHk6l2734/gWtGoTKDNw2b5QkjWWQhtWUc/Di8cQ+y2T/8Ptz
	 0pDIfrTr49wgQRLVL/XD0K1y5xFj1hMvSRVq4Kwc=
Date: Wed, 16 Jul 2025 11:35:25 +0200
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
Subject: Re: [PATCH v2 3/3] bus: mhi: keep device context through suspend
 cycles
Message-ID: <2025071617-munchkin-staring-70c9@gregkh>
References: <20250715132509.2643305-1-usama.anjum@collabora.com>
 <20250715132509.2643305-4-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715132509.2643305-4-usama.anjum@collabora.com>

On Tue, Jul 15, 2025 at 06:25:09PM +0500, Muhammad Usama Anjum wrote:
> Don't deinitialize the device context while going into suspend or
> hibernation cycles. Otherwise the resume may fail if at resume time, the
> memory pressure is high and no dma memory is available. At resume, only
> reset the read/write ring pointers as rings may have stale data.


Same here, don't do this.

thanks,

greg k-h

