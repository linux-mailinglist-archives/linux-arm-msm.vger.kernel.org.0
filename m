Return-Path: <linux-arm-msm+bounces-94972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE0xIOmlpWngCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:59:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1851DB4AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59571300B85E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019034014BC;
	Mon,  2 Mar 2026 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdk4a0Jl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdZJa6lu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EFE3FD15F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463376; cv=none; b=FO5XwqwwrDJ/xTh+Yx8opVri6Se+IIhKU4JizHN7zxRBT0mUFl5kkTkp75Ey4NjfHyeyfAWI2yeXbY/ok2jDNvisitCyJgpjUcqrDhv+IRIiQFDYoMsySTDdCerHNM9bDtaOs3qY0HrVSNkAch5+l/eO5B5nK6SEdLlZN7gqdZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463376; c=relaxed/simple;
	bh=kXviVLS9+whImF1XICqRWX4urlBtrlMmTmqBwC+8RO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKgXXCViseamfhVtq5sPU4EePHaZFYQPKBMp6PvAZEXd9EugxSR9RQJB3IVYg2mYXaqEqXpHxVPt0nSvPZ6M9sy7cphIZ11wGTFW0mhr8tbb2wbfwEW+uLFECfq9GwYOdiiaLGIwnCIzWGamYuFTe/xs6YPQZAhmr8H3vWr6hC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdk4a0Jl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdZJa6lu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622ElpBq2048865
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUCks3kSROVlKj5A739tDfuNZ4HzeWm2yZqri0tgxWA=; b=mdk4a0JlXuFUbcfx
	DFK2u5laqJsnA8SUcPH6obHrc4h6nZDZd6C7DLINX9cjWU0rDquTtwPSw57oMKwE
	ARzZdfj2ipCac8oWA91oI5uRuMIRFJxIDF2MxAEZHTlhH7V0j8pcbk4erQyck8Cd
	ceb08/5AYwC3csMF5s8+S95KYE3OfCiZNHLP7YWv5uyub7igcSQHG3+RJ2ZSM+oy
	NQ0p9muUwbegd5kf/nlnjh6HnMj97QoJsyL3N8JXdmrB1CP7pzoLazU1kvlcs6JY
	V9HCUxFGdfJCZ477whvEQfvzps+xkuqjw/hG7sAuMjTfoieB3ZMHjMbhMyg3R47e
	UhgCfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfr0up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:56:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso423555185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772463370; x=1773068170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TUCks3kSROVlKj5A739tDfuNZ4HzeWm2yZqri0tgxWA=;
        b=VdZJa6luCk3NdVOCMry4Gl8mWZVvUXvprRfCGMUvR8/nc3LYdxNOykX6J3bWKTWxR0
         SH1OAQ7NvqA3Nf6wpTYsXnjgwYMENeERpIlEBOCijwqXrqThl04il9jTVfVn6+wLQ44p
         1YGrYPGGkxbDqd+DhZ2O+h6lmYXRYW/CdR7Oos5tm+6PRzmzTEgsQgoFDvsUf3KhHaQj
         7zQmV1DWmMlCZ/tHzcaXG7wcPtnjbHr+t3chIeD+MQw/2NPL4RHeIXROToEh1ysV6RHC
         F0ln9sHrsTTgJHArv1vXTSRPYFxu7HZAzPty1V8KpfBahDjbO60cGNTygOk+hbgowIhU
         BD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463370; x=1773068170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUCks3kSROVlKj5A739tDfuNZ4HzeWm2yZqri0tgxWA=;
        b=EzmuiCbDKKo6jpX9KsWgU0nOePwnP5teENbyL7rKU2OIC5nLRiIXWL2nku68VVYPdO
         0ZXDSANB9HjyZr4fiRLGVO0GALxCT/Icp4uHVfvHSQoUjVRa0O5LS7aUrh4M9hZhiS6G
         ybzC++5S7p5Moo8e8gimM2TM/t3XoaBgrTK/jAAlFd8JexNJ+nJ4KjEAUnnv4oRkTeGh
         R9KoUmLYhy5ptPsU+KAYMo9d6qe7EsY2Xi+JSjqo+UikX41UeS1a97uS9QPu+zIMWdiu
         xw+4+ciRu2wM/jwNMGR7rb+C2pp80PpOYek2CFJrce1BKG4i1nOQfhZ0H1xnAHzGRYEZ
         5VkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiwid9RJx9KaV6Ky6dC2tM9oEODh7AxnoUMKXcQCI7Pd9SlLXMk3XBJcKAaEfLfFFaoQprzqcWAhLYXokO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/DhsN9UM/8lrmLdDB+RhTWEnTd8k44GuLmJaSfOGTPA7jRD/y
	AIIowdHWa5OogK/AbKTCL7gmIyHZemOy4WuH5Oapcge+U/8FEtmTfd1v5ou0JV3XInOhbSABeeM
	rhRXPd4GNMT6FPrVrMnNncVp9NV/sNcQG2v35lpjkXuqL+K8g3leuyPEhqFIQxYQpf8uK
