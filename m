Return-Path: <linux-arm-msm+bounces-91891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FlLDXFjhGkK2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:31:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F57F0CB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 451033003627
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5608A396B87;
	Thu,  5 Feb 2026 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8hkvYhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A65Od5tV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B736403C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283886; cv=none; b=WryQWdunhnJqxKwUemO737TikKsppGBbteUfNIubnC0ujxaVeoIUHlNHzHIwmmCItglsYBRodWZsUSUZb/l9LdrQX3zxYdoMgtA3BziFFFDtfklPTKnd9anlov2YBlYL6GJL3RbjEJ7lXbFTNEPb4FjHuGIoKjOzNNVUxBH7kDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283886; c=relaxed/simple;
	bh=M4dIcQup37e84bK2JGpKMGQHoRCk1BsKlKPjyX8pXFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/HXe5hwqxMajaa9vEdiL890erRufGZSdYJE7I/McVhaTirypTpxn0/QWTBb9T+4iHzBh0OhZ6Mr17mRLh0pg2nabWImoGzHk7SfCHkpgQOq1E3+lQVjo+j4eql/E2+mBGcVjtOUNVapv8wzAB8OuAayD640/7LhKL0W9AtPqH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8hkvYhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A65Od5tV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153e2Vn3031264
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB7DGDcRydyU7uBgXFuwMgUMBlijYsR/mIeTVIHC4u8=; b=d8hkvYhHPU+94Err
	1vKZ9rVrOqRYXCZre+LdcScQf9UFMg4IB76PxwtuuRKpcRs+5DNU2VRx5LtPGjdl
	TR6Zl7tshih1+MWFnUTYR+Cp29E17sUc+7UJy28kvVob3zKR7l6CX7QGAJhwSTHA
	rNEhzEC7ntfiYE214+VXyzskweN5TzwhSh28tM49T0kcun3/YENcCoM0sGrzZPVV
	m7ivFA8ZoEutQyyuihizNDgYneHJzut7jVYF0IR9T8C72GPPIFZgmFyVWCpMmcyI
	CR9tZybIOUSziA2dz7k3heq7O5pHgjMjxyolZHuCG1/g+8Pi8g9R064evJpM5FCt
	zq/I4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4a7tjn6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:31:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3545dbb7f14so748151a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770283885; x=1770888685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fB7DGDcRydyU7uBgXFuwMgUMBlijYsR/mIeTVIHC4u8=;
        b=A65Od5tV+SmOg5fn91pX2DpK2LfiIXLevvNE0Bo6EcpBZeVxIrcQDdfwcjUcPcb+9s
         a8gVLQ3QLYls/coiATkqwk+Ne2fArEIc4w5MMOLZmJy+R1DhIwiNFMA4rW8r1/08uaLS
         8vGSxTt3Z6ln3HjtwGwVXuSyGE9jFfQ6ekU11E1DZ4uaSnhDYIubAvHA8WN3zakLL9Hf
         UZwAwoQKi8oIcvSYeEUbyKl5WxHRdFLNh+T1TgUmtmeiVP7ZORgSWUewfmUROqZDU0lc
         muaXmh21yNIOC8gx4QwWDm2I03UHQPGdeeBK3mWbIOQoeaYallysv6CgFLvYgirZrXT2
         9hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770283885; x=1770888685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fB7DGDcRydyU7uBgXFuwMgUMBlijYsR/mIeTVIHC4u8=;
        b=wsvZs0Z6gkn738A36UHlAZICLKxN20l1fybqy/gG8hmKGvwW2anGM1goJlj0vNcixQ
         kRRWieE4WVmbxivcY5NYxMJSRQoYJa5p21hu3ziJtOBAxr3Zg1XWmyKkZ/rFQrteLu2m
         /NRgiuRgstosvUG7qj15p00Lr4Hm+40x5YqwRgfz+qdR1wqFWDGLy1MJfbWRJKnNy7HI
         w1XM4jYaRXrUTkmXNXDrxSKCO81oQ++tW0Bt+3uIDRI4rv6JTrsFzLhsC38f1KcVlZHX
         +BRji2LC6d05m7mD4HL6ulMHiFXfbnO7kJYt5a5sDtIf1xRvYZepSiJfMZpiVBnbjuGU
         V7NA==
