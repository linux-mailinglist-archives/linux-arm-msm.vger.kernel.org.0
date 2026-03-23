Return-Path: <linux-arm-msm+bounces-99809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO1sInygw2kbsQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:44:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01B3218DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E72AA3005640
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276103385B6;
	Wed, 25 Mar 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgbpngZh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWtos+Vf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E076C313E3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428213; cv=none; b=EFiZpH0UgFVglqE0dI1o1ai+YHHNm9fvoKWkBpEJ2+/MiaWwUh6xiLWlA+e7qxr/ixj83oW5zuACYV643Lf5/uSKU6Omvhuxc+FgTEhZpy8rfs55lDnpOGdKPF1FNbUDLagjnK6nPYVv/YTa1c9CMinmC3gCUkIoAEMSozinUz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428213; c=relaxed/simple;
	bh=PfgQkrfYdPNctfp9CKFj1h1fAMaZukE9EODqpjh9ztw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obQH7nD1bwZD5t48ZzaX6qZX94Yyig/yhDv+Ba2uTo6/kHfxNmHefd3Gdb8uSzfxKFgBQsAbKnC9fK2yWKUPkKcmIj/i+cWeyFwbBkWcanoWsU0/KvFTjTLtRrkYLrG8aXRvjJ3DF9yDx+D8yFt0ePiF6j7rc+3fm7LeNQQSqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgbpngZh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWtos+Vf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3o1Go1208577
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0GsGo3pNmrgcHbg82tYTMyyK1ijJTCgeoJ5nVlkwyc=; b=FgbpngZhNePEE1mG
	6wR7a95/zCq09kxUmMLjN69hzAY/+gyijgZ0dfzTG+3aAWDe/FxPYivtQ/EREVBk
	TzqCOG2t09ba/DfgKeCCy9Gez7xW1uuz/aoSdwNZUX1jFfRApg1gwIfdqitBwIvz
	vvHWKGU8+Fy/NPUsL6bKGhXgvyI0qdmGKy/YZYi6kUfPkxg7GlD9aruy3swia+6H
	CBOT7MlwP+TOXVR247OfcCsZOXWc4rY4tQpo8lfdXw2XfzrbDvzY4+9Z/tsaABo7
	u3Whepl5ry979lP0n15biBHu+7vp308XoYCRglQ3dJ6XKzxzZZI6Iz6Zf9bHTKav
	iuy62Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d48598xmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:43:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c867b7d6fso37003736d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 01:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774428210; x=1775033010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i0GsGo3pNmrgcHbg82tYTMyyK1ijJTCgeoJ5nVlkwyc=;
        b=dWtos+VfMQj/jbeh9CHbWXXsjXMegY6yyBeA/P4NpOMZUheN1dTw8wWMNqkvtjyG78
         q2s9yNuf1BuNdStkaoxyQq5TLHTEOY8tCC+qCq1Rz/NlyLYwTt5xJVnDAZlRUdn7WirA
         smbEdxP0fU4C6Az/ht9RyKLO9Q8t85PNfSTn6PLxo2WvNqtgb6c82wjIKDJlz+hL13dQ
         fA52wmZfU+eRQ+0cakvCMBcwRSYMwdX8lM7xMGP0U058agtuL5TneH8i1ucsFSklZl9E
         lPsDYo7+7RUrhUA++E2tRsoKmRgUM91ZhrO/9ZrNiwWVEN1ZH7u7ngotkHzDWHHHpg3e
         SwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774428210; x=1775033010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0GsGo3pNmrgcHbg82tYTMyyK1ijJTCgeoJ5nVlkwyc=;
        b=eOTJKQQorJb9MTH2txxTzmj/zaDDoGrdCFR/8eobSsCfbqcy6Xe/Cedaz9vDgZ5sMG
         CyqdnR6dp+EWZ60LYwXVvmAMywstrTkKbxhKjPu1JnyXgEF3VYnnql9pEybqnJcy+waH
         FT2AJko0a1RtAxyLlyrTpkuD4380GMG+qTSvaZthorezpRjLYlDnL8lUa854AZs+phY+
         dw9Qr3lqs1JtyAAJUWlS8/HR/f4N4mbOL+N41dsCiZX2siMxTQnsZrTNiMOjp7bUoe5O
         YNNCR0TgL94jAF6JEAuURsbzhk6i6u3jMASxTeYDpYA5/a2LugJ2r/MUB6IG98Q4ltyj
         Quqg==
