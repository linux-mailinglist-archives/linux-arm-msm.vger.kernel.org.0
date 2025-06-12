Return-Path: <linux-arm-msm+bounces-61059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A431AD66AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BB967A3503
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2927263C;
	Thu, 12 Jun 2025 04:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBitBQ2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6352879D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 04:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749701726; cv=none; b=hIJn0SO5AG7tgEYcJyxSAR8f/ZdIV87P6Le7FemIs9ur3WRMqocAi/fa1xaVBvNkAt+XFCF8FdQihZsuwnAVqJs8Aa/gvCN4nYKnwpclFBd3Dui2WIkNPvh5r8uA0GNe/DvdVEVvzqFeYe4j5/3es5muCYoeZ6UqejKTxhlPnEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749701726; c=relaxed/simple;
	bh=lpAkSVoyxNACPdIdnN1idWGDw6nN8KK/jKqoSvbsz2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3/4JRHfR1JhXPtnocsbiE15wXm4/bA7ZX2yZ6E0FE/R44Re9MD320ndReCxOi56Ptk6r1BiSF+BwAPGbCZ4FG9diALiFGzBH8ly31SCm+t5fA00k7e8vKqVYhF/fXDSs+yWhAtIvN1IdHSP/b12EPYKO4P5v57GF03knyV7O5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBitBQ2u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BKDHUG027198
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 04:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlDizTZaRy01LwN7t9CKJYpTQ9cFtd+2yQ9Q6Pk8ShY=; b=SBitBQ2uHh39FlYM
	D2J+br9uu2y7Ug87feAwrBlT1iYzqGzHcZjelg2+MYjw/1/g24fL1hyg8j+sgXIr
	88/uoIwUGLJfliokH9+zFb7Wl11Csn0e88ZijBf5DCZ0jE5j8njJYsAqUjl394Gp
	ioGsyutX5i3hbV51T1Ijiml3ac4go66wenGTTKKcWCAYM36TW02t4+yDbbVYjEow
	FiykS0bWXUwSpjXipiNlOP8yXgavz8qjtgTQ8xupzwNwBrurYE+eGgm/wK4qwtJx
	Gbs4pyUqH+u0ozvUrkbhU6PqqRUr035opLmi9wuOZswi2LZpiJO/7TC9IyM5tJFp
	zOjtHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvf340-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 04:15:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2354ba59eb6so7877365ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 21:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749701723; x=1750306523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UlDizTZaRy01LwN7t9CKJYpTQ9cFtd+2yQ9Q6Pk8ShY=;
        b=GC1mXNEM7+RyJWrYehspGwlAqj6PSXONSPDbq2qktp4+7tfhVwsXMrkZMr8CYtsLJ9
         jU3zIqVlD5dGq6cScbzM0oCMa5iBFSJVV+TAXk6Tk5wBno1TBATwKGJFNOZbFVoWbFEy
         kqPh5rNnwvfTqd7is/mOh5sAQ9tXgIpvxvxGoAoVgRs631s8ZYJruEKjgY+U5fDSvKrO
         XQMoenVFHaIqhuUFwO6HKN7WCqldP+snUC835E8Vg+rWuSMkSBH0a3ZcIekUByNg0c8R
         M7FiZOWN6WYsm5zOVDZhIW6pM6EKDDsiJ2V9Wi4R60bs39BV1lQ9Jn44Pv7W/j1YfmhM
         b+3A==
X-Gm-Message-State: AOJu0YzPfgMdxATJiqHCe9Fy2arM6ZFoTjC4K7pTwoIV1Gu9g2N+UwHN
	jEzW6I2dsBf7jMzaLECX+WfBwz0pBhx0t+f1Hk4dCfkS+KRU2s69hB60c0wXunQFDwnUxJsHGen
	DVkcWxv1AwxbAi9i5n280fy6FyDqwlok2tNqbNZAXWG3TSyKdRjGc1fbhXPQKRG9QVt1FAs9dWO
	Rh
