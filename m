Return-Path: <linux-arm-msm+bounces-96214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEJ9DgOqrmknHgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:07:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8271237924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7916B301D314
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27DB392C37;
	Mon,  9 Mar 2026 11:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQJW7LQS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDt0pziY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB294364056
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054220; cv=none; b=daJCM5T45eO0WxB4o4aU0nbnXrHiDUciT4da0CfV4zUsanq6lSTX1h9hTdUXyfqT7ixqLscOiZavAr3dhQ+jSvZRI8cP3zIirNKwGWAUe2e1dGvHf3O8EDxzj1g8sneYy+KU9dW5c7ncY2P6HROldqNlK7GZMe2RMRR4WssWf3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054220; c=relaxed/simple;
	bh=EuQ7rLFm1pHjsJy53Eckwc262TRCnigUfkw+55Bk44A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3sGakpRmDqVIEiGEzkKMjZxrFr3J4HQ1IR0hIFAfn5VdydOQF+GRB110+V4EnkISBh2IuNgW+9PUFQXua6ZJ3Kzs7xHG1Wb42vLCalOV3gJaeZU/t22SEjCWswFQ7Prijq3Q1ZEpRkRhzrN1cAJsJFDF7kdMcpEbQAkz3zGnPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQJW7LQS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDt0pziY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297na0A1932586
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QpZ9uUHke6oG3ljULA0VxJeUKMY0ominGdgJW9LZPDU=; b=AQJW7LQS2F7fDr+J
	spZ7K2Sk5zNcz/ElMw5E4pxOhF8eZcWNypoE3pVPuI4OGbyeQ6n2hf+8oEVycuxy
	FkD0RiY2UK9soQSIXoQUD90Owjc2IEb+ViyHprCXsjN/I0iyz3ZRGQLyloW6Tnfy
	inLnLxLPuAvEGWTaYb0KCIY93FCe3yiSkjMro4EvklINsc9Gtd/fLwuijHjPAQ9h
	KSIZzoi0aiK+OgKx1oDezUdFb4cA+erhP0l0ewij+IgV0SDfCEC9vxwMYeAJGB+k
	270RHo0WWxcvrCLukDxXc3+nGeBmty+VvtpS55bhlpNwXxtaWdh+edrBuoDIglx0
	yaXkKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9cx49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:03:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7604c6a8so141645685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054218; x=1773659018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QpZ9uUHke6oG3ljULA0VxJeUKMY0ominGdgJW9LZPDU=;
        b=FDt0pziYgEqcmqQVvY8RYuw5z5i1VFwbzczFfZmDb1WY8ULY7N8r+7rmIUtpNvMYxP
         9c1qpAVKXNRUxCM+gWakrdO3HuqDpeuYICFO3p3sid9ybl3GQu5PUs2DyNTPhCfMBqKr
         u+qL9af97N8NZMhOsEeKLvYzsl9kQb4WNYUHX7oXjkh1gXT7QjtSz6BPFwfFADL+gbIU
         ZUXpWN0Ju/3P9vM5GLBe4xoKhZ0X3yXP2IBRbssniqXX0J+e21hzufhpAvUpeDqPxgt5
         i/MiiNBn43oxzm3SdUEEsnTJGBRn5r53DYdiya6XSSEfqgHnUKvHrp8lXq64V7g2N4P2
         ELkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054218; x=1773659018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpZ9uUHke6oG3ljULA0VxJeUKMY0ominGdgJW9LZPDU=;
        b=ejqMGO+TECTCftqMNU7pOHgLaDE1t+3KGpGLYVQjYvGpDXln0Z4il4V/fNgg0cqI14
         45oucuIzBx2LcKYtWvZBdHG9KEB0tZCuFa9kpycdBHOOw3KS1KzyaYLQljc3dT+cVkxZ
         LQf3Sk2pg9mEuBkERYZazNREtN5cfpU9FQrD2kOlmInYzyjz9xJzbYDj8ZtXhoW/iy52
         Kxycv04TgU9+gSjlM4MHMFq5OiHWbhyt4q0HxrpaUkOeS1Wo4OqPGzUqcDvbvx4Lq8us
         t/2H2UAeQihxHWga31gmmv2W9zFjiofL6b/ex4Z8i4eyLTTSomc1+Eeq+wk4BKfrqy+U
         Gr9w==
X-Forwarded-Encrypted: i=1; AJvYcCWbTD7V4zE39v7zkjBfBruypNobRgZ9X041NX8Lm5dYc+B1OZ3cb07ggnxNbLZbt+LdF6PmgJ0dpVStvJbF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0HJKKpfysLHloELznHjkuL9nEOG0LWeXif1dDOSVaXJM3QAF
	pPUJKt/vaXpefBh/pyfDd3rNvHjRpzs5kx0D3lP+lVjIR5u/huKjis4aJ1eDFXMN3o7vBk5L0Ux
	mDPIbdKS+YAKVysasXBo69Inwq2AOjwDa0H0EzEGdhwSUxzOTzj0u16XVSqkq9uYB3dkT
