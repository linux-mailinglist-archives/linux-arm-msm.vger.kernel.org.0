Return-Path: <linux-arm-msm+bounces-106844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNpfHSF5AWqMagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:37:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8094508981
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CAED3004C6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 06:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A5E296BC1;
	Mon, 11 May 2026 06:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2/96vXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGPmZY/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5882BE05F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481297; cv=none; b=BWIUOAGksQHnPfPwIY6I0B9Of7vtA5QQaxIgfPrjebzVQQ4Q7xB5VGtLLpkBoPQ79P+rixGtLL+UB2XGsAuXwDgjsuqwKXuhvkewBWQ3P1wktNKV84AC4LzbFXjsH/91aV24bzHzstdnD/hREzlnpIa9x2YDl3RhLrUXjg3ne4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481297; c=relaxed/simple;
	bh=rcW4M5v/jMxfIWNanbTmGmaMA1kZk3zTSWc+V4RtyFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFyWuSzTyJP5URk343lxL5OrWpcW63dIue/hGI/u6gBffBYzNK6DNpRq2/aj9PrSvt0GqcGdmbhVdS8fgR4hgCCMvEc2QfC2A48rXw0kXDcm1OCicqcomGMdiQs8Vnbc7dqa1O4NyLyiZS7MZzvxORa8tMWKuCZTeSI0KCrrqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2/96vXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGPmZY/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B0LpQl3557324
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JR40/cuuQq5xGZuuu+KscHhHFJEl6gng4orwRde9dg=; b=B2/96vXIDEAkD0vT
	zMjmJgLYZeTPWU+ybjdDY3nv10APCFsCCw+sbiFErwhdK+/ZeimfbXlq0J3ko323
	JZ0e/wdZjsAroLkK6P34lcwmc3RBZZtsVuBrjOGrpN3N0DSdAxfiQHA3aMR4H8X2
	a1owqYQm40vy03SV2uioiMk5n4bvedXYjF2rIOm3ItIbuqs89vhom3ZOem/ZRVJW
	H/bbJaeYSLlpOfAKq9b7jWQ8faFBd6K0v1v5UC8r6F2DrweUoeoT3uJ4eh/78R2K
	yAyXWpERzKJnQGYzAnW6rGXmy7fPaASquR1EVkXul+Fl656RldhoS2dwxrGFfUDB
	Q5J5+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79mmaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:34:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so1104639a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 23:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778481295; x=1779086095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JR40/cuuQq5xGZuuu+KscHhHFJEl6gng4orwRde9dg=;
        b=QGPmZY/ynPUDu72d7zlYF+GYivIenONhshLvTQpXC8Grhne5ApkvB0sDo+Zm7yWHY6
         j4Ka+rtX2WzlBAVHc1C6/BDBNdx7DR1XOkBls/Y9mP5dEvDLqu7WSqc190atp6I1uGhy
         /DEOGA/CCTVTfXD3KCeR+XQnID3ETs24fzmNZkpk3gVHs7yYy593Cni9fn+KJ7P/AHIg
         3neWyw8MFbzu9ltbj404TDgZDZt8sqHl1H9MKYAHTFB44nsn5xwM7KYczbua1QPXAmPA
         KtF+qZI0XPLB/9omVZFSpPc1WhkB7YTZS5JUj9VgE1bOh6jpxjaIwzhtv47IkzO6oDcg
         yZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481295; x=1779086095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JR40/cuuQq5xGZuuu+KscHhHFJEl6gng4orwRde9dg=;
        b=UhPpG11BtahwB89BslF0BxElJxniKYOay7qY+esNFbFe4h25SifyKjN1fZuY+EWskW
         8hRewRkCOLTNdnWZp20ZQ9f1v22pTU91EwYiitzj0Bmhf5Lt9ZWOftTiAE2HD8zStHwu
         WiDCFU+O+zn0v77aGeY9z3Dql4Powoo0nNUbnuJ3jdZVWBk6xA1BKPYD+dRbvekLlw2H
         ew7ABMegeYG3i0Nz+9GHAPDzsgN7j3rTpWPjdK7iQUUMBmP8QTVN468S2jrYu7mWpCFg
         B0K4yDJ9juQ+ef3XBodWcKjJfDWARKLyt21aYkzrQa8oSiIWH4ahPZ8MsI3REzzI1xx7
         zP7w==
