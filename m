Return-Path: <linux-arm-msm+bounces-63186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFD1AEF50A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1CE93AB5F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC83F26D4CA;
	Tue,  1 Jul 2025 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYeUU3Tx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF38534CF5
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365669; cv=none; b=Fbf/18FOMDdpUbx5MUHaSAbwUqFF7RQRrE3LgjZq2pTbtPUSf1k7gSi+gt+YISJgwJWFlweWOYlMo/0A/oZ0ETdXDMiKYpQwdFNlmrhJ8Uv3fjxnD2uvDL/RRX40A0N1EJPkB/KwVQmEWo+Tn7ofVt3z2jSy7gNKYfywUjd9uu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365669; c=relaxed/simple;
	bh=mSqqIKR39IZUVf0Dath6YHPY0fqv6iQc87YDsgoCUOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8ZpiJj0PVwyWf7eBHwd7paAfpaT14FQ7DFJP2XJVwlnmWVYWVecDptIlC39wVKuNqM7OKqFEgcHSDIhTvC2O5cE+KaA6FJzZj3Qu1KcFKGACFK8qShX2Dd/T79Z6rf3xxqKgD+HK//Xz+F8rmhepYF3nQWmG9suROj5AjCb6VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYeUU3Tx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619TsfV008243
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 10:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YeUJ3xa7GjwoafFi/aMcA7ba
	8m0/8IBjRzKVhVgXe98=; b=CYeUU3TxznOMb9/j0k9Pkdw/pgbShnRQ4gs8hKbZ
	XrYdN1fa0rgulwvBuV4raTQQW7HwY2OTNCkeCP39I1tPHh5pIDdKDHq4veXcSPlI
	JDbdxG+Jt52bGM24fOhRr7SYruB7u3Q5y7lk4oqbYoMMWzFzf4j+6N1KSzZiSeC/
	grmifaD44y4i4pSiocNeijgNuv8blxuUo0/RH6DTjQIv2NfGT0CslagzK16AQyap
	RE3QqGT6HsI1DW2eU/jiQ1e9YLj/HNfLFl1jglrH+pTBAdre/etc8OLTulz8ohAa
	+00kWjDfosUVk7d2kBfMU3DpV1xF/CfF4T4RzbnmOBxsqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmw49b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 10:27:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3cbf784acso1325547285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 03:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365666; x=1751970466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeUJ3xa7GjwoafFi/aMcA7ba8m0/8IBjRzKVhVgXe98=;
        b=Z2y6wyTQEJKRODnqq/8pjPVsNgvjVg4g/4La4XNoFQDZ70flZpa7kEiSfBC0eFLVhS
         /v7XGHQOeEBUurjogZdPrHtv68bhiVMq3iSRRce7VFrF7yo3FGVj/kLbkVmSpxmZksPZ
         PTKNJBXnuQ67xcXfEMr2U4E0w9sX+IYkhw9L/ohdj0ApcrEqep4XoHPgUxckaYR52qTm
         HGjKtZ802GYA/UJ1jyOgPVHlGCqAo/qVFsakPWLlbT4qQXs/IsOf4xSdk2kTRFvQM+9q
         Wqe2v2ZRUwb2IvqMtBk8jplP/9ObcPwNnVdnGOhR1ANgU9ywv/gCb145SIUw6Xdte2Ma
         9cmw==
X-Forwarded-Encrypted: i=1; AJvYcCXi2COZ3DZKkixavGq2682O9ekSj8xVTSxrG/s9lnJZEmeAOJ+Dzs5zahGRkL6YnYOAfwQMeizUaMOEeC/Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzucLs3yF1awI74WHqQrabELgMUTkGKVsTCo63j6q6u/2UJGsqi
	ktNilHchq8/2LV2L7vJ1KW98p48cBnBKqe+4RTMT1Kwr/01zeLtrTSgpKDlAo4BSR1PifKqZQBf
	KvpQph0yzWsNzu9MCe0orTRpl1u5GB++waDoBrzRmFki/BN4tgDYGzc1VZNwdpQnsixKZ
X-Gm-Gg: ASbGncsp2mA15Ic66tXJ76ICfx96nbvkzfVboZCQSH2qGeNjXn73fIsDxmg8jl6TLmt
	HiPmMaCBmbBlGnscdNpn+FYpvlJQkJKJxveekhbC7afuTw4yeWcj4NqCPxDffs0CewWF8JefLvr
	gXDUIKXb7RYyFjhgrEXro9D+hvY8LT5/F1cyImy31xow6y135lxYcjy092ZIxehzFkkwKQcNJRV
	2DqTwEcsbJVlUYrBTlOE5JFd5pOb8hLtIZtTof5jjA1iD98vngktbfWRKQjWLzMw5Vi3/zBNU7I
	f0aG/r9Gsn6uauIFqRLN5w9IpBcanlvXLtq14nt9fJPTqAQO4wcj/Dy3X3EqZaKp9JxZrVhVXKQ
	cZ1UR0Zg6VEr3AhReV8avR1XUhaoZdM/q91s=
