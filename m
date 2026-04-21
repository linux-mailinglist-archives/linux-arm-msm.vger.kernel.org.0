Return-Path: <linux-arm-msm+bounces-103886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA9lBEEc52k14AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 08:42:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A35FF437119
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 08:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A79D5300832F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A32736826E;
	Tue, 21 Apr 2026 06:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ReAmCie4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8mCDWH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E93B175A87
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753680; cv=none; b=IIjfKOYxk3hgFf7z436hZ2JfqAY/bOnTKxaFxUr4gF/ZPj9/WECpY8t+BfEwRg7tAsl59C4fZGC+tL4dpsZQUvKUl8mGHNN/I12ZJTrX0S2FrhZhXZY5XNL5mKIxr3G6GmlyQlIAqWSwee0JgQqQl1EuLb6AqJjUS02c0eBilaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753680; c=relaxed/simple;
	bh=PlNAEK2MREKPKi+CUNE87aVBIoieZmPQ2s/p2webbR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FvDUkEI1xyGGFI04sJNCIRvpCgIKtnfRa3azBTb5Ke+0cIQeFw8EBQSxvV9ORv837rcsEysuHqXmEPzhEkmk8aWE/0mmJSJBY2k5egPu2M0gHEG7U/u0Y+1y4Q5CcJYWDd/RDz/dvcDnQjNRbXTE0mtj/FUKjLs6y9DYz34o3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReAmCie4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8mCDWH1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6eP7S3574129
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5aSPEr1jMglDPSkMIfvoub1Dfs4pzrG5Kt/zN9avIW0=; b=ReAmCie4h5iLL+NH
	Pc5vedg1a2P0YBZHbqCNk715m0TG6Av7aoIvks6QkcxYe613fTh2kNsuZiY5LtRY
	sllneh2QJRVbMkbvQ6ZWWxh8EHr3wW6pIti3BT4R4GitV/FDD9lRaT9XxhRC44/U
	EcJ/UN8+vipMm5uCuYTsLfE2EgjIR/3EanEWh7UDvqjKXj1rsq3DaxpvN96w/UkX
	9AlRQHxhYLF9+qY0EscnY1narDJ9BVyiyDQAOFcUBWgT1PXiodu+YwGiXDkPfD6/
	Ur0kqARUXwiRji4KvD9sEdb17eA3kDwvQ4UHPGgICA89GcTwQAomUp4Q7R+W09tE
	GdCDow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465g044-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:41:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3c7b989so6569831cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776753677; x=1777358477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5aSPEr1jMglDPSkMIfvoub1Dfs4pzrG5Kt/zN9avIW0=;
        b=W8mCDWH1vsP9nr+8ebdge3nbJakupYKUO3eaOQuQsSC2tOv+9CrK2kPCvd42OUATzK
         XYRWU4APv9XFpuhfhKpO2GVMcpHv/3IxIiP4HLuHZQshsW/filS662MGjfeTCro4Euby
         4424W+JUgcsYyYRqKaro5DDru3TFbNjy3msMTZkgbj3VK6dFZ/lgHQIf9NHR3Ou63nry
         axvWVjaAavykpBjdI1ciFh1lfSZf4Cfh5xOhzMVar+XC9ad1D1MbAMGImeCLrJJqH5RM
         4Iq9z+GXA5m8f8LnKLhhdcrz4ttM0nKWb4H7Y8XdG3PNKjhuoydi4bOID8hRs/Yvaqbf
         BJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776753677; x=1777358477;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aSPEr1jMglDPSkMIfvoub1Dfs4pzrG5Kt/zN9avIW0=;
        b=CMv0x5rfz38RL9SsKZpJ3zwkxedwSsE1f6cs0e+r0vNnv4ksvwd1seyG2AOMs5z7x7
         +erbMOYTcyBNMXbvlg2LUvbENiLxm+FQLZjhELD/gtGcYrz8UUT5Zrk+Sc+jj0ZoywXA
         EsfP75rU0yS0UIfK8T91XXLMd/BhITxOi+pUR1gh5nGBt/YGGX+/x/Bkc8maJpvUteyz
         clBAf5qSBTSfugKdH/q0uZGbjRIsdiVh8vNeiXmO54lNnTxpb60kD5cZRRjroPBVI94o
         ooooImoR3WsvQpgVEKO5LggAFcNb6IXRpzBVe3OvKgvt5jn3qdYbT/Wmjy8pVlecPOtn
         wp8g==
