Return-Path: <linux-arm-msm+bounces-25502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD90792A616
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 17:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 734861F217B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 15:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00439143C4D;
	Mon,  8 Jul 2024 15:49:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533B613D281;
	Mon,  8 Jul 2024 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720453799; cv=none; b=d0htTrxFKqclRBLgiGxE0aeaAew4hkg1rl9K+OTp/JbBhxbTOZuufAp96Duuxxr2GjC/p5ZGTQ8+fi1TpSQcZQMAePB2Lm9l6gyjjzYsivTtfajroSua/HC90K0txsEPyD+Lsy50UGmGNKx/2g2Scmg9M9TAF0z65EAbFapJQ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720453799; c=relaxed/simple;
	bh=ogOl0ipcrNilhuvwQ0+LIidbO/TV8MjrdeKk9e/EV0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYmLb6etxaICf1LEcXHJhOQlmsX2qRD1m4Jo3SN+E7YrzhW4HOn+OscIZUcC3WI/MTuick4hBPDA1sTrLMudJFaI/khJI5RZe4rqRLY+c08VPo3ncwhLu96GmC/aPq9TAUdKMCiJMrD2KK3STEhjb0HYMNCvO0rxz6k1fm2lQT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBD161042;
	Mon,  8 Jul 2024 08:50:22 -0700 (PDT)
Received: from [10.57.74.191] (unknown [10.57.74.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 489683F641;
	Mon,  8 Jul 2024 08:49:55 -0700 (PDT)
Message-ID: <2fdaac53-3695-45cd-a57a-1afaf365a19a@arm.com>
Date: Mon, 8 Jul 2024 16:49:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] coresight-tpda: Optimize the function of reading
 element size
Content-Language: en-GB
To: Tao Zhang <quic_taozha@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Clark <james.clark@arm.com>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, Song Chai <quic_songchai@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
References: <20240705085152.9063-1-quic_taozha@quicinc.com>
 <20240705085152.9063-4-quic_taozha@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240705085152.9063-4-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2024 09:51, Tao Zhang wrote:
> Since the new funnel device supports multi-port output scenarios,
> there may be more than one TPDM connected to one TPDA. In this
> way, when reading the element size of the TPDM, TPDA driver needs
> to find the expected TPDM corresponding to the filter source.
> When TPDA finds a TPDM or a filter source from a input connection,
> it will read the Devicetree to get the expected TPDM's element
> size.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 52b0201090fb..fc5a4e46cf5d 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -110,9 +110,12 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
>   		    csdev->pdata->in_conns[i]->dest_port != inport)
>   			continue;
>
		

> -		if (coresight_device_is_tpdm(in)) {
> +		if (coresight_device_is_tpdm(in)
> +		    || csdev->pdata->in_conns[i]->filter_src_dev) {

How can we assume that the filter-source device is always TPDM ?
It may be true for your test board, but driver must handle all
possible cases. I would rather prefer:

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c 
b/drivers/hwtracing/coresight/coresight-tpda.c
index bfca103f9f84..b1d6f1dd60e3 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -110,6 +110,13 @@ static int tpda_get_element_size(struct 
tpda_drvdata *drvdata,
                     csdev->pdata->in_conns[i]->dest_port != inport)
                         continue;

+               /*
+                * If this port is tied to a source device,
+                * jump to that directly.
+                */
+               if (csdev->pdata->in_conns[i]->filter_src)
+                       in = csdev->pdata->in_conns[i]->filter_src;
+
                 if (coresight_device_is_tpdm(in)) {
                         if (drvdata->dsb_esize || drvdata->cmb_esize)
                                 return -EEXIST;


Suzuki


