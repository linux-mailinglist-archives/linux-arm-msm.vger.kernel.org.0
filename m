Return-Path: <linux-arm-msm+bounces-104713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMpWM6xR72kLAQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:08:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356A472468
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3C553013A83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4F839A071;
	Mon, 27 Apr 2026 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoYa1Raq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLg9lzBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D04830E847
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291689; cv=none; b=q4L2ImlJarWW9kb8O9Cx+er06oHV2XezKDkCJOMNoqJM+gSN1TSqlhP3Ibl65EZwXIQCdbUNGwYKYYj9eVZ5aFLTJA3xZV+S8C7BlZB523gOOaQXylEsj/FMZDM0YhaQ+Lw3frfHnu/mxUhe26sPuKsJyxD846UcvlB01XgV3So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291689; c=relaxed/simple;
	bh=fm5CdSFWH2gts1XSzN9LOLLdkXFIsyZlJCPnuFWd7ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kugC3LDuBaHuW+Aof1cCMfJ7vEOP6s+NJ0WT51UOikS+hprTHQGQunS8K1Ro6vyyCTbmyzA00qoUFlq4IVygAu3vaBpA6TgvI0EUL5LejVOoSLvOawI9Y2+AyVTEE4JkE32A1kgy6JrNdTYGCAA7blf+IDtzJhsXk/4XFszv84o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoYa1Raq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLg9lzBc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T8iA2913809
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHua6HX1regkBEurtpMi1d4OCWJUsb8/4s2U7NhCHbc=; b=OoYa1RaqoGylt4Bn
	ceR5jorAivst5Xx2Tjx8kG1aOeu80mZtbiVBzqmXgGPxTqZEwQ4gWwzmW5njCcQ7
	6Pse8JrCnvforMTNVD7MI6itpJSz8NoXoGLKj+qnpetB0YZi5aIT8+vlZ/OqQO5d
	c42+ZfhLLnmjAEQrlj7pcgMvX6NcYMaz2oQgn1zyZdwEk+VNANqJiY3aitoihOeq
	p0i2AKOjHdl8MZU7kgZQyWa2XeH1SN1muoDAqVgU4yp1Lhmcvws0LB6KHeV9kVvQ
	kCb2hFyPXoDQbQisTO+ZDs5TMZa/m3BMuzsl5LScCxAWGN9FOcBlQ7/eejrEzfbr
	tspsXQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xhccr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:08:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56d9f191c00so425994e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777291687; x=1777896487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHua6HX1regkBEurtpMi1d4OCWJUsb8/4s2U7NhCHbc=;
        b=hLg9lzBcoeqpMzYcDrstdqx9M80SbkZk9LhOM8Kx/Li3IEud+EwhrkDi8aQTS5M+a8
         Mm209JTBcg+tCyanHxok9+AUFC1vOxbh56+x8iZO54M7XpLrAu/vI2+SEepGIUF2GtuV
         rSyKjgrwzKglm2YtKUsBtGwVuQKVaQiq4hadcLERC2RbiaRM8cR/k4YRKt/hQgfXoEcU
         0NYByUHZvsO+elOujj/FlM25e+5kFh/YuyBF2qxALzSIbVFoub+PLrFvr5fQVLwpwsI+
         XNKFXfTgDW4ie80LpbY+RjztJc1PS4pS6Xn6gB/vuomnhb+L0OwAp2FI9yCNJfCICaj/
         rlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777291687; x=1777896487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHua6HX1regkBEurtpMi1d4OCWJUsb8/4s2U7NhCHbc=;
        b=L91gS1GCRvcOC3MxAJnmWLyI/8kDSKVGvoa8gmhUJz5ejYYQjW8+mebnindk1nPt6E
         8JCBcj78DxjyVo2ZM3Cl8i0hQrMJI2EbMIj3lyTY8kJWUZxU8AQFxAXx37q/yh3Zvzph
         MGaLQ0AJ+5Tv+waBl/VKq4DJxEb7id3KdiEg9Lsh18lVh9rlaeUZaxYHXIhL3In5wcv9
         U9s6KgHr1Ai8xd0elqdYWzmVTmwJ3bKNsNeM5xthUMz7MY+8R0pnmT0j4LosyaJTlyOD
         PtVzrp4IHIE+3dEmuwFzZOB4ugVs1nAwJh2OJin09LJjyOx5AzGFeWm+ufCtH28Cv4EE
         1m7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/GqDnq57GO6m6kWsrJhWVUdyM727u/RQZpPCGZBJGNDc1KkoGqCCgoWeKb+95w4HIkhfgXnIJdh3hs+uu0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5uNX3RBpCNZv6oUS/s2Qn7valmUXHrjJag4HMIaZFP+NU9o7
	NKsYNhEoHMU+KxV5+bSgLNuqv/+xn42Mq2ltcegeA96XyiAaXatMACkKfCvmRY29hMz5oNWo0Do
	PWoTlXQ9QNtihqKm4DzXy1bSN/zQ8Is2u4EQKTAyuxbbBHEWnXdx9LO4tkPKm7gkRA+Sw
