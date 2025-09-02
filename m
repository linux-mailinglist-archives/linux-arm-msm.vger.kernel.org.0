Return-Path: <linux-arm-msm+bounces-71697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C22B4110E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 01:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 752D81B26B62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 23:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34F95C96;
	Tue,  2 Sep 2025 23:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzJhC7Sd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C452EAB71
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 23:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756857442; cv=none; b=a8xpR4c7t2TjGkpO6Vm6Qa5sl6vDbhOaGVc8VcCpHaBA6Jvlucgb91FqC+hpkHbT6EbTG+GVQubBDC//UnZu9MdszVZWa8hA4+k5s+KGtM+GdLdVG5B4SHCb013s+jyGXyZJI0QzIWEP1tPoGVFOran6RfKSNXt9GJL51W1D3lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756857442; c=relaxed/simple;
	bh=gETSOdxDaneanGSTTziHgj/jVUZ4c5aCkbSgMS7rH5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DF7gT2WuwhiruwyWk8uMRDBEyLRzLj4RyADhHh+acNGoKhFnhygpUcCkycj9DK066Pj5jUcMMiRfWsd5o8xpeW8x1GAUveRP+8f4hNMpkTIukG9JmrA9xoPk67uRYkXUd6/CgYaMcdA8+DOIueJ9i5tqvg/KbZyCDO+G3uqyNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzJhC7Sd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqDqv012685
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 23:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FJahCfpQzpwcoT/wvUIgWgO9
	zWdNgWGPkcaTdp3j1Jg=; b=QzJhC7SdG96bGXTxfltmk479dNYus7iAX66MfKce
	4FLK1DhyJ5SIQfmZdrkBYAxhICTmMU+2xhp3RVRY10o3kL1nFE3y7o/iBI+HgfMi
	UBhWtWeUgKGJ3rzhRCWvp2liXj585YOzTarprwKQ1bYpPPbRYXU/mQ2mrzGecGeC
	/3SvN1spdOVglM7MGfMEc9U5P14Nhwc85ZIDLRnSLLaR4b6oHQs9pQdRILY4WVF6
	ms0xICbVjbVZsuT0EgRCoCPG5fCXZQy3utodYNYaJxiCyv2QiThrm17TOZRzbO4+
	KaSqVS2NTJnAltiMPTTAxvpf3GWfTJb0xS/iyXaVzT0OyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk91cwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 23:57:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b340f94860so35875611cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756857439; x=1757462239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJahCfpQzpwcoT/wvUIgWgO9zWdNgWGPkcaTdp3j1Jg=;
        b=h7EKt5TDdEkwmjrkKCDXNYOtuddYaCTX17d7XMw03hsahgsMjDb/HVG96kdzL5p5xo
         m8H4QFWTKh94TZlWR1dtKYD4QKgrSdCp68OLa3cYNO/Wc+6Sx6PyXTxRRFr4bpB1Ckzr
         sxrdS4F5ie2V0A+S/BNP6PH94Q6IyhMKowZoItbloovxJJ7X48pzllpX5SVe34e6omfe
         cilqZn4Ehr7821MXQZL4BjKANL9QihJBC6McksPAB8GUyeYLIRvZqs0JbbAr244vGGdN
         a47GPyWLDrhnempQKqaKK2Rem8/Ca8SqTAurpevLPrFVAQt1OWYP/zRreN+F4Gx3Jauw
         +ImA==
X-Forwarded-Encrypted: i=1; AJvYcCX7V9PUNVdWnKIRKYTYHG056OWx5ZqOlcMBCV8lg8uRV8p1MLOFVYMdLZ7PVhihMFjwKVurPWR6zvaSJxMN@vger.kernel.org
X-Gm-Message-State: AOJu0YwinW4BH4T8RWDjTMvgujv9vHiQ+wW991StyVLeD9ltgur7au13
	qwOIvYFXSdPbH1VD9XHDvtvUfNTtl+hwyy74LbG/Vw9s9a+xQOIZCofQa5+fxGfq1nQ7kJ/B/Am
	5sH3As/Ibf7ovnNlWWiSVMDzTEx9Zk5xn9Ez7vkihr50V2Rk6K65jY8TV2K2VNN4UobIu
