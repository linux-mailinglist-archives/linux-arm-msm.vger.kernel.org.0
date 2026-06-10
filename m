Return-Path: <linux-arm-msm+bounces-112386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wovNN84sKWrrRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:22:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5494D667C6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:22:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nLVn6rlp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d95lrpSv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112386-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112386-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94C9730B303A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7462A3A7F59;
	Wed, 10 Jun 2026 09:14:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5FF3B52E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:14:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082895; cv=none; b=C5zmCpn9GX0h6FxcJvmIINhdaaZTWSXo0IPNf9LGNpksoxVucsFgfQ5pUni1sJaN6xgcQ30FmI8+ncgjmWWHj3mYI93RA6yMaJqtjZoAFJBdz83ZfVWQDassZnENsQeB5cB30Xf/ux5kN1ZRLwVaSTwlgc3fJ0V0elsOk7PMyio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082895; c=relaxed/simple;
	bh=+3Oey1WWs5aR95mQcQBU7xyu2mXS3uTyCEBbqJb8qu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFruIKgt+2tOYKk5xEEhD8AXIecFz1tPF36bMYLOmkMOTz5fT0G3S3D2avjHOVPpdLtrgW5GdH/HzydQ2KjxaNjImCJ7pXc6vqiFgP+WXlQL58VTH/IZ6BEWyu0GT0uxFLLBuMHhafVkgsqr2lj3GwQqfy12+SIqfBGlaH4qGsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLVn6rlp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d95lrpSv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iHuA988886
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N6BysjMJ/71Lcvntk0+U+p4cz371ihNxbLf/Gr/x7fI=; b=nLVn6rlpvacqkfb8
	xl8mVCl47/jMHJJCxTc9ECH+9JYmS2d8y7mPZkGLIMx4sLwwCL2UBe264kZG1m+E
	5SqgVEqnH3b4QQU7Z0ZbHKMyAn8S+VSBYi86tvM8HddOMSleeSDBoqOxaYbDpyIU
	LL+QgTtGE0B9cFqMgVtFnkLaG3DnLzTlEN2cl7whoyVMnJlpKHy0FAWdRPJBZUCr
	krFGOK7k/FgEwOKrLBofNd7vuD3QkCAgYS2lyqxFyLKxXMGw3vRq4756iRZnBgds
	4PdJStD/fNVwsM3r6J3RAuUdQweeedZK5RFdiVEs20ah4R6rJkT7ZZ2BUNu3DTnP
	hGqDTw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2segkgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:14:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso11387842a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082890; x=1781687690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6BysjMJ/71Lcvntk0+U+p4cz371ihNxbLf/Gr/x7fI=;
        b=d95lrpSvdeXk9Db56WMk/3nlPAuxWdEjy+03GktsVYkPS85prSaJ7YiEXtbzrv0BZQ
         g3iHBL2caPp97MkQZYMcwBaCLi+cA2Cn3BBMovyx2dbDVHyI5y2N8/3MXGlGYPRylHxO
         ymigqxgecpa/Qqh3qKWNcFTHQpOvsMwHyOHLDTmHW/Ug4neDPA6EbDZt7U0P/LQvO4Y7
         VoqGvPlSJSGvCv0WEry7G78Q2rfioF6GYpXbkwB8rDt6lVT7qF5j8nfpLUXwo1uWJENf
         c2BBNwjt6mkEKuwK/9LWYoW7Nf8SEEv8354+MT+K75gILmveIQgAuh6KG3E8vkmrwt9n
         9ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082890; x=1781687690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6BysjMJ/71Lcvntk0+U+p4cz371ihNxbLf/Gr/x7fI=;
        b=R2BppIcGCYzjWHbDUge/nacI2uzXhE2eyU5hr/fds/rYvMe2o5bqlSj20qnqyK1COv
         DiJ+Budumo5ORMNevbQKxIItWVCmWomx6GAPZ+fYirWjOr5haUPf/nud6nRFyE0/al3h
         uFsRgYpQ0EMteXIYlM6RwF5oYZH95J5LsZdrNflemPohNCntjWij6eTVsN96m0wMlfsH
         A/iQ30ZiIGuclS+iLipeM7xXkU9Ajkym3EdyONZZWhue/6d9rcXnTm8K/H4eriOGBsUw
         A8UlZsWdQWeBj0iY/yY7zRsOF1xLQ+wZBG4aaU0zX2UsRwf7Fcyy3U88VUkGvqY85Z7S
         xhJw==
X-Gm-Message-State: AOJu0YwNswlBUWiFkaIir05r6Tn3uEDjEhaTOFCUWEnOv0KwhKeFdKpH
	yHAsSlfmGxEVfUbKy/Z84E7klc+xRheCsZtLNxsJDGG/bhsHieI9YLkqCNIOvZeknxh2nlXY/lB
	M+1bLGyw8++jik+daBQSFfT5pK5ShvRrXBJkzbVIQcRNB3em/SL1OWD86gtC4relnB0ErODSd2p
	KM
