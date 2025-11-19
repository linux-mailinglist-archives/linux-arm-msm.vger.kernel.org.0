Return-Path: <linux-arm-msm+bounces-82435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC8C6D5DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8E6C04F7E01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1338C328629;
	Wed, 19 Nov 2025 08:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZcvXl2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXn/UpvA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0BE32570C
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539429; cv=none; b=XJILNMj/irVtgx3mRoLVW0h/1BmZMBkMX3s6oN0F8enMA/5t9pzr6kYNxSGHELHHKs/zxo2rpozQJq2GuuHnETMGlEO64GI/PDvJ1RY21ZFF7nmAHEx4w8mwdBypvWMb3FoJBBxUTChwgT5WZieO1nuYD+6stjmJmPwURCgOCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539429; c=relaxed/simple;
	bh=nZfR0Qclc1LACJ8SOq0X/EgS+4XyKqvZH73WUxZjT9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CF+Mpt1sJoWxsmyncZbEAHhhhN64PV4YP7ptaPm55fjA+hEryqH/GDqZX/6v+8EJsLcmj6DBYJNKZDKuRLTs6KlXqSQfMUqpg5DTvI6aBKt0jFVfWVUaoQHieg/bJWf07KoH22cHGps+kP17h7rnP4YlvkR46UDkERV0m3YXprU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZcvXl2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXn/UpvA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7OrAY972425
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CTSml3yrUopm/LP5V3yO8cu4
	QgXpbL0uqkdTIt6q3TI=; b=ZZcvXl2fzg1f7u+HXojHzU8hl3/CgHJpZw4tD4da
	Sp6jgkBY4ajDPVPQGZsnkp/tpzZdFnAuX8jwLUCmaGFtoAxCJFV/jNn2KI/tLK6O
	OUQUBToqhnQYr60GLmUZmwBlZNU8FIJlL7VvcODeXTwh4N9l0Mo30U5qUX8rgZ78
	SLFf71lXbQmHh8S4fF1SXUKBSBODcIfeQwFU3ejvRoCJI4wC/TwWXuevaO6ON+si
	7uyl/ZOdAh6Nwj/8twmvbu0Sh9oFar5zF50ZG8xOhlO4HrZpSxUzTv7Xmt6sBTob
	otPgwkGYWpBJW6lH8TU1mS2B8J2dHbBmyG5OZjU+uXGTiA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9fu83yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:03:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0995fa85so90940191cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763539425; x=1764144225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CTSml3yrUopm/LP5V3yO8cu4QgXpbL0uqkdTIt6q3TI=;
        b=YXn/UpvAy1IgYd0+WZIa+YVHoctZfjy60QQpThvq56I+9R5csiNLYGzItCHiEzics2
         skgrUyL5HbrQWCgOIdJKDqmWrNszp/ZYbzh6UeVbRmALdxaM1HlGc8sLxBjC3ZhiWSHH
         V9oXhxh47ZbRS1iVyLccqVP9kjrR8gof0bQHjvoDgHnLrxjEaF12PmBrpu9AB5sgo0DV
         je/hQiN9Zf5hYmixqDA5+5Plhnl++6tSSukXZBi1aULuHEcZpQZMJHcrk5QTzVUIeqlD
         SIbX961BPMQWHa5xF53OsLP9C/IWlXUPoXYrE0phDD+TBEMYwRKtn0XsavKRsEgrstRD
         Xt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539425; x=1764144225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTSml3yrUopm/LP5V3yO8cu4QgXpbL0uqkdTIt6q3TI=;
        b=kBQVgW+mkLYGmfLBadw/aUM9pFqWPS2wAhcVcEP4wxhhV5JM0RMoHTwJg5jPo4hkM3
         bWjmelMMpuQIXtc5qNpMJGg6UADUDFm+6RkKr033GvQZfiBuElk2hJAhoVG8u45dXhQC
         KZ2BZeZAWyzCwJVsGBiMiIWS85ms/KKDkfcmp7n7GkbK/3PZlTnd4oFtPXjDXUxFuIoN
         HhzCjaieThBBGEw5iEPvtzTUXwD+XeUo9ubTuPEVLjvR5b9gyLmSgd9FmrX44Wf/TFER
         jZz7h8GzCuRHaQAFWRzXAhF9mC2NEN91Mz4h0ZS3XGBN4IVJw2TQWVKJUarKU0xp88S7
         L9IA==
