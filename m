Return-Path: <linux-arm-msm+bounces-97484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHERCZEItGlvfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:52:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FB2283416
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 493333002B4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C9A37F8B0;
	Fri, 13 Mar 2026 12:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPAp0SYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBwg/3xp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4937F745
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406348; cv=none; b=vEoOIRq3hTh7mW7i1sjKGPxybwMbXnkcXyKlVB+9pqq4eP4wh3nlnJQgiY2wK0IAFyNbq3G7rXkNF7eedb1krQdXV5NRpyOn+C4lMQGp6Cb/aC8jWPlcBsOO0l4o30MoW2zHAFyfObQlNPIsrwWDQqOY6dqh9oYSsUtirz5awZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406348; c=relaxed/simple;
	bh=wtDbhbmNnfEqEzyJzSlKLMntpH7AqiBe1ctdQmC+84k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMA6Yk6bhPgb4MMWCs2MTmvQ6KG1AAiXmc7bIMkCZbEd/7HiWairXm5C9kREFXDurABn4TWHYr9wSBWWm6+yyUNVYnLhD2+6ftzjco5VXJ/Wi9Z5P82cqTyu+XKwlG0pdglSFD57rYdo5/f8fSkwnBcnrwmXnby5b9Vz2wewadE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPAp0SYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBwg/3xp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DC9bfp3229721
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bfg4L5JUbKgcj3urNnjZrvnI239bwc+beH+6JvGVSxI=; b=oPAp0SYRNQn53PhL
	He7aTOT8HZrsHCQ7npPny19iaISjT1FhvOMwq6B1uoY8sZeIHdbmEccjPkqwLeUi
	xDJGsDbGzNCHJEHenSiG+1r1XN+vEShtyFmF7vyqLZnFN5ap/UtWUPNfd/Ajoysc
	KwaE640CMTwEFvC5dGxnqCmr0Y5WI1gff2bASYpVSdF3JDdJNuGwg6h33OQ5lsST
	8v2wDVzC/Tlz69SbkEMd24LLuIRHE0bBhZLsXu/+FKbMrWlOcgCIZNbVAC7GfDpP
	we561h7GIpCVnlc0NLOnzBQQlvz+C8HM2U+lNYoeXHa94r/bgKsPrTlCHGEKppC+
	TdWPwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7j6e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:52:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899efdcdb70so14678616d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773406346; x=1774011146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bfg4L5JUbKgcj3urNnjZrvnI239bwc+beH+6JvGVSxI=;
        b=jBwg/3xpOz0MkqELLun8/T+PU1qphEmacZq40MjGitRx7Wa1/CXjOAJ5j1RYeroHlr
         8BIDWlD8B/qxHpsTu5TGuA0GdbaWo0F3FICMlUV9rRKEj4EFEGDHKpFXU2H3b90zsAYK
         guHefMnDZkhDjv4KezOiGXFZ1TIHN0qYpB2cSDv4c7L9hiy/+WJSwGfoSb1vlCvT1EJQ
         K/xOh+9kIYdFefjejSgEKVtv3Esh6k5cIEgkpUVsqU6/KNSt8cbm7wHy08ZvRRBz94Wj
         quOCVfLyHTbSa+GUVZm12bkgrheIatLfX7qVDZLclwtKx63oAOft8jmp2hOOijx8ZFcg
         HzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406346; x=1774011146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bfg4L5JUbKgcj3urNnjZrvnI239bwc+beH+6JvGVSxI=;
        b=c98LmwhPtGeyxI3KF5x007pBjjKNhQGHZQmAFAfXdxIdb3qiOPxA7Cvmr0yU+XfshX
         WrSPsWNxDiWhphOniJfaHYYj+jav0l8g56Pjg71vMBMuCSj85UfP3CFnikOXTASL2IS+
         WYlYrCuCZjJVt53N/P4x5D8uCHom5hyEab3My4oKH1nQarXfxhUuZFjRs8jZispcYU0L
         SVDoeFO2LMy1S23b0qIEXA/q7hB0+PXA+qkoMybOC2Hh3PgLZ8hit1Kl8Xa8pY994I+F
         LpC9aXvQMqv/5WDdq4a6DmVbYCZDjxUPBe/SvwCJPApfRZnWqFBEPyC6tnQoCtVFZL5C
         Loqw==
X-Forwarded-Encrypted: i=1; AJvYcCU09ymHGJ0EQKw67g5CtM7cyzMVfaiFaIfmzof1I7E+1jnhOBLDnJqSnx7afTLBEi7fCDDy8ev+17bwWFWd@vger.kernel.org
X-Gm-Message-State: AOJu0YzQv7TZ2Y4TekNVHCeeXCRMMqK484+HrnhDZzNbuRGKDBCqZWOh
	8Itl20PNPFfG8PaFOsvTIdUKophojoPBp2ND1+YuGV21tCuQb8m18ZKHn+ytMc8aO6CZ4bNFvOv
	uydn4GhBVj6QLi1W8aRchuUS4Va6k+25GoUT0/aMPJBPLfbVQ4MhuQ+F5C9T1w4dC5YBn
