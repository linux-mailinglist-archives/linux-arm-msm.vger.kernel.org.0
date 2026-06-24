Return-Path: <linux-arm-msm+bounces-114288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9TMFDTeFO2qjZAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:20:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2246BC1B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:20:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YeoHuvbB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bnGOS53T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114288-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114288-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EC65301CA6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBDB392C52;
	Wed, 24 Jun 2026 07:20:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0FC38AC90
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:20:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285620; cv=none; b=LCvo3roNiGKX0wX1InehjyCqAtUI996EHFd/KqFNsQwdh3ngKuNSEZ+WKQhA247vdbjpsYH6OXU+PRd9YRF0W5p+D+z98KprYrSrP7hkGns8NhT6XmDtc0Bg6WIgGU7PeFWYxKLuH9O3OdJQ+ap4VMrtYPls1tTpas+xEh6GiYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285620; c=relaxed/simple;
	bh=xlY0uacPa01koNo1kE2f0hDhz5c8EWJ31wVjZqXkscM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVekLXFV6D0tFVpwI8kANUTQsr8qB52lMbCFOO6DintJJwmrf4o9306Z1rwzQ6k3FOJ+SSGzyZWo3DEz+1pF559PAGyZbFDTKgdQ0NnajigS1vB4xzmREaRKvArsVeGHB5gUv7GVChe04b+IhB7O/7V4d7o0O6k0WdF6+4fid5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YeoHuvbB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnGOS53T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O7HpTC3753647
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwrkizMYse0bcX80v+kV5BrSxP1cuVvt+qMAhQ+ZeWo=; b=YeoHuvbBVxVnUEKy
	FDPm+q5O2hu6yTQaExhdS9jB7ne2OpxgHjVd1OUDhk4CM1E3A0/0Fsu2MB4Nt2DK
	8aTnqTDx0ka5eBPr8ajQl1fepxW5cTyDwXE/jEe/cmtZFIhqxjgjy+pF+30kEXo2
	APU+w0El5yWrfKzRQgyvd85HocOhr4yeZ8pu5pfuP+Jtf08g7hA6DX2CUv9OiwNk
	n1Op7N/B40i+xRWloyLg4+HZYbMUaRifu17ZU0wniyrda6eSfplfx35zLEiLPtY/
	ayLpGe4Eo8Q8cTvvUCdek/LQUrfbWhM0foW0H9z96TVE67TbNA02n26hYDb26wIL
	WEfvKg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp80am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:20:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0bf6904a6so10390065ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782285616; x=1782890416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwrkizMYse0bcX80v+kV5BrSxP1cuVvt+qMAhQ+ZeWo=;
        b=bnGOS53TI6iVlW9M50eyz6w3QQGhYgrzoplXfPpIH5EFIqTA2SqRfNbZwo2QXcTQFI
         TG5rGGarnYw/0dsgIiZEmuYJGJi7OD76A45S2wnYJeGJv9T8fMgJNoh5DL+6YJa3YUWX
         FtAP7tqk/MF4yDQbDGSPfekuGUuHf+EOKcNCugQyMWgjOLJXsJdsVbXBLmSf6VR6HmBK
         GXGraMkMjxRYzWM9xEjUJVgA+DDTvUbdW6dEus2yHllqCtGhhYZcz0tYBFTjghJTsz+D
         NmoMyaUmUVDxcn5IfIYcevbC+cidg+4WCgHbpa8udxshL5aVQGYShON1FkpveM3KuMIg
         55Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782285616; x=1782890416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwrkizMYse0bcX80v+kV5BrSxP1cuVvt+qMAhQ+ZeWo=;
        b=clt2PT8ssd7orCBi8q3u1u5iqzaQKHNfsctN8hXu7oklD4RstSQU3WcMce+nD3lSTG
         Nl8n5BZZqZh2ZRgqJGKire4wqBH+HFmdZ2NxiWQE9nbHCaxnDBRjd6ZWForotAlH2DFF
         D5Ua1NLa64Ff/j4CV4uWgS9DgtSpxKSZrEJQ67EIls/jY/IitfMOtB8ncBoWGndWwzR9
         II8Wo++B4FsvEVTmthjdJLAVfJwXzFK6wf/OIhJpqY/PTqNmiTlUeqkZM8V1oj3R9QE4
         ECzAKK8aN1FeiwU8rnqMPBetfTptj+/4Xw9t49U0cwdcgXO00TCh/Sp+nkj5UbiFIuHv
         b81Q==
X-Gm-Message-State: AOJu0YxJfOY1qi6w5eVzSIdI2tU1765VSlbwUfspdpopkK1BsAeEuznM
	CK6vkEXlJEAS65mxYri8DCV+tb5biO97EdfpL2KwE8TEC9Gis5TabUxbE4NuVpEPuh1fcSp1aOL
	NnDPViuHNesMH8QXa8fpwgkVti7JcPotLHswEge1/z9JZYeFuVn9y8o6hhRldkD8Qe1cr
