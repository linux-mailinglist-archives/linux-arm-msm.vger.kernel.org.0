Return-Path: <linux-arm-msm+bounces-119123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HAtvJ/LWVmo9BwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:40:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69F759BAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:40:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I4KP2p0Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hP1sK8Hx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119123-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119123-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBC21308435E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F06243387;
	Wed, 15 Jul 2026 00:40:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9336921D591
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:40:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784076012; cv=none; b=XmGFPiYuawe1tlN5s8d+tbOL15ETjhY4FXzUZ9OLtvWrE1e/phnao8Ml4rRmpNxjGpoz8nH8BUuhj0YMjGhO+j3BAQ49/5rEfzUduzx3Binezbq1r+gTZkfQN5JXdMpnVXNWKfPdLt8Nk0FPmYGxzyHM6pMuCYveIxAc8BojBzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784076012; c=relaxed/simple;
	bh=khn0xYvQDd/veBdXQphCfbEdQr8/fRw63cTGqmTs9g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWprP/lqksCdzk9+4OFs8UN4rMEX8RO9NpLfTmH7hehZ5xwYkDB85N4F/GFfFvuqc5Ah4350Sq0TtgyCIfT8567tkVvkRfoNuYluFMoFLqi0X54qryO2Vc6M48R/+ypEdLPcA85iGY5EiAIi5NcesZdYVUt78SOXBPlh0cEbwEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4KP2p0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hP1sK8Hx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0Hxag2133850
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9pxEm9NUfdQ4hG3JS4r6OkRv8v0QkFlp1sm6hO12JaA=; b=I4KP2p0YVjVbTmy9
	Q0cMxzQtJUdyDTsEeuaASaueeKJRQwQBuPhhocEDpwcY5YpmfgmqFbd2mEtpacCO
	aIvaymzGgrN5W/IwAgjCT82r7HRRrlgoX5if31Cyzox5DdYEJEGAPCG+K6rfIeOZ
	zmFxWWJdRRYG/vzfNh9uZOjMwPFRgR7KQfA/Fp3lxVDZ5urmAjdmn98oavXj1Zmt
	VGJP5FDYTamLlkOfm7LJmwAjpyZqeMP/irVZInvPTu6/axyN8IkwfnE+z3XUdGqp
	QuaU35J04dhWaFs/rqFaD8uklZwNkuhjJMq165//P6hPqOwxEXMRK5caqNgY1C94
	8Oh1+g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9hs9r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:40:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38c7de7baf1so5341014a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784076006; x=1784680806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9pxEm9NUfdQ4hG3JS4r6OkRv8v0QkFlp1sm6hO12JaA=;
        b=hP1sK8HxbkhiXJfXpY+IMOhp1FfqX+FJXPNhksxfDhYJv6oF1YSgiXk84tjpJkXXfm
         MDxtx+zry2pB0sFJ976z+/i4cdQliOBr5RzFSGqZ6RGERxX3BQHMmcd44jzMbBSFspbJ
         Zc6G2UM25RsdO+Ix5nWaTMuUlrs/gf0m2p59VzRPnjmYYzyFavwKB3yfJ2+AjqAmTi8f
         HziCDwxFHrRy+H0vfETkh4ULspQKepXX55TRsnh6a8iaB5pDbZrXpR6OouFbcbAkAiFj
         xstiAhBfc0l7nFZz/4GKvv79rJVlgj+87MtAlNfTSqZC6b9OcHSGZKqHWwxjrakIedsU
         5BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784076006; x=1784680806;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pxEm9NUfdQ4hG3JS4r6OkRv8v0QkFlp1sm6hO12JaA=;
        b=nh6Q8skPCKPTYgZHqWe+czRHpLuJLiI1K37lweaXjfwhFIyK1ygPSDjiLuhzuCoLRs
         4QizoqIWlec5ER4h+dwn9Ds+fbTr3oITCQDGJ2M8ospgAbV5aQlO7yVlT/5g94a1DoX/
         LNYBS3PHJINXdgdue/u6IXEatd1U5x9wpJIuYPECEWzBcLsApi8lXUinVMF4rGo4vfvN
         cBOX3Dnv1ozRc7+DsW2U8YOpPS4nRJJcHnnRC3ym+O3esuBl49w7MMVQDFbHqsRbHulI
         cfZEIyn2ggxVv3EyeU0NJueCgmcg9DwV22HOmutuypb8+hvEtFR3NEEvYteBi8XlPqXp
         saOg==
