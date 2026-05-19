Return-Path: <linux-arm-msm+bounces-108531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKO5CfVsDGpKhgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:00:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C09E8580281
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A5063047AEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD4F3ED3C7;
	Tue, 19 May 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+dbhxrZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DD6340419;
	Tue, 19 May 2026 13:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199143; cv=none; b=dJZBrUi4NPnjRxyB78J1ebHNovPEdvHYlSVmMlWhs0L7peTGKgS2sJBk2eevPNCXOXhejxkevAKRjCV3NrkLytQO7Bw2FipLUbdVv05d8HN8AV0IMZU4Moff5Vy8ITnco5H+i+wOUTU2MY+qAKvr56YdZ+7BbaAEsu/yBk7/ad0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199143; c=relaxed/simple;
	bh=7J+DjS+s4JtM7oEcammwzMXSBRG+jIBE93+dWk29Psg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gi3Rz08ZbmQ2z+j6kDYEdZe+GzShSCY8Bm5JWG9ailHwLa32g01fMJ6tt1v7Co5ZUYhyoJRwSLT25cpP+IVsYeIzHp6M399Di+gf90otNJ8eWkeiZrEncFn1kEclZE9xK4Jw89trAwGv5HngyRem/HoV9Wk4/sgTVvpSKc1ak/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+dbhxrZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779199143; x=1810735143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7J+DjS+s4JtM7oEcammwzMXSBRG+jIBE93+dWk29Psg=;
  b=Z+dbhxrZ5BK2HusFlNakw4bXhN2LY1aRqljTdMZnYOyzPavpKhC7guTO
   MWBwqYXqRffVxGxiACVj1D+9QzbV2JOuQheoq0W3YbpdQ/+ug+DlqiWNm
   1lkvPwhdaV1KIhczXORHxSaj74imcbn9g/rDjMoQ1SDJuFwa97eFu18EB
   H9U54UK6wqKqNHZk2AhgdHJIpTgQxdk/sdq3l6Lr038FpRHQ/31lKUAty
   KihQKH8UAARWPAs86hDKaGRRWaxLeXS2FilVdTFDM1TBMPuA/zu0NS1Xa
   U9C/CmhuUvi3WruCA2JQEamcRP3wXozBh3Gvn94DHaDb5DIf+FhzyG/ht
   A==;
X-CSE-ConnectionGUID: BKxWdgeSTi+LbtHqN3J/CQ==
X-CSE-MsgGUID: CdUTkXrvQMSEhLmhmkdosA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102752082"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="102752082"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:58:52 -0700
X-CSE-ConnectionGUID: MHSmj2m9Qj+6jtl+XMsSDg==
X-CSE-MsgGUID: 64DIVHisQimB24mqwfYlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="240038638"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 19 May 2026 06:58:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 2A5EB95; Tue, 19 May 2026 15:58:48 +0200 (CEST)
Date: Tue, 19 May 2026 16:58:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: typec: qcom-pmic-typec: Drop redundant header
 includes
Message-ID: <agxsjF8SI7XDaB_j@kuha>
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108531-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: C09E8580281
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:00:16PM +0200, Krzysztof Kozlowski wrote:
> Unlike other units in this module, this one does not request interrupts
> or regulator supplies.  It does not use OF graph, USB role switching or
> TypeC muxing APIs.  Drop redundant header includes to speed up
> preprocessor.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 3766790c1548..35320f89dad2 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -4,19 +4,14 @@
>   */
>  
>  #include <linux/err.h>
> -#include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> -#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> -#include <linux/usb/role.h>
>  #include <linux/usb/tcpm.h>
> -#include <linux/usb/typec_mux.h>
>  
>  #include <drm/bridge/aux-bridge.h>
>  
> -- 
> 2.51.0

-- 
heikki

