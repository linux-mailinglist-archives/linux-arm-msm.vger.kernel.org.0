Return-Path: <linux-arm-msm+bounces-44119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 029AAA03D17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE5377A23D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB931E3768;
	Tue,  7 Jan 2025 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+oD8s5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16C11E377A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247313; cv=none; b=fP9HEH0CyI8AHaAbPdFyTG4b8zVqhyenEWMifXopryZafWo2xuxrdJQPI1CBYck8Cx7nBGq9FJSXL5FLVOikXTK8aj5bgkrBmRV5NnL43/syzSZKO68yXFPOSo3j/vg0sru0fvlkWxMPnvE2um5yPReayqsH9PPhOK3YR3t2XwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247313; c=relaxed/simple;
	bh=segNsK1bClE37VYoyCZC0plMS53t1xW88+xHFXYR6eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+jvt8eUTYW5+oTTBPCC0qG8iHKYabGDsmTOrANdYF9a9AfuBDf3CsIyBy3U3tXleaYraCmbaulgnc4YT6vLKYPosMfm2ttu15IaKN/JKLf6eLMyUEk6al375TF+fnqFOAIPXtQfROoFFlRwnc/4+InC0z/8d1LSgak1kS6rocQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+oD8s5A; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736247309; x=1767783309;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=segNsK1bClE37VYoyCZC0plMS53t1xW88+xHFXYR6eQ=;
  b=d+oD8s5AYqXWLo1/aXA7Lzbr5wf9v4OqLtV2GkR3kEnSH4CpjkicuBxc
   vd+lwYfjFzwDnaC0mHK+yx7OiYOO1N+OL5g0DB82XVYV4LZhIFcDRXe7O
   ZsD/ZHDumZNcX9yOmXAqhhmY6EI/Gl0MIAtP6socptpyMnDnUXBCA5BiX
   a2mQYtBE1XGCAVMXjhusoQzMn4dnOz08zXgD5+WWK8iBj1sTEepsypO7m
   qpbw207IAXL9bgI5tmCYwZy0CaqdYMtYmKsdzTVmr+jSR8tgvv4WFVqX3
   +UtKntT0d4Thwjq/65Qr11tlCthxuaH4Jb2Es1wJFkn+6Wv5Iy41tccPB
   g==;
X-CSE-ConnectionGUID: g4w1leLgScCyoy4kaLwSSg==
X-CSE-MsgGUID: gt2ZvffeRyaK9MsuHIR6ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36319343"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="36319343"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 02:55:08 -0800
X-CSE-ConnectionGUID: 5faktFAbSNKYXZGckbBTSQ==
X-CSE-MsgGUID: s1UObTbcQQqedQ5g3QlLww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="102539584"
Received: from derekcam-mobl.ger.corp.intel.com (HELO [10.245.83.121]) ([10.245.83.121])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 02:55:06 -0800
Message-ID: <7bd9c6f6-a0c2-46ed-a06f-fe386cedc644@linux.intel.com>
Date: Tue, 7 Jan 2025 11:55:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Change aic100_image_table definition
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_yabdulra@quicinc.com,
 quic_carlv@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241213185110.2469159-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241213185110.2469159-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 12/13/2024 7:51 PM, Jeffrey Hugo wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> aic100_image_table is currently defined as a "const char *" array,
> this can potentially lead to the accidental modification of the
> pointers inside. Also, checkpatch.pl gives a warning about it.
> 
> Change the type to a "const char * const" array to make the pointers
> immutable, preventing accidental modification of the images' paths.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/sahara.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 21d58aed0deb..09c8b055aa81 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -160,7 +160,7 @@ struct sahara_context {
>  	struct work_struct		fw_work;
>  	struct work_struct		dump_work;
>  	struct mhi_device		*mhi_dev;
> -	const char			**image_table;
> +	const char * const		*image_table;
>  	u32				table_size;
>  	u32				active_image_id;
>  	const struct firmware		*firmware;
> @@ -177,7 +177,7 @@ struct sahara_context {
>  	bool				is_mem_dump_mode;
>  };
>  
> -static const char *aic100_image_table[] = {
> +static const char * const aic100_image_table[] = {
>  	[1]  = "qcom/aic100/fw1.bin",
>  	[2]  = "qcom/aic100/fw2.bin",
>  	[4]  = "qcom/aic100/fw4.bin",


