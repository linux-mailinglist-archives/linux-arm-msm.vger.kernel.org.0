Return-Path: <linux-arm-msm+bounces-112392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IUENLVk0KWpcSQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:54:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FE666809C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:54:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bn0XCStl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=csxN7FDX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112392-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112392-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E6963094BB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1190B3E2ADA;
	Wed, 10 Jun 2026 09:49:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDB83E2750
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:49:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084969; cv=none; b=bPCn+E581M9uSvSpXF/WwMT3XawDQDLjhyvlNLn27O0Kq7IDstufW6KJJs2qkBpCjhPUV1x6ea0467lVGN2HFpsic4ORJzN8p70dAkxJtk+RTK7K4m8THfeybnXMKnetZ9wYU3ypl2xwc1ayE7QAGFBf3yDqUPuG7DfX9dgDONE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084969; c=relaxed/simple;
	bh=cZcO9Jt+ROwZmqDp2yCSr6jFzdd6xM23Mwa+iIRCkiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nt/9FSaKBUC9EGM+5JIrJ50HzLCKjEkGo/LQjZIf+7yCtZbT4AEHNC7nFzDQttiLfbPsr8tJC6vj6xgiM6EHjXdJvY1iSfxTIm/AWcHvD2CY2m2Qa8RFrLU6RkatBrfpI53jlbrDkYn4d8asO5Wy9tz1JiV1HfBl1fkPhDNxQ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn0XCStl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csxN7FDX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7htbX531342
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jC48BHG4q/pkdmu9tL4+H7RyB9xmymG8F1LR5os9RJQ=; b=bn0XCStl7MK0FEzs
	rnDlWwoQxxDMO/KCVI8AJoDLJQJaaUQCQq/NXTY42ZGljHXZTOC4J2z6+RZZWi+b
	TraHmuy65E8xQhrvARlp2qo0EIiRDySMynXyPP9kROVhJZZqIW780I2mWgZ3j4Mv
	Vf05VEEydVr6zuONvYZQp3XWy4HqWS0IBbjV4gAv7CYcTw3z65aGZI19OOxDqQwh
	B+xKx2NkKMZuziGOc8GW1FxtiAjB83iqIGewOCmrSCwNghY/mZz84pH55fLUeCLG
	qSU506PGCW7U3x/F6OkQid7xLUP5RthKnCGj1HyS30fvoKahf9hu5m0qgqyLiIUZ
	VdGaoQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1vqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:49:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f3e4728so4359595b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 02:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781084966; x=1781689766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jC48BHG4q/pkdmu9tL4+H7RyB9xmymG8F1LR5os9RJQ=;
        b=csxN7FDXReBVJHNUPa/oGY9h3Mq27VCzJLiKhOA1YGCZGXRBpgUrYlMY+VjmVxy722
         4gwhier6VH1QY0tQIev1CgRoNaInYfo/Cox6FPQYMpU8T3A2HWhUKyQLL2M4qVQxYsHx
         5LEwGLgXZhXKk6Ul0jKyVVlaMVjln9bawG8EkjCmMEpZE4e1oBy8WvrXRUwSoEF1iCEc
         K5DSh/6n77fnbBTfql/RjVIXOEw4TUnXGFj2NULhYTiSgWKlfY8ZHX/GbP4JlgZ1PluQ
         3AtqlV9CYNTEShAsJnA3AWRYVw7YaQinJGR4d45YnwQVFZgjoZXg73mUU2u8N5Dc/cLO
         gbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781084966; x=1781689766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jC48BHG4q/pkdmu9tL4+H7RyB9xmymG8F1LR5os9RJQ=;
        b=frKEX+RqTxRI3aTwIHFLCath5zq2hSSBgPI+3aIGivUFMbesgYKgT3zpr0RcUbDfP4
         NZwkgGLggOXkraCFg2jIum++uvapq1O9XXDp9YkYhiytSOOc74tc1VmPkY533bm0YPD1
         dRKuJqQtXz/FHtzFGx2riOpGXW88g08ljrFCnb8vayEXyQROAySwMrNjmtDpgJBeG8dO
         V6r1PDDA+aq1HdbGKZ4roOqBXlm+xrJ2QmckYlNeV+p8xp96FBs9vicY4Q8ob+iIqKc3
         ICKazKAfv4cWpH9h9OAz7a5eaMKvfZVkrZYUgqV9RI4myuuL8lmKUaFFCmrO8M5xwtVZ
         nzgQ==
