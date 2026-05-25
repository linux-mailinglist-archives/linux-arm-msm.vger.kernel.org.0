Return-Path: <linux-arm-msm+bounces-109549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CET7HGHbE2oMGwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:17:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A75C5D64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FC503008518
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 05:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F0533FE26;
	Mon, 25 May 2026 05:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsB0i+7n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKhdZiZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7D33D6C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779686238; cv=none; b=V+tUSQtBexa2WkY+KqB3P6DfmAeBZmmvYeGVf2S/bEFsUbFpvNWAIXVpnOju/RH3j4JQqQVp5OTiFmlyKPxdTU2Ft9FxelDm2DE4l5cPQkEzIRej8qzy8ur5NzDv0h1fvyBB86sMGnESAA03XUNdlTHeqlCBhknW2RF7HbpxWA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779686238; c=relaxed/simple;
	bh=TT6fb9wRcDaVAgi9x7/XP+aN+zqiMMogNcrum5LKYb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpnALrl1eybaoPm6BrA3bLSJUZRS7F6FfzZw8ALinvRl6vs0nooU3bOgBM9l7DXmkSZPnpgiz6Z7X0ugpGhSvhoa9cpY34RhvanTliYx4sVOcjItDgEAN4j3qgIK4AizXs50j1nQ5P8qOo3bXY1awRoaZExCXYWK23JlBovqBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsB0i+7n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKhdZiZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ONmrgG2244701
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GTcW/jqS+R1fyGppCmwLUjOiRqL28+oajKP5jUq4DXs=; b=hsB0i+7ncjNC8A9z
	LEh2SHbdGGWAJAdPz3eLH0iKrQVFvqfnwU4EG0phGfFvZQnjLV1CeylJ1k1L0wyk
	HlR2ZWonSkI9ROc5fweo/RcX7qNMG5lKZY5hszBcstTklbFQMWE5dQCS4uQ2Up+k
	lZkKt98Qy20iUQyLVFL6gzFYdmSWy4ornVUd91Bz/hWyDpFYUBfnO3eYyTUO/6Ys
	6cvw7rKTPK2t66D+6QdL5CoxTkKC/blrvLY1p0JY6ru4HRgVL5Ur4bbpYZ2stmhB
	Yc8DGG3Z2MHqMIqC8RBxVSCZ+H36F8KBR14eEShzOGhcfnsz733FOiefuryd9b09
	kf7pBA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7n0b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:17:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366344513a3so19090291a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 22:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779686234; x=1780291034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTcW/jqS+R1fyGppCmwLUjOiRqL28+oajKP5jUq4DXs=;
        b=dKhdZiZJB7v6y1Mv+jXSa0RCILUx6iNylOWB1JBC50c55WSBt1kHI/sxBPA4n7+h+V
         az0n1xQX33g7f3PoA1mUq3RJuGTgJDX3mqdEsk6D3K+fbRPBx69/cLfbAT52d7oMxtW4
         5iIp4GpX03IQvRxH0oxBZsHyVw1NJZCLHXFXq4aMGXEbq0U/ulQcMEy0qZESi+mdHjQD
         +1ny9sW5d9VUS2q4PsPieztUCD9wdNbDhwVO5CrY0dTP9KJk0irnu+ybdF7efIDWneUx
         WFk+Pi5Q7EzYV8c9CHD0XOZcWQ5zpMDcjqSXsKUq3V956niCwcmvlWlqo12BqN80N9WB
         XTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779686234; x=1780291034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTcW/jqS+R1fyGppCmwLUjOiRqL28+oajKP5jUq4DXs=;
        b=splabyEKowi0upELXj188NyAziNg3sHun9Km7+FcgvUI+TbX28AfRT5xs74fXgK7N5
         RwgKdzqWbQaMp7DEyXVrBJU81m1sKr8iKFzLfFyglAMMeBffM0pQ+f6eCO+VtOQ8ZpSg
         GUoiv98xHU3qKGsKOwUDFcVAfz5OLAyenaKMMALizY3xzLjMSpYQced8G5I6f17Ve7mY
         2syPbWVUtmYOPeJyMpM+o0G0BInGwg4+8fA0bS/K+xACvZDq54ez5Xk+EvHlTJjkkrNJ
         gqRR8BDi1scaJSMksjnZZMZZt6b7lV33B18gFLRRIVihi6wX5pCtwrmRHPM4JYEnJ09/
         jIJw==
X-Forwarded-Encrypted: i=1; AFNElJ9FL0Ckzg1AIEhek9L97DcRmnpDCBL3fJSvkjfk9P2wmpIvQHhG3+wCkFumR1r2DIDe2iyHJ38tQHVyVM6/@vger.kernel.org
X-Gm-Message-State: AOJu0YyFf+bHUobTryZgEMWcCu0UFutCSa+W3y55o02GEamJmB4q/6eR
	D8RvMwt1nUb4nRqLkDB+Br/5vc9sfaI05hi6apelHIZRmu47Ra24CBSYQ6Vwy22Z++2WLLcfyqg
	xyYC98Zq9rqkXIPWUqDUbVYWDnOWCEWtXUI8H1GU2LJbrS7+YodHFVkGP+6yW/FSkLmqw
