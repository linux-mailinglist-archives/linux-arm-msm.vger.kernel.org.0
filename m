Return-Path: <linux-arm-msm+bounces-103243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FNlGctG32mFRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:05:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F7401ACD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B72F63036C0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 08:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82073CAE80;
	Wed, 15 Apr 2026 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ad7doJp7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A4E392811;
	Wed, 15 Apr 2026 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240327; cv=none; b=iCQR+m8Z0F82ne/UGvPsGbxUH8M65WrjD2auNqDQAXF28cwLF//LCiYvadNtg0Wa3wKt/CaGCiwdDW+da8YGHtD9BeQVnLLAOIQGOfuIqhMuRXMsJwStT7UchOh0H9KIG2tDO/Ep+vbTW0AxZhkRHeJDUhGrDISlUwaXD+IXxEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240327; c=relaxed/simple;
	bh=4gvy51nggAqLi0h1l+z5mN0jWtZ6SLLjUoZXHF5ECXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6I2wur3C3SbyEvwQxXHGcrwXbypWarHlOd0V6BkN0MOzAH4GOh97xGXIiOzfMfExMV1F+/+/4tX8d01LK52HDXrTl2Jq2sSBetuiw/vGbf9ysw5PZepA2TCurk5fVy9E4R6IUyXf7BPcADA3uqfWlaEeepA605ImAtW+8UpRUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ad7doJp7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80E334FBA;
	Wed, 15 Apr 2026 01:05:18 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B50603F86F;
	Wed, 15 Apr 2026 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776240324; bh=4gvy51nggAqLi0h1l+z5mN0jWtZ6SLLjUoZXHF5ECXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ad7doJp7O02yGI0Q1Sg7Od4VSoketgT8GM4hcp57UD4e2UZFPt7Q5HsWRVTcIgRrH
	 LRqwSnJyv4sWz/8BFX0TR4iIzNXso22iSYp606GLrCyKElkpIrVbMhoKEDmr0MnxcF
	 8vZvFeY9AkNCHYWfZaw8gHC39Tb6A78TrOPrvlkY=
Date: Wed, 15 Apr 2026 09:05:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/4] Add Qualcomm extended CTI support
Message-ID: <20260415080521.GI356832@e132581.arm.com>
References: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
 <9772e300-06cb-4892-810c-bdcf6251bf9f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9772e300-06cb-4892-810c-bdcf6251bf9f@quicinc.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-103243-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,e132581.arm.com:mid]
X-Rspamd-Queue-Id: 0B2F7401ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Yingchao,

On Wed, Apr 15, 2026 at 11:22:49AM +0800, Yingchao Deng (Consultant) wrote:

[...]

> Gentle reminder.

This series would be on Mike's radar.

I will also look into details once I finish Levi's series review.

Thanks,
Leo