X-Gm-Gg: ASbGncsWwXzCsj1tf5CH1ctOsCM8YnSrCzgwotq+U3fcw6S550VNThgcRQNujryjXmy
	VCUddtfmDZH6ixwy3s+IA7tPVGVS/FPfjEpGwVQx4+FhvEMWB7p6SdOFmdWfSdLdlwF/J1i/RJc
	uQswrpFzOARQT8pSyWzzrACBWYG+dSIfhzdmFQDRSrhf+LLrOErG9G+BF+KcDno8xX++C67OjTy
	2YsEMfmZW2OwaihKqn7eFhocDfcTtytlGf1Tv+q1kRNekuSCqEkssoyVfGiYTrWm6+3AD/l8F/M
	0MHL51qNqaJ2NcU6hJuX3THOGs4vI88qFOQZtcv3Mj913NtqJvFc03cNDFO/wfCherHELBBWzi6
	d4HtPuxp81rSQMUTEKCqYFsIdKQO8Beab9jGihWIzVeBFAM4V44i6
X-Received: by 2002:ac8:5aca:0:b0:4b3:4f82:2b2a with SMTP id d75a77b69052e-4b34f822fa7mr38111851cf.4.1756857438830;
        Tue, 02 Sep 2025 16:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOaiCCaWtZm9xStda9EaWMEdWmAvouU1sGlNqhUDoH/fH6WNsH3tfraC7AYXeHUAkWxsau0Q==
X-Received: by 2002:ac8:5aca:0:b0:4b3:4f82:2b2a with SMTP id d75a77b69052e-4b34f822fa7mr38111511cf.4.1756857438254;
        Tue, 02 Sep 2025 16:57:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad121acsm113221e87.118.2025.09.02.16.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 16:57:17 -0700 (PDT)
Date: Wed, 3 Sep 2025 02:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_glink: Add support for SOCCP remoteproc
 channels
Message-ID: <ds6sirdrarxropjbf4h32lv3gjmmq6rprhzg2unijmsiozetzt@uukv6wckb7ko>
References: <20250902214544.543038-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902214544.543038-1-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-GUID: gYJzTC13kE0w257UT7HDmeUCmrYpMmpM
X-Proofpoint-ORIG-GUID: gYJzTC13kE0w257UT7HDmeUCmrYpMmpM
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b78460 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eD0BHP9R7wE6S2m1gD8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX3FIUT7yenUW9
 r4BBzeJK4bGFE5cmG+FZ+ZzyJizsaHXdEQDEd4zG627VxXaRgWCTQVjjL4yw/OQ8oiId4ZU15hh
 0WGwzK6wUwNSDSp2RU6PewYkRiLXj4DIxwc0RixBe4uUDcU7gh9FK01KtLhe7gGCVAbN9y9cwij
 ysdT/wQikx30kuq0AEufDKclK7a4T9VIFZaASMSRXoWaf/vi5KhhiQS3QycPY1vGjnaXhsr6LAi
 uNJxIfkDuSo2uGedbHLTXVxGcDjI3j6j8vvNOVxXLwgmsseZOcmAbnNXSfLOGn+s87jMmIhaLIN
 KbWATGkRuFTW2D+b7iuUjB/tgLDB2jA2e59JeFzSVPY7PFMFMJiTxh1SajeH4kMtjqFQk+2dMb8
 CdLOmlID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Tue, Sep 02, 2025 at 02:45:44PM -0700, Anjelique Melendez wrote:
> Add support for charger FW running on SOCCP by adding the
> "PMIC_RTR_SOCCP_APPS" channel name to the rpmsg_match list and
> updating notify_clients logic.
> 
> SOCCP does not have multiple PDs and hence PDR is not supported. So, if
> the subsystem comes up/down, rpmsg driver would be probed or removed.
> Use that for notifiying clients of pmic_glink for PDR events.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index c0a4be5df926..bcd17fc05544 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -17,6 +17,11 @@
>  
>  #define PMIC_GLINK_SEND_TIMEOUT (5 * HZ)
>  
> +enum {
> +	PMIC_GLINK_PDR_UNAVAIL = 0,
> +	PMIC_GLINK_PDR_AVAIL,

No need for this, just use boolean instead.

> +};
> +
>  enum {
>  	PMIC_GLINK_CLIENT_BATT = 0,
>  	PMIC_GLINK_CLIENT_ALTMODE,
> @@ -39,6 +44,7 @@ struct pmic_glink {
>  	struct mutex state_lock;
>  	unsigned int client_state;
>  	unsigned int pdr_state;
> +	bool pdr_available;
>  
>  	/* serializing clients list updates */
>  	spinlock_t client_lock;
> @@ -203,17 +209,17 @@ static void pmic_glink_del_aux_device(struct pmic_glink *pg,
>  	auxiliary_device_uninit(aux);
>  }
>  
> -static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
> +static void pmic_glink_state_notify_clients(struct pmic_glink *pg, unsigned int state)
>  {
>  	struct pmic_glink_client *client;
>  	unsigned int new_state = pg->client_state;
>  	unsigned long flags;
>  
>  	if (pg->client_state != SERVREG_SERVICE_STATE_UP) {
> -		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
> +		if (state == SERVREG_SERVICE_STATE_UP && pg->ept)
>  			new_state = SERVREG_SERVICE_STATE_UP;
>  	} else {
> -		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
> +		if (state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
>  			new_state = SERVREG_SERVICE_STATE_DOWN;
>  	}
>  
> @@ -233,7 +239,7 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
>  	guard(mutex)(&pg->state_lock);
>  	pg->pdr_state = state;
>  
> -	pmic_glink_state_notify_clients(pg);
> +	pmic_glink_state_notify_clients(pg, state);
>  }
>  
>  static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
> @@ -246,10 +252,14 @@ static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
>  
>  	dev_set_drvdata(&rpdev->dev, pg);
> +	pg->pdr_available = rpdev->id.driver_data;
>  
>  	guard(mutex)(&pg->state_lock);
>  	pg->ept = rpdev->ept;
> -	pmic_glink_state_notify_clients(pg);
> +	if (pg->pdr_available)

I think it would be easier to do:

	if (!pg->pdr_available)
		pg->pdr_state = SERVREG_SERVICE_STATE_UP;

	pmic_glink_state_notify_clients(pg, pg->pdr_state);

> +		pmic_glink_state_notify_clients(pg, pg->pdr_state);
> +	else
> +		pmic_glink_state_notify_clients(pg, SERVREG_SERVICE_STATE_UP);
>  
>  	return 0;
>  }
> @@ -265,11 +275,15 @@ static void pmic_glink_rpmsg_remove(struct rpmsg_device *rpdev)
>  
>  	guard(mutex)(&pg->state_lock);
>  	pg->ept = NULL;
> -	pmic_glink_state_notify_clients(pg);
> +	if (pg->pdr_available)
> +		pmic_glink_state_notify_clients(pg, pg->pdr_state);
> +	else
> +		pmic_glink_state_notify_clients(pg, SERVREG_SERVICE_STATE_DOWN);

likewise

>  }
>  
>  static const struct rpmsg_device_id pmic_glink_rpmsg_id_match[] = {
> -	{ "PMIC_RTR_ADSP_APPS" },
> +	{.name = "PMIC_RTR_ADSP_APPS", .driver_data = PMIC_GLINK_PDR_AVAIL },
> +	{.name = "PMIC_RTR_SOCCP_APPS", .driver_data = PMIC_GLINK_PDR_UNAVAIL },
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

