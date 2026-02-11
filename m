Return-Path: <linux-arm-msm+bounces-92593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBnINGZTjGmukgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 11:01:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F2123140
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 11:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8AA733004DB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77B332FA32;
	Wed, 11 Feb 2026 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRcEd+a5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeK7SrJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15126F47D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804062; cv=none; b=a6oKYrp0gIyWc6Zws9OGPHS9f6jz3c61JI5kmOTbgCa1eam9Z9hUQJQQHGvLY+neNSgkCWkIWRL+FClEhdvLeBoBsr3FatQduX7XGHKi9mlTxqPcl5Qs+9UhrpEt42LdDfsM0ETsoGECcuUDQ1hVBPTuTTmaOdD5qMnv4rl6fWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804062; c=relaxed/simple;
	bh=mBbQ/PlNVLpbc4+TvvjBtK18WxXADozjYzh3fRdyLVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aL5iKdKTEL5oQ2mGxq2uQI5MmCK0I3cthYO2cMytmp7Hr7+FkPZUKkV/Wmxi+d/5iSJmL+slujao2tNPbseNX6Wp/Rnh0VTM7q15RSyMAVw4fX+jWGlzNz9OM8+zhv81+RfGF6To3ZSbsbgGsUe4vmjKiNbutYmd0k+IbIZCNwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRcEd+a5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeK7SrJN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B8DbBZ3919386
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rv7cH++LnmwgZcqXk/m5EfA2rgQtFd7BW1CG8SndFUA=; b=PRcEd+a5PIrbXTYR
	FD6JG7cu61eCavnn7ly1stmpcWxhwyjHQgFKWG9R1zl+DYbgth6T+KcVkEe2iRfL
	8XLCXhT1TVhTY8HuKs/Y9oLEa8a4gMXiM4+Wh2CEE0KMGu3SSJSviH3Wsrr4L1zH
	0dN7SWgLNDe/MOZFLBorqgT6fJD3yCyHbodYngQCKvwqVsuW0ARyubODZEKo2kGj
	liUI8HTixBhSn9P8cu6PpsIoiygUtc7WgJqRRF7ulVUpvP3eUfZPob0P7oIUCY6Y
	1A6WR7HYz2JG5A7vZs7qPmev4QdtQ7pLPDtEBmorORpijitmQqSLHSeXcVZbLlHe
	4N02rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c86akkewr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:01:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so217390085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770804060; x=1771408860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rv7cH++LnmwgZcqXk/m5EfA2rgQtFd7BW1CG8SndFUA=;
        b=FeK7SrJN4sbq+KEy7WERcvwsSDayojz7rv9ZQeSBP9xwacAqCNMKGrPtWhfnWjUs48
         bbVCIv4P2fvewtCDGRbAM/8V7eX8vG/YeLmvOvfKtwv06asqwRObx6jRHzRhEV93xQiA
         HZGJY763htWc6xE54nyZto3PXRt5vKA2RwRR7bmNbaCDNZPxB3CaAdL40t8Hq4ukKSln
         FTn5FUQn7wojXOM8kKs6uC37KWSnrRHECmS065Q48vnTNrJjPeeefcuuCYqzfdkq5Xji
         O7VTkrLYmkLoV6bDyBwZRyIigLoxaHMIQPAMcYFywXy/t97FKMGTybRAXl9DDH26UZSo
         hnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770804060; x=1771408860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rv7cH++LnmwgZcqXk/m5EfA2rgQtFd7BW1CG8SndFUA=;
        b=lDPzE+NKZy2vgnmwf6jnung7i/5DIpPlWEFf3WDuZBo+FoB/i0YSG2CQUE8jNUZyGh
         sNr28V9xLIe2uXV1SDtV1bcPPmyBTsgZ68nDJorDxPR4Lw5Ul2sLv9c4wIqEOtZ0NvXL
         ngEnCS1R18h89xKpGhf7zUmyNItuKpNGHKmeWNJnBqcxFIo2XfKYOCBuIE2kqb/QhF36
         ozKaF1MU2YvAFklnZqZaIB7oRWriz/1y+rwoGTyNMPyeP0AIaVzUIiAu3MN/MmpB2Cgg
         51A2z9794zElHrxqDg46EjbgCjxpXshOi2NbtMmg5OFYpbPOkSEsq1sW5M/Aevj2z/cs
         XVmg==
X-Forwarded-Encrypted: i=1; AJvYcCWOxfOOuLPu2gO9TbH03VMhrz18vq+RO1yTIPBE8pQIUdawoPsibjYAZWAa9hgy7SRMph2xsgD9ylfElnDZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxO1DnO989Q4W/xZF/QSmrXSk4qgO9J9Gnjv9L5gpeXOtHLQ76e
	pGjpn4UJvHIWUEQN6hfDSG20Qqzo05vJLUhU40h5tv52YUp19xQgwYRjAnauMazZyWsB22xns+h
	Bg1VjmSOXg7Zz19XpjpikDsA4P3AE3yDVKRoLvsGd5DvaoXfTILQJ6qet68/45bMG7MlZ
