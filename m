Return-Path: <linux-arm-msm+bounces-104592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA9LKWXI7mmvxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:22:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452946C132
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0ABBB3009B14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFEB2E7179;
	Mon, 27 Apr 2026 02:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmIraj8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zj0nEUAE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FEC3164D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777256533; cv=none; b=Vj4YMDLN8SMiKo+t6DsQNOVV6UqPvUv+zVDlkqyt5H8nuq+D1fdT7DYGmH+WivexjuUIbl0kdvtTXTuJgtUrsIkzx455YK8oeOurohUgvvmx2GQHp6dLTOuQYmfgIdHRElezwA6/g8g8MTos1gt4oVTfPtn5xYRXz9r9WMtWaqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777256533; c=relaxed/simple;
	bh=Q+w6fMma1fErjIUMAaBYj0nnykNx0gntSTiq0Q2G26M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbWjkmRvraYA2R5btmlJ/zBBRxTN3uiD/hrqJit4UQJ95jy2YojE9y1pYGH4Eh0rCAdPistRlcrYTlPJCwPZgBB79Oiv+HGLRBwfOZFzwJyhpg4+S/G4PQVSoz5lxju+hSJVPIeRUhDADerBUjOZ3d9Tz7JkRheuWV1ywXo/YWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmIraj8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zj0nEUAE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMmCak3613340
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SL2NDgyheXTHqioYe/fSzEBGHx9dd5c6z0ZvLxclK6g=; b=MmIraj8GAO1mpWPt
	kSBLYFlrum5V9BfXxCNRRvUKfDAZa1J/WJT+sfAjraa/DPpYBmjkqPcdcrE+qGam
	ELwMO35UiRDMTty43LXWtdp+xDGFQ4YGB7UDgD7nF5o3cGU7RZqCXFEvq2XevC8k
	HcMwOCclUBBq0D9eksqfqRcdQWylKANipaDpGebDpkMnZlGfSlaG0JdX8Mw6cBtQ
	aJTIGNwfW0kcFoWN0f56YiqVoCIVhySlZQtsgRfzyEVdDnSXn0J04gy+NJlpmhMs
	40rgLgBf7oT/1SzF/BhTYPIJEPUSWesR0YGc/jrw7hSd0ogH3h/WTMPafBZC3nKr
	fEdpFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdm08u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:22:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso23441650a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 19:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777256530; x=1777861330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL2NDgyheXTHqioYe/fSzEBGHx9dd5c6z0ZvLxclK6g=;
        b=Zj0nEUAEfoEB03fLWXppbGWR9SXA+FIvFIVviu9QMLI2iqp9ViS4XqRRnTAcCjsqhT
         eX8Q9HZ4yIoOFHx2/35gBSLdZBpFjE/bGWc1IXpbNsoAPMO7AzztOWfRjd9OSyG/c2G7
         CaoszdU+cfFE7oIfdCKxP8PC7owsPfG1Ul47vKts1CvLherFRVeatrLlKwTlREUDzJXS
         BwmDVdagY+qf9U6uJMN4D+qk4TH/tBkzIk+YOrvMocnxvkSw900oicFwBwncAJ8xIl3H
         BzB7h0dIMp4ezCMTW2HpvRuOSy82mHuQrzAHhFGxNOV2jldsnHMgzi5BF/ph+eCp91E0
         lewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777256530; x=1777861330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL2NDgyheXTHqioYe/fSzEBGHx9dd5c6z0ZvLxclK6g=;
        b=JeXP3g8oWi9aBXwvEMovY/Z2BiOwPCn+FD90c8/Jzpd03B+V8oQxgqR1YlfRatz/4e
         ud/3w2ThgQHp4AQ86auDhGbTnKYIpkgOLzzC7+MOm9kdYxPs2BZ28T2aVXPc976fsCHY
         6ACHuKPktLSi5BmkSSluSwURVunj3bakzhukZbRQxfCiwaSKZ4Hl3vVPRcyuRexu0BFt
         sibnzHm7W2XkfM5D9T2FtXYii5X0Rl+23t+FSC5v5MgA9MBc5oZZU24eELMZE4Yi+Ekz
         CY9rJOG0Q5YQaGaMS0PkqGOPLjzd0VS5G9WxI/qZz8r7jA+1NsgEfs+XCehL5LVDjREJ
         H9YQ==
X-Forwarded-Encrypted: i=1; AFNElJ/biDpKiiHG+cGvwGYwF6dwCtf4xKKQytozpslzgyDvzS40NLbwzbMO3ekezDv24y6dAz3vc5ppAjz7cCqc@vger.kernel.org
X-Gm-Message-State: AOJu0YxcpubyuEyJqcUJzZmym9MDxHRZON1b5ddoo2jHjusbURy4JTyQ
	YvEyIsymGCYrJqCaxKBlHd3uSPgmu+ISJlDGVXRfxTKYRaR5MfgbiMticdg+9Uqv1gIEjKfYZPS
	C6NTSuigF7uIgHblzDhPCSr17Kz5iV1VCFX+6LgEZquCgM3GJ1XtXKPWJCKc0NO16gyZx
