Return-Path: <linux-arm-msm+bounces-58040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B935AB819B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 10:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3D801BC2D23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 08:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B5228D845;
	Thu, 15 May 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+KDVveH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16928C013
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299241; cv=none; b=BSzIokWBOlEU8qzQz2MwxEYa7Qp4xzZgzK7iegtP3QN0stQhdXPmexQnMJR7zaxYptpAMVGO2aNYkgrRdykAmG7U7dgN6NprkbOHzw4vWUNiTYF5SlfSrBSN8S3VL9/xoOtAChH9fsLrKBI5OamXlpETnaUmqJeilhrXVmMMOso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299241; c=relaxed/simple;
	bh=2RoVilq28JLCWveVcprN0momhCfAmtJ7VfZdpeHBMdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMZdhjTj1VJLjPaC2CZzu6TEgL/r32/PwrIHO3jYVqWkXsL0xNSbNEOf67RhZzc3rejMzisT3cVGPzRbhT90jCIvLeGS+apw9vSw7L+/ZKcSt4yG0QzpKQBG0j5md8JpMuKRwqHA+5qpmrAKgojzjR42Nv/FyS60eWIl3kSTIeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+KDVveH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F8r6Z0025425
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wsltmdmRVij+n287lyAX8Ikh
	bl8eexKvi2wlFpqccWw=; b=Z+KDVveH7PPZEHqFeBKYb2ZZ5xWBL3m8p1zQz6A3
	QSoaJxgtwzTBACEWBbuSSlQuOKtJawmCC0UUFzus8LlRUxyZfiadS6CSyYezsqQt
	4i9N53R9evkN/xcfA9njHHCObIcarXopOPUt8/B+lR3khAtdkBmOzdyUEwuIIYru
	N6XVBAhQXNNkPW2kW4jzsQPDdB3I4MCmTZ7iOh23yrcIo0PNmG5tUfOWz++Y2HiF
	/iSSzf8YcAagWa90q281QPKRJute7GQFyKoSx/Qv9epdxzuzYmWL/Op4nXySiIkf
	UCehLl36WfEbBF0hJzrdVgTwSoaF4MRIgyjE9If31j9uSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew5eq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:53:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53e316734so138307885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 01:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299237; x=1747904037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsltmdmRVij+n287lyAX8Ikhbl8eexKvi2wlFpqccWw=;
        b=I376ddfyDmwvTcUYoCShAp+lD9OJkOkId/ERHgHivb5g0pGv6WfiwMYhE/Phrx1OE4
         6OAjGGjajYjFb66FvI5IkdZcrU9oyVnGdKFX2l4HK06+bjCXYhXmkveZO3GeOClszLVW
         NzvTr6FHNgGjYCZMVOb/JmFolW6G5CNx2BxkEcRdiv3Qx0JNzLtw8hxY3tgaFmWzYEBW
         VlSjpiq4/DtF9LekiBplcMFFzkDX374HpHlfHB3y6E4UuHU/rYk7F4fEKR0hb91CbwUk
         u7Eum6keZiQvhxvAb4+TOuhzpBZed1+7YCJMv5iXwuWhywKd1komIEYwzlFAUtq3j6Sa
         3rrg==
X-Forwarded-Encrypted: i=1; AJvYcCWlrHXsoAP4v95jGsGUnQVLJAGhzsy2DT9sEi2ogrj3yP0115SjsXbUoXG+/44a6aQINOVC3LeN+YlID3+M@vger.kernel.org
X-Gm-Message-State: AOJu0YwPbhkDAnJogF0uaw1oOY/smpBgyn8MBWEpNuZc/8DD8hJBe+gQ
	V+lJThgFauuf7EVSXgpyr/UVFQlamn8HVy2y3LwkMUdwoll6VHDUJtc/1p27lWaanaEbCy7ll19
	CkFCuJvxVJ+gJhIDBMrMJeUBmwUWDnvFIhIOM+Yx4VDqaBX+YKayarZr+IH97ytW2
