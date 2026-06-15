Return-Path: <linux-arm-msm+bounces-113178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1A3sMdH1L2pvKAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:53:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C69846866BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:53:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I15gNtEg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZMArD7cc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113178-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113178-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7E36311ABF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A493F39F2;
	Mon, 15 Jun 2026 12:39:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCF83E832A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:39:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527168; cv=none; b=gv0YpbADsY+/Ln0evdz9kifAkoPvnCmpO8XchNpzB2v61nM4yVt9fP8SIOO2oDCOi9bJYp5QDd4K1PQv8j3IsAjO33LYDr1y1pJTX3Zn53+W23ED1W0tsnuoOW6I7KbSE1hSRfYPjoZxTFo5U3iOUwqUWh7a2Vn5qs1nw8u2n30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527168; c=relaxed/simple;
	bh=Y5prCy5+X71R7ukzr0TW8cLU1IZdPzDKmXZeqLxAJiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eix2oGs3zNN5HyLd+e2IDe4lZZJJMJF5+m1lk7aSdwrLnxnedsVIpducoBSmb6h/487HSp2Gt41BCts10sT+v7moo9DRMsnVPtGHwY4n0+Fualf+WsGLP686+pd9aNQDVZ1Bi/AB2vB4duPkSYEi5sG/ok8AcGEQOpyvfrZSc7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I15gNtEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMArD7cc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCaKCG501854
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvAUEeqrTnOOtIH0IwXD0ePwoU1h7XJ2wsmVx9GGNbE=; b=I15gNtEgbJFa3B2j
	oF2UfjblXkO2+xaZprLAY3bykuh+O2oyNVvKV1GpUMmRtVtbnrce/zW/EcpVsnNb
	PO36+hgg7n4VQ7FH83Q9gZ4WU+xJr9dK750kVKL0RbDOpFuFzlOQLv6oEg2LDwoR
	V4fjnxOB2Wgwhe3gDVE9KDYMIElRUdimqWd80Dtx+iry1BhuDjMPxR1/KsAdMxeA
	nN/VkD0yd2NdxRzJX/tiszcOM8KqhkJJOCZUDkqS/t1ZwJkMY6y1L2EOOOrouEV2
	5k7y3T5w50GTHHGbVU3VWctL21bxGTv+lrCm2DI20Blc5p2PJyeqJgV9yesLoXgP
	iQlbUA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegurs1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:39:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-13967c19ac6so5640027c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781527165; x=1782131965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvAUEeqrTnOOtIH0IwXD0ePwoU1h7XJ2wsmVx9GGNbE=;
        b=ZMArD7cc+bViQJNq+abiNgFiBNPB1JZ2vsARTz4y5k2v29KblIOfg8y8FoLnz1oJv8
         lBrwiI+UdmDlcVIqtH2JewyFxs3mUhIdDDOYLKN0JdLXlTI2zXYI77caqWHKBsBbCjvd
         YYDBpLvb73kYTeUR0xhk3QKnzMDM53iIE9pLCCMCKD55GhWf/cxB2jmiymt/Y7crs7PO
         YoCcC0ep+ptwZ0YQLuz6QZOSE6g3DEigWCfc73gykA2GqYVai3LWj5H4dYTl5WUVisiG
         MburxA8QNw3EApmVGgSDCxf3pwnCuhAbFsQefto658RNyiyc+cxFcEeCMQSI3JEOoKBr
         Xj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527165; x=1782131965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvAUEeqrTnOOtIH0IwXD0ePwoU1h7XJ2wsmVx9GGNbE=;
        b=J/NqfD4m6U/txXZ+BOxi64t9HW6k19NpHEaD7Yv8MOG9WoPDcQNGbL0GWNB5WFQ7OK
         znNH+t4keGwRFozlfTVzBHHMh58Dh33+UI0tMvcjTDuy79PYvska+ssQi6HOKMNNhaGB
         Nlp9UVNBkIVmQ+xwhtaqchddkhpxH+Ly0VtzKeYXZLE8PX40QCptHAp4RKCSHpPMRZ7w
         4QqIzPCEDFJaE1yA03eLFtTeDAEmVNVeEktLGbkojATNn6OxF2jwzTZlEP77JwYaJdLw
         3lm6FRSO1rJ1KivLaiIuKGgbik6EgptLQ5v8Wusi+ojHe95nWWa8u1FPb4ChW5u2tkNN
         rGPg==
X-Forwarded-Encrypted: i=1; AFNElJ+MpfsFKM4rLOVOWJdNX0TXBAaU4exvtt/pHyHrWmAHoYKl5vNXyXDdgm7eATs2dN0ljEguW2eKmKhZxT/4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+uyICztlQIE9Ii/+6bRgdLB9eDy1xkIvy3IsOtu2C3Ucd8xm
	q6w2qxldZzeGi3KgHKBSyPCum5o/MkDnp8kXoj5Oa1i6HG4ikHbuaSpwDSph8sbbJlJvHSj8JhQ
	AcMtyMojVfDiy6Dff8OXYelQ/qXRcW3ZPRZRmlxEgE7nLC9OszyAhYJDZ0xuJCjD0vqYu
X-Gm-Gg: Acq92OFvthQMRJJwvurmRUs8irFHo39kWQhefSmzYr3q+h7BasUQvdpgHHpuYsCwGft
	S+VLAQM53ItPar6bEhICOPcF1asFu7jsxmzXg8wFQ1Voy/bAX7f59U+O6gAPk2J4Q12t2BT7efR
	VwB+ycLl/KViNjNimmcCXbtQdn/Z/yE7NCrpeQWX1YwXX0o45KibdBSFLyoFEIBko7RqiN9XXF8
	WsVnv0EIj02z47GGHBDrppGg1WE0kvn0M/fcHWB2ILaCPQmAKPbRy/LwAENoNXukxrxEzgiCQZN
	GYYtkwQldeWVCle5tCirb0NCLnQ9s5XpSIs/UuF0TjegFt7XbyHS46BzbGavyla2X8kJKfBuIQx
	R48zBuOxpAiLfSb2zhlPMVMlBTA6OzvY/GYlwRtcbxzUydnBJOrJ7CA==
X-Received: by 2002:a05:7022:ba1:b0:12d:f0e8:9696 with SMTP id a92af1059eb24-1386f237657mr5141967c88.4.1781527164595;
        Mon, 15 Jun 2026 05:39:24 -0700 (PDT)
X-Received: by 2002:a05:7022:ba1:b0:12d:f0e8:9696 with SMTP id a92af1059eb24-1386f237657mr5141931c88.4.1781527163931;
        Mon, 15 Jun 2026 05:39:23 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.111.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b8f9927sm9787181c88.1.2026.06.15.05.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:39:23 -0700 (PDT)
Message-ID: <945821ea-5065-4e20-a1f9-32f7c9adb66a@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:09:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] serial: qcom-geni: trace: Add tracepoint support
 for Qualcomm GENI serial
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com
References: <20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com>
 <20260526-add-tracepoints-for-qcom-geni-serial-v4-1-e94fbaec0232@oss.qualcomm.com>
 <20260529101422.18dda2ae@fedora>
 <688f0529-44ea-4cdf-bb0f-6c42cb3fa07e@oss.qualcomm.com>
 <2026061536-skirmish-nuptials-8fd6@gregkh>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2026061536-skirmish-nuptials-8fd6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMyBTYWx0ZWRfX2ynRrPuD0a/e
 9r3Kc05NyFRBeLsEE9Qbkr6/PpkETLHbcyig2pcDHNVp71pkTuhw+gQIofhsIXBC5Y+mrrBSXzK
 rsmSU5pG2hbuzkO9w9pBco0+ehq1pCflVg8cvr6w2KNMOmHtuagh7M1unx+h1vfvFoUEDhxfxbN
 fMMljpcqD9YQ2DXvcH+W4UcGHQbR7tlRX3lTMTn2QFXB/f09Y3EA7XoDuCc4y0BbUxXoRdXZMLW
 p/yQY+qdtnV9NVyFfP/R+mXBLMHJZZXv6T/bJNW/S9hT4L+mGeQx+X4Rx7jR4MtzllImzmH7ttC
 oifZxdhuQZqiqIzoRBVp/zEKB0iTpmqw9w/ngOa7GaVMxoJA1LmDBD8ydQs0SSKckd1XEaXKhmj
 MCYt7mY28q/ex4c3g/LxBzD+FRZIabJX2oKTvK/rJO89au1VHP1iwb3fEdJz3TidWdKaegGn9Ha
 s0D3GIkca7luC9lBzaw==