X-Gm-Gg: AeBDiesI6gV60nqexBlGe9vokaRKSel0kuNpjTo9AO9izvhINvCal5C6dmsMKhoUBse
	o8OCXzPfAeQsui0MBaylCHDf+1E4Xx4azKLWEiYxsohis6q8n5y/CqXrHZfjGMyXsQrAMO1LFlq
	NksBgAkbyt1MW2j/nkXlFqBtk/Wo6IvmV3FhYNrNTX8YkjOca1qPCwDkBp128nNTFjWfjW1DPcK
	WYxxaQEzcXCo++om071gNOXOBbiYf1DfQB+C/m5ISQUvxjPzWMZ2sTLpj0aQlal595bELVZfpdB
	WKKRrqv3yHuDZCzbOcDuIZ3vvsSL2BEihIlzy+tWgxlnXgt/ZfBwHAfumH69owLFdKXrHcXEXyt
	B5jmjT3hmifO/94+gOurlEwcdCN+jx1cj0txZgP2Wvtl7S0EazM7xrrxIvRQpS4aRclSZ0TumZC
	CbLxDohRcvMce806pUUo2r
X-Received: by 2002:a17:90b:1807:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-361403f2bd5mr44522081a91.11.1777256530281;
        Sun, 26 Apr 2026 19:22:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1807:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-361403f2bd5mr44522048a91.11.1777256529729;
        Sun, 26 Apr 2026 19:22:09 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7cb5sm30265606a91.9.2026.04.26.19.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 19:22:09 -0700 (PDT)
Message-ID: <11376a1b-923d-4bee-bdc6-fecea43a256d@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 10:22:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] coresight: cti: encode trigger register index in
 register offsets
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAyMyBTYWx0ZWRfX4ZaI6RjILIyH
 r11BM5qOU1KQshpO+4aDngtFo7YooJI1i1daf1Pg8Iu59XcR2J6etPqRJ+aa4hyihuT4yq+iLd5
 S8gOiW65M9Qyvq3OrUbgABxmnc1qPbKofvL5vFJXUjrG5LAf0e3H92XHe3lJKv53TV2HMyaDB4o
 xnLBC3do1WL+0ss9uSB2qHbJvwhiWXda7Yx5Om5ggvNqvIfsnjtCYGSxxGy8jM65gbUcXoD3z0M
 DZEFMdhK8rEpMsZgRIC8HXCPOeK8zItF/or5GrJBoODjcSto+WJPnL/hGT/1Efy4sk1xlbzKLmj
 zUqNxtYEDg/0Z+V8H1ZsyZTEGxliS2Vr+LIK8TVaLGTIIb49ev8QhimpjgwP/jx05bCmZgTTpaR
 zOzcZjrSc6eN5ikAj85dvqwQQlPdk0P1VLRv1nbaBjq48p2PzSDX+w7Z8Fo74NpWDSToOdDE+QP
 mxrSYDNqkwmLqJkfz/Q==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69eec853 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rOvziGV0-G4P2_swbT4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: VmdnCS0EJAZH7Kd3p6of8YZeYMm3LC9v
X-Proofpoint-GUID: VmdnCS0EJAZH7Kd3p6of8YZeYMm3LC9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270023
X-Rspamd-Queue-Id: 0452946C132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104592-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/26/2026 5:44 PM, Yingchao Deng wrote:
> Introduce a small encoding to carry the register index together with the
> base offset in a single u32, and use a common helper to compute the final
> MMIO address. This refactors register access to be based on the encoded
> (reg, nr) pair, reducing duplicated arithmetic and making it easier to
> support variants that bank or relocate trigger-indexed registers.
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-core.c  | 31 +++++++++++++++--------
>   drivers/hwtracing/coresight/coresight-cti-sysfs.c |  4 +--
>   drivers/hwtracing/coresight/coresight-cti.h       | 16 ++++++++++--
>   3 files changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 4e7d12bd2d3e..c4cbeb64365b 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -42,6 +42,14 @@ static DEFINE_MUTEX(ect_mutex);
>   #define csdev_to_cti_drvdata(csdev)	\
>   	dev_get_drvdata(csdev->dev.parent)
>   
> +static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)

u32 reg would be better.

