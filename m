Return-Path: <linux-arm-msm+bounces-78099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA9BF5089
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D26F4200BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 07:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3C128D82A;
	Tue, 21 Oct 2025 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltFx4HXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F304628469A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032615; cv=none; b=U6JRWR4uwh28jt5JXsSJ91DUHeOs+DlBT4vLL5B82PnpuKV11oADuDHF6zWoP9O6nWKofXy2SXcGpYBk+8bAO6PPalNeJr5+M5LCwdszWSc1KQpfmIYTfCnlD+joST7X9kl9DEAwjgXJ9TIGu+Vq5DAEQxMPiRpGuMLS14v00UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032615; c=relaxed/simple;
	bh=UOGYTjjAne7jp0gN/Bh1ycgyr9fzZfnapktjDlzWN/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwRoyAnxdI5LbIpwp3i3uxygbQFxXkLPLJO7jjMc57eHnVDnxPQ/N8QpUk/cSY7O6HapK9xQfnySMHQuP3hJ/E0U5pb9ysP0xFi/yrnngim7yYMh2xSE+SOyfbMgFUu0LiiuPxHopWlZo/e52MIFOqcgOaIrNcIYPboGdFY7zTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltFx4HXK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL0rJN004647
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVfeUMgTBM3CAu9I82wxAPql1NahbWchYps+Z870ydE=; b=ltFx4HXK32YtKoIG
	dPPJ9j7qTS0KRq3oSn2CdYQKPnBKxUBOSpJ7njjqExchM/8QdicODlI792/0LJ+u
	VmpAcfhLl9ImsFVWfasGE+J0gzc27btfvV9KwHaYCElLDnrKAk6pgtKX/jcuHbDq
	3RSSYFCxQdbNyXx1ebQagbNg9M9AK3sAz2l3PETm+EeKdT6usvzNvS8rzkx70ci6
	FwKKYrlnbs6t7UNMJFUFs2p1NG7qox8DosubMukxiGieecsVI13SY06/GRs84KP7
	q+O30KYg/Yn+Rxxe/EGmmPOy+tI1XcTjGrm9VOnq4w8xFO5vTs0s6Os5BVlWhBUs
	f725Jw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nffhuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:43:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6a2409137dso4251699a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 00:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032610; x=1761637410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVfeUMgTBM3CAu9I82wxAPql1NahbWchYps+Z870ydE=;
        b=HV/HzNB2MgU4hn9SEnNuadYKJdbVirpPxLKnSUy4PggpbKBlP9pwwlwFmrof1/IODJ
         LwwOtYZA0I3VN+LE3zMf37SUdP5qqVOi7VkAD2OWIqcqbdKjXEtXjY7dQp4pYQJXSl0/
         hZZJe+5F7cNCTXkQie51InMW/kb7OorhXabNIyvwnkBEWkpcXw1FwQgHCf+ADh4kOW/N
         zBRNB/QOgMx3JtpuFF8AtguKd9k+8Ai7Aya68YzNisvDQZaNIM7xRzABs7/9WVfHiPaA
         nP5lMv4jnsLD4amMdQA1j5mhGRw87vLiDvfO/Ar0Yicne6LRdR5h+0NwULa49fhcNZOK
         ntKA==
X-Forwarded-Encrypted: i=1; AJvYcCVpw1ZB1egxV1VrEIZcWGgCs7+7GwyASMrdQbgXRHC7osQGcVHbTegr40kGlL/NGfAVmhpmkduNCdWM1IpB@vger.kernel.org
X-Gm-Message-State: AOJu0YzTTyDLaIMkoT/4AI673WZb/4QCm/Nbgu4dg2jnZtQmrp+DL+UR
	QD5qae4S+P2v4nvJxjVk0ZCu5iYpVJghV8OpXBakFmTgG5wb4RNtIdBeoSEHWaKo4LN8Ekt6l3h
	pwLb+ieRbwRtaizgK9ZULHAvDyzF4PjhN0+ETGzT5AQQI4pgNs/rIFyCpr6wCqtdHc4sw
