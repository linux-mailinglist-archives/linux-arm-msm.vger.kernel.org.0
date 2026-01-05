Return-Path: <linux-arm-msm+bounces-87407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96889CF30C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 11:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D0283003849
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 10:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB3230FC37;
	Mon,  5 Jan 2026 10:49:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CF322FDFF;
	Mon,  5 Jan 2026 10:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610158; cv=none; b=jUuYGDDCzymlN+enLRBGTdTFlq075WZYg2lXiYL60KVU2ihkecufg0/mT25VVoqImqsutlz0GPdCgig9lAH0lxruf/85bxHMRIbcqd7LRN/5E8DAZRrYjgUgEsBWqEU0eVb0WHEzSJ3uEAuapF/Jymx/viWoI+2Ag1QHUTV840Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610158; c=relaxed/simple;
	bh=4k4Cn4q+unzIWAYJOCK/K+47VbXR4usPxfKr09dP8Dg=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=th/scb+1lK+IZyjYOOxRoG/S5DAodV8FEIt4aG+AyBD5M/qz+d76k08vSYXa3i6xZo+rMmb/f1Hl1gay8/zj41L0EJSA3w4/aPl2TQTdF94ri2aKwRUURZZLdvfNXwtdMJuVy2iSWnmKfElc9iaKZplnfNXKxtYg5KgGN/9tJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dl9xm4b9BzJ46jX;
	Mon,  5 Jan 2026 18:48:12 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id DA0FF4057E;
	Mon,  5 Jan 2026 18:49:12 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:49:12 +0000
Date: Mon, 5 Jan 2026 10:49:10 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] bus: stm32_firewall: Simplify with scoped for each
 OF child loop
Message-ID: <20260105104910.00006981@huawei.com>
In-Reply-To: <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
	<20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Fri,  2 Jan 2026 13:50:32 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
You could throw a __free() in there for firewalls and avoid having
any cleanup at all to do on error (or good path for that matter).

Otherwise LGTM.

Jonathan

> ---
>  drivers/bus/stm32_firewall.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> index 2fc9761dadec..fae881cea9a0 100644
> --- a/drivers/bus/stm32_firewall.c
> +++ b/drivers/bus/stm32_firewall.c
> @@ -241,7 +241,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>  int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>  {
>  	struct stm32_firewall *firewalls;
> -	struct device_node *child;
>  	struct device *parent;
>  	unsigned int i;
>  	int len;
> @@ -251,25 +250,20 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>  
>  	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
>  
> -	for_each_available_child_of_node(dev_of_node(parent), child) {
> +	for_each_available_child_of_node_scoped(dev_of_node(parent), child) {
>  		/* The access-controllers property is mandatory for firewall bus devices */
>  		len = of_count_phandle_with_args(child, "access-controllers",
>  						 "#access-controller-cells");
> -		if (len <= 0) {
> -			of_node_put(child);
> +		if (len <= 0)
>  			return -EINVAL;
> -		}
>  
>  		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
> -		if (!firewalls) {
> -			of_node_put(child);
> +		if (!firewalls)
>  			return -ENOMEM;
> -		}
>  
>  		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
>  		if (err) {
>  			kfree(firewalls);
> -			of_node_put(child);
>  			return err;
>  		}
>  


