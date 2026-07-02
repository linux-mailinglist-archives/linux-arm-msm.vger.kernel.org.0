Return-Path: <linux-arm-msm+bounces-115815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FVUNGKrRRWrlFgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 04:49:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4606F31A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 04:49:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jC7nawt3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ek3w9Hgq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115815-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115815-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8AF95302C532
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 02:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF99830C608;
	Thu,  2 Jul 2026 02:49:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDB42E2665
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 02:49:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782960549; cv=none; b=OAnNGtckpgxFE0iu9UDyJ78+fqhV29FGu3Q5L+9l5IcNkP5TC6IMIzjPtGsl1h/MdRm+QLGf5oqaEj7po8Dkl/5K9HUhg1LMqvKIzAi3mcISN9I3OpZZufxjqRih6f7Iqyo+byJFNGYEsLJaJcgJolII54uwSfaovuHYF1ngwHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782960549; c=relaxed/simple;
	bh=AfVlfqVRM83w/2+kbTyFI/v1InzBtt6aUMbIahCrumM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ut5XXJHJ3w/U/RuVPQT81/RSa7Rb4gRw+fJcJuylpV2SNYCkvVeo/hPKuLHSm7XIJ2i1v5jdQLGUjv5qP9UP5ciIqJPpIDjM/Hvyen4orJrAz/X1mX7YO/obIdlSghaJxqTWpK5Z2hM2s1gYbHwI6WvaVQYQudEdbH5otkpOh0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jC7nawt3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ek3w9Hgq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KIZj3009616
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 02:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLaxFpS100Xk7qebtOIZC9YPDVj1gBjt4peUMTWselI=; b=jC7nawt3ScLwBbnz
	1mG93i6dkmMbzsQWDwKKdnlTw0AdW/WgQuu/rUzq9LX+bXEZlrbCvfpyvngQ871o
	sDdmiVajT5W9WYS+RUkIPZu5h4W+XjC/YS5R7t6ilETgLK19lbSnf8TQq2yDnjpc
	ZHv4Wc2i3Fgp14QSgup0+BvY9bVBIXvPk3eYKad8QDqMvDz1hHcq25vEnuopa+NZ
	8lhfTASdd52U2Rok3mzlSCM+WkJupIebo66YFnS2920l8cBooW6hdcwhb2OWAkCv
	2EKQJY2HNFI/+pHYytx+ZO0Eg/GgKAtNurdqatHo3bcsxrwxwjmgW4JJ1Jbv8Kzw
	C60ZZg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rsw2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:49:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c891ed872ddso1486488a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 19:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782960546; x=1783565346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lLaxFpS100Xk7qebtOIZC9YPDVj1gBjt4peUMTWselI=;
        b=ek3w9HgqditCgvpUq0gVVrASlLRFmHF0CYAWBxx3cO0riu4qfLM9pcVoPhB1IPL67z
         NEx348VR6u4iEU6DbnXhz8zwmOMgqvNilCzZv4SvCvgonZ0RaXc1Takg8AlJ5jO1iLmO
         ijofZTLHDH3TnTk+OHuMNxkhnoLzD+eLFOe6VJzRaNNe5kQJshCS3i/m1lB4QgA8uk8y
         kURGHsxLu4lVd4dYNhg1IzVa+p4iRs01HDxEWwQqb6KKgICpmmPcIZQSM2ZgBj6czZQe
         zwkJAhXROum/8ebeo7c1fRC3rqjEGDudjXwkC9sAg9DycYCG5v40BDxoX2P0K/qW6Gg2
         Y3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782960546; x=1783565346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLaxFpS100Xk7qebtOIZC9YPDVj1gBjt4peUMTWselI=;
        b=tM2+ruemoEwbu89FhjNxxk1KEYeksleZ0VbVfqVxhoFCDn/Ao7U5yaXo4KmP9RC3FM
         YjdN/TzWi8jl65gIWg/fcRAhaHSYVms5RwtF1nsDaZK23TZKjSQFhvTXBtv4e2Pjrnjf
         WHqHEcS008wtaJf37JaUwzfn+HuoX8bOvI68ysiRTJjOxlZVPE7OzjhXS4EIffVXwqdH
         V+kcx9zJSTzLbdoqngNcRQcj7s3xDbO+bct9TBwCEz1Yog18sZ47uOq6XKDL6VSTRAzF
         b1KtWGt2N9pq0pV86t/vFalmmTK3P8ceUu/LQlUGKpKNsEGjzRmz86Azu5F2IJ9uahR2
         P1SQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fBbJURX31+WspJ6YS59BK296XTZELqOhpLxD+C6ij1lY35bn8x4LtLgrJBLfRTiu2+L02Y1cBm8I5Afo2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf74ZXbIii6wfC3s6g42dg0yQg3NfBTJMM+3YMEnUUvAwnzHDe
	jrSH/oqqo7NEOVmFSdipfgGkJTUMGqwSHIGzOIVSV+HoG4Yc2/vYuu317cK3SD4im809g3jNh7M
	AyjUDGYvtINK30/jP7QJWeV73VMf+gLTQxAcZYmcz9LRHrd09l8u3npy8/K+MZ8SAX4CN
