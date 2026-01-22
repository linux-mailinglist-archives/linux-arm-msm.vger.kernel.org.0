Return-Path: <linux-arm-msm+bounces-90160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFu0GEz3cWmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:09:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4DF6505C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BF136665DB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0653434B1A2;
	Thu, 22 Jan 2026 10:00:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DEE33ADA2;
	Thu, 22 Jan 2026 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076011; cv=none; b=QuZnqgkrAMtYU2zVt+oGaMLhTosHTU6AMOpTF5R+pEZZC0I65NP4tjTr5thPp6AvaCN2RAE1+kwOnQEUOCBoPFwCfBWh89afp5SrYvaphf6kj66sNvuCKcSwn9q8P/SPzbYNbZfsSGourAEFQ6NBMMD/LIl8ZO1tvLRbkBP1Qxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076011; c=relaxed/simple;
	bh=PJFwqYCZrXa/a3VLXh07xXnVpci/pcU1fEKF0QgoTb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLfm/wbbypJaP+iZDFGt905DcPpGBiQhsmYCrmKpqA0c9NrlgpRvF9hbfb5NT6CzPhg6CopUllzYCfrXJIX8JiWFWXm8poV2d1e7d0+qPsRJZzjA7eBWp9Zr5rNhJsASOI90dhBb1qCO82TNxIXoCgABDddhDcfhM4mW8rE3SOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFDE21476;
	Thu, 22 Jan 2026 02:00:00 -0800 (PST)
Received: from [10.57.9.125] (unknown [10.57.9.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF1233F740;
	Thu, 22 Jan 2026 02:00:04 -0800 (PST)
Message-ID: <525fe4ad-3d3e-4c05-a6f5-da91157f362e@arm.com>
Date: Thu, 22 Jan 2026 10:00:02 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-1-22978e3c169f@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-1-22978e3c169f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : No valid SPF, No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90160-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 1A4DF6505C
X-Rspamd-Action: no action

On 22/01/2026 02:08, Jie Gan wrote:
> Remove ctcu_get_active_port from CTCU module and add it to the core
> framework.
> 
> The port number is crucial for the CTCU device to identify which ETR
> it serves. With the port number we can correctly get required parameters
> of the CTCU device in TMC module.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
>   drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
>   3 files changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index c660cf8adb1c..0e8448784c62 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -585,6 +585,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>   
> +/**
> + * coresight_get_in_port: Find the input port number at @csdev where a @remote
> + * device is connected to.

This doesn't match the code ?

We are looking at the remote devices' in_connections ?

> + *
> + * @csdev: csdev of the device.
> + * @remote: csdev of the remote device which is connected to @csdev.
> + *
> + * Return: port number upon success or -EINVAL for fail.
> + */
> +int coresight_get_in_port(struct coresight_device *csdev,
> +			  struct coresight_device *remote)
> +{
> +	struct coresight_platform_data *pdata = remote->pdata;
> +	int i;
> +
> +	for (i = 0; i < pdata->nr_inconns; ++i) {
> +		if (pdata->in_conns[i]->src_dev == csdev)
> +			return pdata->in_conns[i]->dest_port;
> +	}

Suzuki