X-Forwarded-Encrypted: i=1; AHgh+RrYA7+XvNUVC2EOiTO156tBuIZZR4Hazl8KkYqgSz8fj/2AFjtXDtZjD9KnFhM9GNnRyQD1tIW7rEiJU/Oc@vger.kernel.org
X-Gm-Message-State: AOJu0YyDNh2/jOZYWCkwnjZjuTNkxN8hYdFSv1OHtqTatU2yeEX1lctd
	bxnch7BoosPIp8Cgfxyp1hmNUWTLhFcu7G6DiSv/euLo0/j7pfzmrtRDXB9rB6eMv698r0w1hqd
	mcY2ql1MTpoPsZaVeIsRllidqbwMd8U64V13CRP8LqTBT5EYGKzLB7m7NA5qeF6Kb1H6H
X-Gm-Gg: AfdE7cmuYg5N0VnaYXaZzfrX7ffUd3EQyISLIVGLBbie+5v6HBY2uObPopNQ00wPEHf
	PZh8NwflUdvzPsk1DqdVOYt6OpMr5XTCx7krPvBKxx9iAwHxSsZP9En22Z4NdyxZr+W6c9BliDn
	L0LhBGvL7gGn3CAsSuKo83V+iWzdnMlDn/q3LSJhirJ8kl35HMJanQ8QjPgxZXLEfeRrtI23kTA
	z54+IRGtNKnG4Dt4jbzFlC5NhVS7Q2HxpOPLJOaFo+sb/Gw0yFXoEAPM1WyyoTgPO+w+dFPvMr5
	7fUOK0C4mLuRUGP9w9mnw088UydISokE4vk03nxgfPsf/dCjIbWTNTeIW71MA0h0y5FQe8BG3LA
	hrzrlgx8BbiLVLaR06Nt63QRZeN+h+eyEuS2qL6sH
X-Received: by 2002:a17:90b:1644:b0:38d:b36e:980f with SMTP id 98e67ed59e1d1-38e2a0e67e6mr622176a91.32.1784076005837;
        Tue, 14 Jul 2026 17:40:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1644:b0:38d:b36e:980f with SMTP id 98e67ed59e1d1-38e2a0e67e6mr622146a91.32.1784076005330;
        Tue, 14 Jul 2026 17:40:05 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6080dsm63926446eec.17.2026.07.14.17.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 17:40:04 -0700 (PDT)