X-Forwarded-Encrypted: i=1; AJvYcCVTB6HnMsQOIr3yLnupWg+SMmyNbhY5N9GZi6jIKp75Bn2TC8Hqjmc0Q5xEuDTWCoXqdgyt12GfeI4JvvyO@vger.kernel.org
X-Gm-Message-State: AOJu0YzKTqLNGjWqthYXakaFmNu5ky5YzDxK4aU/ajzTNKXJHEVXyiXh
	eq1HgkY1SMNWusHwfupsG4+Rneyhw1PFHCkZyyXb3qR9eA97D2lRmwbb7v/4O701a0ho2fyABaG
	h8zc1VNqacb6PCptZeZHdhWXCxoON8vLHRZH9GQXjvIe/Cp9jYn4VExoJO6qgB74aSlsf
X-Gm-Gg: ASbGnctc9eYtVhsHYNkKbybLj5/NB/S1/7k4IJaqbZHaUDhDre6C7gRNwKzNJ/5yYed
	G1ez41DO9ztp7Hk9h3q5ubnwAKrQ03TXeRVqD1fCc92E2T848NWt6K588zDCqSg9PrqDGcugE1G
	HdY7qqS2okUjeNIIP0dCUZhnjOVXHwGRZSfiPkSY2MtzPGm1Q9c6FF63CsCP2KfRwjXlUASUsnB
	ATh/vrs96qZQFiNsLUM8JXzI+ZutesfZgJLyo2cweRKSPPPC8DBHHSIL6HDQJlrPS8f4+qgK2bC
	quZZrtWm/XBQiUhuL9nEIahI9cW0Lsa8OEXIQgVYWfZug2Z41qfIRT9NuW6vuFEnj51zRESYlFz
	MB7BOBNcgyE+yZFWBb7grF17qKnl66NbMWF8DffVq3kilHFG4yYVZJ0ksyjOj9v5zbAfy+9dAQP
	y4qIQfVmAJjF4Aeka4DF4YgqY=
X-Received: by 2002:a05:622a:646:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4edf210de31mr272035671cf.48.1763539424973;
        Wed, 19 Nov 2025 00:03:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHa4Ugw2/SW+BJG+DSWfUcFtigp3GPsXDfMQ4I1PhMkO10Y1cfufMs+t1psXpsR+ba4v2QFRQ==
X-Received: by 2002:a05:622a:646:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4edf210de31mr272035391cf.48.1763539424478;
        Wed, 19 Nov 2025 00:03:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5959b2f1c79sm815347e87.3.2025.11.19.00.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:03:43 -0800 (PST)
Date: Wed, 19 Nov 2025 10:03:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 RESEND 2/3] soc: qcom: fix QMI encoding/decoding for
 basic elements
Message-ID: <gsjo45cfnhonmstce4egjtid7u43klgxydmxf6z55n4wniv7xt@nqarkxghs3na>
References: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
 <20251118065343.10436-3-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118065343.10436-3-alexander.wilhelm@westermo.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MiBTYWx0ZWRfX/XMu7F5ZTS+c
 SUrMPfPfCo8B0YDYrJ4qYr9oC6l5YvnBNzAhPw8lR12HFfNxzD6huo/SDXW5gjXyz/nvbaCUNIM
 +kH2e9x2SsRp/lnENefnzrOttSP0pXlvaZ0kLuMSRaShNTHf1eu0mhmrRjD6BwgujZ3hkvIQ/au
 sCwzPN8O5V86CBjPyzPM3zWj0zT2Eh289XKsVfTqaGLbyL+HiVQh4ZWrl7pN6NRyVJijcdA6oxL
 O9LpANcHisGVVPs5jp0dZ6OwYU93aGs5U90VwFO8B8O6CBIZV2j9Ez0jx/iqNhwFDZTZjJMhzLu
 a6dJQ3S6wpzWBMr3pVH3nIuVKOs4SXmBpX4Die1C45Ez5cdkYs+EBtV2gONfPeLv626OhCJXKfK
 7XjSIBcTWrU2WrPL17/1D67h3kW78A==
