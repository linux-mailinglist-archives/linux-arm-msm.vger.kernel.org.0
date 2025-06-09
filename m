Return-Path: <linux-arm-msm+bounces-60590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3052AD1CE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8185A188BD90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9DB2561DD;
	Mon,  9 Jun 2025 12:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nx/UDdDg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CAE2550B3
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471175; cv=none; b=jiWrwfpeBFdO5bLqowvyrrUO26EgcmNXdMfj7zGG6x2OU3yvVuflJmnEZshjql6Vm7jFSMiEpIgYso2CoqIQtN7uEWsN9zQXedZ3LfEOtExAo2KSghafTHaWV2Jkiau8bmcIS4hkMFktimZ3SnbUD8m0CuxSglBhS8kjaPYKOa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471175; c=relaxed/simple;
	bh=SkYNBp2tGs+KkKatm/7UabgqugkSjHvT8/wNzK4u0vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/20VIOeLes0QxnwRaD3n394fKIkbeYHYzqqlgpysPi7k9RVxWlBQ5oBcPHWt6nlBmo4xcR/AnGAI9oP8gBQ0zyeXveqL1C6X0TaeTgW1NpYTVBCHdSNa1Mbyxm2aW0dXCyxGRaRGe6GMTJN2YGeJF4R8Qv1NoZ96cNm3MKPybc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nx/UDdDg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599Ljn4029862
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 12:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozx1cNx6vaQiGhztUqHI8rPbCJVrrhmKdjb2oMY9jXM=; b=nx/UDdDgQ4IIJ//p
	ECPmR5ls+/cK7p0h5ysYtB8+Ah5eFY1k1VKyBkyOGn+cidcMPDMH3BB7lhedvKdI
	MA4+c7SBa5GRI/ct4Cz9/BT0FoYwFZozhKz3LbKs7uYc6TSiQh5HNhoUybwY7dP9
	BbMWHZ4ayW3vdaFw8BXUPkpKfCekGssxB+ntEhkvhQg3MsrrmzYNMKb7L2fA3Ra0
	q1Npl1g+pd/5OP5EgQjgTt0DKKwv5ocajGSh5bS0UVscLA3rKPLfPZwWzOUKE73Q
	LAFK6Rmf3MDH9EDQMiQ0MjpYhFSv3OouLKcp0IJhLY8ju04G7D2SPiUWhcc/GsFy
	cKX6ng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcdqw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 12:12:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so662397285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 05:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749471166; x=1750075966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozx1cNx6vaQiGhztUqHI8rPbCJVrrhmKdjb2oMY9jXM=;
        b=a4cDs5syvUy4ZPZU0rmZbcRQsfb3sBQYqSF0O/C8zafzYnT6OLes4mWByvgFJ4nldM
         wqKzxT9JygBllNVSyenu28U3ariKsXgQayPeZCHpn7hndVAdhbzz6EMmNfRhzSiZK9Hj
         t9XhJmD9isJfeIx3PTJd3i1S6dFYjij3R7MRNzU1C7vuvUU8PTUytuySvzjZGICIFBlC
         dmN1s3RM4Vpeb+gXyDiSpJB4vHCTQ/trZiUYe/UDkP3geMiruafYZzhG+H6EsUCXIokl
         OMYrnjBBoiVc5OVAjoPd66hruZMFiq4Kff7Nj9p3UMWaklGr02FeRGFc+/cSrqkreXYn
         3BHw==
X-Forwarded-Encrypted: i=1; AJvYcCWnCtaFBYBj1P72jfoOWcVdcmaXoGlEgZ1ADHIWRcTlQcU/6NuNBow8kEB6RUUyrYsqL/G8EY5dAI7lcZnP@vger.kernel.org
X-Gm-Message-State: AOJu0YxLj0+Px3/sW7sKa/8yYki79l8bicQ/bH6/UUqIYuFVRjKRLxT9
	Psqe2JWvboLQr8j+Jn+ZZKjnxor5nINjzisjn6fTF+FXYycF0D3F0IrTzR1ddpHHz0DQ2EYT7Mq
	VtFmddloRmM5HU9z297xWK5XIns9gUzebKjq4tO3W0Zsq4kQQRgeylWYdSS69zKVXqlvk