Message-ID: <ad34e0c6-846d-40ce-9f0a-ed6d3d979060@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:40:03 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] usb: misc: qcom_eud: add host mode coordination
To: Peter Chen <peter.chen@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-7-elson.serrao@oss.qualcomm.com>
 <aktPYAddL-5efK9i@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <aktPYAddL-5efK9i@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ib+3n2qa c=1 sm=1 tr=0 ts=6a56d6e6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zXKWnOTHEPqTmJIUB2gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: knmHsp_FKDSUg9QpyUfJlSaZJIQ4CGSX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwMyBTYWx0ZWRfX/6EACCiGGlBf
 Pd5m20le1kYW/lGQDrvH4NSF4W3lOXGBsGGIUWlfGY0d7tvpeNV1Lp268kBJhFnvcg/QJD7Q9aq
 vKhUScAv4TR7oSbc4V1daf+HGxc6Agw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwMyBTYWx0ZWRfX2JSY+FkGoS8U
 SnBjsaHvRLPZ1G87xPwUX6sefhdttk2RAPgyWD1UGfnpGb6YfwG7iVGaGeZh20ExgDfFhq9X5q4
 O1qUGiBfH0zYJcZ9nrWChKV8UOj4XwqSStoV5QuWTHEXNQDRvZFspLectyLU36istR9fmkbfehO
 CdBJqOPn266KXXvmFUAa1LGkERrQNXK3XP8Lsq4knf7/nnmrcmyeDTs+h8823dSEQWWNd8WNWsh
 ppUNrDhOJLiBzInlCd9PofoHmKnC/LRT+kyMTFtJPOWrivWAWFzw/6lT3MHlbwwcGnTUMh/7MoO
 X0erBF2JWviqkfjYJRFOBQyT2akSz6PpG6TA2Xwtb4aT2Cfsb/pKj7XCtXtRqwUlErNcdP6gUzO
 nS0rW4kHpgYuJp+6zXM2qmg7PRKSCOJ6Ib2yg9oNMSP6X+N8uiWNOXAQTvRbZOGT6GA5HZaGDnb
 2QOVzaqeEfZpm5g2mLQ==
X-Proofpoint-GUID: knmHsp_FKDSUg9QpyUfJlSaZJIQ4CGSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150003
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119123-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:peter.chen@kernel.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C69F759BAB



