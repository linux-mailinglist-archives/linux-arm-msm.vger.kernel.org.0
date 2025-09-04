Return-Path: <linux-arm-msm+bounces-72011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0FCB43723
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE6695A202F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF0E2F744D;
	Thu,  4 Sep 2025 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIH6VLj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E4A2F28F7
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756978263; cv=none; b=q1TEKyJHDNRWxdhcHtVdso3YfT5QcEuhkrlQnmTEEb9JFZYYA862gVLDlVlGz3rus0wLwuziPaQ//R36buTR729svr2VilzPLKMLue9lQIcODwhX7tDA2J/SOEfV3YD2GvK2p88Fdkx37Apae6Y1qio8KLlYUQ/Ng6YhZm9ZJFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756978263; c=relaxed/simple;
	bh=/3akGTP1lkxwZtcmtPRlyFMRA5KFJLoGC10m6yCNL/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srZ4PZHQm8c8dzl81zUC5l/oI+oSzANqD2MpMZw+WRinP+sRuvboAnhQtMrKQRN55q3CCbay5MxEFfW/EweBE/0F3X+LRjIkIO7saTM4yWXw0f5b0W5PhI9SHq46Y5lPM962m8y2FBPPCSGjd0GP+Ec0jgLI3o8K3QODeoq/at8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIH6VLj7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849Tk2X024888
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 09:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjaZTDZ/aDD7rrhljwAWbgjgue+W9I7isKzXGnJxcQs=; b=EIH6VLj7d4SEajTq
	Q4X2BCIDmfej9ZKbihG5UfoQ6T6Qljw99MgWVr8Kv5msP8BpjpATcPTOjhNR4x0g
	EF1zSe9lqXSRQWLbDh2tdyx/XBW02e3AfdBzf7a+HPRbet7305Kyz6YidM+WxJjC
	J0VI1fb2ozPMUxq6XA2I/x2CVlQsjtG4DUUoGZkO0U5tPhyBe3j/lJizJxkd/GNk
	DS+1ZFG8bFGURb0bje4xsGJd6JYfNlH/nk9S78LckBEAvbIOgJ4eCZn4PNd2b+hP
	EvNGcyLDYTeirOH/ZcN83xOW7swxZGv9HHRQ2fwV0tWQNIAp9Hx/EsPWmSvcYSX1
	9DHXXQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0713t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:30:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47156acca5so739846a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 02:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756978258; x=1757583058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjaZTDZ/aDD7rrhljwAWbgjgue+W9I7isKzXGnJxcQs=;
        b=ZuVXZI3/FOWDkjrCAxAWif03KA6L/GTL2yymxj8jfInf1kmumtS9f5ZW3kOaPh/3zu
         JtD3z4o3hRF85ZP5XN5VbpzfmD6NTkS2EpgrPNvxD67ugX/bL1yc28QbJ2D9x1DMzmj5
         FBuKeFwzt1wa+7b295ppPywtTchJLMH1Vzq10NpAx20+fDm8Z0VbUP8Ur30vH41G8VfY
         pE1OhkTpnCOAhfGotkldnXRlg5Cnh6Tw8XLiMpkaSm7yYRq42ay6qHFBVU2VnNu0WrKd
         t6Jz8u3dymFYTBkE01Q5g496kRvf2+jgwmgV9YXGl0gkP3bd1abxqz/riJVDiXyt51nl
         QvYw==
X-Forwarded-Encrypted: i=1; AJvYcCWplcRurC6iTV28WLONbvOz4Bvlowt2ANU2AQN8HVEDRy0D1eOy14SXDrediZp3Jc8hxBoiY9XzCFdD5C4U@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8HRjDzJC9/ySVG1mJPR9fntYXw85hxuxBhlJf2/SSYltPzHxe
	Zc330z6XGNVXGc9NJmWmnu3n7NHo7lUTtio0IXavJ9rj3AqVMcBWxWj2ZUtz+ZZE+NHUjgit2B7
	XD0SV0jVDawVAIK2zM1CegGQ+IKNOFMJm4PeQcEKiHtsLjudx23Sj/Tj4gV1Z1XnIcY4a
X-Gm-Gg: ASbGnctRAxb/QlpMRGPy1AolhfJ+JRGkFLctVYQ0+DqWEhe5I5u59BdXJcTyki4R6wG
	HZCJ4tDT1lIbrfkq3X4Rrj6/PKDS+WuGTqNTLbobNzzZ9OVpfYZTNLpuzg2CKAy8d6JFaKv0Pv8
	lOg/twEBvNURLttrfULesqayWVSpl/7hBXeyL4k9+iRFvjYChUyAjJGD2CcynusLNP8Frw8m+Ue
	bLpwgOOISNjbnFafYa8mIwFWR9R9rh/qsdqRGYVqdIxdqhNMEyv0RC3lJlOQNhPVu5xk9aC452I
	hG4Bg4UB9jOtGabq85nMUMj4s47a1gA9DUKYGHmN+0PjjhxUkRGqNBGnPRilbek1bbc44kht
