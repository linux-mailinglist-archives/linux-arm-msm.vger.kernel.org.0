Return-Path: <linux-arm-msm+bounces-112346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v+q+KnoiKWoARQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:38:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 989B2667432
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:38:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VqlLSJzm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cTzE0cub;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112346-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112346-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B74A13040769
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50F53AB496;
	Wed, 10 Jun 2026 08:23:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F7121CC58
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:23:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079831; cv=none; b=TjnPrvSVTCXKJ8V1d6WoqvWpqhZvZQXVygXJ3/iR2AfcEEQW1pDbNdFxDHXOtfuXdq5zqekLGza3KzFVWvBVN68PBz77mGvPuE7hPkntYAoA9/cqsEhtjfNwOzhWEMxxhmzKMgufzCii9MLhX99xXGelQ0y0T5NMzp+N3VOeJt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079831; c=relaxed/simple;
	bh=LkbvRb4Lxa3vbTQK4ekpMqZOPYOFQsKDqFtDgQKLURE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpJWPE8KZ9X5v7f+7LfyvrZH9dyrwWrJAeXTFKr60C+xK6NNDloFXuOMa3HXNvUZiIjtDVeVf7qdFYrDqtgtzwCKt2UfD5MvaYWoSwnNJPJ7l/lGktYvjkQGya7BJRkxQjPcils0wjwiQk8ZT7kqcyoqOwbP8iOY89GS4U/b5Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqlLSJzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTzE0cub; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iHZs988885
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYDOedvWLAS4SJUQqvQ16zubYkeixi+iRS6jV/d0I28=; b=VqlLSJzmzF154OeE
	/ENKpohDDVjlds1p8RGt1KYNdofHNz0k3ITjDIuHXfoADtRtk/BTFjpX52pi46t5
	4+0pZSXnYvDSmu/B+yBzS09TUaaITZMI5Cn8OUogt8O8b989qoS6hnoK8PXu07Wg
	RQD6Bk2fBnPFFsrWHB5k4MVwLGsonMcAxgirU5iR55JZKYx7EHa4+elIXQhhLTLM
	aCDZkJkUKoZGSrY9eHM9ra0ybCNEQR0p1lCGzANde4kYU9NXVwXjR+wAZBY35OtC
	0MWizSaNVj4c/5AyQc0hIGCujft+j0XvSw8siViBMpuM2/1gENKFTh9X1gp2EMT9
	aRjQgQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2segd96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:23:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ced08f46b0so135368526d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079829; x=1781684629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYDOedvWLAS4SJUQqvQ16zubYkeixi+iRS6jV/d0I28=;
        b=cTzE0cubNkaAwmeTYxMpEkQs8KU9Jd0dxXqiQ1xjnhJGA4d09RGWcKuZ0HsL2pMmEt
         qbCEqJozulR3zVnuBiXPy30J2TO0TqcURuLzqIjzix+geo8+eT6TzWowW+fKlgGZq4xB
         jKHhAQzo8OcaRYQtt6tQM53M7KXvcE9CvG/8nGQzXu9hZRVDpK9GdQxPmtzWTeUS49II
         km3XdUQeq+NON59/EQ2KeOFkkP/zXaMVsJMMzSUIK+JLX/MU2dq3IRmqLwe5he4+gpfM
         HwolHHxsdwH2UYM6SalY1R2iLl35Fr2fA2JyiA9bP26D8Q7XaXTdF5PZNCLKqub53PMm
         uhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079829; x=1781684629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYDOedvWLAS4SJUQqvQ16zubYkeixi+iRS6jV/d0I28=;
        b=RGK62Gj+JWeYqjXEuUelr8um9AoGm6Z7qDC1rJQN/U8tjElXkvnHHktYz08iBlwqMX
         63TJ9nwKuunrmq7b6ftN/VP43znP92ngrrDOzprlW5RmtRWTn7RdXajaIC4D7xHZF6Zz
         dG8Hm3o2yv1E/rP149mlInnBngEffc1kAG6LltTtYj0q0MNrGCfQvTXWLXDp9HEMrGnS
         nLQ5y5WhsY0RZnvOyC7pZdmQt3bhti1+U8bIP02N8Oo4E58elkgcpTkd/5dqLfAE4IGD
         DErv9MojIVYDNuRv2inTw324Q+Xll44IPQEqhhD/JSU2KQWA6EwqPyyamP1Z4emD7q5W
         vESg==
X-Forwarded-Encrypted: i=1; AFNElJ+ifPNC93odohTkpDR6Nq3ocNfQCuh4x3dGypbFwe3NALIA6XbSgCRfdvOwc0HNqreA5hZNNJO66tZA2W0g@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4i4yM+kU9KdbxX0dRQHSwCsxiVKHNoEaB1nNW7fX9rfT8lPL
	rlY2BRV1l8PR9M8qFQwiekr//iGN1W95p0orY/xSlU4qj2ntky1ixCGzbasLhntAsfHI9bb8PyK
	PRrXQHeZ3VtyXIO/h7fMUsxQxNo2e7e32/V/36SXQJfPYDhpUc/CqCaWi2QsIqliUqi5V
