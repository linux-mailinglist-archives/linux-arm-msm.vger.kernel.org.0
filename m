Return-Path: <linux-arm-msm+bounces-104769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOO3CPWV72lyDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:59:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 644CD476BD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E595830075E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4863DA5DC;
	Mon, 27 Apr 2026 16:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jmLb1AXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EC1381B1F;
	Mon, 27 Apr 2026 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309159; cv=none; b=LUvuqpZnXGI3nX8ZOywJoNvAXCk6i62j3FOYcl8RXu15d6zFrDutLWxF/tImCREI8QEbEr/hIvmrvOUVUg2adxoWTfD82AaRSXGj093V+vmuncqN0IzuABT0hIjXTcFRfbkBZ+pxFlngTdiuvPPmkzRPl+JnVKr1u1SJZKF58/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309159; c=relaxed/simple;
	bh=7Kd2Dnx/mPiJejhHB2UzLEvDM0wFuW0EGYMjY2Aokdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFIsEsk+CmVyE4OG9F/GHu35heNXLh49hxYRkb86+NWffa4Q9YUP7/ktgfhCMvsLJQsqzffZ9J2sCaIjLK+RDpUGvLXPTPrsamDaGwk+s1t8vfE5gCNCRmkyDcKz1/SnKn9sGfzyd+1A9QczO81N1+cw4U3TX9iRObI5j8C7tEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jmLb1AXa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F782202C;
	Mon, 27 Apr 2026 09:59:10 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B01763F763;
	Mon, 27 Apr 2026 09:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777309156; bh=7Kd2Dnx/mPiJejhHB2UzLEvDM0wFuW0EGYMjY2Aokdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmLb1AXaf/43gvezyq09ZgyMr1KLIp/4sZxuVZ34l8XUnO7P+Ez8uNogX4CeOAIFn
	 UOHJ4ud9+zsm26h90ZXbUUhxjg9BQVP8RPB7l9jEbr+qlzh2ILcLUCE7y/jGS8F3Ub
	 DoRmeCdmSXdQTPz7YbsZxrm5QjlTFFLv5QdNt0cY=
Date: Mon, 27 Apr 2026 17:59:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_yingdeng@quicinc.com,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
Message-ID: <20260427165913.GA16537@e132581.arm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
X-Rspamd-Queue-Id: 644CD476BD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104769-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:dkim,arm.com:email,e132581.arm.com:mid]

On Sun, Apr 26, 2026 at 05:44:38PM +0800, Yingchao Deng wrote:

[...]

> @@ -316,23 +316,33 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
>  {
>  	struct cti_trig_grp *tg = NULL;
>  	int err = 0, nr_filter_sigs;
> +	int nr_trigs = drvdata->config.nr_trig_max;
>  
>  	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
>  						     CTI_DT_FILTER_OUT_SIGS);
>  	if (nr_filter_sigs == 0)
>  		return 0;
>  
> -	if (nr_filter_sigs > drvdata->config.nr_trig_max)
> +	if (nr_filter_sigs > nr_trigs)
>  		return -EINVAL;
>  
>  	tg = kzalloc_obj(*tg);
>  	if (!tg)
>  		return -ENOMEM;
>  
> +	tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);

Here would be:

  tg->used_mask = bitmap_zalloc(nr_filter_sigs, GFP_KERNEL);

> +	if (!tg->used_mask) {
> +		kfree(tg);
> +		return -ENOMEM;
> +	}
> +

It is likely this will have merge conflict with the new patch [1].

You might need to rebase this patch on the top of [1]. We need to
give [1] priority as it is a fix.

[1] https://lore.kernel.org/linux-arm-kernel/20260426-nr_sigs-v1-1-3b9df99dab97@oss.qualcomm.com/

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