X-Received: by 2002:a05:620a:25cf:b0:7c5:9fd3:a90b with SMTP id af79cd13be357-7d4439a6782mr2794585985a.47.1751365665719;
        Tue, 01 Jul 2025 03:27:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+oCZZjLmSDOoCjvzvargEla3NI168MM5pcpbkDG2dcodzKQIT5n55eeaWDSwOx5TuBio7Aw==
X-Received: by 2002:a05:620a:25cf:b0:7c5:9fd3:a90b with SMTP id af79cd13be357-7d4439a6782mr2794581085a.47.1751365665229;
        Tue, 01 Jul 2025 03:27:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5561f56b8dasm324973e87.164.2025.07.01.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:27:44 -0700 (PDT)
Date: Tue, 1 Jul 2025 13:27:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V3] mmc: sdhci-msm: Ensure SD card power isn't ON when
 card removed
Message-ID: <c7lpaij5f5monr7zfeqitncwnau22iollid2gs7okyorlegtmg@jlq65x7ipp25>
References: <20250701100659.3310386-1-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701100659.3310386-1-quic_sartgarg@quicinc.com>
X-Proofpoint-ORIG-GUID: PZbjL3C45XtgHeW3WrliG_Hx-OeABhky
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MyBTYWx0ZWRfX3+oJUVKjUBjh
 ogDJAS40eW/Kl/499kAPTPQzodl4yPQxPvu444S+VyVgG+F2iDfzeGCbh4vluAZVPe8fntnussd
 6TPm460TWm7zkgUaB2MCJCTuaXixrvelfMO3qTJuFSqsy1m79axJJyVmn7ZfGqS2ZLbaNWk4Wz/
 ga3MbXF56ca3/O03yhilxL/8FjM3jG77u0L+m5VENUZ3jXGFZbRXpr3BCpBrQ6KV9Ah5UpJuTsI
 +mphn4FQn36sSrACXUxylwAmid2I20gTio2tFRTjdC/e41+hFDEeEXr+yFH/hzRSKDWES/3yk4Z
 nBR7F1YA5U4ZJpGhwx84vKrkkJuNlLyXnm58wZg9vti3VPJIaziPOqRRHDt9epkTkHJge/n6PYO
 4GEm2lpVkZ2QUk+5nUvX5nAfx1FEQDkNohmGjHIIVmHE9yGkgaqrZUqoKoPsTmg16WMnYkWx
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6863b822 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=mSqIZBNSWgCFo2GgjH0A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PZbjL3C45XtgHeW3WrliG_Hx-OeABhky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010063

On Tue, Jul 01, 2025 at 03:36:59PM +0530, Sarthak Garg wrote:
> Many mobile phones feature multi-card tray designs, where the same
> tray is used for both SD and SIM cards. If the SD card is placed
> at the outermost location in the tray, the SIM card may come in
> contact with SD card power-supply while removing the tray, possibly
> resulting in SIM damage.
> 
> To prevent that, make sure the SD card is really inserted by reading
> the Card Detect pin state. If it's not, turn off the power in
> sdhci_msm_check_power_status() and also set the BUS_FAIL power state
> on the controller as part of pwr_irq handling for BUS_ON request.
> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Should this be handled by the MMC core instead?

> ---
>  Changes from v2:
>  As per Konrad Dybcio's comment :
>  - Updated commit text
>  - Removed READ_ONCE as mmc->ops will be present always
>  - Passed the parameter directly to msm_host_writel
>  As per Adrian Hunter's comment :
>  - Removed get_cd function as not much use now
> 
>  Changes from v1:
>  As per Adrian Hunter's comment :
>  - Removed unrelated changes
>  - Created a separate function get_cd for cleaner code
>  - Used READ_ONCE when getting mmc->ops to handle card removal cases
>  - Reordered if check conditions
> ---
>  drivers/mmc/host/sdhci-msm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index bf91cb96a0ea..f99fb3b096d6 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1579,6 +1579,7 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_host *mmc = host->mmc;
>  	bool done = false;
>  	u32 val = SWITCHABLE_SIGNALING_VOLTAGE;
>  	const struct sdhci_msm_offset *msm_offset =
> @@ -1636,6 +1637,12 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
>  				 "%s: pwr_irq for req: (%d) timed out\n",
>  				 mmc_hostname(host->mmc), req_type);
>  	}
> +
> +	if ((req_type & REQ_BUS_ON) && mmc->card && !mmc->ops->get_cd(mmc)) {
> +		sdhci_writeb(host, 0, SDHCI_POWER_CONTROL);
> +		host->pwr = 0;
> +	}
> +
>  	pr_debug("%s: %s: request %d done\n", mmc_hostname(host->mmc),
>  			__func__, req_type);
>  }
> @@ -1694,6 +1701,13 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  		udelay(10);
>  	}
>  
> +	if ((irq_status & CORE_PWRCTL_BUS_ON) && mmc->card &&
> +	    !mmc->ops->get_cd(mmc)) {
> +		msm_host_writel(msm_host, CORE_PWRCTL_BUS_FAIL, host,
> +				msm_offset->core_pwrctl_ctl);
> +		return;
> +	}
> +
>  	/* Handle BUS ON/OFF*/
>  	if (irq_status & CORE_PWRCTL_BUS_ON) {
>  		pwr_state = REQ_BUS_ON;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

