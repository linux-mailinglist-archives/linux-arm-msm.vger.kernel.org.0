Return-Path: <linux-arm-msm+bounces-105154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LzCEdHN8WlrkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:22:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DCC491CD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 186BE312A0E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AAD3BE17D;
	Wed, 29 Apr 2026 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8RVDjZi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JV/2RHhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EE1396560
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454124; cv=none; b=uHA53wbsYLUFxgsbMtDsOycuPeME2WbUFbofX/NLfEABtzzD0OfNcaswEi/MQEMblsutpG3MLCCNEnnvLS3/mKggZWVJn8BTPU9eWZAX8FypzHHSTLa8mN3hsqBwVMvJmgK7ERKg6mA9MvmT4wGSsqbhv2aYvF4/BNER+YWP1lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454124; c=relaxed/simple;
	bh=FgmhRN2ZuwB7iAMQrk6FPKhaSD+uzFSTghTcYvlHS6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODE25tDYt0Caf0+mumzZc7aU1CC6B98zysGL7aYR8Mxne4rBzFKGQnMB8YBNaW5jOOTr7f1JH55jmmgrLnHyup4Z1ubpqW7Kp6G/4/Brm0ToerVFDc3pgz4k7BugNtjDrmrI1E4NVslE4fysch8OJb5j62zN3SzZtEWx+M85vb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8RVDjZi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JV/2RHhv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q3Sr2095179
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d2y9MLNRsMzuRk0cn7P4gB7NpL+d//Uf4khrC7oPh78=; b=A8RVDjZiodUej8IO
	ARO+Is/G4SILqfEWKqEgW6a9vptVta7zQv29mT5JvXWw1DTajz2LXfT3KW9ahZlE
	pawjYwFEqXWB/AHz5O4ubxFrKR8A39P04MsW0NGi+QYaLm5VlO5qj1xIUSAR2qrJ
	PcjLA63yiubOYmEZG5MqB9nI+dPjSZpr6k4s87tWlPgdPtl0qjkOCd4jU1TObi81
	C8gWjSTieUh51bbwzHN8zO1nAhBVhEweWV5XqXKNLNoSvO/c2mVdeGSpO6Gijs8S
	USKEa42DGnHt6v6nzrkNDk1+pLOJdRhdBcqWXYVykgH6apzHMXGM9/2t9E3398PW
	S2YPEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3rhrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:15:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso12386477a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454121; x=1778058921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2y9MLNRsMzuRk0cn7P4gB7NpL+d//Uf4khrC7oPh78=;
        b=JV/2RHhvjQxW3YC9tCBF3ioqMOcqatcKoL3BdSJIvZVgrMvKYjRDK9T57G0O8yQyUO
         FOn5gfK07PLBtJciEkVfA8HO1X50iofDTo86sj8PpE75UXgedaAOx794gGo26DIcPWD6
         Uk7je0hSph7bLpV5zAsAXluTrt0QGf6dSZ+YfSfqNG+bGdw0YZJ5Rlq9nO0QDKC/aDzl
         z9hbhffXj9SHqhNl+mn9PBKI8Oh4HH1CaMjfVEFZX+qCwGx3VDfGpzD5J1FiPhwcv+kA
         ZpCHdhYHWyTCCigCAoXq8F+e9PZcgsWDKhJ8OkqjjDrPFPhLvzehDaGr4gSZML0iJ7Rw
         qF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454121; x=1778058921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2y9MLNRsMzuRk0cn7P4gB7NpL+d//Uf4khrC7oPh78=;
        b=ls8hso1mo7hRyKhMfKYRY78dXeqrMQRVwAjO1OfZJlXzEX9ogSATapi7s1eMAs+Piv
         Y4IE8nxcLfp0sscjVlpwaOg6yuI/C1B36VWLdUAmPph7EBsaCP1r3LwVQtQnz9hQW42R
         rynmuUdyE7oZ9wHdWK8zSRiDsyOsF9WdUTuRWHdRaf+uhCaFIF1OplLVbLLKavOlZOCE
         jePrAv8R/B9fNNEqivbIsmEQpjWBZnUJ6dQSK4vYPxld1MXpLKMRP9FBRiGdDH3kgmXa
         UTXpYPFFAiCdl1dBb8paur3lRnPJxM1OSlIpwRp3Lm1r5ED+/s2PDrJL8DY32ak1aic4
         bsOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+u7srmbYQbH3vqDfqaWBZXlB1HeQk6S2uzlXeVL6K+zQJN6KjBFv6OgVsuswk2RbBNpTs+Wrp1E8RKFFrW@vger.kernel.org
X-Gm-Message-State: AOJu0YyZGpTf7vLcHTKacx+v/Rerz990tlwDX/z8Jle7MnS1cZWc+ecG
	Tpp1u2Q4vFfsMp3iNBZXZK9M9f/DKCmoSW1viamQ1iIzPJiRbfUH47K9Oip3Lpeeyg3DjntAFxR
	HAl2nWX3xxnhZXkvZs60b6uiEDfTO7iFqc5R0TViS2h+uJJJ6wL2rzFoKMqCRqVQL8LPCwZlR+F
	4c
