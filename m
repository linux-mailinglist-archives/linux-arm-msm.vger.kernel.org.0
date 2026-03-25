Return-Path: <linux-arm-msm+bounces-99845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNdQLuTGw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:28:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 162F3323E31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEBEB3041791
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448AB3CCFDD;
	Wed, 25 Mar 2026 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NuHgc/e0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtIbaArs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031563CE49F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437653; cv=none; b=dlrWovttgjmLJxjY+9qCyAEwt6Hm5UEBpRIbe8PqwNzj5dFeYFI85U7yIx3Ybf2x4oAYrNZXpELCynibJ3tUY8agBhO4RLsrMxjdQR40b0OFn6obkp91yYuBokcd0J48piwgOnmT3C7CB1VQzqMfv09ci0m0R49FLk+cVyH0hIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437653; c=relaxed/simple;
	bh=MqqPvaCpMUSdpy8bJlGFo4cZtQj3//vtqXYIJw14Cu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2jFMHMkjJ77Fp/RErHoKBnsIPDkV4AmF2/uN/XOzfJu21GZPrGogb1cmBtjRbvY8zXX+MymiNxoLtcF38woe/U+gusl6Rm66kj3yd2jQ1V8Ck8iTS5Y4ci3Ctf955Ny1JZnamHvdpSZcxUYslBER+AVrZO9XCHBg+qFh90WMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NuHgc/e0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtIbaArs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGGbg2197431
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bo04PPluhNxDs3dNvQUl61WfLNkmR2AQ12kwe+gKE2I=; b=NuHgc/e0oACN8Kv3
	HaamJVnrePiqyFWpPCM7S/36+EvAJ1V+MLo3P8Y6ftuaOUcKoD90YGH7aOK4m7VB
	PlW560yrTGKGmSfZia1KW4RhFlCOCOfY+mCytKYUVmLGOPQWdjpj6xi/ta6CGGAA
	Phw2ZlCVZ5srV6VngfQ9mtu3Z2MdELY9W7fx8zL+r1XQUqthusks2V23C9bvIK+k
	zkXhG98nUgVWuoLLYFkThTN8V9hXg49em9Y6gQ/7Vk1rXxu6of27JsNVaz2p+Gu4
	SVph1uJsyyU8H/hdoshAK9SpINESeog4xmgsBcTXZDrRL3n6fvkuCtTXQ/505Pdi
	CCsn1g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d48599j21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:20:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ccb129547so1823856d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774437650; x=1775042450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bo04PPluhNxDs3dNvQUl61WfLNkmR2AQ12kwe+gKE2I=;
        b=OtIbaArsM5sak/2moIaFT7xckJXWN8057ZxWzODOGBwe2UDTouaHBwa0FCFXcqAz93
         x1QggfK5pHK1qiZUeYsscWxyM7s1zLiMks5Y7yqSA/5AXKygur26LZrRIZXTEWevvbtE
         46tbvrSydRsfuHnkt9yyKxwoA4iHcY/HSvMBFHwKSZnSEpXpyC5FJGcjB6sLbsH7oChZ
         uF3ftOCpmVZ/hpghpr+8FteMiiF90xQ4vfe09Bl4H4FsUxwnAA5hI9rSUS7XCPrrzoPL
         zbx7I7iz784LP44xVUzVD5w+u5oL155CqnCoZqmsisvV2obbGb4zE/jdR1f9wpeghI4H
         DzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437650; x=1775042450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bo04PPluhNxDs3dNvQUl61WfLNkmR2AQ12kwe+gKE2I=;
        b=LunPfiUPeL/n9XcO3gVtS/UIk43I5FgQr4B0nfUHrtizbbiIfDZmnRK0AwfLD01EYu
         hQOjMfJkq5flvZKD5N/7J46vJZ0nTUSQXtHDbOHnVvFUr/D6iu3VeZBcT1yFO5GVusvp
         IsrvS3WhPw++2EH0GWyHWYh43zk9xMCSFkPSdkBmh7VeX5tGzeu0xVQIxbHBHs9K1Ht/
         j1X6qBZVKxCplryXF+r/QBG8KvANGNyUyt9AZXrRSpz7pg/AJOYDko67ffOf3P5YZnf7
         6i3zBStiQmm0LIS24jALGsLnKuvMWNDDjXnQA8vxeGaUOc/WuzjEabn3mtTW/rqZJizn
         Bw3g==
X-Forwarded-Encrypted: i=1; AJvYcCXujeH8w2PuEq4FbaZdU51S7+pPqPh0lOwCY8LtqIY3M2QuvQL3XHIPhj4BQq5oBrizXHkmm2tab9aW8p4D@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ0SYM33Pda0nSsTPKmDDhlNM6CTETTd0WmtGT5AhP2PSQAUj3
	rcEdNE4A/QTg5fwf9+I1fVXNszKP5NdcnHeIJxkr/ilIC7vS1uMVvi+GqyPvaUeG5XFe6ibTtZc
	0NrqnI8mBta+PS+LuOJOFNXZ3/9kl3+vh13AM6PH4e1k6c1JSxaAqfsCse4O3jAHRlq2U
