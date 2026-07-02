Return-Path: <linux-arm-msm+bounces-115871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YFlvJsswRmrMLQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:35:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FC86F5508
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:35:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P6mErtn9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UNKTyjhH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115871-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115871-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D078B3012D3E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107EE478E42;
	Thu,  2 Jul 2026 09:17:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54FB478E52
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:17:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983863; cv=none; b=W9fGLXS7LFQnfPLG8ZDC+MEIUc4svB6bohdG1yD8AkzOpswDXgCgdsiLLXY9mGElhwGtw2izr3SRh+qeQT2ZC7TkZl4gMSqt1GRkymWac6JbZnxYsNPBlWjH3ENwTw1XOaUvhiBKQE/2CuFafmPerU13z27epnkLWlLQben9fnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983863; c=relaxed/simple;
	bh=oVUVN33KyAA+G7ySmu0T5BL6MDa6QNPyaXVhOB1tb9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jONnhrtQ3oR23laBaqj6IOP7ZS35ZHnPVZy4r/5JHsSnGl3bDfw5J8+JhAH+Yq9qiaTZL1moG1wF23z61DzIzOR0wM0tQQITZxZ8pXIv1xuS/WOBdJsETonkdsK948d7Z6W9SbRGP9SVZdcmcEBwrhrM2ay3wu3Q6xtCW+0iXAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6mErtn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNKTyjhH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6627TsQ13964226
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGwAednzqeRxCB22QWUBlMswoWJYl0ScI1kF4jRrqA0=; b=P6mErtn9yGlDXT0w
	FViNbJJbGHV8lHYlsMLHX18MF8KBThtrzNY8FWomtV/dSMN6EfyAodarTlQGlwCh
	xXPskHUq1FYORoAHUMlwKtFi+h896VcN4rFptqsj6iG7s+3m4cMIus47x9+nGEMX
	OY2YELNxhPxq4GB3Hte3Lq+/iT1Jc70cw37nuVA3dzPsHhjjMslo6qIml8UxCKud
	1o8aKL22WaTiVnnmXuu7tr1sjno+Ih/8sLXq71dlBQY8FvDcjl/PVZ6OWhuchT/D
	+SjfBCodvvwT5wS42b000jpO1xj1H/O9zc6Y21gUen3L20sbUD3DSVCKZZr7xezX
	ssgrkQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc0e4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:17:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845bc2e658aso1791819b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782983857; x=1783588657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGwAednzqeRxCB22QWUBlMswoWJYl0ScI1kF4jRrqA0=;
        b=UNKTyjhHY8GEa2YcOfRqIuxigrO2c54+MiuGqYL2KVEd3O8yzipIlFpmzsKnGgO+6o
         RCE9PY0CaY3UrIpUDXUJCTbaTvs1xu8zjsmUV3M8sXQwwZXhmoIWvyl3Mz+tpG7PDwMv
         8OradjHLbxPidOUYLhga+XrKfftUeUAQiEiY5WZoEXAgnwlVMpq7gDIiWNmfVXzGMVBq
         dM/vf2IFBbZ+BAEPK4de6ziwx4wIIRsHExcOuSzx1GwHy4UZVvPNm/i9QqtlmyAEx5Vx
         qEgiqX42lsA/klo+yPSR0UtnIO1IlMvWDz1veJ0yUCN/Mb4YezWjthudQzAlYDjYdRoG
         CElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983857; x=1783588657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGwAednzqeRxCB22QWUBlMswoWJYl0ScI1kF4jRrqA0=;
        b=biAUgD15xAJVdxSpXnvXolRtfktB0TIuoXBh3mYZRGAr5BUlwLe4DPvVyhPXxp3SC/
         it72t8Q+cOfXiOl2ACJp56NNPzw8dp/S8Z2+1s4LX3pWJ5hFkHQRIXJRQB0pSiUA/Fkj
         B7EPMK5myYkgbxZM55Xt7dNcqrShqJo1xeBsWL+8xGvQijFDWl4KrAJrd1nROQIhvhnz
         FG0EQc/iJShuNa9nmMWZRLYx0F3T0jiypoI2MBizessaXxkDgDQDeVQnXK7zhccoqqvR
         CQxVOCq2lo1xkPZU8wE93ZAUZY1lHw51Wg/7K7ZhfD+v8fPwe3+eSH4qaWhy3pqhscH1
         bfhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoR5kqAidTsZLh5Yk7ihJcEu47qP6AgFK/ScgjJfYoP2Yu7Tx62b6E8GDPsnf/Su31rbd6D4hHgJxL4RScw@vger.kernel.org