X-Gm-Gg: ASbGncuohvxhC/qLWiSbBRWYKI8OfMsWs7b8JgfdaLD6cAc9bTDaKpSrGjwh66rigGT
	4l3DJTv3YcTVWTOv0vWg9RlKYaiW51kwnHkZXMGSfLWfFR9Kd4WIeXf8qRRDp1bVzp3EfvqXi6t
	Ex8tLwVk9bW/uVysdpx1F5G8ussNblqTyad9vkVs9VSR0RiR0YwXFgkD52fsj9cjlpDwjZxps4r
	8RYabqxBquSj1IvGajky1FogjqPazKdJMiRyDi7URGkaoek3ah9ajIvxvg9toYxHW4eKI9SMWYS
	W4jkoim2pfCwAUgoCwf/ARqsHa/6dE3WIeU6Pzp36poEDOztWWrkz2Agy3REcPTXF7E8qRdHIUs
	=
X-Received: by 2002:a05:620a:1713:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7cd2885d11amr1070576685a.52.1747299237256;
        Thu, 15 May 2025 01:53:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAhtHxB82XttHE69UTemQ1V/dS0+iRE/EXXu/EjukfFzXmiKEenxKCuoij+gVRK+gVuXtXkg==
X-Received: by 2002:a05:620a:1713:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7cd2885d11amr1070573785a.52.1747299236913;
        Thu, 15 May 2025 01:53:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cfa9sm2556379e87.68.2025.05.15.01.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:53:56 -0700 (PDT)
Date: Thu, 15 May 2025 11:53:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com
Subject: Re: [PATCH V2 2/2] mmc: sdhci-msm: Enable force hw reset during cqe
 recovery
Message-ID: <2frduref6loba4knl73aryr3a4kdtuohm3m74tdkrv2tl7oxqp@clyp2bkqfr5t>
References: <20250514111155.10896-1-quic_sartgarg@quicinc.com>
 <20250514111155.10896-3-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514111155.10896-3-quic_sartgarg@quicinc.com>
X-Proofpoint-GUID: mYJufzHskUfE5IXtBmEceUzUNvbW2NWp
X-Proofpoint-ORIG-GUID: mYJufzHskUfE5IXtBmEceUzUNvbW2NWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA4NiBTYWx0ZWRfXxzQNxiUT7pbv
 ODUl0BhO28nog9fNFVytPv66SZUFnfpbJOX4rtQhnrtAnNvVLx9Mzgpyd15hvHK3mtwammEOlsH
 +ALSKrNb72R6ySPtqXfziEd73UIlUxmPq/bw3A4qnS41aeKp/EeEbirKyWEPwie5rUJhgtr0LnM
 0l50xOtDqaiAEV4N4wCeJDi6TicTE9t7SxbEMbqiq82XPud0ezTfXpc8I7w+lGxX3nRFjkijVKT
 LoAbgRpdgXBVQNyKZoZvdD0lg/DEZepEWQ0aMeOySP4Os4x0JEAkabVO4vGlUvbesRVUicoMH9y
 gmwci59fOQcTn1rk5LaQHmpHL4MX21LPvJ13KiTF8suT9jczcalbLSr+mJYucTstirqfj02VAB3
 gnY0muN84hQpZYE1jPwgm7jU2LNV215qZtyggjxEMe8IoTEm8FLBROP24p2uDbS1URTLHLfU
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6825aba6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=WP5EXEGyC8KvHHVvJxQA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_03,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150086

On Wed, May 14, 2025 at 04:41:55PM +0530, Sarthak Garg wrote:
> Enable force hw reset during cqe recovery to make recovery more robust.

Nit: CQE

What happens without a reset? Is this only required for certain
platforms or does it apply to all MSM platforms? What are the
consequences of a reset?

> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 66c0d1ba2a33..711252ad24a9 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2730,6 +2730,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  
>  	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>  
> +	/* Enable force hw reset during cqe recovery */
> +	msm_host->mmc->cqe_recovery_reset_always = true;
> +
>  	/* Set the timeout value to max possible */
>  	host->max_timeout_count = 0xF;
>  
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

