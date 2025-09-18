Return-Path: <linux-arm-msm+bounces-74025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F51AB82E35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 06:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 075402A6DBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 04:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74570242D97;
	Thu, 18 Sep 2025 04:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCSKPZVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF905227
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 04:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758170014; cv=none; b=k6bLV3PL7pS05qOdGfanjJeSm/vTxEvHATQZDDhjR2jrm4sxUChFs/D88yAfojjYcmdvfsb/OvAUvlEr30tM8aPnYrpuD1exhHksPEfvqobOwlUFYk2L90kY6eQ8+nojRhlgUtWroRGuka37QRgTvrUv01VtlE8xub8HtWutmqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758170014; c=relaxed/simple;
	bh=QknahBXlnX28pd3qilMDxoA93JDW5B8tnS2S0o4sXM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R3aqEZPAJsCLhTQGWHJ4Rkrn8IfxpzQkX5dZzEjMR4RQ1dT0WPZrIvKFlvlBzEX3IsAdb71rh4b34j0/sSZVBido6nCzI7lKhGtBfb4TMs8otw5jlbPxVX20/rX9XkudVNxaerA4ObfHoeCn4+BRkqhVZtqPW96/29vIWjqRYVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCSKPZVZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HIaG1j017785
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 04:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	emcNfJu754Zw/xRhhL5c1Y7srtqfklAj0riCyeMVqoE=; b=mCSKPZVZt5u4+aBP
	+H+uFNp1rpOsdj9pDInX5M95kA+I85ulKjg/QFbLTPhUEG22HsAaEnh9v71CyIOw
	W55ZR1843K/5Lm2G96Rz3UWNk7IL0k96vN9jRat2ARruvp4JTEfMk53aGzbdHStw
	jG3RXjzxDzQ0a7hDS4kynR/oS1poD7roTsaabRvtj7tNfm+7IlJ4KtkzuuCnbF91
	SxB0dYAeyOIbxspVqtt4kE9MbZ9iGGdTMkeVjxc8pkKOORLYPZXV/rsXB3YVQiOS
	iyYJOX7n1r3hbi9uo8W+VQCPzVBCR+kWwMA7db/ye49wPMel0alnORALTbB1WeIF
	m6WARw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982de9e0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 04:33:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb2b284e4so818622a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 21:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758170010; x=1758774810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emcNfJu754Zw/xRhhL5c1Y7srtqfklAj0riCyeMVqoE=;
        b=cPhxXvpXlhG1izwTkzuqdbNu6r7muztUNYPBiO4g+X+NIFzyBS5hXrQAbxNshBkL2q
         rMZGYxEIfKkTprCzMREKAnXf6dLZjhKoAN9lRZ7ZC3sgL7543sSKM9Rq3Jge0lyM49HH
         k1oreXbN3v8CmJhOFbUBOkCadzT6ejAaRbUithSBOq5w9CHXLWpcovblWqUQL4x/FLoU
         v09Kt9Zp3Dn2BP94CVUv1Ll9AyI0bqnc2ZOCJJWNFhMdwNBPxqzqgd8tw7lt183R1W0D
         TRMFL5OulSlKYLSac1BtLLrp1BeX+EmyDtfaKtpLRtNJvUGVdHKRyZm//MN08Kz4gxyZ
         qzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU35HlFB26U8bYC51K6NTDbLkTowvALtpRBaZjndNDwOpowAkQDTrM+nGk6INgFc59PDtzaLbKxW7mgdWqM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9s4msWDQ3h8O8TWzEXH+3y9nS69eXhMtmaMIJvupEcpPE/t5Q
	STDjL2wO+0j6W3OLu2w4KqLU9iTDjbu9xKgF1/ECQJejPNf1SeXJeKP0GcmRcF5kBDFRLmwyIIi
	tyNw55oWn6mCe7mIJxjNoGDp2y/gIYxEF83B+Jg2XCeQG+vziSuCzs/mTCOKZyawFrQS8
X-Gm-Gg: ASbGncvGUYxM0tDDgfE7ox8/vyMuUDue44zgpTRG5na29Kg9m0jV+o+mnlqDVQ3RdDU
	3Ubc8JCFkJM91bOshbzmWLaiG/ldD8p59MrisjEansqNPnvBDeB5RMmdLZO7/y9E41PP/PzZrwu
	8HxpmFhSEDw4Gg7FbM28uQO1EtItSk3be0hPtSucOYtYZxQW85kUlJxpjJp30b/WHh3Kmk+lqPW
	64xRS6NtDI07dA1gypLry5Q9z5ZvYQ7XjweBCTFoL8QeqhiWORZSnysD5aA4J/pufnA1Iuo6nZo
	oo7kkJSMnyY5hczzbDITJ7lUlEhDnzotrR08jmA0aCzo9elqaAOw5qfmD3B99+imGJn46POh