X-Gm-Gg: Acq92OEFIZpDnhBki2gayIF7w2kblbdTvvolCWx2qMvI7ed9DaEh1Xwcnfzad1Olnhz
	oahRlCDro/+sSBcf31hf6lrfQHTIgEbWIDy7rfd8jLPjc9LLYkmFxZVxRl6NzXFmM5nq6iyI29t
	ueFWQjpwjUBFFzF63sHsoPgKubs5uP9agzFXdiV/5kQEewktO8smo5C40FxejS52jCG+FpKeCf6
	jq5QGGNuxI3YVyDAy+Cov1AG/mEVHK6HoWph07Oa5QTpGWI/9oSgNeaoQIekjyo3nkEDeR+zWk5
	dYcTYwsfiFR9ApLF7wJS25532NaiIVnbyBh+6FEdp3kNu+pv1SloMhqpBkFiuW0Rf1xWCTqGMA2
	813vdseNliUSXqevANQ0/EV35IOZKEqm+efTA4SylZ9Re8n1h4RkVz/2aO45mttz3XaeiGe+h4Y
	oWbjvnMVI6UUpet0E3K08=
X-Received: by 2002:a05:620a:4407:b0:915:4217:bf0b with SMTP id af79cd13be357-915ad11ecdcmr2818559985a.19.1781079828936;
        Wed, 10 Jun 2026 01:23:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4407:b0:915:4217:bf0b with SMTP id af79cd13be357-915ad11ecdcmr2818557985a.19.1781079828545;
        Wed, 10 Jun 2026 01:23:48 -0700 (PDT)
Received: from [10.111.165.13] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a2465e7sm2407977585a.19.2026.06.10.01.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:23:47 -0700 (PDT)
Message-ID: <b4599747-7eaa-4ccb-8144-fabfa4c96593@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:23:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
        Cory Keitz <ckeitz@amazon.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-7-426c37e9008f@ixit.cz>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260605-qcom-cphy-v7-7-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1kUKw5CjVHRi7Ie0afxZUIe80sTkASUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX64g48zEZB1Az
 jU9wLPRMnYT3nZXATfjBiUNGYguNqJTvUx+DeEEcRX4HcdW5w3PrQklL465SX9Dmm7NbtSRADze
 BCDboUHkyKw4FySjWhg5QYQXACxseMwM68oISBLiZmAjhvJ+/q9dLSraPxndDerLp53QyhqK4V+
 r4YlC6z4D6NZNeqS5brH4BGDTlkZxUwuhuhOXz+mlVb/FjoQPdoK/QK8j3qhDOahek1SIaOgXnR
 P2REFveoiTt1M16zlNkqYp3dgr3stfiAVH7G/AIwrSxUKPzQBA+KJ/aY/PaJz3Fj29Th6DUackb
 636VMZMjlnUSBDsGumaOCqMT7UvtjukUprj7M7ZLjAQziNqcXByygKvn+w7M/iXKGFqWigKAI1p
 oQL/oZk8B/LuD4bONSZCx0ckuzCB+NDsEjHidcEF5nEkl2WoJ4eBb/Op5yzZ80H4N85d3Aw31vb
 d51hTIwccbWWpp97LxQ==
X-Proofpoint-ORIG-GUID: 1kUKw5CjVHRi7Ie0afxZUIe80sTkASUY
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a291f15 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=vggBfdFIAAAA:8 a=KKAkSRfTAAAA:8
 a=pCfSTlZN1A5Xfdvpc7kA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112346-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 989B2667432



On 6/5/2026 9:14 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Ensure that the link frequency divider correctly accounts for C-PHY
> operation. The divider differs between D-PHY and C-PHY, as described
> in the MIPI CSI-2 specification.
> 
> For more details, see:
> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Tested-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Link: https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c   |  7 +++++--
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++----
>   drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++++++---
>   drivers/media/platform/qcom/camss/camss.h        |  2 +-
>   4 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index bcc34ac9dd212..7415e811082da 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -534,25 +534,28 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
>   
>   /*
>    * csid_set_clock_rates - Calculate and set clock rates on CSID module
>    * @csiphy: CSID device
>    */
>   static int csid_set_clock_rates(struct csid_device *csid)
>   {
>   	struct device *dev = csid->camss->dev;
> +	struct csiphy_device *csiphy = &csid->camss->csiphy[csid->phy.csiphy_id];

The PHY indices are not necessarily contiguous on some platforms, such 
as Hamoa or Purwa.

For example, on Hamoa, we have csiphy0, csiphy1, csiphy2, and csiphy4. 
Using csiphy->id directly would lead to an array out-of-bounds access.

Thanks,
Wenmeng
> +	struct csiphy_lanes_cfg *lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>   	const struct csid_format_info *fmt;
> +
>   	s64 link_freq;
>   	int i, j;
>   	int ret;
>   


