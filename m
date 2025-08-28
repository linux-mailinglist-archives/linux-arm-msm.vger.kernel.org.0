Return-Path: <linux-arm-msm+bounces-71087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4086B39974
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D676176498
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 10:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0CB308F0A;
	Thu, 28 Aug 2025 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCdrXVHt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA33081CF;
	Thu, 28 Aug 2025 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376191; cv=none; b=aM44kFxF4vkE9nHLGed0nJKOvH+m6mVWwnld6ETqyqvBSPpcIEvBvbcAdrCmNcdSoqFifYJynH8cnuT/luSvufH5P4ivlf2xVvQUmbYBF3YoPq12Kw8fcd6dyufJyijTJJR86505xmW8VXKoGMCpUpThk0dtIgDykGct9lpxeGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376191; c=relaxed/simple;
	bh=9AhecmCpNrrUSjsrecrQe2CL2tQ3LbxLRxBTLNW/I6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTABESY/rBQt5yebqUZO7zLUq+OYWEdnZ6umzSMJ7cBXrk9kky08neMl9lQDrCy3bZudwO1LChe8uPD253/19wTms/uB0ebQmNfBrVQNv/MLGvZaLEzUqMmCLv57ZdsMrMvdyVPmr0kUdeG07BYz0sHN+NcUhDYK9KrIPmxSX/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCdrXVHt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756376190; x=1787912190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9AhecmCpNrrUSjsrecrQe2CL2tQ3LbxLRxBTLNW/I6c=;
  b=kCdrXVHtp9FG7/CD6ZMRFsyip8/keO39uzTqgaBiZVHy7b3LC46cyb4o
   FhNJHeyO5Gn1/NTcp2ngsen+o46eTGkv+3aR74g2aKkpzTV5Vgg1mdOh3
   b7VDyQise8Sq1LcMNqxABxwlQggJTVZtnQakfDL/AAafMw9agfCalaSMM
   ZLfnOxHvApZ9XUIwGOmMfslBjbdh86sKW7I9U0HBs8X/CTDK1fak8FrSn
   oaAp1YbQYv/e1HJ8BbraQKsthLxqOEwdeuXcF23/agZn5SJOCCNlgHwf0
   QaA4uBvAkp8PZJCpaZZh452P1IFnHsQw8GbVA/ASvgtGkiTzwtAxv6fE8
   A==;
X-CSE-ConnectionGUID: Ov98luw6Q7awMDOEOrubhA==
X-CSE-MsgGUID: 1ZGw79ajSjmXyUHRsvLj+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61275397"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="61275397"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 03:16:29 -0700
X-CSE-ConnectionGUID: F7FbhJlcRg69b1NtU/w1ag==
X-CSE-MsgGUID: aCGmAGT2S76Yjxj5AMYN1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170246185"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa008.jf.intel.com with SMTP; 28 Aug 2025 03:16:26 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 28 Aug 2025 13:16:24 +0300
Date: Thu, 28 Aug 2025 13:16:24 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, lumag@kernel.org, neil.armstrong@linaro.org,
	johan+linaro@kernel.org, quic_bjorande@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] usb: typec: ucsi_glink: Update request/response
 buffers to be packed
Message-ID: <aLAseOzr9_s0_lOv@kuha.fi.intel.com>
References: <20250827201241.3111857-1-anjelique.melendez@oss.qualcomm.com>
 <20250827201241.3111857-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827201241.3111857-2-anjelique.melendez@oss.qualcomm.com>

On Wed, Aug 27, 2025 at 01:12:40PM -0700, Anjelique Melendez wrote:
> Update the ucsi request/response buffers to be packed to ensure there
> are no "holes" in memory while we read/write these structs.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 8af79101a2fc..1f9f0d942c1a 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -30,24 +30,24 @@ struct ucsi_read_buf_req_msg {
>  	struct pmic_glink_hdr   hdr;
>  };
>  
> -struct ucsi_read_buf_resp_msg {
> +struct __packed ucsi_read_buf_resp_msg {
>  	struct pmic_glink_hdr   hdr;
>  	u8                      buf[UCSI_BUF_SIZE];
>  	u32                     ret_code;
>  };
>  
> -struct ucsi_write_buf_req_msg {
> +struct __packed ucsi_write_buf_req_msg {
>  	struct pmic_glink_hdr   hdr;
>  	u8                      buf[UCSI_BUF_SIZE];
>  	u32                     reserved;
>  };
>  
> -struct ucsi_write_buf_resp_msg {
> +struct __packed ucsi_write_buf_resp_msg {
>  	struct pmic_glink_hdr   hdr;
>  	u32                     ret_code;
>  };
>  
> -struct ucsi_notify_ind_msg {
> +struct __packed ucsi_notify_ind_msg {
>  	struct pmic_glink_hdr   hdr;
>  	u32                     notification;
>  	u32                     receiver;
> -- 
> 2.34.1

-- 
heikki