X-Received: by 2002:a17:90b:3b47:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-32ee3ec5b8amr5818088a91.7.1758170009797;
        Wed, 17 Sep 2025 21:33:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1cgy1pQOGomAlAHXR3PchkPZ2E5JORoiUT2CtMw1UO5QV399eeXxp9y7GLzhCdfoRI9cIdQ==
X-Received: by 2002:a17:90b:3b47:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-32ee3ec5b8amr5818041a91.7.1758170009107;
        Wed, 17 Sep 2025 21:33:29 -0700 (PDT)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306db47817sm223057a91.4.2025.09.17.21.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 21:33:28 -0700 (PDT)
Message-ID: <b50d9427-d15c-49aa-b0a2-6210faf6675b@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 10:03:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom_geni: Fix pinctrl deadlock on runtime
 resume
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, jorge.ramirez@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20250917185102.3763398-1-praveen.talari@oss.qualcomm.com>
 <7sxsfyu2kqbycyfftwfhrncwk3dfnubmzhyi2rqi3jtvi5qsnh@bya3cii45zhn>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <7sxsfyu2kqbycyfftwfhrncwk3dfnubmzhyi2rqi3jtvi5qsnh@bya3cii45zhn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cb8b9b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=kdHii_BM1puccm8aFMUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gi8MlwUhFA0I55E5Ina5C8Fqt-YsBOq5
X-Proofpoint-ORIG-GUID: gi8MlwUhFA0I55E5Ina5C8Fqt-YsBOq5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfXy+93DlJxrEmu
 fhqMLCbe/k7vQdpAJGesJ/gK7/+AAzHww8KAeVkwvC4YGK9OIVJ+lmCh9D3tYsXcby61b8vm2aY
 33U44mHgZlAicnUUm5dOOiRyPcJLXPnXEsXHnQ+bwngULerru5+0RN+kKdc8Ehkf3obCQQx5YjN
 F9uF6XOGmB3MfvqqkDABMSjyBAAhP3cA7W9nqX+BnDIRcNns5g+d+aj4gH2synpjygQj/AN0N8W
 Xf0VjNqd50b0Hx2Y6reqeQ0jQjQ2aVp91eDUJYPWGrYYl8wR8u1IsOLOh9jPa6fpzvHhfUGQmwh
 UruoPjdmTiPBN1QUCS1gGUJg6D9qBzXoWuq4aQ61+wegEsj5yXXLxTaD0Fd8jlv37LzRfWGoQhY
 pv6q2R9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

Hi Bjorn

On 9/18/2025 7:44 AM, Bjorn Andersson wrote:
> On Thu, Sep 18, 2025 at 12:21:02AM +0530, Praveen Talari wrote:
>> A stall was observed in disable_irq() during
>> pinctrl_pm_select_default_state(), triggered by wakeup IRQ being active
>> while the UART port was not yet active. This led to a hang in
>> __synchronize_irq(), as shown in the following trace:
> 
> Are you saying that the handle_threaded_wake_irq() in your callstack is
> the handler for @irq and then in pinctrl_pm_select_default_state() the
> code tries to disable that same @irq?

Yes, you are right.