X-Gm-Gg: ATEYQzxMc1PWfotBjfDxCQu9wDhko8JlBGttDxOOaDbLmTqtBs38I2WU05j4Swhldt3
	Xeb7K/6EXv1lK239Yd41aiveQy5fwzuQLGQk2p02sfazOBEHFY1fnzajcBJsJdt2ITcj+V0bm8k
	8vr0DlgZ27ba444cS3J4arR4E4DILo+l+2jR1e/VZXcsEMwORDDU0M2Q/4GHh00h7z25PIcmw/D
	aeiF/6OnnQXSjZk51BXCbOlguQTPhAv6pTntdZGSeyEdtTIlXKGrJMHVHmS6E0yjrqSUCi9ZEJC
	m70iyr3lhSxo2Y5w+IfAtCTJ5emOMwaV/ihGiV4wO7SfdlkJQHcsMouxKgC9Z/dWBr3YCkbGOoC
	xza+Q4Yw3l1TjCGdRwQ7QuX21VV/gAchNRhUTyqNbge4bvu/dkls5A5kvXc4jR5fErNd5OHmlQF
	ULHts=
X-Received: by 2002:a05:620a:1a17:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cd6d43bc63mr1082911185a.6.1773054218099;
        Mon, 09 Mar 2026 04:03:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cd6d43bc63mr1082906285a.6.1773054217500;
        Mon, 09 Mar 2026 04:03:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f15d51fsm356174666b.53.2026.03.09.04.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:03:36 -0700 (PDT)
Message-ID: <a6d052fd-c704-48ca-b267-b594a5c4c886@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:03:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add label for reserved-memory
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308-sm8250-reserved-mem-v1-1-889eca3c11ca@pm.me>
 <2b260d55-71cd-442f-bf9f-a9771a2765c7@kernel.org>
 <yyLvPClplHmyd72RJgOMXVLx_z6GT8sDZP8FyzlHMV7MrCm26twtNmxebCmLwusqGABJQTrIIAe-AAwAW3uaIQ8Rw5TId1C4v5reyj71nmU=@pm.me>
 <cifklloa2hp6yt7o6kphjydq2mkpqs23avyqa22tsrf5xjsw6v@cgkvft5nossn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cifklloa2hp6yt7o6kphjydq2mkpqs23avyqa22tsrf5xjsw6v@cgkvft5nossn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX3X4uGJCx2QKj
 j0jyHKMRLzixwfG5e/qgP9r9k59HHLh4QwM0QHEDuNotGD9OlbEERu+gQdOZxq44JshrZxDEA8/
 kTFqIHQ1Bn3DoGhlZz1thsgePp0ZdsfJKg1PabQ3tVFinQMBIAM0oNhxWtjmhg52Q/6/CVbwKlz
 ruYEKUxr7/Jq30bxAUS2uYA5QnwsIDgzVXU0Q/gasbitqcEXZPEViXShzeWW7qcz6bCh3Dan4Cx
 leVBY+GbJB4HLLQtCDxJB5XxkeWe7hqr69dITsr/z8OsgUhj9hKRW3tFaQGhqxJYfcm8pHgITPX
 WFV/yDQoU8dssaFDX4YJ/dPSLhAddGRr8wOkEMZKjqNUj6snTxERPNQ/0rMJ/oL/EiuaFROimry
 fLobo0aGD9m1VZTupDRzZEHOhcCqIo3TJo4xG+SZVRlRbR8WJe5JpyJdmyAj8nS6Q47gm4/endI
 5oHL49AsgHQuaSzInWA==
X-Proofpoint-ORIG-GUID: C834x2Jbbaq1L1ZMt-wUCz6XWf1C4Dtt
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69aea90b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=B5je23aCEaFopmEHpYgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: C834x2Jbbaq1L1ZMt-wUCz6XWf1C4Dtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102
X-Rspamd-Queue-Id: D8271237924
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96214-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.979];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/8/26 3:59 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 08, 2026 at 11:52:07AM +0000, Alexander Koskovich wrote:
>> On Sunday, March 8th, 2026 at 4:46 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>>> There is no user for this, so change is pointless. labels do not exist
>>> in DTBs, so drop the entire patch or provide here - in the same commit -
>>> proper user.
>>
>> Want to submit the ROG 3 in a follow up change but was trying to get
>> all dependencies for it merged beforehand.
>>
>> Should I just upload the devicetree and link to relevant patches?
> 
> It might be eaiser to submit DT with all DT dependencies in a single
> series. Then the reviewers can see the reasons for your changes
> and provide a more complete review.

Such oneliners, I wouldn't even bother putting in a separate commit

Konrad

