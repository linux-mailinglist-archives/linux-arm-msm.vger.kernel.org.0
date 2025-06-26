Return-Path: <linux-arm-msm+bounces-62681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DE2AEA30F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 17:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5655A1C44F53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 15:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48FC2EBDCF;
	Thu, 26 Jun 2025 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZLWAF3WW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B031DD877;
	Thu, 26 Jun 2025 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953448; cv=none; b=TZ5UBCg38IkBOCYwzUsJYMa23UAfTe2oFQw2AHDR+QMDw66NCLjRsvWCpFBylvxWJMb9Sps8pBAFnVnyqudD9l1Rjfh9sCn2ZMVFnoI94qzvbLQuR/wp4iYmXWRUGPa1eV18pamP6pl7Cz6GCvE8lvceAj62pfvfNfKyrkOHd1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953448; c=relaxed/simple;
	bh=6JWbMamyvHhdjBVtHAdEKl0VYOQ1UTS0CLtrLHlgRZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rg7EJd+cy80pqwt15NSFYTK6eZdzGvdIMXR9+f3MSpeqbEY6AQXmOhGQpPO6exnmtJwEzy2Hh6ucwUjNJKLVCtMRJy0hYAMvx05PNhOqM1qCsn0ISxKzRslnYZbMeaEqG5pMjoh9/vnwSXjvTVLy5lWrM9hF3jzyA8UpgaDfOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZLWAF3WW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9IHis003766;
	Thu, 26 Jun 2025 15:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voG4a/i08ZzBiT1eAP6p9N0cTFLoavHgXndP0j/QmbQ=; b=ZLWAF3WWQbaJT9/I
	jqx3gSADowH8nabNZKsZ5xdLdrB8IlzdBYjB+iUMWdIOAGIu/VJNr99hVxSknhwS
	rOcpSE6IoosS0IrHQEHIRnmeWDsiRgGlGFw9SaCBkbLuztpYjBDfs/mQQwwtfi80
	IOe1rnMHDwQibxErivg3I8JM3JZkpzcg8z+wMx/rrxosHw1fguDeZP+YcZDehVJ6
	ztJvM1NuXbnXHqKlyvvjerteGPfKR1wF0Rh6mymnGzVxL05JvuQo3vaQZJ42Mjfs
	KFgeGi62P2RrKUvUULSTzeqB2Sz/TjfcqQXqF46JcR0SSbwqD7LxqCAr3Kbri74Z
	jl5ExQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmwmn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 15:57:21 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55QFvLHW008178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 15:57:21 GMT
Received: from [10.216.16.3] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 08:57:15 -0700
Message-ID: <42eb99eb-5882-489f-b9f2-71d131429052@quicinc.com>
Date: Thu, 26 Jun 2025 21:27:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] serial: qcom-geni: move clock-rate logic to
 separate function
To: Bjorn Andersson <andersson@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <psodagud@quicinc.com>,
        <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-7-quic_ptalari@quicinc.com>
 <509c94bb-cf31-43bb-a92d-db006efd43aa@quicinc.com>
 <mtdi5hpkrthohdvhtbojhhp6saip2uohv5343vpqwz2jssvskp@lpebfyxhqcjt>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <mtdi5hpkrthohdvhtbojhhp6saip2uohv5343vpqwz2jssvskp@lpebfyxhqcjt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RqShRyVUgaAro1DVd4Rt_sUnvbYdlsDA
X-Proofpoint-ORIG-GUID: RqShRyVUgaAro1DVd4Rt_sUnvbYdlsDA
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685d6de1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=Hf93abl8SHV9aGI-kEQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEzNSBTYWx0ZWRfX0kBNRmKxgcPW
 ob51K9Y0FiJK83KR/UMTMMM1vuLEmQOrE1njReUluR7Ml6zRWva/UTrLyN082TcKdjCcBZHYZgj
 XfJQzeh32oI6HT/OByZPPjvLcCiJP07o13dz4W4ITbJhdw5i3fxq1Dk3XMrxq7zyRa0XkO/yay6
 cYvwk38zYoOhICPAL38FMUxZJDCh7dU30hANPOZ3eOVEdeTIjR4/eFPHBssh+v8rPEip+BTv7BB
 jrkPmJ7h4zwJlB3nKhKwEBmvz1WjXSBwP1Jsgp8a2pdIDaHGwZJTyUiuRjkZ9yVzquEjH1MLOEv
 GooB/klHhAcC/ljtFQ4btqV40W6xw8NcM65PuBfzO6y4YWI02lCLPFRu3bGhs3ILV6sO9TWAUb5
 zxYYbqTU8eqjYCbmDdJz5WKKamht2P+1EoaFFlr+B7jLyd/cU4i9iVxUM14kf80OjF7C2C5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260135

