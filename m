Return-Path: <linux-arm-msm+bounces-100302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI5xAEp/xmlTLAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:59:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDB9344A63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B986530115BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4393BA226;
	Fri, 27 Mar 2026 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTxLJmX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNG6qGZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44C63783AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616014; cv=none; b=f4hz9q/LJZyaiyuncO0C2hXa7W/WUjWqdbc5XiWjTSqtcuBwIeCk3rXoMbROTaw1iK5EMjvhPhpjHG04ElIs04kUyXCpG6vyUSEr2ix+pIHy4DwDZIu/TVWkUgXbBw3kv2g8AZ98+/OD134HKGTstQ1sEF68Gk4aSwgBs1X+ObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616014; c=relaxed/simple;
	bh=82hBkgUQBRYsEeYM1Pt/3YAGZ95NIaM+aAvRhDaBC/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F590gE4d/dmjqW4Aql22XQnclOQ56+BR9IIl/KO0kCyJtzdQxQ8XRiVwlQZpdDWFuciwGV7JmIOF6DcthgDWM+z13lqSdGmvpjU/2A0NR2mauTmXaPNsEoIjWJl0gf8BHID3QNNWRiUu5jKF5JflNa8g9zw8jm9/KFiET5kf1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTxLJmX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNG6qGZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vhtJ731304
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=; b=QTxLJmX1xYvlflEM
	7OSRLyfE66HZq8dqabIU5HUK1AS5eKSTzyz8PLle3UkpqXOqMd7sd4NwzXwe2csL
	zTUjLkJBRLPSYs5XnNZ3giKZEcO8S+6X86yL5zglgq3QPRng33vJgIkQgaoVpfJw
	VpQ2Rire22tEXIyd263tPkOjpKBD4uYKHZSrr7KHNu/1vM6lJnTTtSUT+rr/9j1n
	6+7BwPpZx9n0eEJ7RmjUMP760lyzXTBwbrZfjKA3QNY7fazSVrVAkdk1hfAsc8w+
	IcgH6R5Hl37BGBmwAM0Cvz3iKqDySqrcmiDAdv8GdD0XZ8oEKr3JHHLMqVSKG3wN
	2IITsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q3d4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:53:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfc4ba4de0so67517185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774616012; x=1775220812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=;
        b=eNG6qGZEP65LDmVMVQPmT5iM1HoHsg57gWwxyRfdTCLzUdSYIGzonPLMsosxQoYhhi
         lc7WZy29VHHpb/U1ZupsjsWs57xiBIsgcIGwdMGrXgOuLjUVxKPsEhiJ1EdSNZ2oaJ7V
         29rDHY7dqtuvHtWxATVX8a4E6x4eSUTMHAK5pCQTn75trTIz6cqMtNXor/kp+3xp0JAm
         WoukDmcuqp1lqvHnvo6zY9iyXYImoNOEMBV0PJ7ZjO58R2TF4Byf26/YvSJCUN2dH/nW
         dOsqwiVJ6Qwdv3/BAIEBVOHubABuEuRqp8oHmiBGOHPbUT99ESHsdZr7ldRyQHdz4t3F
         0FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616012; x=1775220812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=;
        b=gh+95itQVhiV/0iNczvi72vCxK1ygS4iknFanYSUrxN20+gBnrYkNhNQhwvoYcwv8D
         VWX4G16VcRC3myDLxJojOgtvau+Id+oRuN7vDD8dHXSUSTdkZ88fvhFGHZBJDP4GJYjv
         /vi3CaWMctP2HwIVliwQZxZATneVeVEnunaQDEs2fe9r9Zp05HjZZK3B+iQM/mKQTHBE
         ZlpBBVLWFUbY2Mzupn2gfJ5UOxqJOOYFT8rrACKPApZXnb2NPd2waUTgDk70EKc8hxN9
         Vg5OiFOivqdioIPSorpmLMTLY1/E+nlx7FYgek86E8CEs+STQbOpOVO4xQu6NeFe+Ry5
         p5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHdbaUoT44v+Xxva8+SZ0cFlsNo1sMrrhOy8Ya+M49zQYe7HwL5kXxHyoGaAeO9Mj0t5bk+t9ylRgp4HUR@vger.kernel.org
X-Gm-Message-State: AOJu0YwAQVHf0HfUq1xnMNS657WVKCnIu5qRbUQM5Dskwn6ABM0fskCN
	P2sGKjYnWA7OoPvMxZvCmdgdjdtq5whCLUaKmuSPI8SdSZTs+zLTK7PjfegJmkQw9x/NJRZ35Oy
	MXQvkK/E1t4y1ASKNL7AtToCsdTJvaNwpgtPpRsmTzyMIqPew5uMQlF02Oy6FYWwSyuSx
