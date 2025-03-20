Return-Path: <linux-arm-msm+bounces-52074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA7A6A3B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1969B18849D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 10:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95BC21B9D8;
	Thu, 20 Mar 2025 10:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6P5GH3q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BFC213E6A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742466679; cv=none; b=Le5sPtcmt7SM8oT/T0w5ovR2dTZ0xULdoWNklbOmfuLEnXPYduvbyeJSM2GU6yIJrcY68xn/CyqlHUQ1ZoN2BdMULJONdJ5LRzBILZDbFx+fX60H2MEZmvv1hG3HpnI/R3Xd/Kx4dHwdBTtb1hkdzh/3OkUTB0DYHh0W1lP0f/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742466679; c=relaxed/simple;
	bh=Uqqfz4TCeUweBGm6MFD+Y1pFnY2abeb6RAXC/T0hx60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Amu8XofIPhnHTifUAH3H1MZi+quWnWTuBo2BbWNr89EJCQde2XYrUuGynTo5WC9DqJouVtkC6DAbNhngnN+ROZbADv2maCnzAzxUeyCvj4wqTSYQEUGIoQiM4xA7lgd7SZsFL2PnGPYJ0vr4QW3sLP8R98N0zqIb/Dy/LtBeL04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6P5GH3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z7H7025403
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 10:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36UzwJlY8WygcJ7OC9rF2JL2H8lu5cJBcRlW3DTYlSk=; b=L6P5GH3qx3tT+NHD
	TiiNMbptXd57D0t0G3YIsUuDIonwQJmJCwX0aNydR8tE4PWbCwlcoBrkfozHHCk4
	dYb2ZMwkyq+SSSNYhV443jbyavl1C7XV7eiyXxPCq1TSQj4w4A6SSdvIz3g8sQX+
	D2wTR0YMVhkkU5Y6G/aZhT3IdY92iyFXGxsn2wTAtULWC/aTkP7RQ6iZbfgZx5x6
	tt7AvDOt7BtfWYKR71Lw0lVF4L42nFhfywWuZdgiE1YIE5CiLFwroj47Y9t7C+0A
	r7jUZNqqP7yLmZlJexJO24nL8GoLwD5IbX7C3TfdIww9saMdEs9NB1jXiEpEFrQT
	P7MLeQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y2hpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 10:31:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766ce9a08cso1579371cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 03:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742466676; x=1743071476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=36UzwJlY8WygcJ7OC9rF2JL2H8lu5cJBcRlW3DTYlSk=;
        b=NCJTGKy7ZB5zRP08ybymO8xnIpHowdmxkfXukATbmeCsyET9kV2fnddxpZTLIaQCVE
         9FrPfWJhqpc5UwBsV2A2JE6KbvN8D1LxDQlXxmUgUdYUmn9JnwRmTm7YLnBjhpTCSnEc
         YKyoJFBJjRkbxPWpolg8kOrWel6MybF58zSs7cjEBIXgDXXzO5uj287uj2FS1vQxPGmQ
         aDlmXtsnRuaslOlLSpNnsyT4KHOMIto0YboAAUVTVSkGXo1t5TtYQ+yI/Zoz9BzhMQI8
         bjZvLUIWLRMbK2EV3ouOY48eTaoRFXMwZ7m5fZiDI0vUkVd8jJVpaTIDBfj4NUWkPklc
         C5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVvjqH1ymhX9EfZPQPlGFvkbJvj8Namg2FHF4SzGKzMk7iSu5cUDF+VqR+7GlNQmvKWPM0Yv8qTT4ePTf8@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4oSULjSkGU1NrMYuxf3OmuhPtC449G01dKfLBCGGp4y+Y2QB
	ts0CdAoy6JWmNXW9omIg39E1kta0p0QiEZG/GsxtFnx04fEIJHJjBLiBcqJgEGVXPLraR58+mFw
	wSQjE5QRJCFuzZv4PA5vmuugXAnhNGbjVuuciGSjtMJX1TsSv5qjjnoZMwdGuwaez
X-Gm-Gg: ASbGncssiWnYNCQSFuQXnwUSUA1iZRLLbsfWwSaMjsJcp94lN0eqQsEv0W50QMJxR37
	23wE84lhmfVO1PYhSebglrmnbQV3AH0VjX98+/up568+Ai+F/coMmqq6JYEbRW7gBzANJvmZ6af
	dwUZvb7qrUc7uvd/S1ukT10oFXTSE6TzAC5ChmF0Y3SLlGGc/o+CcQUZ+cesS9pn0Oden9bbYzx
	8PjlrTWVcrqP6LlQvdFt27ZfNmk+b+A6En5uNLifcvgBkVIVRTuox82IZj0rMvlMnUGnh6s8jwm
	tY04CH+pmJF+YLS1buBKTk/kNYp4dT+7VaEO7KsJCD2vHzFE3CdUh5wv8DBkl1Z/HOlh1g==
X-Received: by 2002:a05:622a:609:b0:473:88e7:e434 with SMTP id d75a77b69052e-47708385019mr33204161cf.14.1742466676087;
        Thu, 20 Mar 2025 03:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIovFeuj/9Kdw2uplzLYek5LaMRqzFe5uQVLzBQNPcEO5ZEu7AMi81ywbHwodwhn2RNco2Ew==
X-Received: by 2002:a05:622a:609:b0:473:88e7:e434 with SMTP id d75a77b69052e-47708385019mr33204031cf.14.1742466675771;
        Thu, 20 Mar 2025 03:31:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b1602sm10459819a12.42.2025.03.20.03.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 03:31:15 -0700 (PDT)
Message-ID: <f8d12312-dfb7-481c-a025-dd4c6d3aa268@oss.qualcomm.com>
Date: Thu, 20 Mar 2025 11:30:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250320091446.3647918-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p-sgLZXXCv_p9xBzVK5uBK5uAJX40Tv2
X-Proofpoint-ORIG-GUID: p-sgLZXXCv_p9xBzVK5uBK5uAJX40Tv2
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dbee74 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=98RdHtkJ8WjIMYe7nFEA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200064

On 3/20/25 10:14 AM, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GPDSP remoteprocs. Add changes to support
> GPDSP remoteprocs.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..80aa554b3042 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -28,7 +28,9 @@
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
>  #define CDSP1_DOMAIN_ID (4)
> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> +#define GDSP0_DOMAIN_ID (5)
> +#define GDSP1_DOMAIN_ID (6)
> +#define FASTRPC_DEV_MAX		7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -107,7 +109,9 @@
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> -						"sdsp", "cdsp", "cdsp1" };
> +						"sdsp", "cdsp",
> +						"cdsp1", "gdsp0",
> +						"gdsp1" };
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		break;
>  	case CDSP_DOMAIN_ID:
>  	case CDSP1_DOMAIN_ID:
> +	case GDSP0_DOMAIN_ID:
> +	case GDSP1_DOMAIN_ID:
>  		data->unsigned_support = true;

There's a comment above this hunk that is no longer valid:

'/* Unsigned PD offloading is only supported on CDSP and CDSP1 */'

I would say it can be removed altogether

I would also support renaming "unsigned_support" which is very generic to
something like allow_unsigned_pds

Konrad