X-Gm-Gg: AeBDievsa/6BowzLnxZ1vfTdsfWSGED/V3O8m/Y0SveK02qbYmBSDUUq0M7jui6lNQj
	z5smFW+AG7mtMZ5CoW3lfwy1Wd/WVoAG8QkYE/IWrkLf79mG1pp/BeKGpLWtv+n5edLfPsIAp8C
	sGvI0UGv1R1JkIhGk1KUe0yJwXjD5bSQYVM4J1xFSIOvrkqk46C06LampHNw43l1Zm5uIoeuezM
	nJ0OypYeH3E0eSQtR43MRWcPMi9Ac2mHNIXduBJPK4bWCy+cjAT93xteZ5NBB9mgXQxOaGehccx
	gwCUt77b4/1W88pIEeMeXyVtqyrDtRHcXPO8lObTZGLSTKlZQfJ9lqKavdy+ZaDP68obZ60i1GP
	3yS9otF2s3y94fi/esop7ZYvFx/p6ewMHscDy6ulxnCgM0z+iZs2ZHBTFelPHib6M/L5Yz3EJ4r
	IGc9sCi9SFi7HY7g==
X-Received: by 2002:a05:6122:ca7:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-56fa59b864dmr8922083e0c.2.1777291686827;
        Mon, 27 Apr 2026 05:08:06 -0700 (PDT)
X-Received: by 2002:a05:6122:ca7:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-56fa59b864dmr8922062e0c.2.1777291686396;
        Mon, 27 Apr 2026 05:08:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480d735sm6859937a12.7.2026.04.27.05.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:08:05 -0700 (PDT)
Message-ID: <f0e5e2b5-d050-41d0-9798-c62a9e59ba14@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:08:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
 <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
 <6b936613-4859-4f73-8593-92180aed16e7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b936613-4859-4f73-8593-92180aed16e7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AewgLyx8j96Az9NxLEVYBTHBpGinXo_e
X-Proofpoint-ORIG-GUID: AewgLyx8j96Az9NxLEVYBTHBpGinXo_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyOSBTYWx0ZWRfX4FgsDlVEs35s
 9laRR4wKRfUurvKSUWQH9Vt6ayApS92xcMVxwp3si7FWkRQ7iy++AwB14v4N2G4qOyeqYMSu1j2
 isHqYyeM/12M8SABDMVXkEm/JDpu4K6L/yjP4jjlKs8Cu6ZXC711+EmlwgYW6m0T1zQFy2IHI+u
 FFCUltVqvp+h/hr+Ix7Db+vJRZsyOvECAMMduUXEPUwHwaILkK3KrICZG6EduNj7zASEc4ch3Je
 aHjJRM26jPEVlqsDlvZvRyiPDTeiTRveinmRp/02IsI+IEvlcUV+gCIXJ5Zx5wfa7YtTSXb4LBT
 aVyaIFju8dn2VRawREJ6Dpc3WxaZQFy8ssrjmgrN14kYNF40Gvx2Jvqd9rs98zlGnO4zepxOGlv
 7D2cG+9F6NwJ56VYENyhORljLF5o58nk5VRS7X4GX9eGW5JR5xMgsxDkVZKDnBv7eOvJN8UGLWX
 4wiZTMWqhZjBcv5kc9Q==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef51a7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Gv3PURsRAAAA:20 a=OuZLqq7tAAAA:8 a=8E5acIoqQbxLt5TPCTEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270129
X-Rspamd-Queue-Id: 3356A472468
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[9f800000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,mainlining.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104713-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 2:00 PM, Nickolay Goppen wrote:
> 
> 27.04.2026 14:49, Konrad Dybcio пишет:
>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>> Downstream [1] this region is marked as shared, reusable and dynamic so
>>> describe it that way.
>>>
>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index 4b47efdb57b2..36b419dea153 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>>>               no-map;
>>>           };
>>>   -        adsp_mem: adsp-region@f6000000 {
>>> -            reg = <0x0 0xf6000000 0x0 0x800000>;
>>> -            no-map;
>>> +        adsp_mem: adsp-region {
>>> +            compatible = "shared-dma-pool";
>>> +            alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>> Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the RAM
> Maybe you meant <0x0 0x80000000 0x0 0x8fffffff>?

No, <0x0 0x80000000 0x0 0x80000000> means "start at 2 GiB, until the end of
the 32-bit address range"

Konrad

