Return-Path: <linux-arm-msm+bounces-91303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HBeH1mgfGlSOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:13:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B6ABA5D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 767FC300E3AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB7B37475A;
	Fri, 30 Jan 2026 12:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXZ+8b1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SsEJT7pn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673D536CE16
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775186; cv=none; b=CJMVY6bQRgFi1bqxK44ACjuzulo2L+bVEGzB9O/aEbQnbs7evFb6DKT73hC/QsskyEMZws+1GNYymgGIWfkS0IskVlwJEuEvbldFhbzvhwmvA9Yc700mGrWtyXYBGBIRsPu8ZpnrDqECZKgWHNBq51lJFhaGFqlEdvRL2B0okFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775186; c=relaxed/simple;
	bh=/ixdRevMqPEE1lODMPoaKQo9a9vLiHkiCmGYyHpvje8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQKYM+urCk+x2csfcyRPy1dsd4dXbMqvCfQAKNKF1uMpgVV5CfTrSKx8zwckvwTjj7Cqv4tm45v44KDTOfUjp3whCZhuHA5nanJwzALCi88Y2vyx27gFNDKrgQULiKER7S6Kx4fCL8Yygc/j5uvbhAijl/v54/xFUtKrm6ZAwWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXZ+8b1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SsEJT7pn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U7GXIM2415234
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFLpSlLM8Y/Fn7u02xJzrPAJxhRkRWQE0zeelLMBT8Y=; b=NXZ+8b1JtGFAdORp
	LqzyEhxdqF73+1fNJJqF6X2s/FLQWTFpR0tE1/Ap8pRShNcHf7tdgtPE/yLasjoW
	S0vRYA/9smM9kdaIZwe74haroBhbjsoGQqYA66qHUJmfJfWnjuA15PI0LhXS2/Kb
	UHj1eLJIX6mGNOjS09zCH4trvfzJVQyn5lvGpYaCS6Qo02Ijao4or3g0d3NembYz
	jU3mcOGBYJHRf/q1iOOqn2G9eXOUoj3rzGu6hrr3/iJ45+uFdvk9o7T7Larb9VBR
	fjJNVKhv9v6pVdn8bGid+j8j1xlUrbvkn5NJBSnICCWdSJCzRYBJBJKz/8fQlRkC
	D6v49g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0r41gun5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:13:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7177d4ab4so12999185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769775184; x=1770379984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFLpSlLM8Y/Fn7u02xJzrPAJxhRkRWQE0zeelLMBT8Y=;
        b=SsEJT7pnuig+PnfDPl0ZKUn0zLxkSnRYG6/LKRQyt2qVODI0vdgeMO3U8usCHpy5Ac
         mykNRpxclYuiZ4boJr3pjpBwpIRFLHo3dEi3aEb3PtbsJ1xLKMjXRkxAPMzyDRCJUqpM
         gVHzmIWwLY8yJbO2Vk0cfdeh3I7XYajZq4SnzvUSASrstsgZpfF79uosNx9lpZomxTHy
         WoM1xfM+OOV6jA2ilfJnOfaYayNl8OuB7BYitPcn/U/yGkFZZhCxOnybD7I1tMrcYM5p
         ddm0LrTNxuFX/VRRshqMnE33RHjRpvT7bZKY/lYZKZaxAgTlGuXvhDJIW9FuN6DYNazr
         1L6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769775184; x=1770379984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFLpSlLM8Y/Fn7u02xJzrPAJxhRkRWQE0zeelLMBT8Y=;
        b=DhWeZug2T7OCKlCxoflEqDwuhtbQIB+Q73XouuKjgcQrnzMusIeSFNggZe2CBDDpx2
         knRw7x8jZHVZr4QJf4+Un+4ZG7f8PGGbUylmxYSjJ40vQ6HQ828g3sy7NSKiqXFtOtgv
         T4ICGEsKXhTJERneomijJuvUnwQ5L+2Hc0OzNbGLK+U+E9JJEbzfpIiadQb6njv8ZeCl
         bMV+blZ+n0LQF8XCyr5exBua6RBC24shEX5SBwVKuCK5WUC0zXyiEb5pGIYWxPmkwqQ4
         HrYOnRvE+BDe4TV/sIt4cM0DqTOKoM5+vlJRWaMNpu+g2f75S+U/0iMy666LakE2s+p5
         qOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQGt1PCgZ771D+68q4ZUE4vGkNeSNzYecB4yNhbzgeTShXk43NfkG4pCo5StSr5opn8WIEkpyuqpEh9bbl@vger.kernel.org
