Return-Path: <linux-arm-msm+bounces-7630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29276832C73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 16:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DCCC284C6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 15:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A70954BD2;
	Fri, 19 Jan 2024 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QRdpXRoe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F4354780
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705679057; cv=none; b=DwNK6AZNVlx4aYxV72bEzJf5dfXFdS0kiimhRHYq6f5qyPgmoXNivQFdRgdQCbTkmCdlvISWpNg9A6vHnO/qR0MiM5bEPpj/OltD6IbcmertfM+mrHhhtiWlvPRIZnsBerSem2VLIuFaoPoglMhLiFAjzpxVYP5gCFcN+skbqPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705679057; c=relaxed/simple;
	bh=q5UJVGX3yfRfi60/H2zTOA89guV2jb+xgf5zKB4s9SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0rZ08lwQTePP2myHpi9TVqNkOneU2j6UCmm88t9840lh1eREj2k0QJQgbus4QxDXWlErVxLjhtisTthaySBNCU7lVaaWI2zhY9yNhyD5jyrsFZJD8t01FDJTD+cmd9uBMPapKr8q7U9KX9uaaEdFzaQnVJbLByhDgnSIx/H56Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QRdpXRoe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705679054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjYsUi6PYjDB4zhjAZoeXh7tMhPQit/CHnee+lSIhAM=;
	b=QRdpXRoeptX9Co8jmQ3x5csLC7qbVPqzj5z2lG1G25YCU1VMZpz3eVmA9fX7V0zHUMZq09
	sTpPGrNsUpYNus2qdKf/i5tL3qxvhzWnkDayCKloFMbqanNMNzAi516IF2QlcR7+xhvG/s
	OfsG8kDqQgYfjzMAhSnVJxzsphmxqAY=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-d5j1fvHON7aWVHBzPCu9Tg-1; Fri, 19 Jan 2024 10:44:12 -0500
X-MC-Unique: d5j1fvHON7aWVHBzPCu9Tg-1
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-466e4de8230so379153137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 07:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705679052; x=1706283852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjYsUi6PYjDB4zhjAZoeXh7tMhPQit/CHnee+lSIhAM=;
        b=mIPzGW3uz7cSQiwFseVPVUcwDJODXGAe3YgCX7Lyf4FYKiXBtSC3tmfFtD1+moA9dp
         7cRliP/Oo2jllL1njFYZn50MjPTB6B8cXRv85+V0c/pvnlXQRNKndL+j3Ij+pJoS1Q1R
         6HtwXSklfxgDLcWxTTVZPsTaHF6CEgyt+J38+eWKXa2TDF6cDEHZ4aBrxT78gaWjnhsV
         y9UyFO7SNxNM1vtA+/UJ/9aVD4hT9pDzhwlSrrBx0/shOv0ul4nWKheRCQDh13J1bU+s
         hhcat1ciqf/uGHBlE/fZpXar5H1LyOL9rYSee7cEv2FUFZXz0SjnKaNaSvXlVKrdDYMC
         A3Wg==
X-Gm-Message-State: AOJu0YwEpznpoP4HTTBBSmk4NVP69QnsMF+tx+eXs5dRZQIrer/2ZjaW
	mI356Vh/7cnnDFH3gCAOaKdFhVKwFJlAnqj9DRulFrdEOSISYyI2zF3pZ6zGK5Xxw7g/OGDtk5c
	faeKsoy4+stA5WtjHUVZ3xVjwdW4NOrV+h4pz6ufkAnr9VJUXXPUAmV45tb3YDts=
X-Received: by 2002:a05:6102:162c:b0:469:a26c:cd40 with SMTP id cu44-20020a056102162c00b00469a26ccd40mr343266vsb.71.1705679051972;
        Fri, 19 Jan 2024 07:44:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQAFTPc2F/rZAHEH0XAopgBDhs3oui2/5EzTmX8AuLUGPhO0TyKvAjcXSh+rDUgPiYp2JKLg==