X-Gm-Gg: ATEYQzzm4fzDVhsUWJbEy56fy49S8LgPEjAD1UF5unDjAAXzjJP5nFoRAWR+bwLqP/s
	E9/mMxWqOoUWMzXbuVh2VwYMtRE78dMXGOIZW0hqP1q2bSaZLHpiRxiJDd7JCZBmVWMBK086FmO
	kT18x70Twisf5nPvqeJ0yfNCRJ6qXYnbhQu5Xj1F1gZb+i+/0s3P7QtkReD0kfE8Hiixc77H/BQ
	Yqe7sVPAXNqTCoNmaRdxGs7YHihrxlkLX88HzzhFXj/iWyhAMN9F85r7Pvo4dnOTBN7vSRewzqY
	DlRqt/Zx55tO1+EFNXJHuxwWBQ3IGYVGfDwSms7nQtd8wqOKdlHUg1/aAjmSz5ms3DD+YkW9YBH
	WeiZETqa491dqNvfUYS3jEHuFFop/ybkBVHx6Dl0MqOWN1N8IBONDQkgibmUNtuXPfTjTD2RpDp
	5L0JM=
X-Received: by 2002:a05:620a:3193:b0:8cd:923a:87a8 with SMTP id af79cd13be357-8cdb5a2d141mr327694485a.1.1773406345674;
        Fri, 13 Mar 2026 05:52:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:8cd:923a:87a8 with SMTP id af79cd13be357-8cdb5a2d141mr327691985a.1.1773406345267;
        Fri, 13 Mar 2026 05:52:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc29844sm44696966b.30.2026.03.13.05.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:52:24 -0700 (PDT)
Message-ID: <4e4054e4-6e5c-4623-a03e-2fdf1277a2d8@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:52:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add Redmi 4A
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-6-3bfc23996857@mainlining.org>
 <9b6520b3-aa43-4657-aba0-bba89af8a47d@oss.qualcomm.com>
 <37f385d1ad7a464771e641807d75f5e5@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <37f385d1ad7a464771e641807d75f5e5@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O48AxFMcVyxn2FSU_qPS48EUOiboiCWk
X-Proofpoint-GUID: O48AxFMcVyxn2FSU_qPS48EUOiboiCWk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMiBTYWx0ZWRfX8TgFyjMm8/NZ
 HC7/TghbqvT0T+0Mn1Z5IX0yzIfFdvZH+KOJ/cox35Ja3qnbiqL0NxWEdbDPO/E6EA1IbQHJ4JK
 APbIR5LIbHsN4XhX2Awo58jXUB48Ng8gONFxhQV9pUkZOF8eBtBuf4w3uBoOui5T4VDVVYfgdmO
 h/wvhKVlZLzKiVCfnv7uPHbtj3LhBJqrehcRb6+MhNDb0VTAlvbCy3AC1MuUg434vlPCObAacBv
 X8fx0pLcmSc5uVltSury4kwRLfqY5CxatfoYUt7NW7+NS4DvLKF3jnVFfYWQRhSO23mNmCMBhaA
 cI83y5zy2lkoDRsqZidR/k0kDyXhRCSpsz2x3K2ujvnL/3P65Ax6bx9e7geaxv+RmWo4gKGBz3q
 DqcrS+43yBEI4hs1P62PCjxQSoOPi5krkAAp9dvDERgDKx1qsyCw16wjo2tqE3UleZ4bpYE7GwA
 ddmP+oD7bNPwZ/uzmxw==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b4088a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=f6X2TnFsAAAA:20 a=OuZLqq7tAAAA:8 a=5Mg_qL-c0DIWtcCVzYIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,mainlining.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97484-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27FB2283416
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 3:38 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-11 10:16, Konrad Dybcio wrote:
>> On 3/10/26 6:21 PM, Barnabás Czémán wrote:
>>> Redmi 4A (rolex) is like Redmi 5A with small differences like charging,
>>> fuel gauge, different speaker codec configuration and display.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> I see the Go has some differences in regulator configuration.
>>
>> Does the 4A's one match the existing 5A?
> Yes they are same, l22 is vana l23 is vdig for camera sensor.
> riva and rolex is using 2.8v for vana and 1.2v for vdig.
> tiare is using 2.85v for vana and 1.2 v for vdig so l22 min-voltage also should be increased
> but l23 max-voltage increase is unnecessary, there is no reason to keep downstream value there.
> 
> Here is some proof https://github.com/Mi-Thorium/kernel_devicetree_xiaomi-msm8937/blob/dts/mi8937/4.9/master/wingtech/msm8917/tiare/camera.dtsi#L16C1-L23C65

FWIW it's easiest to work with decompiled DTs, as the include chains are
often very complex. You can then throw them into ./scripts/dtx_diff or
similar

Konrad

