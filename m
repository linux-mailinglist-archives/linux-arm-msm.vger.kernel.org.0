Return-Path: <linux-arm-msm+bounces-65034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 129E2B05A2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 14:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C8D61A644E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 12:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBE52E03F5;
	Tue, 15 Jul 2025 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DwxDrtjT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C13C2DEA72
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582654; cv=none; b=ZD0mC/ldlUaeBxKUMwYMrcSaFN3iVcQmX/kRRqixQ8wnrB2M81+kh/YHYssTt/P7lpzAAGtmHRorZ/pZBA+cfT7JRK5sX3tzqPJERqDLyBJjCh0SWOPW7mCviB08WMYjfJZUQCbq+6UXu+98T4oZciBbk8S1mg9GSQYbODq187I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582654; c=relaxed/simple;
	bh=WWk+Zz38J+A0lk1NwBDagUK+UNQd7WE179Tt+YtBOkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEtJXTuL8jmMxisI1EeLcnA+FTMLkKAVm6yKb7vcvGuElE672fS2SQDnwnnziUGkT5H+O7SxEgJASJ7inwjIaVYjGnJ1YLNPqxPaVEO2zt/Yd+cwNLA7PgShiGHTItH5DcBDE9gutHN4nT8UNOLoe+VFehKKKlSj+07tcfulwW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DwxDrtjT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7OJWL022925
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 12:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vll9rDGne1AoSKyOm+L2Rpgh
	eag73S1w5wXI4BU9WhU=; b=DwxDrtjTDCkY5VX8gp/sJ39WjfO+PJz5zmZ3sdhs
	bqPA1uVnPIfEGLII9VqnUxlDXxM+khrFIunyiqghfsq28KBM9j/Za8BjUDIxul8G
	y3kalwZbIxpwc78o8OVFaws9iUfb5e++dQRBgIeCCvWlZM/PyLPVs1PuBVz0oFfS
	UKT9cR+v00aMD4SH6pyc0oB64Pc4uwGWDwv3jUYuUtQ4ZHu8LhckZP1s8FfY3cjL
	F0KndfTafhNhO5ZjJ2ysX5ZaS0BXwu46dIuxUno9cYp3TwKAtZBfASCMMjvCHUAg
	0G1CpBW1m3EW0pcWn7XujoNnP8ws5GH0VgALSm0X8IOn5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb07aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 12:30:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3121cffd7e8so4267671a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 05:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752582649; x=1753187449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vll9rDGne1AoSKyOm+L2Rpgheag73S1w5wXI4BU9WhU=;
        b=MD197/aavL10jSxREM7l6w33aOvExuRwiOWfIurqMgIneBvpJ4Y1vCds9Glq1eGcQj
         x3quuLQEjX3koa2A47xLJBULsc+9Jgd+9iq5phQ34unU/Uq8VvqWJhOkqHyC0cP656Gg
         1/di5PV5unemhTxb89cnEJ77VfoPuuPCXLD5XnCw2kUJfyVSNirhwRVJryBK6s0LTh/d
         /rAYdqjHteu1UC6kstM994mzYS7EjJ/EhjEqPhk121h/IRLAnT68pZARa6r5XWSta89k
         f5E+pOiSrit7kQoZdodff8PMmwH5KKDRwTS9zGNZF6j2G31qL/2nha3Z7Kb+juvCP/Rr
         JFLg==
X-Forwarded-Encrypted: i=1; AJvYcCXAFiM2gQb50G+3dQaB5UmU+MPLIzfBUNcK9pAdBE4GHir81pShGWX+C8+ptuqWdpYu0wJ43HQwwWNH/Jv/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4z5bJ8elBUY8g22beaSOfY4/nxkXwB9v77P1cvwoGzyxJuf4Z
	kmplWaLZiBL+Skx8dojDwviMTz8FGrwq1JtmnhppU3+2x2vDXXKp8VLIVXEcB4e31X+jkNZBUUy
	o/EYCOl+OHjU7as6RGF0AN5UC2CGNLJTRkp1Psxa1PUpkvMct5Rca08Wyuv3LBcjFaCkYxkg0/Q
	vyPZmt9sryPkn4F6+KlYygont99412gxdeNqq8SdnKHf0=
X-Gm-Gg: ASbGncv63XNnMolZ2rDtHoDfa1J5ahsQ1O3v80VTb4+q7gcNPhJ+AJqsmc2PPHcHTUD
	d9unMzlaQ6RcJ1VeHMk63awwig3XRe/RoUIp4z8bdAycBISUm2apbtyyMAkwvrz/nUTdSqqnedi
	ZEihqzmidY10LSfRTRlg==
