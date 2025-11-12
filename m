Return-Path: <linux-arm-msm+bounces-81490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6DAC54543
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 21:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BF805346216
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 20:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D83328466F;
	Wed, 12 Nov 2025 20:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECNC039U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BM0bXAIc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3E72798ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762977756; cv=none; b=r58ZWi+O2+LYu0HLb9xAVajnepUpyP6HIEPQI5O1GBJEhXKADOQWQJ28i4FyefOnY1jJVU3QmMFU9XqDoK8LuhPfMjrs77oSb7Ma4Al2OzKcN1x9EYVNVNm4m6KF9mCrQ3EXU/O7rwm8VIXxfuH95sKpcBimlxSy2RljSYPif2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762977756; c=relaxed/simple;
	bh=V6s6BBEd/0bzrOGw6MMiaMzOlgagVmFadEX2XjoXe+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfyWuSSnz3dOmqpV7jpF6id6LhfgcNWscpoCJ+qo6Hr2dPqbeyclkP0BplJnuKqcYDc3wP70p2pfx04eGYfzuQD6kfbnLY65/WVd/nQuI1IgpRovcvfuGg0/gXS1l9Pq0Y1ou8Ee0QJ5vfpxnTFbeZae6Q25dnC1Cqm5zDJgoX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECNC039U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BM0bXAIc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACIPerF2087471
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 20:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FvNQaYtuqcShLxpZLFJffu01
	/PtxaNskpjDdIuG4fUA=; b=ECNC039UQ2ygFfkmUhTVw26uwTNiVrnAXw3Zy7N9
	diC1KCSFx6+zJUvbXfAQqwje0xh9vmBOnA8HPfyJozaAzUdY3qp2MHdpKS3+EsRd
	hDqTW51xISGwbXHpRm/BOYScFb20V3p7f1t3pNfp2BzL0mW0akIiErhfygZg0Wrj
	LDWFfsiOhn9MY/gIyMAfTJHF3SjbOXDdx8KL0dGxcHaDXuJMQRIIXS/GMVsaK0dn
	bJVIcI6b/FXNww0bEeiwnEfAIolIyjdtxKqpLiK+kjBQc2IK8ZCcji4S8rP8SdQ3
	23+Llr8kCf08sX4w+Wmf7Kdedbhk/8vtdKGkJWsCxHmuAQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acygm88ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 20:02:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dbc9806b6dso172750137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 12:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762977751; x=1763582551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvNQaYtuqcShLxpZLFJffu01/PtxaNskpjDdIuG4fUA=;
        b=BM0bXAIcpmos/ab+9NqD9gpNLRivs2PJGuhy/0bHtsIsTzF/js9TojzJMliQGajjoy
         urvg+Udk3jcTyk6+8sneosvxW5BT0eO6s4DvPQMeH12ldgLtQ9JYBq78uEGHPkHnlN02
         mxHXhN5p5zyq5tutBJeueJhh6So8YapoDSSvyUqv5GHChQJqJ1wcoVywgGCoTGCyRfVC
         I3FY5lOPVru79GyKNhl8WtSVm18Y0WlBq4q+W6gEfnsPWEXHLT06719Zmn+zHhV1paIl
         3r6SVpVn2PFOtky9V1Jf51AKxhyFcyYxdtOZQcZbr8hAPgl/31nIbK+ISNS4DUTszFvp
         l+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762977751; x=1763582551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvNQaYtuqcShLxpZLFJffu01/PtxaNskpjDdIuG4fUA=;
        b=u/ct23Xa4EEt5qp1QChPDBdbHzruSwfp8p7gw+qtnZf5kjci9mdknpP7uV1dSUQRkq
         tlcAbtlC82l6sVP7upJ8moadqLzDrCsVB1lGUmDsvafhbLxzJ05hbNbRI+kiKeRwGsv9
         lhZ+v08/LWza4in8hMTYEEb42tcVPS8brNq7413kxPwOfOKuzXXurwYTan2DIEp2pBJu
         RGsr4YyEYd6rLoqv5xkNpLH5OjO7pQvx01D5tAqVo/IT81b5LuBcoOECk8mqSw6vK3FS
         inkXnqLOF+O2jS4ufBKRdff1CUFek1GroRA/0G3a5OKx6UXLLyBw99KwXJrlkLapPfC8
         8GBg==
X-Forwarded-Encrypted: i=1; AJvYcCWXXIowATvPDPazCGKh4/3hE/+tvw9oEW4sj81jXXVAMGjPXQW/OVA3rlqCYNIsNm8nrVl1uO0Yh8ajCtoQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzmzuM+tXKnsAtmRs4kG/1JSCQr66+y0U2x6RTxD18KTk2crdiP
	vTCaK7lnWynyO4UYrJR9ptm9B4BUSek/1KyC9L7qH18jCnOPv69yV8aCxlFYtDoxnVv4KfnR+Gc
	cLRFwqUw+MERYaFICXh/fcHMwLSyXV02h6fW9hea+KcP8YXLeeMt5SBj6XGYlU3wfXeqi
