Return-Path: <linux-arm-msm+bounces-103387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOD0DaHO4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:57:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA5C40DB23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F76A304A881
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5251E383C64;
	Thu, 16 Apr 2026 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfNiYrBF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5t2SzNU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE8F391854
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340531; cv=none; b=Fej9RqPF9uaqOmF2kLHdyH/as8VISDZ2v6nlCM8F3PfaTeCVqn34vAxLv5BYtwOAlQXb9PVZUyiH/LjIBzG6yosOb/x62Xfymx9Q1X8w33CbbvuO28ckaD9XTypnsilCwkhtG2T0ybCC+qVySi82w7vcMKfmrb5TCOtU2iGD43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340531; c=relaxed/simple;
	bh=s07xyFEM3K0s/4ToldgrmCA6O5xZjLxj37ncRd3W7WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugDfdtVd1UYQWnmzOyWP6ER9PMYSKeI4pIi3RIBHDUiadAvqqHce2A247+62iSqz/PMdu1gVvWN84aitg3DqXGWlBv8B3cW0I7WofZq7HomvCsar3OTic7tQmx3fSp3/QUF3Y1p/nnfZHbeDQ6ZWAmd7Ko9UXUc7fVbn8fn0OA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfNiYrBF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5t2SzNU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G90WAr2979221
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6NEGa2bH8D4qzhZrxX1FAi3DMIdvR8dA4e0BmblBlw=; b=cfNiYrBF8hpHbgMy
	6pS4OY89Fa7KN8rqsvW4dIvEPU3rW80TluzQyH6AE5uW/wwnmprHljGTWBh2LCxZ
	AttH9FJKY5VuyY0gR5cujYitbQYv+WOCjsiXWL4pxrD8n76HX6Q5nOPscFxUD/2t
	njHvo+O3VekZCFj9JZCiRXHOhHfu7mAmLibW1XtoXxmBbFioS2oclYnXoFRjPcOS
	+qiT/OhtZDTTGO+Z2BN5TpFFiDpK36JKa96qMdSX4NXGtOWUNnukMhvwbc1UTyI/
	lMm2JKJEteB3HCOqwfdGs5W23ZsdDe7wwSeiOuaEBlSBoDsnvljNtj+nA6t3F6GZ
	ANVpXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvru8k41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:55:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so732639a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 04:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340522; x=1776945322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6NEGa2bH8D4qzhZrxX1FAi3DMIdvR8dA4e0BmblBlw=;
        b=I5t2SzNUHE62RlJ5BWf09pWkoQpBqJu+UCNmobXOaRDdMyDOlTIr9RE6xH+NhU7FzL
         l0WVAdnnzxTP4SsmGZfMq9G4XFn0goASjMaH1N3N5eoLPggkp2j8LTBzBdUI0e2+I7B/
         au3SyrH0C+vD5iD+IVtg3pAbwgVTHvvjiTT/LYOdvVkaXOMAlb8QrTB/2TA4iX+QpHVV
         Q9PbXa4y8T4uteGOphh48TLjCdK/bs7Fkt3X1u237DBxbXxApWDDz22+CrwC9op9mWZB
         aadzpOciV3YH7bd+mWnUt0YLWtUghGHtONA9c4H0uqHOmUCSDDryXkmguIrZXShNBD7p
         2G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340522; x=1776945322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6NEGa2bH8D4qzhZrxX1FAi3DMIdvR8dA4e0BmblBlw=;
        b=Pkjp9GQPSPe1KlWJV2Y6PoMZs2MBU2melsipOxarud/CDx77/hf6XXCvp41f1pz49P
         S4RtZXiCNfk2WAhPh2f7P8Psqw4dzx4nM2YnMQ0LD6BPL7Gnii5g2xDNULRj0CYsEOFU
         6J8s/RFQbAAoR4/S4J1BkZ3U37O24C8iBrlZEQcJbfehjz+fYFM5i/pF/6yPkHdkxkox
         qDfwUVL+0BRZtiOY60AX2lEEU3aFF3+6YFqTGLQqB5osLiZA0hHNk21LwPpoih9RV3bx
         8MhM68A23l0lGVB9WLA3xgHN8ijM/rxyjpiFwhXwIaL4v1oVezC+nnBsc70njupN7GB8
         T2VQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vHsjRYHqbPnx9vzyjhbvZqwhhxCyeddAx6KPvcngrpu3tXKAjEvHOl3WRgNJIY+HIxofQh2nd7lK7hmtc@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBjGUtD4jr+Rpw/QROE1M68dYi2uJTAkoxZGcODhLVPvl16DK
	bDQiR6nKxAWelcUpCGElCBsHMYST5P9Zf6kPcYN+Q2etZO4f24hIVAFz+iKbOaADdJfl3uR2hSJ
	rqqSyrX7Xq18LasCaEBeQBf+5eX5n5CgE76kfA/jsb7+zQnoK8Q3gmuSpQYt9+RPy32jR
