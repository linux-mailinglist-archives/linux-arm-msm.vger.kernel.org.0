Return-Path: <linux-arm-msm+bounces-63198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F9AEF635
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E5A13B3659
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05B6272800;
	Tue,  1 Jul 2025 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcXtpURC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E2F1DED52
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368335; cv=none; b=PaeMbUMvXlqSxDhqtJuWYfPIZBjhM2d52MLzp8hwl7DY+fEFq0r3RWv8aMbfq5iWZto6KzpKTVzjCwnZIrYw11zcU1vh4VdEyadwK81vRytZDbZsjjcUcgzvZgpYjJNjkb9PXo5onRrX2EzTSaeCv0WKlNVqFIi243+4Dszo5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368335; c=relaxed/simple;
	bh=QEZ21qlcwB44HosYYOE2/QtOlPopnVPyTlzTQNsGFuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxti79kNTnCsMX4eXvttQH5plOHd0Yt81TiK64u4hTOnmC4MtL7XkNPXfksrhMiA86VKczxGm0goTlXsteIJvL2XEIMTvk3y2Lef/bTLqLsjmbx7MZyAeYUBBTyhFrH5613McdQ6d7T62OZJ8uL1B+yTCRxR9Th53mRzOs7i2lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcXtpURC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619m8pY008301
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 11:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wn8dIacluJa4oe1kQscHimYh
	2WUFSc+TGJ60KVihadk=; b=FcXtpURCA3rqRaj2db5Nz7QWjZH3PELmVJ1qUYG5
	G2tJp1PIWDe91UC7tCzakD+6FB1WFzT6vF9tONX13TeHQbxfIlRoZkRqeg9lMIq3
	z+/RmOkVBunY+Q+d+Ux+CcGuXj4TzTpOPDlmUVFDay/unbz2SvAUjrlmGl+ot31c
	+9TOFltv71Y1AlBKMepawxccGLO/R+FGF2nSmP7IRqXcISTixBxEbOlP+g3TZfKX
	eEiLHrpd3AW3hAfG0JzHia1V0HCeQdlOk0TDOTbQT8AanPOVBOAJUJXa0YXhbj6C
	g/eR1pNq1CQ2SfZ+/DjRfJy0NoF1Vmx8m0Q/KMHLJdqHfg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmwakw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 11:12:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d44d773e23so855973985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 04:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368331; x=1751973131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wn8dIacluJa4oe1kQscHimYh2WUFSc+TGJ60KVihadk=;
        b=G8t4pJVWn0//AeyHkJBGghtNv/oFUSN5Y8Hsx/SfgGw9lJnxpjhA6OiLAUSPV33GKW
         E0afem7dc6TAx+PxGHiQ8wtfTZC0d7Vs200zfcm0IRoTM/v3Bp9yfYsco3uBGHPyPDSf
         ONgo3HZiEHMj38eZzjhsAuz3ofb7azohTTRAZasO6Kelij54slph+bWTEw8BroFKXHSH
         nej8Cu0PLMJOKIqedJiq5lRX3WugEDz3Cv6W3vqVELQoLb3CIC3U3TdYXz+HZyQuY/7Z
         SDH80w9F7wQ8giQhGFeekMi05iMkY3VHTbxGLcKN7IMp0D876MyyiUHTE6weclpOmOxH
         KYOA==
X-Forwarded-Encrypted: i=1; AJvYcCXMGpEmuZS7F8GN/RhGujYB9P+v7Hbw2rRvSC398OO45yQ2UYEZZKrOXW5TajQlMZnLuNk9yZPOoolK2eQz@vger.kernel.org
X-Gm-Message-State: AOJu0YwGVe/ZJcr6QRjj06cihhygA/k8nYjfi7t17IWJhnRoOTh+ml/0
	hr0ienr7Skzph23XqkFXka08kdPj6dxf22cXPEYZfYE8mqnljvWR1o3AXSZu0HHkdAULXXMWVYz
	HVyf3rAtZLomr7YUnbsuOenga+Bf85Ej+7bc1bezmhmeC/8LPuvfOpZboJKGoKT2n3AiV
