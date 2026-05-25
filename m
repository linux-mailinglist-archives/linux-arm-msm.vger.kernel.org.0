Return-Path: <linux-arm-msm+bounces-109689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG62JhRwFGqXNQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:51:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A9D5CC869
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0CED3007B02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25393F58EB;
	Mon, 25 May 2026 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XWIZrwGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5A3202C48
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 15:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779724295; cv=none; b=mT+zoCuiY76ue3F934FgW/qNfJjCINVq5w6W3o/JVzjxGJLTio1dF6y8OqDLwQ2OtrjNKzi32U/3L55VTbEx6MdwN56xBBTVWkV8vQobYl++4wBS6mpsmjHmzTv7UHe9j6LXp+0dstN0CPtxnupTN4xdg2TEz20cpdFHNf0H9o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779724295; c=relaxed/simple;
	bh=h4JKsxxHxHXX16012KivHTd/aLeuX+cnWR5Ms3rwdXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDihg+BiILRm9ZbCSimsgH9zT6j+G4n8R03V+Mi5VdwuRBibO/rSa5OMHmgc3AmePy2jhAZVb432L5a++0T5vjDChBCrBNtmZBRDjRiRFiZma+KUePEptyyJH2giwdYANjT0A1xsv/AgYractiHKYUT7yKjntNNHAXgWt8EFEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XWIZrwGE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so10629303a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779724293; x=1780329093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=slueph07fBXTKZco1NOMPpfAAVF73uomML6Qz2J4th4=;
        b=XWIZrwGEC1lmcTsJc9pmVP/C06SV16aK4K4KawgJGYVUVN3Dw2ocH1FAWsGG+41jH6
         WHfnX5m0uj7bR9xAZtTuSGx7yDImfNYMlvC9egmVOIluhdtFwZ6ZQCvhVNIb6MsvDLfy
         MypcUd8ibosL6mEHr1Mb3esWBzhVk57zrGLgFIQKirnCk0NNZl+vhxj+LVTYNusd2QNJ
         tTHtN55uMgGj5scb5KNQ96fljlh5hil0Jbh2Fw8pHh9JtneRAwYFd9GblTLe6U3Y0DSX
         E78ZcAiOGSH7BEE79/P9XquMRqjJFnNtRvfSCHdxfwGhKAowAsKtYccCFnSm41QL+ZWS
         xbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779724293; x=1780329093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slueph07fBXTKZco1NOMPpfAAVF73uomML6Qz2J4th4=;
        b=nKKpIuXmjWMqm0FxquTEZYmqKkzCEuWJYFEpHzi/U+uWJtj1c5H0eEFrGBPVffWp0w
         Ah77QsL74B+hjoXirJ6lqfyD+wRn/RtHAGwrloS61ohYNHhN4wosgCLKUfThI/q9pB5w
         SjV68LKJESe1iQza6RQxh+VyPkvYk33NLcHvWexX0ev5tMeCwa57q998fdGS1X2lp5K5
         3eAQ77xz3ItYh7yuek4UK/nzYXabgFxodGi8PiA2vmxyqqlMsa+M23EL3MXJJ9zbcH94
         vh5FYGT8B62L1Yg4VT/pZvjroBqIgwHW0/hqHBckaEJhBU447qJy4vE2ErLZlgs4R2HN
         BsGA==
X-Forwarded-Encrypted: i=1; AFNElJ+vNl72p5FgmZ4D9BWasbJeZx6EFhP6J0oJL391UpoW8H0sE5lr0hsFQJwRTyUwGbjbkl4F7kHeSzD0af3y@vger.kernel.org
X-Gm-Message-State: AOJu0YynJu8PYHe/wjZG6KtRncSa+pvg/Ua5sT8GhjQSFf7V43UMrBpQ
	tjTHODjdETmpb1cmMIZ24pUMRyhCU+nwdt855T3F98C6L8CCsyfHEfx3Xzu8yPC7lHrFNi+vCRB
	y3m+v