X-Gm-Message-State: AOJu0YxGVns5kL2A74ZbJ0xWG22WM7PmUDVUK8GBpj/rc3RB0alxYRMI
	TJcVf/IVGeyLjHhaPfU/GNSEOyGfnmI0ajaUUrrwOHW9WsJr8tAiZZmZrrKnB9h9drrQACi+bvM
	B2LtWx7nq4R6HQIcX/9/TwJNMu1cAhKbHmTo42Za0LRF+SoO7uvysDd55A+dlAKIvhheA
X-Gm-Gg: AZuq6aKAEPVTddfQK5Z7irUZsrqJLAHH3CHgo2q/q70w1zOAPLwKIE30Chfw9VtF0Gp
	s6QKoxU++0PpNuPHS+0YgyIfHPb6oorYRwqxAtBCN1XOiOmG0nbXySiU56RBi3y2uxn9iDZAdKA
	g/xtxtQdDEDffm6MEo3B4UWn7Fx3jV3rwTOC7RKKBJG+YhFrN+5POllaNwTNhp2e16JX+3cG3B9
	LBaecginEBayyz7vU4Tha1Q/QU9mZ97B884/WXbPNuryMDjzW5ouZY1ftZY23HSspImbbPewL8U
	QicaD9pzMvY4XkEBtwbvj+197OJr49cA5OxRRTnDjWhP56FgMHj9KWTR5qpIdlaKGoCe7vspolq
	pwkn0nTUahDIqdpftFSBwC9iMnCSSkBvTsq+ljiwpxs+4dlB+zy3KCtH/AUBkHxjOCeI=
X-Received: by 2002:a05:620a:17a8:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c9eb265cedmr288082485a.1.1769775183747;
        Fri, 30 Jan 2026 04:13:03 -0800 (PST)
X-Received: by 2002:a05:620a:17a8:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c9eb265cedmr288079685a.1.1769775183346;
        Fri, 30 Jan 2026 04:13:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e33sm412879966b.71.2026.01.30.04.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:13:02 -0800 (PST)
Message-ID: <d13d1931-c6b2-4f4c-873e-efd45823fa89@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 13:12:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] soc: qcom: geni-se: Introduce helper API for
 attaching power domains
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-6-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-6-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iL7cX31liGSHQ3FOY_mPWK9LRnZbiT7Y
X-Authority-Analysis: v=2.4 cv=W541lBWk c=1 sm=1 tr=0 ts=697ca050 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Wk3v8SmLDDZtl8l8IssA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: iL7cX31liGSHQ3FOY_mPWK9LRnZbiT7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5OSBTYWx0ZWRfXzFWifYhIc92B
 LUX3ZWrjRjDRLqbZMEqFlKvNAtMIsPTsJ+0UlhemwM8GriK3NFEGGtnUgGagF/yoonbG5tcs5qo
 xztrlpz+ad6I/SAVO3i5SBZ9cuIrDTrkXTxKClTQ6gB8bmP3VcsKgM/Dpe+vo3uJkI7strJW3m9
 4QoqKBV00Fu8+4vu0+2fXUgDuwazCx9kva9HFKv041IpVi+jH8Bo3kcOLyNfgtgfCiV7pDf5O2G
 ghzkHSqrvf8sJajDfbilSwSKPk14Ge2y5Bn4tya8r72Ne2IIqBQUvyNk4mlv49RUGzQqIOjqvmp
 0N3wKFhWlBqiGYSlORZcTApKN6re6nM6ytSXQRdIQ8uCCWbOSdmr50xhfVx8b21EYwAXj5MRab/
 4CVUHvTkNHWRf8/Sy+qw7b4FWqEAaKh/WIYdzEwnDn6O0+xEguZY37rHkekLH2ruJzkjO+sTmt0
 AlPT5E2qCYfLM7y6ntg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91303-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0B6ABA5D8
X-Rspamd-Action: no action

On 1/12/26 11:47 AM, Praveen Talari wrote:
> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
> the attachment of power domains. This often leads to duplicated code
> logic across different driver probe functions.
> 
> Introduce a new helper API, geni_se_domain_attach(), to centralize
> the logic for attaching "power" and "perf" domains to the GENI SE
> device.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> +/**
> + * geni_se_domain_attach() - Attach power domains to a GENI SE device.
> + * @se: Pointer to the geni_se structure representing the GENI SE device.
> + *
> + * This function attaches the necessary power domains ("power" and "perf")
> + * to the GENI Serial Engine device. It initializes `se->pd_list` with the
> + * attached domains.

Please sprinkle somewhere into this kerneldoc that this is specifically
for the SCMI-auto-VM setup, otherwise "the necessary power domains"
is at best confusing to an external reader

Konrad

