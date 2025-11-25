Return-Path: <linux-arm-msm+bounces-83206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4BC83FBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F5BC4E2B9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF2A2DAFA5;
	Tue, 25 Nov 2025 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8DNJsBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAfZKzb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4592DC76C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059405; cv=none; b=l8Ug9fWiYTP0XBl4QUc82150o3u2qaUhIuXmAAwP+QlwqEtCu6RxclFBymerZ8Ox4F2Z4u4D/lNhSFS8NddAu87JNQnCbPs9okMBH8Yzv6tO9KsmtJs5GVZOfLChv6iy/BnDkVhPi69ENIGQYPVVkB+evgb9XU/SEwxdl2Jwh1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059405; c=relaxed/simple;
	bh=1WGnCPpqJeTAwS8EdLDCPzsN4OcItdcygFfMHCjnnbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqSsd0CxX12gqIYH0Y4V8S/PbSVMU13q22Fzg2Ca6NeVkRi944UQkzszj3L6hiUPNch1ML1O+R6RQDTUbe0ebGUmfe4PA8nrY5FEnwuT8F98n/lvktjZVDmxvc1ZlE0RqVEdYaZ4mGn+vmofmaWdrxcgErcb+UWP7R1mMZXx3kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8DNJsBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAfZKzb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2ggAg1820701
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aN/ITqgje9DsJoOFZoFInVa0RQ6d3+W13hTAW9KIbbM=; b=L8DNJsBfT0+qDKh2
	qtmTk/43Vaq3bU1AIrvj+yYg6R0sccOrux3jCOUMOgITb+aOiwAHIh9V1OMD7rqA
	nkJ8hqsQMw6LLuKBA0qdMEOngOjDjbU6Yq9FZ7yPeIRbYS0FxC2zVM0Bsi7szLJU
	FpT7qsnlHsankM/SFhX5IgHEaMB9ePdkPQ4BNgI74bZMX9r0hkULy8gyqDOawWDF
	VsYnOn1kXq8RWh8/4q2oSg7FTZXrO+qSCQA3HslCAE67N9nhNT0Ab1MUCE2PkbdC
	WmDTDe83btf5AC6iTfxhDJTySzHxHHSTMLumFy/VXTIGJLehABSYLu+tQt6RBpzo
	WHRp8Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp6h3c90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:30:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bc240cdb249so4495941a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 00:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764059402; x=1764664202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aN/ITqgje9DsJoOFZoFInVa0RQ6d3+W13hTAW9KIbbM=;
        b=OAfZKzb1KPeGG1zKbXKtWtLexCzgRef6JLvK7MJneL1cREmkJfnkGBYO72A9BwNc/p
         LATTMJmPTN3R8H//5U7AWlA+iqeZcQWH1qJKZWPTL8MvP23tQpjOCttP/I9RfnDndv4S
         TYPhjZE88GnT+rX33d+pCNErHINUFShkoP321pJvovC8TIzPSfBj7SYDfVfpqaGTn0om
         GX285mVZXeGyQ/372+tmrTw6EEIPJmDDKxWhSzi3sZqatRZbmEXTBpzLj9N750oFNiFr
         v4UYjNXZXEHUtMUNNMGT95eM7DQJHjiQ+8mKdj2UvnxPwRkfv4hm/MI1jMGMoYrwY1Qd
         W3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764059402; x=1764664202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aN/ITqgje9DsJoOFZoFInVa0RQ6d3+W13hTAW9KIbbM=;
        b=g2LupJGQhAVISAm8nh/vuihUmuaIOvojX838l3NJhK9lAd8uPDOO6hhOJhQPj/hmRa
         EBfmzbD1+lk2sd2+E4fhC9kvcnLfsAh8MvaQ/c4UQ8XXqlnkJS8JYHVc19QPXsy63N98
         KtBt7hwUqCd4N6cQKXbEZCExfAQ7TrUJCDRraQtcJkISDFbZNHEMLqYmEWR3Vm7Ovn5c
         MSeSTcf2xgzbOPRmiMAkfrgsY01Nc0b5Hk93xru2wM4UrX/Ox2GB87hORDb+l5A1kJP1
         /pwd+Oz1inpraV9OX2MLgsnksX8t+dbyVAQaOnWhRVk41IGvRXaEHDyXHwut9EuS/Fr0
         BL8A==
X-Forwarded-Encrypted: i=1; AJvYcCVb8RLp0IxQNkDdQY1sDpnj/MRa5NAnKHa4D+F01P9l/Mv9by+orbyBgmgzPtxfj+u5bWh1HH1/E7dEQTr7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pUZzSdmhWMJ2UmqaRaOhyBI1SgDtELDo+KocQ2K3JAqqaeU9
	lZAlKYV/rOlUac/qv0tgQaIMR+7HOVLEix2odmQvY3ZR5i4TqS4/QmFaq2eHEtScZgSGZ9GtdaE
	C7XdYtXPdpDhgpHbSn7A9cN9DlqPtMNGlG0KSRGHizrRBFmIIR5m88Oo3GMhXO3SK8GDp