On 7/5/2026 11:46 PM, Peter Chen wrote:
> On 26-05-01 10:06:32, Elson Serrao wrote:
>> EUD functions by presenting itself as a USB device to the host PC for
>> debugging, making it incompatible with USB host mode configurations.
>> Enabling EUD while in host mode can also cause the USB controller to
>> misbehave, as the EUD hub supports only a single upstream-facing port.
>>
>> Handle the following scenarios to prevent these conflicts:
>> 1. Prevent the user from enabling EUD via sysfs when the USB port is in
>>    host mode.
>> 2. Automatically disable EUD when the USB port switches to host mode,
>>    and re-enable it when exiting host mode.
>>
>> This ensures consistent state management without creating conflicts
>> between the EUD debug hub and the USB controller.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
>>  drivers/usb/misc/qcom_eud.c | 65 ++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 64 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>> index f656ffc8818a..4734b6307a85 100644
>> --- a/drivers/usb/misc/qcom_eud.c
>> +++ b/drivers/usb/misc/qcom_eud.c
>> @@ -55,12 +55,15 @@ struct eud_chip {
>>  	struct device			*dev;
>>  	void __iomem			*base;
>>  	struct eud_path			*paths[EUD_MAX_PORTS];
>> +	/* serializes EUD control operations */
>> +	struct mutex			state_lock;
>>  	phys_addr_t			mode_mgr;
>>  	unsigned int			int_status;
>>  	int				irq;
>>  	bool				enabled;
>>  	bool				usb_attached;
>>  	bool				phy_enabled;
>> +	bool				eud_disabled_for_host;
> 
> Could just use below two conditions for EUD enable/disable judgement:
> 
> Enable:
> (path->curr_role == USB_ROLE_DEVICE) && (chip->enabled == true)
> 
> Disable:
> (path->curr_role != USB_ROLE_DEVICE) || (chip->enabled == false)
>


This could work, and we may be able to drop the additional flag.
The only behavioral difference I can see is that EUD would no
longer be re-enabled as part of exiting host mode. Instead, it
would remain disabled until an explicit switch to DEVICE role.

I think this should be fine, since EUD is only usable once a
cable is plugged in and we switch to DEVICE mode anyway. So the
user remains unaware that EUD is hardware-disabled until the
cable is plugged back in.

Let me try this out and make sure there aren't any other corner
cases.

Thanks,
Elson

 
> 
>>  	u8				port_idx;
>>  };
>>  
>> @@ -156,17 +159,43 @@ static ssize_t enable_store(struct device *dev,
>>  		const char *buf, size_t count)
>>  {
>>  	struct eud_chip *chip = dev_get_drvdata(dev);
>> +	struct eud_path *path;
>>  	bool enable;
>>  	int ret;
>>  
>>  	if (kstrtobool(buf, &enable))
>>  		return -EINVAL;
>>  
>> +	guard(mutex)(&chip->state_lock);
>> +
>>  	/* Skip operation if already in desired state */
>>  	if (chip->enabled == enable)
>>  		return count;
>>  
>> +	/*
>> +	 * Handle double-disable scenario: User is disabling EUD that was already
>> +	 * disabled due to host mode. Since the hardware is already disabled, we
>> +	 * only need to clear the host-disabled flag to prevent unwanted re-enabling
>> +	 * when exiting host mode. This respects the user's explicit disable request.
>> +	 */
>> +	if (!enable && chip->eud_disabled_for_host) {
>> +		chip->eud_disabled_for_host = false;
>> +		chip->enabled = false;
>> +		return count;
>> +	}
>> +
>>  	if (enable) {
>> +		/*
>> +		 * EUD functions by presenting itself as a USB device to the host PC for
>> +		 * debugging, making it incompatible with USB host mode configuration.
>> +		 * Prevent enabling EUD in this configuration to avoid hardware conflicts.
>> +		 */
>> +		path = chip->paths[chip->port_idx];
>> +		if (path->curr_role == USB_ROLE_HOST) {
>> +			dev_err(chip->dev, "cannot enable EUD: USB port is in host mode\n");
>> +			return -EBUSY;
>> +		}
>> +
>>  		ret = enable_eud(chip);
>>  		if (ret) {
>>  			dev_err(chip->dev, "failed to enable eud\n");
>> @@ -308,9 +337,41 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>>  static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>>  {
>>  	struct eud_path *path = usb_role_switch_get_drvdata(sw);
>> +	struct eud_chip *chip = path->chip;
>>  	int ret;
>>  
>> -	/* Forward the role request to the USB controller */
>> +	guard(mutex)(&chip->state_lock);
>> +
>> +	/*
>> +	 * EUD must be disabled when USB operates in host mode. EUD functions by
>> +	 * presenting itself as a USB device to the host PC for debugging, making
>> +	 * it incompatible with host mode configuration.
>> +	 *
>> +	 * chip->enabled preserves user's sysfs configuration and is not modified
>> +	 * during host mode transitions to maintain user intent.
>> +	 */
>> +
>> +	/* Only act if EUD is enabled and this is the active path */
>> +	if (chip->enabled && path->num == chip->port_idx) {
>> +		if (role == USB_ROLE_HOST && !chip->eud_disabled_for_host) {
>> +			ret = disable_eud(chip);
>> +			if (ret) {
>> +				dev_err(chip->dev, "failed to disable EUD for host mode: %d\n",
>> +					ret);
>> +				return ret;
>> +			}
>> +			chip->eud_disabled_for_host = true;
>> +		} else if (role != USB_ROLE_HOST && chip->eud_disabled_for_host) {
>> +			ret = enable_eud(chip);
>> +			if (ret) {
>> +				dev_err(chip->dev, "failed to re-enable EUD after host mode: %d\n",
>> +					ret);
>> +				return ret;
>> +			}
>> +			chip->eud_disabled_for_host = false;
>> +		}
>> +	}
>> +
>>  	ret = usb_role_switch_set_role(path->controller_sw, role);
>>  	if (ret) {
>>  		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
>> @@ -424,6 +485,8 @@ static int eud_probe(struct platform_device *pdev)
>>  
>>  	chip->dev = &pdev->dev;
>>  
>> +	mutex_init(&chip->state_lock);
>> +
>>  	for_each_child_of_node_scoped(np, child) {
>>  		ret = eud_init_path(chip, child);
>>  		if (ret)
>> -- 
>> 2.34.1
>>
>>
> 

