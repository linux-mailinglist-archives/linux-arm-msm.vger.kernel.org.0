Return-Path: <linux-arm-msm+bounces-53622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DE5A8218C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 12:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BF8B188EA8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 10:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B8325D1FB;
	Wed,  9 Apr 2025 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V4PmSmjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD83081732;
	Wed,  9 Apr 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192827; cv=none; b=TVrM5kkppAqE99hhiWAfy/ROWREhyY1qB+LttO1SmMRh5RZWWcuU1Zvsd6CxyDOm3pve+RVelNGYypb97jJOU7n7PbWpSCqYdRK4VJ7tStFFeKSBZ2yMC0P9rgWLwYnwbkzapEi8m7e3EoNrB9XR5CNZ5iUKATx8WepcBG8Lwug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192827; c=relaxed/simple;
	bh=ra1gWvhRfQ7OeMNbT9JribU8S6S5t6HLE6ColmefYgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eUP63pxniX7lKukfpMDvPl8/re+EOKDT4laq/Sh85X024Hq88/qiZs2ySHOYXX8SA78lMEwGRa4CPw5I7v4s6lPbKNt2uoAie8s4WwYMWprynsK3ZudSEThYVM0sloeELoAgSzJZnys9+1LZ876X4QKiZ28jN8faiAZifIFwDE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V4PmSmjB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398pix2023950;
	Wed, 9 Apr 2025 10:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rX9XLFRceq+Xg+O30vXrjCssF3zLmNZ1LO7pHejhOrM=; b=V4PmSmjBaFcGMhma
	CJHIBJyFJxL0nI4m2hgyue8CfKu84MGQF/kcEd81fA3PYodswXAJ7n4vb3PyGc+M
	P2mGTf7qiP7fhxbl3leGF5JvMeCPYuSHAUop/GqS8279t4hSx71FIebYrgLBqJWP
	qkrA9ldi82oAxOnMWjxHWLQXo5Tb2PrkREAaAuypLKT50sAcZQp75PJCL98WIemo
	giKY6D1R1iImsS++oKWS8OUvj0Zgk/ybYysW+gZbojvCIiSR4pZJ9HjODS8qcf/l
	W0ne0um56gZ6nrJ2gQvbQ7MgkqCsoxs514S8bNUeDhSSii2tDd8rVsr+dL4LJ3G0
	sYfAPw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkjsgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 10:00:10 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539A08gZ016318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 10:00:09 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 03:00:05 -0700
Message-ID: <058f8b9c-55db-4735-bf61-b1e0f3d05953@quicinc.com>
Date: Wed, 9 Apr 2025 15:30:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: msm: Configure correct working mode before
 starting earlycon
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        Sam Day
	<me@samcday.com>,
        Chandana Kishori Chiluveru <cchiluve@qti.qualcomm.com>
References: <20250408-msm-serial-earlycon-v1-1-429080127530@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250408-msm-serial-earlycon-v1-1-429080127530@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7Eoy4YQYWfSE_wAoyX39KherdeSfoojo
X-Proofpoint-ORIG-GUID: 7Eoy4YQYWfSE_wAoyX39KherdeSfoojo
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f6452a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=9ZjCt1urELoYYm11rQMA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090054



On 4/8/2025 10:52 PM, Stephan Gerhold wrote:
> The MSM UART DM controller supports different working modes, e.g. DMA or
> the "single-character mode", where all reads/writes operate on a single
> character rather than 4 chars (32-bit) at once. When using earlycon,
> __msm_console_write() always writes 4 characters at a time, but we don't
> know which mode the bootloader was using and we don't set the mode either.
> 
Looks surprising. I haven't seen pre-kernel UART console ever works in 
DMA mode. It was always fixed to work in FIFO/PIO mode. From what i know.
> This causes garbled output if the bootloader was using the single-character
> mode, because only every 4th character appears in the serial console, e.g.
> 
>    "[ 00oni pi  000xf0[ 00i s 5rm9(l)l s 1  1 SPMTA 7:C 5[ 00A ade k d[
>     00ano:ameoi .Q1B[ 00ac _idaM00080oo'"
> 
> If the bootloader was using the DMA ("DM") mode, output would likely fail
> entirely. Later, when the full serial driver probes, the port is
> re-initialized and output works as expected.
> 
AFAIR, console UART was always configured in FIFO/PIO mode. For non 
Console application e.g. Bluetooth it works in DMA mode.
> Fix this also for earlycon by clearing the DMEN register and
> reset+re-enable the transmitter to apply the change. This ensures the
> transmitter is in the expected state before writing any output.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0efe72963409 ("tty: serial: msm: Add earlycon support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/tty/serial/msm_serial.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 1b137e06844425584afe5d3f647e9537c6e2d658..3449945493ceb42369d2acafca925350fccc4f82 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -1746,6 +1746,12 @@ msm_serial_early_console_setup_dm(struct earlycon_device *device,
>   	if (!device->port.membase)
>   		return -ENODEV;
>   
> +	/* Disable DM / single-character modes */
> +	msm_write(&device->port, 0, UARTDM_DMEN);
> +	msm_write(&device->port, MSM_UART_CR_CMD_RESET_RX, MSM_UART_CR);
> +	msm_write(&device->port, MSM_UART_CR_CMD_RESET_TX, MSM_UART_CR);
> +	msm_write(&device->port, MSM_UART_CR_TX_ENABLE, MSM_UART_CR);
> +
>   	device->con->write = msm_serial_early_write_dm;
>   	return 0;
>   }
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250408-msm-serial-earlycon-4c5dfa782496
> 
> Best regards,