X-Gm-Gg: AfdE7cmRywUJrWmXGyHZYFbE9xlYIPIChpxpRI9Swi+9DRfiU0HPwAS1Cq7jdLxply9
	bsv85dUmeqRiGNGRdVQs5bkRdiEhRNAsvVIRkRgWmJTisaRNq0UqKf104q5ckYye2bIgWCGeUol
	hJ61P0v2JZp+2XC5Ju+eUMMK28Vm2XicPue2U8IFjLonIeMugbV58bVlI0wKLdv5SR6/7mBK5kB
	e5w+ULRSHrgtWqalQv4bKrpMxLdjuyvVqGtCBjwRWAhjSP/4ye1FCOx9+gDXWjhoAtZEyoTMCW0
	8jKZH4Emif7/Z+a9nEn+FWWrtVMS7pgsR8tENZ7jeJdvUaL/3zZkaT6mduN0XrGkl8Jf642RF7M
	CFARIFn6R4fcM4s2pI93uD2ZCYXl9PddRJ83Gpb1oSH8=
X-Received: by 2002:a05:6a21:696:b0:3b2:a8cd:ef4e with SMTP id adf61e73a8af0-3bfed3b2776mr4936153637.28.1782960546029;
        Wed, 01 Jul 2026 19:49:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:696:b0:3b2:a8cd:ef4e with SMTP id adf61e73a8af0-3bfed3b2776mr4936097637.28.1782960545007;
        Wed, 01 Jul 2026 19:49:05 -0700 (PDT)
