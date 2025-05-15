Return-Path: <linux-arm-msm+bounces-58111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D1FAB8D99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E3953AD416
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7D12550CF;
	Thu, 15 May 2025 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KffGn10y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1A91DDD1;
	Thu, 15 May 2025 17:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329683; cv=none; b=abI2YAQbGwTgJfzqV2aBUIBdf7+7d0Xiy+FdS7oIZrrG42zGWYVIFksMrgd4lYQ7DlrVeAor0CyvuY79g8JVOnHq7eO48hVTW+R8maKUPq2bgH2XMFvejO6H6xCj8S3vovDxyZlN8zYS2q3cpPEWNlkrQjTbnovet4Z3nzL8eu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329683; c=relaxed/simple;
	bh=Lku0Fqz3R1KYacwiYbjnrPq3OzBpTMZbc8lQ8NqOqVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hhwABlok4BB0HDsvOI/g9D9hSyu5xUjoGYW27wyvStIC+Y9a1EHPsihHzhlWcXEWXN5wE9S/x47pbDMWESyG7lvy3i4zDiYQANUBvyKZ9nRbT7I1p9D0F/HHHKmAoAFkxk4+oTXte4b8xIqAkSC2PCKt1P50IFv0Oc0IWiZDkiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KffGn10y; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54FHLFmu069490
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 12:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747329675;
	bh=IPnPj2DVeO3A+GP4PePrMM6nt9jC2SgWX+MIfNasZLY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KffGn10yUo5IK24e9eUFEH9RP9SuBvZTVp9e0/Qm5WkLMiMf8iSnqyP67cIJTjilq
	 67eAB3iFUhqZIuwmvGfZXEE4m+hgsMXyMwlqxLMDXMJi7cGtfh5SLa7Nd9hSA67Oyx
	 LN1ixPZCVrvngHQEM4XL20RPCcdLw79MJgPPniUA=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54FHLFqU056707
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 May 2025 12:21:15 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 May 2025 12:21:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 May 2025 12:21:14 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54FHLE38014411;
	Thu, 15 May 2025 12:21:14 -0500
Message-ID: <e178418b-4ca3-4b43-82ce-32622ff19477@ti.com>
Date: Thu, 15 May 2025 12:21:14 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "remoteproc: core: Clear table_sz when
 rproc_shutdown"
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250513-revert-rproc-table-sz-v1-1-a8c6b5d6f8a7@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250513-revert-rproc-table-sz-v1-1-a8c6b5d6f8a7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 5/13/25 10:52 AM, Bjorn Andersson wrote:
> Clearing the table_sz on cleanup seemed reasonable, but further
> discussions concluded that this merely working around the issue
> and that the fix is incomplete.
> 
> As such, revert commit efdde3d73ab2 ("remoteproc: core: Clear table_sz
> when rproc_shutdown") to avoid carrying a partial fix.
> 

Setting table_sz to 0 still seems like a good idea from a defensive
programming perspective. Both table_ptr and table_sz should be set
and cleared together in all spots.

In addition to this, another fix would be to also update
both table_ptr and table_sz to 0 when loading firmware without
a resource table. Both should be done, no need to revert this.

Andrew

> Signed-off-by: Bjorn Andersson <andersson@kernel.org>
> ---
>   drivers/remoteproc/remoteproc_core.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 48d146e1fa560397c11eeb8f824ae0fb844a022b..81b2ccf988e852ac79cee375c7e3f118c2a4b41a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2025,7 +2025,6 @@ int rproc_shutdown(struct rproc *rproc)
>   	kfree(rproc->cached_table);
>   	rproc->cached_table = NULL;
>   	rproc->table_ptr = NULL;
> -	rproc->table_sz = 0;
>   out:
>   	mutex_unlock(&rproc->lock);
>   	return ret;
> 
> ---
> base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
> change-id: 20250513-revert-rproc-table-sz-53ecf24726ae
> 
> Best regards,

