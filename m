Return-Path: <linux-arm-msm+bounces-104876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CHbLtdU8GnSRwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:33:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64947E177
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 432AD3017533
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 06:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D4E346E7D;
	Tue, 28 Apr 2026 06:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="S2Xn++cF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993F1311959;
	Tue, 28 Apr 2026 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777358036; cv=none; b=BUXkFd1hS3fhiuin8P0fPW6p9EKEorpQQa36sMBFuQgpEtfkgRCWj5zZ4VHH7YZdKtjoze36XuFLwmJ3E1wOB+gElrEr74Xn+Mq2mIJl6CNyy3PDiDoaTD1PtnECuRuRCVhgt5GgrO9Cpvpq2+YBSeO85NipyvnFZGQFSF5TpLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777358036; c=relaxed/simple;
	bh=YWZkQJ9h/l4InQ9uofXyJ+ye5Z9Xuqt0qS0AfrrKrA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FU+R57A+0GFecUVn29xaKxskGtzlqx3qEA0jQFqlczTZ51vq1jjAkjoLh6n/coKT4bMNxVcK1veSz6IbKzr1YeHrAhTGtcRYm3Iy16tJXGA9QA1LpFMFO7o3/WA78MY4LuLUtWrYidU4tq3aqQ5/tTzTFz7FUp156vLpucAyukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=S2Xn++cF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE0B11684;
	Mon, 27 Apr 2026 23:33:46 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA0303F763;
	Mon, 27 Apr 2026 23:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777358032; bh=YWZkQJ9h/l4InQ9uofXyJ+ye5Z9Xuqt0qS0AfrrKrA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2Xn++cFmmQu5248cOji44fY/eMi8BJevcEh3M2220AM7CaQvnqARY5FplvC+PS10
	 4iz+okyCYpf0DlRtOwQYdzny5aSVGEYjdCRYKEDiF5c70/sYXZmuYUcqlHelxcYqf1
	 KRe3lPH1nJVHXIoAJjsZr9rXaNM3RhkobsAhrKeY=
Date: Tue, 28 Apr 2026 07:33:49 +0100
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
Subject: Re: [PATCH v8 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
Message-ID: <20260428063349.GD16537@e132581.arm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
 <20260427165913.GA16537@e132581.arm.com>
 <b20a2f7c-4838-408f-94ed-ee9656d451c4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b20a2f7c-4838-408f-94ed-ee9656d451c4@quicinc.com>
X-Rspamd-Queue-Id: EF64947E177
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104876-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:dkim,e132581.arm.com:mid]

On Tue, Apr 28, 2026 at 10:25:11AM +0800, Yingchao Deng (Consultant) wrote:

[...]

> >    tg->used_mask = bitmap_zalloc(nr_filter_sigs, GFP_KERNEL);

> "nr_filter_sigs" is the count of entries in the DT property array, if the DT
> property is:
>     arm,trig-filters = <22 23>;
> Here nr_filter_sigs=2, so bitmap_zalloc(2) allocates only 1 unsigned long
> (64 bits). set_bit(22/23, used_mask) still fits, but it's logically an OOB,
> and any index >=64 would
> write past the end.

Thanks for explanation. It is correct for me.

