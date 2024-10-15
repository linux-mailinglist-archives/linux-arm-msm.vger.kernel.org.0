Return-Path: <linux-arm-msm+bounces-34497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844C99F739
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 21:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599541C23818
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 19:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E770315C145;
	Tue, 15 Oct 2024 19:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONNs1iqr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AA11F80A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729020299; cv=none; b=QaRoakGu/6n8JaXD1TC6hIICmWn1rt7LjFIdPKG3dZrnK2Mh0W30erB6V37tGnBQ6FNDWhTh230Ado2xeOx320AEwlwbqPJ02OtxiJ867GFR+wGKdzE4dLUeRAhzl/hJmu4grLHtbVAcHpVengM1XwaNrzpGPaXQZ0pUu82npT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729020299; c=relaxed/simple;
	bh=qxWjP90KBqcpKbXX3WzcD4c1gVccESLcieurOcjqZGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVWaNM9zCZXNBUS//5KhU44PX3pJwtBOyvo7jOiObr8MyApYAtvNnYhvkWaJ9RFKxPl1rNJsyvDaKInMojHrYgkI5lYnTkB2Bk23TWbVq6RXTSgr5D45ItmZC/FkYfPGIJbCG8ePoK6In4ntxOm5YThQc116JozFFtIRWMM4tP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONNs1iqr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FCQad4028136
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 19:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DD5m6rCmDQIjqQ7c9/0l259A
	AQiV4k+olGsaoDERcrw=; b=ONNs1iqrmt/rOJkzHYLy0+8epzoW4tWZvkrPRbiQ
	8q2kOm0EzRnNi66Og1KUWIWSNl7MPdmAHR97uCAn3qWQRCqO6y6x3vtttMkppVxY
	AUCPD4f7wScOb7f/cSWF7qqaMzGGFVLyUEXo/0vgBUu+T0GrHNREEppICc33drtm
	5w6kfFBiKvy/glC9SC0BvzyFFREAuipNckj0oW6Bh/XmfMhzKtNvPV0kwIi2Jvgl
	XNOtIgbY2+YP7pxwUA10J+33ILFfnhoWwcOQ6s64NiWciA+9aSOf3Usk+0bB7AUE
	FlsQ9aIiPE0qd2tCmmfG9sAxwJHFeh04UVYAbZKNTkLs4g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429exw2ptq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 19:24:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-7db8197d431so7471896a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 12:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729020295; x=1729625095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DD5m6rCmDQIjqQ7c9/0l259AAQiV4k+olGsaoDERcrw=;
        b=T819PYWR+T3/MqtQkwQDa/X4DEqO5/yI4/fQ3Ofx9FDS6e7wG8+AHdissU94Bx0OSr
         OCis3ulc4I/i6ir4WdjqANHzpDUf+xXi8ktDnikUnuZjIUNhpuU310bUzt10HqyA/r0b
         8VHqklWAaPFhBTqa6tggvwO8RGeOxKpgyecY7uKws6nFmKjP7WsEli0weENB41kK2dlD
         PgjVL7sh/Zv2QELiujMkfea5W5MHEd+3TWCIEAjvpjsxWO+RsaimJ3EmGnbfOvUs4Dy1
         fz4LBQ2O38mVFfYbutUhfjAflVFwBXWW+ACZQVidu0uVtgHLaxCnjKkHpAptV854szrf
         WEHQ==
X-Gm-Message-State: AOJu0YzTIb9qjkii2tiV2hF6Up1rfob4NfZXUDfg4GtZvJ+Kdo7/Jh3M
	J6Hc5NsKml9v+hSoJCB6/j+yUqdZKJaQNB2oMCLmRLxVf5V8wKc9gMl5EbXgHBlEd4updowH53e
	d5Zovfi6Tu3mq7iMub3/5vZrPRrqAodGZePzNl2hJMJmEhImfc7UUkFuRNHBTeDJm
X-Received: by 2002:a17:902:cecc:b0:20c:ab2d:a664 with SMTP id d9443c01a7336-20cbb2afd98mr195550065ad.59.1729020294868;
        Tue, 15 Oct 2024 12:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDQimAGIcRpo8mgZ/NINwY9nxQmHiP2DCXBYGK+itSsfqXP5xaNhSzQBPhpOhpHsyZMSymag==
