Return-Path: <linux-arm-msm+bounces-90048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNG5GLj/cGmgbAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 17:32:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2F459F04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 17:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86B3B7ACFFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E262E3D34B5;
	Wed, 21 Jan 2026 16:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEjgfzQ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33773BF30D;
	Wed, 21 Jan 2026 16:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011378; cv=none; b=SkN8066w5/GUWAAfgI04JB01B+hBRtvph87ePUL/Q9S9btTe3Cc/YAsyq9vBrwjHF1f40mCqBannmyEqbqHvt8YYjQz3vKpexHukPD79c65zxDSe7OGmyRojistg7JKCkzbagP/Jl02nE1yn/KRY3x3coZHg4N/5iWEh5d1EsTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011378; c=relaxed/simple;
	bh=F9bPyEYde8jlWbcHshXKq3vOhM722s15C6Irbdet8y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUTcnvIN6CwsfOj0KN02dXB2G9VxKZOHdPyQPmpYWbPy00vyV9WOX6Vg3zVxpqg0nAjdSiuj0fbgGXYjfbzxBDWP3W0cFvxX8uQ0us0wQSYtbUUcUYHJEFgmmQFpXcx1apDJ3j4ya6fXL7Irg8IIIRsIQeXLnN6N1+v09DFpDfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEjgfzQ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F623C4CEF1;
	Wed, 21 Jan 2026 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011378;
	bh=F9bPyEYde8jlWbcHshXKq3vOhM722s15C6Irbdet8y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UEjgfzQ3Yy0qFP25NRRt1WZG1cmk7k0VEnQyB8xip8s2J6UnYdkTSBrR1Yq5U5+uE
	 0/AMp8dQ8UaAL5vlNQGvE9xgYcRJVF0kJWMhmWCsTdQNmZVK9sqPcE4qTgwq9H8WSj
	 +edWOKkfUP1XsY2kX/WO0nFvUK1NoTGdG+c5J/t7AK6agi9xolmIkOLVY+xnrq6eyI
	 cR34/ZA8hz0wwyIEkWqCXlqQVA7JQ6csR+zf/w4CwHgQ8FI+Drz8Fh26vbcjxjMiep
	 BGokjRjztegbw7pmQzjoicX9UM4NLWmZ7j6cw72innV0l4eFnts4DACl/UfmFE2gFl
	 I9owkn1KBx8fg==
Message-ID: <35780b65-8c95-4d58-8d4a-2f451cf5377d@kernel.org>
Date: Wed, 21 Jan 2026 17:02:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, broonie@kernel.org, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, robin.clark@oss.qualcomm.com,
 hanguidong02@gmail.com, quic_c_gdjako@quicinc.com,
 dmitry.baryshkov@oss.qualcomm.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
References: <20260121141215.29658-1-dakr@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90048-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 0A2F459F04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 3:12 PM, Danilo Krummrich wrote:
> Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in
> qcom_smmu_impl_init") intended to also probe the TBU driver when
> CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding
> platform_driver_register() call into qcom_smmu_impl_init() which is
> called from arm_smmu_device_probe().
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a deadlock condition
> described in [1].
> 
> Additionally, it was noted by Robin that the current approach is
> potentially racy with async probe [2].
> 
> Hence, fix this by registering the qcom_smmu_tbu_driver from
> module_init(). Unfortunately, due to the vendoring of the driver, this
> requires an indirection through arm-smmu-impl.c.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk/
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
> Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@arm.com/ [2]
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qcom_smmu_impl_init")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Acked-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

