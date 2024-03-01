Return-Path: <linux-arm-msm+bounces-13061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8986DB3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 06:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FE21B20A32
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 05:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3F85102D;
	Fri,  1 Mar 2024 05:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iYMwGkDD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FAE2AEEE;
	Fri,  1 Mar 2024 05:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709271868; cv=none; b=M2f8ZEz/z52inu26tQSslaeacck7aC30LyCL6lmPrcqRON8X/c3BFQfAX+UGdIhFC0ltNCIwfAcuFVlUr90wTpthySin2nqKzZzE7GfC70D7/lCxq4+MWo4AJ586KWBwpxd1W9eaUsI2OPtPVpNaTsrtMdkqRk9etBnHd9jYkWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709271868; c=relaxed/simple;
	bh=x0RYsqPoQe7Py7qVG6iE+FyNJ5qnSlT7pe837V0tbtg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCr3crl0o7B4rKCmAc5VB6l8oMl/zrxej7OkgmxFOFwZjOeHyXNkYiwHJz1RIaandCb8LWUZWz4DoIVDKiE2YiuGYEOtJUcHYljSQubRmGd9uoXKUO+n/fsaZQ4c/cHlkO07PXG5LP0iA/yeSerPBmFDun00z9Cnu978yvKECgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iYMwGkDD; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4215hxqf081979;
	Thu, 29 Feb 2024 23:43:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709271839;
	bh=Ax8wDou/i0Ij3YdyTyGYeuq8MJb/3HgD1UFnkReb0vA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iYMwGkDDnBLEOok5A1DLYm8QBUlSlEI69ZCXBqPYkERZyxZJGEqCLXeThETm0acrm
	 pWQtSiYS0VTngf5sydy6PdTYzK4jb4+8GGv+8tb77nyqSxqj2FraN+P6icjPK+u7yS
	 kEecdkAYGy5xqWSYwXlgBC06lsmMKrnuE2gsH0iY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4215hxWV065949
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Feb 2024 23:43:59 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Feb 2024 23:43:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Feb 2024 23:43:59 -0600
Received: from localhost (dhruva.dhcp.ti.com [172.24.227.68])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4215hwno059467;
	Thu, 29 Feb 2024 23:43:58 -0600
Date: Fri, 1 Mar 2024 11:13:57 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Maulik Shah <quic_mkshah@quicinc.com>
CC: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>, <andersson@kernel.org>,
        <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Sudeep Holla <Sudeep.Holla@arm.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-pm@vger.kernel.org>, <quic_lsrao@quicinc.com>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH v2] PM: suspend: Set mem_sleep_current during kernel
 command line setup
Message-ID: <20240301054357.hgbvbcywbxclebus@dhruva>
References: <20240229-suspend_ops_late_init-v2-1-34852c61a5fa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240229-suspend_ops_late_init-v2-1-34852c61a5fa@quicinc.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi,

On Feb 29, 2024 at 12:14:59 +0530, Maulik Shah wrote:
> psci_init_system_suspend() invokes suspend_set_ops() very early during
> bootup even before kernel command line for mem_sleep_default is setup.
> This leads to kernel command line mem_sleep_default=s2idle not working
> as mem_sleep_current gets changed to deep via suspend_set_ops() and never
> changes back to s2idle.
> 
> Set mem_sleep_current along with mem_sleep_default during kernel command
> line setup as default suspend mode.
> 
> Fixes: faf7ec4a92c0 ("drivers: firmware: psci: add system suspend support")
> CC: stable@vger.kernel.org # 5.4+
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> ---
> Changes in v2:
> - Set mem_sleep_current during mem_sleep_default kernel command line setup
> - Update commit message accordingly
> - Retain Fixes: tag
> - Link to v1: https://lore.kernel.org/r/20240219-suspend_ops_late_init-v1-1-6330ca9597fa@quicinc.com
> ---
>  kernel/power/suspend.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
> index 742eb26618cc..e3ae93bbcb9b 100644
> --- a/kernel/power/suspend.c
> +++ b/kernel/power/suspend.c
> @@ -192,6 +192,7 @@ static int __init mem_sleep_default_setup(char *str)
>  		if (mem_sleep_labels[state] &&
>  		    !strcmp(str, mem_sleep_labels[state])) {
>  			mem_sleep_default = state;
> +			mem_sleep_current = state;

I could've missed this patch. Please CC people who are involved in
the previous discussions :)

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole <d-gole@ti.com>

