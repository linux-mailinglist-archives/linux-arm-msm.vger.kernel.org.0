Return-Path: <linux-arm-msm+bounces-113835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rIqLLr81NWqHowYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:27:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0F66A5BD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:27:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DIJvPqJF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ccNPBiet;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113835-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113835-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19CE63006226
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315C237BE97;
	Fri, 19 Jun 2026 12:27:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D423822A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:27:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872047; cv=none; b=tauQdm9u5cm/Gc+j0p3xGW8GpTSzhOdqbF/oRQfIKXqmxFM7seV3Oi5Wn2LOdC7ZnRy409QfIu5uGVllgH4VoIQ7U3MxT+tKHOwha443LeihDL6buxWan2R1wgzFCCoS01i1Ar3OiVo58jiiMUuEv5If7t6UOWuyVoRGocZmqGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872047; c=relaxed/simple;
	bh=fWcd8x9WRUM4AyT61kXPm9zIVnVRJBvv2UiCOqbzvhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oS96W9Sst0beEwi5kCzQYREyQqB6KC1rwlCv/2xiw4/bzaGilSVbh3vfFbXz65knxwXFdtudipQ9lBRfHujsnmGi/gAi+kL6qEgKLay49cWc8/yh2XFgTHapxpJQcvutj1gR1erNiIaRPyKkV866uOoep0yXZc5WBHic8xHpBrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIJvPqJF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccNPBiet; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Omv12257756
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJtzor6hok/hXCz+J7+lfRaLPvh76kZDiiQ4BelNFZA=; b=DIJvPqJFgI116vxc
	RwF4jnWvLaUmPOjFuJqAahDqbDbSqrgS6IK3sEJM3Tk5q5F0M3MXXOCPf7soNuDr
	ufo1mB16b9AsMc7UVli9xUiL0aMtwVRgDa9f/48QZ0BnlPXNFMLCaEprSQwcG2bX
	78C1vPZUSCsgsGYdzKCG6l1ZwZp3hHnxaVIAvLvFIFy1ycjpk+aJ8nNTSODzAFOq
	GuRspN+8RCr7GJOdzCmyiiOOYrTLhi6dZ67issct/VS+xLhBln4qH5nD3PDL4iuQ
	wZhK579TN+cKOtNSv/m7CINhZ+hf1zRdIzv6pqbDFjdtozRXlplmqQYAklxTuOrz
	sQnGuA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyrbfmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:27:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915827fb1a3so36424685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781872044; x=1782476844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJtzor6hok/hXCz+J7+lfRaLPvh76kZDiiQ4BelNFZA=;
        b=ccNPBietZsIZGgSTKn+qNQMO1agLKT4Jz30VHHtXot5wzXxj805+NnAeKquXXYJbKZ
         IM49NW5STJxinz5K+MH7XMsXtgntvWGtk6aAYw/fsQdzwlztlUdOULcZv7GIQQNGkPtL
         Ml3VCsRewmTtKwe07WbtmyGKTAkBGKzJAWlxTaR1B84llcgUt9lmdNdwHF7Fj+OzDshB
         V9FBoTpWY7Vr4YexlSRr7vIHKE6DrIxXdBAtzHUsTYR+HP4zqvVSjwWd5DPIDdEr15+O
         /Anx5KFgWgcxMnE/c4H98RmhZu8ZwTu118Jor+IOr3l11/9TJrit4/O60LD2NSVAW3um
         7hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872044; x=1782476844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJtzor6hok/hXCz+J7+lfRaLPvh76kZDiiQ4BelNFZA=;
        b=MVh5TZ2IugbHuOEktDtx6NEm+8IjLMEApoM8IKMfiRXxfvxRaDAnK+aN0wdLS/+mLi
         Av4gCAvpBGKVZay84VVB47y5zpA60S3Y9lnHzMyUBRzmB0U6aXQxxp/IPk0tdEbLLFW0
         Ko5xzSiSByPBnHTko00EV1aMwVv1V3S6GGdOBBdVNSGW7I3/SdsDJo1/nSv/rInR0lZb
         BwB7qeMGmi/dPqbZspsl3dsmENk8o6VhTv5a1kviT3vY0FkrAEsDyB424F+9gP1Mvwou
         FKtguif4jtYwB0QJWCt35bQTj3s/ZuDBfFbi1qh7hHxyXGklqG0OsXX4hccYFiQeli7x
         OPrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mGnM5TvhvwzE/m4qUtDxHGku6QnOg/EEkYGCnqcDX6BUXbb30Gh4g2D2WmZD1ae+6Ht1N5DhkNwbjtgeS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj6r+j3mic9BPENtR+p0Fx/BoV1aEY1njKAyTsAC29aBS2aBTI
	ohArEDQB6nI1SPDNEGrAAerEEbPndkJ0dYPU2vfrhJ29VDYBl0Ge9HJHO2C1F+HgtsHXkUvMGTr
	U/Cd/zfgTrR5e9bWjiczqLfeu2HeoYedw1tqV/oqe7ocrJrCwEuFa4zK3Mog/43Qvcryhe+WhT/
	G8
