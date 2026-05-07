Return-Path: <linux-arm-msm+bounces-106502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCt/DTLg/Gn7UwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 20:55:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A2E4EDA9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 20:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39DE83031139
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 18:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E2A425CEE;
	Thu,  7 May 2026 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOX8tzJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGNcQoS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5113D3B8D5C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 18:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778180132; cv=none; b=R9ZS7GnRbgqFpBy4lJEd5LUW53zNWFzIzaODR7CDJ1P8mJpQtvjD2jxK8AM+P9SwcKmZHYc3zKBsZgZ8ht5xKV4qGg8kBZDoz+th6J3h/WwMuVdK35WwKQsQzU9xi6XxkGfDulwJK4vD8V2VeZOfUOVotI8T3H9JXlTvEv0pYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778180132; c=relaxed/simple;
	bh=5+QjIEY/JT86akbLno686o350DIhsf6rA/JkZCxpcDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgAJaneHfxAAYorzuSZFtNZ8ER6hrSxqheGYfkVaaH8QMttvJCM7sXK3QxzqZ9whtTUuFiNVrS9NbLqOQjEe8FOv23aKz4tQ3lodkhm0v3LODbtLcRp4BkNQxrULXmXMU7tTJI3ueNsaz9lDJhql4lhSTR2Z5IjGcMglBlkL4dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOX8tzJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGNcQoS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647GXBrZ026544
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 18:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+QjIEY/JT86akbLno686o350DIhsf6rA/JkZCxpcDI=; b=iOX8tzJfbuZOt0E7
	qaEzFnsgDoEx3v6oSI/3ple9JXi37sovrG5VnAb4y0W/KkiVdJqOxbEMbB0RA8BN
	7Uc6LeizaPCxok2Lee44M0SkEcXn8/JkDCLqxrCKRBmOxwrh3i3+7GKkSzqQAM2x
	k03fv1Uk/hReHvqsXXRPEyTC6G+o1G36faPYZ7oS6Xein86r8XG263vXlDfzqKtF
	Mpzz84LNAt2wfPeg28krmJGWjcHlGNCKhpiXMRrydHOx+5Ng0rEsHoNr2C645JOv
	+yJuxaoH002VBciCF7cn+cQ/ANdVjp8IX+TGsl9FBouTzxo1eB529zekeoJ2lfIV
	7iPYmA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t3gmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 18:55:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so2579344a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 11:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778180129; x=1778784929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+QjIEY/JT86akbLno686o350DIhsf6rA/JkZCxpcDI=;
        b=ZGNcQoS+QJaQ+9I6OvY24QK9M8ht6bi0KTmPCOqdP26Pl5RuxmO8a07sN7ogN7X0FV
         y5+ddCZES818ISGXTrhhCfhhwzWzLZQXjIvUDiqqrw/wuE2iMEE6tnT2+MexVwWr56YF
         v4jPCGfDd49ffWgF84sDlEf0FE+f9ev53e2LXvcPcvrKoaeAMpmTqvM9xGtkx2YYlK+P
         hRwAwZ2by2HhsAInkynz7dhDOcVxNWU3/X46ugyoM6pRgll8sj5AYabjoY48/i9H5TwH
         daDzUTMv0lo/ujtjFMeA9b6GG5kGjHWCFmes+xtdTSAIvvEVcBwJSF3/+TOoAJVssgps
         XO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778180129; x=1778784929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+QjIEY/JT86akbLno686o350DIhsf6rA/JkZCxpcDI=;
        b=VXFeILxHsJwAxz1Q0tx6+wVJsVGp70fSSNIRxksZ0pT4gMzcUPUXQYv6+V6wUIMBby
         j0jY63OtZ03lgyd1ecPX4aFqA9aME8LxEVHsSRh+cdDRUp8/CaJGUmZtZXdm//jEDWTc
         QNCXwAk0JgWIkd/42rDmH2F7D/9sAEgRZ4sluH1NkX4ixerqMsb+zq3n4FgqH5OiXoae
         DprkwoYgAYluxUmkOrFb1SSDcagvPpI+sSoSxqvotVjzxhUkPvAKRa8MoCV5KYD1byhd
         GI71MjDg9pmnfzrgajmUPIYkPfllOsKxVLy8tphO4RsBT7afIF2c1chERD0YVbSQcjdI
         zCjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iPPDhnzKwOyTCIOwfXq1OyzzEeomxmFQGrii8PNVhh2ygJnl6k6BfeR0SN2cbG3zF2nzYiACaefZDP/dC@vger.kernel.org
