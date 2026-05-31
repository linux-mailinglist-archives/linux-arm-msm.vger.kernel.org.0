Return-Path: <linux-arm-msm+bounces-110479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMTwKuFuHGqONwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 19:24:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F87617528
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 19:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56E753013A7D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 17:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59243921CE;
	Sun, 31 May 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QScKu/TI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zd6NpnrD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2149D2DCC08
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780248287; cv=none; b=O2x/3mdpLUXOijwyem5LPgIXRLr2CeROswxnCiIcy7LXULI/tB7UDzPXZDGNyejt69hi4/wqy1vZzvuWlxu3bHlgnY9CzB4u6QatXLptufYf7GQiMbML/gUCN7nktB8qrbAGoDnTEBPcQLz5MpYaTptjSa+Izk6UgvZjlKwZkcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780248287; c=relaxed/simple;
	bh=ky3L5cRsLB+b8CxvBfdtboA2OUoWuWGplH03HCAsw88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNvkqAklms9+hJCejEHK5CVk5j2YW1+9XtQxxmkRjAhkg2DjECMURaP5Z/Rf0irHjKD3oxYU3Rg/ZDi/RA+yTU7L2OHf1FVbnmSWTv1R3XYhJ63o7rBeeO4RGYxpEsg2jWXPyx7OErPzOiyvKTMNQCtuP3XmSNzVp7OO57HJfMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QScKu/TI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zd6NpnrD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V5jh3N772872
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 17:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ljfg8GLQiAYFLZevBkHWq2Ge
	6r6LCF8k5rc/boN+Qf8=; b=QScKu/TIj1K0knnLG1Yg4AqkaKgcfVQc1Tjf/vZh
	6UcXzTMVKq+yl0YhNSZOzhPIB3QbGAO513Tcg6Bf88uxxtiFsH3i0x8RN7u6M+Cw
	yxYhuebox5vDkPrbiw3/Whki1ZyJKaVo8lT86aWI4RfwqQxrO+D6bDEZSMhrn1Sd
	Czt5PKCEtusbpozPPu/mYhuZu2YL5YpJZGs2wdFBr+0LCnLAJ1Ks8Zvlpct61COq
	8hpMgdGSc+veTVMjgMIDIIqj+0xwjz+kN8KqofTzJ6nWtd4sPQmgrENr2/Dj3v6T
	2d5tpNVi2+6Nw9Vz08jxlwdlZ0yxPn7KJswQDwLEGTUBmw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7uck2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 17:24:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97415004so1339535a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780248285; x=1780853085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ljfg8GLQiAYFLZevBkHWq2Ge6r6LCF8k5rc/boN+Qf8=;
        b=Zd6NpnrDTatCChSxSlW3pRWo8SBBghVCGCNS0++Bj823dvZS6o9HlcyntNEswUhX7W
         IURfZQC9ds4rMOKOABe3J39xemBwRGVoWbVEAXsCTmxRY20XnDCmeldQSe9NKwBhN8GT
         vGzHlGVjulq+XXFZJWK4ZEqxAbNYKBoHn62BIiPSURsBirUtwmj8ZWZEwUV891eOZqaz
         Y6IrsE7SWfGvV0bAil0OApViT4cSGCG3CpBxHdZ3xpqIboJbqo1uEsSDTXBJbU8i5dr8
         bXaX02fbrVOA85qwdoK0y+9IQq5IJU1nSfDYr4v5pqJVvNjQy+/DZcfeteXDXacw63G5
         3KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780248285; x=1780853085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljfg8GLQiAYFLZevBkHWq2Ge6r6LCF8k5rc/boN+Qf8=;
        b=aGAx8pMEYz3sKFDW24/v6F5iFaBtryzqQY1r1C38N2LW+lJB4tYrYNinSXY8sTm8Gc
         YHqlH2FhscAb0lzpNZP0RfvmiF/neUhhR7ARvBdI4YmxBgGmL08L307JnIh55F9+GOKc
         EaNVgFvi3PkoartyUhCfuPA+/auQyr9oZD3XD6mSpSgyzue1zaW+8dtLWcASaFjBg+tq
         wGmMC5pmS8sK5jK5TXn7ClYUuzgD6mG1ay1tIs6XuLAS1Fe61BIwJtGiXMOC2HxAr9OU
         XKhW8kh/dkpwwcbDgbCmJ6y6xijMnqS6l8nfx8kYhnHnUq0KUc2EVPCDYu3eN6fbGpFX
         XHIA==
X-Forwarded-Encrypted: i=1; AFNElJ+Eb7MzFajtNg2irjViG3tD2f4reum+9zePSlMWpXYosV8IHqKI3Y26E4ISgr59XqbbSBZrB5/VM56hoSzV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8NYVHn1SA+djHtQhsz9fOgbLb9GMWEmrYJCOymWpB3hSLKqc/
	OWDz8YGWv5dVvEcA2TQ0/8L2Jf4Nvov4CUPFT04JyDFijxG+AzWjqQbpTewfew2uTpydNL19NGK
	3NaiucpsU4O222nx7ev8wBPBHQ3mmIFe1LczLkjTqWZR+//P0dzPAKTlXVmSt0acsdQx8