X-Received: by 2002:a17:90b:57ee:b0:311:ef19:824d with SMTP id 98e67ed59e1d1-31c4f48b04fmr24534268a91.2.1752582649349;
        Tue, 15 Jul 2025 05:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+QKgmUT1LtI1tPLIsEldlE+Xv3jc/Myv45x2YTeyCk85wFHdk/rhiwhDMhBYh15+FloJ3fZb+aHNfPlztF/k=
X-Received: by 2002:a17:90b:57ee:b0:311:ef19:824d with SMTP id
 98e67ed59e1d1-31c4f48b04fmr24534218a91.2.1752582648728; Tue, 15 Jul 2025
 05:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-8-quic_ptalari@quicinc.com> <d6cr4elhrbh27lmlcv5xzuel75uvsgi7klxjkevm7vg4jcbawe@5ojgetrxkag5>
 <f87807c9-5249-4d97-ab89-898b7d8d260d@quicinc.com> <tt2crsexdnhlotlo3z5uxyta6jrnnvom7aqwsjvopwueazbuih@2l4h6xjpwlar>
 <1c73b530-4f1a-4c45-91aa-b44efb8a8c1e@quicinc.com>
In-Reply-To: <1c73b530-4f1a-4c45-91aa-b44efb8a8c1e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 15:30:37 +0300
X-Gm-Features: Ac12FXx7o0vm61CvNFB6-j5iSJHx1nZh9qdvCU2mn-91NnumjNpXsNKHazRHWZE
Message-ID: <CAO9ioeVLPnqxL6Vz+GOFuqkiT8NcxW3buCP6Q81-rR72MwRxhQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] serial: qcom-geni: Enable PM runtime for serial driver
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
        quic_shazhuss@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: LaH66F5h8qS44QuxDlItyWAXgGXC7gJV
X-Proofpoint-ORIG-GUID: LaH66F5h8qS44QuxDlItyWAXgGXC7gJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExNCBTYWx0ZWRfX1Ef2r7hK1jAe
 mPI37wFPhr64zWz50CEUTmUptL8ZA0HUF1EVo74rHALYGFdj/asePdf+w0pWw2Nk298aTdOC7lx
 tPgIT8xWFHhr4+UrIwAuMkx0q9IeGgoYEir9kyGFRNoGZYP2rG9qwwpherKuRKiZ/iOeG3oYG6n
 fV7Rj0XEn6JtZawgZhxPArGSNEjPcS3tErgKzelHmT9gkkGncrLXEkNojkqst0qwU7E+EH7E66a
 N9Pxo1UdLX+R6msRAtE0F5+SJIjehfRcFCMsVPS1yVLRrkYeN0Ce2cqGuV7G/lqnzvrGTgV/D3Y
 27pxdQEvCPYUb4m8T2CmvX2e2IhztN9/mSxEVbGcrm2NzH7QagwRhCKAhFwx5v0OoIA4fTt2CSZ
 iuAZ4DgenWNuf5BxHNIctq30MMV4DAT+SqFLtIhjrv6OuME5LED4kLR2F57e0y3F5LehiXZ5
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687649fa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=U3XR-vgVohVsxwl5X4IA:9
 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150114

On Mon, 14 Jul 2025 at 19:21, Praveen Talari <quic_ptalari@quicinc.com> wrote:
>
> Hi Dmitry/Bjorn/Krzysztof,
>
> Thank you for review.
>
> On 7/1/2025 4:42 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 30, 2025 at 10:40:25AM +0530, Praveen Talari wrote:
> >> Hi Bjorn,
> >>
> >> Thank you for review.
> >>
> >> On 6/17/2025 9:23 PM, Bjorn Andersson wrote:
> >>> On Fri, Jun 06, 2025 at 10:51:13PM +0530, Praveen Talari wrote:
> >>>> Add Power Management (PM) runtime support to Qualcomm GENI
> >>>> serial driver.
> >>>>
> >>>
> >>> Doesn't this have impact on the behavior outside of your
> >>> project? Or is the transition from qcom_geni_serial_pm() to explicit
> >>> RPM merely moving code around?
> >>>
> >>> Seems like this deserves to not be hidden in a middle of a patch series.
> >>>
> >>>> Introduce necessary callbacks and updates to ensure seamless
> >>>> transitions between power states, enhancing overall power
> >>>> efficiency.
> >>>>
> >>>
> >>> This commit message fails to state why we need runtime PM support in the
> >>> driver.
> >>
> >> Introduce PM runtime support to the Qualcomm GENI serial driver to enable
> >> better power efficiency and modularity across diverse resource control
> >> mechanisms, including Linux and firmware-managed systems.
> >>
> >> As part of this enhancement, the existing qcom_geni_serial_pm() logic to
> >> use standard PM runtime APIs such as pm_runtime_resume_and_get() and
> >> pm_runtime_put_sync(). Power state transitions are now handled through
> >> the geni_serial_resources_on() and geni_serial_resources_off() functions.
> >>
> >> Is it fine?
> >> Please guide me/correct me if needed
> >
> > Please start by stating out the problem that you are trying to solve.
> > There is no actual issue description in your patch.
>
> I hope this commit describes the actual problem.
>
> The GENI serial driver currently handles power resource management
> through calls to the statically defined geni_serial_resources_on() and
> geni_serial_resources_off() functions. This approach reduces modularity
> and limits support for platforms with diverse power management
> mechanisms, including resource managed by firmware.
>
> Improve modularity and enable better integration with platform-specific
> power management, introduce support for runtime PM. Use
> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
> qcom_geni_serial_pm() callback to control resource power state
> transitions based on UART power state changes.

