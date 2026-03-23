Return-Path: <linux-arm-msm+bounces-99215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH/NNUYfwWmTQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:08:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9700D2F0E41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 934D13015D9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF52435F169;
	Mon, 23 Mar 2026 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FlnijEfo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hTNUW7wk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7463191BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264067; cv=none; b=i/8XRG7Sb/JmRP8/Lm8nFq01Rc/E6FJd8AiHJmeNo5l4lUSfLKkcCb4QwUIWgUSrRDfxGzOYDo9G/EvIVNNAEHnNFxsxQGbMW7XQFOg+NQMPN3SyJIdfjb/8igxiP7dhD3C2HSLTSqB0M7XmFzQtT+Ws+Ul1AdRa+E0xJPRfBVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264067; c=relaxed/simple;
	bh=YPdRD6EUf3CgSBvxM6zk4Qz40RvI8TxYh9LQ5SFh1Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tk9N1EQoXJlncza9hm6mLnqIijXPlwCHq21dfSTCsynAXJVSdywwKriW+fcgh5mjBzxyDLb1lSMqY44WHRsRtW4I/+Dh5Qp8TjFSIWs//nvvg0C4cRMlZtZj+2t9/+2hi7LhApooj+NC68dRyNwYZn4o82kl1KyB4EL2DAUmIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FlnijEfo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hTNUW7wk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774264065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QcIw6hhEhr8Iw5BlZZGCsbanTIpAq/mxuwRJV45/7Jc=;
	b=FlnijEfowiqVw9Wh9uI2mUy+opodhUe5zXKbQ6JNX9kcboZzughi4fjGzmL1gitpt/F6/Z
	Zss2Y6KB56gumlsbzqexoEY8AJF7nfaTeUn0jetpJhU3NavD9kU9dMLgn+ZfIwWLDFeG+m
	SZFp2HeBKE/EQxutrHGt4X/5ilE1UTI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-rB1rzcdTO0yhrPhr5L7DSQ-1; Mon, 23 Mar 2026 07:07:44 -0400
X-MC-Unique: rB1rzcdTO0yhrPhr5L7DSQ-1
X-Mimecast-MFC-AGG-ID: rB1rzcdTO0yhrPhr5L7DSQ_1774264064
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090bc4823cso97964421cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774264064; x=1774868864; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcIw6hhEhr8Iw5BlZZGCsbanTIpAq/mxuwRJV45/7Jc=;
        b=hTNUW7wk+lUCeHof5tYX4e+70Uxtt5EW+TBxn6bwPwWluEp8aeUMaCzlU3v6pWd5h4
         oOTOV64XZv/zgoEP5rubRGYrRd1/Ntj2M8AWca8/zZEmxXw7uTcEzg93uAAp3FyDJMrT
         IfbHPTcCPGzhVEjkuSnEvkkJAlmQR5oSeERGMXzVqd1PEWB8265rOGM5/zoetvEDfXFO
         rujAwcw/jt3w7455icdmA+znz2lucEqSuemQdeprIi4H+RF/DQFZLS0oj4W+4W075EMK
         zNv/Eqn3oFFUUokVte/mZ7bdS3123fDlQbdddkO6oOPXl9xsvDA3qZCL9eSOR4w1e7YB
         hJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264064; x=1774868864;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QcIw6hhEhr8Iw5BlZZGCsbanTIpAq/mxuwRJV45/7Jc=;
        b=KQsRIePitTmE2NWATagqyzVgVppYZfW71+8+FzDyF44HAvdFdqdoZ0QETSD7l9YesW
         HB6808WrgI1A5LoYFS2loayEQlok/6nS/0nKZdH4lWYj31Hp7gNEQ80/N49ZxxsM2Nl9
         XH+jbjwVGP8cCQwUIIcjplhCUoLc5rJzHaapgizpT8RY1moPqXU3qpfkx4l/3xlB0m0o
         dxoAxAe7VW0/YKRphig0UAAQwj+UzLMEO5uvxpbChpeKb6Jc4Buzw2WCAsSIQhgdmBgc
         DBCdqviWWXcXp/MMKtfLz9mJQP+AMTqackUC9GSpsvPfs9Mk8XgzuoiPRiMimkBmW0oQ
         E4+g==