X-Gm-Gg: ASbGnct4zeAaIwP9g4AxZ4PScRn/MiT+XX49YKpfITtPOr7zv1fcn5+VElfc+vj0Bzi
	+LbDe5qu7H5Uxpyu5K5q2lmCRtlTkMG9TPpV2GILvauHv/fDgX8uyJOUD9b5mbs6/wnz4HOUfnv
	TR4vgfQLSMTi+iJSbnqNq/OFFGOY9XcVaN3rIsLgcCYZ6hGDtXjqjFRHpE11ImcSiTG9N35U0Rf
	G2YNMYeohaC6C5ZZ0u7BrVQO1X9NxKe6knHgZSw6qCtkV71bTgqfFoataHVbDDvObZk4/sLOyVK
	+QSIK3m4wQxwee0Um8nlUL6td7bpxpB+8wKTAZibq3IDvtppetd8c6QxvEWyQTadmwbHXn6ihoD
	DWMRLubeDJnvVrY2ZlEa155kkiKNmW/+cjgFlsN7T3YVM2WJQxqR4CtPxLM/GOuYO
X-Received: by 2002:a17:903:3d0b:b0:24d:1f99:713a with SMTP id d9443c01a7336-290ca30def8mr218012465ad.31.1761032610247;
        Tue, 21 Oct 2025 00:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr8+0hmXEglm2VrONIYQuNr3/IelIpMrr9RaoeoOUTL0/N8ALs8rMkTd/VGSWryNSxw636ig==
X-Received: by 2002:a17:903:3d0b:b0:24d:1f99:713a with SMTP id d9443c01a7336-290ca30def8mr218012235ad.31.1761032609750;
        Tue, 21 Oct 2025 00:43:29 -0700 (PDT)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebccf3sm101559935ad.1.2025.10.21.00.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:43:29 -0700 (PDT)
Message-ID: <7d81d7be-0752-4a95-995f-3477fa274466@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 15:43:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
To: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w_4URVrDdDjn6MzQIMfcI9NfQfO5hWpj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX+mXqOdKGliPf
 snIdx99bGwoakMzPxkLlO/NF+qL55ISQxzz7uoBhXrfqq7I4Fz4sX16TctlSiKqvCGQNAvwlcJw
 plfsjc9er0TiRUFw6klj9x0KM0X5vfsGVrBteqK1Js64F0Djoe+hWa4ZqKilkVI0OYx5M5s34N6
 j5zYztskjEhsS+zUpOh0TkYhWqR+xk9EIA93xqqm8szkSYRkAE69a3LCeRusz4gqDp90q40IIJq
 VpqSJ/MJtiMcJca4UMecR4aaFBG8j5D/W8V/WqP05Le1PrX45VF6Pq+hkdS5tCmgRWxI4X49OXE
 n/I01265pV7bGhzMFUxDMITCh/g7VTHvOkGubx51tVsjcCg0nGbTrxVN4pTqjFToYpEH3GmCW7R
 /k2dOTGb9Oe5vIpTMyJsMDsWwLPloQ==
X-Proofpoint-GUID: w_4URVrDdDjn6MzQIMfcI9NfQfO5hWpj
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f739a3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yZ5FxKY4llv7UqssUvUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027



On 10/20/2025 5:06 PM, Xiaoqi Zhuang wrote:
> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> and enabled again, currently sysfs_buf will point to the newly
> allocated memory(buf_new) and free the old memory(buf_old). But the
> etr_buf that is being used by the ETR remains pointed to buf_old, not
> updated to buf_new. In this case, it will result in a memory
> use-after-free issue.
> 
> Fix this by checking ETR's mode before updating and releasing buf_old,
> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.
> 

missed fix tag:
Fixes: de5461970b3e ("coresight: tmc: allocating memory when needed")

Thanks,
Jie

> Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..3e73cf2c38a3 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1268,6 +1268,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   		goto out;
>   	}
>   
> +	/*
> +	 * Since this sink is already enabled, the existing buffer should not
> +	 * be released even if the buffer size has changed.
> +	 */
> +	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
> +		goto out;
> +
>   	/*
>   	 * If we don't have a buffer or it doesn't match the requested size,
>   	 * use the buffer allocated above. Otherwise reuse the existing buffer.
> 
> ---
> base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
> change-id: 20251020-fix_etr_issue-02c706dbc899
> 
> Best regards,