LGTM

>
> Thanks,
> Praveen Talari
> >
> >>
> >> Thanks,
> >> Praveen Talari
> >>>
> >>> Also, start your commit message with a problem description, per
> >>> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> >>>
> >>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> >>>> ---
> >>>> v5 -> v6
> >>>> - added reviewed-by tag in commit
> >>>> - added __maybe_unused to PM callback functions to avoid
> >>>>     warnings of defined but not used
> >>>> ---
> >>>>    drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++++++----
> >>>>    1 file changed, 29 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> >>>> index b6fa7dc9b1fb..3691340ce7e8 100644
> >>>> --- a/drivers/tty/serial/qcom_geni_serial.c
> >>>> +++ b/drivers/tty/serial/qcom_geni_serial.c
> >>>> @@ -1686,10 +1686,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
> >>>>                    old_state = UART_PM_STATE_OFF;
> >>>>            if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> >>>> -          geni_serial_resources_on(uport);
> >>>> +          pm_runtime_resume_and_get(uport->dev);
> >>>>            else if (new_state == UART_PM_STATE_OFF &&
> >>>>                     old_state == UART_PM_STATE_ON)
> >>>> -          geni_serial_resources_off(uport);
> >>>> +          pm_runtime_put_sync(uport->dev);
> >>>>    }
> >>>> @@ -1827,9 +1827,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> >>>>                    return ret;
> >>>>            }
> >>>> +  pm_runtime_enable(port->se.dev);
> >>>
> >>> Any reason not to use devm_pm_runtime_enable() and avoid the
> >>> two pm_runtime_disable() below?
> >>>
> >>> Regards,
> >>> Bjorn
> >>>
> >>>> +
> >>>>            ret = uart_add_one_port(drv, uport);
> >>>>            if (ret)
> >>>> -          return ret;
> >>>> +          goto error;
> >>>>            if (port->wakeup_irq > 0) {
> >>>>                    device_init_wakeup(&pdev->dev, true);
> >>>> @@ -1839,11 +1841,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> >>>>                            device_init_wakeup(&pdev->dev, false);
> >>>>                            ida_free(&port_ida, uport->line);
> >>>>                            uart_remove_one_port(drv, uport);
> >>>> -                  return ret;
> >>>> +                  goto error;
> >>>>                    }
> >>>>            }
> >>>>            return 0;
> >>>> +
> >>>> +error:
> >>>> +  pm_runtime_disable(port->se.dev);
> >>>> +  return ret;
> >>>>    }
> >>>>    static void qcom_geni_serial_remove(struct platform_device *pdev)
> >>>> @@ -1855,9 +1861,26 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
> >>>>            dev_pm_clear_wake_irq(&pdev->dev);
> >>>>            device_init_wakeup(&pdev->dev, false);
> >>>>            ida_free(&port_ida, uport->line);
> >>>> +  pm_runtime_disable(port->se.dev);
> >>>>            uart_remove_one_port(drv, &port->uport);
> >>>>    }
> >>>> +static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
> >>>> +{
> >>>> +  struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> >>>> +  struct uart_port *uport = &port->uport;
> >>>> +
> >>>> +  return geni_serial_resources_off(uport);
> >>>> +}
> >>>> +
> >>>> +static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
> >>>> +{
> >>>> +  struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> >>>> +  struct uart_port *uport = &port->uport;
> >>>> +
> >>>> +  return geni_serial_resources_on(uport);
> >>>> +}
> >>>> +
> >>>>    static int qcom_geni_serial_suspend(struct device *dev)
> >>>>    {
> >>>>            struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> >>>> @@ -1901,6 +1924,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
> >>>>    };
> >>>>    static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> >>>> +  SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
> >>>> +                     qcom_geni_serial_runtime_resume, NULL)
> >>>>            SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
> >>>>    };
> >>>> --
> >>>> 2.17.1
> >>>>
> >



-- 
With best wishes
Dmitry