X-Gm-Message-State: AOJu0YyqzXPzAnhMaSUXrNPypRDEM2KiCSAWEevX3gA5mJwxxifd1cHf
	KCgx6zhPQruf0j/czeMYWXGNjKGpqORn113leSNdtuzXv3eyqOdt/ADMxWP8f/WzRkp0W88WQtp
	iaVOqAclgWW/eVj7VXLTAaCm/vq68P9QT9DNAoh8YVGB4x133rz5Yw0Zx3wnu5+inawho
X-Gm-Gg: AfdE7cmsECIslOV6+2fdHiOuGiyNwOyGPYWrnEJ9PaEKwD51TWWIlQPEP7t9c262xjt
	NyRqRjlG8WLnKrbB0cW/3a5QYP7UaW8FhLta7URhpgiU8aE9dsmp3mPndBWZ2PbfNIre/TLs6//
	QQq2vNhlIC/hELFekhuYjDgbQ6AAe1Sjj29xVged8UuV2QLjMP8j8yhgOpXfN7I1Jhk1VdiWDwP
	oh0CZl7ax3zoELjZbl1OWQGR7HaNaK5BDH4199W8tnaOTj1VmD1jTFIhPdW+mSZ4G3ZtBNispT+
	mmaUZQ5HWiQ6etthqJROgu98f4bFHLoan+/ptnsuNHp6glqdvEKeVbk9SqLQKPcNNJYQES0ZD33
	MpjhHBP/bVIumjqQ6bb2QWit0k2mJBJXbiPEznwXFEQnR
X-Received: by 2002:a05:6a00:2e9b:b0:845:d274:c021 with SMTP id d2e1a72fcca58-847c51dad17mr4176468b3a.58.1782983856822;
        Thu, 02 Jul 2026 02:17:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9b:b0:845:d274:c021 with SMTP id d2e1a72fcca58-847c51dad17mr4176424b3a.58.1782983856203;
        Thu, 02 Jul 2026 02:17:36 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb985420sm1046311b3a.43.2026.07.02.02.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:17:35 -0700 (PDT)
Message-ID: <a107b5ee-1140-4651-b5bf-90e2b793cebe@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:47:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: add force suspend/resume to system
 sleep callbacks
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260701-add_force_suspend_resume_to_system_sleep_callbacks-v1-1-38c9a721a462@oss.qualcomm.com>
 <73243e36-175c-4fe3-a448-b30eef9c44ee@oss.qualcomm.com>
 <4fa2a2ef-90ec-4f06-8611-c508ce0bbec8@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <4fa2a2ef-90ec-4f06-8611-c508ce0bbec8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UwHuAhri4638BkNXVAqif14TZEs61NqR
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a462cb2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ve0Vv3Uji7OJGmRhxeIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5NSBTYWx0ZWRfX6s/rN23y6IyE
 FgWNSahAf/OI8r+9dKB5WddzGRuK7qpFYTbwNaahgwFXesyQAcx6seMAT4CSc0jc1OiybNdpGBt
 aw2w3spFtrdyhhar2IYQjeg5xDQlchElKsbuOQYiJ65556cgH2hVkIadPapQeawS4o61nGbSCyk
 S+f0lTEi9mSBCVV88FNTtslvPs1njYQE2Wu6Y6MtHrK/0GWHTl+5BiijulXgPvmR0qFTrJEiHiZ
 QeDLmNmuX7nPdAnVMV5gwUdzTBT5cJk/UcCxgOpZojLVM0n6pAzYHP+DBQuJ+pvE0kBhLUp+SYf
 DpHMP93f+94Ltf2zMdVObSQkSFCUxT4hDx6uJPeZrDFtmQvlQs8shWMwt1GMDGpHmDt+iMBMpGp
 N/MpfJPukA+qdSWxl/OjD0J7XwlkuNcK8I+QvF4+zUz/n7+DmUa4ICfsYJeL3soCNiNg+jFX9a2
 90fULscyyTbA8HLezhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5NSBTYWx0ZWRfXyqtG54R0rvhY
 MzcBSqJV1dWEXZxmeHb5zoxNqaJTAJr+34UxX823a06sgOroTl4GszihE/FGCBLw5yDa73FtiPf
 oxF2dXit1QUyOsAqDqrBuUNERNn78xA=
