Return-Path: <linux-arm-msm+bounces-89620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90353D3A680
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A6C8301F5D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7733590CF;
	Mon, 19 Jan 2026 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEC0Di5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvVjD06B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FD13590D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821015; cv=none; b=ssBh4ZdaipsXKVSH9OLdUTcLpAZ3rNLKf3RvzSC4tY5ejp9z7+UjiywBh5ktuUaNJS2q95cFRU9EnoFQ132MFXSODK7e2ml06I25J3QkcaYL7biq+3XRFTjrM8iQmujbNnu9JeNFbtcs7HCvrOzI3CprNKePhYPasMrOXPAIXxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821015; c=relaxed/simple;
	bh=V0m0MHpTwISEDdIXUL37sI27AUu7Yyp/OB7zrQQ6LGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6yYgqfFx3LT8qlnUD500mtR0JxXM9BaSrd63cQrMoFA5545VH/Nhm7Zftpl6D9QwsJMqSeh5/H+xlBgCLRcU20qiG8tpivp8QC/c6XlsLbfppUs+E9Urvcz9ON+Ro2HhoICGcFMrCWFrg1yfSP1ExNstksiZKUV/ggmLUOPK1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEC0Di5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvVjD06B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90kfc227975
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DttoVsVsnphyHmkrHdQpNufXsWDFvVc7wHWJt7FQ3V0=; b=pEC0Di5ssb+qLjPC
	7WlgkKRytG3PmBAZbfizyAU74meg1OvOOhJtNDwx82G6v/VOVvTlI6ufC5XCm2Af
	qo45ZU4Mi/j0wXCdXThkGJw3z4rWWVfNcgHkZuvSXbTqTjSczvGAc+xMeTn8ZV3v
	fdyrRi4Ywb1a52zzkJZgShoLmCAdytiHB7+djfBSpz+A2e8+s+MXNyoLeiAfmJLD
	9waJbQ5VpN+A6NwlVbJ9TeIrRdteMvkJd4vL4UdiZLcMY1DQXgyBQWG8r/kUT+zB
	Gz0QDJKkBaXjYGlT5M6leiDFqP4SeJta/prnmZAdsLgm/9N+fc5eZPLxG5n7JLd3
	glvq1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8pt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:10:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-501476535f8so14829931cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768821013; x=1769425813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DttoVsVsnphyHmkrHdQpNufXsWDFvVc7wHWJt7FQ3V0=;
        b=UvVjD06BNRvAHfcTqnyHPCW5kNVGwzBse8Hj3/OOc6ddWhhlijIz8AqDfdIMsqgaPZ
         tC6yXWxS2vkGpO6eKT3VA+86Otkr5KMXXA7lNhdkvANSbc56Yye6d3lHnrDx6tFiFlmY
         1XRLli3DIQPagSGS1nTzR8qo2wcntuXc5BLMDhARA2AFxLd1ZcdJYtvCIshAeuB4pQLo
         t2iWjE03svWUh+Edicwl1Ec8wa80xevoFOgZjl2b1mWD3OSYSaqQkxxhy3/3LIp0q6ib
         4+/FbJ8oY/ppjpSnSBedEKcIKKLzB83F+0/nR7p6N8J/JZHkM3CUH7c48/6yZ0B803pA
         1eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768821013; x=1769425813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DttoVsVsnphyHmkrHdQpNufXsWDFvVc7wHWJt7FQ3V0=;
        b=Wzpx0hJmyAwEmIOB9DWIzmJOcfOP2fFLJSpfxikFgYafdCDqb3+YToVGWYBgoknmkK
         lPYo7xvl4/2hUnkyN1szkQqA/ppPwZw0S9Lr/38B6j8+W3uvB5TP3vzZhdo+61NqJor6
         il7eYoaF4HVPxMmOOz3/s5fqNqXoEaUXwvjSKHubf+VeseOUXg3Fd4OVdDwSfgmr9aSi
         Rai4YtlIWTWu9SNXXWNFxy0b3n3tABbLSMpFhPTDPHW3VqFRrAub0f5o3M8ok0dFhFod
         JJjmPyc+paH0cMoZW1/c0Ogio1OZL6Zs5qYGHgJB2B1nWfMLBmQWwmoW+8RryS6GhKKo
         YICA==
