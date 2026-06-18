Return-Path: <linux-arm-msm+bounces-113772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kd4oERftM2p/IwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:05:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3506A04E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:05:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=opW2ZeLZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jAOaLxhf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113772-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113772-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81496305C383
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DAE3FAE09;
	Thu, 18 Jun 2026 12:59:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA123FBB47
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:59:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787549; cv=none; b=GCltLspLyn6Jo73wGJvxWapSuT08cnyaD/gNsgBuZbiTqp2uVKpzrTIdwZouAnTwqMRRbhnBLHvOTGrfWk9DSJ1cp/jY77sfgWrM5ad3jkncfnox32QD3NGG+m9afVxZ4LA61LqLwupbUVELjy8ijeDctnt8HWswfbpKjbKWJL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787549; c=relaxed/simple;
	bh=PNtWWUZnOoeuRuQvHHH8ESeBdiXIxik44bljZe73FdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sp9Sd2XxNtx1zSZ485nAtKnoj/5DTTvHHbFeqNo6cLRrGPSEt2NaQHikBAyg78lwhQEU5DzOe4YSz5BcrKRL+P9ResAUh9ObxqATzJ3qUipoAxvBO8269LSPeZ3kPpJcpOuOu8ty3E8Yaa1L0ST1k1lhdJcug9vPznNuYFtvRwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opW2ZeLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAOaLxhf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICuniW1780594
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMYW4I9dC9wuzE1yOpLwjXPmFQ01enmrDtWrZvFEzpU=; b=opW2ZeLZpjprwV8g
	8F6I8NDeMHvWwODi4f5Rwck5vmlqhPcEzKgamVFo0mmVZHdREVUd+jSf+ii2L+il
	64zFJOOGpKEtnyGCadV3m1HFZjHzUd4R84lkPtdGyO2pZVhEaCtie9lcF4FRx5a8
	+AzP2KNPIm1ATPoOz7LGHV7Fx13m35Fa7rfL+vzhmovAkg0hjBXEX+NcjinmmPLT
	J/+l7pjwHpuAuAyavW5MfNArfBHGXUjRNLPQHgo0eb9uC6ACT/laUbmWe7QzB/TW
	ghXtj3zHKsdmN7J/X3ZX3003CJhU0fVc66iLgg1Wzw8F1RTX7dy7ccFzl9Gr2NS9
	8FspRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a3dda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:59:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157b3e5182so11342085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787546; x=1782392346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMYW4I9dC9wuzE1yOpLwjXPmFQ01enmrDtWrZvFEzpU=;
        b=jAOaLxhf5xHaILHMYrndKw3LDZcmjDTc/yiz8Gyc/wm+Wdeq5votWFaP0CFPgBxXSE
         rIh2AceTzI3w/14NVQ420FNaQjqqsEGZClyWmCw3ThrZY5FGIp4HVKEACYBpwguMf7FT
         TBvt4IiZOoIqlEbUGr894AQaxWvHy6iWyLVg6czWB1MZjq55NWRtnbTZXlX0Ay8ivVBi
         DOuhlJm4ftGVNdHCfNPtPHnAmFP8UC51Mf7eOcsIzbsa7x3VR0lQlFxmUP3/RppLu4Zw
         mCHl3DTnM4tGQpE4qhejWe8kSFkhV6UMF206/kA/M6d9hSQpOuaVNh7M24zc+S5k3WcE
         HwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787546; x=1782392346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMYW4I9dC9wuzE1yOpLwjXPmFQ01enmrDtWrZvFEzpU=;
        b=B685DgyI1O6dI59uFiDZ6eaJNnrGupRS130EbsnLMjMuOJKHtpMhP2Oy1G2UpybM4s
         LvBXY9gN2DQ8kVqrrwiEKuc/LpTvAO3vTwoJa6FWndvZ9SPn5QHCuQe3+5LqC1jqx+OS
         mMoUak13JH+cZRMeErhvbJmonlfNdIcB48n9ez6/WzAXL4aNx4sSV+Pz/e1jMyskdwhw
         qGL5zcd2mD6gtoOvQjiv7PrLpGZf0j6VbGYpKMNMeam/UHxqlz/VKuFufVnUCC9J2g1s
         dlpTNtgzIQ+q+u73WIh7oDTxQusfiHnKoHMBjFqFdlqoYinE8jBlND2jmE/K69hF3cHf
         zXSg==