X-Forwarded-Encrypted: i=1; AFNElJ8CPs0w2mWLts536adRWk28+R/9VgALbRFSTsdQm/om5DDmhTXPj48lAwzgxQF9eMCf5arhSiyTfYb+s1Ne@vger.kernel.org
X-Gm-Message-State: AOJu0YyXkOFEFARvr4CNOwOmO5IigEvhoaXJU1cFTLu4HTNEFWp43xCm
	QOkD+oQttClTK0q8E0oYm3kDiqUColq9aQG6BoPM7uw5JTcvBR74ZmSoZcU537PW2WNY50ycVIs
	OZzvImKwoM7XFDZ70h4EB/DjpaQJrhLjC2ljZ3ZPKYFFj6HeTH6PBR7+8Uh8DOkjackis
X-Gm-Gg: AeBDievRFpFVXLcH4ryxyvdRrGs8cnNSZwutBRHB2aILRvZEgystG8SWfzRanePlP67
	Du4N9pL1kXj4ztbdJa031tXzrkIDM4RnUk4YCadSum9u5uc3nJSgmfkoUYRKlNG8AQjaUBK2d7S
	IwKROgpeGT6+JjgM1mW/ahCUXNIeBUQpEgLdxy6RU4mY4SM+QikbOEWkCKNH1YB2gh2pVTAQMlB
	TbAFQuhRRkxoLsCQP+zufnsF+8Y1inrQVOhyapf7+jgwR5QwWm4BsQrlypBxl+4UJQ+OJEBy1g9
	HL841FcqpuH4sr9MTFBKLWu8yfC4kcEAweup2P1ThrIdC5J6ipJbrFcLs3QDMvsQrM+RnOV7I3f
	X8Bx4LMuyp+XE0AcqYW9hfnquGp32eVVPvhmC0seXX3r48vBMfNjDDoq7Y3U=
X-Received: by 2002:a05:622a:1113:b0:50f:b17d:7e57 with SMTP id d75a77b69052e-50fb17d80e4mr30180331cf.24.1776753677561;
        Mon, 20 Apr 2026 23:41:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:50f:b17d:7e57 with SMTP id d75a77b69052e-50fb17d80e4mr30180101cf.24.1776753677157;
        Mon, 20 Apr 2026 23:41:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm135449345e9.9.2026.04.20.23.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 23:41:16 -0700 (PDT)
Message-ID: <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 08:41:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA2NCBTYWx0ZWRfX6u964jvnVoCp
 8jjfXWjO4FJnhsBcOe/0uaRXTXFb4RbI3Iq79f1/MNuHL8SK+hMCBsZ3jTO9Dy5Gee8JtIIVP3j
 I29ukSHCJUlMG0NuM4YgQIZtqrY062Uoyb9nip7QH2Fj5oYAKngMbOdnMWVAcnSt4AK5zZVbtOG
 AYxKFq2k5iEbEDt1TY9YwdsVfWkyvxR/Wg0X26mikVM0og7Dc+daAD2nUxcWuF4MhQGRvkoebg/
 rU69eZs8W3akKmE3XmrUzrzPKTWG6MeLFp5p7maHTrWOYbVKIqXuHp72mPudwODBnO4a94tJG/A
 QEDCbOFCQRC0AwrK9Esm+W3NOY/W/34B3mkRtHH2+Q8bAth45aesAORgEcakxpeN/lU0uItpqax
 22FB874qVmE30BCYyFqBPr0EITc3/b7xFfku/Nwy39/3/VNvB3a+t8zXvIVJL3/Rkc8v+GtjTkV
 Z5+PkTiwYZguNWistng==
X-Proofpoint-ORIG-GUID: hB_ElAvQU9emRfl6lKKkUgDoQMIEpw4-
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e71c0e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=iykdOGEOP-tOZIlZroMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: hB_ElAvQU9emRfl6lKKkUgDoQMIEpw4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103886-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A35FF437119
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/04/2026 20:02, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
>> According to user manual / programming guide there is no separate PCIe
>> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
>> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
>> is marked as the main block with additional sub blocks for each 4-lane
>> phys.
>>
>> Describing the sub phys without the rest is not correct from hardware
>> description, even if it works.
> 
> Is this the case for the other bifurcated PHYs?
> 

There's more? Oh damn...

Best regards,
Krzysztof