X-Gm-Gg: Acq92OGn+Ny/rE96R+UdvOOTV6b959lqJ+XpRCd7HnckdXM34D/ehBVpGOYwLS7tgoV
	ALgFizHgW9uvZvo7Z05vYSM71szncUQX/pqWg7e60+7mFBug9dMkdDfbe2ouurNvqe04/YbUhvY
	+W6xxHbszvb8twQ+Sp4Bu4zmw79CyT+jFPtIJzG/VhWkUB8Dull1M4jeEMUf66RIkUW6VK1HGo3
	Z7yL8X4yUEl9VQmJO0VYzkqGBhVm8Ghl3mWl1QwVNeWSwr8beLF7WGifCtYC52CxwKOxLV43m3l
	4RPO+pxYzxrmUEo+d1WYBeWIoAUPVj4SXbi9qivaRBPuybVQV3NIMMaF16YRxizNkrbBSTG6XfD
	1NnflUMUrLSwt/+ZXyLAw295HKL7Ix9v7PNQbgjQFrp5N2flKVD1iIQ==
X-Received: by 2002:a17:90b:1d8c:b0:366:33a6:9921 with SMTP id 98e67ed59e1d1-36a67422decmr12178434a91.4.1779686233692;
        Sun, 24 May 2026 22:17:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1d8c:b0:366:33a6:9921 with SMTP id 98e67ed59e1d1-36a67422decmr12178413a91.4.1779686233253;
        Sun, 24 May 2026 22:17:13 -0700 (PDT)
Received: from [10.92.183.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852057f9cdsm6963798a12.32.2026.05.24.22.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 22:17:12 -0700 (PDT)
Message-ID: <22a52e0b-849e-485b-ac6c-ae55c2b75be7@oss.qualcomm.com>
Date: Mon, 25 May 2026 10:47:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Add trace events for Qualcomm GENI
 SPI driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260518-add-tracepoints-for-qcom-geni-spi-v3-0-7928f6810a79@oss.qualcomm.com>
 <20260518-add-tracepoints-for-qcom-geni-spi-v3-2-7928f6810a79@oss.qualcomm.com>
 <12d8da90-f092-449f-af6b-14b9dd851f1e@oss.qualcomm.com>
 <5c59952f-72c5-4aee-a1a6-4b11b0a542c3@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <5c59952f-72c5-4aee-a1a6-4b11b0a542c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FPKT3bP1oH4rtPSxsFP_BSX-HLzvJr5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA1MCBTYWx0ZWRfX7wfIQQJa6NVo
 PnYl9eNB/6J5Id1/LRUrysfT7ZwOOD36cqm0egnHRQrzFjJYLYZvNYHSos8BxfAwZP6AkhEW2Ph
 lSqFZkFIa0G+6lRACgChO8+u4kTBBiDIabPEOcK9byi67/pO5A2WvV3Nfr67/wDAnDVEkeJ0EQV
 nF/JKObbV6WcMFfx4I4JowlnPZCtL1L0SMC2d3vv/gDNYkUvsFpyO787hygAwW1dXFlKc5WiBy5
 hIDG1lgBllOp7A7lnXka/DOhKEt154Bx/IwtHMn+oTgxM6nTOj8CsQA+TixtlMBEuNh3hhIcsA6
 x+OjOVV7kLAybRRwCOISRRO3DNhfYABbILvX0XGbEYxCCRE5gWbPEdGvmE2PRoUzZ9RAu9RAkj7
 OxOJRvAtcvTYd0zHRpXN9RZkwkFylnHgBa/7WxYCDmjD8lF2awdTi4bGFJmNH3Tgdj74csopMTr
 H42qOb/AnbPVnoxfsXQ==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a13db5a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=v0BZMRiMjL-9nwr9ESwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: FPKT3bP1oH4rtPSxsFP_BSX-HLzvJr5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250050
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109549-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E59A75C5D64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/2026 5:04 PM, Konrad Dybcio wrote:
> On 5/19/26 12:59 PM, Mukesh Savaliya wrote:
>> Hi Praveen, one question below.
>>
>> On 5/18/2026 10:30 PM, Praveen Talari wrote:
>>> Add tracepoints to the Qualcomm GENI (Generic Interface) SPI driver.
>>> These trace events enable runtime debugging and performance analysis
>>> of SPI operations.
>>>
>>> The trace events capture SPI clock configuration, setup parameters,
>>> transfer details, interrupt status.
>> Don't you need trace logs around PM operations ? ie. runtime and system PM ?
> 
> The PM core provides a couple, are those enough?
> 
Understood, should be enough. Thanks !
> Konrad


