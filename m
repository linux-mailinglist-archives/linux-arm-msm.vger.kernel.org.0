Return-Path: <linux-arm-msm+bounces-59734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769CEAC716F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 21:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 389C64A6130
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 19:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5D021CC55;
	Wed, 28 May 2025 19:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eai61nNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0791E8332
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 19:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460103; cv=none; b=k95mpLFKWx9rIz9TFUFEfqcqXkyhsv+1pmD5aPINZ+P4NGfVLxhhaig/8br9PNWaVY9uT4T0+397++hAx2+mtPBWD6Stx+urIG2fFVwCNNtfKrvFArLL68GGgX3x3EdebSC7NumBoLUQHNrzVrSUMcoQBShRtX2o3Czb5xAjcec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460103; c=relaxed/simple;
	bh=5YkGN7qiUJaRl3Nx6l2MDDYu/ZprV3VXMY9hifYOnPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEyAul817tue62n1eBx9jpdvdhY8DK3Nr5sVpru2ampmZZR3Cai1P9RAzLmWTtAaF7o4nSqLb41c2mYV+9xfyBiZOLbsSsuTAb77y3x86C+FEb/6bukYzi77XYI7LGgGfjNDYqXoQY1XR2EuWQU5CXWYDQMg1rh1BR77ovj3ils=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eai61nNI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SElCYW028920
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 19:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0gLgWYRWzCLunD/qHvyEBxK0
	5YkGBQTqBuXAxV9jh+0=; b=eai61nNIZrFCYT4XHda5r/y0e/6wLWlVa8+GpSR5
	bnjyvI/XotbJuO1zMciMfrq5n6WPGwC8T2FVPQalr0tpiuKUbz/1JF7nn86sImix
	cxZpwD2P0s/HWQ8cpGxY9nBk55IRPv2khHTxN3UHwWOAaEfmn508RtPtpnuexz9r
	qjM3Bkw+DwnzeTXAjUHTtUOihxFVXg9XJkddSXoEyTQBUvs+p++aXVUfJDZh28+E
	/DlAKUKq3s2/zbzN1fjktNtbcE6bnwnhqfi0JQis+yDNfHyY1LAgECkHZK8bZY2y
	SNHiRxFPfQheoUMZY5o4OTiuSugRbMtKOu/JvFqzb6EIgA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf3qhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 19:21:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-87dffd5e015so24329241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460097; x=1749064897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gLgWYRWzCLunD/qHvyEBxK05YkGBQTqBuXAxV9jh+0=;
        b=Gz77DoNCLc01aeKc5xIq2KbGxGn/x/dB90gnGR9FN2eTKBXTOEuUltX95JhTpv2dtc
         APFoPucIOP4oPSTxPFmyndU9C73E1jsYvYWo4/QNYFPAdvpSzz1hc3iMec35noIRLN5F
         c4X0rjbCrAX0S8E3iyS/Jhavl1pItA4Ii7HPPHIzMIcu2A6OkM4JL5T1aD3+XVTwzjnw
         kEXU48ZIZwqoBVN7Ayn5MpGK9No/QG+kEVNmiFBaF4bysj6FGrE/OfjWO7ZBCXZ3Ts9z
         PSFayHiWBUS5MFvLAYd7faqSBMYrOxihlGnvyXoJOJJ9XOrVF8spKIOM7FdCKAIOr/0q
         m4sA==
X-Forwarded-Encrypted: i=1; AJvYcCW+urbgXwMfcr/9qt8NeGRNePBPlFWqBwO9Rpj7WuYYE93P95yz8DG0YtI6RiXAfirTU6zZtTp1j0M9b0zP@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8pq2EBs1jIh3xm2+Rt/ZTReQhhMte2Ot8mO++75SVO+DxcAB
	Ssxs/FOze8U48aklSvd6tPuTnwe5n8PIbly4qbuaDcWykWn228WcQx/4bZfzqm374JGMyezUcyC
	u+ZC6roBC8i2ZmBPRgNs86YyZTDiCDGEOJEKWmHgFQx87rKgGQM7sTGcoUzYxZh7+rv+e