X-Gm-Gg: ATEYQzxe0QECZ6S/8HMX87FGPGZxFPhcSaDrsVuzQVyr6WsurDWebeDhd3TjA6RWYFT
	/wEoUEWOckU7lyBf/1ddx2z3+xHq/LT1NaSTVKVPP0kgVtYfbK8NG8OtdvQYrb7mzWrb53jdea6
	6ZbGw3deBWKGNgeEPoHm1hmhCbEVjR4ptqu3bFmJt4WF0nbAS9JJuap+4tHdBu8opQhkeUNpNgm
	Jog3oJbCWxyRxbTxWYiI/XSKR+PrsoZSqZTiJCG16tE3KxKueHdt/4PYMBgdcxbvPpSyZl/dGYY
	AsVHZaRgW/MIr2tY3fbo5nLg7/LJmXvPDn5NO+NUIVWBN5SV0/TAW1u63u0NLIiHFSfJcR2cLdy
	Oamo1b83szTuWBwCzOrAjEAxfwzsSD2XipHNbb9+oD004kHuVWrhpxeWySTWx782/GmPqwQrcJ6
	Y7vJQ=
X-Received: by 2002:a05:620a:1a1f:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cbc8f3bc1dmr1174845085a.8.1772463370530;
        Mon, 02 Mar 2026 06:56:10 -0800 (PST)
X-Received: by 2002:a05:620a:1a1f:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cbc8f3bc1dmr1174842185a.8.1772463370113;
        Mon, 02 Mar 2026 06:56:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6d26dsm3593784a12.16.2026.03.02.06.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:56:09 -0800 (PST)
Message-ID: <33737c4f-b668-418c-ab03-f27ed3b6fcff@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:56:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: sram: Describe the IMEM present in
 Qualcomm IPQ SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
 <20260228-imem-v3-1-20fbcc1a9404@oss.qualcomm.com>
 <20260301-secret-exotic-nightingale-80f55c@quoll>
 <4cf9c98e-767c-44d3-9e71-bcc790e83997@oss.qualcomm.com>
 <edffecfc-ea3a-4c1e-9e72-58c7c134248e@kernel.org>
 <d3de0b25-861a-4261-8d9b-a3785187bfdb@oss.qualcomm.com>
 <6606bdbc-95b0-4adc-92e5-cad70d250cee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6606bdbc-95b0-4adc-92e5-cad70d250cee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a5a50b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0lJEDCKj2ot2aC4RumUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: rH02d_ZsbZzsYfvEE7bvR6MCl-RcEblT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyNSBTYWx0ZWRfXxrzn+pJftXKX
 flJKX9/AZqBx7tVPqhpSezE56M6GalWUQ88JQ5rdwxmQpStKHNi/0V+FBrsjdpHXPoBzEBKsZGZ
 Ys/LiUzT6EClGvzM3tBpaBhiA7VZoJHohrbdfRF4FkSNZpsug4chtZcAJTsodF3C8+ic6wruGio
 ocGHk3pdfwYEkTpjpELRR74N52Vd9W8T1ZZjI4DSA/WPLvxCo8XggjSX1BT7D9gBHdupCq9sAJg
 Ih6jS9u8xd2H/g8L/kIJ8dQ68VHvTUl7lL6uYdL7Dll9DcIUr2TGgtcjcHSDuTF9tBrZ8e+I0jV
 ismRJYznBeVjQGzVeZl91brpeq0lowoauGVVgF+WpxZfsZ++G+iXxnnJHMBL3WHPhDb4tMr9nnT
 OExVdeoMrAxkmJ5OYtUKf36+reRgeCoh1zOnAbkTazNhDJera9AqHMrf1u0f+J8cuZfjtp3CzsV
 Cgz+V/eNCKN6nLw0QWg==
X-Proofpoint-GUID: rH02d_ZsbZzsYfvEE7bvR6MCl-RcEblT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020125
X-Rspamd-Queue-Id: ED1851DB4AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94972-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 3:54 PM, Krzysztof Kozlowski wrote:
> On 02/03/2026 15:10, Konrad Dybcio wrote:
>>>
>>> Also not accurate - "sram" is not the reboot reason, which has node name
>>> called "reboot-mode".
>>
>> What I was referring to is:
>>
>> patternProperties:
>>   "^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$":
>>
>> where the 'sram' (not 'smem' as I typo'd above) is obligatory
> 
> I know and sram is not part of "reboot-mode" name. It is "reboot-mode"
> in existing binding and DTS, not "reboot-mode-sram".

In any case, I believe it'd be good to drop that requirement

Konrad

