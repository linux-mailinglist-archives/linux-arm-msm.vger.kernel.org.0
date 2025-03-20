Return-Path: <linux-arm-msm+bounces-52073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B50A6A3A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28E743BF4F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 10:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2FB22423D;
	Thu, 20 Mar 2025 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4cj1sGn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C173E215783
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742466527; cv=none; b=ChddBPelMA1OSxY+ESJPy7mIJFDUOU5MQ3+Qn5AZamHTIx7TB51quWI+i+WAnHTPExW7otbY5lOZfsoeAOw0J/6UUag+M/YeblcjpaS2pY3bXEs/hTx/xQnBbPvZZPHiTWzfGdz70e+5oX4wRuiDteFLGLkAs5U2AmjbmiJ36X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742466527; c=relaxed/simple;
	bh=uKLOxDij7c7sdT8Zk1Ksoy8JUZVDpgomJWrglxeAbhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClYGG/wh4t8Cb71MCa63ikbZea8f/+I6lv74T/LJyXhNFAiy0Wa4AcTJopYFHbHNmjaDHBLotDnZ0Xumh1bDJuP/KjTFX+4C7IMnKI4TCH0QvSR0gEt0ha/cGGAUni+q5aZLjQlczHxxHx1EzVWWQXhkQVKc7D7C08p4keQb2mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4cj1sGn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6ZFUt006094
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 10:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7JCFxJENGct7M1n7Kf+6tvuHHB4HK4sMdAZpytvjcM=; b=h4cj1sGnX3jHFcpd
	Y/V7raEGTWPOS9mM35u/HRsKdiQTSCVklabyqD8TAGASorLC+Dg1/kC44VeoObuQ
	vDLZBz20Ebgb3lwitOAHGVcYqT88UgSNgqw8eZarU4esArZwCnGaDKzo7CZA5hRt
	GQRjwY4CulEsIhndQBRBwQlRUS1ImEgfHZ+YOgInELBwT7jU68wChIwYqHbHXQKH
	Do/nW565edG7cVdUXf0KdnxebtOsFkoVNQTmy1Hnq78DOVMX7SPuLg6i8CQS/5n3
	OsDhKN2gGzMW0351kW1ex3uvoxkNkhg0Z3RWvKfJ1Q1o+so5hrQdv0Qoxi2WuZTY
	Tc76Aw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmc157e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 10:28:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8fec7ab4dso1326536d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 03:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742466522; x=1743071322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7JCFxJENGct7M1n7Kf+6tvuHHB4HK4sMdAZpytvjcM=;
        b=ZJ4T7vMrsPbxSmyfJY+vcbtgiTbYAwZVNwV4t4KwQ80/a7IbDSFP+LpbbKfdGcwYWU
         5hVaLm9TcAV0MVJwMrQ5xWFFy5U8lzPy0E84GcU27JWVjBKjow80YSuQW+XPOlhEIHnW
         4sf3P/zTdzXSiMSVAwuKzJDzY1gXIiSD7nDS0SUiVg5cKF/6p6jeZmmvsfxbu4FD/5cV
         2sLkjvW8V6rTBQhFaGhRAMMMsaBoi1mERr1sy/DIC5fB4y7/RfqPeRuNypV7z6gSlQMl
         MA/auXPpioVHKxWpaiyemBQ05//dI/RNC0mP56rXmxdUd5UyjZ/DRlU+N0YWxTS+ZW6n
         4aNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2JQXTnqkl5b+m5wxQcq49dB9QmWZM9PcnG6t5PwtJjqp2nS97Hf+UfniQUX5m4al7geBDz4+772XkBJ9/@vger.kernel.org
X-Gm-Message-State: AOJu0YxNAdnC2ErstFrqXp3GRAu+xX8ymByWpUbQNdyAT9P776wjboAV
	z0uDmg4qku8DY150yVt9ZJY9Hs4IHBRGjNTnGwTS71q0mV4NZh7XjM+7WhZ6pc8zFuPwKvNd1IV
	qnQaz+3K6KoEkasrtfA16b6L4+Vr1HKjuoiM6typ4F/9vHXHpLXmGcFeQgd/wZecW
X-Gm-Gg: ASbGncunxDbaM76+2EriyJsYHOXA/fxeZMIjl96CCqBbGcnpc0NyoaYM9bAuZbUPOt5
	Uox1u6Xk6Otho9rqw1ScniE9d05dUTcgmELYeh2FVb6DxFMe5nkEVanqzMhXuNK6uCST+LsPNiV
	QLk/1aHNfuy1DYfen3uWFuu3ENijCrL3DniOKQ3xgo0035dFZJ6tuFlgUDtdcYuIuMgrRViM9pm
	/nS+3Cb1eN+aOWr4ZnMDqtRV8NYS+XDrHc3hLK40RKfwrud5ZHQ/VNKvZJkr1sMpNWg4zrQ2Fx4
	7KVN4C+5dOWONlQgpruAYVhPEJh48Lcy0lkioGsCRsTbywI+ozsYOWgYFv98oM0+jLrQfA==
X-Received: by 2002:a05:6214:23cd:b0:6e6:62fb:3504 with SMTP id 6a1803df08f44-6eb2ba0c59cmr29712136d6.8.1742466522647;
        Thu, 20 Mar 2025 03:28:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENDiGX/C/TqtQC7A30JrTt6Srt5dzpSfvmRqIWtJNoV+GAAS2k4SYx2YUt3qrXWOs29AJnUw==
X-Received: by 2002:a05:6214:23cd:b0:6e6:62fb:3504 with SMTP id 6a1803df08f44-6eb2ba0c59cmr29711986d6.8.1742466522225;
        Thu, 20 Mar 2025 03:28:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ce9a9sm1138534066b.110.2025.03.20.03.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 03:28:41 -0700 (PDT)
Message-ID: <3b4c816d-d7e7-4029-917d-f519a75149d6@oss.qualcomm.com>
Date: Thu, 20 Mar 2025 11:28:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] misc: fastrpc: add support for gpdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250320051645.2254904-1-quic_lxu5@quicinc.com>
 <20250320051645.2254904-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250320051645.2254904-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o-B0-4ASAe6lg0xkUd0TMHoCdLhynFBz
X-Proofpoint-GUID: o-B0-4ASAe6lg0xkUd0TMHoCdLhynFBz
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67dbeddb cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=0IcnB8eo5JocWn4U3IUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200064

On 3/20/25 6:16 AM, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GPDSP remoteprocs. Add changes to support
> GPDSP remoteprocs.
> 
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

This sounds like a good enum candidate

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

And this could become

*domains[FASTRPC_DEV_MAX] = {
	...
	[CDSP_DOMAIN_ID] = "cdsp"
	...
};

etc.

Konrad