X-Gm-Gg: ASbGnct1d+isoY6mvQUKOgo2yTZhzh7BJrehbSOms2VH4+1WBBV54KzR8fEZtG9J5qX
	BPUhK1Nm3/0Z5raeo6UFrrbMn0t2Od+52Z6gjkaAHl5jr+H0Xvu90GfPYNfPYD6bOxLwooS03z4
	awgYdrtVpBdlc48+wRENOu8d1MMyEA+5lCoza3hYz+2S5yInPmmfE8GQYL6U2wZXbfwZwnjkSWM
	LjnTcD0NJKTaUUe+RXaq+JOeE7IlD3nR3xOv6Eyd1Qtfap7eCwt/KdaYwG36FQh4IID5o+LL4db
	cuEzUqunQ0Nd8sn0VSo+99JTLVqzddqWJygLquyicn2AFJL/Tt5jXAj8oevuw2bfYK8tlXubR8M
	=
X-Received: by 2002:a05:6102:3c83:b0:4e2:bac8:75dc with SMTP id ada2fe7eead31-4e424107ac5mr16096197137.15.1748460097046;
        Wed, 28 May 2025 12:21:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERFOoB32HSD5K8ZYFJWnW5A8/+hLXTTrO7fhdopo43CCwU6vsapvR8yzcxq2z2wgo+mX8xeA==
X-Received: by 2002:a05:6102:3c83:b0:4e2:bac8:75dc with SMTP id ada2fe7eead31-4e424107ac5mr16096164137.15.1748460096733;
        Wed, 28 May 2025 12:21:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6a6276sm404321e87.207.2025.05.28.12.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:21:35 -0700 (PDT)
Date: Wed, 28 May 2025 22:21:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/4] mailbox: qcom-apcs-ipc: Assign OF node to clock
 controller child device
Message-ID: <m6nprxug75aifcw6scqpnlx5664zk44neo7v6w6trxfmoe76b7@kt6v5vrdeadm>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-2-b54dddb150a5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-qcom-apcs-mailbox-cc-v1-2-b54dddb150a5@linaro.org>
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=68376242 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oeMlsxxNoTt8-AEUPKgA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: o0YgNdW92hmQQP5QN6mONxyQeFxBE97W
X-Proofpoint-GUID: o0YgNdW92hmQQP5QN6mONxyQeFxBE97W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OSBTYWx0ZWRfX5tf6GDo7ObKG
 HaugA6+9psBrb6VKjhgCTI0OaFYoFI/57oZg1G9+C+mOzOfyY2kY7ZmbMQVpnxUAJdkX8sS7BFH
 kxlHpmm/7gZBJrGaiEa+DSNbhSaFuoBRXu+agsX+lD9wIrZ89flrzqFwDXG+MKet3fSFlRYEMl2
 EPEgef9spELFg8SdqwhfWPk55zoIDPb4Hzf5IuzMA3WDO1IdEANlohJ7VWkl7nAcJRsquaSRfAG
 kNtfHhRymR7UGvlsg0ePCneJ32EXg9b0umBVkmW2+7xB9oAsHh7SDqBxGEr98R+KNdrN3/XjxRS
 Ou1YIpeEnBZX8AjuvHN/CSSXdUC5qWc9UQ23OZiBCojDAekI0BNVpmwZ4+JzSHee6C2PNXRXfm5
 P63WiKXOyrtwjXq4q3IhN23/YYNHKyIg88ImIqAYg4GmLj0aonxjYoncX9Nbu1c3N4m1HJIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=996 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280169

On Tue, May 06, 2025 at 03:10:09PM +0200, Stephan Gerhold wrote:
> Currently, the child device for the clock controller inside the APCS block
> is created without any OF node assigned, so the drivers need to rely on the
> parent device for obtaining any resources.
> 
> Add support for defining the clock controller inside a "clock-controller"
> subnode to break up circular dependencies between the mailbox and required
> parent clocks of the clock controller. For backwards compatibility, if the
> subnode is not defined, reuse the OF node from the parent device.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

