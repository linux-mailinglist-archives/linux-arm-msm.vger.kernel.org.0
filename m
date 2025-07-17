Return-Path: <linux-arm-msm+bounces-65503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6457B09068
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 17:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2C21C44AD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 15:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53482D661D;
	Thu, 17 Jul 2025 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrHJ1mw/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E471E5705;
	Thu, 17 Jul 2025 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752765533; cv=none; b=ktDCkBeCTgJJPdp/tqufvVLbFFRxChWvPLJE2jvOIm2T+tIsj/ROEe8MDDyyULnZeiNUQMER9JZBMK0Tgw5tRD6TA/lkcEbIazLGgTL0NkZ4YWHzgsmbTWmRrsUPVAwzlQNHBxWzgeEQcAtEOnPVQs7GgR1SjZO20KMtJz8rHQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752765533; c=relaxed/simple;
	bh=i51GL0/XBY+T8EAFA0XMbcleXQzO6d2CK+vxamRH1O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXkRF9WCzKPXrg1sPKL2Je/M/41AablscT9LQ+nbAPWmyEV6v+8SONeoL3+ftGlt44o/TwYAUGZA9ALaXWu2GP0v8YZOP5wF3aGuuA8WtepQQjEIGkAxLJeVdM/2LH6VBGKZblKs5oX3pjysxBPxZSyBH8BFh9XsMDO+l1VLtcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrHJ1mw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FDAC4CEE3;
	Thu, 17 Jul 2025 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752765533;
	bh=i51GL0/XBY+T8EAFA0XMbcleXQzO6d2CK+vxamRH1O8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrHJ1mw/O+W7jGxquzxO/p0OFh/Wl36U4kuTP+metx4SiSzajc1xtIzSOCfIzfAc1
	 T6fCpUJxUEDRU+WQbX9YOjLTghQ+fHozow2zWHlqCw17vGI+wWK+rY5X1jVb3+FjMl
	 Kq/mieDHzjeIUq/T4meNx5civIbqS3i8WQzZS6hE0dIhEv8Tq5Xn2sFk6uZxCvgLso
	 at3hdRpJky76Y95d4gSHvn51jBbkgiKD4wBgeCHL0awVPf/HSUxEfjANaWhPmK4M4J
	 sTfgtNvZb02kGfgfEW9pmCwIvaqG7/xsgBvgrboXztmCC4yaV7xJmnGaBlByXW3/j/
	 xLrxWrxyLkvkw==
Date: Thu, 17 Jul 2025 10:18:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <nayazjofc3aexosw5v7xpnn7rwbcjlzyvrgv7ixf3m5o26rdu7@obmkmmvjcjc6>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
 <20250714054133.3769967-5-quic_lxu5@quicinc.com>
 <qg7uvhr2pazrjqrqyraj7pr3hxbzadhenbkps7q4uqhilao2o2@653xyxcx2iak>
 <95541f45-141b-49c9-9b87-1339ee4b436b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95541f45-141b-49c9-9b87-1339ee4b436b@quicinc.com>

On Thu, Jul 17, 2025 at 10:28:44AM +0800, Ling Xu wrote:
> 在 7/17/2025 3:31 AM, Bjorn Andersson 写道:
> > On Mon, Jul 14, 2025 at 11:11:33AM +0530, Ling Xu wrote:
> >> Some platforms (like sa8775p) feature one or more GPDSPs (General
> >> Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide
> >> a FastRPC implementation, allowing code execution in both signed and
> >> unsigned protection domains. Extend the checks to allow domain names
> >> starting with "gdsp" (possibly followed by an index).
> >>
> > 
> > This was called cdsp1 before patch 3 where you removed it and now the
> > same id is introduced but this time with the name GDSP.
> > 
> > Iirc there was a cdsp1 in SA8295P/SA8540P, are you silently dropping
> > support for that here? Or perhaps just renaming it?
> > 
> Cdsp1 support is still there. It's instance of cdsp domain, so we merged it
> in cdsp logic.
> 

But doesn't that mean that

  #define CDSP1_DOMAIN_ID (4)

was wrong? It should have been using the 3?

Isn't that a bugfix? If so there should be one patch fixing that.

Perhaps I'm misunderstanding the relevance of these numbers though.

Regards,
Bjorn

> else if (!strncmp(domain, "cdsp", 4))
> 	return CDSP_DOMAIN_ID;
> 
> In fastrpc_get_domain_id, it return CDSP_DOMAIN_ID for cdsp1 because they use
> same deamon.
> > Regards,
> > Bjorn
> > 
> >> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 85b6eb16b616..d05969de406e 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -27,6 +27,7 @@
> >>  #define MDSP_DOMAIN_ID (1)
> >>  #define SDSP_DOMAIN_ID (2)
> >>  #define CDSP_DOMAIN_ID (3)
> >> +#define GDSP_DOMAIN_ID (4)
> >>  #define FASTRPC_MAX_SESSIONS	14
> >>  #define FASTRPC_MAX_VMIDS	16
> >>  #define FASTRPC_ALIGN		128
> >> @@ -2249,6 +2250,8 @@ static int fastrpc_get_domain_id(const char *domain)
> >>  		return MDSP_DOMAIN_ID;
> >>  	else if (!strncmp(domain, "sdsp", 4))
> >>  		return SDSP_DOMAIN_ID;
> >> +	else if (!strncmp(domain, "gdsp", 4))
> >> +		return GDSP_DOMAIN_ID;
> >>  
> >>  	return -EINVAL;
> >>  }
> >> @@ -2323,13 +2326,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> >>  	case ADSP_DOMAIN_ID:
> >>  	case MDSP_DOMAIN_ID:
> >>  	case SDSP_DOMAIN_ID:
> >> -		/* Unsigned PD offloading is only supported on CDSP */
> >> +		/* Unsigned PD offloading is only supported on CDSP and GDSP */
> >>  		data->unsigned_support = false;
> >>  		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
> >>  		if (err)
> >>  			goto err_free_data;
> >>  		break;
> >>  	case CDSP_DOMAIN_ID:
> >> +	case GDSP_DOMAIN_ID:
> >>  		data->unsigned_support = true;
> >>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
> >>  		err = fastrpc_device_register(rdev, data, true, domain);
> >> -- 
> >> 2.34.1
> >>
> 
> -- 
> Thx and BRs,
> Ling Xu
> 