> +{
> +	u32 offset = CTI_REG_CLR_NR(reg);

No functional error but a little bit tricky here.

CTI_REG_CLR_NR(reg) will produce a offset for the bits[0:23], but in the 
comment, you mentioned the base register offset ranges from [0:11].

With my understanding, all CTI register offsets fall within the range b 
0 to 0XFAC, that's why we have bits[0:11]?

Thanks,
Jie

> +	u32 nr = CTI_REG_GET_NR(reg);
> +
> +	return drvdata->base + offset + sizeof(u32) * nr;
> +}
> +
>   /* write set of regs to hardware - call with spinlock claimed */
>   void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>   {
> @@ -55,16 +63,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>   
>   	/* write the CTI trigger registers */
>   	for (i = 0; i < config->nr_trig_max; i++) {
> -		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
> +		writel_relaxed(config->ctiinen[i],
> +			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIINEN, i)));
>   		writel_relaxed(config->ctiouten[i],
> -			       drvdata->base + CTIOUTEN(i));
> +			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIOUTEN, i)));
>   	}
>   
>   	/* other regs */
> -	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
> +	writel_relaxed(config->ctigate, cti_reg_addr(drvdata, CTIGATE));
>   	if (config->asicctl_impl)
> -		writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
> -	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
> +		writel_relaxed(config->asicctl, cti_reg_addr(drvdata, ASICCTL));
> +	writel_relaxed(config->ctiappset, cti_reg_addr(drvdata, CTIAPPSET));
>   
>   	/* re-enable CTI */
>   	writel_relaxed(1, drvdata->base + CTICONTROL);
> @@ -127,7 +136,7 @@ u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
>   	int val;
>   
>   	CS_UNLOCK(drvdata->base);
> -	val = readl_relaxed(drvdata->base + offset);
> +	val = readl_relaxed(cti_reg_addr(drvdata, offset));
>   	CS_LOCK(drvdata->base);
>   
>   	return val;
> @@ -136,7 +145,7 @@ u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
>   void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
>   {
>   	CS_UNLOCK(drvdata->base);
> -	writel_relaxed(value, drvdata->base + offset);
> +	writel_relaxed(value, cti_reg_addr(drvdata, offset));
>   	CS_LOCK(drvdata->base);
>   }
>   
> @@ -344,8 +353,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   
>   	/* update the local register values */
>   	chan_bitmask = BIT(channel_idx);
> -	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
> -		      CTIOUTEN(trigger_idx));
> +	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN : CTIOUTEN);
>   
>   	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
>   
> @@ -365,8 +373,9 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   
>   	/* write through if enabled */
>   	if (cti_is_active(config))
> -		cti_write_single_reg(drvdata, reg_offset, reg_value);
> -
> +		cti_write_single_reg(drvdata,
> +				     CTI_REG_SET_NR(reg_offset, trigger_idx),
> +				     reg_value);
>   	return 0;
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 2bbfa405cb6b..8b70e7e38ea3 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -386,7 +386,7 @@ static ssize_t inen_store(struct device *dev,
>   
>   	/* write through if enabled */
>   	if (cti_is_active(config))
> -		cti_write_single_reg(drvdata, CTIINEN(index), val);
> +		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIINEN, index), val);
>   
>   	return size;
>   }
> @@ -427,7 +427,7 @@ static ssize_t outen_store(struct device *dev,
>   
>   	/* write through if enabled */
>   	if (cti_is_active(config))
> -		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
> +		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIOUTEN, index), val);
>   
>   	return size;
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index ef079fc18b72..dd1ba44518c4 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -7,6 +7,7 @@
>   #ifndef _CORESIGHT_CORESIGHT_CTI_H
>   #define _CORESIGHT_CORESIGHT_CTI_H
>   
> +#include <linux/bitfield.h>
>   #include <linux/coresight.h>
>   #include <linux/device.h>
>   #include <linux/list.h>
> @@ -30,8 +31,8 @@ struct fwnode_handle;
>   #define CTIAPPSET		0x014
>   #define CTIAPPCLEAR		0x018
>   #define CTIAPPPULSE		0x01C
> -#define CTIINEN(n)		(0x020 + (4 * n))
> -#define CTIOUTEN(n)		(0x0A0 + (4 * n))
> +#define CTIINEN			0x020
> +#define CTIOUTEN		0x0A0
>   #define CTITRIGINSTATUS		0x130
>   #define CTITRIGOUTSTATUS	0x134
>   #define CTICHINSTATUS		0x138
> @@ -59,6 +60,17 @@ struct fwnode_handle;
>    */
>   #define CTIINOUTEN_MAX		32
>   
> +/*
> + * Encode CTI register offset and register index in one u32:
> + *   - bits[0:11]  : base register offset (0x000 to 0xFFF)
> + *   - bits[24:31] : register index (nr)
> + */
> +#define CTI_REG_NR_MASK			GENMASK(31, 24)
> +#define CTI_REG_GET_NR(reg)		FIELD_GET(CTI_REG_NR_MASK, (reg))
> +#define CTI_REG_SET_NR_CONST(reg, nr)	((reg) | FIELD_PREP_CONST(CTI_REG_NR_MASK, (nr)))
> +#define CTI_REG_SET_NR(reg, nr)		((reg) | FIELD_PREP(CTI_REG_NR_MASK, (nr)))
> +#define CTI_REG_CLR_NR(reg)		((reg) & (~CTI_REG_NR_MASK))
> +
>   /**
>    * Group of related trigger signals
>    *
> 


