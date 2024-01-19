Return-Path: <linux-arm-msm+bounces-7631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C01832C7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 16:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398F11F2404B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 15:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C247D54BCA;
	Fri, 19 Jan 2024 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qoc7594d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3AB4F1E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705679260; cv=none; b=CeY2c+YdGkV5OjiHtvoE9EZE496hLLb5u4P3PqR2ThLrJDxURHjd2gZQ7Cl85Sx24gva1dj28r3ztuW21HPjCaV5VvMz/Gfz4Dw30zu7lT4LGCOyHztdisi9MX4b34z5I5Hs1qS0D7D/WIu99S/sxW2BvrVikZXtuQ3r2ABnrAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705679260; c=relaxed/simple;
	bh=S2XAmRsrrq8efJFL/NcSJ6cQOOwRfX47JnPU7KEKwpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpuySO6oUr4pKOjm2wib10DRbxWlVfgZkNfGbSMaKZd6HFBj9fXO4WwOTI/oFVjDVzeyfKC29PVBx1YCMSbQ0n6Xb+jph+dRqOTMKNIzCBTEeAwHBNPnm9yHRO1SxXHPz0zEOni9WKGjdCse6PbNrHQll2VI1otS6MHHO9Ntm6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qoc7594d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705679258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Dw5ssVFwdpbX8sXNOoJVVe+yyA2bqWMgIrhhclua6I=;
	b=Qoc7594d7fjEducKbaOoS22RmMKeg8OT7i934K+FOmlX5V7dYi9SICaAkRY+B38rYGXbkT
	pya0Tk1jkO3peQfkXvOPSjSzTDGbr5MqYXY7YwoWj637GdlIGCf9/JSTvrPjahl1yeBkCs
	y7t+N8W5uDQYH6SqL+yrWU5sbrUDrbg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-ul8OIR8rN1SVnMCPo26VjQ-1; Fri, 19 Jan 2024 10:47:36 -0500
X-MC-Unique: ul8OIR8rN1SVnMCPo26VjQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7836f9a4b5fso116884185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 07:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705679256; x=1706284056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Dw5ssVFwdpbX8sXNOoJVVe+yyA2bqWMgIrhhclua6I=;
        b=Ph1+9KkzGK8aRu+NT/zqmlEWItOzHvt8PcapPcTAYzZmrlBWvujGR62yMu30GtH48+
         jcuY4zLw/9QUYbVZ/VeVROCjtZIZIsFmm46y2R0y5nArzNZKR14nM4SUY2f3ffT+BuMl
         lFSn2HPEHcs1qzqPfEUc2Zd2hqAvyTD1XyB6aTRt9923lFNhPnWlnxHEOOmfLHG7v903
         m9I5WyCFnhM7cs4Nla2mZ9NaWnufmBfWdwn5eXtedhIWr/iKBgHl1DUQ6lJegKlE0B/0
         yp5oCln3Ca+Jd3MrQG0tJoaZGMtzoabtDBqFaKFo+To5uqZj8SZSeOZeGLGstiHMsYen
         rLkQ==
X-Gm-Message-State: AOJu0YxR0J9pUHq4Y/9PA/Aw32muoMmsu1l/btVYO99xXM1ZTLCKVi6B
	ENc9y5RfcbimjFkxvBCwq59cu7C0ujdEFnsUVijAanBs3SPlho8ZBjIAz0a3tsZvyLfEoQ9FE8c
	rqUcVuWBk7obFM2t8/hu0/bVMtk9mocaCeDLa5JLtn4c1HtMc7+DEhg0acJesUI4=
X-Received: by 2002:ae9:c015:0:b0:783:6786:4732 with SMTP id u21-20020ae9c015000000b0078367864732mr70107qkk.90.1705679256412;
        Fri, 19 Jan 2024 07:47:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ0e+Usk6t6+dAU9pemLOBjDi5mw1NNpJ/tybCgJexw7y4qiPKPFGLVnJyBNHgnZNWSLnjAA==
X-Received: by 2002:ae9:c015:0:b0:783:6786:4732 with SMTP id u21-20020ae9c015000000b0078367864732mr70098qkk.90.1705679256135;
        Fri, 19 Jan 2024 07:47:36 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id f10-20020a05620a20ca00b007832961ff29sm6134539qka.4.2024.01.19.07.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 07:47:35 -0800 (PST)
Date: Fri, 19 Jan 2024 09:47:33 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Maulik Shah <quic_mkshah@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_eberman@quicinc.com, quic_collinsd@quicinc.com, quic_lsrao@quicinc.com
Subject: Re: [PATCH v2] soc: qcom: rpmh-rsc: Enhance check for VREG in-flight
 request
Message-ID: <dahguk6hyo35ydugwno5t5lbteporwkiddhvxp6uni5ggbtxcm@3bu6ptvg7mdg>
References: <20240119-rpmh-rsc-fixes-v2-1-e42c0a9e36f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119-rpmh-rsc-fixes-v2-1-e42c0a9e36f0@quicinc.com>

On Fri, Jan 19, 2024 at 01:56:54PM +0530, Maulik Shah wrote:
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

Just noticed I commented on v1 when v2 was already out, sorry. Copy
pasting this just to keep it on the latest thread:

Two minor things:

    1. Does this deserve a Fixes: tag?
    2. The Signed-off-by chain here confuses me, you sent the patch
       so your SOB should be last, but then that makes me believe Elliot
       was the author which I don't think is reflected here (no From:
       line). Please read [0] for a bit more details

[0] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#developer-s-certificate-of-origin-1-1

> ---
> Changes in v2:
> - Use GENMASK() and FIELD_GET()
> - Link to v1: https://lore.kernel.org/r/20240117-rpmh-rsc-fixes-v1-1-71ee4f8f72a4@quicinc.com
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index a021dc71807b..e480cde783fe 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -1,11 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #define pr_fmt(fmt) "%s " fmt, KBUILD_MODNAME
>  
>  #include <linux/atomic.h>
> +#include <linux/bitfield.h>
>  #include <linux/cpu_pm.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> @@ -91,6 +93,15 @@ enum {
>  #define CMD_STATUS_ISSUED		BIT(8)
>  #define CMD_STATUS_COMPL		BIT(16)
>  
> +#define ACCL_TYPE(addr)			FIELD_GET(GENMASK(19, 16), addr)
> +#define VREG_ADDR(addr)			FIELD_GET(GENMASK(19, 4), addr)
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
> @@ -557,7 +568,15 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>  		for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
>  			addr = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], i, j);
>  			for (k = 0; k < msg->num_cmds; k++) {
> -				if (addr == msg->cmds[k].addr)
> +				/*
> +				 * Each RPMh VREG accelerator resource has 3 or 4 contiguous 4-byte
> +				 * aligned addresses associated with it. Ignore the offset to check
> +				 * for in-flight VREG requests.
> +				 */
> +				if (ACCL_TYPE(msg->cmds[k].addr) == HW_ACCL_VREG &&
> +				    VREG_ADDR(msg->cmds[k].addr) == VREG_ADDR(addr))
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


