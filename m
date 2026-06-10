Return-Path: <linux-arm-msm+bounces-112458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7YkLMKVfKWqxVwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:59:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 105CE669828
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:59:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XydNCm+g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fmC1BHlN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112458-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112458-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AFA9321B477
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC06408014;
	Wed, 10 Jun 2026 12:54:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17448403E9A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:54:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096089; cv=none; b=lP/qgrMtQgs3avC3CP85PQ2Vy3HU7jFCujqPYtprkd4G8qVFNRtEwdONnG05mLEqinM3suIVK2wWeaedFw5Qe6etnTeTE/a844yKTv4j70+aTZqy/xwU8Qv+gz+qv6PlzZGhJhXwYms3wR2dUHB/uXGJ/hHpi03ESveb3CEj9VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096089; c=relaxed/simple;
	bh=XXi5LR6g8ALn2Q/eNHTM4xxYk/5IMIVrVFpt+P6u6JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMOrRU3fhlcll1ltnxy9DuVkE1Gna6KOFXYZfQfWMBPpZELsIaiJN3aPkyjYc3sy222w4/9TyNCbqvEcepc6V2LVZg7JNNYS5mO2rQyOIcYzA+9Yew3EfCuA7UjLMOp+5vMpPX/ZQAO6DCxHm6A7MZk7SJLISyFoSaMcyMAUvbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XydNCm+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmC1BHlN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCsSw1555839
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfn5CQTKJf6IkNhsBjO5J7E8yuSH1p8S8jIJE2Un3lg=; b=XydNCm+go+q1304j
	SrF6PFBm5jgZBlDLdKpSXphrqx5zF/EMzcNW8i4GP2yxO1xTcgdCD60wxI5TJKY8
	B/Ur5OCkVqK3vIHBJ+YfDvv5I+rbUKWzV7mFd0QKMCbYFrt8mbKpBiMdbvFgRoRf
	0EXqMmdmT9lYoxRnSTCLlrI+Df5dpfBeaLvsEmOBR7SfQg9iV7MCqk97UcfIVQ75
	XlYWL+IIX7Omwck8E6GHD0W5YNQtcH2OK5DH3LMt4hae1PV3yf5jljzsbcdM9XMr
	37nVlHtqwSMaEKCQ3OON1raFPh+7hNp0JTu4Y6rs9Tb6I83t+iI+/t15VG3v5/28
	qKhbxw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnth1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:54:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccee12a34dso13805536d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096086; x=1781700886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rfn5CQTKJf6IkNhsBjO5J7E8yuSH1p8S8jIJE2Un3lg=;
        b=fmC1BHlN8M8GZoFCRfv+sCpVNwiRP6N+atK+kx5ySJA8Uz7rbUR/hVCkR1hYh/ZMkl
         FHlJ/UPT5ivwjqkb7Vrnpq6PBqnrfQJFjie9Mp2Ab1oTou14U42SkXiigYya5yygWQTo
         DmjVyTdiI6OIdADFbzi8LCd0Kx5dJXCReF3aTq8fpakUnai8xWwCnF/jkLgbjgYW+8pe
         AUn0oXR2oxbs+j/2YGBU/FRCWtkGNl1whnzhKB4ByqzL253L62FQdhjiy1qqVobeWlyd
         sjHYmkvC5Qk34NbrwY3jTLDPphgaHR3VBurm/qJaMKL0CG9BCwBLTUTxLECNRM5HKRv6
         mOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096086; x=1781700886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfn5CQTKJf6IkNhsBjO5J7E8yuSH1p8S8jIJE2Un3lg=;
        b=VCAKWhnSLEIDxRiwxh9hZzfPh1lOElsj7l5bWV7zd3ERY/Osh/GIhcuwyB3lSzhTPi
         hgzpsZ8qi2YjR7Jvk7No8ABzLR5Zes5ZFa18oQ6D+hluppIfMJYlY2Ci7OpCyWkQ3L11
         KAzjV+eUV0TwffqiLGNkxrsUG/T0feZenroW4fWbPWVpwDAbNoT6EdThj42qGjFjUBax
         Nnv1Gisu5yUD+OeAhixVW/hUovdMr0B24sZhFCak7DH4ED+KibVcJ2RLVWMdDZrpSwIW
         OxIHYgWrY8BNUZARyF+i9Gj+v5KZXI66InhD8nH6mhj72xXIkpPhCIvNSbRpcU9h9T+2
         WRJA==
