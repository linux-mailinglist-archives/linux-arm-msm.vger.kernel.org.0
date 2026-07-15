Return-Path: <linux-arm-msm+bounces-119217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MWXnAotrV2rDNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:14:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9E75D751
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:14:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=opeyULVF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bitc66zR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119217-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119217-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E915830683D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C821544839C;
	Wed, 15 Jul 2026 11:11:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EEA4483B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:11:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113884; cv=none; b=JQsNtmrlxZhJVwue/lbnOuPZt5YU/LnaaMZkGqW0baOLJJcamcZbahEE7L4xJqfZLzXy70ntUDeXJ7Wox/qmXeLRNHWzS+lCOgkYdvMB+R9p1m/CZoyD9KMseuhXgByst5/xypLLtf9L7ouDcQHKITeFYnF69VeatHorASENzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113884; c=relaxed/simple;
	bh=ED3ztITYFkjSftAVE3W9ZxSnMCOxdw3hbYaGKs/t4uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sVmH2A51IRc3M7EQR/rg8IKL0oOsvsCQA62LN2nG//xGkd7EoKq2rImrPPyGfcoaa3UElRbi81x2/fDbVy2xzlpGMIxVxHckFO4iyGP4E+AhXyNlDyuaWANtlfP18dMoxZnGDXKqKcuBnKlCaYXDRT/jUpfJ+WPFX7r3LV3t2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opeyULVF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bitc66zR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FB9I9o3273217
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3BsJrFbv7+93TR/LL0rpXgeZlETcEgAVF3/gxGRN4Y=; b=opeyULVFMtZk6RbK
	P4xC7bo7gP2GfIhG5np5HD4X32gOtxa9Y1udN4uCPMQHh9b582TqiJ4iouFbwQQI
	YoBnf1PTkK9/LmIhEO/aLSaJi1cjGuWPgdo4WJ7YGGLIneFevDYnpWoktrBhKYdl
	FZP2n+TSyNkd3yTRER6w3kan8Ignc8Ifv9PBl7U7+fuwvmLEg9TsVTGQz9dN8OQ9
	xkVjNmOKaskv8FUu5cHUbE5yPaH6lN2VUH0iv5bPq6RRnzUcZqeWPYymU5tpDE73
	fZprfd7/ArjG2GRiRjJDTEQ+Pfeqb7riY5hBRPZ+zOOYrcklttIKp7SGXMr4DXKV
	jTU2Mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mkbdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:11:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5110c89eso125038285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784113881; x=1784718681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T3BsJrFbv7+93TR/LL0rpXgeZlETcEgAVF3/gxGRN4Y=;
        b=Bitc66zR9uBBtDRmg7+NEv63a9VKHauE4bcIhnqbyLSwT1uiZuVrtYQY4c/SGnwqov
         IsT48CT7VoCQkYEXUEzfJjyFwuQ+W3eo+BmJX1ihQUKZs0TSoIciMlldMoALlJdBXczE
         SaBo1pqE4CJH6l/hsABRPPX0eY7NR3TfmV92yVXZe1GTsksbD4mkDwAs2zIIkbPEpJht
         ydmrVHMwAJydGaVZMGguwOv3BiPEtqVKzm+ub6Davabt/+2jDOurwAsP4HW790N30ueg
         W/j8WV1s2ee8wxTcPXa0Le4jJagNQCUY2jL29CepdnNFXOqSgJLtwuN/gcYGHG/X+ifw
         GkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113881; x=1784718681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3BsJrFbv7+93TR/LL0rpXgeZlETcEgAVF3/gxGRN4Y=;
        b=LNRaOz52rb2/73ui3m04Rk/Fn1odhbMjCTBhhfv5YqNSeATYSDo0hyL8TK1oK66Ibi
         SOkdY+nOVkfR6sxvfxfjuuOoVjnrBXIVEGV7Ac6f/ATphG6QZ7QuhWlsD6SbsTlKSumi
         YwAe/mS2fpwDVicVD6kIKNBq++jat7w5f0G5wuOX/Zo4COT62bZy3clUBdIsZYARQpQu
         o1GBy8IMCKavB07ylA+JY0YsbxYwAmiY0tybuZxCpLceP4lFmWLwSPEmmzXqlu4chcqg
         dIVOphuQR9UBiUSrbpoEQCgzSP37maAvF+LGrIKMa8wcd+603dRrG8OFZrONdTk+eqlI
         N8qw==
X-Forwarded-Encrypted: i=1; AHgh+Rqh5MzUCv5GzmEDlnmC9lbodzkNH6MPxi67VEbyQBSbyeHOPgsb+xtvNcgMMvecATcB7pgfZp2Mlfbp3gCb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0en1//P6Ooyfy2nPlCXNjjufQq9LkGSAu9C4przhFG0pY7TaD
	rdvNS0JqrDIyWz3jomz/4L9RCpuzxvwLb7AGm/EjxuBHhggswx4bCIeUyF2wPLHTpRTBXpT3OEq
	AKOn4Gj8rGpOVqjob56R4p+d4AFiy2Mr/RwAKWxooXhuTE/dtyEvdwVLV40yo6UcgQT1s
