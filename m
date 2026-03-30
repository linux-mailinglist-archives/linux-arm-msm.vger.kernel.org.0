Return-Path: <linux-arm-msm+bounces-100705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IJFOjI6ymnD6gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:54:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85F3578D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 812A0304B5FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AAE3ACF12;
	Mon, 30 Mar 2026 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joVVJ1ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQYROjJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128E13AB260
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860445; cv=none; b=ASs2ovJFzuGwZXzLI+LSX+axgFds6J6ASzq2JS79fDI7UlAarjcLHZmlvBKLObOw0wH6tyX45OT3MCAwChtE/0mVE+bsDAl6IYpEBG+TdtDwCnzRbjYbcm2f5uweqLl4nWWb6ywaYQOE3DHEoLb5B9PG2XhCsZ+G8DjqVglaJL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860445; c=relaxed/simple;
	bh=a/gjeWvGX0wqeqMWQ7NwqlnvO3TANHHy9zGxY38C3lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OP+CZ48UxOC9ACfuLl4ZDu6bNIOV3nwh2L0QPryhp9CsJHg1j6F/w3grMAp1dy2dA39jDW/x/YfAiX0caioemFdjati204qkTEI9XPJnrUOWbylV38UyPjE5JYNrQKHENOeRrBSKt+g93fx6l6zadYI6pp8SibRG9+kXXzCDQD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joVVJ1ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQYROjJC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5CqFO1972782
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmqIWSC1x/lf7weeoBI4Z52pNjgwELqu38ImJz+Zie8=; b=joVVJ1ha8yNJWk9/
	gWSJClG/AGOD2SVJVQyGjSHCsIfka2WgypGw2vQH+L965V4OajREktMrB0pTom27
	QasLKv/uDs+Kdv/Pwt3DeCXsxPPT47HV/iIg/nqXVG3oRI/vNed7tajKYNbr9JN4
	8d5bxQLN1i86W5Jug2yjURlh2LcZpBIbf3uHpLA6m1R9PV85FIIxQG3BggvPncoK
	mQjl6ee3seTD2NxykcHFV4NFayknwSGurnyfvZRRPyR1D5kpvl0E+h3E2pEsklj4
	kst/V/1sEISTHG6VHPmo8AVJTLQaczgm4Sjwv8HqJr2+KnXzbK6SHZVCveRcOqF8
	maDSWg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmkc05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:47:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b9074bd42so14344461cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774860442; x=1775465242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmqIWSC1x/lf7weeoBI4Z52pNjgwELqu38ImJz+Zie8=;
        b=DQYROjJC5xPs5aCO9IPm5oQQqCw/cxYGEnIJiS0xL+tjRdZvpRGTnF8IUB1BdKPPTG
         cNT2ZSaX08d4+0h/EwbsIDqwBkWDXuMDtzOF8dOqHVJsg9ja5IBkb8GElY8NP78F370r
         9cCE3buDDeDEnyUdYIMPuN03/VkXXyZ5wQzNmUhvpCntZB0dpq0za9SJc8e1Aqb+ADeb
         +uIf5C+6vTsJqSNszHtG5YKNTy4mIOKZ2kQFQoNUj8+4zCkQTsycsm+46FF3TErjZDzT
         uOprLkHIjGkboXFwA1B11GP+suETCtZWPTY/74xx1yjHRJBlrgEzvHfEtFwX0pxLvteA
         CXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860442; x=1775465242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmqIWSC1x/lf7weeoBI4Z52pNjgwELqu38ImJz+Zie8=;
        b=HTU90BUykfDMiNAwW7KdTeOcOH/4y131PwEBRgj9Towob8ExAIYglK4WuWMH2laApP
         Eq3k3EC9bBZLtaha6aLGfYhVHw+7IMf0PK+sqKRfaPlHOZ/16dpQCs7aEAvfLSMDBHUZ
         +bP8guYAZLcApUWTlAnx6ZpGI/Ait2XM8hM8y4uQtjL40xJ+KaYAq1AFvCoyUMvr4WC1
         FVVb4MgZojiGAJe6eWGYVM2EMKV8FUwdhdclThppW50KmH4FIP0d/BWefmTcdy1mWDCH
         m/S0OSVFYzy0taarCN5KmwiTD2L3zxQS3iC6bKWJV0S+me+getdFFvCydEHSsRg40y/S
         s/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCV1CaovKfiQXSZCz3D7M9DZMZQK0UNH1bu3Ex/oTwCJ1EmXRQF6KIGB9tG/pYuQ/o7mEa+4b88tuHUf30V0@vger.kernel.org
