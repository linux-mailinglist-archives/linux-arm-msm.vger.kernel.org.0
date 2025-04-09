Return-Path: <linux-arm-msm+bounces-53624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417DA8228A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 12:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1098F4A3B42
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 10:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76F625D8EC;
	Wed,  9 Apr 2025 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wcqy/Ni2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C12D2566F3;
	Wed,  9 Apr 2025 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195512; cv=none; b=uh4vf8Hm/QD/seXGEwYVgf1Y2HtRCC6KXwF1+P/efsJYL8pksuQrD9tDU+NJc65U/NFbPQtQkm7dXIBSCTTawyclsjM07Y1Cb06shu0FcshF3g72V7vAQAl+KSIaEiOL9VMLIeb46mymR4PlITw8TW5AgaQwj+GkgxjiurLjyvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195512; c=relaxed/simple;
	bh=qP4wnnslzwJV/Oha7IFi5SF//MOXWF7Y9CDueTRiXuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/sZNSa4Ao8L8ylJBQGgmatkAstu29ko1Oaxz7muTeazzgujp0dDXs1+jDrDxuUxAuGk/d0mX6sM5ANcdnGMJc3uYu60tYiEGIYStUvBBrbstK2b2NZL9L5wu97XUiP656/Bh6jgula2S2KCwbVRUDl++Oe75tkE33pedLMdfUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wcqy/Ni2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2D2C4CEE3;
	Wed,  9 Apr 2025 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744195511;
	bh=qP4wnnslzwJV/Oha7IFi5SF//MOXWF7Y9CDueTRiXuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wcqy/Ni2mZMOOoYk019Fb8swTdBIBlygTp2HoeJqXUHgeFegjU4GCfz9xwRqKlGgO
	 gPnuGxulaDByGvJ7jzKuGKfB9OAjN/yD0tmB7tGRm3uqAwukhOG9WhR0ITuMGBwFjR
	 2Ek+HQ0Fp9MH+Bttk0dh2f6oBIg62mXls/GvcgKs=
Date: Wed, 9 Apr 2025 12:43:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Yan Zhen <yanzhen@vivo.com>, Qiang Yu <quic_qianyu@quicinc.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Sumit Garg <sumit.garg@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: host: don't free bhie tables during power
 off
Message-ID: <2025040918-preflight-elliptic-7046@gregkh>
References: <20250409082444.582295-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409082444.582295-1-usama.anjum@collabora.com>

On Wed, Apr 09, 2025 at 01:24:26PM +0500, Muhammad Usama Anjum wrote:
> Tested-on: QCNFA765 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

This is not a valid tag in the kernel, please remove.

thanks,

greg k-h