X-Gm-Gg: ASbGncvGVYT+UpYieG8o7lSIVNkQbu5IGtR7GZijiEVvpp6Y5BuwHEKJa6OKs1nKrgr
	t//kXGlgMAvHs2aqUtR/dD3YfVCp6TLdE3ceheYGHM5/4JIL8C+YX0BDnOdkBiNhveC9+l00q7+
	WQazMRMOrWjUFdmaGarwLeZGpI/3F59+0mhZirreh9+3wa8wYPuKaHae/l21+dSLc4PQGkCp3zz
	G9msAgEFPjYgbLlBNH0iAb8hJoaQR6seq1Vx+flRs888k3sm77Ao480wZPnarVSdIUJ+vUTVW/o
	vsmWzu7MY36auanKHAufm4x5YFIVWsCV3Xy0WGsDCtqonoN5zXRNfmoV14nysk3F2zLcIXwMDBg
	PblzqSKLmHqnvu/ZoDha7q29nlNU/TqblBZKeoFzggg==
X-Received: by 2002:a17:90b:1b07:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-3475ed7d924mr1895471a91.35.1764059401913;
        Tue, 25 Nov 2025 00:30:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG++wtm47j635PYUJgwWeknG9+9pitqDlWstYuhsyrLEo7OawPfrMHpHKk0KUPh1Cj1arWeKQ==
X-Received: by 2002:a17:90b:1b07:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-3475ed7d924mr1895457a91.35.1764059401369;
        Tue, 25 Nov 2025 00:30:01 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692ee4csm15711134a91.12.2025.11.25.00.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 00:30:00 -0800 (PST)
Message-ID: <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 13:59:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2OCBTYWx0ZWRfXw2sYrAXOe431
 1zOUgEkiPk7cYlWLlMdIVQ3VbBHjBCwmARKXylCp7H5e9jYgb6Abu7Zlys5sQWfsfVS66BWZsz2
 NxWLRnKYsrxn54TjPSzXPjVL1KuNxUN1A7DEPeyNm+uX1xyXJPeVkiOCFtxPLM9UQiHJE4BjNUm
 DR6VwR8rXypLTyt1sP3SwwQB1c08M7cyJzvKeA/LzNGiYMAMEwYhne3MG3OqxYnfuQdkfk9nd2A
 SxUwIXo5VbvzvodtYmjW6fWjxHiaqX8Os7JXEI/S5Syyg6D3m9JLcQXHLp0wPyCSlonU0lfLWmZ
 ZK1f691iK1cLYHTePQ9i45wajsW7g+CiBA31QVBVz9X912x5pIibl+y/HNi2GeeIETjr1QUOkhv
 s6fviJ97HPULFD4EjND+NM1t9gY5YQ==
X-Proofpoint-GUID: ZuFlFfFI5lN1_4GI5Gn9gLZngs9v-Eau
X-Proofpoint-ORIG-GUID: ZuFlFfFI5lN1_4GI5Gn9gLZngs9v-Eau
X-Authority-Analysis: v=2.4 cv=GoFPO01C c=1 sm=1 tr=0 ts=6925690a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=12FOtvgV4D2gsqRYbU+y8g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EtG1iFGsEZ1cC1LttdMA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250068



On 11/22/2025 12:13 AM, Jorge Ramirez-Ortiz wrote:
> The Venus encoder and decoder video devices currently report the same
> bus_info string ("platform:qcom-venus").
> 
> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> parent device name. With this change v4l2-ctl will display two separate
> logical devices
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 5 +++++
>  drivers/media/platform/qcom/venus/venc.c | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4a6641fdffcf..63f6ae1ff6ac 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>  static int
>  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  {
> +	struct venus_inst *inst = to_inst(file);
> +	struct venus_core *core = inst->core;
> +
>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
>  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s:dec", dev_name(core->dev));

Is there a reason to keep both strscpy() and snprintf() for cap->bus_info?
The second call to snprintf() seems to overwrite the value set by
strscpy(), making the first assignment redundant. Would it be cleaner to
remove the strscpy() line and rely solely on snprintf()?

Thanks,
Dikshita
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index b478b982a80d..520689f5533d 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -144,9 +144,14 @@ static int venc_v4l2_to_hfi(int id, int value)
>  static int
>  venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  {
> +	struct venus_inst *inst = to_inst(file);
> +	struct venus_core *core = inst->core;
> +
>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>  	strscpy(cap->card, "Qualcomm Venus video encoder", sizeof(cap->card));
>  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s:enc", dev_name(core->dev));
>  
>  	return 0;
>  }

