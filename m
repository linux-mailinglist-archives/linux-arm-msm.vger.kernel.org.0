Return-Path: <linux-arm-msm+bounces-118342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g2IfKi4zUWq1AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:00:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8AD73D271
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:00:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XRmIuuJ9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CUuhcVhh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118342-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118342-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD2443010637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0096379C2C;
	Fri, 10 Jul 2026 18:00:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B20B37A4BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:00:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706410; cv=none; b=eqBlI4W6zbnzUDH2Kl8+GYceq8dojlixlBYIjEqYvO7gvrH/R9jEy3tdScjNzI5Mtf12lLiqiB/X51uAWvwMxnM1BsWxLTKEmzhMM/RRnzR0uEB9wFMJfcGFi1by5W97C1pr9GEYnNUlXH2RK4GJx4JeDqPqyugpnCY/B1wK25E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706410; c=relaxed/simple;
	bh=xHKfaYtwUIkx3shdtSvDnmtCH//+t6oNn2Cl7jEfUR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jq2FVL8x7i9ZA/wX8bg6m9F/IifqgSMJLdfK6WCfdKiSw+01xIDKnNFsDjdAzlu18jnp3AwY82TfzaoYya0OgAQ6ShTt9jIHoIQ3Adi76pU/81S2WOxokrVsXEVTeVfq2cpSsdQKB+Oukprr4finlWGBkYRup3n4r5H6qQps21w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRmIuuJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUuhcVhh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH46uZ1453594
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sp7gCHgdcpX+eKY+k/SBZCoX5ANHXz2bcvfFyVk4fWg=; b=XRmIuuJ9POsh21CD
	6GDcyNx0bP4OA7lDgs2mBClMNmdpbr72UQ1Qm6QGoHwn95dZhVq4WUMa+JMdUdsk
	iwQQmYkp3EmUsp3pLILqSL/D3EC0dA0gXEeiQEf/4kTXBf3OTwDJfjVU0JltWjfD
	LUZkC2wfl+laMGj4RQC2Gy7QJNI35llla5dYw8K/kz9wvBjXLW6NcbaXR5gU2ZYh
	xH0qG5Xtyu4hUrBvbvqunQpJ1taPts3gMN3ZIEGGuBXxHsoyEACVzgUDncalpd40
	8pELUy83FN4twPlFAVGAvjgnFKIiRmqQGh0tAjR7/MKImwv5lSpwJGAfCBetvqfy
	T2O07g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xn0dp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:00:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso15545795ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783706408; x=1784311208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sp7gCHgdcpX+eKY+k/SBZCoX5ANHXz2bcvfFyVk4fWg=;
        b=CUuhcVhhD/14b6GyUrSWmhPhK7Ssz7v3P0CHxCGitxZfoO/Nm/yodpvCCxQuvEtSjR
         KtPw5IutAUkdKp+dUhUNGx2fjEN8ev2v2DzUhrNoM58kLVQ3NXsWqyGlGXXIJD6sF/j+
         5YyAD8RTzqnXGcnTm+58ySEsYBlc1TyIZm5y4zXYEiQHd/bHFFCxYObccjUuh/NLj5GM
         TdXJOfuNOGn+lbNPkojcaJyw0wtero3Zeq9Gfgup3vvA+gola5t5DLFlLq3onVV+qLZJ
         L6jZxEOsLocQ1eeUgToBPueL860jk8WQROY71jsBWOA5p4aoOrWYPe70CnFGJgjChz2S
         esng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783706408; x=1784311208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sp7gCHgdcpX+eKY+k/SBZCoX5ANHXz2bcvfFyVk4fWg=;
        b=SeE+Jv53RuPNXWYdm/J3bgwaPfaULBkuE9EP+OK+qPgx3WULGNQcZhxT/2KmHgxGUY
         8NasrUSSUV4QI9QvKVoHp0iwPqCGUZSJ41KpZpw2PlxjEKP9xa0mouggMf2e/ZxQ3DYE
         IOFKmtDJbzptsh6cFE2uL+9PsgI/glMg9R5a8JfgtEc2F9Wobi9Ymt1TfS0elHoZON3P
         eISRtwhKzsQ0zPRVLr0lOEIf6zARpa1NCnt+Ui6fUgJ3V8XkO46ZgNUfVsR/ILZt4cbX
         45ipoXao++qOY69ijZfJt93hnwwh9iFRB4EStUUGZZ3ap1oaWrTe30en4Ni+xItA8ULJ
         H3bQ==
X-Forwarded-Encrypted: i=1; AHgh+Roul0dORhkxW1i/I6O52CLTLXAkxljQh9BBcFXSqq+9FybXH2Jsu7+p36cNCEHG5FnMvGQ9nZCQBG9fcvKc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2GrpmLWH+ToghJ6SxZ7K+Ra3GYLMo+/B14RuYE/pgzYMmUEZM
	yoGesehvIUUChH2Pezw4UGtLYJd36JTDlmWumXh5EueaWHMjDKW7GwLJvyJfml1oakLQGQtcPEB
	2S/XKM/b72mGHTOIdTtOXHYG1RxxuJLTLEeh7bnzf43iYhTMoFNV7yYdizOPEBmhgxq9N