X-Gm-Gg: AZuq6aK1MZZur7UCq3AplI+t6kdjpSTYZENF/bKXd5xMca/49LQQGM52iNt9ta8gCK9
	buZW/VRoBHR9WttKZhQMY1MozoFS19mUB4/Bxoql38cMsZdKkYPK9hRYv1/QKUm88oMgr1P2lY/
	SNyeswEZMEqvhr4H41BnvBpdv5US0Fd9DT3FZhyVcxa+kH7taAEtovTaZHnpdM+RQljKWkUmqeI
	52L+tzvyg9Rh+9H6qHYfswSv9KvAYxPVnmRMvexXDBPKmvRV+jsiTAWZK4LIr3t9koDULjNRW5e
	6ynbH/XlCGYAST18JKAjrjCeld0RCaJdxsyCK7O/RmKyYU1VDtwceQObFUKxRuRyUTOfHSTI7fG
	Bs2BT1+dfosVcJboWyHQhO+FFnms+m+IMbIYsY+MyClDH/GbX
X-Received: by 2002:a05:620a:1a08:b0:8ca:ffe3:32a4 with SMTP id af79cd13be357-8cb1edd9aa9mr623906585a.42.1770804059951;
        Wed, 11 Feb 2026 02:00:59 -0800 (PST)
X-Received: by 2002:a05:620a:1a08:b0:8ca:ffe3:32a4 with SMTP id af79cd13be357-8cb1edd9aa9mr623903485a.42.1770804059412;
        Wed, 11 Feb 2026 02:00:59 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b8f7ff17a44sm9101366b.0.2026.02.11.02.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:00:58 -0800 (PST)
Message-ID: <cfda7535-e68a-447b-9e0a-83796aed47a6@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 10:00:57 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for
 pm4124-codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260209142428.214428-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260211-holistic-precise-gazelle-fea9be@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260211-holistic-precise-gazelle-fea9be@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=698c535c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=mtHiFRkL_bO2e_9l49wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pj4j18e2uSqSnGZDYdLGgA4ecVCbAI0i
X-Proofpoint-ORIG-GUID: pj4j18e2uSqSnGZDYdLGgA4ecVCbAI0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA4MSBTYWx0ZWRfX+ZcjQjqSDP7A
 CvCbHGcEzcanxwbxXBYHieZxcbforHYZIhfLWPt6jt+LqvZyUmEHqfwy2ue0IHsyjUmDOLNuyEe
 RikR5xJ+kk0swYLTT0E/N8SW/Mr0+iHu5ew5s06a6Qyv9EDu5nabmiT6VeJgifNehHGkvaYlO5N
 /lpa6sVk/EB8CNiWFCRvvjQlfh2yG9HxDEMjJiBiuEWLLr4uZyGb823EW49VleyYO+ZZYI45s++
 nLOqcOvewbpCs3fmWoWgCw5F5/UMsdnx7zZrape+RIjzCHPSaXLF0QoIog520pxnah/5c+v18eI
 D8Y2g+kgnK5lGi3/t0QM7bFfh7DkMwHkA6dtK3q+4x34mj4ogqM90bU8+FrCF8jA2Qmsp0i8K+b
 68ZyvPIo1CRSot474zWuWOjRc0qfX/Yy/jcKrV1slvw+uL4CQsapEwQi4W94TYH8isa/+jH5M0w
 s0xeJDvBPt/1sY4U/sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92593-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 370F2123140
X-Rspamd-Action: no action

On 2/11/26 6:43 AM, Krzysztof Kozlowski wrote:
> On Mon, Feb 09, 2026 at 02:24:25PM +0000, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
>> Audio codec has TX and RX soundwire slave devices to connect to on-chip
>> soundwire master.
>>
>> Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
>> properties in mfd qcom,spmi-pmic schema to complete the audio codec support.
>>
> 
> That's v6, not v1.
Thanks Krzysztof, I was skeptical about it before sending however it
made more sense to include that binding into this series which had 3 new
patches,which is why I started of with v1 again. Which can be easy for
review and dtb checks to not fail for the dts patches in this series.

Am happy to send it as v7 next time as a single patch if that is what is
prefered.



> 
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> [Srini: reworked the patch]
> 
> Why? The v5 version was what we wanted. Why changing it?
> 
I looked at all the versions of this patch before sending out this one,
it sounded that you were not okay with the patch itself, may be that is
not true, you just wanted a clear commit log changed. I can send a new
version with updated comments as you requested. May be I miss
interpreted it your review on v5.

TBH, there are multiple ways to add this new child node bindings into
spmi bus.

Just from my understanding, why listing compatibles is preferred over
listing ref to child bindings?, while both serve the same purpose.

thanks,
Srini


> Anyway, same feedback.
> 
> Best regards,
> Krzysztof
> 