X-Gm-Gg: ASbGncvYnZ1EahSIIsHidnCpTp21b06AP3cq3k09a3PNIA3fe3I5j/dcK1zUV9iraSb
	9va4ic5o9k7+aqdG0Ae3om4bT7fwekrSnb+itXSfM7XZEITQGIQ89Jwo2V4T7DXYKCrph9/nwhL
	8H1LXtsYduvG/F66HVjIu+3deLidmzj3EAtkZ2kqZekXjC4jO5GL+kCCWd0NFjTPNrtaePhUJji
	EQ6uBmXv5Ru+nCPW/MWGGFkkp+E6TTsRRi7nvdD/L2yqnvSDTsVAFSwiMJ+AJMC+Oxb+EC/rN24
	fMpTDMrThiksm7Krel6UwoV1umj445it9wWCZtn+TtNxvgd/ctWA7KLFF7wF5YGVDjHPuTHzvow
	xCVU7dSsk4+45DPXCsiYKQFJzIldzQuemEwoEFgTEobIfd9y5wRxAGCa1kD8wd6cNjuNObGJc4H
	2epAV8aLwf4ZrF
X-Received: by 2002:a05:6102:1629:b0:5dd:896e:7b48 with SMTP id ada2fe7eead31-5de07d2a66bmr1591367137.14.1762977750840;
        Wed, 12 Nov 2025 12:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFws5LrkKqeobybDIptCgapHUcvU4bSEg8lJzPhSfBeVBFOq57rCuoMQrcd5gvzYZuvugA27A==
X-Received: by 2002:a05:6102:1629:b0:5dd:896e:7b48 with SMTP id ada2fe7eead31-5de07d2a66bmr1591122137.14.1762977748845;
        Wed, 12 Nov 2025 12:02:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944ff427d0sm5899727e87.68.2025.11.12.12.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:02:28 -0800 (PST)
Date: Wed, 12 Nov 2025 22:02:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
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
Subject: Re: [PATCH v6 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <e5awatsfe6qksjj3z2vqn4fpc6pnlzuezu544f4oiyduappihp@zxgvyvyro76a>
References: <20251112-gunyah_watchdog-v6-0-38ad01f8dac0@oss.qualcomm.com>
 <20251112-gunyah_watchdog-v6-1-38ad01f8dac0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-gunyah_watchdog-v6-1-38ad01f8dac0@oss.qualcomm.com>
X-Proofpoint-GUID: VfRLKLfAAs9IM1L7EqYZZxgHjOFG_C8m
X-Authority-Analysis: v=2.4 cv=E/fAZKdl c=1 sm=1 tr=0 ts=6914e7d8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aeXaUF_9NkvhSBek5i0A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: VfRLKLfAAs9IM1L7EqYZZxgHjOFG_C8m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE2MSBTYWx0ZWRfX4BTcrOfD2cX1
 +uMDPJudaxCLqWfgT/snf1QWO0HPYY0W+6Qts24JEwrElOEXQiiuw3LS3SPJzTTyba+poio28Ic
 6LNv5oV1fNICiszwlHZcT52DV/oD/EnfuGCOj/SiiIzq2iGnuP/IBkHh6HOQDhBKVzGawzxCBy7
 TANEgotcAjzRGgiO6bViIfX4lsKNn4pGOtNCMmFFLnNl7RttJlnGzQONV4Fy0S6Fmp8KE9RcNOS
 gYZLvi3OgYYySRKcLSkp0oe9B0UscYPPojSTJlfNiH/QknpCBjmyTrv3WNN5KVoTGxbqLIn0HBy
 JPT874iktsq48XXEczc/cBRVzcVLtBKv3cKYUkHtqTuvTNBQzcSjq+QRnb9g8FTM+0mobuAGq6f
 5slC5BDt7CS5pDTUn5cFgd2dZxAM/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120161

On Wed, Nov 12, 2025 at 07:35:20PM +0000, Hrishabh Rajput wrote:
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
>  drivers/firmware/qcom/qcom_scm.c | 53 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index e777b7cb9b12..3f45cc69ef83 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2182,6 +2182,56 @@ int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
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
> +	const uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb,

static const

> +					     0x92, 0x65, 0xce, 0x36,
> +					     0x67, 0x3d, 0x5f, 0x14);
> +	const char * const of_wdt_compatible[] = {

static const

> +		"qcom,kpss-wdt",
> +		"arm,sbsa-gwdt",
> +	};
> +

-- 
With best wishes
Dmitry

