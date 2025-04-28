Return-Path: <linux-arm-msm+bounces-55873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E7A9EA99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 10:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25E697AA8C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 08:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7929A25EF96;
	Mon, 28 Apr 2025 08:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hdMwjSOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8207725E818;
	Mon, 28 Apr 2025 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828388; cv=none; b=gd2ozXF0WfUkYuTnf3EWw+aqdYJVlRmL8am3hZolYQwoCNSuDH/xjR2SXlN1PL0t4rQHLvhq4UzBiQPcwYuyAFj7l08r67tYGvQvFivMHZ5T6uTSbLdpZQSlwrKW7uiJs0IdN0RkoQbuuD7RG0Wl2mmfIsa4dX3lPZzfsez13Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828388; c=relaxed/simple;
	bh=VK0BrH3ZZDN9Jgn9dD1/pWlMvI7r00jAXZwatq9vcEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JXhkGvI6IwU/ZqUPszi8tAUAiZ0DX8ff/mjfKAYvIJhZVuJxyEx6Ke8UkVXifhoXsenSgqsNRFjwQc1/JWRNdrCkMlSZQJT0oQFtgHQxZFQ1djtTA6+nnw0s9DZpSnz45tdXpb61WhQt9TfEqe0gOh1iG+SxNkh0iO4r8F5Fqag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hdMwjSOR; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S10w7P021339;
	Mon, 28 Apr 2025 10:19:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	yr7t1olrwsxTtck0/lM3DwdKRKb3Z1gEKVydU7fX9vg=; b=hdMwjSORmCF7wlLm
	irCx7AnOE8qIJNbjPKSlLflA4pJaS5QX9+kDvKlOKc0Bryt1Z6wnrJJqERnf9NKD
	c/3SU4ACwMwXZCt1byR8rs0K0MBb6CyEdDssM991Jrcw+OBgUW99LeD0Kml0SgsG
	MqPhHzQYIEDEYR29tSwc4qAPBZQeG3+IFqbFliIB4E2AfL8rabyB5VxYeySrfx2M
	6YEP1gmhXIxuN6EedCVN/QmI7Sg+leAeo3WruQudKtDMscZ/wXtdN4TMj0KCzzrt
	cpWe80Mr2F2LtoOr0yOos5ZaBOWhByW6LWlANsoXQ0AwdHY6scYRQbTpxJMf5l+n
	MGHDTg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468mm9drpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 10:19:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2352040048;
	Mon, 28 Apr 2025 10:17:43 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81ED0A2D14A;
	Mon, 28 Apr 2025 10:16:05 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:16:05 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:16:04 +0200
Message-ID: <698066cd-6fee-4fd8-9caf-0f5fbd19fda6@foss.st.com>
Date: Mon, 28 Apr 2025 10:16:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] of: Common "memory-region" parsing
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Saravana Kannan
	<saravanak@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
	<wens@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Daniel Baluta
	<daniel.baluta@nxp.com>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01



On 4/23/25 21:42, Rob Herring (Arm) wrote:
> While there's a common function to parse "memory-region" properties for
> DMA pool regions, there's not anything for driver private regions. As a
> result, drivers have resorted to parsing "memory-region" properties
> themselves repeating the same pattern over and over. To fix this, this
> series adds 2 functions to handle those cases:
> of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().
> 
> I've converted the whole tree, but just including remoteproc here as
> it has the most cases. I intend to apply the first 3 patches for 6.16
> so the driver conversions can be applied for 6.17.
> 
> A git tree with all the drivers converted is here[1].
> 
> v2:
> - Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
> - Export devm_ioremap_resource_wc()
> - Rework handling of resource name to drop unit-address from name as it 
>   was before.
> - Link to v1: 
>   https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Rob Herring (Arm) (4):
>       of: reserved_mem: Add functions to parse "memory-region"
>       of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
>       devres: Export devm_ioremap_resource_wc()
>       remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
> 
>  drivers/of/device.c                       | 31 +++++-------
>  drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
>  drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------
>  drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
>  drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
>  drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++++----------------
>  drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
>  drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
>  drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
>  drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
>  drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
>  drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
>  include/linux/of_reserved_mem.h           | 26 ++++++++++
>  lib/devres.c                              |  1 +
>  18 files changed, 339 insertions(+), 369 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250423-dt-memory-region-v2-a2b15caacc63
> 

Testing of the series on the STM32MP15 platform has passed.

just one minor comment in patch 1/4.

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks,
Arnaud




> Best regards,

