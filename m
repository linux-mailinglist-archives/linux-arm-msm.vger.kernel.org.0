Return-Path: <linux-arm-msm+bounces-53319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A723A7D041
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37987170859
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C3E1A7262;
	Sun,  6 Apr 2025 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wxn/gRe4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896BB19DF48
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971267; cv=none; b=b2v33cFMml6GdQyVR7BCRce/HMiT6FLzHtNX6tu7rf9Di/wHjv+mb2PHU6fULbBizmt/wFYxeDrLZoaTj4aDMmAoWjHLT5iHvDxSA1/jLkWyjrS5c/Dia62TAKomSvNfQZ9NtRwxgxigyL7gkdgx3lklxL/L/V+1CehPTaxuDCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971267; c=relaxed/simple;
	bh=hdPDYix9B164q2pOie++e3UrFBvfcUAtndrW0+JpEuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXGA98K5ATTV03FvB83EpSkWqfgRZLhjvz5qLX0iMrPPp4a4yGqK9pt/J+CQcwPqZcVRjLwuOVvRX1RQzVlzMQqtlA5KWO777x2gQIEdLZuWznOknQ0UrI5BL0GE0/atCZJulXsPpo8uX9LhF/KvtD0SF/933qxF7Pe/QPhwJIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wxn/gRe4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536IrGpK030687
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Apr 2025 20:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tz+xBa4zdw4Oc+dGUVh8YIET
	Aw07f2pbn12ucUvO8ZY=; b=Wxn/gRe4usQhSX/tK55e5cwU1WVvWbiHCErt1lWV
	yAobiMO5enO7mf56bzhYOhmEYX1CgStmxlwxTe/4b1In1t81ebqcOCjNyy0Ox0Xs
	8yjhwyRrPkJUulvM2BPncvQtqyHrom9MPK0dmDtVDFWEu81z+ENHlrhO76TzLDWe
	PaaKPmOdbttS1WWBNgwDLASpAlgB98NStNzA8Edf2QpCugtSJQACB/DKGR4WwNUk
	3uMWtyftO+BzVQPh5LOf2g3g9VKEDPAUMmaPvo7dcND07SmwXbhW7tVSSXBoJj3b
	nWk+LnERxQwJP+Z86L5h/s0o9oYUb2lgURZNrtyWcWcj8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuaa6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 20:27:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c82c6d72so689360985a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971264; x=1744576064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tz+xBa4zdw4Oc+dGUVh8YIETAw07f2pbn12ucUvO8ZY=;
        b=QtyEF6YmvI76KLmPASRCtFlMH9leCLe0KKZVEoqVj2PqSFRb/cYZ1jan1H8YU7k/bO
         hW8JhKBW/NKIJu34OfdiWeSS9FHUMlNHoyap3mzWesff1rhgiESuFqn2CsGYiHJxVjJF
         MXEbFf1T0cuHQBi7YM6hEgGbb6uSoSvmXkhBqMUz4ybgt3+HZavmdV5aqcMePAY7LYbG
         E4bSZjUwjpvkymYe//HAfyE6ceHCT/bzrKCVRTrVRwtDrlthD0kWY+wpb/a7IXNclUpe
         OtTHfvyPDzqDYwVKMlDSOFHak1zqdDbEkRVs5WbF77CYJouys4vB711IyF4Jv+cRXgDv
         G+nA==
X-Forwarded-Encrypted: i=1; AJvYcCWEHaXGCm5Kc013K4ITc/nvQ6CM480c1lffzcrLL2nw0VtBpTHTP7WZDoZeejlIGHV/0PbRMeB/qWQlqCHo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl+ncqXNoKJpmMFCrfP1VuzBcdba+ddlykjqTt2ZsuPEi5Aohh
	YepkD7U8bBsAIiM4exm7QphapO+j73FoO3vdMAAiIctQqOjbv5jxDN+QksIeENkC3kM5WVxuvT3
	E8k26oR1h63rvYDDyv9DgffSnxdY6MpnnRo1f9AB/jmoZfKu8zrnw76maPSOTLEUa
X-Gm-Gg: ASbGncuQyZb5yvXxUN786tdgQlD8mSghfPOY9PyI7rvhqFSblwl6TyrBD+BAXM7Y5gS
	HmxnOpwCmE/PIR1sPKOpDCXVdO2s2S/zOWVVRi/uzZqycw5vaEpP0TH972ow3Mz1XGg7thWaUej
	6nVQH3pt5VDaCXyo6LbBBY76aWaCauTR84YE2Gu9LnqaP6G7GyKJzTG5c1n2/hmi+C9wijJlucR
	c4DAq1TAor1nSh1YeSk4+ABOm+2+UBhFQRJauOmu6kAJByT3q9ReiSlD0NECYbvZEyTbED71ptF
	ZH2h3JKDCjhXgDtK76Cov51L/UwX/mo3uVK5l61mIv7Axvn21f+Pvqst0UN1MT4A77oLZnjAkDM
	uMc0=
X-Received: by 2002:a05:620a:2946:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7c775a0fd8emr1535317385a.18.1743971264543;
        Sun, 06 Apr 2025 13:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAm9GBbnTAo3ZOioqX1ZBA6msW3e0u3q4DiGzxVQgs2AQyA4SvhZ1rIo9q0uLzeQ6JG09pOg==
X-Received: by 2002:a05:620a:2946:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7c775a0fd8emr1535315285a.18.1743971264250;
        Sun, 06 Apr 2025 13:27:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314abb5sm13408651fa.48.2025.04.06.13.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:27:43 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:27:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] extcon: adc-jack: Fix wakeup source leaks on device
 unbind
Message-ID: <xosjgzwpwz3rnqt4wybekzuaag4na7vbfn6et46omkqyy6nvs7@zqoswpjy6srh>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
 <20250406-device-wakeup-leak-extcon-v1-1-8873eca57465@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-1-8873eca57465@linaro.org>
X-Proofpoint-GUID: OJXOZZ983eXZXQPk8wb1fUJOaCrXFZZR
X-Proofpoint-ORIG-GUID: OJXOZZ983eXZXQPk8wb1fUJOaCrXFZZR
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f2e3c1 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=-tqK7Jk4VOKOSx7ihNIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504060149

On Sun, Apr 06, 2025 at 10:16:39PM +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/extcon/extcon-adc-jack.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
> index 46c40d85c2ac89599ffbe7b6d11b161b295d5564..d7e4b1418d7e6b242780b3511f2a49def3acb7a6 100644
> --- a/drivers/extcon/extcon-adc-jack.c
> +++ b/drivers/extcon/extcon-adc-jack.c
> @@ -164,6 +164,7 @@ static void adc_jack_remove(struct platform_device *pdev)
>  {
>  	struct adc_jack_data *data = platform_get_drvdata(pdev);
>  
> +	device_init_wakeup(&pdev->dev, 0);

s/0/false/

It might be better to use devm_ though

>  	free_irq(data->irq, data);
>  	cancel_work_sync(&data->handler.work);
>  }
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