X-Gm-Message-State: AOJu0YzycgmJ9b6fDzffXm3QSJQ3qinUmj2Otn3I7wE4LWn4hdc1Czu2
	EfEK9mBQ4a7cN1Vs16fu9rtOetZiW9pJZmiHZNWYvcVhXYonjnNTtA8VsZs77UClsHmCijRLiQG
	1tSiQSZcxlU0EIjarXqHTYh1694NTuZy5IPUgiRw4tPcbd5toCzcdFZ83Xm07RIaIwvDl
X-Gm-Gg: ATEYQzzl6QN/AZJqmqLRsTkBbbt/AlnNF735cKRXmv9BGnwJFm95s0UGGabXk6318Be
	APEzCFTQ1PRaxnJIQtPqqohd2G90ASiXb3km5v6SInRBd/M+QF8DQ82oZIirBtebUh0B5xtwuap
	+JZSqTyhtOzpa2t71/ShULIiLh+8RnWYPNd5/7I5pJbfhgyElZxa6R0xNNenRCNXUQfd194R2x0
	XjPRIdESlVvjZITAgxUqtbA0JxLJUm2M9C3zF5V+yliYtozbnXCoYfpkDeNY1waGkoLJWqk4x2q
	zQezu3pUwUsHcPKIoYE07UTZeAPkwoXgpgQmip24TcR6GM9lf+l0CtB+3KyG2Y7mS95lBezIbir
	6TiFjGp3WexpkslHu5wnko1afmEe85ld4tQtr124z6jbBZp+qNor0NPw0qb0PBD/9MSAig159Ue
	STbHc=
X-Received: by 2002:ac8:5fd3:0:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50ba3828617mr122311831cf.3.1774860442436;
        Mon, 30 Mar 2026 01:47:22 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50ba3828617mr122311691cf.3.1774860442008;
        Mon, 30 Mar 2026 01:47:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6744sm244747566b.30.2026.03.30.01.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:47:21 -0700 (PDT)
Message-ID: <d8998aca-b808-4239-992a-42cc780724c4@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:47:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add missing power-domains
 property
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
 <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-1-f14a22c73fe9@oss.qualcomm.com>
 <fb5a1d45-822a-4894-bf89-026164491935@kernel.org>
 <szijgc6icwkzlssrxa5ceawgzaq73jo6lei6yubaxltbw64x5t@ru6x7a32igji>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <szijgc6icwkzlssrxa5ceawgzaq73jo6lei6yubaxltbw64x5t@ru6x7a32igji>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2OCBTYWx0ZWRfXyWAqR2zFXlmD
 sQerCi1qmaD4WeYnKQYo4DHxoS7qTk7A//npA7Y78T5p3pUnsiS9xWSDh7Z4PoS2LITzqaHRdQ9
 xvgjKMDKCCBLMnW20rArTq3Sxk0DjUUAMd2wpgG3Sq95V9qY/wwr2ldLmEdA38QeXYKS1DAJWEK
 qaKlWWUHG77KuVJV5NxhEEsYhJI1TPJcu17nGLulDt0jo6PDOjkoz3B5rJQnSGfE6fVXcnF9G3L
 y3BplANE/QTTPQL7XQ+uVXlKVpDXfjvCPn9VoZg35S1AVK4hWTkNTG8Y8GgecJcJecp4BoOFIMV
 FHySxQFsuPW9e6iLch20rew6ftP6QH5zV3yAkarPur7/zHX45iceFJzIMeM6of4CNIe0a7JfX8X
 4Btf9ABe0jmpGZnu9j43nhyGO3X5ePh3JaeXE6qkz7jbOLLPrrmoRSD2TkoYP8CpQRsKrilCV8m
 I7N2wG4Eby764/jq4Cw==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca389b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=d7CWpT17vCKXtNJQOZ8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: zObGm-JFgsHq4rq4BcjH8XO2cKJsNLIU
X-Proofpoint-GUID: zObGm-JFgsHq4rq4BcjH8XO2cKJsNLIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100705-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E85F3578D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 2:45 PM, Abel Vesa wrote:
> On 26-03-27 14:37:17, Krzysztof Kozlowski wrote:
>> On 27/03/2026 13:13, Abel Vesa wrote:
>>> In order for the GCC votes on the GDSCs it provides to be propagated
>>> to CX, CX needs to be declared as power domain of the GCC.
>>
>> I assume this is true for Milos, not only Eliza.
> 
> My understanding of it is that this is true for all platforms.

I think we once had

required:
  - power-domains

in some common include, but that expectation fell apart as IPQ/router
platforms without RPM/RPMH started coming up. Maybe splitting gcc.yaml
into gcc.yaml and gcc-no-rpm.yaml or something could be useful to ensure
this common constraint

Konrad

