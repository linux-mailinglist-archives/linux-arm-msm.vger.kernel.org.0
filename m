Return-Path: <linux-arm-msm+bounces-77945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E89EBEF715
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 08:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F015434943D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 06:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A682D661C;
	Mon, 20 Oct 2025 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVRCmo+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FDF2D6409
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 06:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760941071; cv=none; b=B/u6Fb1r1nnG86ZJFcdBJpujNKHCFw25MvBFEDL2m7NTXtu+yG9RFCu6ui+/c3/ronAa9AMGE5VFidIHW+Tu7mvaodlWT1GoRWk3kVlq7W+p2JZUMITmJLDS8OiSYoUIiIixd3uZstCUczjl1BAEy7wC4osm5k7jEgwgDeXZH04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760941071; c=relaxed/simple;
	bh=vaOnzfC60iu6YIVtK6usVRKW4rEfT+6uRxEg3uNMtGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhwMwn18OxmmgDWkAAW3gUK4SrkUm2MPP62+IX9iTAeCSY166aDRkuCxsUuG6pKZrwvuoVVMRR/Q3dRNggrH6IEF0e8WuntcmAyonNP4xpTBPuRaOC1iQ+30nQLXEfl+JqCG5zlobpeNjQqsCFr8SCJx4gqKdgFpX6Lca4D0Bu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVRCmo+8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760941070; x=1792477070;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vaOnzfC60iu6YIVtK6usVRKW4rEfT+6uRxEg3uNMtGg=;
  b=HVRCmo+8NsKDW0UkSt/dPMvZkLXdreRfyPAB1N4iKlD2U6M32MoB2Zyy
   Lzvn6TCgM3n2yylHA/sJagjP8OEItQBieTxNC834i65nhzPxjCOro28qg
   mGDpyC1U6ElsvngXAllat617EI8jrXtnZSsD53hR9jiSrgLjrOfhyxU75
   7kFYpKrjeKSMZOwJ7gWVDfH3y+W3lv1oAdlC/AbN9PtLsYIjYxyq5j0og
   2GJ8jAN7H/uDKWxYovUMVPAHU7Xlxf/2Qh7xCk4+MfMuDbmB5aDYOTSw8
   I3k1dK6mp7eA6y15a2lgptpAcpdEy1PcDCeyHUwXC2qRFVczJbih3FDVy
   A==;
X-CSE-ConnectionGUID: /83KR+dURbelWPZ4c6Bhsg==
X-CSE-MsgGUID: rzNusSvSQL+26PPPtP+nVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="63096313"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="63096313"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 23:17:47 -0700
X-CSE-ConnectionGUID: d7RvmPwESXeRrONWq29zNg==
X-CSE-MsgGUID: HBxe83KURRewpXDd1V44ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183270421"
Received: from unknown (HELO [10.102.88.18]) ([10.102.88.18])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 23:17:45 -0700
Message-ID: <bd7a0f8e-1d9a-4db1-81a9-2154e45d8a69@linux.intel.com>
Date: Mon, 20 Oct 2025 08:17:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Update the sahara image table for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zack McKevitt <zmckevit@qti.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/2025 7:34 PM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
>
> Update the Sahara image table for the AIC200 to add entries for:
> - qupv3fw.elf at id 54
> - xbl_config.elf at id 38
> - tz_qti_config.mbn at id 76
> And move pvs.bin to id 78 to avoid firmware conflict.
>
> Co-developed-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
> Changes in V2:
> - Squashed the following patches:
>   * accel/qaic: Add QuPFW image entry for AIC200
>     Link: https://lore.kernel.org/all/20251007161733.424647-1-youssef.abdulrahman@oss.qualcomm.com
>   * accel/qaic: Add tz_qti_config.mbn entry for AIC200
>     Link: https://lore.kernel.org/all/20251007161929.426336-1-youssef.abdulrahman@oss.qualcomm.com
>   * accel/qaic: Add xbl_config image entry for AIC200
>     Link: https://lore.kernel.org/all/20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com
> - Moved pvs.bin to id 78
> ---
>  drivers/accel/qaic/sahara.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 3ebcc1f7ff58..6ac0384c7dc2 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>  	[23] = "qcom/aic200/aop.mbn",
>  	[32] = "qcom/aic200/tz.mbn",
>  	[33] = "qcom/aic200/hypvm.mbn",
> +	[38] = "qcom/aic200/xbl_config.elf",
>  	[39] = "qcom/aic200/aic200_abl.elf",
>  	[40] = "qcom/aic200/apdp.mbn",
>  	[41] = "qcom/aic200/devcfg.mbn",
> @@ -202,6 +203,7 @@ static const char * const aic200_image_table[] = {
>  	[49] = "qcom/aic200/shrm.elf",
>  	[50] = "qcom/aic200/cpucp.elf",
>  	[51] = "qcom/aic200/aop_devcfg.mbn",
> +	[54] = "qcom/aic200/qupv3fw.elf",
>  	[57] = "qcom/aic200/cpucp_dtbs.elf",
>  	[62] = "qcom/aic200/uefi_dtbs.elf",
>  	[63] = "qcom/aic200/xbl_ac_config.mbn",
> @@ -213,7 +215,8 @@ static const char * const aic200_image_table[] = {
>  	[69] = "qcom/aic200/dcd.mbn",
>  	[73] = "qcom/aic200/gearvm.mbn",
>  	[74] = "qcom/aic200/sti.bin",
> -	[75] = "qcom/aic200/pvs.bin",
> +	[76] = "qcom/aic200/tz_qti_config.mbn",
> +	[78] = "qcom/aic200/pvs.bin",
>  };
>  
>  static int sahara_find_image(struct sahara_context *context, u32 image_id)
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

