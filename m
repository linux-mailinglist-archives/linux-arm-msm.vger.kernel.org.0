Return-Path: <linux-arm-msm+bounces-63764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE6CAF9957
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C64E1895776
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6682A19BBA;
	Fri,  4 Jul 2025 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2ABQTvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACEB145355
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751648054; cv=none; b=O4X+ku5MBTeojLqcb2RjH0u9jwVePghK1DjJ6DlS8thpcMJiHBKQxRu8oxV23JDL5t9AtBOnJ590QZW5uVIG37JP4JmN6FsYQ6nEs+a9hAdsvfH5u0eA9l8sNuerwyZRaACYRTCZ/7rMfdMq7+FlaNud+MCilP7QPUJIg6/42Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751648054; c=relaxed/simple;
	bh=zVcxeLHHb3UAiesd2aayBXbz3f9dTa2g1Dyjp2m3+vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBtSFWsd7eWxm8/aN5lljOEyUSuGL0WvkSqs6jPxH9kU0Ti+fone8chwSlwTCye0dwZOsURwAI5rCh6/Qqq6Xd4J7ECuhizkc9keOthNmuxGfaY/YASnSvb3SEUdJ2To5Lz2FUbRLe211rF0RVcvVhEi2qBzAfdDr6NF/GUum9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2ABQTvC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564BN5k4026748
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JCnWs7HpX0UFVtw8HQhAyWss
	jVoIzirlLKgIK0AskiY=; b=H2ABQTvCilF8UYtQFTV1UWquLuuD4LMWiKxrlY2C
	HoH5RuQcUTrCv5hgNgw1D6kzFLQRegDnVTfnySL2viCiM1neGq9tcnDEB5yehb2R
	aTLC2neS4Bflnw8oz3u3tvjTeEdqJRoR/9VwgXFLUMrX7aoNlCDnoMl4pmnpDCjs
	fFuJTjpXAKDSqii92WftnSLrYG1bxIllDjmnr6EJC3yUl9KpQHyQ3UhHM1dqc15i
	2irJRED1TARzPoHiBOC50Pg1ThKrtna4ap8OoqntSBabnCRrVAx2gBdGMq2VMsbb
	8DfBkfYYTtycACu3ph841p6Ers3GZ6wGMZE49ETyw7A/6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802c8wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:54:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso158110085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751648050; x=1752252850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCnWs7HpX0UFVtw8HQhAyWssjVoIzirlLKgIK0AskiY=;
        b=IeNcBHw+XBYLOWXrFjlfdCB8nQtIsEw1CUopVZKPpGXil4BjPuYVwgFHuSWxuNkiMF
         5ffSwsy+3gF2DKvAC+OhXNqeF+GxZ0j2Xp3+XyldUmg/+afsJvQwNRztEy2tmQSyaC9Q
         /uImdBQ31KPxZvfSS95QtY4mvBFhQ5vzLrCIKe22cIdbAqOPyeSWYPYEuibY5KUZ+3LB
         wLsAO7DMcUlI3bIHjIC/DrD6jZOP2J+m+UHIJ7g18deDtFW52GLXhXqDZPZmpPuLvVKm
         iKxpzXkHQwcwSqsGcaAuzSrJDQfERikMW6YTx3te4NCPNHq8zD8NXjUqtr95PeYQwY3i
         5pHA==
X-Forwarded-Encrypted: i=1; AJvYcCVaEm8ctp2941MFbI4mVzQE1XlwIsLEbEAjPBAzVBCSUsNNZKDvz/M3f8RoGHv7MApqzob/vMEJLJwF18CM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2CYYLUOK/gx54R50HbLUhnnUGANVHP0W/+fpw2jLdAao9ReKK
	S+LVMJkItG0w2+LF3aflvgrZYhaD9B2+lcX9Nxtamj/fFvNuGYYGhp4QLSmH79L3a4AFQ4xH8S5
	3zgXHz2K120DLx/8KWJ95VLxGJKTf+zooDU4v2O1gq9HUFeiMEVjehwOlsQYoN8VDvA3O
X-Gm-Gg: ASbGncuspklWjE60D2Jz9i85z+rZtzBmlQEn+0hglQo9iBie9Rpqv1XMNrYPLCInqKe
	iC6vEE6pYUptMxU47h6tjBgJ9rQLJQtNxSB5nLCtB/m9NpxjvCX5t6BD5YzYNzo8XsUysk70CUJ
	BffwgACIYYb0BY/eE1O2bnSAezzViw/mC4Vaf8nQnAhE3MHrxLRktTcVSXhMUe8vl/2UAOOTqam
	ToWH7mGkqa3L9z1WPfd2mUay+85ZZutXQsOl3pjgnwrhUxyqjUSW1rWnFVG/WGsqM8BwWTmTkt+
	Dn8bo6+85HaRBstJ+cfN620dvlXfqqV7d3j8Hg3fBi3hqGyirjw+//il2iFhFWw8Y9tHW8xf3X1
	PmSORhdSfmurhtzD6zxMUiHsx2GsPFo1EFqk=
X-Received: by 2002:a05:620a:290b:b0:7d5:d240:ba4d with SMTP id af79cd13be357-7d5ddb73047mr420029685a.22.1751648050293;
        Fri, 04 Jul 2025 09:54:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP1MExcsP+nrJr5948Cl2sm6PizF1yfXSgekgHKgKP0zFPbPt35XLwDLimR56wBkYRj7QhAQ==
X-Received: by 2002:a05:620a:290b:b0:7d5:d240:ba4d with SMTP id af79cd13be357-7d5ddb73047mr420026285a.22.1751648049845;
        Fri, 04 Jul 2025 09:54:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b60fcsm290213e87.191.2025.07.04.09.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:54:08 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:54:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Refactor domain ID to enforce
 strict mapping
