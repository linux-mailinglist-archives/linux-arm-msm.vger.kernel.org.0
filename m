Return-Path: <linux-arm-msm+bounces-94530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJb1IYX8oWl4yAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:20:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA581BD87F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 908FB30C770C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E74477E48;
	Fri, 27 Feb 2026 20:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l46VX7Ci";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbUiAT8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618B54779BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772223301; cv=none; b=Afrr1yMhW0WtEQ/Vn68RI/c6yzYIvkVB1i5JZP8JTVkBo07R1xKajjzPdalezh/EW5iVJeTE5JvgZ6QLIc2Rt1a9uuj6Gm9Ovp1AutiovrWTP8732FMf2ScDeK/8c+1EmrRXhUKwqtsIwEtNszwTB21niVuQKWfwndWqkeffcXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772223301; c=relaxed/simple;
	bh=iucNoNEStscn+tF3OuWq/KxWs14WthoY9Q8cXGzCxVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiQHznefbHr8U/wXKxL8sAmcluaGgMvNty+C+hg6WIh3Ac+GNw1tb0SwiQ6qlgmmSuHBtkhqU/mGnudplB2kReYDMNhlyytA3DxNAjusSe/QqF1NxyPRdfIVkKG5EqY7hRD29mgFSXTYlVqnLlyN5X9hqXXJfppqSD5ac3vFums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l46VX7Ci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbUiAT8w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0GHV527221
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d3qWlTlHeHHlcRziGZQh+7Eh
	dQAZWCc1/zRjvAUju5Y=; b=l46VX7CiT4zVHDcCd/GnnhhLMZLwnJdSy/NSQCL8
	K4woeRxVjr48lgLFgPd1jDHU9UiH88OgxAtrY6SGuqHktIdLSKdfPbTCo0vYn7lv
	HS0dGrwrI4rbeKM1XFTgClUN32V8EaYNG+HD+NSOossL1Pvttv/7n43eORVi01GQ
	LNtUp2Wl8GEaX0fT1OmYmoZvnYHunR1MQe7gZvApkf+WqP8j9ja/5syrSG8yOAXk
	47f7DWYt5ThDHkaufGgEbebUwtuzC2ZhExf4VUAZbodWhIys6MXdMbE0J5kQL5+y
	CKnYNPRcDFvfMQdsK8isU3XHcQm0zjjwuFAKEUQ9h4SFFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23c7fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:14:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b6b37d8so1733555285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772223295; x=1772828095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d3qWlTlHeHHlcRziGZQh+7EhdQAZWCc1/zRjvAUju5Y=;
        b=RbUiAT8wKBCa3griz4wX0QXuglSpBfM9R0Sw6IABxbwEl1u21jzI7Ob1DBsKcgwPwI
         y/uV4XmiZpUqM2JnuzSXr7ZtmMGfQP03jasJq1TduLGLqJ+J5xWiXEAzDAxGWpcL9FsB
         efh57YnbbIf+m3snHX8nxXdD4fCowhfzDMHmFjK/NC5T4RsYsK/mr70dh5+naBCW8a2U
         1oPYaTod0NGvphxZQ5iYe5+14nG54Oh60RB/kMMj77szrcMSjN2iF/3IsOLyilqP5Ywu
         84r+seTgCw1Jlf5D3E9APM3mt9UtjWTJlzW8mBUXXjIxYZQ8xbnuF4aH7wej0mw+S9Fo
         oXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772223295; x=1772828095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3qWlTlHeHHlcRziGZQh+7EhdQAZWCc1/zRjvAUju5Y=;
        b=O9JvoR6ZE6yObJIhYH/yVhBW+anMOhBB7Fd4EqM5eznunUlmCHR4wIVA4sZT3cZPFA
         hJGSGco1skzDGu5Gb56c3Me5XB3nGRuc29R7IGsJhwKRZf6bttbni8OBqyO7jOsGXiKV
         j4ESpiP2vSZ/gpzylmWNXltlIVsRKMYCyddjl6lc+Kyb9QArNfiOfHNfnAH97mRUYARW
         B//W1pQ6YTNo2e5WWSEFl2xEaigCqJpgOGs7lVLSxo6LjCa2JWAo0ZJ7WJAt50prDIPj
         27vXzeOLd2lxxazC30IPJuVLqXZ6FHi2qG6xLsj+CTuVq9irVdoL9kMGTc/ibeDdO1t7
         1Wfg==
