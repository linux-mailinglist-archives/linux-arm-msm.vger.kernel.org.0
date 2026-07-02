Return-Path: <linux-arm-msm+bounces-115907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xVd5IDE5RmpvMAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:10:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D289C6F5AC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:10:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="RF+6P1/o";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iVLIA4AA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115907-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115907-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81F1931925A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125284C9002;
	Thu,  2 Jul 2026 09:50:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DEC4D8D8C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:50:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985802; cv=none; b=pf+o5j9NF1WPNS5S+hVc3ZPlawYOy3CdkBhdoCvzNJa1uMf5Fbw5jV6Cl5n8jEU5kzCVXwMLlCYNnv32CXdQ5/2Nz+q1p89b/UtrmlSBM/vJ2cdqEKoP3i68Oz8ZV1xgqDFNsL7Q+7MBQ+OjuCjI6fwlBmiqT5wxz1lDpMZlhZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985802; c=relaxed/simple;
	bh=+aEA+WL+lhQ8/LMNDDj+Ae2GqHVXWUMR4IxffTyTgo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nGoxHYrdzPNrhPdwfM/4mGrV7nz79Th08b+tPyqm1MacCFYutdkINeKgpS6KIYlyLRveTOTBrYZQQ7Kwfxf2AjLANVjzXvXHB/jiZc8XOcMcKKCjM/0ogFxTkpiPzClgkV/q3bEk5bCIwEK51SXEGRhBPuIHGb52N/UiiFxDtRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RF+6P1/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVLIA4AA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662432Pb3460537
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BFEvju+fHqbHwUz13O0lBoZLeevj7Pcr7HLGdvh0MNY=; b=RF+6P1/ont/PO4u8
	7o7Zhtz5CBzlMZ6LpioPqYb0kWUTr0zNflvRM37NSe0z+p4hNZ4W7Uuf5VJcCWwD
	pvkiEUSLYk51kx4NArMSJjpXNA42nNnGxsO2M0vPMVr6/zNhBP/SabXFwxUq18+F
	iGQsVIJjG3egiZi4AVQolRT4j8ty+QmV9WxSVyDBSA1lfIzuIuJOIYug3N8addZS
	OU/MPb92RDCu+JN2tMcbeflVLSGv/cMGGU1J2bD007027Q2khnPs7+8uzQV1LiBw
	5GxCcr1/jzFKX3A8gLwNtgRdgVHpCGUdiGXQRHn3ouQF14LxBK9MGxZl94pDflAe
	iqmCPA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb17rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:49:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so612982a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985799; x=1783590599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFEvju+fHqbHwUz13O0lBoZLeevj7Pcr7HLGdvh0MNY=;
        b=iVLIA4AAPgUvY+c6C23CGAgnoJaDrLpwvEXzEd2U/jLp934AvG3RJ1WDJ59ndaNf4U
         G3gg3mLCqWrY3LzRUEp8KMqmwpp+bG7016Gm5gRn2N6/8in+iE/ZN4aKQGzgbzi7gDb3
         wbymuV7E/JxlvA2fMbIKCDnMVz5lIvK/9OFGqeVSD3eZmgbXQfDFBZ/eLPz8B37QK992
         I15k3OZ1i/c2+7WfNXoLaSuoDWUjiH+QayZ9bb2zflRUsN3gmaQgNVnb4f+Uhl/DGpwS
         ddqw8CGuJrn5/xlafs8KPs5efRcwh6Ef7VgQZVlFaq4vvZbGtKbgoUY8kg3Vl50e1EgH
         cPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985799; x=1783590599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFEvju+fHqbHwUz13O0lBoZLeevj7Pcr7HLGdvh0MNY=;
        b=H/nGobDdEoF467TwcgUaWkaguiuhfkF3DUAwEakut/ms+au2JYVMhbgoUk08+s7gVh
         poyRP4byV//s9kQ0QyxBuuO1cek+GEKm9wuneKz2IvgLY1w3ytIRLs0phwSVG7I9onqN
         rg25H2iB7gPKmMJgqQIOm0VAolLhIElfNXHAExME45LkpdI9UvUcpLCp0TXDjGhO/FD4
         ZsGBQqLzZRbyORA3K0bj/iZy/N735sF4JlR8IhMp3FshoquQNPmejADzIPXpZyH1c0Fh
         gjyY5B8vXF/OS5vtmCf4dlJdXvVealtJ+BBZx/QZo2L4koMHAW34uXdJognIz8o1vvdk
         eU3A==