X-Gm-Gg: ATEYQzwqAtqA5TtbFB+n/cIzAnKtm4F6kAwBFF8XG9ECqTPZTvfMMRLoaVfke0lcw+t
	N487daKUFHtwoUiqVjiq/IaJ520uOpY5a3wfWywSw02iFQn/Ln7x1/5N9jclnvgERH9CVvX8vXy
	7lMR6jON2ajJBP1Dhh1NHYF6vAi/23rWgOUqYxHDoXFTkjcSNA6jNGfSLv0OTLYqXmyFlLNABDQ
	IJUbRs3d5ltAbC+fhAs1qBZoeur6V9zHaKHLCdSMgnd6d+UeAptkf4PN3QLgMxxDptP3WqziLbh
	WrwiXPahcydAE3kkKD0nbA0bW8+nFrDE/kx/BDaR7H7nLjQ8fPUPZhfbFVIDU1dSTayxr1lX6kE
	93Y0tJQeSEzoE6UABD30qc3owJEpyVOc9SxkzQfN+OJ9/ZXdRjlfi+mVRaXqWiAerexxHcAAWS+
	CbcWc=
X-Received: by 2002:a05:622a:5287:b0:501:4767:a6f with SMTP id d75a77b69052e-50b80cdd452mr30820821cf.3.1774437650212;
        Wed, 25 Mar 2026 04:20:50 -0700 (PDT)
X-Received: by 2002:a05:622a:5287:b0:501:4767:a6f with SMTP id d75a77b69052e-50b80cdd452mr30820571cf.3.1774437649651;
        Wed, 25 Mar 2026 04:20:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de177sm773644666b.29.2026.03.25.04.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:20:47 -0700 (PDT)
Message-ID: <a0da2236-27b3-4491-862a-457a03cb4c5e@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:20:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: David Heidelberg <david@ixit.cz>, Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        oe-linux-nfc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
 <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
 <9d9ec994-c954-445d-97b2-772614d66f35@oss.qualcomm.com>
 <041766dd-422e-40e1-9e5d-c220580871f5@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <041766dd-422e-40e1-9e5d-c220580871f5@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MCBTYWx0ZWRfX5XD8hRS9nThM
 XbchqeM2mRkpua11aJ/VyDoHDXFXsL5lC3kdVRwUzvrqBjuxEiL5kWXYkj0A3c3Kn8sqPyLO9Ar
 8e6nmRxvNHn0ysY3gBduRPLTzOGeLCX84e9MmxKE9+Egg3srmPerdsfGDKMeT0T9RHHGTCJIHO/
 IH+exGsXsRqjPigphTe4SWFSLZYNLsZEOtjKpsjzt2AqQmOki2yN6bj7cAuSHL+Eh8nV6tRn1Xb
 3aZKQs/nXuy5U+6Cowyhtj5QOPgyIYrBbL3zno2ihXu1C+iCz9vSrRkdbGzxwdkwDWAV+xQjCpo
 9tRF0nTcNyVjeIefMN6Q3rZ72F9MHb1Gp3J4WSkl26ac+4UW6SsNzq9uFjqqjuClSlhxp4aIYyZ
 4vdMF3rJ14gjCgG1hcM84OfGAT6h9f4sU+uLP4dE+jjTrc0LJkNKDwpyJ/ZIfEW7Bx2T8TKt7Os
 xOlQQKwZCHXs7/nFWzg==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c3c512 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=uWvuUna9Uad_Tg1iXS4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: mWmFjphSGTsiHVlRAPyI3b1TTJM6ri6J
X-Proofpoint-ORIG-GUID: mWmFjphSGTsiHVlRAPyI3b1TTJM6ri6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-99845-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: 162F3323E31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 7:08 PM, David Heidelberg wrote:
> 
> 
> On 24/03/2026 14:12, Konrad Dybcio wrote:
>> On 3/24/26 12:20 AM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Definition of the NFC.
>>
>> "meh" commit message
>>
>> [...]
>>
>>> +    nfc_enable_default: nfc-enable-default-state {
>>> +        pins = "gpio12", "gpio62";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-pull-up;
>>
>> Are you sure about pulling up an active-high pin?
> 
> I'm not sure, but downstream does it (and "works for me"). Maybe Alexander would know more details here.

Would changing it to bias-disable also "work for you"?

> 
> David
> 
>>
>> FWIW TLMM subnodes are best sorted by pin index (although the file
>> currently doesn't really do that) as per dts coding style
> 
> I assume when I group the -pins into -state it doesn't apply anymore? As I don't feel having pins relevant to one device / subsystem all over the place is extra clean.

Krzysztof?

Konrad