X-Gm-Gg: ASbGncvq7QVm3jEz7RHRPViEO8rxVhogaRl33Phrl0AGoy2w3Y6P/oj48lynF4HSQ8f
	8/eyOwU3PkjYnip+Y4ZFAFDnm5HFDY7y9ar/hw5Dz59/+ivFjoT7oKEIisARsU0Y+gsoJv/MzW+
	u37hsrTLlKOHO8LOIGk4oFzO30WgSwJ8e5/zKUjb78a8sIQ+MQLv5+sg4Fm5ifENXYprSlyE4I0
	/If7EKNwRlMt7qnufTvp9gs5H5ko7MJiXZiQ949sVTaz/hkXBMWEuvgukbMi00q4A6F7YbD1iwZ
	wR+ts/6Oc3W+xObWnUtzR3DG89Z67yyZO0T5e37m1ETxrKR53G5wPsBodcEoQ35FT370hyw3lQp
	yhW8jaKcOTet92Gyza/nUv28/lz0cNvnYbiY=
X-Received: by 2002:a05:620a:6504:b0:7d4:57b7:bbf8 with SMTP id af79cd13be357-7d457b7beb5mr1100026985a.49.1751368330758;
        Tue, 01 Jul 2025 04:12:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF9diEhxnvxYx9K6OFtUy5pjQeD6hdLrsmwhYyKkExk8FnCoGf4cY0maUEtbdzawGa3/IPCA==