X-Gm-Message-State: AOJu0YxcK9VMmrc0oAQi0GfF60zmQvDUjpwv5Uj9aoOl+1acsXxuFL0i
	6gJL1VVFLUDDFAR0jJ3EcAOMWIa/gFHOdRx78BwoQyv6YLU1TMNO9i3nRTvK+20tvoJS+PlqttH
	zRZIvDEMWyfBFg4JA0hx7LLhusKieEkkHSXx1VEMLwMKscEEac5tKQGrt5crWg/RaD1Yr
X-Gm-Gg: ATEYQzyWnB+tUBbof50Xi1wwaYOTKs1LGUUtR5teRqbAkYt2WlUZAcO6zQg/nTaO+tQ
	7Sy+UZpoKdRtvuImTjhJF0hm2SNGqndzUpZCFMg44ic8udEGIhXHfY/VbUqVEbPVVqgWSij2hp1
	U9Dis99CEzeqVtSBsyD26uO4BfOC46JCLZlBt0fD9oMLWB76fYkTbzRafaVeTEIB+F1bSmlDzGU
	vjUgK4lpBx8uYsed1EDv+octUX/eqC6y69XcNn/R7JC4nNmdruQIr0aEF9fTnFjLwbtXWDmRdng
	y7Ra5hsGe+jT3Snw4Mw2WBtWksogAIp+z+bEB4mXRTwmHsfCnbZk08gTJaiRjAgncgp29piSBuF
	LMXuGk8E5pCncb5urr1RPBeSSJrxaAe4wIjtyQTW2NErJU6zh+FLuyu1ZOdvLtL9WE/m+unxGGQ
	F1gI8=
X-Received: by 2002:a05:6214:ccd:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89cc4ba5220mr31450496d6.7.1774428210338;
        Wed, 25 Mar 2026 01:43:30 -0700 (PDT)
X-Received: by 2002:a05:6214:ccd:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89cc4ba5220mr31450366d6.7.1774428209934;
        Wed, 25 Mar 2026 01:43:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8d3e6sm762953266b.20.2026.03.25.01.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:43:28 -0700 (PDT)
Message-ID: <3004a905-d454-412b-b10e-a0035c76fe01@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:43:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add LPASS I2S2 pinctrl
 definitions
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323095247.92890-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323095247.92890-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2MSBTYWx0ZWRfX3oWZSTxIeLqo
 9V3j0DQUSqyyTWURjNFId9xSHNWlg2c9qIDYe3EDrYvo/LOFk16UJJXZD8faHzlbx5vc+4MZDj6
 KMR1nC9D8hm8NxaJqSyuvnxzuG4+306KMxOI7FwHWs0xMYytwcmXYkwMfA1t2ZGKP2xl8TeD54S
 +rzERIdSLVdXwJiUcjHHV8NhvDm9VOplggbaWpwa5bmP9t/QJAM5WK714Opq6Zz0oGAE1fM/Wce
 glKrysogg7Q44RmiimAWEJ+E5XyRufwy3IwBgL2qJTf6rNpR5KyLvtssHaABMfc2rfaTa3eBBaX
 BBgt9oiX6YaUyc5LJhTuAG3lF6SuJag+nLaBBPgQ/RWCan4IfbS9FEMvdR3vKNOab3dsEywwGcK
 7QVrviUSIBuFT2vD6Op0Iw/3lCvWOPblmmn0PCAb4T3rrt0ymSzzAHFmkfyVvAG6dzPh6uDS3U9
 ICuHadVxkZp6AU2PKrw==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c3a032 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z3ui5y-J4bSPkrMtwxMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: FKB9KTK_4bgRA3IwzbrBQ3kDtqFbIHAm
X-Proofpoint-ORIG-GUID: FKB9KTK_4bgRA3IwzbrBQ3kDtqFbIHAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250061
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[44];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99809-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF01B3218DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 10:40 AM, Val Packett wrote:
> Add the pinctrl definitions to configure gpio10-gpio13 of the lpass_tlmm
> for I2S output.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Similar to ff9c117c32bc6ace7 which just landed, this is for the other MI2S
> interface on there. It is the Senary MI2S, so actually using it requires
> the series from [1] and then more changes on top, but I have sound working
> on my device with it, so let's get this DT chunk in first / at the same time
> as the other prereqs land as well.
> 
> [1]: https://lore.kernel.org/all/20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com/
> 
> Thanks,
> ~val

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


