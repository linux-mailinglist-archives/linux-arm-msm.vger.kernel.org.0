Return-Path: <linux-arm-msm+bounces-65213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EDB073CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77DB94E812A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1B62F3659;
	Wed, 16 Jul 2025 10:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDqMyDRL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C72F1FF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662673; cv=none; b=jWFWF2cLK9QYy8ZPwwwClo1/EMeonWPGOkQQV8UGSWnZ9WJaN5GICmufqhp3V+PNZjlMrcq7N1AnEiBspvFmfeIP4GC1rYVpEky8IOwOR3P+UvUqSRWF+HHTfaD2kExHWDKkr7HAYF0pG+L1pzdGSkU+/2ur4jSrllTKuTQpSx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662673; c=relaxed/simple;
	bh=Tin8r+U+w/3y+LP84mrbjl934s1RYjdcEk4TcBbna10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOg1i+7IIJg1MaU3CalCbjdE7ux1OG7Oahu7ZUeP+HrLM+zaA8H5C0/NIkaXcCgRSeSRRaAhDzOnukVDDlQeBw3gYKr2ztCZ9Rk1/eWMxN/pd9Qir24CtGcBJnpxN6Dlw26T54Ot4i30gNDNdBiJBP6fE3avmUi5pLR01JGGH6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDqMyDRL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G91Hb9012368
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 10:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GwojsqO00L46el7Hbe+U3o4hx2hTDdeThYiZKwFHZxw=; b=QDqMyDRL3w7yoE72
	BEOQUgysZCP0FV8AwWjuS9dyoHCrUtA4l1s4LU7ErFNnPgS5mRpIlVRRt23sBzw+
	vvkY+ZgVylMrGMiw9yI8g7weJO81zikOKoI4buzIx/yQFVj1auteKDEPApKonbC3
	4lPZmhQ453+KgEeXrSBS0g6dGCQdOOUtIKdtn4Xw/CT4zHQrha3lr/x1mF+hZHhb
	oByoe7fRpi4TRLITCxmRj+xj88sWFUAaAvLTsF3mJ/4H89ZbURMIWgZpzPghVFGd
	f8nN+CP44BAEyzTfrNL9ou96L4A89JcH7tf78kH01sd85JnuJN0bPUP6OU7/BSOW
	q8sf4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7gbpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 10:44:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a58580a76eso2700101cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662670; x=1753267470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwojsqO00L46el7Hbe+U3o4hx2hTDdeThYiZKwFHZxw=;
        b=EhUj+Hzec9tYJtEfASUg8PQt9lrsXO1h9NwDcIMlcTqGQTO+GNtFJ1EBHjwi6bp0R5
         7nz2QnkFuGlpJZ7HTiUGgns1vpFSsvo2N046ZMdn37Tf6h6dyAXGPlsgRiqDJlUO8t9+
         6S3Y9typQZw0en3opHNjcxzIM/1PvqCWvF0ZvlfWqOH50rCP9zegrZLBwkvpsG7urmLw
         DCWE86Do08QH8IJN8m94GJaX8hR0SLafGSmjz5WV8u2o4jx6Sjp2vYHvbxIXsjxoWJnd
         HGTA3gJYsgUsNuzlHb3vX0A7U/bcto0NLf11/bege6Oc24hXWTtBj8dCPOLIvEdBi+Va
         /DHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb4hyiXN+ZYQFcB4yzxjONfh1JTfD32yky4GXBSTBdrnXIQliNiOm6w+XZgnHhKjLkmOeeeFPXGAYlyasZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhb9VA9Ny+07Tp/9NUyIwZVO/Ix5+km7kBE+Y5yE+McYC1on/
	ZmgT9QZKmyQSZl53Qtn+UlcE7bd61saZMSURi6+nlWoDHucZKGjoiFAJys/Jpan3SCUbnfBjEut
	u9xXV5ln/uCVkNciiMfdzuzgeumIcIOGeBu7voPI/onnx/M9197YNulkPqglHPRw4sV3w
X-Gm-Gg: ASbGncs7HOrImxgT3gffQlNPA9pnAOZCDPz/4frVvxKdTmw08l8GbRoHGvWruBhy51G
	6mx+vF5H1dcqSaseF9ESboyBuR17t/913jhnnj20Ym1SOJ4hhUrhW2zw3Qyv8Xe7HQ1lQD2adrC
	jgKrVsRRZRlmK/jROrUDIEJK7KLaLniMlOFjNHQucvmDSWb1Ytcg8FNrwPHJC5AOI9PDNhyvUXE
	udz4UDEbkq/yGpYNFdLQ5H6X9TCgE7cUy7e9laym8txOPNLggYYuOwTbArqIb5YyVAtBS51+HaO
	+jsSKp16WJd8bS3W+ffFYdRLEBNlqLfnoTduviL1FcxXxPpvCQvyhwblK6xVFSGa3Xyu+BQUwnj
	y375HjUj5ErnThxIFTiCl
X-Received: by 2002:a05:622a:1b20:b0:4ab:806f:e30f with SMTP id d75a77b69052e-4ab90cc3a56mr14294861cf.14.1752662669713;
        Wed, 16 Jul 2025 03:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9VYocXZ0PhMt9kgWk1/jx5BjJs0UQSzRLjaw/6hz7Y8Imt/1VQJqU11+DAf4VNiNJClKZrQ==
X-Received: by 2002:a05:622a:1b20:b0:4ab:806f:e30f with SMTP id d75a77b69052e-4ab90cc3a56mr14294601cf.14.1752662668802;
        Wed, 16 Jul 2025 03:44:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee45ebsm1163531566b.43.2025.07.16.03.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:44:28 -0700 (PDT)
Message-ID: <697bb6b0-ecca-4392-9e7c-8d4ef75ec96c@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 12:44:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: ucsi: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA5NiBTYWx0ZWRfXxayzMtxBtbqz
 Y3ick3Dc+lMDDh/QkalEuEC2XXrI5s46wPv0j/guuIkNiW7S5zGSQ74zlpfkFXanNtTTgK9oSeR
 oEQEco/EBQfhWyTerc7BnZ7CZSjSbSiZ81NNGc5kWLuVVLOjGvJikhpr74g6AGymhidPZcsDouJ
 DRt8Y3c/0VMAAIoYyikcH6BtoCXApjixWM0xo7bqTV35SWiWRamKbRzOD3VSuj08QRsMiU5mWwu
 720qUb9kAM248+cwJezGt7tIu4X9f2wQDKkF+5eYF55ifzc3NklW4/t8nCQ98JCIdOs4SPPLMC0
 sFPRdo2dtpgIaz5r7TH9IY8eeeKt97YnLyn/Kk11JTvHXUu9Hb/h4WlQubBF8ONyYBpUq0J7M4J
 i96b3tBHzSNBEs96lmA/emqUbYltCyOhxePeo8Cml5/Z/MFSCAcJGVIKPMmo7dK6hfkEUOwT
X-Proofpoint-GUID: 79NB63eVp8JSWjKSWLIs3dTCJ_72qptP
X-Proofpoint-ORIG-GUID: 79NB63eVp8JSWjKSWLIs3dTCJ_72qptP
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877828e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TdU0opj9kUmyj219TpoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=385 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160096

On 7/16/25 2:52 AM, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
> Changes since v1:
>  - Defined buf size in terms of other UCSI defines
>  - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
>  - Removed Qualcomm copyright
>  - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/
> ---

[...]

> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {

You mention V2 everywhere, but then check for V2_1 here - is that
intended?

Konrad