X-Forwarded-Encrypted: i=1; AFNElJ83UlojPxvTzoWQz5eq7K/bopla5xINapxCvlOZWYcSy828RnJvyEt8DH/eZ9OmPhEDEgGqCvCF+MHQLN9R@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/vY7ymrDqUNs02YPE5ojLlHkj3SHD3oX2Ma/WoXaqjHgrqVxJ
	jkPxc8Huu3rhwnIsu4sIyDiSXrTYnbAnckrDFYSZudvNhNbZ70vYE6uQTpZMgUiqDKOdl1OfTLy
	/LHTimRqdgna6TRCL6qBgk3BEGHx79MEknSH/PB64d8sazT24KgDca50Hxk2ekSFB9p3M
X-Gm-Gg: Acq92OEDWY52SPxH5mNLkAdvli4zsGod7jTDinRz//gSZAHEDR1RHB5eQePBaK+5yK4
	2Mt0n6U92z1CztBU5Bl8pnACrxdpthJIgY2FR7EFpNC3EcI38QcI6oUsljI7XB8JlYL6zpRJmmD
	F3AnM3Qew2Z6jiqzXd4+0G8pfAC2W65SM0/GOnYWhlSr2G1PZ6U1D0qZ9oNhk7urySQQ1g3+u3Q
	1cQKX99eUNTEm3K2cQxJPLy6VG/EiKNPyhvZNaNwF7c3mpinvyh70ES8uO7al3xgzyfHsTV0EM0
	rRs1fSEETahZvuI9q25GKKMIH3B/PyLXMae2oEyzBh/KwPieBVND1iuaZ5bJkKbfsr7CdZN6n6Z
	qYhNrxAU6htpkIjG61KhnDyZNpd4V+VadCykvWdrDm6M74ODfLz+m5SK0
X-Received: by 2002:a05:620a:4594:b0:902:daaf:22cd with SMTP id af79cd13be357-915a9a3c617mr2398718785a.0.1781096086474;
        Wed, 10 Jun 2026 05:54:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4594:b0:902:daaf:22cd with SMTP id af79cd13be357-915a9a3c617mr2398715785a.0.1781096085876;
        Wed, 10 Jun 2026 05:54:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm1201149866b.55.2026.06.10.05.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:54:45 -0700 (PDT)
Message-ID: <760a8b79-2ea6-4a88-85b7-79c91930dd19@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:54:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: qcom: iris: guard IRQ handler with runtime PM
 check
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608001128.80090-1-dennylin0707@gmail.com>
 <6ce9188f-aaeb-4ce5-bfc1-28b4f45a9224@oss.qualcomm.com>
 <CAGEkeHdK6EwVtJwSHNqJr8kufkqBsbyMMiL01SpCkzSF4bkjGQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGEkeHdK6EwVtJwSHNqJr8kufkqBsbyMMiL01SpCkzSF4bkjGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3a2w0QhKm0dVmhiJWKSukMa1FW2w8vDr
X-Proofpoint-ORIG-GUID: 3a2w0QhKm0dVmhiJWKSukMa1FW2w8vDr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfX2vpas00ss6E1
 /e1/D1uLs+ksZjSKapduM7h5OP1GdmSDzD0+Exez4Jm7E2yF1X7GMBZiOyEOEwomlHwgRDhRloO
 BUCtdujJvcbEdkrJbXHAzXpnbTbSwzaornafwJmqbckxj/hpb+3vnKh37/NK0k08rkpnYbNuj9h
 GhCnUcwIywj8zYAsUUlPsO0cOfIjddMb4kib0sgGeQCsHtOOh/Y+rLOb/pFSqkMY4GnEsRKqjKx
 GgTWt2zXNM/Wyn268B5mBPgw/9J9JGzWzjYG5kN+kDj4LNWcPVU9Di3mOpQgWj2s3ZIDbbjUFws
 TpFMyh7plteoDHlNc5OoI3vFwOlqLN5CA7fMulJcDeS3sHoY5o/rG//BouhB0jtGbOC87Ec5Ltd
 QIsJWmG27yXCn0F+03JLh4ihRdmq1iu/zF64+GZft1olYx+u2ApQA6NY2O/VRkd+L92tgGfPoaO
 vddPTNKNccDJr3jD0xA==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a295e96 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Jr_2U7P3-8ILDYtR5L4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112458-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 105CE669828

On 6/8/26 10:28 AM, Hungyu Lin wrote:
>> Have you actually hit this issue, or is it purely theoretical? We
>> shouldn't be receiving interrupts at the tail end of suspend callbacks
>> (and there's a disable_irq_nosync() right after the HW is disabled)
> 
> I have not observed this on hardware.
> 
> My concern comes from disable_irq_nosync().
> 
> Its documentation states that it does not ensure
> existing instances of the IRQ handler have completed
> before returning.

Then let's just replace disable_irq_nosync with disable_irq,
I think this will solve this issue

Konrad