X-Received: by 2002:a05:6a20:430c:b0:243:a7f1:ffd9 with SMTP id adf61e73a8af0-243d6f03220mr25742558637.14.1756978258536;
        Thu, 04 Sep 2025 02:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMkvfv7QM1gNoAVHNThaAcgLHPGgeMYdHu4pMt4ULdHgTWcrUFnW10134ZoHlO5C/MUQvZQg==
X-Received: by 2002:a05:6a20:430c:b0:243:a7f1:ffd9 with SMTP id adf61e73a8af0-243d6f03220mr25742533637.14.1756978258059;
        Thu, 04 Sep 2025 02:30:58 -0700 (PDT)
Received: from [10.92.206.21] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f2c990296sm12110931a12.39.2025.09.04.02.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:30:57 -0700 (PDT)
Message-ID: <3202167b-9403-4b68-9b99-55be190f7e2c@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 15:00:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] bus: mhi: host: Fix potential kernel panic by calling
 dev_err
To: Adam Xue <zxue@semtech.com>, mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        quic_yabdulra@quicinc.com, chentao@kylinos.cn,
        quic_mattleun@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: imocanu@semtech.com
References: <20250902165635.18951-1-zxue@semtech.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250902165635.18951-1-zxue@semtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4zpeQaeLEqeo_CzGOTMubvevOtQBjkqP
X-Proofpoint-ORIG-GUID: 4zpeQaeLEqeo_CzGOTMubvevOtQBjkqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXzvyyEYxEzKC5
 ANCKxbr8t0epELww5+pA7ZEARDs+eAf5T8d9UKxJE2qdN/u5YzxlSRHK/50ecrukWhpGsNXuwYC
 DMnneQxg635WMlljTnrXzDlYcNjvdBlX6z1Vhx3bZSQz4gxlj7G8w/MzHFniC0OiTC0KxXsXs/v
 tvaUM+bcdAec+h8/SlBURaW31T81RFywyRivxV8L+V6q34VteDA43Kv04MNdb1VMgcCmv2WFiDQ
 PU0IGm0F2OD/wHAdtzK8g2gyqA5adJvBB/8GD+EjYxu9ScjtEmoiGmsF+125xVm/RD/HoyqjWbh
 jiToT4TO7EqHHQDKE+M0PIEv54gEjcamWYkQshA6K3VYe+0QY7zu9NXFGIzp3E8syJ6fHCDqw9s
 Y5SaTTPF
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b95c53 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=SfXQzQb2AAAA:8 a=xogcm1YOMVM3hb4W_dUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=187EmVsF5pRpP46aC3wK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027



On 9/2/2025 10:26 PM, Adam Xue wrote:
> In mhi_init_irq_setup, the device pointer used for dev_err
> was not initialized. Use the pointer from pci_dev instead.
> 
> Signed-off-by: Adam Xue <zxue@semtech.com>
> ---
>   drivers/bus/mhi/host/init.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 13e7a55f54ff..93eddf302a49 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -18,6 +18,7 @@
>   #include <linux/slab.h>
>   #include <linux/vmalloc.h>
>   #include <linux/wait.h>
> +#include <linux/pci.h>
>   #include "internal.h"
>   
>   #define CREATE_TRACE_POINTS
> @@ -194,7 +195,7 @@ void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
>   int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   {
>   	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
> -	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>   	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>   	int i, ret;
>   
> @@ -221,7 +222,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   			continue;
>   
>   		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
> -			dev_err(dev, "irq %d not available for event ring\n",
> +			dev_err(&pdev->dev, "irq %d not available for event ring\n",
>   				mhi_event->irq);
Don't use pci_dev in mhi as mhi agnostic of the underlying transfer
protocol like PCIe.

Use dev_err(mhi_cntrl->cntrl_dev, here.

- Krishna Chaitanya.
>   			ret = -EINVAL;
>   			goto error_request;
> @@ -232,7 +233,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   				  irq_flags,
>   				  "mhi", mhi_event);
>   		if (ret) {
> -			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
> +			dev_err(&pdev->dev, "Error requesting irq:%d for ev:%d\n",
>   				mhi_cntrl->irq[mhi_event->irq], i);
>   			goto error_request;
>   		}