X-Gm-Gg: AfdE7cmnd2+h9Saqy/kudTmwJ3LWWEh7iwfogbmLaqg5T0XoeQ0sSXnd4M/adm4qkUm
	bjrfAFTZAYdzyxaGuj5fBdKUBo/BBf+jKGQBkHi1krDKy2K7SICjpYJIjf6PFkG9vNoesvVX/DB
	Mg/TNoOPEBm5QRY/U8kyGY3+75xeHur0xFN3hBTcb/5dKlkqk6c0LLogMI7yG/qjkC9t/wbOkJU
	aO6dTSC+xe1l39WaAHxuCRNdO6Ik+Dlibwrkdmnj8oSC2XiQQaoiQxbpNogxFUCAt4x4fhHf6Gp
	ixLmMr/QRC8Iue6DIPb2htf0RM+C2rGcgUbTMffawl59XIG/i46jvEu7PpzKrygBVD2Aya+ip0k
	GuMAd+CXf7UzeRd1YiusEShs6NhdDjofJKlc=
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr1181437085a.7.1784113881428;
        Wed, 15 Jul 2026 04:11:21 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr1181434985a.7.1784113881036;
        Wed, 15 Jul 2026 04:11:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871b3dfasm6877666b.28.2026.07.15.04.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 04:11:19 -0700 (PDT)
Message-ID: <973c1b29-091b-4cad-a066-4f0bdee2750a@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:11:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
 <aldiLuYib1jCK784@linaro.org>
 <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>
 <aldlu-Qdf_T9uwbf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aldlu-Qdf_T9uwbf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwOSBTYWx0ZWRfXwGaIGHV51Rcp
 X8YMPnEauXmoSSm0KEtVwGvOxQPaZCVur9ySl102y40B5yD4cOgAc8BSOw2VKh7eNs4J0GCYcwF
 lrhEeFVzBQ1h1XBomg1dzlH2V8Q/QPDaCl++U32bf0h9lUUsFLM8XbLoTBCUiMg6iGqKeYcNAW1
 pOHsmyh/hb4+KYzDTtQR+TsqJqDnn3kt9hTuh1oGKHwJUR+N53foI6/8vGn6ZLs1n1XKlyU8VZT
 ICUmhAbr5FDtxf/WWAWNedCjLD+XnEJR4CL1bWUBb7k8kA0bnEPUz6kTVlyq/xWZPB5G1TvdeIe
 rLmVy+6afIIMtnbbyeVV9nFKnsnjPTpFgL99qSx4bL+SbBP3VstPbUWOnkX0MLiPBW3TdhakiNp
 73EpRZ5LefZ+Z5pQKRg5ekeYjJ21eTsDTnbaFjpChbAtgMwvpZV3BzOM2723ubo5FOe0WQ+uSuX
 Ix2jVKd0k4eJUTY157A==
X-Proofpoint-ORIG-GUID: -gOWCchM-ZNwMffwXZHT8VS_Z_XUmVGu
X-Proofpoint-GUID: -gOWCchM-ZNwMffwXZHT8VS_Z_XUmVGu
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a576ada cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4pV_bLEqcG6om8-7b5EA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwOSBTYWx0ZWRfX54cfJiOyKqe0
 7pWl6fM1sA3k79uUXz9+cV7XYF9CjTB1E+hzhO+nzQ18Dx0jVGi2F4eEVRR8UDTwz3ROW2+UsOY
 yEBo7mAdCliOQuopyiVBGiZqL5zn94Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119217-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57B9E75D751

On 7/15/26 12:49 PM, Stephan Gerhold wrote:
> On Wed, Jul 15, 2026 at 12:45:48PM +0200, Konrad Dybcio wrote:
>> On 7/15/26 12:34 PM, Stephan Gerhold wrote:
>>> On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
>>>> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>>>>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>>>>> the latest wake up capable interrupts when the CPU cluster is entering the
>>>>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>>>>> implemented as .power_off() callback by registering MPM as parent power
>>>>> domain to CPU cluster.

[...]

>>> We probably do need some fallback for the old sm6375/agatii DTBs though.
>>
>> The sleep logic doesn't really matter without the platforms hitting a
>> specific power state anyway, so I'm not sure we actually have to (i.e.
>> the regressed path can't be exercised today anyway)
>>
> 
> So are you saying the MPM is currently assigned as parent to some dummy
> idle states in sm6375/agatti.dtsi, which aren't actually triggering APSS
> shutdown? Or is it just irrelevant because other power resources keep
> the whole platform on (RPM clocks etc)?
> 
> If it's the latter, the question is if we might end up fixing that some
> day without further device tree changes. :')

I wouldn't call them dummy, but I'm not 100% sure they can trigger cxpc
entry..

The latter most likely also applies, although that's based on a guess

Konrad

