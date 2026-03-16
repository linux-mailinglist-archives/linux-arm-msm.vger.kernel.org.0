Return-Path: <linux-arm-msm+bounces-97921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDn2LALkt2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:05:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBAF29876C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90BAE30292F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7C92749E6;
	Mon, 16 Mar 2026 11:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VAX7nOJB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sX62fuGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9DD26D4E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659102; cv=none; b=uD5IcGW+UgZus09fSzud/hgZPQa+T2YuStDzNlFVhqh5b0XwP0awKmZsWJIJZ7xeAuDwL7bgHMrGJGcs2Q9WzepdHaCgQShF8Nzkg9J8RjtpliJY6hbRfGmqd5x/952Q31GBDvX8gl9f/u0ndpTOP7DtE3kd0V+5Tx99lutbO/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659102; c=relaxed/simple;
	bh=TnLlXCOEwB+F51krmexkeVovZ5TzhMYqfqPBDnMdWqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZwiot6VmkEJpjum+8/ze/7bf9ph/25ofkJ79e7sIH6C0+5QIXIH13/efamMF/PoGT1E0DQvFAMOdYW4eng0IE1KOJb/Nyuua12PpO37rFxa6r2H0s+OSMefZT1Lt8MglD0Y4wE1GG62a8YBWU+8FeutOUQkfsdfGmpkpEdd2mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VAX7nOJB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sX62fuGg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773659099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0dYerS74j221fuo3Jw2PY9y8EQKWVdbS7rEMHtWNq8=;
	b=VAX7nOJBgN+hroQySovJN0QZ8QHk4/nhz1ZHjVKPFrCDgy9fpZeTIdZiwOwLzw5sEaLaFO
	R1do0Y9tinVCistxO3OdQYoe3aXymb7gMx6LXSrR4/peu3GRU4JJem0yt6SB0KDk1TEzSC
	u5ppDy3YIZJtyrVXeERy2JbsPi47WUE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-QKV-eoSNOUiVTiqKXS94Jg-1; Mon, 16 Mar 2026 07:04:58 -0400
X-MC-Unique: QKV-eoSNOUiVTiqKXS94Jg-1
X-Mimecast-MFC-AGG-ID: QKV-eoSNOUiVTiqKXS94Jg_1773659098
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c56a7e610so41390516d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773659098; x=1774263898; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0dYerS74j221fuo3Jw2PY9y8EQKWVdbS7rEMHtWNq8=;
        b=sX62fuGgP5eQS2XTvCxEBEF0tVOD5eiBBKzp/IuV7RaDHjFvofI/I8cRt4sVpPqXh1
         PguMMPjrVEI3HyzQ7hty97cQcD1qJgvIf+sz+F46ZFw4NndpfsChl0+C3i3bs/dQsj1b
         uc9Ek5MZKrY2wy0ytzeyh/WqhJ2Ui6gqYJbobg/16cm5YQb+7Cd7psl+WMgmmmCvl+JB
         DZ9Gp2bONklUHc2j+142mzPYAPdnlBDfxssafH7DSQ0WPxJkHWzoyaSe7MuH7yCHLo4V
         wQdac1VE5eoKzlPrFZww/MigoPrCUEZMD2VSdaMqsQ136uLmBFV4TsQlXebI85RHdy+K
         9JiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659098; x=1774263898;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0dYerS74j221fuo3Jw2PY9y8EQKWVdbS7rEMHtWNq8=;
        b=BgtVHIukF/EpBa7KM2i8osgejPNvHPC603u/UF/nU/0JKVO9qlilGExrs+6VUV7FFc
         Swkpj4EiDSI45bujnpxVWJKuzqBZhOpvrhDZRYLNgglnoqyj7bE97YjAp1IwX3l++pxG
         0hGEAedUcskqWf8brmNa8dM/2iDU0wQT0J4l16H5v/guPyZip7H2HLA8D4ib8PeEPnez
         E5tLrz8TZEjZpRCbsbkYb2RWEbNMX7s7rYD6AgV7v9BbNJsd4iHsrlKTn+QLb16LD8tM
         jc/a7hMC5mSVPREsu7envkZnv9qMFE/XKiGU3hVFFJv3lMlSONx2Fl5NitpkK5K/iqzX
         Xe+g==