X-Gm-Gg: AeBDietxOcOiBzyZZU7WKd2oVrDkGDbdoqvApTcQ35wlsI4M0x0xa/muUmXH2IOaWWt
	jV1Jr5tC6AvHIFQeHcwwsBqn6rsUilsMPnzT+dJIuassOyUqtnDr11b8iluJQxqHUq2Bsmjahwn
	h4WwoYdxQ0jCV7gzIEqkvGXcq2G/cdbTpwPkPPqsKyjVIugmUsSQG343psqe/vBJ3K4SY4rvlD+
	M1GdSmoHeHtpokloWByAonbq8hfQsTb3/ZNFKTLX8+Q+SbIrxtubIAFeAfwjSj6zgzsWhZH5NZZ
	CCsmKcOFWrosGtucA1/AubcJAvduwoYvf/IJKAroGEyfutgv3qa9JoPCgMo5jCL+Ab3HntYexfG
	CWxdfow+njdgdVam4JBEKrwLRU3sn7Y9kgnM6DoXGaaKsWWQgwA==
X-Received: by 2002:a17:90b:3cc7:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-3612f26da35mr3254458a91.1.1776340521976;
        Thu, 16 Apr 2026 04:55:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc7:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-3612f26da35mr3254431a91.1.1776340521490;
        Thu, 16 Apr 2026 04:55:21 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fce719729sm2273435a91.0.2026.04.16.04.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:55:21 -0700 (PDT)
Message-ID: <598c5171-3083-4122-9901-10d1812d54f8@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:25:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: codecs: lpass-wsa-macro: Guard optional NPL
 clock rate programming
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-4-ajay.nandam@oss.qualcomm.com>
 <07c73c75-5ce8-46f2-bcfb-bb6d7fe0afca@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <07c73c75-5ce8-46f2-bcfb-bb6d7fe0afca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExMiBTYWx0ZWRfX5EB4Df7eRRzO
 gysUsaTqcbzrHIzPNmCuEgKcinYdvDvbAAXGpwBh+Fqt42noCGQowVZmvmccsYr0E8bSPVS0GY/
 JRX/pqviFsEYnGCBcjPthQcQZJHQTPR/MQ8uTsQEHWmPkk1/YbVIM6KsGcZ96TjtRvREiCrnUwI
 cJU1/NOvKZO66mZitdOhgpkb9IsZMB3gKbBBfh03RAuk5kpm2bCHMtj8DAVd3elKcJWqoaJ5auI
 lbSUcuBYT5+Mn8bG7i4IsYg7uJOA3KwaooJ1d94WN+AFArPcS/c14SCZRpUeRfXxJqgV39fUYr5
 HUXBLKcU20pPUD4FbLQm7ya9s71cxWPsVgh4e89dCHw/S1i2DGOpd8K6rTc9/YO3WgExQoIR79Z
 XgXiwiW/f7a0d8cvPvtT9UxghRA1kFHV/3oEJrgUx4UAlrdP5le9apcGsiPK8ypiWYqqiG2aK/F
 tav38iyemWxTkua/Qwg==
X-Proofpoint-GUID: 9oea3ES-SqlgfVlRXj4jgbgS6Ny3vXLk
X-Proofpoint-ORIG-GUID: 9oea3ES-SqlgfVlRXj4jgbgS6Ny3vXLk
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e0ce2b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-w0wuxjKlsJx7c5tfiQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103387-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9EA5C40DB23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 2:17 PM, Konrad Dybcio wrote:
> On 4/13/26 2:18 PM, Ajay Kumar Nandam wrote:
>> The NPL clock is only present on some platforms.  When it is absent,
>> wsa->npl remains NULL, but the driver unconditionally programs its rate.
>>
>> Guard clk_set_rate() for the NPL clock so platforms without NPL do not
>> attempt to access it.
>>
>> No functional change on platforms that provide the NPL clock.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
> 
> If you dig into the definition of the function..
> 
> --- drivers/clk/clk.c ---
> 
> int clk_set_rate(struct clk *clk, unsigned long rate)
> {
>          int ret;
> 
>          if (!clk)
>                  return 0;
> 
> So let's drop this patch

ACK, will drop in next series.

Thanks
Ajay Kumar Nandam

> 
> Konrad