X-Gm-Gg: Acq92OE4xx24Z5a2myGfEk5tAvBxIhLnRW6+MFEHmu0A4oDAooClPQ9k2aFGN5SbrVH
	FdiOWWZfCCZW0M1GP/y/7B6BmD0v0h+uAvsMASIqlwUTffXu84bu4Y45TnB5HJLKBohnXvpyN/l
	Qq6G3XnGHYHgXA3WkXSgM61X702udWlpYP4JENCwQh8Y59Du3cTDxotRAQTTXdmUf/BwdJ6XygZ
	jY5jyk7eoPN67xyyUsDzstDXIKrPuyKXP+PxhUEdmc18OUnGqZSIOfLaF95rPoI9vaZ3WZ8F/AJ
	W4pu3seEbRmx3iS8s/AkkUmirmJksET0dogVvMzLjgBkq9ncxmltUZ7oRSsqtgSmiH2AcmMDHnW
	2fuc+5xdoETuAMe0OzMo/eeLp10YTdo1GIAEs0ZdZvOIpeXxjHeP3PNEUKH/h
X-Received: by 2002:a17:90b:280c:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-370f0095b7bmr27502267a91.17.1781082890282;
        Wed, 10 Jun 2026 02:14:50 -0700 (PDT)
X-Received: by 2002:a17:90b:280c:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-370f0095b7bmr27502244a91.17.1781082889858;
        Wed, 10 Jun 2026 02:14:49 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3762514be1bsm2796226a91.17.2026.06.10.02.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:14:49 -0700 (PDT)
Message-ID: <661e2c15-0528-4cdc-a7ed-ddced32f7ddd@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:44:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write
 helper
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610080809.2588640-1-ajay.nandam@oss.qualcomm.com>
 <f03850f6-186d-4988-a450-e6e95f24a551@kernel.org>
 <0fc4d9d4-2943-4ed8-a8ea-014e83c74e5c@oss.qualcomm.com>
 <f77f6d28-b3fa-46f3-a6c1-fd0093cbb458@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <f77f6d28-b3fa-46f3-a6c1-fd0093cbb458@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jKddpJbPb7m3TrKIXmYJRtPAgxGT3iSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NyBTYWx0ZWRfXz/tiQsMVLo8p
 aZqcHU28xRI1QE1L50sUnJq8daIhdThqetHoK/qq1vR3AcnYdiFvDvesLKrkVBrZ9goSdyvask8
 xwNQT6m/xjBsrH89rggpIzffHkNRveNp1dyFJkhtLs/tVHFlVLuQ1M2ablcdW8oTof2LvzhMEQk
 DV/dAO1d8yltfWmqoOqHxFwoO15yRD0knzLbu6k2e5Eggpyb4qDVYwvk7GY+QkOrVB6n0fFmnPx
 WklpiBZt/zKeKv1SRwbsEUsvlwB8n3RKdJzraqL18AT6HLqqME9cTOMmwwegMkW5IqnPLrVFD/s
 W388jKP2Gk1Eh3A51k6jDk5V+1Zi2BdP8l+xZ5fGg6AC7BFtcVzoYyzX+4pmLoVKn2nshtKyQJt
 NjMnTO9Q+aQi9iyRABpZpP7MycT2HulbtYDPh2adQaAdihpxGzADOdbsF/tnFh2Ei57eOLv/Ndw
 /XwqVWcGZSFOPPRcOtw==
X-Proofpoint-ORIG-GUID: jKddpJbPb7m3TrKIXmYJRtPAgxGT3iSc
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a292b0b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=NdOHzJ4ck5ORsDkasxEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112386-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5494D667C6E



On 6/10/2026 2:30 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 10:57, Ajay Kumar Nandam wrote:
>>> So why do we need __lpi_gpio_write()?
>>
>> Hi Krzysztof,
>>
>> Thanks, good point.
>>
>> I will respin with:
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
> 
> 
> And checkpatch.
> 
>>
>> About __lpi_gpio_write(): it is still needed for the in-callers path
>> where runtime PM is already held and we only need the raw MMIO helper.
>> The unused wrapper is lpi_gpio_write(), so this fix removes only that
>> dead function.
> 
> No. Why did you have to add __ prefix? Why do we need function named
> with such style?

Hi Krzysztof,

The __ prefix was introduced during refactoring to distinguish the raw 
MMIO helper from lpi_gpio_write(). After the wrapper became unused and 
was removed, the naming is less clear.

Do you recommend renaming these helpers to regular/raw names (without 
__) while keeping behavior unchanged?

Thanks,
Ajay


> 
> Best regards,
> Krzysztof