X-Authority-Analysis: v=2.4 cv=KZTfcAYD c=1 sm=1 tr=0 ts=691d79e2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=N9GNhs4bAAAA:8 a=yabZVfnhAVxQMV54TA8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: dHcOPws0STEXBvzDnc_DnzhvTtj6segM
X-Proofpoint-GUID: dHcOPws0STEXBvzDnc_DnzhvTtj6segM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190062

On Tue, Nov 18, 2025 at 07:53:40AM +0100, Alexander Wilhelm wrote:
> Extend the QMI byte encoding and decoding logic to support multiple basic
> data type sizes (u8, u16, u32, u64) using existing macros. Ensure correct
> handling of data sizes and proper byte order conversion on big-endian
> platforms by consistently applying these macros during encoding and
> decoding of basic elements.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c | 46 +++++++++++++++++++++++------------
>  1 file changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
> index 1f9091458d72..90a48fa7ecf4 100644
> --- a/drivers/soc/qcom/qmi_encdec.c
> +++ b/drivers/soc/qcom/qmi_encdec.c
> @@ -23,13 +23,6 @@
>  	*p_length |= ((u8)*p_src) << 8; \
>  } while (0)
>  
> -#define QMI_ENCDEC_ENCODE_N_BYTES(p_dst, p_src, size) \
> -do { \
> -	memcpy(p_dst, p_src, size); \
> -	p_dst = (u8 *)p_dst + size; \
> -	p_src = (u8 *)p_src + size; \
> -} while (0)
> -
>  #define QMI_ENCDEC_ENCODE_U8(p_dst, p_src) \
>  do { \
>  	memcpy(p_dst, p_src, sizeof(u8)); \
> @@ -58,13 +51,6 @@ do { \
>  	p_src = (u8 *)p_src + sizeof(u64); \
>  } while (0)
>  
> -#define QMI_ENCDEC_DECODE_N_BYTES(p_dst, p_src, size) \
> -do { \
> -	memcpy(p_dst, p_src, size); \
> -	p_dst = (u8 *)p_dst + size; \
> -	p_src = (u8 *)p_src + size; \
> -} while (0)
> -
>  #define QMI_ENCDEC_DECODE_U8(p_dst, p_src) \
>  do { \
>  	memcpy(p_dst, p_src, sizeof(u8)); \
> @@ -225,7 +211,21 @@ static int qmi_encode_basic_elem(void *buf_dst, const void *buf_src,
>  	u32 i, rc = 0;
>  
>  	for (i = 0; i < elem_len; i++) {
> -		QMI_ENCDEC_ENCODE_N_BYTES(buf_dst, buf_src, elem_size);
> +		switch (elem_size) {
> +		case sizeof(u8):
> +			QMI_ENCDEC_ENCODE_U8(buf_dst, buf_src);
> +			break;
> +		case sizeof(u16):
> +			QMI_ENCDEC_ENCODE_U16(buf_dst, buf_src);
> +			break;
> +		case sizeof(u32):
> +			QMI_ENCDEC_ENCODE_U32(buf_dst, buf_src);
> +			break;
> +		case sizeof(u64):
> +			QMI_ENCDEC_ENCODE_U64(buf_dst, buf_src);
> +			break;

default: scream?

> +		}
> +
>  		rc += elem_size;
>  	}
>  
> @@ -508,7 +508,21 @@ static int qmi_decode_basic_elem(void *buf_dst, const void *buf_src,
>  	u32 i, rc = 0;
>  
>  	for (i = 0; i < elem_len; i++) {
> -		QMI_ENCDEC_DECODE_N_BYTES(buf_dst, buf_src, elem_size);
> +		switch (elem_size) {
> +		case sizeof(u8):
> +			QMI_ENCDEC_DECODE_U8(buf_dst, buf_src);
> +			break;
> +		case sizeof(u16):
> +			QMI_ENCDEC_DECODE_U16(buf_dst, buf_src);
> +			break;
> +		case sizeof(u32):
> +			QMI_ENCDEC_DECODE_U32(buf_dst, buf_src);
> +			break;
> +		case sizeof(u64):
> +			QMI_ENCDEC_DECODE_U64(buf_dst, buf_src);
> +			break;

same here

> +		}
> +
>  		rc += elem_size;
>  	}
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

