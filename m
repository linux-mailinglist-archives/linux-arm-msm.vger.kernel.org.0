Return-Path: <linux-arm-msm+bounces-61479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA4FADB618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F7EE188B495
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FE428641F;
	Mon, 16 Jun 2025 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XeAJNb4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED3E283CBD;
	Mon, 16 Jun 2025 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089883; cv=none; b=uBnMH4wKgEgKqSB9jePzheAvJHJwynf4PG0W426povkLxkcJmFCZ1UNtYb9VL1JSFJMLOlE5UOE3Dv5p1X/odjvsq1HHXZiR6DPk4Gc1uQscU+CwzPfEk+Q/XWOBYNpz/CTv8p6vCGHFA2KCTb6qW9a9JVG+tZuMCo0HURGv/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089883; c=relaxed/simple;
	bh=4i0m/14BXCehb1bURjYgdNwmL0nuOwpk+bAUh2HlVfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Plt8ZMW3t7sIyVMrp6e8HOTVQImmxtlGA37bWTIECST76en+s6PBS/AYMS0b9DEbLwvdecer4NG7XfUTJqz8b/Jm6dVj0CN4sEMIAvhBjjL0l4kDmlII2RgUYvVZQMqTDbK/6SU0dhy8LlnLfuJjdzQHlZUMRGGUVmOFvaPN2uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XeAJNb4b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8dDql019473;
	Mon, 16 Jun 2025 16:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PalnoA7Aqj4g1TN3NQrWj4j5JVW/HWc+WnQeOaO9HKg=; b=XeAJNb4b674MuJoj
	hhX90aTbtPKz/4m62i/Lrykai6sWrTlea1L/Sae74ZycHI383yAnQQNOVdhLVie6
	PEEpEioJ1SHOJY2DdQk4KV17Y8DlL39qmu3zAgkjMJOPGqJx59dQqa0PGi2xLcR5
	SHbsDgHIKa5Oear+RTWMXQC3Fc2FRZOUYXM/hCDNmvEHYa+r5Su+rwcBmtmJYOpq
	wBX5Asw/NgDeJdmmK8yZ1tNup8qBcZ15jiClcXu+bF9hXnpqWVHV73Qxq5WktMRs
	dIJth3lC/5VJ3GjIYIrFz32g3Z/0CuCpNFr1kmoRha5KR0qtUPpM9vbI0uuq3Olo
	fek/Ug==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h954qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 16:04:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GG4ZmV020198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 16:04:35 GMT
Received: from [10.216.4.100] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 09:04:29 -0700
Message-ID: <509c94bb-cf31-43bb-a92d-db006efd43aa@quicinc.com>
Date: Mon, 16 Jun 2025 21:34:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] serial: qcom-geni: move clock-rate logic to
 separate function
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-7-quic_ptalari@quicinc.com>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <20250606172114.6618-7-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dfjNEMNrv_M2QXivt2QwV8_rdesJ9iGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNCBTYWx0ZWRfX5JjzziloWYIy
 BWsPLWMJkYOBmzqxyaYugMrQYSCBQA12HJDtRyv36NQja2gX1QgihVK3niY1UycG48T5V2IR8Ke
 jYoDMu45gDVzBnfOiUycU2FFIakMW8DCKwZvThCSt+4RFyzqG12VZrFKXBVppLIM7ayQCPrsrJg
 3GOEmiMbasjqQOskqz+/roQxpBtG4yCoWFwwoivKnVywiGFSKcoKDBtijAWaayZBDCJnhl/4WWo
 RX7OZyZb2TS9OR3/EEwED0uzKZfWcoarMnCpOld5RxUPeu+zwexmpFvqIUy80zUIcVvRzJ2UoHO
 MoVdfYCV5a4PkrKOR3s5DXipSKkpXsO+u2/2vcbCr9WNf3/l3ZhzvlCOBUC29ORyRMcs9BogKj+
 UfP7YjcMUHyKK6J2abEEXYhMst7/yfP1CSOrT6z6SBa54RkowaGP7+TjoPJJqEhPFO6vAbFO
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68504094 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=E4x2KR17IadLq3rmprIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dfjNEMNrv_M2QXivt2QwV8_rdesJ9iGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160104

Hi Bryan,

Gentle reminder!!

Thanks,
Praveen Talari

On 6/6/2025 10:51 PM, Praveen Talari wrote:
> Facilitates future modifications within the new function,
> leading to better readability and maintainability of the code.
> 
> Move the code that handles the actual logic of clock-rate
> calculations to a separate function geni_serial_set_rate()
> which enhances code readability.
> 
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
> v5 -> v6
> - used "unsigned int" instead of "unsigned long" in newly
>    added API function params to avoid the format specifier
>    warnings.
> 
> v3 -> v4
> - added version log after ---
> 
> v1 -> v2
> - resolved build warnings for datatype format specifiers
> - removed double spaces in log
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 56 +++++++++++++++++----------
>   1 file changed, 36 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 715db35bab2f..b6fa7dc9b1fb 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1283,27 +1283,14 @@ static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
>   	return ser_clk;
>   }
>   
> -static void qcom_geni_serial_set_termios(struct uart_port *uport,
> -					 struct ktermios *termios,
> -					 const struct ktermios *old)
> +static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
>   {
> -	unsigned int baud;
> -	u32 bits_per_char;
> -	u32 tx_trans_cfg;
> -	u32 tx_parity_cfg;
> -	u32 rx_trans_cfg;
> -	u32 rx_parity_cfg;
> -	u32 stop_bit_len;
> -	unsigned int clk_div;
> -	u32 ser_clk_cfg;
>   	struct qcom_geni_serial_port *port = to_dev_port(uport);
>   	unsigned long clk_rate;
> -	u32 ver, sampling_rate;
>   	unsigned int avg_bw_core;
> -	unsigned long timeout;
> -
> -	/* baud rate */
> -	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
> +	unsigned int clk_div;
> +	u32 ver, sampling_rate;
> +	u32 ser_clk_cfg;
>   
>   	sampling_rate = UART_OVERSAMPLING;
>   	/* Sampling rate is halved for IP versions >= 2.5 */
> @@ -1317,7 +1304,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>   		dev_err(port->se.dev,
>   			"Couldn't find suitable clock rate for %u\n",
>   			baud * sampling_rate);
> -		return;
> +		return -EINVAL;
>   	}
>   
>   	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
> @@ -1339,6 +1326,37 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>   	port->se.icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(baud);
>   	geni_icc_set_bw(&port->se);
>   
> +	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
> +	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
> +	return 0;
> +}
> +
> +static void qcom_geni_serial_set_termios(struct uart_port *uport,
> +					 struct ktermios *termios,
> +					 const struct ktermios *old)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +	unsigned int baud;
> +	unsigned long timeout;
> +	u32 bits_per_char;
> +	u32 tx_trans_cfg;
> +	u32 tx_parity_cfg;
> +	u32 rx_trans_cfg;
> +	u32 rx_parity_cfg;
> +	u32 stop_bit_len;
> +	int ret = 0;
> +
> +	/* baud rate */
> +	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
> +
> +	ret = geni_serial_set_rate(uport, baud);
> +	if (ret) {
> +		dev_err(port->se.dev,
> +			"%s: Failed to set baud:%u ret:%d\n",
> +			__func__, baud, ret);
> +		return;
> +	}
> +
>   	/* parity */
>   	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
>   	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
> @@ -1406,8 +1424,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>   	writel(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
>   	writel(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
>   	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
> -	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
> -	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
>   }
>   
>   #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE

