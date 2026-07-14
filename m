Return-Path: <linux-arm-msm+bounces-118932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gAOaGXbHVWp6swAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:21:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B644275116A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:21:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ga7ciTTX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SAKu4qI+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118932-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118932-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86DFA301E59C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E9831F98A;
	Tue, 14 Jul 2026 05:21:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8042D31E85B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:21:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006514; cv=none; b=p8WEHGs+WZR7SEDRfGoOLNn8sj9QL4LH7VRCMO34bxE/ybe33OVtH7wOilrOfx86ks2RjgO1yj88qmEI37gUHJO6CwmylHkDz7y9pUSFrqthLRTu3+rFCk2/bg3qLw/i7om2afj5NsouKf4ky7bct87V7T04oaNimeabIkvrnW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006514; c=relaxed/simple;
	bh=TuAodXskmsk6PpOUP7bcreyJUVtepgakQ0Ia6qBO6yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjzzaJJ+mGwSYeGwuVXZkX4/uUnelZ20h1kjzp9BpzIZsrfQIhD0zpthJbxq9F8xpSe4qjACz4EG7rAAwgqq8L2YL+u5kcOS26iE2tclyXHsu6Gwkz2hnI3ALLfvERV+aa+x+sBT56R8jKgp3QPLnDOo1nxMbs8hLPe9pPzskDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ga7ciTTX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAKu4qI+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E382lk3556542
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A9GY5SmmKpXBp0S4UpoTVLYAhXq0hiNnfIA35k/Yeeo=; b=Ga7ciTTXlZHchP5y
	CXm0Hb5IiuHPAAzHw/LV3WURvZcT8WuNWYzDJ7olnGQ4qtHhZ19Wc5Bg+J4CcEto
	uMAnHTYeRCPgiAKVmSi3YWrHOm860/8BOSfSUKvQQ9G3Q7cW9XQQT1AaRu1rTSKA
	uua4CfftwzQmZsW3kuw5kGsNZ/H03sqvD8xT7dIJ+K9axjzEMq84ZQb+Nyykl6GM
	RzNIzkHkp4QotepVCvPzSznMH0bzwYR4t0ROcXbuTbRzlNyD/oa8PvjMWz9OVKRB
	GMn1uZyu6jC0c5/vb8GPKUxe8T1ZDSh6J38Fu7kpQRq94YLpol26Ctq81ONeYn5o
	UKXftw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ct3af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:21:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so5928129a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784006510; x=1784611310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9GY5SmmKpXBp0S4UpoTVLYAhXq0hiNnfIA35k/Yeeo=;
        b=SAKu4qI++os0wd7DxynzT90SNk7QALGTWasgs4yQBh6hGVJNPPfbwb8HagLdfZ8PLT
         rWSpuA4cb2rn002nWpC0yUnKHz4i/emGKrSXBow0S+LEjFMX4rWNp2XbQ4uyFAKHNIAu
         H8W6sLbrbsqwK4p4S7uC3iN3k3HjkACFN8VrNSNgUbmJRnQfOK7avegjK5ah75ORvZBv
         shinOocrr/aOmi2VlEoz6mdJwoWGib+686Cx7o3LuintiAkEQr/9EtUyvtLMPHGmhVne
         2jDtwMWI9TXw8UmK/colT33tyWJMqSQI7LBhP7KEG53BS+6URmd+BPZKqgFrLKqDLauS
         NQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784006510; x=1784611310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9GY5SmmKpXBp0S4UpoTVLYAhXq0hiNnfIA35k/Yeeo=;
        b=J7Q9TJGOZftoijNJ4eu3xBEvnP78zx38D/AweV3rm4nO4GjGjd2OI08PTElCZHEVSP
         PEuHdZbV8QMto2s13vjFfVwzhOl0iRYBUyx/6c/xiREsuLa4W9Le6XgOfIZD20w+74PU
         naA+ruuufHw2lZGErT6TmP9DhTBpolGxhA3SUNZ1137o8Lg10jz6N4UMHHOO8HFMEAAP
         x1/EeL/xqpUQi9FfNFXSQy2XRb1Nn7zojbwMGJenvv/DUN5In84EEenvi/v5LqMSqCBo
         kRf4w6ID/TXFZ88tQN9arfo2ZjEVllA1hLmIDO40dJsWjb9Vt42x17qHOjV9kxmX79XJ
         aibg==
X-Forwarded-Encrypted: i=1; AHgh+RpzzQqyBA406rqUIQrRSesPmN8dPspZf77fU1jlFFT3LVD8/d3ZOEYPpzeFRlqvhv97etHuCzxQLoHtl8+9@vger.kernel.org
X-Gm-Message-State: AOJu0YxkzuqnfboGxcXdwoUWmUv9CWbOPpy80c6AYUzYnktDUgnyMsC1
	Q2NhhUn5tEXF55Z4Wxh+Q3wVAut8+RJol/v755uJxWGT/IPpYqp3qpd167O6PcXZhQtBrTQeNjr
	Dwzs2V6j8CBDH1F61RSwDQv21xTROIaWcoBlAwfXbzwViiD4FyquNFYBZIjP0lP4yQBorGlngik
	sF
