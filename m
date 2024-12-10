Return-Path: <linux-arm-msm+bounces-41306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50F9EB0E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DCA718825EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 12:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C841CD15;
	Tue, 10 Dec 2024 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOu8HGo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6712E1A3AB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834074; cv=none; b=IIoDH0xXtKo4Wa23BkPtRGN0N045Y/f0fADGLL52opAtFFBbSlUQ3dypmOC6zG0QcIWm/JsSOM0860SgCTilMwH3TPWH8+TRmhIMz7RS4oIyxhmOUE42h6svJrLlCAwJcRbiVMv84MzIPi4ScIfWqFAefah2eeoCJXqQKX56Hic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834074; c=relaxed/simple;
	bh=DcpGbcGoWnPprsTcfihBEHsSBixVyfT8bKiR2w9j6Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUjr4U6GHeY010U+oOYgXNCCCEV1jtV2J+dXRY2U5GscU7WGGL0oMuRQoD2R69JK13IlRj7lrktEB1HpgiHSUJ9z+rQWWjIeeTsA0O7roGoKqAghugh3qBDvLD8cxz+hCVSaT52rmI2kip9EAky47B+S7fmrOHIR7EtStQGt+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOu8HGo/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733834073; x=1765370073;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DcpGbcGoWnPprsTcfihBEHsSBixVyfT8bKiR2w9j6Q8=;
  b=YOu8HGo/DA8KE1bsfEkr8XJNrkADoPTr5C+dYcuD4iApCe/L1V8EF4Oo
   c6sljRTuWZnEsUQEp7/5Tv5RctxqGY4LTCrH4quUa/5zSbh+IzUWtgayP
   zx2/98Dce9LpUHKaniAvjQHAx3x99X0jHRPZnQktS1f6o6DNdXEwHKYUC
   0dzSQW7I421t/NdiOxYb4LwaX51F4XK8wpFsFZZhDfWUU/EqamcWfuuu5
   4v7g6W/aM4+yoMkxa+sgvS0IGM3FoTTkkuIldatpM5rZ0AjTcwWmavduH
   4E3ywMCMFT+wfPTCsUKWS6cvqUY38hv1b0eUN+Kmqk1wp12/I290I8Yar
   w==;
X-CSE-ConnectionGUID: n818BRuVShWzWSfNe7LEug==
X-CSE-MsgGUID: wUGc+caHSV+bJh3kgMfWyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="51700720"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="51700720"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:34:32 -0800
X-CSE-ConnectionGUID: LuJ5hUX+SyKiuCLVIXNf5w==
X-CSE-MsgGUID: 72/IcMkgRnyoV2KyeCwvBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95601150"
Received: from unknown (HELO [10.217.160.151]) ([10.217.160.151])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:34:30 -0800
Message-ID: <b210c30a-21f5-417b-aac8-f54f9c302096@linux.intel.com>
Date: Tue, 10 Dec 2024 13:34:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix typo for struct
 qaic_manage_trans_passthrough
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_yabdulra@quicinc.com,
 quic_carlv@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241129202845.3579306-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241129202845.3579306-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 11/29/2024 9:28 PM, Jeffrey Hugo wrote:
> The documentation header for struct qaic_manage_trans_passthrough has a
> typo - "t" is missing in "transaction".
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  include/uapi/drm/qaic_accel.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/qaic_accel.h b/include/uapi/drm/qaic_accel.h
> index d3ca876a08e9..c92d0309d583 100644
> --- a/include/uapi/drm/qaic_accel.h
> +++ b/include/uapi/drm/qaic_accel.h
> @@ -64,7 +64,7 @@ struct qaic_manage_trans_hdr {
>  /**
>   * struct qaic_manage_trans_passthrough - Defines a passthrough transaction.
>   * @hdr: In. Header to identify this transaction.
> - * @data: In. Payload of this ransaction. Opaque to the driver. Userspace must
> + * @data: In. Payload of this transaction. Opaque to the driver. Userspace must
>   *	  encode in little endian and align/pad to 64-bit.
>   */
>  struct qaic_manage_trans_passthrough {