X-Gm-Gg: Acq92OFzIbeD7JlPeBq6uTPnUR8300J+2l0r+dD3q/j4Agr3tBPXxGES7m92y7SbymP
	AK8Dyis+RW0b39z3FGvhtn1PyTTm4OSxvlkcfmKWoQmFQXdV1qHR07iyl+nG1gfg9YlSQHImpZ+
	SN4+tKHdgJ7M1SR0RXzuS07CWg5BZeZAe2EDscmjC7bQsPxcj7obg8LM4oGtRaQMmA6BwCjTBUB
	3eIIVYihAwpBJKaM5g+eD8CMwOqSvlcYMhqckCJC6iEwafQgv37XDHOCuz1PkCLntmz2IA/lbRI
	w6HRrKidxaPoN7U5hcpyhslVjCifkbK2EkE0LJSH9mVu15Jda//zd72RspunyeaID9RkZyIa6Wq
	p8AUaJ0AuF0xSYCZNHNBOtMGoV5vKw8GyxYaCu/8A+aec+WnYhbX0cXU0MZy8ciHOSNIVAXkL4Q
	PE/xwW0ls0zc/2xWh2eCj29nEij8A=
X-Received: by 2002:a17:903:2f06:b0:2bd:8dbb:293e with SMTP id d9443c01a7336-2beb0687bf1mr172554435ad.14.1779724293217;
        Mon, 25 May 2026 08:51:33 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bf9f:259d:c433:fb32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ed6sm106375975ad.46.2026.05.25.08.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 08:51:32 -0700 (PDT)
Date: Mon, 25 May 2026 09:51:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/5] remoteproc: use rsc_table_for_each_entry() in
 rproc_handle_resources()