X-Gm-Message-State: AOJu0YwffGwFa/Lb272hZKdRO8fL9KN7F2Tn06axVVaoIQD5H8FmhSj3
	yD5XSOUmpka7OF7SWtD0lUJHQx8DHZw8nBGSWVidyV6wa6ZWomNOOFpde/DFueBt2YZ+Dzi7+6p
	B85sdPTtmVWcPqPvsuWg2i7nZiY8tMOYuZJHYXxQwSjnak/U5FfPGV4CwXaFMhVvlFjZA
X-Gm-Gg: Acq92OE5oNhPLkpP8HrVY/mdID0Npx/WkPhYhQWrphBekxW5fecrbm3zk6DgypQsZ9g
	nw55CB6Pr+D1gKzc5BB11/i0bHrIui7MFfNW0uZbOBR2W5b2OFHGNJLLX+tDL30UECOoVZGv498
	KN6MTe8XYHUTAiom5R83TDsd7jFkw8xQgs+yrjabortcIkLtXzteWsI2z400IIMuMKhTmNQO3RF
	Q1YKQEtsi3oQmeD5gx6PP+TVrbEp3pUCrPGAqQhjadivWHz3asNeu/xU0D23E1s6vZcVUPcy0oE
	NSV308vaDELx9Ne4eq+hE1iVAjkaW8JrscsUOGhzYdWJFBYNykHeW46T/Xlyk+86CiqwwieSmDO
	TTwW5aTToeQM2tu15viLWjvlbmfXTAxYxmnv4lQHord7puq4wBQYGHYt0kzfXqR5v2Yaz+delOA
	Pd
X-Received: by 2002:a05:6a00:2305:b0:842:6155:45d0 with SMTP id d2e1a72fcca58-842b10d9659mr24913587b3a.43.1781084966393;
        Wed, 10 Jun 2026 02:49:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2305:b0:842:6155:45d0 with SMTP id d2e1a72fcca58-842b10d9659mr24913568b3a.43.1781084965977;
        Wed, 10 Jun 2026 02:49:25 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282220d1bsm25722217b3a.12.2026.06.10.02.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:49:25 -0700 (PDT)
Message-ID: <1df97802-0956-4d2b-97f1-0c1570d0c3d7@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:19:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
 <b7c5441c-de69-4a1b-9121-3d15bc24612e@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <b7c5441c-de69-4a1b-9121-3d15bc24612e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA5MyBTYWx0ZWRfXz3jJVLh750j1
 s6FcfTKJl5MBoYyog1KNYCsNgKDVdPK3X6Y/AoJNIQeFghovTlcz6jTqgGlLW1Afem/m8lwhYwc
 UcSpr5sYQv7e4zv+HmFbdHBovQ5Wv2qgExvBBXl/f1+R39v3yndXLhF2XNgU+P4ZRpWrB7b5FbI
 dwDF5zAfIeUtIEG+lQlsUb05fQygs06CtyU+XKfx0Ci5Ijaiqk6T9hTxY861B2PqfVam9WiUvi/
 2PWl+TOJvnveUiRnykGFaaWCHnBhnKM1TmyD9HsNplV/GypW1ckE7DAs6p5HC44g/wWhvsu7hlt
 EkDzmwNdolV2ze82vO2zwa6w/ljraGjDkTZ3fR0PQ00umuCLpgzVqEFtvnJy+U+aeOjb4sVGzhm
 3/ep3Lo5iMNAhwdTfuAMnnaYA5InWAzrDhxxQoCkPyxnnnI2ddpHqyXf6dls964NDbG9RFGNV/F
 tSf5FJXz/VbMp42xyhA==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a293327 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cPk82LopJyZTTbnMm5cA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: -YevF5THx4JES6udmeEQ6TGhhe7Q-Lp5
X-Proofpoint-GUID: -YevF5THx4JES6udmeEQ6TGhhe7Q-Lp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112392-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53FE666809C


On 6/9/2026 7:18 PM, Konrad Dybcio wrote:
> On 6/2/26 11:22 AM, Kathiravan Thirumoorthy wrote:
>> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
>> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
>> enabled on power up but that's not the case for IPQ9650 and we have to
>> enable those clocks explicitly to bring up the PHYs properly.
>>
>> As per the design team, REFGEN block provides the reference current.
>> Hence marked the regulator type as REGULATOR_CURRENT.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> I'm slightly confused. Is there no register programming needed?

Yeah, no programming is needed. Similar to Kodiak, PHYs in IPQ9650 does 
the HW votes. No SW vote is needed.

> Can we at least retrieve the running state in .is_enabled() by reading
> some value?

Based on the discussion with IP team, I can use the REFGEN_STATUS 
register. Let me update the is_enabled() to query this information.

>
> Konrad

