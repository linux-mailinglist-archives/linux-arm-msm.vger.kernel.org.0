Return-Path: <linux-arm-msm+bounces-106611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH2YEJmv/WmlhgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:40:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E27254F4572
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88B87301B917
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4363BFE52;
	Fri,  8 May 2026 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKk+A1v1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcl7TWoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916B037F731
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233231; cv=none; b=I39fWkZfOt54lPkQn0zhllkVfXh13hO6qEHlRpuNmo7U53K9UTWRnL9OwcBHcAxPuWERPbbrDXt9iMVz1wHBkZNTgQw8DtwGckXPkiwjUX0URKtUoUJMrW1jr6SK+x2WezgdnBLwh8TbQIopgj4JeVqfzwmekIXEsArbjymngM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233231; c=relaxed/simple;
	bh=6wxh8fSQFI80rLYFwJh6ZDJSp19qUtscbdqGmjLg5Vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kr4u785t6mIz2BWjYlF6ZGqXH5Tioi5qq4xL/yRzEh17NbilIqEn3GL2jAL36FVYbz4ToPeQm4iTQMyyBKbIaltPcmtPl0rhwqNlWEt+0ArjLFk4YItOQgYGmPZuKIT+V4soLhbaRamMZe+BPnM5TqwRhs7j1J+A7eMdpLbJ02c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKk+A1v1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcl7TWoa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485t9NF2778601
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Haa+x7aBWIAWljkEX5SY4LOW2I/ywkYuwwubKZcWFAE=; b=GKk+A1v1hKZvNfDE
	deP/20D7/n7F8U+0wfpkbaK1qP4wXFcEYwQUZy7LwaaYjoGyvrsS6Zfcp7+8xfV9
	XUajEXeGRuFQmI9qHaBavdZduichZDv8KLgQBezgmDwMrwMIPMASqpei6DlBaX/a
	xUaK73HSJN0fa2o/fFSFv+vi3JvdohLvE2aHVhmdpibUR5oVWDCPKNGMvN2CizRN
	hWkWIYr+AdG7w1HsHRMIJjmpkisTGZ0iuJA2tlbhb8PctuiKjcujKS0x4XMWEqnu
	1if1a66JB1IS14jZnbBrdwm9yVn3H0k69GhpmVeEXTsY4Z4Cba/L0M0fJ9/SW4tR
	mNWwyA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285je8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:40:28 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5751eff95d6so183423e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233228; x=1778838028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Haa+x7aBWIAWljkEX5SY4LOW2I/ywkYuwwubKZcWFAE=;
        b=fcl7TWoa8W8q13j7HJkQJvIDft0A6nAaED1bIz7lwPfGioPUk/gLOckYyJCaHUlj5I
         b4MgOvMhOjc8XKD0nlslkGUydeyrHB8v5PUZb2CWoM+tSSh56KTAKFbrkVrSpapkqmP4
         mkpfFX0XnQmbXcQXv4oi9XLG/6pz+jX/HLQB5aiplTcgtC2V3GBZilObMXik+q/DCMYS
         zNUMDsSrKslaJq19DPnFKt9XmYl6LnzHo7ZzFf++zB0iS/G0X+DsXIO/kXwVRyuHuYvc
         JSltOKwy3QhTkxKwgVTiY5uc5mQ0olIFwjb5LurbHPTlY52geMPxbBbLnzUuWHKO+RYH
         B8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233228; x=1778838028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Haa+x7aBWIAWljkEX5SY4LOW2I/ywkYuwwubKZcWFAE=;
        b=IGK4O8zXKdvK+2XVQ5oW2/V/fCgEkUMJENFJnbhVFKUwpiALEmvsyDUf+THKkBQM2a
         43/vkZaWViQzpllKHtyxJAHlhkOGX/O0QjEMhvNIJhyrGFLeCae+bxKg8B3EDDrKcTnP
         TfDvZp0oPj1FnyVtBxw35sS9pd750G4UJrG5DuyBy9KhzcvOfQf0wd4KkfOUmUbcYgxA
         pu+dUjH0Yv0xemxlnZ+X05pc0bV7xh8V4SdqKOPdB3xZyNapRRuImT1i2XFh5SrLWG+z
         6odOznGBF23ix0xQ5C3jJI3eRIevID3Nhdd1AbHKUcYM2MBP5flxS2yqMIP1N3o911nV
         4O6A==