X-Forwarded-Encrypted: i=1; AJvYcCV3pvs7eoTivRtrAf/1NAult2EWi8ivy5m88kKxeCLL8vkqRT6w0D89O2wT+KihQHZnC96aIrNMsv/6UjTP@vger.kernel.org
X-Gm-Message-State: AOJu0YziIig9NUzkzY16zQ6TDUP6cpXArP5ufpWGW5cNqrwEUcKPlisy
	7mepfrZtzE59O1kB0kAnpOr/HvQ01KrBPA6VxSReYbVCvVsIp6sTZdk/dQqtHJ2Fy5v9OdMFmP9
	h+FEut8sT2osMoHhGPp88Nx9bDbAUonAyfivv2wTqYAez9tnNwOvXzN1AuMYBic7q/24n
X-Gm-Gg: AZuq6aKxTy33NhknlxB5evijQJHGNhJR4j6me6K2J69cjvyJYezDi2YnE/ZnMGGRONz
	O4BQgFYaigROQs5hdUq81SBQV6+QFG5wdJkI0x6uje2d8zVpNg36HW1GbBORYpBsGQrSb7Y1kJs
	uOrxWPp6CjJbhoBw5FN7nGSg/wAvonLfkc8gj7cdwgAuRTTY7BchwUYSLOczWT3vvRMkBsMpHRg
	asJWJ12INEZiu3xBH4zbEZ0aS5LOwsvyTh52M8dvJSFwOHA7NmxDzqZdeL9U0NjTg3RJBuMCEn2
	HZIPFMsgOzAKmeqWLEgyyiyGmF9fv6lxW9gerJ/m+rAniZg79/JuO3wAeSRsN4yAaS0QMNy0hBP
	0yVLnw5XdyORi55ZcfXgAhLVSqRum9c23yj1hMWCmhOx0fGZ2ctgngQ==
X-Received: by 2002:a17:90b:54cb:b0:34c:a015:9cb0 with SMTP id 98e67ed59e1d1-354871b0c7emr4438339a91.22.1770283884673;
        Thu, 05 Feb 2026 01:31:24 -0800 (PST)
X-Received: by 2002:a17:90b:54cb:b0:34c:a015:9cb0 with SMTP id 98e67ed59e1d1-354871b0c7emr4438304a91.22.1770283884212;
        Thu, 05 Feb 2026 01:31:24 -0800 (PST)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c09adf4sm1983784a91.3.2026.02.05.01.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 01:31:23 -0800 (PST)
Message-ID: <7e9c4610-1329-4e86-ae20-1509e24738b8@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 15:01:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-1-417ab789cd97@oss.qualcomm.com>
 <20260205-classic-cute-panda-a97bad@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260205-classic-cute-panda-a97bad@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DPDcdwWwvDYvgMq5b5mEHmv6TxcsKn4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2OCBTYWx0ZWRfX5Hf0yJqmk3h3
 tkoXnwAaTZPV+1b7H63tcAeSTj1sH6Mx3oFYADdni4rLTV33gbyl5z85Wx/eUzMYyc5/zYyvRTM
 RYxKxLQCjjJWd5pvMBIPlFvd9sNzlLcVAQjNbdLoLT1oZlTvfRV2KQjNwvqYRDkkDJ+SfRjDyF4
 RYpOGmA2/jQfjWVRe40O5E8jPGnifHXIyv5chBHzib8wJXxhzhHeI9pIRts0am0zgZg+WaHsuWv
 W72WJdfAqSsLh7epG67rOmabKHHLzQygB9O6THLTRzUHDqIjLJZjIfqRzbkxs6xZTltdxvtCTfp
 ymz48Q9ADhIb9f94Mor9Dx1uckhGqXcIn2lpqkgLJzQ3E/YppFuwicRtePAgBDPgXH4RSrShthg
 EKqd3/4nLfMBeLy8P+j2xCYRJygeDokFC864F42fnY2hizInvBVMayq+TeIy36l90YG17p/NsNV
 mzZgv8c/U8PMG3g4VuQ==
X-Proofpoint-GUID: DPDcdwWwvDYvgMq5b5mEHmv6TxcsKn4F
X-Authority-Analysis: v=2.4 cv=QaVrf8bv c=1 sm=1 tr=0 ts=6984636d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zRi7MKtGYgBp9MobL8AA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91891-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5F57F0CB1
X-Rspamd-Action: no action


On 2/5/2026 2:48 PM, Krzysztof Kozlowski wrote:
> On Fri, Jan 30, 2026 at 04:14:30PM +0530, Kathiravan Thirumoorthy wrote:
>> Based on the discussion in the linux-arm-msm list, it is not
>> appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD.
> 3rd party discussions without any references are not valid reason. You


Here is the reference - 
https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org. 
Let me include this in next revision.


>
> Best regards,
> Krzysztof
>

