Return-Path: <linux-arm-msm+bounces-90198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPi5L9UmcmkVdwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:32:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A683674F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BE0E64EBBE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4277449EB8;
	Thu, 22 Jan 2026 12:13:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773A944105E;
	Thu, 22 Jan 2026 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083989; cv=none; b=qKMSXcBwcft7CColXuW/AMuBanKPF5V4vkY272UC1dJjM/ht8mzOdfED521fY9aeaCR4DN2i5EtSKQYvvXKYath7Fl8lGBEWpnX1L62xX8nwdcIdyMkZw0qJ+496rKWR1VWVJ8LjRlsvAcnXwYAhZuXqHlud4IouH2hF2YFvK+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083989; c=relaxed/simple;
	bh=BPfY/Gnf0QsAl+WZe3Pj2UYJa/GxAUnm6Hk0MlMg79s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PihrTbxNfLsRUdmP+rG6sz7MOZNaumXhx8rmnFTLuOhPyxgKYS4BqSipjpBU1Gxn0Dnp+z3bOXEUAcTgEqWptOiLJENJT8LxrGK+mHD1oYtmklN46La9iW24C25TBQ4B4bGQw/dpjpUoB2EaGcmCQnbR+j7BjCge/UVZ4MZRTxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A97831476;
	Thu, 22 Jan 2026 04:12:51 -0800 (PST)
Received: from [10.57.51.35] (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B38FB3F740;
	Thu, 22 Jan 2026 04:12:55 -0800 (PST)
Message-ID: <d2ddbb72-30a8-44da-b761-876b2d37567e@arm.com>
Date: Thu, 22 Jan 2026 12:12:53 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
To: Danilo Krummrich <dakr@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org,
 will@kernel.org, joro@8bytes.org, robin.clark@oss.qualcomm.com,
 hanguidong02@gmail.com, quic_c_gdjako@quicinc.com,
 dmitry.baryshkov@oss.qualcomm.com, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <20260121141215.29658-1-dakr@kernel.org>
 <6oogrqe3n5sxtpdydjqo4ucwp7n3ipqoupxtekvzbnqd7dae3s@q22wc7fpbtya>
 <DFV3I3D5UIZP.38TNCAJWQGI3O@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <DFV3I3D5UIZP.38TNCAJWQGI3O@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : No valid SPF, No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,8bytes.org,oss.qualcomm.com,gmail.com,quicinc.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-90198-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 7A683674F3
X-Rspamd-Action: no action

On 2026-01-22 11:52 am, Danilo Krummrich wrote:
> On Thu Jan 22, 2026 at 10:21 AM CET, Ioana Ciornei wrote:
>> The boot lockup was visible also on the NXP LX2160ARDB. This patch fixes
>> it.
> 
> Interesting, this means that qcom_smmu_impl_init() must be called on this
> machine, is this expected?

Yup, same as on the Juno boards and probably others - an Arm SMMU is 
present, which means if ARM_SMMU_QCOM is enabled then 
arm_smmu_impl_init() is going to offer it to ask "hey, is this one of 
yours that you might want to do something with based on your extensive 
and complicated match list that we don't want to maintain in the common 
impl code?", wherein qcom_smmu_impl_init() *should* return without doing 
anything at all as it's not a match...

Cheers,
Robin.

> 
>> Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> #LX2160ARDB
> 
> Thanks for testing!