X-Forwarded-Encrypted: i=1; AFNElJ/+/mx6vEdHqWzniE1iwfDNW6mKES0JIRYY6tnWIYfR7WyOU9qHhAyDytSqO3e2QjBHMQw0eFsjtS02LWyX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyglq3YDa1wI5bMVMzyzE6V9k1rzyPcZ8mv9JZ0i/IZh9UIkQVw
	G+BuSWIErM6HbdUBnxHMapYC6PGqGa/AxG9WHlN8+vgZLEg7nhGAL84aFsYbxJ+ILnTbJ8tUqUj
	8HZCT6jN21bNrhQq9tBk7euMtIQqZAE8AzWq+Fwld63IJqqMV54nWsAoxzaXIP0rdQfqt
X-Gm-Gg: Acq92OH9ZfBOo88vS7pAly2jA4khq0P3txTtNLXpj2GTebR5o9tP/HcaUPtXGLQ44Dc
	ozjjcuxr5L1eblcel8jYyzX5XN//ZlThNZtsLF+lD8d99RCbMATludbpzxXrhHHbi7dDwYFqMWB
	mLnHJzjX6WeAFTjYNbisoWQwybORnectik9TsKVK7a1ac4O2dOC7JE6O1t9bjGn7mvdquHtc1mg
	1Ue94skj5TQU5pHETMHYRC860OLMvdTvux8xjlFqm8RwS+Q7BPSOu46pc1PEAGouiPq13eZsyyz
	IDbxCwnoND1iIZWfNe47v2AiZBUBzGQFFgAiItOsOpm8HljJESBuAxDRasPjGYJtpIBbf+1dUys
	krMzp51NwKUBrJwTY7QLX+2XrF3ULtuC9f4aGyjXb6AKPfQLPWNQgCbTp48aVhkmp17PKfGClGV
	21Pes=
X-Received: by 2002:a05:6123:5db:10b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5755b2afe01mr2010412e0c.1.1778233227905;
        Fri, 08 May 2026 02:40:27 -0700 (PDT)
X-Received: by 2002:a05:6123:5db:10b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5755b2afe01mr2010405e0c.1.1778233227483;
        Fri, 08 May 2026 02:40:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcaec604eeasm46209166b.19.2026.05.08.02.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:40:26 -0700 (PDT)
Message-ID: <37b80f4b-4824-4e03-b129-b0687a6b9023@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:40:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add missing
 qcom,non-secure-domain property
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-non-secure-domain-v1-1-b6f75783c831@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-non-secure-domain-v1-1-b6f75783c831@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5NyBTYWx0ZWRfXyWAjP5m6JIgr
 26XHBp0ciFCQolmXqZkc0o3hckEO7TpI36OWNDsAyZiQEDgnmQKlVLekCnObWOI7HuZQ7/CJ8hy
 z52wDpyNiBHff1k5W7FR5U4n6zf4rzjBID39OvTWL0Oc+Tm1Hh+kYeY7oHJ+EBCdpwhlXKn75fT
 QwGJvhGoOYCyxxeeJxP6WSvQeD3ofVsfMN5Ics9Pe/MKwNU4L/RjZ+FfROvJK5bbBCYicY1pnNC
 XVaYOOQ+9r7RTvTWHSr/jCz9ffYeO3RaV/KQKVKB1TneD9te6DckiWYdAioN9ukTbkcXhrIKMaS
 7Gbu6w0IAxev+0BkWUUkTLNgogihLCb8NOuL6nr+nav/vbDFkV2uTn67lgRBqBCE4/pIie2wfF8
 88evKhZj68jMrZBtF4WdfX5D005WUoHYK7littz5bwUT6OC8snASf1NDWaz5OJ+jbF+mOM/F5P8
 zHKzfOdIax3QfY8pwvg==
X-Proofpoint-GUID: nyXP5OBgQ7j6Y4_FKhSaUZjx9N24-_74
X-Proofpoint-ORIG-GUID: nyXP5OBgQ7j6Y4_FKhSaUZjx9N24-_74
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fdaf8c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ksxQWNrZAAAA:8 a=wEf6Jh-Ad-LoDXXZAvkA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080097
X-Rspamd-Queue-Id: E27254F4572
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106611-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 4:54 PM, Xilin Wu wrote:
> By default the DSP domains are secure, add the missing
> qcom,non-secure-domain property to mark them as non-secure.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

The CDSP accepts both secure and non-secure code and the driver creates
both "endpoints" regardless of this property

Konrad