X-Forwarded-Encrypted: i=1; AFNElJ9acAfBMUtnhQBDQm04Jr5lNyP8/F+mTTyzplhVfUcPRxDM9bXn/t60r0V01edlDXUTpUSVRDeCRneR/Q6n@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQ7t7MrGgEqt9mNrV6H1hi8QyNS5xGc9nL/E7rInaeXvryCmB
	6aMW+gbr72BeB+O9b8ZKZCjH8Q6zvfmJ7ZczLH2FcrOMR5+JfIiEXrH7YzbL89ZMQOqmGCWsTna
	sc4igA+bQ6rQ9s5lN7hQ+/vmRa7hWE1MGr4oPZkDliSC9viQT/Lr3E0IwGez0vv/iHIUE
X-Gm-Gg: AfdE7cll7FPzeEla2V8ioedTFm3diuvCdZvzLJNvpYMbDvb54ZhIbDXyUzu4eWCZWYN
	FEe0irZ4sAwwmrFKJgqkED5nuCc6GBo9YUS72uHTM2Cc5K64EyBVfbm/a7pro3VfIGp7ycQsqoS
	TPAEh5yQU/tzRhcKqv1U5C5mLIMXLRGUPjXEoNdlTDQbGd79IJCPbyDihiKOmvxieJB0wAYIIY+
	XI17JoftYB68vkhaqImHVz6KZb/pJZEDmeUCpuB7vHCJdjMpU0coWnG3m0mvr38GgjeMpWQ65wG
	YRjFjqLIstpXxn0tspwklP4lfMHqT84c4kMELGi91udIMacqKlDGDVTH3M2Q8lzOd1SZswwjhvX
	/lVeOUW3pZl3TOJ2wxVcPdBQrGZ9thxP7mSgsa0zuhBg=
X-Received: by 2002:a05:6a00:9283:b0:847:8f33:b159 with SMTP id d2e1a72fcca58-847bf8231acmr4258565b3a.10.1782985798343;
        Thu, 02 Jul 2026 02:49:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:9283:b0:847:8f33:b159 with SMTP id d2e1a72fcca58-847bf8231acmr4258543b3a.10.1782985797676;
        Thu, 02 Jul 2026 02:49:57 -0700 (PDT)