X-Gm-Message-State: AOJu0YwN4IZZucFjTmUe/18gTk85Q1IZuck/uCFze0U2Y2JZBlH5TmoY
	qzJqbLtDKwPiCKxsJT34gFqL/UlcHgDJCZVOImgdvdm4pTyPI1dbP527KburBrKZhtlzrFAqh0w
	cRC01SYAHbm2x7D2Zjf8PsyQuiB66rS3FqUBmH+yoHj3+gzjlycRg9pv0ofcIVUzdonp1
X-Gm-Gg: AfdE7cmZ6ZKgvtj6UKImOpxY5A2Y6LtNmniHOFeFn2p9kr4apbvkFStvRu1Sn1Mqen0
	ZP1TBvtInqh3bKcFLRKHoIPsFJXGJfcMHOR+YOztfH5D1oRGd98IlsSzs7gpob9Tx0KWg6YEBTF
	k+SWN1AxExf4glLUpIJvFlHFH44QbOnsiplpyVsBnIRQGItNvWhJAZbVYTBf3aZ0amtAWcvPcno
	hMiXcEv5HgpvHB+OekfhpNLwT7CA9RLxyjXigtGLnU3Vv7x14IWPH7oisFiUjPWPvhrnNVD3d2H
	yluX3ro63wYAKI8LWrER5Po6NywXJPTLFnySGrNcx0RRMAOTluNeIY17RvZ5EAOi194jocGxmc0
	bn0kjuhsKCGtOSXyT9o9vwxYFObndM+g+u00=
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr777218585a.7.1781787546050;
        Thu, 18 Jun 2026 05:59:06 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr777214485a.7.1781787545637;
        Thu, 18 Jun 2026 05:59:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c01d667f63asm676768266b.19.2026.06.18.05.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:59:04 -0700 (PDT)
Message-ID: <06999033-1c2f-4203-bdcc-d8e94ed281b7@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:59:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-3-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-3-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33eb9a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=kiQjUq8FSzjVjtPiR3oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfXymf6iTEGGob9
 9YHpWCgUuMUK4DxPc3T8+9HcF8OQbMxOBRc7JgGRxStBQOwcqM/Q+j/tjPOsQPgbzgSowf+XNID
 TlrQBNoBQqxQSrdVeD0Pr65j6H8h3vQ=
X-Proofpoint-GUID: YO-tja1sjSbXMBIRoDUT2XrrSPmw-oSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX+3gy/M4CGwFV
 DsUEao4HmpVqGhZNYa+tMhfunoqPyi+PX5ssLlRML6PIWcHUObbRtftr5UT/cUBL/0qsFlWP/3e
 RHTlNui+PklZWTBSmB6SIwMSFWHgTWvKXZG28dJUbQlK8N0Qk+yqHgwsAspSwzJt3lw/B/WsL0h
 PPv+0T/c882+J8UEi2hxC7wvgF9C/S1k4G0CgOjCl8B0vHoq1uiQ1It/oWCuB/bEuq2XYKab/c/
 mICRV9z9Ds2/hWL11T5nbvor/gSZqmI87io3j0N5WDweWSKlo50T2bKECQZYhfsWXQLpKc9+DL7
 DwFK5HTvF/B6bz+HpyCQXRAHsP5Uky/bcrczu8N/3WWlHkwnTclHCQqz18aZ+IXLilGlvsrrG2N
 zu2WiXoEl4epItNz083Jr+RfU9gKJ7roTVehb0ltD9rpB/4euN8bdiltLPUM5oi1M12Va/dMcot
 OkVZrZTms3zE6JBcoFg==
X-Proofpoint-ORIG-GUID: YO-tja1sjSbXMBIRoDUT2XrrSPmw-oSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113772-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C3506A04E7

On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
> 
> To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> to align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.
> 
> For platforms where ICE is represented as a separate device,
> use the OPP framework to vote for TURBO mode, maintaining
> proper voltage and power domain constraints.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 0882ce74e0c9bdddd98341a67b97bcef74078e0c..b655bcb5b90c0677bbe3dc6140de488038fe5ee8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1901,6 +1901,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>  #ifdef CONFIG_MMC_CRYPTO
>  
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
> +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
> +				   bool round_ceil); /* forward decl */

Can the definition simply be moved upwards?

Konrad