X-Gm-Message-State: AOJu0YxQs9IpPa27XYG9Z1JyXq/0Bk0HOUfaGXoXvxlgqlx1ef98Y0Y9
	4bVuz0h3epqiCGDSkMQSqDcKcVpJYABPUjGTc9mHYwClcBOuJjg+3RDrUJ0Z7LYG3DdT0OTTN6H
	UerNo1EuDEGpY8GLsM6+FFPzrSQj8Vt0oFWtE2H4RAaBPzApUJr5uEPSiv2ite4cf+/qG
X-Gm-Gg: Acq92OGE6EnjyIvTNNdiaIjEE1IwIGhgUhLRNWAiqX1eYQoMQbk4cbcujLwAEPdTDZr
	e+gpjiPKNNEaslarr540LCPfSb+WGQcM2iSfUVtNC1qfMC7qBO/cq/fUYPmVICNvX5TRLjoC+q0
	qpFsvWQE89IbdF3xSCAa8ByituN3X+nRh71UieuIrQ8gepxRfxWemwV7KI9jvcCwxjMyOou+yP0
	MngkqAXOIxrq5dcJ1wEGVpvWHEHFsxM/0ydstzg5jqGxOjrSXquWMswTdSKNODwRJv/DTvGFfDk
	+OwaEgkzzL1WAkrawGDqpQ39szcmOVViiJXV1+x+dlfdHFrt15U8iswYhjyyVf2zGPF2CyHim3x
	u0eTj5544Mq+aRvUSKhq+vPMeRDGr7crnq75GVh4I4dqxr/lDonY=
X-Received: by 2002:a17:90b:4a07:b0:366:102a:5754 with SMTP id 98e67ed59e1d1-366102a5edbmr3643911a91.15.1778180128682;
        Thu, 07 May 2026 11:55:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a07:b0:366:102a:5754 with SMTP id 98e67ed59e1d1-366102a5edbmr3643889a91.15.1778180128238;
        Thu, 07 May 2026 11:55:28 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.202.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-366478fb189sm140126a91.16.2026.05.07.11.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 11:55:27 -0700 (PDT)
Message-ID: <fd1503f8-52d4-43fd-9003-9eebcc475827@oss.qualcomm.com>
Date: Fri, 8 May 2026 00:25:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add Shikra compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com>
 <20260504-ingenious-bison-of-defense-5e16ba@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260504-ingenious-bison-of-defense-5e16ba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fce022 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=GlSZ2Rd4KtbczYCFEJIQVA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=R2oHQpLJbn4m8KOwb_wA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: M9InDNraVGW-KYWGXdVCXWA0B4NqileI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE5MSBTYWx0ZWRfX+FLm8s9CUJsL
 YDsxMaSP4DYimp6wuoiKxD0eBQFbJTXZlgtbXejq4mFQ4JdwOpFgZXebw0zDPB737WI52G9AvIf
 q3q3pvLKHZy/GeWPLgsVUpcquZtTcbVf5KVaYJDLXI/6k8Dph8AynYfY1j/hs0mLkzyEzdH1DT3
 sj0IuvTQTgbZxC8m7KL4k4HjSZdaXbZhtHrLWGM5Db9YO9C6hNhyswNAHu3AdYNSH96A/Zm/BLI
 zEgu+5cPTEjattGn8N3qdkMgtd4twQJSJn0DFI0DDvctewHlYRsnwxVnUoiO4jrtsnd0PxAfAIg
 ROyjYyhJBg+8LZMVYsfWO8kejJE1kC+kMc5z8fy6FlBOLDYdvZaI+sASuOfnCz/UJGNBF+ceVaA
 ++WQf6NZj7X3kOuHYelv9al8ccPua5SyysIgJc5eTy0QyNYO3woPvcpKAc36E3A1yKuk4cAUzG2
 K4ShWfUBG92EOoECAGg==
X-Proofpoint-GUID: M9InDNraVGW-KYWGXdVCXWA0B4NqileI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070191
X-Rspamd-Queue-Id: 76A2E4EDA9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106502-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/4/2026 4:36 PM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 11:40:59PM +0530, Komal Bajaj wrote:
>> Document compatible string for the QFPROM on Shikra platform.
> subject prefix - it is "qcom,qfprom"
>
> Here as well: s/Shikra platform/Qualcomm Shikra SoC/

Will update in next version.

Thanks
Komal

>
> Best regards,
> Krzysztof
>