X-Proofpoint-ORIG-GUID: I32prKnbyNHQrN8YEyon7JFYea43jxve
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a2ff27d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=f811rhDWPubbsD7ecTZfYg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=77qTbivRXhmBWYv1PLEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMyBTYWx0ZWRfX3MpnOy6zZ5Bu
 h02zMm0gIFMJpz40iZb8rSx3Yp4KGu15q9KHwH5B1XLnKUxZpFscKtLLT5syOC3otcHR5ITdhl8
 blQ0OiEuIW71nJxJViwVaXXBRxx5F0o=
X-Proofpoint-GUID: I32prKnbyNHQrN8YEyon7JFYea43jxve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113178-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:jirislaby@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C69846866BA

Hi

On 15-06-2026 16:12, Greg Kroah-Hartman wrote:
> On Mon, Jun 15, 2026 at 03:26:25PM +0530, Praveen Talari wrote:
>> HI Steven,
>>
>> On 29-05-2026 19:44, Steven Rostedt wrote:
>>> On Tue, 26 May 2026 23:07:39 +0530
>>> Praveen Talari <praveen.talari@oss.qualcomm.com> wrote:
>>>
>>>> +DECLARE_EVENT_CLASS(geni_serial_data,
>>>> +		    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
>>>> +		    TP_ARGS(dev, buf, len),
>>>> +
>>>> +		    TP_STRUCT__entry(__string(name, dev_name(dev))
>>>> +				     __field(unsigned int, len)
>>>> +				     __dynamic_array(u8, data, len)
>>>> +		    ),
>>>> +
>>>> +		    TP_fast_assign(__assign_str(name);
>>>> +				   __entry->len = len;
>>>> +				   memcpy(__get_dynamic_array(data), buf, len);
>>>> +		    ),
>>>> +
>>>> +		    TP_printk("%s: len=%u data=%s",
>>>> +			      __get_str(name), __entry->len,
>>>> +			      __print_hex(__get_dynamic_array(data), __entry->len))
>>>> +);
>>> No need to save the length of the dynamic array in __entry->len because
>>> it's already saved in the metadata of the dynamic array that is stored
>>> on the buffer. Instead you can have:
>>>
>>> DECLARE_EVENT_CLASS(geni_serial_data,
>>> 		    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
>>> 		    TP_ARGS(dev, buf, len),
>>>
>>> 		    TP_STRUCT__entry(__string(name, dev_name(dev))
>>> 				     __dynamic_array(u8, data, len)
>>> 		    ),
>>>
>>> 		    TP_fast_assign(__assign_str(name);
>>> 				   memcpy(__get_dynamic_array(data), buf, len);
>>> 		    ),
>>>
>>> 		    TP_printk("%s: len=%u data=%s",
>>> 			      __get_str(name), __entry->len,
>>> 			      __print_hex(__get_dynamic_array(data),
>>> 					__get_dynamic_array_len(data)))
>>> );
>>>
>>> That will save you 4 bytes per event on the ring buffer. And a few
>>> cycles not having to store the redundant information.
>> This patch has already been accepted and is available in linux-next.
> Great, can you send a fixup for it?  Or want me to revert this instead?

can i add fix patch in same series by removing original patch(0/1)?


Thanks,

Praveen Talari

>
> thanks,
>
> greg k-h

