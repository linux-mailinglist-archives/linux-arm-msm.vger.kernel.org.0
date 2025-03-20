Return-Path: <linux-arm-msm+bounces-52065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E8A6A294
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 10:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E3C4189CF13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 09:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E3B2222D3;
	Thu, 20 Mar 2025 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5x807F8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7377D2139C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 09:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742462827; cv=none; b=ZKzt7onClW9E3ylejeKtNgXymghcMZ2pVD2HKsORPR3RAExEioFhhlklu1oevfA3j+dAMoWp8oj08JHt4ocoGrT4FuaROprb8tZ21LWTdwsa6r5cGONGItQmtZ6PU0YpGqJqxjxIRRFzeTl2H95T5Q4M/QNajB9mkqAlJAa9AUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742462827; c=relaxed/simple;
	bh=mrIgqAV+mMUyUP/4WfFZ09+R9paw1POvDo6IZ7RuEiI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WEejLAVvk11kSW8PlKPZ28ARzysiNuEPP+dsC34UfkqGh5tNlryB1xMPbctvpbyl+D9JVOQMODH3a7GiP1KmjdKZiEiGDo6Jbef2t7GWJc2MAILvghHJQzyWdouBazedUaUrqteAeFmZeVN+hUmTIVhIDJ3T/xEniSKyv7/U5+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5x807F8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z5OE017462
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 09:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KeHYHgSRoKLBQR4ChNEg2+DinjKOYoT9p2BUm9bLAEs=; b=h5x807F85KZGcI2T
	FEZ0TjAXf69j6bFfIU6NNTZUjv21ZQ2L/T9prIY//EHR/rvtCYhqjhTuX5n37bfE
	DMZn/HQach8XeyUvDVvF/kkF2igdsUw91pRZ5P13PAdoVCj3zZZmec/Tp5AgWVLr
	hmTOXVx/aH5wUokc5RPVWgflIJMmARFFIvxYrGkKqrs4p31gGfcnKkQyH/zRxRbk
	2G/uey3LIwRgVlt001dOnDPUCYx51MaI1fx/KZFp0vhYFY3Ina8O1K/qhCBX08xI
	+nuV/uTQbyZS865BPWfdf+5Ea6X2PCHs8ENUf6uA1HQZmgeIz21yttvBKnKirLO3
	EPKywg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbr8sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 09:27:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so961205a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 02:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742462824; x=1743067624;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeHYHgSRoKLBQR4ChNEg2+DinjKOYoT9p2BUm9bLAEs=;
        b=MPXHz9gVeMuWy+ssqU6fuBmJNBAHdyw56PAZ6RoWBvVncAXGCg8JJ10V0KbKyc+RH6
         OAeElAnTi7zvW+CTTfH5HjB4pkCT5jZva4tc5CH0VZR3K1SD96J4/wrbwUqJAeNug9zR
         cA75bxaAIWIGV4gzoHyqGpoSDEDZj8Tp3n/fbpgxNbNJ4bY5pytb94zwbLx6VfDas3gl
         Zee7MsvlikeHX1lXUBfFYhcKN+0pCW1rqTHi9mKXncK2gAyiTmSAQxxvNnbnx19ZzLbM
         +eEoCS6zBYXE0UgQFmupWh+zxgRMXwkgD+t+qx0/Emrz77ArnxhIgY0EzNN2PRsH9T9V
         Maqg==
X-Forwarded-Encrypted: i=1; AJvYcCUoxsBm8eASRczIkzIkIWVt7tacEFH/Tm05IjtgoTaDNIWOqpa0fpbO1+0HeQJL3HA8g0Jynnp61/3vmF5m@vger.kernel.org
X-Gm-Message-State: AOJu0YzLvf16Zescf5FciLat0NNkCVKMOjlK3+b0I6TQVeQFOcCeafyT
	B9yc5H4YC6MD71P4zmDjluSy5L9PtrJEnZ95OgC01eBCHpgLYTCSOjvOaCVTiHq3foSof8YRB8y
	ZHy12RkGr+ncPNj5tQGchNqTPgdGA1+8nWLXaSRRvDKg2dNI659+aS6kMs9AKdN8e
X-Gm-Gg: ASbGncscX8ct+QLaAOtVQR+S3sODlMDoZNTWuGN2d9d6T9M2jtPmJ3z3ViNFKZp7gYw
	IX0ENLw2vLAfwEeeMpIFmHBjiFxQMaSG/6O3Pzs/GiWsutqwVeR7oFVHUUBmXlz2/ncf1hO+2hL
	9rmzXeRGQTuM7hzwkj4n4A3ny4kQWgwOhMp8SnQ4thNsiQEXaINIcIb8A4iY49YbASI/kwOxd9c
	8LTHrMtjvnBJCvvcBJ2f4rUb1rBo7t5KqHHhUncAz/iMsCyypDKlrJQVjZ95lH0fGlMiLgOb7My
	mmaTjsh520ellhLpt2blOVSjTYCw9Y6ZEZsbClxl
X-Received: by 2002:a17:90b:35c3:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-301d52c9d71mr3683773a91.21.1742462823702;
        Thu, 20 Mar 2025 02:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpGvrH1EWOiqoFrxiYDGBjxuwdnasSg3FLzSkenBU4hTM8xFgoe/Rl+VzdbYGqcHraNoYMgw==
X-Received: by 2002:a17:90b:35c3:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-301d52c9d71mr3683748a91.21.1742462823281;
        Thu, 20 Mar 2025 02:27:03 -0700 (PDT)
Received: from [10.204.65.49] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf575936sm3312292a91.4.2025.03.20.02.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 02:27:02 -0700 (PDT)
Message-ID: <09a4e15b-d951-48c9-9aeb-103b6b293a97@oss.qualcomm.com>
Date: Thu, 20 Mar 2025 14:56:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
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
In-Reply-To: <20250320091446.3647918-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67dbdf68 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=98RdHtkJ8WjIMYe7nFEA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UMihSmdeuDm1eNUdDh3ZBpuyiIM_GyZ_
X-Proofpoint-GUID: UMihSmdeuDm1eNUdDh3ZBpuyiIM_GyZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200056



On 3/20/2025 2:44 PM, Ling Xu wrote:
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

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Thanks,
Ekansh

>  		data->unsigned_support = true;
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>  		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);