X-Gm-Gg: ASbGncviB66hhJdLAOeYo7s3NRyCj9IgzFpQPbF9G/kQF2oGAmQkyCSYYdigb+wzCYB
	BwFwwyFNOeRFUUofk23Drk+keDMgWuGTjQYuIpid1iulF6A6d8/gBFts5xa8F/XIvzu4zoUMNDZ
	Gk3kGX5tRAn+tBQQhhvWTIkYQ4W7wHsHYPI1xprlLCERdw8iX0Tle9Uj5IdEkr5EulP1UIb3mdW
	rrVezPz5MYZZKu1X3a2fDIpxZGvBcuuYachyzvGYeiPn4vt706JCsO/CZDhgWVTzV2BkY9XkyY0
	JW2g5XWPVJS89veRVymSEWcFZCOwy43ZkhcXwOGVsKtdWZ9O5jbleo6vPGtzBBA=
X-Received: by 2002:a17:903:1b6c:b0:234:ed31:fca7 with SMTP id d9443c01a7336-2364ca8b2cfmr34435435ad.48.1749701723491;
        Wed, 11 Jun 2025 21:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjkJSZxC/UbgF2f0dDkWH1U92D9XxBYEir3BqtZ8ceLq2lAdw/5hGuqWNSleFNh7omefhGvw==
X-Received: by 2002:a17:903:1b6c:b0:234:ed31:fca7 with SMTP id d9443c01a7336-2364ca8b2cfmr34435135ad.48.1749701723040;
        Wed, 11 Jun 2025 21:15:23 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e732edcsm3945095ad.244.2025.06.11.21.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 21:15:22 -0700 (PDT)
Message-ID: <ab70258d-5854-4529-8524-d4b0a1eed77b@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 09:45:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve TME build
 details
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MNl-fdzzaLiynyLm_l_8mB4q1Qv7tLWL
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684a545c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=3TG353hyPe5QJAdDZr8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: MNl-fdzzaLiynyLm_l_8mB4q1Qv7tLWL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAzMCBTYWx0ZWRfXxP834+wMRJSm
 AXiTH/zIs9chCKRatB+aqN144eZreVDaonbDXnOtWgkH94TyhJDSHO4oWS4+ek4+OGovIFcpsI7
 5ROssU0qavBuo2RxxUtiqna24tShTwhFmIPvSDNdzP62e+eRuNJy4SCdT+GxxBVAsExFCA838y0
 AaTj+g09tKtyUlJ7SNuGl5jsUgT/buhnnVR2zYKCZSckfkCFK1yzF5P8KXvCDDd0hFewWUXNwM0
 w6HKnbgy5OPwu6agpOXosJckoGNfiEcxKVje4jYj7gvRc3Bob8pEn7WqB3W7Y73QGCkkTIWfMZ9
 3QR+unuYHqm3M2uSVPYP2BtXghgcP4Gm3sDRs3/KXe71YRxYrBqgJIzTx7+KMZaVvwV5dinvblb
 Cj1o4SgV5OCcOrKOgTktLxsC+GzYDohEb7BB+WJMtRh1SEcgMvLKeIA5/+B8oyvjgC9YHVJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120030


On 5/19/2025 7:14 PM, Kathiravan Thirumoorthy wrote:
> Add support to retrieve Trust Management Engine (TME) image details
> from SMEM, which is present in the IPQ5424 SoC.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Note: On IPQ SoCs, the Trust Management Engine is referred to as TME-L
> (Lite). Other SoCs from different business units may use variants like
> TME-M. For consistency, the image name is retained as "TME".
> ---
>   drivers/soc/qcom/socinfo.c | 2 ++
>   1 file changed, 2 insertions(+)


Bjorn, can this be picked up for v6.17?


>
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 8c4147737c35e3878db2def47f34c03ffc1fea52..391380820f082d8daa5c764d5f3c44e6240e18a2 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -48,6 +48,7 @@
>   #define SMEM_IMAGE_TABLE_CDSP1_INDEX    19
>   #define SMEM_IMAGE_TABLE_GPDSP_INDEX    20
>   #define SMEM_IMAGE_TABLE_GPDSP1_INDEX   21
> +#define SMEM_IMAGE_TABLE_TME_INDEX	28
>   #define SMEM_IMAGE_VERSION_TABLE       469
>   
>   /*
> @@ -67,6 +68,7 @@ static const char *const socinfo_image_names[] = {
>   	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
>   	[SMEM_IMAGE_TABLE_GPDSP_INDEX] = "gpdsp",
>   	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
> +	[SMEM_IMAGE_TABLE_TME_INDEX] = "tme",
>   };
>   
>   static const char *const pmic_models[] = {
>
> ---
> base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
> change-id: 20250519-tme-crm-version-a1c7aa3ce820
>
> Best regards,

