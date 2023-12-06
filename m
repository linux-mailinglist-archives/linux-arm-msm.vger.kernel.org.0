Return-Path: <linux-arm-msm+bounces-3499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5029806468
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 02:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3812822CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 01:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ACF46B7;
	Wed,  6 Dec 2023 01:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="myDWz9yz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0044C18B;
	Tue,  5 Dec 2023 17:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=v5RePDUwYgBtV9FXypbgr6pbYR4NEqK4Pxca2uRjtfw=; b=myDWz9yz/MAdL2scpZ+48gE3ON
	HhVmT1I8syLn82evaehJ4fZTsNovpOh6rbzS5Q49ls9o4Ze0ZBWpX9hCWuCYb6ATl/jLBlif+9i49
	PSO25Df2P7B168MENUHu6IIJNXLBtSLaufLNPaD+/VfoMWbXuUiLgY1GQidn/RfJ63U33VkcY1wlu
	f9+EjX2re1+Y/S8+phIM7M2uIaN7L+1qrf6GBYRNEULufkYYEaNjLcQL5csOTq0TjC3DY+N6jgCjm
	HKNqaxH9A64HQXLFT/0RQJLPXHPX5mcAQBIRYLDCl5KXywyYswl2M7jDHpm+8HvV3RyRxAv8slVoG
	tFfb3oKA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAh5Q-008qWP-0S;
	Wed, 06 Dec 2023 01:52:28 +0000
Message-ID: <22785d9a-0d4f-4ebd-bc98-3e77dcb4db13@infradead.org>
Date: Tue, 5 Dec 2023 17:52:24 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: stats: Fix division issue on 32-bit platforms
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231205-qcom_stats-aeabi_uldivmod-fix-v1-1-f94ecec5e894@quicinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231205-qcom_stats-aeabi_uldivmod-fix-v1-1-f94ecec5e894@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/5/23 16:44, Bjorn Andersson wrote:
> commit 'e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")' made it
> in with a mult_frac() which causes link errors on Arm and PowerPC
> builds:
> 
>   ERROR: modpost: "__aeabi_uldivmod" [drivers/soc/qcom/qcom_stats.ko] undefined!
> 
> Expand the mult_frac() to avoid this problem.
> 
> Fixes: e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

That works. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested



> ---
>  drivers/soc/qcom/qcom_stats.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> index 4763d62a8cb0..5ba61232313e 100644
> --- a/drivers/soc/qcom/qcom_stats.c
> +++ b/drivers/soc/qcom/qcom_stats.c
> @@ -221,7 +221,8 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *unused)
>  
>  	for (i = 0; i < ddr.entry_count; i++) {
>  		/* Convert the period to ms */
> -		entry[i].dur = mult_frac(MSEC_PER_SEC, entry[i].dur, ARCH_TIMER_FREQ);
> +		entry[i].dur *= MSEC_PER_SEC;
> +		entry[i].dur = div_u64(entry[i].dur, ARCH_TIMER_FREQ);
>  	}
>  
>  	for (i = 0; i < ddr.entry_count; i++)
> 
> ---
> base-commit: adcad44bd1c73a5264bff525e334e2f6fc01bb9b
> change-id: 20231205-qcom_stats-aeabi_uldivmod-fix-4a63c7ec013f
> 
> Best regards,

-- 
~Randy