X-Gm-Gg: ATEYQzxBeMeUPLGg7Kk1rK/DcKKFkIdq8ZUyS99v5FYrRFfgLtVxDI0EfqkiZ7GzCFm
	VMyKdS7PR+epNWVrqolD1gaqk/m5Fnfus1vecZOMWWXM03FhrX//IBNHxyD3wcTRASgsE9vgbsK
	mmBOWBABzYB/+vTsPT1S/3M6n3J0Y5/OFQ1kEdOzSKLxJ6RBuqmRZ4w1MXPM2Bxu7fbcLw1nO8X
	du/BJGNJuaokuU2vwCCh0NgqRAjt3NhKxf+8wdJXq6vvXJJJZRwFveSwQmZPQztAJsC5WPxFjyV
	ComyV4qd3ckRyn2EfBxCS4hLsOc5wiGiUaXAMWajRh7UV2XFN7lZHRInhJDVEA+1ASPBh+dcbM/
	zV3ABh5KJ2OqcMXJYgogIMoa7HtqlVO5deLW9uRa1fCZffX5ZpKb0eYJhtnttd4IcrSF9XuQIqn
	RqLX8=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24444091cf.1.1774616011810;
        Fri, 27 Mar 2026 05:53:31 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24443631cf.1.1774616011338;
        Fri, 27 Mar 2026 05:53:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2029be87sm248918866b.28.2026.03.27.05.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:53:29 -0700 (PDT)
Message-ID: <66879526-15e3-42af-a2ed-153f9cfc66d5@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:53:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
 <94f4fda4-504e-44eb-87f0-e34e557402f8@linaro.org>
 <471895f6-dc60-44d8-84ce-8ba0069110e4@kernel.org>
 <xSErLOaV_RuZ1DggWWH3WGK4mpUp_7CrvmjVU4ZZd33l60PWpjxiSGID27A9hHbdDYmghPXgZONyhiTJ_USPDg==@protonmail.internalid>
 <1671b8ce-cbf9-45ae-947b-f35d174be93e@kernel.org>
 <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 29Etr_3DGfmKtsk7QvjlINtNAwM1sXvb
X-Proofpoint-ORIG-GUID: 29Etr_3DGfmKtsk7QvjlINtNAwM1sXvb
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c67dcc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=13ZpxKrbrQONVxPmPHwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4OCBTYWx0ZWRfX0vuL1S805x7Y
 FnXigJSY2hcqmr4/ldVBfvoT4xE3U33Ae7MO5eh4CmAYZTv/HP8f4byqAsqvvIOkJIA8jpqosbN
 1egslumcjcHI17K1u6jbHYktkocuFtgnHXASmIyRee39YHfg2JZAw2sX/wwdz4/Ny6D7QODzL3K
 Pmsz1j/jZBaKpWn1zHZGoCku3Mtk9qQY77wTkff5DYEofSibBadYcw8D/l9r5TsUU6p4tDqbWJj
 pM6/2iuwWLQld6sA0Herj1v4RkhcffGbFeV0r9s46+OZEltSBqw0ppoakL6jbHuYloONbCzZjV5
 ZyxE2dmiL7PjuL/P3wj7uXEfDks6n8Y/Vob9Tszk/0/N19N2ijzvmuX71RlStR2RrNaE2xPBcgH
 HCmujWxWLI13B0QZ68gglxFJMSX4U5Zg26wvEx/lN55WLW7M6RXoYFfQYAn936x1zQqUPRJLfY+
 UZBoHRoXuoIGEoFM/Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-100302-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CDB9344A63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 5:21 PM, Bryan O'Donoghue wrote:
> On 17/03/2026 16:00, Krzysztof Kozlowski wrote:
>>>> I actually got the idea from:
>>>>
>>>> commit fe6a952b567f6a771d087d2e969914f31574d6ab
>>>> Author: Krzysztof Kozlowski<krzk@kernel.org>
>>>> Date:   Fri Jan 27 20:40:50 2023 +0100
>>> If you refer to my commits, at least read them. Do you see children
>>> there? Yes. You have none.
>>>
>>> Plus trying to get 13 year old legacy device without dtbs_check warnings
>>> is different thing than correcting a recently introduced bindings.
>>> Terrible example to take... And if you find example from 20 years ago,
>>> it will be even worse.
>>>
>> One more thing, that commit was still correct because it fulfilled the
>> simple-mfd requirement of lack of dependency on the parent. I do not
>> believe your code fulfills it. I am pretty sure it does not.
> 
> Yeah I take the logic of that point:
> 
> CSIPHY here depends on the GDSC, power-domains and clocks we've listed, its not being supplied by any of the other blocks that live inside of the rest.
> 
> They don't require any resources from the parent and the parent consumes the child phys via phandles.
> 
> To my mind that fits the criteria you've set of !depends on parent.

FWIW the problem here seems to be the assumption that:

"needs to probe child devices" == "must have simple-mfd compatible"

You can just add a devm_of_platform_populate() somewhere in CAMSS probe
(or do component_device like in drm/msm)

Konrad

