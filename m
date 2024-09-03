Return-Path: <linux-arm-msm+bounces-30523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AF6969E09
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 14:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8A941C23119
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 12:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7711D86C6;
	Tue,  3 Sep 2024 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpWJM6IZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C11D6DD0;
	Tue,  3 Sep 2024 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367473; cv=none; b=a1MNiN8B91kDKQiqmq4pjUKBiVV63a4JD/1KiHG6meo8LgDhNZR0rHnB7HVAjAimqQU44Ic21vdhn6hIxsTHCGkYRzQY/PoBKOUis3WJPUR5x+3DPKV+iLh4qH9qKmhp9mZTENgHAJbmSXm9ly3n4erI3eus/wL49IXqySM3KO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367473; c=relaxed/simple;
	bh=CiS7TLGte5qKutCVWQk0V5K52BRWxgq5Dw+aQUFrRMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sE/RdtQ/Z+ZPs2O4FMiaViF2sHvMUdvOF9cd27ap9HLhRhYJ8sSNA7CgjaZrUchW2lBc0L4IjoY5UQc7+WKCmT1S/5DHxPGT2hnAsJvwHxBwLsTklwmZ/4o5KG/+eU3/Zm0rOpQc2aTk0/xPuKCmpMPRJinIVs1QAgle4XkCy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpWJM6IZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48948C4CEC7;
	Tue,  3 Sep 2024 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725367473;
	bh=CiS7TLGte5qKutCVWQk0V5K52BRWxgq5Dw+aQUFrRMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DpWJM6IZUZzfXrKMMkEzA3nlQK6JFeMBV51+SmXgq6HsuUeDUFVR5a9RMXG/FDswi
	 WaPMRHTRJvWlhRN4gspqmrC0Z0a5F6eU+d+RoysP6iyTL0F26kLV8RlDccPpKX0k7v
	 WsaurG48wNbhFIRrQyI4yDtVcVVm8TQUYawnkXvL3q5782LToyBgrs9dL8vsri5Smd
	 cmIzHgfgoO1JvedTr8iEvLshHGK/5ocnnpnBhVFrb2xO19QLqw91LueX0Dn8bMm7qb
	 3hie3Q3uxDF6W7mb0gJtIMfwf5SN9pdrD/fYuORFMfG8SNMotElSBXmT2GqRmi/+DY
	 9ol4VAOBmvX0g==
Message-ID: <11e49954-5230-4781-8222-2e3360012c37@kernel.org>
Date: Tue, 3 Sep 2024 14:44:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
 <20240903121847.6964-3-quic_jinlmao@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240903121847.6964-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 14:18, Mao Jinlong wrote:
> The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
> It allows a debugger to send to trigger events to a processor or to send
> a trigger event to one or more processors when a trigger event occurs
> on another processor on the same SoC, or even between SoCs. For Qualcomm
> extended CTI, it supports up to 128 triggers.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../hwtracing/coresight/coresight-cti-core.c  |  75 +++++++----
>  .../coresight/coresight-cti-platform.c        |  16 ++-
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 124 ++++++++++++++----
>  drivers/hwtracing/coresight/coresight-cti.h   | 123 +++++++++++------
>  4 files changed, 239 insertions(+), 99 deletions(-)


>  
>  /*
> - * Device registers
> - * 0x000 - 0x144: CTI programming and status
> - * 0xEDC - 0xEF8: CTI integration test.
> - * 0xF00 - 0xFFC: Coresight management registers.
> + * CTI CSSoc 600 has a max of 32 trigger signals per direction.
> + * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
> + * Max of in and out defined in the DEVID register.
> + * - pick up actual number used from .dts parameters if present.
>   */
> -/* CTI programming registers */
> +#define CTIINOUTEN_MAX		128
> +
>  #define CTICONTROL		0x000
> -#define CTIINTACK		0x010
> -#define CTIAPPSET		0x014
> -#define CTIAPPCLEAR		0x018
> -#define CTIAPPPULSE		0x01C
> -#define CTIINEN(n)		(0x020 + (4 * n))
> -#define CTIOUTEN(n)		(0x0A0 + (4 * n))
> -#define CTITRIGINSTATUS		0x130
> -#define CTITRIGOUTSTATUS	0x134
> -#define CTICHINSTATUS		0x138
> -#define CTICHOUTSTATUS		0x13C
> -#define CTIGATE			0x140
> -#define ASICCTL			0x144
> -/* Integration test registers */
> -#define ITCHINACK		0xEDC /* WO CTI CSSoc 400 only*/
> -#define ITTRIGINACK		0xEE0 /* WO CTI CSSoc 400 only*/
> -#define ITCHOUT			0xEE4 /* WO RW-600 */
> -#define ITTRIGOUT		0xEE8 /* WO RW-600 */
> -#define ITCHOUTACK		0xEEC /* RO CTI CSSoc 400 only*/
> -#define ITTRIGOUTACK		0xEF0 /* RO CTI CSSoc 400 only*/
> -#define ITCHIN			0xEF4 /* RO */
> -#define ITTRIGIN		0xEF8 /* RO */
> +
>  /* management registers */
>  #define CTIDEVAFF0		0xFA8
>  #define CTIDEVAFF1		0xFAC
>  
> -/*
> - * CTI CSSoc 600 has a max of 32 trigger signals per direction.
> - * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
> - * Max of in and out defined in the DEVID register.
> - * - pick up actual number used from .dts parameters if present.
> - */
> -#define CTIINOUTEN_MAX		32
> +static const int cti_normal_offset[] = {

Uh? Why do you add data definitions into header? These NEVER go to
headers, for obvious reasons.

> +	0x010,		/* CTIINTACK */


>  /**
>   * Group of related trigger signals
> @@ -67,7 +109,7 @@
>   */
>  struct cti_trig_grp {
>  	int nr_sigs;
> -	u32 used_mask;
> +	DECLARE_BITMAP(used_mask, CTIINOUTEN_MAX);
>  	int sig_types[];
>  };
>  
> @@ -146,9 +188,9 @@ struct cti_config {
>  	bool hw_powered;
>  
>  	/* registered triggers and filtering */
> -	u32 trig_in_use;
> -	u32 trig_out_use;
> -	u32 trig_out_filter;
> +	DECLARE_BITMAP(trig_in_use, CTIINOUTEN_MAX);
> +	DECLARE_BITMAP(trig_out_use, CTIINOUTEN_MAX);
> +	DECLARE_BITMAP(trig_out_filter, CTIINOUTEN_MAX);
>  	bool trig_filter_enable;
>  	u8 xtrig_rchan_sel;
>  
> @@ -179,6 +221,7 @@ struct cti_drvdata {
>  	struct cti_config config;
>  	struct list_head node;
>  	void (*csdev_release)(struct device *dev);
> +	bool	is_extended_cti;

Why different indentation than everything else there? Please write code
consistent with existing style.



Best regards,
Krzysztof