Message-ID: <ahRwAhLB8v-KYl2U@p14s>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
 <20260506050107.1985033-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506050107.1985033-3-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109689-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 84A9D5CC869
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 06, 2026 at 10:31:04AM +0530, Mukesh Ojha wrote:
> Replace the open-coded resource table iteration loop in
> rproc_handle_resources() with the rsc_table_for_each_entry() helper.
> 
> The remoteproc-specific dispatch logic (vendor resource handling via
> rproc_handle_rsc(), RSC_LAST bounds check, handler table lookup) is
> moved into a local callback rproc_handle_rsc_entry(), keeping the
> iteration mechanics in one canonical place.
> 
> The callback receives the payload offset within the table so that
> handlers which write back into the resource table (e.g.
> rproc_handle_carveout() recording a dynamically allocated address via
> rsc_offset) continue to work correctly.
> 
> No functional change.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 81 +++++++++++++---------------
>  include/linux/rsc_table.h            | 53 ++++++++++++++++++
>  2 files changed, 91 insertions(+), 43 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index b087ed21858a..f003be006b1b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1011,60 +1011,55 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
>  	[RSC_VDEV] = rproc_handle_vdev,
>  };
>  
> -/* handle firmware resource entries before booting the remote processor */
> -static int rproc_handle_resources(struct rproc *rproc,
> -				  rproc_handle_resource_t handlers[RSC_LAST])
> +struct rproc_rsc_cb_data {
> +	struct rproc *rproc;
> +	rproc_handle_resource_t *handlers;
> +};
> +
> +static int rproc_handle_rsc_entry(u32 type, void *rsc, int offset,
> +				  int avail, void *data)
>  {
> +	struct rproc_rsc_cb_data *d = data;
> +	struct rproc *rproc = d->rproc;
>  	struct device *dev = &rproc->dev;
>  	rproc_handle_resource_t handler;
> -	int ret = 0, i;
> -
> -	if (!rproc->table_ptr)
> -		return 0;
> +	int ret;
>  
> -	for (i = 0; i < rproc->table_ptr->num; i++) {
> -		int offset = rproc->table_ptr->offset[i];
> -		struct fw_rsc_hdr *hdr = (void *)rproc->table_ptr + offset;
> -		int avail = rproc->table_sz - offset - sizeof(*hdr);
> -		void *rsc = (void *)hdr + sizeof(*hdr);
> +	dev_dbg(dev, "rsc: type %d\n", type);
>  
> -		/* make sure table isn't truncated */
> -		if (avail < 0) {
> -			dev_err(dev, "rsc table is truncated\n");
> -			return -EINVAL;
> -		}
> -
> -		dev_dbg(dev, "rsc: type %d\n", hdr->type);
> +	if (type >= RSC_VENDOR_START && type <= RSC_VENDOR_END) {
> +		ret = rproc_handle_rsc(rproc, type, rsc, offset, avail);
> +		if (ret == RSC_HANDLED)
> +			return 0;
> +		if (ret < 0)
> +			return ret;
> +		dev_warn(dev, "unsupported vendor resource %d\n", type);
> +		return 0;
> +	}
>  
> -		if (hdr->type >= RSC_VENDOR_START &&
> -		    hdr->type <= RSC_VENDOR_END) {
> -			ret = rproc_handle_rsc(rproc, hdr->type, rsc,
> -					       offset + sizeof(*hdr), avail);
> -			if (ret == RSC_HANDLED)
> -				continue;
> -			else if (ret < 0)
> -				break;
> +	if (type >= RSC_LAST) {
> +		dev_warn(dev, "unsupported resource %d\n", type);
> +		return 0;
> +	}
>  
> -			dev_warn(dev, "unsupported vendor resource %d\n",
> -				 hdr->type);
> -			continue;
> -		}
> +	handler = d->handlers[type];
> +	if (!handler)
> +		return 0;
>  
> -		if (hdr->type >= RSC_LAST) {
> -			dev_warn(dev, "unsupported resource %d\n", hdr->type);
> -			continue;
> -		}
> +	return handler(rproc, rsc, offset, avail);
> +}
>  
> -		handler = handlers[hdr->type];
> -		if (!handler)
> -			continue;
> +/* handle firmware resource entries before booting the remote processor */
> +static int rproc_handle_resources(struct rproc *rproc,
> +				  rproc_handle_resource_t handlers[RSC_LAST])
> +{
> +	struct rproc_rsc_cb_data d = { .rproc = rproc, .handlers = handlers };
>  
> -		ret = handler(rproc, rsc, offset + sizeof(*hdr), avail);
> -		if (ret)
> -			break;
> -	}
> +	if (!rproc->table_ptr)
> +		return 0;
>  
> -	return ret;
> +	return rsc_table_for_each_entry(rproc->table_ptr, rproc->table_sz,
> +					&rproc->dev, rproc_handle_rsc_entry, &d);
>  }
>  
>  static int rproc_prepare_subdevices(struct rproc *rproc)
> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
> index c32c8b6cd2a7..c6d6d553d8f1 100644
> --- a/include/linux/rsc_table.h
> +++ b/include/linux/rsc_table.h
> @@ -303,4 +303,57 @@ struct fw_rsc_vdev {
>  	struct fw_rsc_vdev_vring vring[];
>  } __packed;
>  
> +/**
> + * rsc_table_for_each_entry() - iterate over all entries in a resource table
> + * @table:    pointer to the resource table
> + * @table_sz: total size of the table buffer in bytes
> + * @dev:      device used for error logging
> + * @cb:       callback invoked for each entry:
> + *              @type   - value from enum fw_resource_type
> + *              @rsc    - pointer to the entry payload (past struct fw_rsc_hdr)
> + *              @offset - byte offset of the payload within the table; callers
> + *                        that write back into the table (e.g. to record a
> + *                        dynamically allocated address) use this to locate the
> + *                        entry for later update
> + *              @avail  - bytes available in the payload
> + *              @data   - caller-supplied private pointer
> + *            Return 0 to continue iteration, non-zero to stop.
> + * @data:     private pointer forwarded to @cb on every call
> + *
> + * Iterates over every resource entry in @table, performing the standard
> + * truncation check, and invokes @cb for each one. Iteration stops on the
> + * first non-zero return from @cb or on a malformed table.
> + *
> + * Returns 0 after a complete iteration, -EINVAL if the table is truncated,
> + * or the first non-zero value returned by @cb.
> + */
> +static inline int rsc_table_for_each_entry(struct resource_table *table,
> +					   size_t table_sz,
> +					   struct device *dev,
> +					   int (*cb)(u32 type, void *rsc,
> +						     int offset, int avail,
> +						     void *data),
> +					   void *data) {
> +	int i, ret;
> +
> +	for (i = 0; i < table->num; i++) {
> +		int offset = table->offset[i];
> +		struct fw_rsc_hdr *hdr = (void *)table + offset;
> +		int avail = table_sz - offset - sizeof(*hdr);
> +		int rsc_offset = offset + sizeof(*hdr);
> +		void *rsc = (void *)hdr + sizeof(*hdr);
> +
> +		if (avail < 0) {
> +			dev_err(dev, "rsc table is truncated\n");
> +			return -EINVAL;
> +		}
> +
> +		ret = cb(hdr->type, rsc, rsc_offset, avail, data);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  #endif /* RSC_TABLE_H */
> -- 
> 2.53.0
> 