X-Received: by 2002:a17:902:cecc:b0:20c:ab2d:a664 with SMTP id d9443c01a7336-20cbb2afd98mr195549845ad.59.1729020294515;
        Tue, 15 Oct 2024 12:24:54 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805afecsm15440265ad.249.2024.10.15.12.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 12:24:53 -0700 (PDT)
Date: Tue, 15 Oct 2024 12:24:51 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] rtc: pm8xxx: implement qcom,no-alarm flag for
 non-HLOS owned alarm
Message-ID: <Zw7Bg2ojkvNY1M+1@hu-bjorande-lv.qualcomm.com>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-2-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015004945.3676-2-jonathan@marek.ca>
X-Proofpoint-ORIG-GUID: sn25EjxLeRt23lgZl3eD8a_GjZTNuXOZ
X-Proofpoint-GUID: sn25EjxLeRt23lgZl3eD8a_GjZTNuXOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150130

On Mon, Oct 14, 2024 at 08:47:26PM -0400, Jonathan Marek wrote:
> Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
> Thus writing to RTC alarm registers and receiving alarm interrupts is not
> possible.
> 
> Add a qcom,no-alarm flag to support RTC on this platform.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Alexandre, please pick up the driver and dt-binding patch (i.e. patch 1
& 2) through your tree, and I can pick the dts patches through the qcom
tree.

Regards,
Bjorn

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 44 +++++++++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index c32fba550c8e0..1e78939625622 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -61,6 +61,7 @@ struct pm8xxx_rtc {
>  	struct rtc_device *rtc;
>  	struct regmap *regmap;
>  	bool allow_set_time;
> +	bool no_alarm;
>  	int alarm_irq;
>  	const struct pm8xxx_rtc_regs *regs;
>  	struct device *dev;
> @@ -473,9 +474,14 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  	if (!rtc_dd->regmap)
>  		return -ENXIO;
>  
> -	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> -	if (rtc_dd->alarm_irq < 0)
> -		return -ENXIO;
> +	rtc_dd->no_alarm = of_property_read_bool(pdev->dev.of_node,
> +						 "qcom,no-alarm");
> +
> +	if (!rtc_dd->no_alarm) {
> +		rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> +		if (rtc_dd->alarm_irq < 0)
> +			return -ENXIO;
> +	}
>  
>  	rtc_dd->allow_set_time = of_property_read_bool(pdev->dev.of_node,
>  						      "allow-set-time");
> @@ -503,7 +509,8 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, rtc_dd);
>  
> -	device_init_wakeup(&pdev->dev, 1);
> +	if (!rtc_dd->no_alarm)
> +		device_init_wakeup(&pdev->dev, 1);
>  
>  	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(rtc_dd->rtc))
> @@ -512,27 +519,36 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  	rtc_dd->rtc->ops = &pm8xxx_rtc_ops;
>  	rtc_dd->rtc->range_max = U32_MAX;
>  
> -	rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
> -					  pm8xxx_alarm_trigger,
> -					  IRQF_TRIGGER_RISING,
> -					  "pm8xxx_rtc_alarm", rtc_dd);
> -	if (rc < 0)
> -		return rc;
> +	if (!rtc_dd->no_alarm) {
> +		rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
> +						  pm8xxx_alarm_trigger,
> +						  IRQF_TRIGGER_RISING,
> +						  "pm8xxx_rtc_alarm", rtc_dd);
> +		if (rc < 0)
> +			return rc;
> +	}
>  
>  	rc = devm_rtc_register_device(rtc_dd->rtc);
>  	if (rc)
>  		return rc;
>  
> -	rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
> -	if (rc)
> -		return rc;
> +	if (!rtc_dd->no_alarm) {
> +		rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
> +		if (rc)
> +			return rc;
> +	} else {
> +		clear_bit(RTC_FEATURE_ALARM, rtc_dd->rtc->features);
> +	}
>  
>  	return 0;
>  }
>  
>  static void pm8xxx_remove(struct platform_device *pdev)
>  {
> -	dev_pm_clear_wake_irq(&pdev->dev);
> +	struct pm8xxx_rtc *rtc_dd = platform_get_drvdata(pdev);
> +
> +	if (!rtc_dd->no_alarm)
> +		dev_pm_clear_wake_irq(&pdev->dev);
>  }
>  
>  static struct platform_driver pm8xxx_rtc_driver = {
> -- 
> 2.45.1
> 