Received: from [192.168.0.4] ([49.204.106.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbdc544sm3802085eec.25.2026.07.01.19.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 19:49:04 -0700 (PDT)
Message-ID: <4fa2a2ef-90ec-4f06-8611-c508ce0bbec8@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 08:18:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: add force suspend/resume to system
 sleep callbacks
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260701-add_force_suspend_resume_to_system_sleep_callbacks-v1-1-38c9a721a462@oss.qualcomm.com>
 <73243e36-175c-4fe3-a448-b30eef9c44ee@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <73243e36-175c-4fe3-a448-b30eef9c44ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAyNSBTYWx0ZWRfX1JcYlGDkuBqd
 4uDuoZ66DVHzNR0ZtVo+aQ9lXjPBAlZoCmbAhApIIFqvuK7ZmdTS9beZjIYNL99GjsaoS9T0Pml
 tg7/ukqoDl5dYCz9xdYdAE6jwK/c01ZGLirJ76crOglbvDN//bpCIUMIuCWvB+3uXEbLVr8T2+f
 pSbr3CcwShNqHEFdNsOAKqoidLSIoshLyxpKuNNQgj4c9G7i9NwIuVxTktkYhay+MHHX0YP6KOI
 Nn42yc5FdfIHPVnG/VdFX2lslDUJ/Jhp9+CmLHQsf9fohpVS9my2QMn48/ORIeSw8tSB7chCcX0
 3qHqpIk31gzE3/mIED8EEFpdjonQ4TFRGh6l7tY8KPfnEluIAE/PoUgT0EPDSSOV7hYigkMZLxt
 u/12WaJjObe7OUO4hTS6/7Jdw5c/dQZKi5WLdzIOtIUkbmTihrP6X8fjkAdWMqvaZ4L9HGwdGGm
 zqAXUR5UlMzfJlS2rOg==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a45d1a3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZY8+d+ilh5AZ8AQMB2/tOA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1ym4DecIM8o6dCVoxpoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: -etGRDgiKR2nsqElQu48xXefA2hJyP1R
X-Proofpoint-ORIG-GUID: -etGRDgiKR2nsqElQu48xXefA2hJyP1R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAyNSBTYWx0ZWRfXxSN5v2DZYGms
 3JpOtun2G6RSa8/b2XHr3mhG06Suwqr475SDyfxbBunOqkoJKtqiZ16IyiuVL4wQ0kaAwYUcWzA
 qJfUDeCWXNvTyT+LCFnAq+Z+Z8X8o9g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115815-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F4606F31A5

HI Mukesh

On 01-07-2026 20:47, Mukesh Savaliya wrote:
>
>
> On 7/1/2026 11:27 AM, Praveen Talari wrote:
>> During system sleep the hardware resources (clocks, interconnect) are
>> not gated because the runtime-suspend callback is never invoked from
>> the system sleep path.  This prevents the platform from reaching its
>> lowest idle state.
>>
>> The system sleep callbacks qcom_geni_serial_suspend() and
>> qcom_geni_serial_resume() rely solely on uart_suspend_port() /
>> uart_resume_port() to manage power.  uart_suspend_port() drives the
>> UART PM state machine to UART_PM_STATE_OFF, which in turn calls
>> pm_runtime_put_sync() and eventually the runtime-suspend callback.
>> However, if the runtime-PM usage count is still elevated at the time
>> of system sleep (e.g. the port is held active by an open file
>> descriptor), the runtime-suspend callback is never invoked and the
>> hardware resources (clocks, interconnect) remain enabled across
>> suspend, preventing the platform from reaching its lowest idle state.
>>
>> Fix this by calling pm_runtime_force_suspend() at the end of
>> qcom_geni_serial_suspend() so that the runtime-suspend callback is
>> always executed regardless of the usage count, and by calling
>> pm_runtime_force_resume() at the start of qcom_geni_serial_resume()
>> to restore those resources before uart_resume_port() re-opens the
>> port.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> [...]
>> @@ -1963,7 +1964,19 @@ static int qcom_geni_serial_suspend(struct 
>> device *dev)
>>           geni_icc_set_tag(&port->se, QCOM_ICC_TAG_ACTIVE_ONLY);
>>           geni_icc_set_bw(&port->se);
>>       }
>> -    return uart_suspend_port(private_data->drv, uport);
>> +
>> +    ret = uart_suspend_port(private_data->drv, uport);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /*
>> +     * When no_console_suspend is set the console must remain active
>> +     * across system sleep, so skip the force suspend path.
>> +     */
>> +    if (uart_console(uport) && !uport->suspended)
>> +        return 0;
> Rather use console_suspend_enabled and take action to go force suspend.
In uart_suspend_port(), uport->suspended is updated only after the 
console_suspend_enabled check. Therefore, its value directly reflects 
whether the console suspend path was taken:

uport->suspended == 0 → the console was not suspended.
uport->suspended == 1 → the console was suspended.

Looking at the code below, when console_suspend_enabled is disabled for 
a console port, the function returns before setting uport->suspended = 
1. As a result, uport->suspended remains 0, which accurately indicates 
that the console was not suspended.
Therefore, I believe using uport->suspended is the more appropriate 
check here. Please let me know your thoughts.

Code snippet from core layer

int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
{
[...]

     /*
      * Nothing to do if the console is not suspending
      * except stop_rx to prevent any asynchronous data
      * over RX line. However ensure that we will be
      * able to Re-start_rx later.
      */
     if (!console_suspend_enabled && uart_console(uport)) {
         if (uport->ops->start_rx) {
             guard(uart_port_lock_irq)(uport);
             uport->ops->stop_rx(uport);
         }
         device_set_awake_path(uport->dev);
         return 0;
     }

     uport->suspended = 1;

     if (tty_port_initialized(port)) {
[...]
}

> Here, it sounds opposite, if port is resumed, you don't go to suspend 
> within suspend function.
It is straightforward: uport->suspended remains 0 even after 
uart_suspend_port() is called, which indicates that the console has not 
been suspended.
>> +
>> +    return pm_runtime_force_suspend(dev);
> Is this really required ? if  uart_suspend_port() successful, what 
> will happen with this ?

Yes, this is covered in the commit message. The key point is that 
uart_suspend_port() may not trigger the runtime suspend callback if the 
runtime-PM usage count remains non-zero. In such cases, 
pm_runtime_force_suspend() is needed to ensure that the hardware 
resources are properly suspended during system sleep like our i2c/spi 
supported.

Thanks,

Praveen Talari

>
>>   }
> [...]
>
>

