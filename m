Return-Path: <linux-arm-msm+bounces-110152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEtxJmKEGGq6kggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 20:07:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FCC5F615C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 20:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F17E300A766
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 18:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2C0403EB6;
	Thu, 28 May 2026 18:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iOg36/k7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D529B4028CF;
	Thu, 28 May 2026 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779991294; cv=none; b=suBMgf6jZkvuN3h3FzLtZmPXYn6IgC/Y9JrwIYzGypDNWGQD+59lr97Z7OHwdytfqJEhj6SeUL/YR+vtEE0Mu/RRhrAG4pQ4tHVg9SIhiXMIa0Q+RxXy8yQ4AuDLZQrhIoDuIwcTIdDTCHLZhM8zK/z5dxSsEcS+pvzWRT3iWFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779991294; c=relaxed/simple;
	bh=y36QqDCCRxFgAritP62khWPWor0UF35crmcLFibL7iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IH+NOl9RT9MXY1xZMTBmKkQFj/jl0ciReHumjjaeh9JLXm8jRwmBMxyBD/E2Aa+6dqUo0I2iSXAtyb5G7UYyNLP7T1o+nnzgP3QK3pW88XSed4cWNLQEoCC6QqLS7D02ifwb05xrF3jcv8bTDfaXwHXgkq46vooBbUVvCcpZWh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iOg36/k7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E07A22C8;
	Thu, 28 May 2026 11:01:27 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A61043F632;
	Thu, 28 May 2026 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779991292; bh=y36QqDCCRxFgAritP62khWPWor0UF35crmcLFibL7iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOg36/k7zSaeOW5PVb7Uxmwxz4ZiPGmRKjNNt0ewIbINCWRHrwEpoznt+aX2/9nks
	 v9F8zQdmm/3oEzcXO8LtkdiUwQi53Ap20DNGlI6o9/AsyqK7QDL3c4Ig1X8JCIxiQT
	 0TO12Yw/kzwLocebq0HrHUqCUT+VnZ29HtlzOeOY=
Date: Thu, 28 May 2026 19:01:29 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
	tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 1/4] coresight: cti: Convert trigger usage fields to
 dynamic
Message-ID: <20260528180129.GJ101133@e132581.arm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-1-d21f4f92c51e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-extended_cti-v9-1-d21f4f92c51e@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[arm.com:+];
	TAGGED_FROM(0.00)[bounces-110152-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E3FCC5F615C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 08:16:27PM +0800, Yingchao Deng wrote:

[...]

> @@ -231,6 +254,8 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>  {
>  	struct cti_trig_con *tc = NULL;
>  	struct cti_trig_grp *in = NULL, *out = NULL;
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev);
> +	int n_trigs = drvdata->config.nr_trig_max;

I don't mind it allocates bitmask with nr_trig_max, but AI review
suggests that when in_sigs / out_sigs bigger than nr_trig_max, it might
access memory out-of-boundary (see cti_plat_read_trig_group()).

It is good to add a check:

    if (in_sigs > n_trigs || out_sigs > n_trigs) {
        dev_err(dev, "trigger signal is out of range: in=%d out=%d nr_max=%d\n",
                in_sigs, out_sigs, n_trigs\n");
        return NULL;
    }

With this:

Reviewed-by: Leo Yan <leo.yan@arm.com>

BTW, I have given my review tag on v8, please remember to update
patches with review / ack tags.

