Return-Path: <linux-arm-msm+bounces-32889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C77DE98BE67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 15:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835781F243F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 13:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530821C57B7;
	Tue,  1 Oct 2024 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GnuMn/Lg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824EB1C3F32;
	Tue,  1 Oct 2024 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727790651; cv=none; b=ohkzphgUgVoHAYwEbXWdInK9iLyQxIpW/wP7RdCh/3/atMmGVW6jfNtQe9D94v5yOSRBssLtdwYZ5gDn1arXKJV9qpC1ySquuIvVFIGsG2U0leW5Pvrl+J23ivzJzh7OIq9B3QmQYXwQotlmF0zdAEPtkp2W/yUsGEC9Sx/Ej30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727790651; c=relaxed/simple;
	bh=ya6s4OjLzDBKkaqKYGPBmAej5LeuqLuwewX2rXjZYJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZOmt2H1q9Nwl447MNSDKIVbt9mZ83XBrNPm206DYZI7ZJnq2FXNeDDYn/e2eZgjchpnZC2ubIjBQVUNIzDpMU2E7UnJWwmR7iAGutAwdxYpyYqYzmVFZsCkG5/kLbu0BYAJCaDcA37Eamn4ChLQEoWBDuCLCWhHPmW6ZPDZyqxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GnuMn/Lg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4919L1xt008272;
	Tue, 1 Oct 2024 13:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9VLqU+1fU/5jRjetzCchLu2MxMyXC5eBuEI49ITUIwU=; b=GnuMn/LgYS5WJzeo
	vxSR4oJlHXGYnPLXJIB6IJh5IFsygVUPXf492+3OsH5Dw8iwuqyaPUtolT/ZW3BL
	B3xC8+n7+lIN1MtunB0gfIDWjOuBX4D1Ww8ccIiAMvRHUo5tjd7DPCU+Ms8BdERl
	zFN/JCdvbkU+Jy0YeRp0L8yeVIMl/lBUvdjjFLNfD+2NT02t5jMMsChTHjUy5tTt
	UNtJU5PcA5+zRucXJUQQmBH8HVXJ4ksrKa11yS/PWqcp0aW/f5VDCL53mntZ/I7D
	zs4ENaL2firkQEFF3AZClkyXoML/xNfCA/I6c67UOl+VZJz4ijBWpp5Nsf/26ZF0
	yYO+MA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9vu8dra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 13:50:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 491DohWH000842
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 13:50:43 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 06:50:40 -0700
Message-ID: <b7c9b01a-3bf7-44f2-be8d-24ef5f3fce74@quicinc.com>
Date: Tue, 1 Oct 2024 19:20:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] serial: qcom-geni: fix premature receiver enable
To: Johan Hovold <johan+linaro@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Jiri Slaby <jirislaby@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Douglas Anderson
	<dianders@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <stable@vger.kernel.org>,
        Aniket Randive <quic_arandive@quicinc.com>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-2-johan+linaro@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20241001125033.10625-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W0LmDSeJrm03zOcYsJ9sRXydL859rAfW
X-Proofpoint-ORIG-GUID: W0LmDSeJrm03zOcYsJ9sRXydL859rAfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010089

Thanks Johan for the fixes.

On 10/1/2024 6:20 PM, Johan Hovold wrote:
> The receiver should not be enabled until the port is opened so drop the
> bogus call to start rx from the setup code which is shared with the
> console implementation.
> 
> This was added for some confused implementation of hibernation support,
> but the receiver must not be started unconditionally as the port may not
> have been open when hibernating the system.
> 
> Fixes: 35781d8356a2 ("tty: serial: qcom-geni-serial: Add support for Hibernation feature")
> Cc:stable@vger.kernel.org	# 6.2
> Cc: Aniket Randive<quic_arandive@quicinc.com>
> Signed-off-by: Johan Hovold<johan+linaro@kernel.org>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 6f0db310cf69..9ea6bd09e665 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1152,7 +1152,6 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
>   			       false, true, true);
>   	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
>   	geni_se_select_mode(&port->se, port->dev_data->mode);
> -	qcom_geni_serial_start_rx(uport);
Does it mean hibernation will break now ? Not sure if its tested with 
hibernation. I can see this call was added to port_setup specifically 
for hibernation but now after removing it, where is it getting fixed ?
I think RX will not be initialized after hibernation.
>   	port->setup = true;
>   
>   	return 0;
> -- 2.45.2

