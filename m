Return-Path: <linux-arm-msm+bounces-80842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 604AEC431C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 18:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DACFA348E19
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 17:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383E42566E9;
	Sat,  8 Nov 2025 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EA51gMXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2mhsTcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A5A1A5B8B
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762622813; cv=none; b=usSe4O0lbu1UeYWlqKcS5nEPE0wqvyvefQSB6RDtSMUNs0tdG/r/Yc7MKPiKGkffG423a2m4RHlQRwUI0Q3Cs7Eir2v+pik4Grr1DSOQWkdn1w+Y5rccK66A5PNv++FxSZ96yUWNJom31WypUEY7IS/SMxNvjTwwVLXwVeEHGyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762622813; c=relaxed/simple;
	bh=Hvpw+pRntckNWq+r2W3D6IoCt2L6QAauNS44X9epUro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rt7fmH+nyZ9vv6gpg569o4uSb5rQdQhgpM/zXC7x4rQdEGatFHPQ7yX6DXLX0QF6/AaKZQRcFH35WF9TII1ld+aean9CYzh5kqT6DEbE7+4AQWQHqi7IsvZ+2fv/+mTsizB1bJ8uuHhuKtwwMXLv9Kljtx7qyYdTyg5QBCnmmGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EA51gMXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2mhsTcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A88PoIG1247209
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 17:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2umMsr4S5HW5lXJ3fQAZdAbM
	0Mw1K+JPW/3AzeFNEq0=; b=EA51gMXPovcwpq9qK8cYNwZLshlbBjwspo/7m3Ll
	uANgeVw/VlXUqn2ydVieNhIqD7MKH7kI1EHrIt8conl34UFFZtkZfWC8vmE46ekt
	uWz8HfcPwz4ys3sb/oRKIrtL4yi8IdAskRLQl/KI6pTQDHeByOrwfa5GIKK8rVQE
	tikjktwBN65v194ZI1r2oilp3Yi9TrLg9NQGa/hJJMpnsf6SnQ6L/TeB29H+TNSv
	Sdm0EEr3LoYPQkm1BoNqnWTGEmJnPwNygNtSpTzMOkIxiDbWC/l/a54ImqV6q1A1
	lHz8xKisS79LScPkMYf/DEitkDmcE6qURChTdHJhjTUUyA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y56rvtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 17:26:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed846ac283so49404101cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 09:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762622810; x=1763227610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2umMsr4S5HW5lXJ3fQAZdAbM0Mw1K+JPW/3AzeFNEq0=;
        b=a2mhsTcCzgbgm2fXlvCJmWNr6IQfSEXasvbfUcUgKUeSXyZOHLeioN7aY6w6Lwtpni
         srs4w17ujvyRC6jL0AmFqR4aLyKtmRk2mYsRJqzLV3fZnKN5XDwdeWgWy2qtDJNuYAw7
         AeXcFxlH7SP5lBeqjVMTLD+t4Ehb51agkPZ4CLSAGWeUqe/A0uBDG9BNILJFQpNv5485
         vc9+a1kEGlUF/TqH4oVygDgV9Px94ZTS7ZvXCCcR0Z9FfnXqcDbst0q1pjMqsBM4uIPR
         U4Xn3S0Yb7kqhH8lwk81mCTyVuFS3ulfj8vPJCposzqHhilp5j08c/c29gX35hxQyMDa
         RnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762622810; x=1763227610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2umMsr4S5HW5lXJ3fQAZdAbM0Mw1K+JPW/3AzeFNEq0=;
        b=A1FrWwCxMmTSMt069T6BTFyp+KBDGmWMXpu3+zcOMHJ20DFEU8OSpyQGfNMz9ZAY4J
         JkFxETTrrbMPCnGqQdPAyVXoBXm3md4eYUT2zrvAvkTIOSFuEIgbN1zuWCluF4nT/lyZ
         zQymM5/WJJtJXQ6m2q02QFaMCb6v1sLieo4rQdjOCZW4x9vAznU4bd7nmmvup5nwJFcW
         Q/CBIO/rM95bfLtRvMFvBWrXvhYz8+CJomEQGtaXrh1tT81CTkzBleLUt7rdB2MCkKRJ
         TeDXz6f3ChL8INfscVRmaQSg/LU8DbzpFehm/rUGX0R531cpUdA+ND21849qi1x+4IL8
         7aXA==
X-Forwarded-Encrypted: i=1; AJvYcCVgA+LvTKstHbJVgWAAzXVB5cVS5AWdvtl/tFwqUDahTo05CY4hNt92iH5SMVzzbM2Z3q+EWS1VBICLJXs0@vger.kernel.org
X-Gm-Message-State: AOJu0YydYCLX4rZ6uKfjHrpFApBJxJQ1nqWN7g5Xa7lXY6hhT1aBxgcw
	z8/IdHERkPGK4f3o3pjgxVG6edgHsC81aV7Yx0qlsUfeEMVO0ZggHvD3/0ztjfcDg4mkJTp9bs5
	8jI/rv3HBJQhP6GtsVcUF88r5wT+UMmignjHGWMcEBPoF9phHw9VljI4wsuSFFx5+k1Qe
