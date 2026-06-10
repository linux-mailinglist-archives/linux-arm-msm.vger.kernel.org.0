Return-Path: <linux-arm-msm+bounces-112492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RffkIONrKWppWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:51:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB180669F51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:51:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dyYOlNNT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TaVLVzIk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112492-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112492-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEB70321589C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAB5408035;
	Wed, 10 Jun 2026 13:47:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22833E314E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:47:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099223; cv=none; b=t0gOCQAi2KtUsIwWkNxax8DcNwJOPuYy+l2yEKa+tcyKKwehWeYh0rS4T8O4pqflroLBN0PWptbILct+aGoS+DxfiEAMdEZEYqomRiI60C2S5K1j7+pXyNd8f4Zu0JyeXXJKoWBvHT7UxFlmcQe9+gxZ07db8+WT26XU8EEnmDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099223; c=relaxed/simple;
	bh=r+mQKnhrfih3eudQABMsb/sQMtoEYwF1GLwJmoBcbdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLzaqk1tRLpCs1QpJpuY1ZFhhqmOVEWFKeUrMw57z+EmY0d4cWAIoxDDzdfWoQIQOCSYHfJn5fgoA/Wv0ge8VAihEV8USkdz7l0kYqNFoBltRuBWq/CaJzg50llJ8Pz5EY1HBhCZMlI0TYl4o4rXldVvfAR2XXFiKY/7fYSDWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyYOlNNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaVLVzIk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCH2S1472585
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r0dYlM/C6Sbdw4GTkP4X9ZZpNBVV4Tmyobxb7/dNFug=; b=dyYOlNNTRQ4KXuRW
	XIIXevIyNKePinC8xjUEfEZ51bybSOcGSicRRIJC5diVUUDGLLMjNpiXSw/MKLEJ
	GFr2qFpUxecY1LROtepNAaz5Ul1Q1qDJFS6/E8B3j0+S9vmtZG5VjD9bjdCzXXtn
	M0+Qsn7s/XZfAAHtQoJWF/7Q0+3bo94U0aZ9hW99ZMfE9EJ74xDRfCDWp+RN8axg
	zoyOMW3IuC/7wZhBmrwUHTQ483jIlbaLGJwYmQJAZFm//R4CsM2eDemfAvI0v6EC
	y6K8Ds8iVHfEZq5lNyWKo0PPpDZpjCf1532qKohWfDSChgQ1+0PX/vito0ALUC//
	ylAOAw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kda3u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:47:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cc6b92b8f3so221190137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099220; x=1781704020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0dYlM/C6Sbdw4GTkP4X9ZZpNBVV4Tmyobxb7/dNFug=;
        b=TaVLVzIkJ9XJcePaNfQsmHF8EGPaKrGWdZqPD2SHQPUozoHodIMariVVMvkDPm93YU
         3DDqqERqvr0cPjv0hBtG84lzTAx277/a9KTFc9FbYRUxVtFHf8VSB060ThLkK4KLt6wg
         GMv25v3a7Jd+3DAZ7izoBQo/f1zcgdGd/Aw+wOo7mDNpF2FzMQQDvwrQU4f7UAAMF/cb
         G9u5uTuwVB3hTPFcw7gbKXWB5GIAX/6TiWkMsO0cgT0WGSgiFBJERun6Grc3lR2xJhd5
         O/bSpXNt6L4F+jXjb4EEKJp32MVNsUXDKPuNKGhil4YHSjkKeyl0ULlFX4OZay1z2k/k
         9OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099220; x=1781704020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0dYlM/C6Sbdw4GTkP4X9ZZpNBVV4Tmyobxb7/dNFug=;
        b=BmVsImm1wDOlSlSBowABTxzNqGjhe7tF7WWPQAH4ix+dnXfOjupQzEWM/j49PQfq//
         FczJFqKIgC6EtT35Fa4rFupkzhnYSX77Ay+fHc87/F6URkk/bN+Rh08a614lYvTUZtGd
         nGtU6Z+QDuNg2jYCg7/y/hCls/ROAQBTcnJTZYpNggcc3gQEY8R1vOGjDw/tm3zZPu+R
         qtxzPjoRUU4zz50eIymwugIxAupIN4Yp9Jcsln2PDY2p5Qu7iLNNQxhsXW/frdc8mfMJ
         IhqK1a7yUxPVbE6jZ7e4s0hsPGH1rRjQU85r0iBuxUgOGdZvpJcIAl2/35YyWuR/+2kg
         28MQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Nbv1BDFDYM/eQzYi++4qs9NLq7xgMerHbzgewjxL8lY6rkYGdBmM80tawZcE/1bunxa+y/ZrFpYyG6Q69@vger.kernel.org