X-Forwarded-Encrypted: i=1; AJvYcCW/rWWfE7qiJxd2fnTkEnhEq4a30tIIbkmUv9UGGNXMPqV3sQ9Jqlt58tPj6aEdV7S2h3bbBwHJdHBuK8ns@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+YH8Ly99kK304kFnY4EL5wuN61lZudmxCayqqD2uEnw3L/638
	im649Ax7IJ/CNQlhDzS9BKb64kL6dNlOESDYfY56oQnY53VdI666b0lnNJOpEM8l7OggNQJhi30
	32u0WvyXt+ew+hDfK5kGK2y+rGMcd2es2wByS8gvZkJZI34UuItgqKIxakV2QA/YlodM=
X-Gm-Gg: ATEYQzy0Uvt3lFLDdgMGSo8UvT5FTQxl51Z5nN54QQK+Sbwgjw2Vuz2Iu9VM5ymiX7o
	peA9R6dKPt1auQiWOSgxmKev+riQWvYOEG1wu779G0oifSBBtUGhdUri7snTEMuogJAUfiDtBUx
	73mtc5Nf31606Bmb5LVgj4y0lSXmjhyjqHY0SyEnw/ibj7q6fTPZhtKL783fIrxfxXkfnwLsBUt
	X+KL7asvj+lkUO/BIVuGo8xvJyorGNTN0w5/cM7+U1/pNHHHi3wCOq1E1lSuF3c+/2WT92KwrGp
	gXpMgArS++X+yHe5q438XAJoEn6PyCgruu+EUhWD5ApaBaC10cz1oScCAkQqGxA7//cfWzV0QBd
	4P0SJNjTzfob7ng7zKy0KBl3vnth+EPQS6DnR2RjahOyyKGg3cEES2dcC
X-Received: by 2002:a05:622a:5c7:b0:506:6caf:3cab with SMTP id d75a77b69052e-50b37474561mr185245171cf.26.1774264063814;
        Mon, 23 Mar 2026 04:07:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5c7:b0:506:6caf:3cab with SMTP id d75a77b69052e-50b37474561mr185244471cf.26.1774264063193;
        Mon, 23 Mar 2026 04:07:43 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm98755271cf.15.2026.03.23.04.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 04:07:42 -0700 (PDT)
Date: Mon, 23 Mar 2026 07:07:40 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: ocmem: register reasons for probe
 deferrals
Message-ID: <acEe_CQxxkl9nvOU@redhat.com>
References: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
 <20260323-ocmem-v1-2-ad9bcae44763@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-ocmem-v1-2-ad9bcae44763@oss.qualcomm.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99215-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 9700D2F0E41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 03:20:58AM +0200, Dmitry Baryshkov wrote:
> Instead of printing messages to the dmesg, let the message be recorded
> as a reason for the OCMEM client deferral.
> 
> Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ocmem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> index dd46bb14b7be..d57baa9cfa03 100644
> --- a/drivers/soc/qcom/ocmem.c
> +++ b/drivers/soc/qcom/ocmem.c
> @@ -196,10 +196,10 @@ struct ocmem *of_get_ocmem(struct device *dev)
>  	}
>  
>  	pdev = of_find_device_by_node(devnode->parent);
> -	if (!pdev) {
> -		dev_err(dev, "Cannot find device node %s\n", devnode->name);
> -		return ERR_PTR(-EPROBE_DEFER);
> -	}
> +	if (!pdev)
> +		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER,
> +					     "Cannot find device node %s\n",
> +					     devnode->name));

Reviewed-by: Brian Masney <bmasney@redhat.com>

dev_err_probe() was introduced in 2020 (a787e5400a1c) and this driver
was added to the tree prior to that.


