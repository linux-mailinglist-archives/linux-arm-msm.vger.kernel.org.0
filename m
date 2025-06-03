Return-Path: <linux-arm-msm+bounces-60134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC96EACC4B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 12:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA2897A2AD3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E8022ACF3;
	Tue,  3 Jun 2025 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaB5EMNC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEAF1D7E4A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748947923; cv=none; b=QPFVNHirDIJfL4rwwEp2SCmSQbX6yj9RmT/yC8wPBQH4gkEaK8g2ynMG78sprUjJFnChCKIcBnmQiSzS5nfIqzxX4kA8kwwCZ6L58GNzjrUspcTSgHeI8KgiyUIn2G3qrfItusf2hoaVOW5YlUDLYYU62qUBgqW46AoqGtUduus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748947923; c=relaxed/simple;
	bh=xksPMyRBHmUawJmvrqG72dG1bQL/nqL7/zl7hnCq6mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aj0UlYeEZG65N13Hc13HF07IMPAGTXMlKFWkCyHIf8Ra2u0OdEz2ohElhq2uuj/9fKmTQ+C/xRym/+1qB6dc3dDvf1fb1F7kjMSyqH6ieEY1ML8MjXkytD7OmB8ib1fwYUaBPMnFrtzLD0qS6WCf5dYiI9Wg2GufOxmREzmrR6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaB5EMNC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JKXW032469
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 10:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gG6LcmYQ46WfznvSwyEBH55u
	Vk21hBJH1RbGwGrUNAc=; b=WaB5EMNC6oRdUMCoP7WZm2YeOQ/AFgfgY5GTWEiU
	1HEBNjw2exJ7dmFwO3Jna7RhzSVVK39cWNeSw5RT09LTIapclaN+Lz/dKfWdJPMR
	HG4ODwFfCb42HbLbx9T0n2BuyveEq5PXhNAkO3pip5m0a96tfEouC8oaZt/+MnbE
	ZWo872rV2Pnw7IDciBzN81TDR2Pd4MRAIjSafSz524LaOF8KyZZ8IsEQBHmjPFWV
	wDMSt5ZS5DJfhtcNOcRF5GkVpLgsoUc31UQq5tP4gWODTV1bmkJMINsvs4dBXSyv
	WIJaUvFVjnabVsTbvPR030PIh3mQm4H/mazl9ItsAlt3yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfus3sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 10:52:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c793d573b2so959760385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 03:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748947919; x=1749552719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG6LcmYQ46WfznvSwyEBH55uVk21hBJH1RbGwGrUNAc=;
        b=onW9BDFkGToyilGQg7BqybTTn8QifsFZNnEvZL7jB55ljYJNITXneB0aApYrZN7dkQ
         wELdRI/byAwzdPbMXPtv+6SxaYJbd79vsIwhFgH0simKj4PdaIGrBdNzZ+L0EB+jbgO9
         KcIucjTt+/e2e6NyyCvzqPHFYe8De0t0nkNZOd3Phf04juEFuhgSFP4V7tDeW4SRWUum
         kT6XAowhA/ZQEWvaEZo3LgdFAJZnbQl7fDgJeHtWARzYuB8+eUjuAxwVEixMU2AqNCzT
         SGf3NifpKSIXHvZzS12n3QsICRcOT1NwlbWXn6BtmGt1f9yXDTh6k//Ihps84m9+RKoV
         OYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyj2rI0rcOIkVwL5443uo6j73c+P1avBUjPG7WOXCNlpA4TU+WGWbAWe9CiEcYezMokx2kZz+dnxBN1Jm5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2nb5/yaR+4ufA1XCNK31VbSwtGeQ8JhYdWPsHCNYJ/dsqj6zg
	sf5XVEytYxdPFSWQOP55tBzzS8RhDmQzHVvwMN5ENALMHzDH5ClV+kWZUho6805jJxlwR/5plOc
	3PdXd5urAwnND9AuP9WdfSF/E1W86m24CBRNv9GVn8ZiB6mlG3WUXt9II110QgnL2k889
X-Gm-Gg: ASbGncvqkLyc/OpJVZpdY2oOgbPJAqYB84gJ3Y8JXYtcyXlUuo+Afp3p1+BBel7RAD4
	6/dQPcHvLjfBm2aB66OgYA/rlDqmDtYJ6jXqS+NTd5FXILE9A93FFvRiAe6jdZGYPCM+hxYC30T
	TtfKmH0lS5FABjUdi130kD9dlU+Q3YKVv7RYba6I0PAGnLt8GSXRzmK1+UE3cOJ0tS/WO3AhsVj
	kHRWfOxveCcIlcc66vnz4MBS4t4eqf8YHGRkyXyIl1n61CmokX766Gfhmk2sXDvBevWmDwNy/Jf
	viVTBxp0xG36t4QrDMDzEtK5RVip6LzdEDkkjXYQgfICNqTtvZHbEZL8uFLNxsZkvNFI70hcUNk
	=
X-Received: by 2002:a05:620a:190c:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7d0a201cae3mr2458424785a.44.1748947919251;
        Tue, 03 Jun 2025 03:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2GiN9U2uANhBh2sl7jgw3VrcRzOZN+8sBe5jX67so9Kh/4ZlV1XnhUls63lXZyPIojeacfg==
X-Received: by 2002:a05:620a:190c:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7d0a201cae3mr2458422285a.44.1748947918924;
        Tue, 03 Jun 2025 03:51:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b35cb6sm17578341fa.43.2025.06.03.03.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:51:57 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:51:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] thermal: qcom-spmi-temp-alarm: add support for
 LITE PMIC peripherals
Message-ID: <wsvdkte56d2avhhnte2r4udxpdaluz2jegwajhlik72ajk3nw3@l7daoy2lqvd2>
References: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
 <20250528235026.4171109-6-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528235026.4171109-6-anjelique.melendez@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=683ed3d0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=C_YEPuUXS4kB9x-TF1IA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: dCrSOucEZlfnYmEUx2DW1725lIB8-mWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5NCBTYWx0ZWRfXx6dL7a7IQO+l
 BcmuHvN/pqywWOo38kKgMMMfMQSAvIKAu+qCIdht9X5WLgdGTe4GOEv1lygwBIgZuiLf6FAg1sH
 VkkqyuvlytBUVwhyQLwWg5cLXDzwPUfuIwGIEw2RMteyhEjlYfj3sZb2a4EAZMmW6TARmECYHIf
 IQt77koLE2JyX7Sc/mqwchrPI2u5Hp0istW6hvB+DLSsRimGNPEdYS8Ta7wvWu91ikXUUTq0Hgn
 CWFP6eWIBum+98qYX0AcZ+9OmlP2wKFnkGVTVHQCF0L2pN23vZYRyyVz4CNAIBH9dHH4oCglxLW
 SQ/rAf9b8bsbNMuEO8phkFNcZp6VNK7sJpemMtCc2D1kbnM42ud+3Cqg0beWO2qz2+ejqJ04Q7N
 5Cg2/kdwdaP+17dzRizTkleV+DYFNlwmW56WDEOWmozPWP3DVhVbuh8kaRIcofXwIZO0DYjD
X-Proofpoint-GUID: dCrSOucEZlfnYmEUx2DW1725lIB8-mWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030094

On Wed, May 28, 2025 at 04:50:26PM -0700, Anjelique Melendez wrote:
> Add support for TEMP_ALARM LITE PMIC peripherals. This subtype
> utilizes a pair of registers to configure a warning interrupt
> threshold temperature and an automatic hardware shutdown
> threshold temperature.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 208 +++++++++++++++++++-
>  1 file changed, 207 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

