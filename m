Return-Path: <linux-arm-msm+bounces-52197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F644A6BC9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F09CD7A58AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA74678F52;
	Fri, 21 Mar 2025 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5FFyDMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6177D07D
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566038; cv=none; b=rRzZwstBemLfn/eArsG5LHD8lzkb1en8tavQnU/oF0KPATAkDlripGB0woHRRaicPYK0jDWtA1+9+/jKTm1rkNpKv7We2hf0mBV6XXsNE6OX2xDJLt6uZCkiYKJGs859hvi1OpnnXdQZ3mUGwn8wi3IzMryvwWR1N4C6I4glW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566038; c=relaxed/simple;
	bh=e/XWsyI6BYdyPdl0XA1XeIvspxRAYhIZaXUiTyMFzjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9DbJrmk/lv5FPco1ZUcAfS+lUk3fUIQlCUM616ZIJFCyoWBKPxGrT0IrySSpNi+cAaNo0gKaxV7hM6mHNdWy+pLbNI+qbOyhiTIAksMQ76ADsXnQ9c8YjW5vXy9UqKRLOg1YRyQbO+ydW8aYepbMCBczS0zdgupzIn+k6xlGg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5FFyDMu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCSsSl010802
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n4dOWXKC6mPXFjDpSYZ/WJvo
	CSfdzk/j2GPOhCYKVDY=; b=Y5FFyDMuplv32vbJvmFlofNE24HcYZWtCbdB9PuP
	bY5dwKhHIUY/GcnqQhj6bH7Dvl2SngTIDpv1h4VbinxQDuuBIT/Jmg6TiP75ozfz
	qmjQSCRr/tCYSKEazwyICdKwwhOU2nG8riMoCPOswFdnY4ZWXNX1DcziyankEY5K
	3NgNK/iK6600o+5oA5IeVMk5j+HLCKyisUQCezbAiOBl9dyj43MHJ3UF05jhn34k
	NrPsDQxH8JQTiLIRZ6RmEKYg8snGFsfJ3l9ZL/+W0qWuu9XVlru/HSERl5VGNHDp
	0zE7o+smmzQQR8SobtgH610Cn1q3vO7Zv5TNgssHrgtqrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h85e08k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:07:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53e316734so391747585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566031; x=1743170831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4dOWXKC6mPXFjDpSYZ/WJvoCSfdzk/j2GPOhCYKVDY=;
        b=feDmiC9BxTAJw0/6UImXubw39+z++j7qPf2B61L6pPcaGIRQUvP7vvLgRlytHE07D0
         T5h11bQbQ6skgFFQwJLOdhWjxXYoiYQxY9/zkYuiuAXsbM7tmbZz0Z+pNrzb6IvP39s0
         VrPh/xn9IwSXMUYpHYAJ6L6vPVXH5jj8s5GVPzwUbxjAEx/L+X8DhNrTCFdO3jarEZxS
         /zgqq5gcQPOe3XDDJDdn+i/vOXqyfLQi0apwdd0PutIiDDHRR3KYCCelufVLKS0mHkBu
         ZIQkrKRap1MmfTxacGa21jxnmQbwpVVs7mF14SMHakn8moHeoZnxFDUZl2LTG6eGVKXK
         pJaA==
X-Forwarded-Encrypted: i=1; AJvYcCUgKay0BZVuJgXB8aZtx95Pk6zud1TsQHZXwqVQnzz9mmKy+XMHxUhoQ5bI4gYZ5JpPAaLvRJ2SEDXV8v7E@vger.kernel.org
X-Gm-Message-State: AOJu0YwfaKXBRUuP/3kw+u4M76z/Ye9xCx3+A2YPrdpGacvsfZPl/H7m
	RmwWo+nRoabtj86lXcU7LBeBVniRPdMfU7cOBNxAUqyMWvj+eK2GcXaniu4tPfhzfl8FeLfQsy0
	RH33P1Dc0DPpvsCNs+AbrAPKmE7eoMyFi+oAEgowT+vGekI9x4wevX43W7dOM+kxz6IsRXkiu5Q
	0=
X-Gm-Gg: ASbGnctP52aSjCA9g6f+1iZVWeyK9sPCFipOupd1hwz+jqNgd6yMGZoVpNSiSSViOkj
	SzKpunEk2gsx6JFls5zrPV5gmxcsnk51jtd6KFeqpahYu9dnryiRUTsBnFHMsFkVysMNdIT2j2c
	/m41YM7/OVM5WShn1HmrWiab8dwvmNBqgB6db0+69IirgXt0q94pvY8UWeXwiXSqPCIjSigA8VR
	VdpH6mcKwQM1S3clJ/hutkVVhRCNSjfiPJXYxNFSI/UFoa5CCuc6Q9M8fCvdG0DWGUJsUHj3nm7
	rw9392LM0Q9m8LdFHgFqq0yG619+en8lCCQxYAWXjQFKfQdW9CHGcB/FUUwEzHiHaHiCRIbPv4x
	rs64=