X-Gm-Message-State: AOJu0YxJyl6+hMUX0Zss4ot+8zPcqHGYOSBaYB/P9PGq6zcJoOx3bqLg
	eXErKzPjj0jtX/XURAz6WE+KHDTRINK5wtJyVQb3CsEQrEGa4cBa9eHviPONADIwMZ2l/3PAA4P
	NXSKrt6Tb2jBjHaY27+sH4n3KzY1eQnrVYyOfWL6OCnzpg5FZhUdzrZO68CNBwVUYJbsXSBZzrb
	u/
X-Gm-Gg: Acq92OG03BnllQrIP9zBT9rof8pBfOliU1AbIJ33ug24WBAYyWOBRNbpMVljNl0awH7
	uGOs6N1ycAcVJQoHyXRJvXOYl05j8ey0tj++v9ois1U2nQUXGIdPzXPLygyDFesgW26J+9ibEvZ
	l/G5eocmXmFjCM84bp99p47ejtFmbJ5Iwb9A7qfw88EQU8UjG7AIhLd5evinBva+2KOXc/cLDMk
	RDt8lYJJ8iJmEF6oOEv2OZ5N+mqOywgdW3z4WWI2JOvnjccg1vJVBIZ1GWlwgmv1T2KTEnmJz7+
	LPuOEV8akTamI1jh8fV7oLpl8AXWLE3ZrPQ9z3GHl8Ot9Me+589WmnV5vWwdzKRXrPxf8BcNPW2
	AFrlRPKUMNKF3p2Fx496NsBe/b0wSQd+DrVpaRUd/J/uTPgRxlfu8rVbK
X-Received: by 2002:a05:6102:689b:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-71926aa00d9mr1583080137.8.1781099220381;
        Wed, 10 Jun 2026 06:47:00 -0700 (PDT)
X-Received: by 2002:a05:6102:689b:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-71926aa00d9mr1583055137.8.1781099219881;
        Wed, 10 Jun 2026 06:46:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585185csm10035790a12.16.2026.06.10.06.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:46:59 -0700 (PDT)
Message-ID: <4b7c43a3-4d3f-4122-97e6-f0522322070f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:46:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] clk: qcom: gcc-mdm9607: Increase delay for USB PHY
 reset
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-6-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-6-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a296ad5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DdRk7HRULw4uXnc1SswA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-GUID: dBPffnCLBy2rbDdkJ8QVNOvz55Iw_v30
X-Proofpoint-ORIG-GUID: dBPffnCLBy2rbDdkJ8QVNOvz55Iw_v30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX5RmGvcin9E+d
 MWSSvv9eDrJRqmcdX2T09s8OBup7qQ9icrlbu159zmAA9WxTu5tSGIoqhISecWyOPJKzOdi4yOT
 dT7ozids0LevM+nhAYl2nrd8LQjqc5OTBj45BLhEy8GiakUXO9g0ZpkiRXUOg1BgspMX46is5TE
 2EUDH0QyyA1u+xgQ4oPaxML7M8NY9ynTMO7FO4+sJ3ky9LUxGWZfXAWACtunXSD/pwJjCuap/Ys
 xSJyegar+kYPXlHFvJTf/bz5LHFz1gwxk/J1ibJ/lVp2PRNH6sdD8sXSiTeuLxzTs8+gXwH+1I/
 ZIIWFx6So5saa8cMuRF2fYZ32UL8/vaEmyo4ENwZ36rwntkvIM1hOcS2P9N35wNXT29Vz9Uaf+A
 JRc3bxK9OItot8OynZi+d8wQTa6TKOPTSb/Kuib5GPWRpZllLZ6abqrmkJQTqjo1DcdUaZRet2M
 eEEHAC6xQ6Y4pJueE1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112492-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,gerhold.net:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB180669F51

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> To conform to the specifications of the USB PHY, the reset signal should be
> asserted for at least 10us. Guarantee that by increasing the delay for the
> USB2_HS_PHY_ONLY_BCR reset control similar to commit dcc6c9fb7128 ("clk:
> qcom: gcc-msm8909: Increase delay for USB PHY reset").
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

I'm still not sure if we need the extra 5, but one does not reset the USB
PHY repeatedly so it's not a huge loss..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