Received: from [192.168.0.4] ([49.204.106.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3d0sm1097629b3a.36.2026.07.02.02.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:49:57 -0700 (PDT)
Message-ID: <f6c36949-54ec-4231-9ded-1b127fd4c3d0@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:19:52 +0530
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
 <4fa2a2ef-90ec-4f06-8611-c508ce0bbec8@oss.qualcomm.com>
 <a107b5ee-1140-4651-b5bf-90e2b793cebe@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <a107b5ee-1140-4651-b5bf-90e2b793cebe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G1uyfgA5L6TUHDZ-nYWrj1c9aVA4f9NN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX+2xWG1pktvMq
 mPZne2KwyVJI3mhYUztpmYs3pO1DDjOyh/l6FfUGD91nOKd0oHGd9AiAWC8/iU1TLDztAIKYVHU
 T/n4ryJ6gUy9qWff8lhUcrQhH4E/aYo=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a463447 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZY8+d+ilh5AZ8AQMB2/tOA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=wcYNnAJ3XbtdpYK58FUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX/IM6HFnvpN62
 qn91YDz5TiICo/yAvsiGIQoSVdFND8QeAWVnv38bv6Q/a2QX86zgdlS2RFyGfT0f57IFVTjISU6
 Kd1pMFGqH3w1FutYAcQDIpxHxn0uDlH3cKAvOPF8mawHRM8cloB/jB5c3kpCZy6FRrqxkoyEtf2
 MNAye/tU6ygpyo2B8kVlpy9g5t7oFAupBu+1XN1sPKtwUc65DJz9gFEWyG9qQ57FCsgnzlP6jC7
 7sU6ydeVbGH/4pFLxJhKuDGRkOjUsj7uMgjjt3Fcdz26WyKvvi4DeeGh1JvIfEl4WAseTfiTZ+8
 o5K6YCePdwtSRF1vQpCrBIXm6FDkgFWLd4r46cSBE2vAMiMKnuQskv75DRMgrhegeZkdqHgpLr8
 yg8fXyeA4cZbCHA//HcL4oah/pn07cfvnRLNn5ioXMfGjUlCRPFk4e4q0Rar6ZnXV/R0OYRrYne
 OcnfurAMA1hS8AmDmtg==
X-Proofpoint-ORIG-GUID: G1uyfgA5L6TUHDZ-nYWrj1c9aVA4f9NN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115907-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D289C6F5AC6

Hi Mukesh

On 02-07-2026 14:47, Mukesh Savaliya wrote:
> Hi Praveen,
>
> On 7/2/2026 8:18 AM, Praveen Talari wrote:
> [...]
>>>> +     * When no_console_suspend is set the console must remain active
>>>> +     * across system sleep, so skip the force suspend path.
>>>> +     */
>>>> +    if (uart_console(uport) && !uport->suspended)
>>>> +        return 0;
>>> Rather use console_suspend_enabled and take action to go force suspend.
>> In uart_suspend_port(), uport->suspended is updated only after the 
>> console_suspend_enabled check. Therefore, its value directly reflects 
>> whether the console suspend path was taken:
>>
>> uport->suspended == 0 → the console was not suspended.
>> uport->suspended == 1 → the console was suspended.
>>
>> Looking at the code below, when console_suspend_enabled is disabled 
>> for a console port, the function returns before setting 
>> uport->suspended = 1. As a result, uport->suspended remains 0, which 
>> accurately indicates that the console was not suspended.
>> Therefore, I believe using uport->suspended is the more appropriate 
>> check here. Please let me know your thoughts.
>>
>
> I think it would be good to use console_suspend_enabled and take 
> action. Not to depend on after effect of the primary decision maker 
> variable.

Yes but i don't see strong reason not to use uport->suspended.

>
>> Code snippet from core layer
>>
>> int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
>> {
>> [...]
>>
>>      /*
>>       * Nothing to do if the console is not suspending
>>       * except stop_rx to prevent any asynchronous data
>>       * over RX line. However ensure that we will be
>>       * able to Re-start_rx later.
>>       */
>>      if (!console_suspend_enabled && uart_console(uport)) {
>>          if (uport->ops->start_rx) {
>>              guard(uart_port_lock_irq)(uport);
>>              uport->ops->stop_rx(uport);
>>          }
>>          device_set_awake_path(uport->dev);
>>          return 0;
>>      }
>>
>>      uport->suspended = 1;
>>
>>      if (tty_port_initialized(port)) {
>> [...]
>> }
>>
>>> Here, it sounds opposite, if port is resumed, you don't go to 
>>> suspend within suspend function.
>> It is straightforward: uport->suspended remains 0 even after 
>> uart_suspend_port() is called, which indicates that the console has 
>> not been suspended.
>>>> +
>>>> +    return pm_runtime_force_suspend(dev);
>>> Is this really required ? if  uart_suspend_port() successful, what 
>>> will happen with this ?
>>
>> Yes, this is covered in the commit message. The key point is that 
>> uart_suspend_port() may not trigger the runtime suspend callback if 
>> the runtime-PM usage count remains non-zero. In such cases, 
>> pm_runtime_force_suspend() is needed to ensure that the hardware 
>> resources are properly suspended during system sleep like our i2c/spi 
>> supported.
>>
> I hardly see any other uart serial driver using 
> pm_runtime_force_suspend(), any do not see serial driver using runtime 
> PM ops directly. That being said, let's covered all use cases/testing 
> with this change.

It depends on driver design and using of PM runtime framework usage.

This change was tested two devices like system suspend and wakeup irq 
functionality.


Thanks,

Praveen Talari

>
>>> [...]
>>>
>>>
>