X-Gm-Gg: AfdE7ckU9kfukflK9Yi2vlecMMjm5DvJLdUuj+3XGKDo/dkd6RaFKqdeEBv2CJqFr2U
	JJH7boobkpCE/NmNnRyYjktoC2pbT1m6B6PPtdBvWEoeQkCivymKR64O6u/tJADivG4aQDY5qPS
	WpFvXMZPVDXgkW2Xax3K4aHB1Dyx4qg6U0wISC/UlwsktDZolORpHg3oTROTGM2+MOlxef5D1Q1
	67TZfc4Rcq5ZKv3eYqszFLwm8eR47Oa/VVwOc0ZtBVeA5j+K+KgWo0e2Elh1QtLQy43uOaw/1mu
	G8PJLtf54ZtF2iBLLRu6gNZfKZKce/vLIjPADMwx1IZyd7nnAAHTp1yRwS7uGHtv2v8tDwsTd9K
	1UDKjpe58e8NoxxnRW9KIOedtgGnw1iMlCRo4SCmqjg==
X-Received: by 2002:a17:90b:4fd2:b0:38d:a76:6470 with SMTP id 98e67ed59e1d1-38dc77c61d6mr13551a91.39.1783706407714;
        Fri, 10 Jul 2026 11:00:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd2:b0:38d:a76:6470 with SMTP id 98e67ed59e1d1-38dc77c61d6mr13517a91.39.1783706407129;
        Fri, 10 Jul 2026 11:00:07 -0700 (PDT)
Received: from [192.168.0.4] ([49.204.105.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm12368610eec.6.2026.07.10.11.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 11:00:06 -0700 (PDT)
Message-ID: <31205f19-1a8e-4f97-a7f7-b6236a52a5ea@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:29:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: geni-se: trace: Add trace event support
 for GENI SE registers dump
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
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260706-add-tracepoints-for-se-reg-dump-v1-0-48bd08e28cf2@oss.qualcomm.com>
 <20260706-add-tracepoints-for-se-reg-dump-v1-1-48bd08e28cf2@oss.qualcomm.com>
 <a2491042-b7a4-429c-828f-905c07adbc5f@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <a2491042-b7a4-429c-828f-905c07adbc5f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JJYLdcKb c=1 sm=1 tr=0 ts=6a513328 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ua2K4HyBCek8nw/sr3ra2Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=j152-PXcblSeZ8F-r_EA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: aDm3Fo9JoKEIBrKvpJyHRINRi2iJp7kA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE4MCBTYWx0ZWRfX1d7PmPjOMSyN
 Rd0XiPZ40I5Nnt7+QtnfLNfwAZiUrMdkBLj1QuLTk1AAA3I5j+i2QTUNatKO5h0kbxlVOE6RSQa
 foQURWmQKUy9MfDvXIDw9qCGxjSRoEs=
X-Proofpoint-GUID: aDm3Fo9JoKEIBrKvpJyHRINRi2iJp7kA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE4MCBTYWx0ZWRfXxSgYQCcXB6JI
 H1pZUR6QmADIgmkiltynewuPi0kIiwPyNsv6RfLab/4GBa1BwNIE22Nn+aTVZFRL9Bqr7d8MnAi
 Y4/Ctj9/0LuxHG9FefafiYVdActMhAMMiM4aTSgkkh894dXHO7ZWi/2B7noJliPTIKbwegaY5dc
 VRPzsQLgS5L60AgS8kFBmv44jZ5CImIzo0hF3Tc5TGf0hBW8L5D1amWEBf7ckoQbIgT0AbK+iUh
 4bfnfmWF+hrRVTVnR1wW/kjlGrBDjtxNynlcs0X2F3lAr98fP8R1pu1oJuLhRIqzF1qIKFD6MX5
 C0M3XsoGCr30LkQKqcjdT0Rf/XVe5z8wPDJrBQEYvCAn2fmqNT1HYCcz5/nPrU1GcSNxi13iWOc
 KpqKSogigfz7sElzGDcJqoH3SRCFlOuI2pguzghS5u/P03bVUcol1xUJsJlJ2oUpyAi269+azQe
 Jb5lSb/Q4jRXLXTp8kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118342-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E8AD73D271

Hi Mark,

On 10-07-2026 23:07, Mark Brown wrote:
> On Mon, Jul 06, 2026 at 04:38:12PM +0530, Praveen Talari wrote:
>> Add a new trace event header for the Qualcomm GENI Serial Engine (SE)
>> framework providing a geni_se_regs tracepoint. This tracepoint
>> captures a comprehensive snapshot of the GENI SE hardware state in a
>> single trace record, making it possible to correlate register values at
>> a precise point in time without multiple sequential reads.
>>   /* Common SE registers */
>> +#define SE_DMA_IF_EN			0x4
> drivers/soc/qcom/qcom-geni-se.c defines this as 0x2004, that'll break
> allmodconfig builds.

Great. i will review and update in next patch.

Thanks,

Praveen Talari