X-Forwarded-Encrypted: i=1; AJvYcCVuqM1I4RVuKU+zvxNqTtVxoZrQV9HMtzT2+6MOzVEL3EdtDDalJ3MAmI/Rrntv5Y9juwCMyPiaIuQaUvEi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01EjtzrP4hEZ4xby3Rk2/85JcHR76QhMtxM/fx1ChwtQxwDmd
	Xqn4+eLQ91mv116bUnFkqpE16Wkq9JOOt109t/GAKcHA15NAO0TjtaS1JUHMf7SgpPfEM+Aw6qV
	Gd6VLspO5fx5JBhd0EVzMCa1n8SvDbMjqHsJO/Z1sX6GCTjIRAuCRMDZBXkjAETpFhVY=
X-Gm-Gg: ATEYQzwKVscRRUS1rzZwBzf5W2NqeukJjCamSsDc1opE0VwIr4sowTNFOiMk2NJR74R
	iavcZ6hvrhiY2UEhwAzLPmBzbm5a896UcfduwXkID4Z018yl/wjUxI6tGQss2Wri1Fyht0M5qkz
	HEsV1HKEtlp1OtDz6zFLaghO9+UR02ciXipItUQ9Ux78nJtVzllHm413KossGfKBNLG4mD+brfj
	7ijamZLpseUaCu3dD5Bmu4Hx8p/1CbbQOkFjTXz7IYdi09W6KuHnrAgeJZXL+ViIP1+JcxtWvgl
	DjxSyEdFSXl2Yvf/aEmSC0OipP9sxi/4E+qqtz7nO2Q0IUZv0hKF9m9lFMR5U7bokoagAVzkJaZ
	pOLJH1mB9PCPLDIgp5jRy3hVuY0DY3NIntFvb3+Pqtq0rhr1vKyIFyw7U
X-Received: by 2002:a05:6214:2482:b0:899:ac2b:6ddc with SMTP id 6a1803df08f44-89a820c9ea5mr179578836d6.62.1773659095394;
        Mon, 16 Mar 2026 04:04:55 -0700 (PDT)
X-Received: by 2002:a05:6214:2482:b0:899:ac2b:6ddc with SMTP id 6a1803df08f44-89a820c9ea5mr179574986d6.62.1773659092023;
        Mon, 16 Mar 2026 04:04:52 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c463af405sm45050026d6.48.2026.03.16.04.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:04:51 -0700 (PDT)
Date: Mon, 16 Mar 2026 07:04:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Gabriele Paoloni <gpaoloni@redhat.com>
Cc: mani@kernel.org, jassisinghbrar@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mpapini@redhat.com, dnita@qti.qualcomm.com,
	rballati@qti.qualcomm.com, bijothom@qti.qualcomm.com,
	wchadwic@redhat.com
Subject: Re: [PATCH 1/2] mailbox: qcom-ipcc: amend qcom_ipcc_domain_map() to
 report errors
Message-ID: <abfj0bpnv6yqJBPR@redhat.com>
References: <20260316102618.7953-1-gpaoloni@redhat.com>
 <20260316102618.7953-2-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316102618.7953-2-gpaoloni@redhat.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,redhat.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97921-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2EBAF29876C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:26:17AM +0100, Gabriele Paoloni wrote:
> Currently qcom_ipcc_domain_map() ignores errors returned by
> irq_set_chip_data() and invokes irq_set_chip_and_handler()
> that in turn ignores errors returned by irq_set_chip().
> This patch fixes both issues; no other functional changes
> are implemented.
> 
> Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> ---
>  drivers/mailbox/qcom-ipcc.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index d957d989c0ce..c23efaaa64a1 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -116,12 +116,20 @@ static struct irq_chip qcom_ipcc_irq_chip = {
>  static int qcom_ipcc_domain_map(struct irq_domain *d, unsigned int irq,
>  				irq_hw_number_t hw)
>  {
> +	int ret;
>  	struct qcom_ipcc *ipcc = d->host_data;

Put variables in reverse Christmas tree order.

>  
> -	irq_set_chip_and_handler(irq, &qcom_ipcc_irq_chip, handle_level_irq);

Should irq_set_chip_and_handler() and irq_set_chip_and_handler_name() be
updated to return an int to reduce boiler plate code?

> -	irq_set_chip_data(irq, ipcc);
> -	irq_set_noprobe(irq);
> +	ret = irq_set_chip(irq, &qcom_ipcc_irq_chip);
> +	if (ret)
> +		return ret;
> +
> +	irq_set_handler(irq, handle_level_irq);
>  
> +	ret = irq_set_chip_data(irq, ipcc);
> +	if (ret)
> +		return ret;
> +
> +	irq_set_noprobe(irq);
>  	return 0;

The newline before the return 0 is removed. That should also remove the
irq_set_noprobe() change from the diffstat.

Brian