X-Received: by 2002:a05:620a:6504:b0:7d4:57b7:bbf8 with SMTP id af79cd13be357-7d457b7beb5mr1100021485a.49.1751368330318;
        Tue, 01 Jul 2025 04:12:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24038bsm1797002e87.25.2025.07.01.04.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:12:09 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:12:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: Re: [PATCH v6 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
Message-ID: <tt2crsexdnhlotlo3z5uxyta6jrnnvom7aqwsjvopwueazbuih@2l4h6xjpwlar>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-8-quic_ptalari@quicinc.com>
 <d6cr4elhrbh27lmlcv5xzuel75uvsgi7klxjkevm7vg4jcbawe@5ojgetrxkag5>
 <f87807c9-5249-4d97-ab89-898b7d8d260d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f87807c9-5249-4d97-ab89-898b7d8d260d@quicinc.com>
X-Proofpoint-ORIG-GUID: HKuOU0F5cmSesnbduNk1r2IRhdIMPs-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2OCBTYWx0ZWRfX0B1TNYVhfxAV
 1oXve1vVcTZPo+nI7GEpuFQtIJju7zISot1oj5hc56rtCkmwfqcLRMBJQs06eF40/L+RSMzWkUt
 +Ytaf16DIpi4F+j8eq5dlMCttcm5IdI9gT9YXOouHZJX1LTs2kgXuoFo60tN+2H/To5JwSds2L/
 8PrfBVJRAH4Jk0hhgdvXf8THr8xPlo6g06zGz2SQC+8IsCMjIZn++onpK+8QFjhwUeG/bytndG1
 ZAi82KlFo12DRIWDZVAQh/6Td2dTnxBxDATggY3gWlH/V7v6hopXkMYCBvzE7T5XtbDV8QCU9jD
 uz2LOUNDIU6w0qveopsmBmqJkx0i1OAkj8ifKADkgEWDThzA0Gnl3ll7Xr0vfl/LGUSAYonU+mK
 CF9S5r3c0PKg9R70XI3vXXJattZzngwup+2KWvjdvQa1FtX+ENi1cdZnQ8WNo5+st70fSlbi
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6863c28b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=Jl-IZ22V7OrDAWU4FEoA:9 a=CjuIK1q_8ugA:10 a=-_B0kFfA75AA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HKuOU0F5cmSesnbduNk1r2IRhdIMPs-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010068

On Mon, Jun 30, 2025 at 10:40:25AM +0530, Praveen Talari wrote:
> Hi Bjorn,
> 
> Thank you for review.
> 
> On 6/17/2025 9:23 PM, Bjorn Andersson wrote:
> > On Fri, Jun 06, 2025 at 10:51:13PM +0530, Praveen Talari wrote:
> > > Add Power Management (PM) runtime support to Qualcomm GENI
> > > serial driver.
> > > 
> > 
> > Doesn't this have impact on the behavior outside of your
> > project? Or is the transition from qcom_geni_serial_pm() to explicit
> > RPM merely moving code around?
> > 
> > Seems like this deserves to not be hidden in a middle of a patch series.
> > 
> > > Introduce necessary callbacks and updates to ensure seamless
> > > transitions between power states, enhancing overall power
> > > efficiency.
> > > 
> > 
> > This commit message fails to state why we need runtime PM support in the
> > driver.
> 
> Introduce PM runtime support to the Qualcomm GENI serial driver to enable
> better power efficiency and modularity across diverse resource control
> mechanisms, including Linux and firmware-managed systems.
> 
> As part of this enhancement, the existing qcom_geni_serial_pm() logic to
> use standard PM runtime APIs such as pm_runtime_resume_and_get() and
> pm_runtime_put_sync(). Power state transitions are now handled through
> the geni_serial_resources_on() and geni_serial_resources_off() functions.
> 
> Is it fine?
> Please guide me/correct me if needed

Please start by stating out the problem that you are trying to solve.
There is no actual issue description in your patch.

> 
> Thanks,
> Praveen Talari
> > 
> > Also, start your commit message with a problem description, per
> > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > 
> > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> > > ---
> > > v5 -> v6
> > > - added reviewed-by tag in commit
> > > - added __maybe_unused to PM callback functions to avoid
> > >    warnings of defined but not used
> > > ---
> > >   drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++++++----
> > >   1 file changed, 29 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > > index b6fa7dc9b1fb..3691340ce7e8 100644
> > > --- a/drivers/tty/serial/qcom_geni_serial.c
> > > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > > @@ -1686,10 +1686,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
> > >   		old_state = UART_PM_STATE_OFF;
> > >   	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> > > -		geni_serial_resources_on(uport);
> > > +		pm_runtime_resume_and_get(uport->dev);
> > >   	else if (new_state == UART_PM_STATE_OFF &&
> > >   		 old_state == UART_PM_STATE_ON)
> > > -		geni_serial_resources_off(uport);
> > > +		pm_runtime_put_sync(uport->dev);
> > >   }
> > > @@ -1827,9 +1827,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> > >   		return ret;
> > >   	}
> > > +	pm_runtime_enable(port->se.dev);
> > 
> > Any reason not to use devm_pm_runtime_enable() and avoid the
> > two pm_runtime_disable() below?
> > 
> > Regards,
> > Bjorn
> > 
> > > +
> > >   	ret = uart_add_one_port(drv, uport);
> > >   	if (ret)
> > > -		return ret;
> > > +		goto error;
> > >   	if (port->wakeup_irq > 0) {
> > >   		device_init_wakeup(&pdev->dev, true);
> > > @@ -1839,11 +1841,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> > >   			device_init_wakeup(&pdev->dev, false);
> > >   			ida_free(&port_ida, uport->line);
> > >   			uart_remove_one_port(drv, uport);
> > > -			return ret;
> > > +			goto error;
> > >   		}
> > >   	}
> > >   	return 0;
> > > +
> > > +error:
> > > +	pm_runtime_disable(port->se.dev);
> > > +	return ret;
> > >   }
> > >   static void qcom_geni_serial_remove(struct platform_device *pdev)
> > > @@ -1855,9 +1861,26 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
> > >   	dev_pm_clear_wake_irq(&pdev->dev);
> > >   	device_init_wakeup(&pdev->dev, false);
> > >   	ida_free(&port_ida, uport->line);
> > > +	pm_runtime_disable(port->se.dev);
> > >   	uart_remove_one_port(drv, &port->uport);
> > >   }
> > > +static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
> > > +{
> > > +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> > > +	struct uart_port *uport = &port->uport;
> > > +
> > > +	return geni_serial_resources_off(uport);
> > > +}
> > > +
> > > +static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
> > > +{
> > > +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> > > +	struct uart_port *uport = &port->uport;
> > > +
> > > +	return geni_serial_resources_on(uport);
> > > +}
> > > +
> > >   static int qcom_geni_serial_suspend(struct device *dev)
> > >   {
> > >   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> > > @@ -1901,6 +1924,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
> > >   };
> > >   static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> > > +	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
> > > +			   qcom_geni_serial_runtime_resume, NULL)
> > >   	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
> > >   };
> > > -- 
> > > 2.17.1
> > > 

-- 
With best wishes
Dmitry