X-Gm-Gg: AfdE7cmRoPe0Hhkt5CvdwSGJAcAe8C0tVJpRnlhi0DU+mom/vy5/nP+vDfYuVIMkgmq
	kh/T9T8SZDV58fbActRxNzdj6SVlx6mTkDuuz/Y8q5OAEzD8lDlTIbsUEqPJiuSHjyhzIehnOcb
	iRCJ46RtvcagI3gxdiYjK8LvAB8RCHL18qd6f9hIAf4Aaq8bOfbF+t45wxlAK0GfZPkGQ+hszmZ
	N3UsRp9boJDZFgTH+qHOTTlHmF7D4HauWXpHVlNoW9LUe7vWLHpFH5NZIlGJggo+ID1sWRY+r7a
	PDiWhgyc4OIhmPW3dflhYs9nlDHFuUh79tvX0Thm4X9vunjEBdNwT26lUqhXyzsOaFWgokv5SCx
	FsJ93lGe0cGsE+kPh0JLQOLMeJdNiiLDVi9o=
X-Received: by 2002:a05:620a:45aa:b0:915:79da:a898 with SMTP id af79cd13be357-9208ddc459amr314791385a.8.1781872043988;
        Fri, 19 Jun 2026 05:27:23 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:915:79da:a898 with SMTP id af79cd13be357-9208ddc459amr314789385a.8.1781872043521;
        Fri, 19 Jun 2026 05:27:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc75eb7sm848648a12.2.2026.06.19.05.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:27:22 -0700 (PDT)
Message-ID: <5621f70b-984e-4a65-add8-a9bf42e6c0c2@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:27:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4>
 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4>
 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
 <178073918523.417326.15121723011916371966.b4-reply@b4>
 <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
 <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com>
 <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
 <12a8cc4f-3c45-471b-8a0c-f7473cefa190@oss.qualcomm.com>
 <926a0fe9224d73e0f5e3f58f3769c6247b1cabd4.camel@iscas.ac.cn>
 <7ac67f89-c6b4-4e0c-8eec-1e5c757777ce@oss.qualcomm.com>
 <ab5c5f53-4119-4bbe-88ac-e2933bf6f8d8@oss.qualcomm.com>
 <cd1910faf5b7b20d9154798b05449fe30cb1cba1.camel@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cd1910faf5b7b20d9154798b05449fe30cb1cba1.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a3535ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=fGO4tVQLAAAA:8 a=yin6UPGNur1Ke3XWWOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Mehr5u7duPZjCCvgrmV9jluatvaqnZTm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExNiBTYWx0ZWRfX3dpGHEobhAKW
 yzKumIn6oswoXRcR/z258DrU650yWpUXTi84XQ5FifPDXRw3K4of9wdv0OkAmRh2NlfPbIb7hfW
 Xmg8jGT+xjtlCNTkL+p8YwfpWwhT4LC7hF6Vbs9bO2hgymCqb1J8f+BGipLiD3I2yK7LawhSVnl
 d2JpYGmrQOmPSJ+8uGIJgJXOVmxUYHSdxT1ljmkPa62VnQ3wlr9x1wRZL9LEfUDD8ziJOc2BR5z
 1sYtalpF/h2K+leGltLh5IVvbF2ARzHnvy0g83uz514poah+KCweWkwP7MHbFaajTumeNEnN6QV
 A3iLMMaMQxEOfUSIkgyniHB4mu5Iho1UVlIG3dw3pfNprqWKdXqMV1TGNss5tekP/8IO/dHSCGR
 RslL7ahZnhEGthS0LI/Pr0VAjK/GWWOx5jS5ULyPmrvILzrHl76zJuLgPZdKn07IM9IsHS/G5jd
 TWfe4f8gH1PKHCsc5VQ==
X-Proofpoint-GUID: Mehr5u7duPZjCCvgrmV9jluatvaqnZTm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExNiBTYWx0ZWRfX76KnKSWPWUf4
 EfPvQLCVS3vUTzcWk+8Y/7f3XUmA7GrNhaZzwIYJhEJMOnrHI++SNeT/e8uNGC6HXE1NuwXc/5O
 jLuHMdlAUZFEn3wu+x2UBpq20uNetTs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113835-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,gmail.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA0F66A5BD4