X-Gm-Gg: ASbGncsl9rdTLHEhMFdSxIaKTtQDHFTQL7gnhktkCZvKz0XgnjNagPnGNCBM4FkSzof
	qZePtm7GgqLriG26dqamNdQbjaOr5cSeLG0TZlVFjOVwrIYrKzJECyGvkv+unzK7VU7Nh7+Ig1R
	9Uf+qxR1pBI96+bCATN5rmIwRyAWUD/AUj0KlEi2qZeRet5EdtLGoOBVVYUNrAxONcM+hmTm3f6
	fqh1PWHtdQKQDHuVEMM9WwCSW9J87u5u8zLN01lGWQtUz5nNu2Ilq4wvLTf6EGXzxss4fOHYp0o
	/vF5a9ZlTf2HgIGlNHFZ6TErTQJe6072QDrnxEV9zkMYljtp
X-Received: by 2002:a05:620a:45a1:b0:7d3:914b:abe6 with SMTP id af79cd13be357-7d3914baf06mr669830285a.23.1749471166661;
        Mon, 09 Jun 2025 05:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWvU3u5w14J+qlrmR9XemVZPLaY5kePeOwYsaLUltPqBZJ+np6mmxSmQWTrNQY2VReY/jN3A==
X-Received: by 2002:a05:620a:45a1:b0:7d3:914b:abe6 with SMTP id af79cd13be357-7d3914baf06mr669827185a.23.1749471166299;
        Mon, 09 Jun 2025 05:12:46 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm110438475e9.39.2025.06.09.05.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 05:12:45 -0700 (PDT)
Message-ID: <fb03dd8d-8caf-4861-b56a-2c10b070e2dc@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 13:12:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: demote probe registration printk
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250523085317.11439-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250523085317.11439-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MSBTYWx0ZWRfX9gocSu0l885j
 6fvIBpPYim/hoiSVQYRY473FNYLeVGePnRJUEzdplpO519RYq1jYX2s/8D7f22OfFkKaUF2qsPc
 ozhaUuQGFIFLHc4J9//ECvr859QsEzdSgCJXAKDvT9IeIK9MjjGJ/DKDI5PQ/FjJEm0/AW2iOro
 ss2d59a0qBbH7J8lRZtydF+Q56rMO77MLqupopnNxqCZaH09A/DUn3hlk3ibImnXFpQPhffzGGd
 iJOOWnedjVW8bqADmkpCRozUtambeTi3XyszrlN24v0GSteqvLJTiG237X1WvflIKSSYEKwbYv9
 hZiLE7bV8OcP5sKmqhfTQDzG1jPO37IJfw9ZLOeHckScuhPoIhVXnMzWv3QQxneFQF64Jqs4B1H
 qKeFPQaFX6rFa5ziEGraOw8hvMGY1WTlU09KgDktr41RLOcxebWl+yG6Tlus+hAnTI4Chn8H
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6846cfc0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kt4YovZ3MTeTNe02vhkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Ai_mAkgDKPQeBzN6z7jGAv94vMefsOM6
X-Proofpoint-ORIG-GUID: Ai_mAkgDKPQeBzN6z7jGAv94vMefsOM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090091

On 5/23/25 9:53 AM, Johan Hovold wrote:
> Driver should generally by quiet on successful probe.
> 
> Demote the Qualcomm controller registration info message to debug level
> to make boot logs a little less noisy:
> 
> qcom-soundwire 6ab0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6ad0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6b10000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6d30000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---


Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  drivers/soundwire/qcom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 295a46dc2be7..3265c39e6b51 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1648,9 +1648,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_master_add;
>  
> -	dev_info(dev, "Qualcomm Soundwire controller v%x.%x.%x Registered\n",
> -		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
> -		 ctrl->version & 0xffff);
> +	dev_dbg(dev, "Qualcomm Soundwire controller v%x.%x.%x registered\n",
> +		(ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
> +		ctrl->version & 0xffff);
>  
>  	pm_runtime_set_autosuspend_delay(dev, 3000);
>  	pm_runtime_use_autosuspend(dev);