X-Received: by 2002:a05:620a:40c7:b0:7c5:57e6:ee87 with SMTP id af79cd13be357-7c5ba1e41abmr470564185a.41.1742566030508;
        Fri, 21 Mar 2025 07:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCTJNsCfV0EF8Epu2f1YteJvCUL+F4ENn0D4b3RmEfnwrm5SjF78ayOE8NAWz/4oqCHm/szg==
X-Received: by 2002:a05:620a:40c7:b0:7c5:57e6:ee87 with SMTP id af79cd13be357-7c5ba1e41abmr470561485a.41.1742566030053;
        Fri, 21 Mar 2025 07:07:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbbcesm194858e87.155.2025.03.21.07.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:07:09 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:07:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
        quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
Message-ID: <5r72xrv5rtw6bemh5onygkroyasroviijlta4hvwgm5c5hzvax@3icylchlufu3>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
X-Proofpoint-GUID: utbQ7GNRoQFr-hNxLP3MJmQrzdLOVAbs
X-Proofpoint-ORIG-GUID: utbQ7GNRoQFr-hNxLP3MJmQrzdLOVAbs
X-Authority-Analysis: v=2.4 cv=LKpmQIW9 c=1 sm=1 tr=0 ts=67dd7292 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=5a3lCsJK5BcCjL_2EzoA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210103

On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 20/03/2025 09:14, Ling Xu wrote:
> > The fastrpc driver has support for 5 types of remoteprocs. There are
> > some products which support GPDSP remoteprocs. Add changes to support
> > GPDSP remoteprocs.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> > ---
> >   drivers/misc/fastrpc.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index 7b7a22c91fe4..80aa554b3042 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -28,7 +28,9 @@
> >   #define SDSP_DOMAIN_ID (2)
> >   #define CDSP_DOMAIN_ID (3)
> >   #define CDSP1_DOMAIN_ID (4)
> > -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> > +#define GDSP0_DOMAIN_ID (5)
> > +#define GDSP1_DOMAIN_ID (6)
> 
> We have already made the driver look silly here, Lets not add domain ids for
> each instance, which is not a scalable.
> 
> Domain ids are strictly for a domain not each instance.
> 
> 
> > +#define FASTRPC_DEV_MAX		7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
> >   #define FASTRPC_MAX_SESSIONS	14
> >   #define FASTRPC_MAX_VMIDS	16
> >   #define FASTRPC_ALIGN		128
> > @@ -107,7 +109,9 @@
> >   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
> >   static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> > -						"sdsp", "cdsp", "cdsp1" };
> > +						"sdsp", "cdsp",
> > +						"cdsp1", "gdsp0",
> > +						"gdsp1" };
> >   struct fastrpc_phy_page {
> >   	u64 addr;		/* physical address */
> >   	u64 size;		/* size of contiguous region */
> > @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> >   		break;
> >   	case CDSP_DOMAIN_ID:
> >   	case CDSP1_DOMAIN_ID:
> > +	case GDSP0_DOMAIN_ID:
> > +	case GDSP1_DOMAIN_ID:
> >   		data->unsigned_support = true;
> >   		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
> >   		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
> 
> 
> Can you try this patch: only compile tested.
> 
> ---------------------------------->cut<---------------------------------------
> From 3f8607557162e16673b26fa253d11cafdc4444cf Mon Sep 17 00:00:00 2001
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Date: Thu, 20 Mar 2025 17:07:05 +0000
> Subject: [PATCH] misc: fastrpc: cleanup the domain names
> 
> Currently the domain ids are added for each instance of domain, this is
> totally not scalable approch.
> 
> Clean this mess and create domain ids for only domains not its
> instances.
> This patch also moves the domain ids to uapi header as this is required
> for FASTRPC_IOCTL_GET_DSP_INFO ioctl.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/misc/fastrpc.c      | 45 ++++++++++++++++++++-----------------
>  include/uapi/misc/fastrpc.h |  7 ++++++
>  2 files changed, 32 insertions(+), 20 deletions(-)
> 


> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index f33d914d8f46..89516abd258f 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -133,6 +133,13 @@ struct fastrpc_mem_unmap {
>  	__s32 reserved[5];
>  };
> 
> +#define ADSP_DOMAIN_ID (0)
> +#define MDSP_DOMAIN_ID (1)
> +#define SDSP_DOMAIN_ID (2)
> +#define CDSP_DOMAIN_ID (3)
> +#define GDSP_DOMAIN_ID (4)

Why are you adding these to uAPI? How are they going to be used by the
userspace?

> +
> +#define FASTRPC_DOMAIN_MAX	4
>  struct fastrpc_ioctl_capability {
>  	__u32 domain;
>  	__u32 attribute_id;
> -- 
> 2.25.1
> 
> 
> ---------------------------------->cut<---------------------------------------

-- 
With best wishes
Dmitry