X-Forwarded-Encrypted: i=1; AJvYcCXrd7zGK1qglQw+DrpBLnczA/+JvdyMjJvyOeAYorqkVO6ugLMIJz6NKgdpaMxeapIa11dbLGWwUsw+zmvh@vger.kernel.org
X-Gm-Message-State: AOJu0YxoPLokxPLq8H5ltKiedlzwzpI83AokIW+OIJitJrO4SVZo538L
	ClMEdajJEaLEKyeM0fXJ00yx2P6hLS9jms1bsyNApRXP2FfAhBPTXaN+gQNCnyd3yHo8CTmmTQA
	mjnteI61yBDFj4Egt/+8BAY0Vl2hA3q3PQD15DXakMl9uI5BCatSc7/v62Q8J+L8oVzNO
X-Gm-Gg: ATEYQzxtWwvBlRAYuDUkJkwkGb+pVSXDe1s5hskD6nzUrxdmHATEqMHrpxP0ZB9PSJ0
	9IxKy8yh5uaUfv+6HW9rnbidEy+r/oGyaHlQof1+5bPzLP17HfBdMKLTpTP1+aaLHlTa+QMAKYZ
	UzD69wsCeMlQryh39f7Q5rkGvjjx5xzjDKznQz1t6a4dTWt+OFrZoHCAZ7+HWmuI1/sn3NjIb3c
	aE2iggH/1XAs0hxjYVOQfRUxZLv5GE65+Au5TNMyVN86zKVlafW8iqnxAjEEgqGFI1m0XD7giIS
	hQwzZlg8fTPU55Q/02P04VcWG4M+safux9sgkRQ1DsiT1ELMMKqsoFUGy+NyuEXvLulhyeeQOoF
	BgDsNprPaJRTIxfyfmx4hYk+aVMaJWUdlBQhGX5inySxFAkgKxIJF7fChnKQ/aRZir6FuJhOxoH
	PWFe8T/PlZyqwMI3FWGparTV/ZVFoSn7IYv4Q=
X-Received: by 2002:a05:620a:28d6:b0:8c6:a341:ac1a with SMTP id af79cd13be357-8cbc8de81famr504699685a.52.1772223295025;
        Fri, 27 Feb 2026 12:14:55 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8c6:a341:ac1a with SMTP id af79cd13be357-8cbc8de81famr504697385a.52.1772223294554;
        Fri, 27 Feb 2026 12:14:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a116022215sm102994e87.52.2026.02.27.12.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:14:53 -0800 (PST)
Date: Fri, 27 Feb 2026 22:14:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 3/7] media: iris: add iris vpu bus support and
 register it with iommu_buses