X-Received: by 2002:a05:6102:162c:b0:469:a26c:cd40 with SMTP id cu44-20020a056102162c00b00469a26ccd40mr343255vsb.71.1705679051642;
        Fri, 19 Jan 2024 07:44:11 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id ow18-20020a0562143f9200b006849db7c44esm247053qvb.60.2024.01.19.07.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 07:44:11 -0800 (PST)
Date: Fri, 19 Jan 2024 09:44:09 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Maulik Shah <quic_mkshah@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_eberman@quicinc.com, quic_collinsd@quicinc.com, quic_lsrao@quicinc.com
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Enhance check for VREG in-flight
 request
Message-ID: <6tnescmrw4j2wzhc2p2lih6624xgt7spoxj2ahus6wzfcmmear@cqdkohjquzr7>
References: <20240117-rpmh-rsc-fixes-v1-1-71ee4f8f72a4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117-rpmh-rsc-fixes-v1-1-71ee4f8f72a4@quicinc.com>

On Wed, Jan 17, 2024 at 02:24:10PM +0530, Maulik Shah wrote:
> Each RPMh VREG accelerator resource has 3 or 4 contiguous 4-byte aligned
> addresses associated with it. These control voltage, enable state, mode,
> and in legacy targets, voltage headroom. The current in-flight request
> checking logic looks for exact address matches. Requests for different
> addresses of the same RPMh resource as thus not detected as in-flight.
> 
> Enhance the in-flight request check for VREG requests by ignoring the
> address offset. This ensures that only one request is allowed to be
> in-flight for a given VREG resource. This is needed to avoid scenarios
> where request commands are carried out by RPMh hardware out-of-order
> leading to LDO regulator over-current protection triggering.
> 
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Two minor things:

    1. Does this deserve a Fixes: tag?
    2. The Signed-off-by chain here confuses me, you sent the patch
       so your SOB should be last, but then that makes me believe Elliot
       was the author which I don't think is reflected here (no From:
       line). Please read [0] for a bit more details

[0] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#developer-s-certificate-of-origin-1-1

> ---
>  drivers/soc/qcom/rpmh-rsc.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index a021dc71807b..5371d7e3090a 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #define pr_fmt(fmt) "%s " fmt, KBUILD_MODNAME
> @@ -91,6 +92,15 @@ enum {
>  #define CMD_STATUS_ISSUED		BIT(8)
>  #define CMD_STATUS_COMPL		BIT(16)
>  
> +#define ACCL_TYPE(addr)			((addr >> 16) & 0xF)
> +#define VREG_ADDR(addr)			(addr & ~0xF)
> +
> +enum {
> +	HW_ACCL_CLK = 0x3,
> +	HW_ACCL_VREG,
> +	HW_ACCL_BUS,
> +};
> +
>  /*
>   * Here's a high level overview of how all the registers in RPMH work
>   * together:
> @@ -557,7 +567,15 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>  		for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
>  			addr = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], i, j);
>  			for (k = 0; k < msg->num_cmds; k++) {
> -				if (addr == msg->cmds[k].addr)
> +				/*
> +				 * Each RPMh VREG accelerator resource has 3 or 4 contiguous 4-byte
> +				 * aligned addresses associated with it. Ignore the offset to check
> +				 * for in-flight VREG requests.
> +				 */
> +				if (HW_ACCL_VREG == ACCL_TYPE(msg->cmds[k].addr) &&
> +				    VREG_ADDR(addr) == VREG_ADDR(msg->cmds[k].addr))
> +					return -EBUSY;
> +				else if (addr == msg->cmds[k].addr)
>  					return -EBUSY;
>  			}
>  		}
> 
> ---
> base-commit: 943b9f0ab2cfbaea148dd6ac279957eb08b96904
> change-id: 20240117-rpmh-rsc-fixes-6c43c7051828
> 
> Best regards,
> -- 
> Maulik Shah <quic_mkshah@quicinc.com>
> 
> 