X-Forwarded-Encrypted: i=1; AFNElJ/KB1hxqns4KnrCj4JIW/2PZjImvZBZk0cBD4E2/SbwlRg94MVvl7PqHR8VV5KUweWrMHPP5QS6b6ACAZNz@vger.kernel.org
X-Gm-Message-State: AOJu0YzWGAFB6lwNvawjDOZ9Fe7H0ULUByDyxrOYveHx2OOziQCY3khA
	WVYH1vVUOBVbZMp5ef+IppCcB6fqieLBSJFi8Jnu2VgDg8ES3RBwFQMofHxVl+HZ2TLujbXlT8M
	ucjipQnBtDIynE6YTmJ9u5ZVYx9snWKMMp0XYpBgrjGEu6/Gb7h+xR7lCGqsjXBgxUjXQ
X-Gm-Gg: Acq92OE3LHG12NSX8GKXV2eD6/TxXlDr3KhGi5y3kZ5uHyR4Scui0LTKW79itKFaT7D
	Gnq+8bwO3F7gyO8w3sKn7P1lW+tx3m9aep3ImzAalfnc2t2lCo/KfD7BJ53wX+R93Pln/YhvKOV
	7JIef4DHZf+IJ5KjT7qMa5sKczuTITzNFyrvzXD7DN/bCV18YJo5PSpJvvAZpNzJmXPPErW2PYq
	sL+s6nlYhE5gM+JyXbe3RfNwZHibplNHrsG2SESOkl5KQz+dcjQxrzZnFZmBZ1cCBGxBJUkhv32
	98NxyItHdtFPdF59QGIrrmTzhOvNfk4zZGmk8aF1GnqQ7yR3Oj/Oc/5a6lkuV/kN/vHJqhsNBmU
	k1pF6KUlpudLgv/kgjq96v0Da+cXBtERbtrnkIjyVKWY/wn6EC0MJtA==
X-Received: by 2002:a17:90b:2884:b0:366:159a:c1ba with SMTP id 98e67ed59e1d1-3664c8db9acmr14006570a91.3.1778481294797;
        Sun, 10 May 2026 23:34:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2884:b0:366:159a:c1ba with SMTP id 98e67ed59e1d1-3664c8db9acmr14006506a91.3.1778481294151;
        Sun, 10 May 2026 23:34:54 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ebe0e8sm97390245ad.76.2026.05.10.23.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:34:53 -0700 (PDT)
Message-ID: <c4e77fdb-e789-b739-f1dc-591be17673d3@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:04:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/16] media: iris: Add framework support for AR50_LITE
 video core
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-9-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-9-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YQTE-EjDSzvStzcnMtGLaK6vGqcWST3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA3MCBTYWx0ZWRfX77Qa1BcztxVT
 7sScp3UwHfty3qbCAwqD426kVlIEhNXySsvGFkeAWNJvMmYV6wPaPAJrcBvl3ZXg9q/cnKMmFXA
 qp+Pnp+WiC6ffQCo+exCS49eZ3gDoOyzgQGLOhBU97KJtFNwuDLgy90AtQzm4HfQTux+uKxtUIo
 7ammZFOIUi+87+DHB22Lg3lYX5ZxJ1WT7pad/T9d5A0YeiyqVnaIJUGR4aX+2YII58QzmakAT2x
 tpZSNmqpIwjaWSDeNuUJsTEYIjcPjrRSKStQbp3XOxgRc7SQkemKMfdq9wagmiPFTr/Vcuo4iiN
 dC5tdKwfN8N0V0fueU51b41DrKPq24xvUntLJxvODHPK8tig1U2CKHeHLA9nBMjyOZR9GW2Djpd
 Pu46Bh2ZAbbOfR+oQGkfOdbuhG9EOSNts8fuUXAohPTCqsH/DB+uH0GYU8zT5KGtb/avLmB+vj+
 Ptxf4xW0pcq373un2ow==