Message-ID: <rgglzg6kcq4xz5wtambs3mwch7foxruh7ecbabtu6gm7txr3wu@b67uwl6mk5tx>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com>
X-Proofpoint-GUID: t2iz_RxebqAO4vpXwUhf7RJxNfCQA_Jb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NyBTYWx0ZWRfX2Cklowy8tR9b
 PNZJ9L8tBj9Wry0LyII5eJkNQJwQwCHAiYdDDcBRMh9tcXig42xorRgi6mTc4JrQJMsbVb+uHfC
 MAFIjrlF3RUf7arrhWVMiedojtstDlkuyrTLTQnD4JNdi3F+tX+HAxrFD9354JEsrYQekkf8vST
 Mag6PazZMk7BJzXEwPOeN3gg0isbTDTE94ZhGjre7FR+XyDIrRvi/7PHkOeaPb+px5We8zorbMz
 6FoW2CZAYGUXn8ZnpBbJUGKJrHXP2Rbt7nJGTgKcOwWlUDax76p5MWPYckBisJH41LsM/rJ26n7
 g0MpxlZKyiKC17AQAdfx42qu6LYGUk4R87er6edJRRIApO5SLtqkLlEyhAmpYh0HfuQ5323ZBNZ
 SEX69oVfMswvtJs/gKfvYbxUEfQc8osJ/C20MGg+olLYx0CHbKpOJHlzZ81BsrQmZcT/LapPV45
 i4TxjaiXRqESUGUllwQ==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a1fb42 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=A7-SorSeRF4lZ4C7dWIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: t2iz_RxebqAO4vpXwUhf7RJxNfCQA_Jb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270177
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94530-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BA581BD87F
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 07:41:19PM +0530, Vikash Garodia wrote:
> Add iris vpu bus support and hooks the new bus into the iommu_buses
> list. Iris devices need their own bus so that each iris device can run
> its own dma_configure() logic.

What are "Iris devices"? Are there multiple en/decoders in an SoC?

> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c                           |  4 ++++
>  drivers/media/platform/qcom/iris/Makefile       |  4 ++++
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 13 ++++++++++
>  4 files changed, 53 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 35db5178095404fec87cd0f18e44ea97cf354e78..fd5fb7c10da22ab548d359ca1f44504acc3d646c 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -13,6 +13,7 @@
>  #include <linux/bug.h>
>  #include <linux/types.h>
>  #include <linux/init.h>
> +#include <linux/iris_vpu_bus.h>
>  #include <linux/export.h>
>  #include <linux/slab.h>
>  #include <linux/errno.h>
> @@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
>  #ifdef CONFIG_CDX_BUS
>  	&cdx_bus_type,
>  #endif
> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
> +	&iris_vpu_bus_type,
> +#endif
>  };
>  
>  /*
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2abbd3aeb4af07e52bf372a4b2f352463529c92c..6f4052b98491aeddc299669334d4c93e9a3420e4 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
>  endif
>  
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> +
> +ifdef CONFIG_VIDEO_QCOM_IRIS
> +obj-y += iris_vpu_bus.o
> +endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..34ce78d9b0ff1feda15ba4f060a56d02749a0858
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.

Drop the year.

> + */
> +
> +#include <linux/device.h>
> +#include <linux/of_device.h>
> +
> +#include "iris_platform_common.h"
> +
> +static int iris_vpu_bus_dma_configure(struct device *dev)
> +{
> +	struct iris_context_bank *cb = dev_get_drvdata(dev);
> +
> +	if (!cb)
> +		return -ENODEV;
> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, &cb->f_id);
> +}
> +
> +const struct bus_type iris_vpu_bus_type = {
> +	.name = "iris-bus",
> +	.dma_configure = iris_vpu_bus_dma_configure,
> +};
> +EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
> +
> +static int __init iris_vpu_bus_init(void)
> +{
> +	return bus_register(&iris_vpu_bus_type);

Together with the Host1x it's the third bus having exactly the same
functionality that I've seen in the last several days (I counted the
FastRPC one). Could you please generalize Tegra code and come up with
the single bug that will work for all simple users?

> +}
> +
> +postcore_initcall(iris_vpu_bus_init);
> diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..8aba472fcadd269e196b7243da5660deaff31abb
> --- /dev/null
> +++ b/include/linux/iris_vpu_bus.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_VPU_BUS_H__
> +#define __IRIS_VPU_BUS_H__
> +
> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
> +extern const struct bus_type iris_vpu_bus_type;
> +#endif
> +
> +#endif /* __IRIS_VPU_BUS_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