X-Forwarded-Encrypted: i=1; AJvYcCX+cDy9HZj5lCHmpdxuHFzwEdZDgz1QI5N0E47mWuDadiAs8cqAbN16KGum8XEArwTbhTaf0qQLeRgHsQj9@vger.kernel.org
X-Gm-Message-State: AOJu0YxFeJZxO4sF8TpS6b4xnsVUUfidWJFWMxEGnTacS8nIyVzcXilG
	7XjPjGCykGRXO7Yiznj6ppc/XbbicOxpr6hJ5uHYf95qR/KmbAxIR9igZCQMMIsPZZMwRjzt6ya
	YFcozeMH7FD7irVx6rXUu7qFi6xDqz6SuA6Qy3SQsUw/XbNYdptWU7B71PBGwE/HGYv46
X-Gm-Gg: AY/fxX4c2CodDQyGd875/Rd6YzhbrfBZWAFJgCrBtlgCbyFcKxTqar0t+I4lLFZb1dM
	4EdEom9B5QdEptyxtFrXPELrk+Y9nMViQrkMQXLEeviOraCZcmFSgKXG1WKY5RiumFuf2Ak8IZC
	KvZ/fyf5P0+/akZZiv5vHxF9X0PmOh0m5pNjAiMydKNed3vylt7DmdiSifQZtpDlKZw71tH7WBL
	ZtwwSOVg4TR35XUT3MefzlHSBLZmhW8ag5t6CBqfzeEK5lEmjvhRBkBTx1A6HPs9JWZ2QJbyf6A
	821b5ZBJJgm2AG57LJDeQnsv8KdpsOducC3an3jCemQqh6qM2G1TBTzYPWdYhUStTabUfoQvMGX
	ENU+cW5qp57R5i64xqsznyxo5bcqInzq9W2euOTYUs0P+9nFS26R72zO2NrqC8LcnzyQ=
X-Received: by 2002:a05:622a:51:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-502a168dce3mr131051431cf.4.1768821012768;
        Mon, 19 Jan 2026 03:10:12 -0800 (PST)
X-Received: by 2002:a05:622a:51:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-502a168dce3mr131051131cf.4.1768821012235;
        Mon, 19 Jan 2026 03:10:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm9989219a12.31.2026.01.19.03.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 03:10:11 -0800 (PST)
Message-ID: <e0147302-66ce-419e-b421-fe850f8489e4@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 12:10:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: qcom: Add SoC ID for CQ7790S
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260119095907.172080-4-krzysztof.kozlowski@oss.qualcomm.com>
 <e4761a54-a172-4dfa-9223-0013913bea08@oss.qualcomm.com>
 <f41a692f-c3a4-4948-8179-4628542f90f6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f41a692f-c3a4-4948-8179-4628542f90f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: h9XOZtCU2Zz0zRf40hs231kDFHKkNXN9
X-Proofpoint-GUID: h9XOZtCU2Zz0zRf40hs231kDFHKkNXN9
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e1115 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=hJn_KU6Ox1_rRmbKeQEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MiBTYWx0ZWRfXxjpQ6mfA82uD
 BTC4hgHxOqBElVJWkL/dSOItLUirAyCiax7XyFp5QWzHxz2lZGmxfN6/81flcY3hnGXCzkvlz9A
 s1egKVuB+LeSOd/JuRslvdCTN33zQbtpcR2CNLehsMV4jGklM3Y6RyxFphJejJJ30uDsOTn4h68
 CZuLhNsl8+rxJlU4a8u42EPOAaX03pRcdZmSNsgTLZoXGMCQlnfkXrDCWtPZanP3yfvPqwT4m8w
 YA8MNfQ/gUTvI0F+97G7P7Mm+mixNpLCkffXAMk6PiOFonSzAjI4gmojupLXps6q7S7lwsSX2gG
 ig7lcfjAZoeI9HEpO6iVDF/KS+AapsX7pAI574CQYDpWbe7fhf+HDK1CvIS3Abal4X9DNEmhVIc
 4ZprqjZ4uFkmzdFqbzJGwLCkhu94ScQ9RLUW3lDL7L26L4Z1i5oagbfadq8EkGWrWBlZVUfgIgc
 vzIW4JJ+umA2VuxQNRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190092

On 1/19/26 12:03 PM, Krzysztof Kozlowski wrote:
> On 19/01/2026 11:50, Konrad Dybcio wrote:
>> On 1/19/26 10:59 AM, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> This is early and first/initial posting for upstreaming Eliza SoC, e.g.
>>> CQ7790S IoT variant. AFAIK, there is also CQ7790M variant with different
>>> ID, but I do not have such hardware, thus only "S" goes here.
>>
>> If you're sure about this marketing name being assigned to a specific
>> SMEM ID, those *never* change after they're assigned, so it's fine if
>> you just add it to the list
> 
> I don't know if I ever going to work on the M (modem) variant, so do you
> want to document it just for completeness?

If there's no internal reasons preventing you from it, sure

Konrad