X-Proofpoint-GUID: YQTE-EjDSzvStzcnMtGLaK6vGqcWST3f
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a01788f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=USSJgBeZPGwVCPz7ayEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110070
X-Rspamd-Queue-Id: C8094508981
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106844-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> Add power sequence for ar5lt core.
> Add register handling for ar50lt by hooking up vpu op with ar50lt
> specific implemtation or resue from earlier generation wherever
> feasible.
>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 156 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |   3 +-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  5 files changed, 162 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 48e415cbc439..f1b204b95694 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_vpu2.o \
>               iris_vpu3x.o \
>               iris_vpu4x.o \
> +             iris_vpu_ar50lt.o \
>               iris_vpu_buffer.o \
>               iris_vpu_common.o \
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index e1dc226066c1..4a0895bf5720 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -63,6 +63,7 @@ enum platform_clk_type {
>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
>  	IRIS_APV_HW_CLK,
> +	IRIS_THROTTLE_CLK,
>  };
>  
>  struct platform_clk_data {
> @@ -283,6 +284,7 @@ struct iris_platform_data {
>  	u32 tz_cp_config_data_size;
>  	u32 num_vpp_pipe;
>  	bool no_aon;
> +	bool no_rpmh;
>  	u32 wd_intr_mask;
>  	u32 icc_ib_multiplier;
>  	u32 max_session_count;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
> new file mode 100644
> index 000000000000..688b57291a81
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/iopoll.h>
> +#include <linux/reset.h>
> +
> +#include "iris_instance.h"
> +#include "iris_vpu_common.h"
> +
> +#include "iris_vpu_register_defines.h"
> +
> +#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
> +
> +#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
> +
> +#define CPU_CS_VCICMD					0xa0020
> +#define CPU_CS_VCICMD_ARP_OFF			0x1
> +
> +static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
> +{
> +	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
> +}
> +
> +static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
> +{
> +	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
> +}
> +
> +static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
> +{
> +	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
> +}
> +
> +static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
> +{
> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	return 0;
> +}
> +
> +static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
> +{
> +	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
> +	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +}
> +
> +static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_ctrl_clock;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
> +	if (ret)
> +		goto err_disable_axi_clock;
> +
> +	return 0;
> +
> +err_disable_axi_clock:
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +err_disable_ctrl_clock:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
> +	if (ret)
> +		goto err_disable_hw_clock;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_hw_ahb_clock;
> +

Why the additional ret != -ENOENT check here? This function is hooked via
iris_vpu_ar50lt_ops and IRIS_THROTTLE_CLK is explicitly defined in the
qcm2290_data clock table, making it a mandatory clock for this platform.
Is there any other platform that uses this same vpu hook but does not have the
throttle clock?

> +	return 0;
> +
> +err_disable_hw_ahb_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> +err_disable_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static u64 iris_vpu_ar50lt_calc_freq(struct iris_inst *inst, size_t data_size)
> +{
> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> +	struct v4l2_format *inp_f = inst->fmt_src;
> +	u32 mbs_per_second, mbpf, height, width;
> +	unsigned long vpp_freq, vsp_freq;
> +	u32 fps = DEFAULT_FPS;
> +
> +	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
> +	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> +
> +	mbpf = NUM_MBS_PER_FRAME(height, width);
> +	mbs_per_second = mbpf * fps;
> +
> +	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
> +
> +	/* 21 / 20 is overhead factor */
> +	vpp_freq += vpp_freq / 20;
> +	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
> +
> +	/* 10 / 7 is overhead factor */
> +	vsp_freq += ((fps * data_size * 8) * 10) / 7;
> +
> +	return max(vpp_freq, vsp_freq);
> +}
> +
> +const struct vpu_ops iris_vpu_ar50lt_ops = {
> +	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
> +	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
> +	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
> +	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
> +	.calc_freq = iris_vpu_ar50lt_calc_freq,
> +	.set_hwmode = iris_vpu_set_hwmode,
> +	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
> +	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
> +	.disable_arp = iris_vpu_ar50lt_disable_arp,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index b8300195a43b..f3607c0ca847 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	}
>  
>  	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
> -	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
> +	if (!core->iris_platform_data->no_rpmh)
> +		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 71d96921ed37..f00e2de5fa53 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
>  extern const struct vpu_ops iris_vpu33_ops;
>  extern const struct vpu_ops iris_vpu35_ops;
>  extern const struct vpu_ops iris_vpu4x_ops;
> +extern const struct vpu_ops iris_vpu_ar50lt_ops;
>  
>  struct vpu_ops {
>  	void (*power_off_hw)(struct iris_core *core);
>