X-Gm-Gg: AfdE7cnaLE7IUedlR7cVX9aPwR5vfDxzYMVHxK73cX8dlnG9rFbHsBEpxR1vQnJpxQx
	Hd+VvbvX2G0vrZzbubxO0Whr4pmPg/iDPWAgo+NEulABl+pYvAJZzzLqVZOJquNBV5Y/zHdb3UR
	oLgcoL6a8pSyBBYSZ3YaPIoTXQSdNEQObuEjYxH0u9G+XCWZD6qvTuf1DOaT9IXw21ja3E68ozv
	Kf3MhwpK9Q6weoQL1i/iVIdYupITW+5rffOs/XkbWTsCzG9W/d3OFAPCv1X1fBHfKhY4RMxlV+/
	FaV+OMzZGQhfDeCeWnTbPdz9H54qfd/jCZKZMLePZCH2kowexWJl4J0wSMKkX53vsp2Wjy6MEnT
	ZX4JDErV0Uw9bQ5XvTQpPO/myKNvcY0jxZSqlLpoYTg==
X-Received: by 2002:a05:6a21:4cca:b0:3c0:9c19:65b9 with SMTP id adf61e73a8af0-3c110a66059mr12624717637.65.1784006510619;
        Mon, 13 Jul 2026 22:21:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cca:b0:3c0:9c19:65b9 with SMTP id adf61e73a8af0-3c110a66059mr12624675637.65.1784006510017;
        Mon, 13 Jul 2026 22:21:50 -0700 (PDT)
Received: from [10.92.197.28] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm42074011eec.15.2026.07.13.22.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 22:21:49 -0700 (PDT)
Message-ID: <788b1ebb-db13-4f6f-9e92-46802d7027f6@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:51:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] spi: qcom-geni: add GENI SE registers trace event
 on error paths
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steven Rostedt
 <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260711-add-tracepoints-for-se-reg-dump-v2-0-ca1e9ba62359@oss.qualcomm.com>
 <20260711-add-tracepoints-for-se-reg-dump-v2-2-ca1e9ba62359@oss.qualcomm.com>
 <cc4797fa-6911-45a3-8775-69c2ef32a338@sirena.org.uk>
 <4bcaa245-2127-45aa-bf05-48e275c0129c@oss.qualcomm.com>
 <72cb70b0-d89d-405b-b2b9-807e028d6fd3@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <72cb70b0-d89d-405b-b2b9-807e028d6fd3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cmStaXXAw2lMjCjl3Dtm1EuiTkOPfo9A
X-Proofpoint-ORIG-GUID: cmStaXXAw2lMjCjl3Dtm1EuiTkOPfo9A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1MSBTYWx0ZWRfX7xw7CH23Nq/1
 KrYHzll0GV05ZDqp/7ZMowf2qvjPjz+V+9q/oZ1OF9rcoSfW13mUik24FN6R5UuP0CWRqwAoD3s
 5O45WDHPIsXcc9wyNgXtYLeATpB88Jw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1MSBTYWx0ZWRfX4F/Pfjkd+4rp
 SgmH+0okc66X0A6dm5pN7y/LQshCCpiuTwK0BHXHwcAbxWrvx3CEfwmq5VvjJ8JCamttab2n0kK
 f3cGLCrrSRURWAJdyq8imb6pOVDcFNITmNpA6g9JpGW0aq8X7dpH1SEwx+oZP9P08XI0GM5lFfJ
 COyijOsbOBVGiUVWFofLVxkptUvjHAi733E/0jPMoOSOaQGkfifprDEPbifewDc2ODXbLdkmiZs
 Q4WdTbJ53U5HN2y5jhB6WB4aXaBH05JYXsbIwobhHBUnKtGACkkHyZQYVcKXN92ZoTmhZFBt3tK
 PoHa3sTghCfHazH0F89X34FxH+F57pd201SjnRmNT5LXM3kH8r3wNaFAp6+37oWcxW9FgGUFuYr
 XV6H06YDMNrLRTtjizxbXJ93Sz1Lrboi13bPbq7Mepy9xI6DJH4gub0wcKbC/lpZNnRlj303Q0m
 p1oqMRvW3YawizNGxag==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55c76f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=JsoTjjDMo91fjAJr_joA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118932-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B644275116A

Hi

On 13-07-2026 16:16, Mark Brown wrote:
> On Sat, Jul 11, 2026 at 08:21:02AM +0530, Praveen Talari wrote:
>> On 11-07-2026 02:56, Mark Brown wrote:
>>> On Sat, Jul 11, 2026 at 12:18:42AM +0530, Praveen Talari wrote:
>>>> +#include <trace/events/qcom_geni_se.h>
>>> Should this be in rivers/soc/qcom/qcom-geni-se.c (and the first patch?)
>>> - that way if another driver starts using them we won't multiply define
>>> the tracepoints.
>> Yes, you are correct but
>> If this header in drivers/soc/qcom/qcom-geni-se.c, how it will be access
>> trace API in other drivers like i2c, spi and uart?
> The header needs to be in the users but the CREATE_ define that you cut
> needs to be in only one place to actually create the tracepoints.
Sure, got it.
>
>>>> @@ -986,10 +997,13 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>>>>    					writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
>>>>    					dev_err(mas->dev, "Premature done. tx_rem = %d bpw%d\n",
>>>>    						mas->tx_rem_bytes, mas->cur_bits_per_word);
>>>> +					trace_geni_se_regs(se);
>>> SE_GENI_TX_WATERMARK_REG is one of the registers in the tracepoint,
>>> perhaps trace before we write to clear it?
>> it will be captured in m_irq register so it is not required to capture.
> Are you sure that won't lead to user confusion?

No since m_irq can capture most of other bits as well.

Thanks,

Praveen talari