Message-ID: <56gevv7ripovymgclebnjdkxpfg3ppoosjxphkwqplef3hpikv@u5jua6hgxa34>
References: <20250702025341.1473332-1-quic_lxu5@quicinc.com>
 <20250702025341.1473332-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702025341.1473332-4-quic_lxu5@quicinc.com>
X-Proofpoint-GUID: 2rJeHx4IvTayWatmkbm2H50iP5wzS4Hk
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68680733 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=uRHWFKxjRNLRQCLycSwA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2rJeHx4IvTayWatmkbm2H50iP5wzS4Hk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNyBTYWx0ZWRfXxeQ4efO6QpMQ
 aJrJ4Who+MH8aXXsHMJm1J5KkoTj3wwlvv+EYlNPdb8j2kW3b7wxEYG4px3LdSVSxPitHqVWn4V
 icgn5ge19DXGVP9sDwRdRQouRFR97QMLGDkwCLpngXIkJbOKI4cw5/ZeMmZNbR2c5pX4wOACLO1
 2NUx+Ax8oa/NGblzYw7YBv2kUovbINgef8VGvlBFPk+cg6HNxHWY+ynGLV+UwzvFkVxXBSfcb0j
 HrbLGpF3Q0hP5EA1pCyOwAZ9vDvGkIbuggPDhBEiKR7M2hqx9AaLh2hxv1awsJLfuhS+yAEPF5k
 /YOBXdJqQgAJipikPp2qenILkulRYZG0egHXP0Zr1xphci4t8fRRYqESYqedN+PYd+3LntcGaPL
 SpuJpWHBZf7qIkBKmBSPd3OsLhFAJJDDYNX192zs+uXViGxnOeqXEPaAq1AKtdReJPct94Xs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040127

On Wed, Jul 02, 2025 at 08:23:40AM +0530, Ling Xu wrote:
> Currently, domain ids are added for each instance, which is not scalable.
> Strict domain IDs for domain.

What does this mean?

> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 51 ++++++++++++++++---------------------
>  include/uapi/misc/fastrpc.h |  2 +-
>  2 files changed, 23 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..441f5851eb97 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -27,8 +27,7 @@
>  #define MDSP_DOMAIN_ID (1)
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
> -#define CDSP1_DOMAIN_ID (4)
> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> +#define FASTRPC_DOMAIN_MAX    CDSP_DOMAIN_ID

Unused

>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -106,8 +105,6 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> -static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> -						"sdsp", "cdsp", "cdsp1" };
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -1723,7 +1720,6 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	uint32_t attribute_id = cap->attribute_id;
>  	uint32_t *dsp_attributes;
>  	unsigned long flags;
> -	uint32_t domain = cap->domain;
>  	int err;
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -1741,7 +1737,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
>  	if (err == DSP_UNSUPPORTED_API) {
>  		dev_info(&cctx->rpdev->dev,
> -			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
> +			 "Warning: DSP capabilities not supported\n");
>  		kfree(dsp_attributes);
>  		return -EOPNOTSUPP;
>  	} else if (err) {
> @@ -1769,17 +1765,6 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  		return  -EFAULT;
>  
>  	cap.capability = 0;
> -	if (cap.domain >= FASTRPC_DEV_MAX) {
> -		dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
> -			cap.domain, err);
> -		return -ECHRNG;
> -	}
> -
> -	/* Fastrpc Capablities does not support modem domain */
> -	if (cap.domain == MDSP_DOMAIN_ID) {
> -		dev_err(&fl->cctx->rpdev->dev, "Error: modem not supported %d\n", err);
> -		return -ECHRNG;
> -	}
>  
>  	if (cap.attribute_id >= FASTRPC_MAX_DSP_ATTRIBUTES) {
>  		dev_err(&fl->cctx->rpdev->dev, "Error: invalid attribute: %d, err: %d\n",
> @@ -2255,6 +2240,20 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>  	return err;
>  }
>  
> +static int fastrpc_get_domain_id(const char *domain)
> +{
> +	if (!strncmp(domain, "adsp", 4))
> +		return ADSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "cdsp", 4))
> +		return CDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "mdsp", 4))
> +		return MDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "sdsp", 4))
> +		return SDSP_DOMAIN_ID;
> +
> +	return -EINVAL;
> +}
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2272,15 +2271,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return err;
>  	}
>  
> -	for (i = 0; i < FASTRPC_DEV_MAX; i++) {
> -		if (!strcmp(domains[i], domain)) {
> -			domain_id = i;
> -			break;
> -		}
> -	}
> +	domain_id = fastrpc_get_domain_id(domain);
>  
>  	if (domain_id < 0) {
> -		dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
> +		dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
>  		return -EINVAL;
>  	}
>  
> @@ -2330,21 +2324,20 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
> +		/* Unsigned PD offloading is only supported on CDSP */
>  		data->unsigned_support = false;
> -		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>  		if (err)
>  			goto err_free_data;
>  		break;
>  	case CDSP_DOMAIN_ID:
> -	case CDSP1_DOMAIN_ID:
>  		data->unsigned_support = true;
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
> -		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, true, domain);
>  		if (err)
>  			goto err_free_data;
>  
> -		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, false, domain);
>  		if (err)
>  			goto err_deregister_fdev;
>  		break;
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index f33d914d8f46..27b892b546f6 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -134,7 +134,7 @@ struct fastrpc_mem_unmap {
>  };
>  
>  struct fastrpc_ioctl_capability {
> -	__u32 domain;
> +	__u32 domain; /* deprecated, ignored by the kernel */

reserved1 or unused

>  	__u32 attribute_id;
>  	__u32 capability;   /* dsp capability */
>  	__u32 reserved[4];
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