HI Bjorn,

Thank you for review.

On 6/17/2025 9:37 PM, Bjorn Andersson wrote:
> On Mon, Jun 16, 2025 at 09:34:27PM +0530, Praveen Talari wrote:
>> Hi Bryan,
>>
>> Gentle reminder!!
>>
> 
> As I've told you all countless times, if you want attention to your
> patchset review each others patches! For some reason you're the only one
> showing interest in getting this series merged.

My intention is to CC Bryan with a polite reminder, one week after the 
initial post.

> 
>> Thanks,
>> Praveen Talari
>>
>> On 6/6/2025 10:51 PM, Praveen Talari wrote:
>>> Facilitates future modifications within the new function,
>>> leading to better readability and maintainability of the code.
>>>
>>> Move the code that handles the actual logic of clock-rate
>>> calculations to a separate function geni_serial_set_rate()
>>> which enhances code readability.
>>>
>>> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
>>> ---
>>> v5 -> v6
>>> - used "unsigned int" instead of "unsigned long" in newly
>>>     added API function params to avoid the format specifier
>>>     warnings.
>>>
>>> v3 -> v4
>>> - added version log after ---
>>>
>>> v1 -> v2
>>> - resolved build warnings for datatype format specifiers
>>> - removed double spaces in log
>>> ---
>>>    drivers/tty/serial/qcom_geni_serial.c | 56 +++++++++++++++++----------
>>>    1 file changed, 36 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>>> index 715db35bab2f..b6fa7dc9b1fb 100644
>>> --- a/drivers/tty/serial/qcom_geni_serial.c
>>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>>> @@ -1283,27 +1283,14 @@ static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
>>>    	return ser_clk;
>>>    }
>>> -static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>> -					 struct ktermios *termios,
>>> -					 const struct ktermios *old)
>>> +static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
>>>    {
>>> -	unsigned int baud;
>>> -	u32 bits_per_char;
>>> -	u32 tx_trans_cfg;
>>> -	u32 tx_parity_cfg;
>>> -	u32 rx_trans_cfg;
>>> -	u32 rx_parity_cfg;
>>> -	u32 stop_bit_len;
>>> -	unsigned int clk_div;
>>> -	u32 ser_clk_cfg;
>>>    	struct qcom_geni_serial_port *port = to_dev_port(uport);
>>>    	unsigned long clk_rate;
>>> -	u32 ver, sampling_rate;
>>>    	unsigned int avg_bw_core;
>>> -	unsigned long timeout;
>>> -
>>> -	/* baud rate */
>>> -	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
>>> +	unsigned int clk_div;
>>> +	u32 ver, sampling_rate;
>>> +	u32 ser_clk_cfg;
>>>    	sampling_rate = UART_OVERSAMPLING;
>>>    	/* Sampling rate is halved for IP versions >= 2.5 */
>>> @@ -1317,7 +1304,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>>    		dev_err(port->se.dev,
>>>    			"Couldn't find suitable clock rate for %u\n",
>>>    			baud * sampling_rate);
>>> -		return;
>>> +		return -EINVAL;
>>>    	}
>>>    	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
>>> @@ -1339,6 +1326,37 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>>    	port->se.icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(baud);
>>>    	geni_icc_set_bw(&port->se);
>>> +	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
>>> +	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
>>> +	return 0;
>>> +}
>>> +
>>> +static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>> +					 struct ktermios *termios,
>>> +					 const struct ktermios *old)
>>> +{
>>> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
>>> +	unsigned int baud;
>>> +	unsigned long timeout;
>>> +	u32 bits_per_char;
>>> +	u32 tx_trans_cfg;
>>> +	u32 tx_parity_cfg;
>>> +	u32 rx_trans_cfg;
>>> +	u32 rx_parity_cfg;
>>> +	u32 stop_bit_len;
>>> +	int ret = 0;
>>> +
>>> +	/* baud rate */
>>> +	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
>>> +
>>> +	ret = geni_serial_set_rate(uport, baud);
>>> +	if (ret) {
>>> +		dev_err(port->se.dev,
>>> +			"%s: Failed to set baud:%u ret:%d\n",
>>> +			__func__, baud, ret);
> 
> As far as I can tell there's one error path in geni_serial_set_rate()
> and there you already printed a more specific error message, as such
> this doesn't add any value.
Sure, will review and update in next patch-set.

Thanks,
Praveen Talari
> 
> PS. In general, please don't use __func__, write helpful error messages
> instead.
> 
> Regards,
> Bjorn
> 
>>> +		return;
>>> +	}
>>> +
>>>    	/* parity */
>>>    	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
>>>    	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
>>> @@ -1406,8 +1424,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>>>    	writel(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
>>>    	writel(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
>>>    	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
>>> -	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
>>> -	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
>>>    }
>>>    #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE

