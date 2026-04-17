Return-Path: <linux-arm-msm+bounces-103535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIvEBug14mm13QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:30:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522541BA6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 353CB3098E71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E3C3A2566;
	Fri, 17 Apr 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iidswQYE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQYtnBoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1739B498
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432593; cv=none; b=cDtI+c8gx67nSl1oALh186hwec2IoeervjRhRAIpDjbRJecfduuGrxnWc1sk0SA0qIyMdrOv7Xd9CZD6zpyzgAUroulPTx0IJt7yopMJp8iXbIEx0IxhSQeUNFD+uNuihAYapsiiZAlJ2hbgEycZ4p4uC6BvNU55ZtDtALola70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432593; c=relaxed/simple;
	bh=SDOJrrI3lTBAebziczGzMC8S5O6qT7RZbqRtoZr1W6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q872oGquOeilfQgzhQBqpL7bVkyEwN7UvVGZMuZzPU+8ID9V9fomQRsoztMfIHW4Bt+gF8vZLL6rX0ZqNlkpf41lNr7MqlGm+otxlYZi4rgHOltQuCylWKAjhfrGYx7/pJGcXfD9fQPyD3y96T5FvvjOEscnjwG44gclZySRCaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iidswQYE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQYtnBoF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HABJRE1323226
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1HeSxgq6qe6Gt1Ak2J5KtEc+UgWpolaht6umu9cGq9I=; b=iidswQYEQzjN85nH
	G2ti/igpUnv19vyXSn0ZYOPAvXEd4sksWg+Y/P5kXJS470Nbi/PdEdfLCFZzIoZS
	JzZM/r2NjRsgDGjo738SNRl1toTXwvK1bAekOC24GvQGfg0ehdWEPcc/hEoupjqB
	fnJroOKZwMclndwTw0vh1DJp+p9Xs6xm7Ym6e6VVfpRxxmqy/U2MmpgV/ZHFHJSA
	Vp67f19HWYjJPdBZzytZGBzCNPAkvBkzDDUSLJeA35TJDjp2te9f9sGBtDi21nge
	uccaAl5FJEs6uw38iiwE2uJpltwjBLCbRoihjOlmjONR+9awUgvdPH2bQzy2Imoh
	eJDcBA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy1whs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:29:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f2138a9e0so475617b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 06:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776432590; x=1777037390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1HeSxgq6qe6Gt1Ak2J5KtEc+UgWpolaht6umu9cGq9I=;
        b=DQYtnBoFUhEVJMbx4PRgvMyaCDUoO8it4C8EbMrdNzxJnsNacomRmRKC9F+wM2EQof
         txQ5jz5hjWMQnS+Cm9X5zYvon+ZxBOiZfQ9AYXJimVQ6enscV47sbIBbPy7GTi0q5vvx
         yA75LjprB82xnQhNNXEYjEklxDMbOaSU0v0B8SdNG0T7KsPOgI2IrPyUkZ+89gnXLwt3
         tKn3yaV76Thfcf4v302Zfr2QtuxgOYYyJp1SYZjY/sf9A4psx7G4UW0+gEs2034Wr51i
         Q6i5Vk8PIYhXRTze1m8Q/xlfKucIgRkndrGRyAg0fvrA6GHOaKtqGLDikojVJKPZQLw1
         I6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432590; x=1777037390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HeSxgq6qe6Gt1Ak2J5KtEc+UgWpolaht6umu9cGq9I=;
        b=KAtHIvfhnlg7ptIn01rcnCwA4/CfrI4l/y5rcnoCd4rED43wl9fFKPSLix0PVQgvKL
         NxvEhYA142lA3H1CvecPkE8u7SoZoqiokAR3gHneNsApraWD0/NPRaFhQUFYMgZeklnt
         cnT+H89AUD6RcBo5TJUjUIffzMuPbuhy5Va+ZaHzmDWiQY8P0dYzwwttfaDUS9zakHYR
         V13GD10MeLnlx/WUbjw2aqggSrdRR2gOWdtqqJ0okjuTh6BqWBzyQOi0Sjdj9q4ZhnM0
         ju7QS3ref+p6SgR1QIIKzpMES47pRUtWe3StnZbCe8lg+ndMeFTr6Xk0ilk2CM9FWvxZ
         Vb7w==
X-Gm-Message-State: AOJu0Yz6WBTXETQoVgxGcb9DpyZCHFx1O0QbgpFhfFo5MNGxk3d276FF
	VhouMJztX7bXLBYyqHa2NQS7i5B9wScB57eWDNRkFh54BQZTq3TwaMhwOv6zscjz3n86fCZTUmr
	ejsJ88vzZxiNYFnXynj8CNbMtCPeFV+UCN55ksZo/S4ZQDEHljBKg6lSllj66KbKjK+9O
X-Gm-Gg: AeBDiet0agJmfgj+/TVzwAEopY2WC89wrllLuG0rn4iur1eXCykbNcT74mIR+iKUvWs
	JEiEGD9g4bl4ZOfcZcNVGqCaBA5m2IaPhye4cB/cxUafn3JA2xKZeLOpD3vKsTcDHIapllOMJBA
	y+9qwPo4RWhuHzj2i9/pOC+/mHx/EAwuHUcc84cCHSOQS/b7Rd8zPmIzV/sCB56D2OgkZXyXWPn
	AEytKq3JxsgjurBm1OqM0I40LviHXRnnK0Lv34IexOaNtdyDtVdRM0nL+zvSYegyM5BJ0or32+6
	+ZPyiN0rbmLHYGUHY4918XFJa6pdkgR49ECRCuGtTPIHhsWORPnUAQz4UiGQNZDTh0C6mw2GeLN
	gEHd3fKDuzhKqQhK/8/rXqTIjlYVfOFQmOsf5HHabsnrAK/0PwbKG8D+fS1ZNVQ==
X-Received: by 2002:a05:6a00:a241:b0:822:6830:5900 with SMTP id d2e1a72fcca58-82f8c7eee25mr2726450b3a.6.1776432589982;
        Fri, 17 Apr 2026 06:29:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:a241:b0:822:6830:5900 with SMTP id d2e1a72fcca58-82f8c7eee25mr2726388b3a.6.1776432589265;
        Fri, 17 Apr 2026 06:29:49 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea0a97esm2695706b3a.27.2026.04.17.06.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:29:48 -0700 (PDT)
Message-ID: <a432b2c2-475e-4833-9225-801990cb2d34@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 18:59:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-3-ca1129798606@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-3-ca1129798606@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2NJosiCGb3CQbLginPRs5rGnmYP1ei3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEzNSBTYWx0ZWRfXyfxo+VSQwfV7
 B6dMWlHOxqojGhSAPgK4njfYfraC5DKFovl4KyyqO1dVw9BRY8BxkWyoFfnnBUJWjczu0pCi/z7
 f0G5Uz/UWi50LjZcExoKosGQPz2kSUBbMHfKUcggWgXfzoR6pWt8UVekO1lEaT/da4MdTS5Lowj
 3/Qu7m+2Hv49Fz5SM0pxGR+GzFAQSS6uqdCGjzOSw/2zzYaN+dv67lZHlB6hhgjafh1M2b5Ulnh
 BFUyjt7OplVyijKhNXhA3Oyc3Z95u/m1juJOQJPcBrtVjWYc6Hctgod29pC9mqggGchRm/KrJbr
 8k0qemF0FioEVCRzGo4lE8k0GtXKPMq1mSAxO4MS5enpNWWCNGx+8TQsi5oWZQZk4vzKr1HAuHF
 W/djgNBO/wUS/9lxYAzap4pWX2HuUzsEUNTyKPW3L75hFZySgdQpqKdg8tqCPE7vVoDtPZjdMjV
 YYqS/CCH8UwfI2BGSSA==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e235ce cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=i-sMpDq2_rzAXM5hadQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 2NJosiCGb3CQbLginPRs5rGnmYP1ei3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170135
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103535-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9522541BA6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
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
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

[...]

>  
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
> +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
> +				   bool round_ceil); /* forward decl */
>  
>  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  			      struct cqhci_host *cq_host)
> @@ -1964,6 +1966,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  	}
>  
>  	mmc->caps2 |= MMC_CAP2_CRYPTO;
> +
> +	err = sdhci_msm_ice_scale_clk(msm_host, INT_MAX, false);

The 2nd parameter is an unsigned long, do you really want to pass INT_MAX here? I would go with
UINT_MAX. But still, why go with such a high value? Do we not have an upper bound for the clk
frequency that we know we can't ever exceed for any target across OPP tables? If not, then maybe
UINT_MAX is best we can do here.

Regards,
Harshal

> +	if (err && err != -EOPNOTSUPP)
> +		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
> +
>  	return 0;
>  }
>  
> @@ -1989,6 +1996,16 @@ static int sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
>  	return 0;
>  }
>  
> +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
> +				   unsigned long target_freq,
> +				   bool round_ceil)
> +{
> +	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
> +		return qcom_ice_scale_clk(msm_host->ice, target_freq, round_ceil);
> +
> +	return 0;
> +}
> +