X-Proofpoint-GUID: UwHuAhri4638BkNXVAqif14TZEs61NqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115871-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1FC86F5508

Hi Praveen,

On 7/2/2026 8:18 AM, Praveen Talari wrote:
[...]
>>> +     * When no_console_suspend is set the console must remain active
>>> +     * across system sleep, so skip the force suspend path.
>>> +     */
>>> +    if (uart_console(uport) && !uport->suspended)
>>> +        return 0;
>> Rather use console_suspend_enabled and take action to go force suspend.
> In uart_suspend_port(), uport->suspended is updated only after the 
> console_suspend_enabled check. Therefore, its value directly reflects 
> whether the console suspend path was taken:
> 
> uport->suspended == 0 → the console was not suspended.
> uport->suspended == 1 → the console was suspended.
> 
> Looking at the code below, when console_suspend_enabled is disabled for 
> a console port, the function returns before setting uport->suspended = 
> 1. As a result, uport->suspended remains 0, which accurately indicates 
> that the console was not suspended.
> Therefore, I believe using uport->suspended is the more appropriate 
> check here. Please let me know your thoughts.
> 

I think it would be good to use console_suspend_enabled and take action. 
Not to depend on after effect of the primary decision maker variable.

> Code snippet from core layer
> 
> int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
> {
> [...]
> 
>      /*
>       * Nothing to do if the console is not suspending
>       * except stop_rx to prevent any asynchronous data
>       * over RX line. However ensure that we will be
>       * able to Re-start_rx later.
>       */
>      if (!console_suspend_enabled && uart_console(uport)) {
>          if (uport->ops->start_rx) {
>              guard(uart_port_lock_irq)(uport);
>              uport->ops->stop_rx(uport);
>          }
>          device_set_awake_path(uport->dev);
>          return 0;
>      }
> 
>      uport->suspended = 1;
> 
>      if (tty_port_initialized(port)) {
> [...]
> }
> 
>> Here, it sounds opposite, if port is resumed, you don't go to suspend 
>> within suspend function.
> It is straightforward: uport->suspended remains 0 even after 
> uart_suspend_port() is called, which indicates that the console has not 
> been suspended.
>>> +
>>> +    return pm_runtime_force_suspend(dev);
>> Is this really required ? if  uart_suspend_port() successful, what 
>> will happen with this ?
> 
> Yes, this is covered in the commit message. The key point is that 
> uart_suspend_port() may not trigger the runtime suspend callback if the 
> runtime-PM usage count remains non-zero. In such cases, 
> pm_runtime_force_suspend() is needed to ensure that the hardware 
> resources are properly suspended during system sleep like our i2c/spi 
> supported.
> 
I hardly see any other uart serial driver using 
pm_runtime_force_suspend(), any do not see serial driver using runtime 
PM ops directly. That being said, let's covered all use cases/testing 
with this change.

>> [...]
>>
>>