> 
>>
>> Call trace:
>>      __switch_to+0xe0/0x120
>>      __schedule+0x39c/0x978
>>      schedule+0x5c/0xf8
>>      __synchronize_irq+0x88/0xb4
>>      disable_irq+0x3c/0x4c
>>      msm_pinmux_set_mux+0x508/0x644
>>      pinmux_enable_setting+0x190/0x2dc
>>      pinctrl_commit_state+0x13c/0x208
>>      pinctrl_pm_select_default_state+0x4c/0xa4
>>      geni_se_resources_on+0xe8/0x154
>>      qcom_geni_serial_runtime_resume+0x4c/0x88
>>      pm_generic_runtime_resume+0x2c/0x44
>>      __genpd_runtime_resume+0x30/0x80
>>      genpd_runtime_resume+0x114/0x29c
>>      __rpm_callback+0x48/0x1d8
>>      rpm_callback+0x6c/0x78
>>      rpm_resume+0x530/0x750
>>      __pm_runtime_resume+0x50/0x94
>>      handle_threaded_wake_irq+0x30/0x94
>>      irq_thread_fn+0x2c/0xa8
>>      irq_thread+0x160/0x248
>>      kthread+0x110/0x114
>>      ret_from_fork+0x10/0x20
>>
>> To fix this, wakeup IRQ setup is moved from probe to UART startup,
>> ensuring it is only configured when the port is active. Correspondingly,
>> the wakeup IRQ is cleared during shutdown.
> 
> The wakeup_irq is the GPIO pin, and the reason why we do this dance of
> muxing in the GPIO during suspend is so that we can get woken up when
> the system is powered down.
> 
> Doesn't what you describe here disable that mechanism?
Yes.
> 
> In fact, while the UART is up and running, we don't need wakeup
> interrupts enabled, because the pin is muxed to the QUP.
Yes.
> 
>> This avoids premature IRQ
>> disable during pinctrl setup and prevents the observed stall.
> 
> The scheme of pinmuxing a pad to GPIO function, in order to allow
> powering down the IP block and still be woken up is an important
> feature, so are we certain that this should be fixed on this side?
> 
> The purpose of the disable_irq() in msm_pinmux_set_mux() is to
> reconfigure TLMM (and PDC presumably) to not give us interrupts while
> we've muxed the pin to a non-GPIO function. But why does that need to be
> synchronized? It seems worst case there's a parallel thread (or this
> thread) handling the interrupt right now and then there won't be any
> more.
> 
> I.e. isn't the solution to this problem to change disable_irq() in
> msm_pinmux_set_mux() to disable_irq_no_sync()?

Based on the initial call stack and code flow analysis, we initially 
assumed that invoking disable_irq_nosync would be sufficient to unblock 
the issue. However, we observed a storm of interrupts on that IRQ line.

Further investigation revealed that the UART port should not enter 
runtime suspend while it is open, as per the intended use case.

Addressing this behavior resolved both the IRQ storm and the system hang 
issues.

> 
> Regards,
> Bjorn
> 
>> The probe
>> and remove pathsare simplified by removing redundant wakeup IRQ handling.
>>
>> Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>> Closes: https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
>> Tested-by: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>> v1 -> v2:
>> - remove changes from runtime resume/suspend.
>> - updated commit text based on changes.
>> - added new a change w.r.t wakeup IRQ setup.
>> - verified on RB1 (qrb2210-rb1-core-kit).
>> ---
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 0fdda3a1e70b..9c1bd4e5852c 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1160,6 +1160,7 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
>>   
>>   static void qcom_geni_serial_shutdown(struct uart_port *uport)
>>   {
>> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
>>   	disable_irq(uport->irq);
>>   
>>   	uart_port_lock_irq(uport);
>> @@ -1168,6 +1169,8 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
>>   
>>   	qcom_geni_serial_cancel_tx_cmd(uport);
>>   	uart_port_unlock_irq(uport);
>> +	if (port->wakeup_irq > 0)
>> +		dev_pm_clear_wake_irq(uport->dev);
>>   }
>>   
>>   static void qcom_geni_serial_flush_buffer(struct uart_port *uport)
>> @@ -1236,6 +1239,13 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
>>   			return ret;
>>   	}
>>   
>> +	if (port->wakeup_irq > 0) {
>> +		ret = dev_pm_set_dedicated_wake_irq(uport->dev,
>> +						    port->wakeup_irq);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	uart_port_lock_irq(uport);
>>   	qcom_geni_serial_start_rx(uport);
>>   	uart_port_unlock_irq(uport);
>> @@ -1888,17 +1898,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto error;
>>   
>> -	if (port->wakeup_irq > 0) {
>> +	if (port->wakeup_irq > 0)
>>   		device_init_wakeup(&pdev->dev, true);
>> -		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
>> -						port->wakeup_irq);
>> -		if (ret) {
>> -			device_init_wakeup(&pdev->dev, false);
>> -			ida_free(&port_ida, uport->line);
>> -			uart_remove_one_port(drv, uport);
>> -			goto error;
>> -		}
>> -	}
>>   
>>   	return 0;
>>   
>> @@ -1913,7 +1914,6 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>>   	struct uart_port *uport = &port->uport;
>>   	struct uart_driver *drv = port->private_data.drv;
>>   
>> -	dev_pm_clear_wake_irq(&pdev->dev);
>>   	device_init_wakeup(&pdev->dev, false);
>>   	ida_free(&port_ida, uport->line);
>>   	uart_remove_one_port(drv, &port->uport);
>>
>> base-commit: 3e8e5822146bc396d2a7e5fbb7be13271665522a
>> -- 
>> 2.34.1
>>