X-Gm-Gg: ASbGnctj+uW5ZbfWwhmImqGAP0cwWmrLRth4Kdli/zoJmIIvXxCDLTWhPcng33HecSA
	HV2VSHA1OhdRM35qaEFznrCCzCzSqt4Q+3iIEhsFimRtpOiSx3aCKx7rQXhaPYTBEt6T75DH3M3
	FEAZDCnMxp3ZhyXA9KtHAubBzYBfCGQmt7v4Yq/AnpIxnJMyrxiob5ig4sMIF8UQlr2L5Lmua+q
	bN1ud6zThwdZd0NfaPwZBO9ZKts6HPS3NhoIBif01SZW8IcUS2YjkBz2AelD56Xg5/TnAYoimiT
	4+IVeJBH98nHtsnO9Qgf5OvO+XVIwM3gHcRoUctOpprtUnxQMHfgTUygusKZepny6UwBXVfli+S
	ZVfvA03X0PznWjEQvEWG2N71fil/B/RO9Zh3t5vw8l5NfRVuI1NwlwncmWwf0bqsiFOYX68uxyc
	6a+L2vbolUw6qh
X-Received: by 2002:a05:622a:198e:b0:4ec:f2e9:493e with SMTP id d75a77b69052e-4ed998115a0mr78969251cf.34.1762622809652;
        Sat, 08 Nov 2025 09:26:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwezJQcmvFQWoTFXSG44miuWH+tCs9KRjF2cifamxToL082Jokif4YFw4V81sX3jhDzcu6dw==
X-Received: by 2002:a05:622a:198e:b0:4ec:f2e9:493e with SMTP id d75a77b69052e-4ed998115a0mr78968951cf.34.1762622809169;
        Sat, 08 Nov 2025 09:26:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a024f09sm2345136e87.41.2025.11.08.09.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:26:48 -0800 (PST)
Date: Sat, 8 Nov 2025 19:26:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: hrishabh.rajput@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
X-Proofpoint-GUID: bVJRJzC2MCDP_cnpkwaD_L67FxOCjhDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE0MSBTYWx0ZWRfX98l5fhjT+Jdp
 MJn9uCduyqLbmWRRtETo8OPqag47FPF/3PMexvVUQ2pjUtI6TgXJOEONBqxhSa3XOQnEWpwg5Yk
 DWVnPVAfx23sRoAS9A3xTj9BJIy5WcHPCzXYv8xdSIjYdI19wpYuzOpYUAl0ZqdumqOZ+aEUPwb
 6RCWPxDaz5NAGkeHHIGBoJMbiXpSUEHuJZoQ/3TYA6RCSyHwZqandLbL5u+0eQ9+dh+SBl0jcYQ
 RI8h+QAHUhuuLPI83CxvF7Y3I2yU2amaynjOpNkQg7YxAwOAA2gRD8DsQfMh58uH40EbB+N+Dcf
 tpWG6XFHfs5Rocb5lQoyW4eRj9O+P+LUwtW5IJlQSOtBw/rTnnONvntujFkPaNXpeZCgUufOZbD
 Nj3UICbsySUApMABPttDFaJ/5RW4tg==
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=690f7d5a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YueeOpoQ0xcX2KNfXj8A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: bVJRJzC2MCDP_cnpkwaD_L67FxOCjhDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080141

On Fri, Nov 07, 2025 at 05:53:08PM +0000, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> To restrict Gunyah watchdog initialization to Qualcomm platforms running
> under the Gunyah Hypervisor, register the watchdog device in the QCOM
> SCM driver.
> 
> When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
> expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
> the devicetree. First, we make sure we're running under the Gunyah
> Hypervisor. Then we move to check if any of the above mentioned
> watchdog device nodes are present, if not then we proceed to register
> the SMC-based Gunyah watchdog device.
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 51 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index e777b7cb9b12..71b79c0229da 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2182,6 +2182,54 @@ int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
>  }
>  EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
>  
> +static void qcom_scm_gunyah_wdt_free(void *data)
> +{
> +	struct platform_device *gunyah_wdt_dev = data;
> +
> +	platform_device_unregister(gunyah_wdt_dev);
> +}
> +
> +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> +{
> +	struct platform_device *gunyah_wdt_dev;
> +	struct device_node *np;
> +	bool of_wdt_available;
> +	int i;
> +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,

static const?

> +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> +	static const char * const of_wdt_compatible[] = {
> +		"qcom,kpss-wdt",
> +		"arm,sbsa-gwdt",
> +	};
> +
> +	/* Bail out if we are not running under Gunyah */
> +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> +		return;

This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'

> +

-- 
With best wishes
Dmitry

