Return-Path: <linux-arm-msm+bounces-110309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HbKK4q3GWpByggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:58:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F09A605295
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B445830F1AB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934D93E2AD6;
	Fri, 29 May 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PnU6SFhF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E311342CB3;
	Fri, 29 May 2026 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068724; cv=none; b=LKwrKCiFJDeL6wvSfVbg81b3ntFvDJ7GEzV21pUkK7bj68jaaei7tdiH34K0qtb/FCk1aGTBAidmrylHJ8pEPGkXgPTb6qrGIb3jJc5X4Bw1rrWiWaNhUgfYLaopz77/2SDnysnVu0dm+X3FTeABOH4G9nH5YlEFpI/RuBg/tI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068724; c=relaxed/simple;
	bh=aaqSGHmOFP9GDydN0V8EWfYzZpiFRb3G1MWrfDttjnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sygrgLBT+GaPUlwrtqOHWl2hlJC9M97hLQgqzzp3ie9WAcMoTzQ2I/gKfYWxNctVOLsQLPM41MhfC9IsmDcGLm/s31Qi//ylhXR4FQ+KF29cC52P1ElGELgycoSk5zLRdN1kKcfdhN+o/OQnkF/3CTM0Aq091xdAkQC83TPsXvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PnU6SFhF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7DA233EA;
	Fri, 29 May 2026 08:31:57 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 438BA3F632;
	Fri, 29 May 2026 08:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780068722; bh=aaqSGHmOFP9GDydN0V8EWfYzZpiFRb3G1MWrfDttjnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnU6SFhFsjLY+yQklLoE94ixjHzfniX4RqzaSHh+5npaDzp24Ijjo7Fb8U+ixEm2V
	 qSOw8lTBRVqQJfnDp22g0DqrLk1vP0xLac+LzXj+c6e7BEuP9/fC/JwGqyFWLS7WKo
	 e0xnjijWYfwE/20g0NEqNRUSs81iWIjKciaO3fps=
Date: Fri, 29 May 2026 16:32:00 +0100
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
Subject: Re: [PATCH v9 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
Message-ID: <20260529153200.GL101133@e132581.arm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-110309-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,arm.com:email,arm.com:dkim]
X-Rspamd-Queue-Id: 4F09A605295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 08:16:30PM +0800, Yingchao Deng wrote:

[...]

> @@ -515,18 +543,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
>  	&dev_attr_appclear.attr,
>  	&dev_attr_apppulse.attr,
>  	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
> +	coresight_cti_reg_index(triginstatus1, CTITRIGINSTATUS, 1),
> +	coresight_cti_reg_index(triginstatus2, CTITRIGINSTATUS, 2),
> +	coresight_cti_reg_index(triginstatus3, CTITRIGINSTATUS, 3),

For this patch:

Reviewed-by: Leo Yan <leo.yan@arm.com>

AI tool reminds to update
Documentation/ABI/testing/sysfs-bus-coresight-devices-cti, you might
need to add description with a new patch:

  What:           /sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus[1-3]
  Date:           May 2026
  KernelVersion:  7.2
  Contact:        coresight@lists.linaro.org
  Description:    (Read) read current status of QCOM extended output trigger signals.

And please add document for other new sysfs knobs.

Thanks,
Leo