X-Gm-Gg: Acq92OE6G7QfBeF4DjEYlxZgoBoyhaOF9yRzLHr73PYRyOvq7G+7DwvGXyzFz0YC3qI
	D3B3qBjx6TmKCh+paiWeaVB0shzKLExashPxpOuD9mEbuSFxFB91HKQPnt1/g9BxEVKSt5AtFko
	LOz4VQUlMR3tC4DpW+ALB6fsWlXwJJkB/vi5uR/S4LuIzLFM3y7JbUJHOsuUPF5LEBMYWlfN2Ua
	p2FlljB+P0jm4d/raseyURjltcO3q7cJycu/YiWEBOcEAPvabm19hxZn8bJ0hadWo49W3qtLKeB
	gg6X6l+5m38kvKRah6xVWshaCpEyKoBwhd8kZ/W12asiK0MHBOUYdvpIixE9ohvkH9AE01/g1pg
	Y8ve3cGt5dGhtUNqSdXRRQXyc1Xj5onSDl42aD73DHvkMzm6fcDuGLp3oHgw9mM3vK2mADw==
X-Received: by 2002:a17:90b:574e:b0:36d:635a:ac1b with SMTP id 98e67ed59e1d1-36d635ab5e9mr5465221a91.22.1780248284759;
        Sun, 31 May 2026 10:24:44 -0700 (PDT)
X-Received: by 2002:a17:90b:574e:b0:36d:635a:ac1b with SMTP id 98e67ed59e1d1-36d635ab5e9mr5465215a91.22.1780248284278;
        Sun, 31 May 2026 10:24:44 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6b50edesm8030762a91.14.2026.05.31.10.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:24:43 -0700 (PDT)
Date: Sun, 31 May 2026 22:54:38 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, konrad.dybcio@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Subject: Re: [PATCH v1 1/1] mmc: sdhci-msm: Set ice clk rate
Message-ID: <ahxu1rm14pbwQFXK@hu-arakshit-hyd.qualcomm.com>
References: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
 <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1c6edd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pPzFWFYw7oQxx3fYbUYA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDE4OCBTYWx0ZWRfX3TsiVqWvmFLZ
 /O7cArghjNIS0QEAxTvYyJKMfYTuAclq4CZO2eS5tYGHylf3xEHZFKwcRRtQQ4BJyMN8jGuCIua
 7+fuq2usYyeDBXF4rwVHaLBBiqT2D3+MqQ5NimIx7djzu7GRtHJyECUugPBP/9Wq7/rO1zRFXf6
 aJK2ZJkW3ARv8RmawQpGlpIxnom/mF7kvJkmytxm/pEUfzA5MEIQzajVfIZtdz+7i5+FQ1Uw9tU
 B/xlfCRBm2EwFlwvVLTpVM4XejlmwjMvgUmPce3wi3K2h89eUkZxEPj0o2SYD4/8mWrC0t1/YsA
 DgIK8Q562efm+0yci9kLihEF/HYp9PDuwBH8fWDe56CD+ZgffL4sXVJGZNPEO6YbJwLnNTzrOuo
 Yj63w46O92HHiyqRPxsM0DaFvHjd/tvOnKWtEHv+xGBGGcP/82MxfyO99RUlZeDBY6ppeLH4ozE
 1qPK1aJfJowIWauePfA==
X-Proofpoint-ORIG-GUID: 5NA3cbaNnC972oGAzWwjFjQ4ddl51-wc
X-Proofpoint-GUID: 5NA3cbaNnC972oGAzWwjFjQ4ddl51-wc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310188
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110479-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61F87617528
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 01:40:45PM +0530, Ram Prakash Gupta wrote:
> Set ice clk rate from sdhci msm platform driver, needed for
> target which are having legacy ice support, and need sdhci msm
> platform driver to set rate.
> 
> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index b4131b12df56..c6a073718aa4 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -286,6 +286,7 @@ struct sdhci_msm_host {
>  	/* core, iface, cal and sleep clocks */
>  	struct clk_bulk_data bulk_clks[4];
>  #ifdef CONFIG_MMC_CRYPTO
> +	struct clk *ice_clk;	/* ICE clock */
>  	struct qcom_ice *ice;
>  #endif
>  	unsigned long clk_rate;
> @@ -2708,6 +2709,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +#ifdef CONFIG_MMC_CRYPTO
> +	/* Setup ICE clock */
> +	msm_host->ice_clk = devm_clk_get(&pdev->dev, "ice");
> +	if (!IS_ERR(msm_host->ice_clk)) {
> +		/* Vote for max. clk rate for max. performance */
> +		ret = clk_set_rate(msm_host->ice_clk, INT_MAX);
> +		if (ret)
> +			dev_err(&pdev->dev, "ice clk set rate failed (%d)\n", ret);

If we keep dev_err(), the failure path should probably go to bus_clk_disable.
However, since boosting the core clock to max is kept optional,
I think dev_warn() is more appropriate here and avoids making this a fatal error.

Abhinaba Rakshit 