On 6/18/26 12:34 PM, Icenowy Zheng wrote:
> 在 2026-06-18四的 11:05 +0200，Konrad Dybcio写道：
>> On 6/18/26 11:04 AM, Konrad Dybcio wrote:
>>> On 6/9/26 5:54 PM, Icenowy Zheng wrote:
>>>> 在 2026-06-09二的 14:23 +0200，Konrad Dybcio写道：
>>>>> On 6/7/26 10:49 AM, Icenowy Zheng wrote:
>>>>>> 在 2026-06-06六的 21:51 +0800，Pengyu Luo写道：
>>>>>>> On Sat, Jun 6, 2026 at 9:21 PM Icenowy Zheng
>>>>>>> <zhengxingda@iscas.ac.cn> wrote:
>>>>>>>>
>>>>>>>> 在 2026-06-06六的 17:46 +0800，Pengyu Luo写道：
>>>>>>>>> On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
>>>>>>>>>> 在 2026-06-06六的 17:22 +0800，Pengyu Luo写道：
>>>>>>>>>>
>>>>>>>>>>> On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
>>>>>>>>>>>
>>>>>>>>>>> The magnetic keyboard (USB HID) can't be connected
>>>>>>>>>>> somehow,
>>>>>>>>>>> others
>>>>>>>>>>> are
>>>>>>>>>>> fine, such as the spi touchscreen (not upstream
>>>>>>>>>>> yet),
>>>>>>>>>>> which
>>>>>>>>>>> utilizes
>>>>>>>>>>> DMA definitely. My config is here
>>>>>>>>>>> https://pastebin.com/SdjuyJYk
>>>>>>>>>>
>>>>>>>>>> Is this a defconfig?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Yes.
>>>>>>>>>
>>>>>>>>>> BTW it seems that CONFIG_ASYNC_TX_DMA needs to be
>>>>>>>>>> selected
>>>>>>>>>> too
>>>>>>>>>> for
>>>>>>>>>> exhibiting the problem (because there should be
>>>>>>>>>> "public"
>>>>>>>>>> GPI
>>>>>>>>>> DMA
>>>>>>>>>> consumers to trigger the stuck/reset).
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Is this still necessary? I checked the fedora
>>>>>>>>> discussion and
>>>>>>>>> your
>>>>>>>>> GPI
>>>>>>>>> DMA fix. And GPI DMA is only for the QUP-supported
>>>>>>>>> peripherals as
>>>>>>>>> the
>>>>>>>>> binding mentioned,
>>>>>>>>> devicetree/bindings/dma/qcom,gpi.yaml
>>>>>>>>
>>>>>>>> The devicetree without this fix seems to be still
>>>>>>>> incorrect,
>>>>>>>> because
>>>>>>>> with the device tree fix even if the GPI DMA driver
>>>>>>>> misbehaves
>>>>>>>> the
>>>>>>>> system won't be stuck (although it will iterate all GPI
>>>>>>>> channels
>>>>>>>> and
>>>>>>>> then fail to function at all).
>>>>>>>>
>>>>>>>
>>>>>>> Back to the start. You said some GPI interfaces aren't
>>>>>>> available
>>>>>>> to
>>>>>>> HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a
>>>>>>> quick
>>>>>>> test,
>>>>>>> and spi6 consumed it, no stuck or reset. Could you give me
>>>>>>> a
>>>>>>> unavailable channel?
>>>>>>
>>>>>> I think channel 0b10000 of gpi_dma2 could be an example?
>>>>>>
>>>>>> It seems that 4 channels are tried on gpi_dma2 before hang on
>>>>>> my
>>>>>> gaokun3, but as gaokun3 has no known serial access, it's
>>>>>> possible
>>>>>> that
>>>>>> 0b100000 or 0b1000 is problematic.
>>>>>>
>>>>>> (The reason gpi_dma2 is checked first is because it's the GPI
>>>>>> DMA
>>>>>> controller with the smallest address)
>>>>>>
>>>>>> BTW I just took the values from Windows DSDT, which is quite
>>>>>> conservative.
>>>>>
>>>>> So, with DMA_PRIVATE set, is this series made redundant?
>>>>
>>>> I assume technically the trustzone is still protecting some
>>>> channels,
>>>> although the system stuck issue is fixed.
>>>>
>>>> This series should still be relevant, although not so emergent.
>>>
>>> So now we're down to the case of the TZ reserving some of the GPI
>>> channels (presumably for locked down/TZ-driven QUPs) crashing the
>>> device on access, is that right?
>>
>> i.e. now, is requesting these channels through (wrongfully) enabling
>> the devices in DT the only remaining concern?
> 
> Yes, I think so; although I think few devices will use GPI on these
> devices (usually only one or two SPI controllers according to the
> DSDTs).

IIRC there's a configuration table that lets OEMs decide which ones
should fall under the secure umbrella (although most never seem to
change the defaults).

I don't think we need to care too much about the mask being ultra-correct,
since as we've established only QUPs are "valid" consumers and we're not
going to enable them globally by default, since there are conflicting pin
assignments (i.e. there are many more QUPs than allocated GPIOs)

Konrad