X-Gm-Gg: AeBDietL/YEC/Ns8Kiaegk9DzaUOwbyW5461T6YCbs++oIqh7MnsM4T9kUav2Dr2GR4
	EH8PmjRIzF6mZpoPjWvGZXghpfRrVBY+UDNJ3EfNjolKOUm7WxuReDWY1au2PIgnmSrj4q+yiFf
	GbCFmDoIoOjx5oonVe4POrdQb9RtcNx2GMLxJV8oNwC21DQNc/SjfuipcoBRaUPMBIYJmI89amm
	DmRWnnSOwzPTaipERfCSm8Qnzj6JJ/4nsWSZHvBkuHdGlOVgumpj2q+kg6xeMI6TxWQejWGVEJY
	tnw0+ST7C30vhl9Hxq76qHCBFPDbL0mdxebm8VR43A8HwlXS7wx7nrxn52Z7Bq/vQ7si8ikJSW+
	PjijvA+E/l8b4OpdOyLZEgoYHXND4tbvh5bH9kJGLTIk0fQf17CtNX8AcV7Z8
X-Received: by 2002:a17:90b:4cd1:b0:35f:be09:1a2b with SMTP id 98e67ed59e1d1-36491ff1ce0mr7520108a91.10.1777454120840;
        Wed, 29 Apr 2026 02:15:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd1:b0:35f:be09:1a2b with SMTP id 98e67ed59e1d1-36491ff1ce0mr7520072a91.10.1777454120422;
        Wed, 29 Apr 2026 02:15:20 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a419a148sm1650856a91.6.2026.04.29.02.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:15:20 -0700 (PDT)
Message-ID: <b9bd568f-dfbe-4a5c-aafc-19ef629e81ba@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 14:45:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8750: Add camera clock controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260225-sm8750_camcc_dt-v3-1-a19d3173a160@oss.qualcomm.com>
 <d2e292e3-de8a-414a-9f37-036b65862154@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d2e292e3-de8a-414a-9f37-036b65862154@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _mwRX4VKX_4KmVfzI8GoKcvzCkMHuaYd
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1cc2a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WVJonjGCGc2Ee2brpuEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _mwRX4VKX_4KmVfzI8GoKcvzCkMHuaYd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MiBTYWx0ZWRfX7LwBAC8+Pevw
 8gMSI6EAOBnos+heuraebnKS5CuXJ38zTTgGuTCT+GEU0h8kKk5Dlvp8Bg+leQcN34n2Eqe6gWP
 uT6kEFcJ7hiS1Ul2fuLjkF7xwlB/bwZg99DXdfXI1vb5ri0XFkcpV5suDCTuxayS/z1KLV459yP
 0Q5qXEMA7Z3VtNt1tfOaAJC9lO0oZqsY70BWHaOm5YoFDID/taujUtDn+dc94mD7LYfm7mbAs5l
 F+WFSw1h7jhVY2BLdXhk7C0ygaW7PMAC05VgKDY4rPR7C4QIYpKPzmvfMQsp4A6XJAJkyrqmybp
 otdrcd3WBC0Vv9WwvVmpUQlvvjluqmKb0pEgazDq5C/mN6/OirzDYgBjTb+/gjb1xafOd10zz2t
 18tcYiDQEjmXwk/U0nAonqjDij3lvVljBQTMGfIS6xz4FyQ8BcSkB7G15kKbeejUMNWE1hohFRu
 AV13HaDNr8cSdgNg5yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290092
X-Rspamd-Queue-Id: A7DCC491CD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-105154-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.26.219.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 2/25/2026 7:48 PM, Konrad Dybcio wrote:
> On 2/25/26 11:12 AM, Taniya Das wrote:
>> The camera clock controller is split into cambistmclk and camcc. The
>> cambist clock controller handles the mclks and the rest of the clocks of
>> camera are part of the camcc clock controller.
>> Add the camcc clock controller device node for SM8750 SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		cambistmclkcc: clock-controller@1760000 {
>> +		       compatible = "qcom,sm8750-cambistmclkcc";
>> +		       reg = <0x0 0x1760000 0x0 0x6000>;
>> +		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK> ,
> 
> Stray space before the comma

Yes, will fix this in the next patch.

> 
>> +				<&bi_tcxo_div2>,
>> +				<&bi_tcxo_ao_div2>,
>> +				<&sleep_clk>;
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> 
> I find it difficult to believe, but the computer tells me CAM_BIST_MCLK_CC
> is powered from *CX*, notably *not MMCX*, could you please double-check that
> as well?
> 

Sorry for the long delay in response Konrad. Most of the CAM_BIST_MCLK
are on MxA, only few debug clocks are in the "CX" domain. But the
CAM_BIST_PLL0 fails to lock without MMCX enable. That is the reason to
keep the power-domain to MMCX.

-- 
Thanks,
Taniya Das