X-Gm-Gg: AfdE7ckc0Ik7tsddrSDRWXJTe+NGj+YiCRuNxAPRGcN2k/R/1w5O4W7Jas14p69notv
	Aoiw1eDEJerOS7N+d0fePReNDpgHJ4sCHk/zjB1rxA0H97SWgr44sfF6oPxU/nULcn1ePdlCfOZ
	AaafxDfjoVddkvV6/3O5mWd6SWeIZMVMbrDOaE5aalQTY1PfxKrUk5KDpr7zCtc+FwwcBva8aUq
	hgmc+jEBW4aCwCrBA51YV8rVOB0+lZaGBRMzc09LRTErOHC8pp/ddtMWrHjL9CZyXn/hoUxeM1k
	RJfLvCJ+cLwGA164qsVe1rvaZndsY64S6LPavVvb+refpFBGA240ou/+TX4QLetlnWLd1wqY8gn
	MwT3nKoB64b4wUjO8OwTRKdK+JKlFb04agoSYregN9H7+Fm2NgL01OXsXXgR50TuWH5MmGZI2cm
	Hk72mB
X-Received: by 2002:a17:902:d54f:b0:2c6:a2a2:13c4 with SMTP id d9443c01a7336-2c7e14e7778mr25647865ad.24.1782285615573;
        Wed, 24 Jun 2026 00:20:15 -0700 (PDT)
X-Received: by 2002:a17:902:d54f:b0:2c6:a2a2:13c4 with SMTP id d9443c01a7336-2c7e14e7778mr25647445ad.24.1782285615126;
        Wed, 24 Jun 2026 00:20:15 -0700 (PDT)
Received: from [10.133.33.188] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f86d0sm119429115ad.40.2026.06.24.00.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:20:14 -0700 (PDT)
Message-ID: <be2b54a5-ce9d-49a2-80e1-60da874350d9@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:20:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] input: misc: Add an initial driver for haptics inside
 Qcom PMIH010x PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260617-spry-greedy-chital-1276e0@quoll>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260617-spry-greedy-chital-1276e0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r1X0nCGOmUhLnZZJYahjky-xuf7YiNVd
X-Proofpoint-GUID: r1X0nCGOmUhLnZZJYahjky-xuf7YiNVd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1OCBTYWx0ZWRfX+ySZT54sc+CM
 uLu5KIfCs3gsD9tsWOcYVUAepINO5mDNyP2CN2Sq8NzQzXUv3eZkj6CkHA7VTBG3QCGHga6tRe4
 kxyfG9FHFNqYPF+luIFgtsAuD66Bqz2fJhn92LfgCX7ySFCG2tURwBPbMBTAMVleirnPBmXdb+g
 tEE5f0bNJmysVsv+XbzKHCMov+N7ZLcMkIWRSgMNv1qTwFxE+g6nZhS8LQBvywKj1qJYJtZgHKh
 tzZzTd6MtKjz2GRVSKJjiNZEUOKvbv8JN/WUyVqPDaHxgfM888HrG+8bv3pNHAmUkyz7XKsZ3yl
 b7F4NSlvJHPBGDHJcGq2I+FofUhiQbZ5L43TOqRPjS6hGEMJ/XaEOpym/RlpuYeD5c/WrUZ/ZgA
 FzjUHQGLMq0nMgihGZYULU2thql+DtoeDV1aNHPQenb9p4fycWbkERQmKN3e+JTbyExqIu/mXkx
 1tUH9KW0L0spXhqD4FA==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3b8530 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pZM1ahQh0IU9lKbVnbAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1OCBTYWx0ZWRfX88edZtfiIUSr
 PTKmwxx0UAYdIwRlUPJptogAHiszuSYf3+sjmyF/xIpY1p8ssZQrVdpkiQ0g5oFkyJ4pKjk5cK6
 pu0+ObQToBsG1MyhnvfytsXwxBs481Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114288-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E2246BC1B4


On 6/17/2026 6:42 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 16, 2026 at 03:08:23AM -0700, Fenglin Wu wrote:
>
> Here - the first sentence - is where you mention merging
> constraints/strategy/dependencies. Your MFD patch depends on ealier
> ones.
>
Did you mean that these 2 MFD binding changes should be listed as the 
dependency of the MFD patch?

https://lore.kernel.org/linux-arm-msm/20260609-pmg1110-v1-1-6604d0adc907@oss.qualcomm.com/
https://lore.kernel.org/linux-arm-msm/20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com/

>> Qualcomm PMIH010x PMIC has a haptics module inside and it could drive
>> a LRA actuator with several play modes, including: DIRECT_PLAY, FIFO,
>> PAT_MEM, SWR, etc. Add an initial driver to support two of the play
>> modes using the input force-feedback framework:
>>
> Best regards,
> Krzysztof
>

