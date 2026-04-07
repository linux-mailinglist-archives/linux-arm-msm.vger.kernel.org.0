Return-Path: <linux-arm-msm+bounces-102143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PWKOIDo1GmeygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:20:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E093AD9C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2112C3028EF0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F4F1F5847;
	Tue,  7 Apr 2026 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ae9PeUV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gp4LqTY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EFC3AB27E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560722; cv=none; b=cO7Xid+xknmksC7jWSkJRxZ0/EVCicLXHnQfmTrykzW01ifLW1Mksa9DJID3bODuvM3HYssovu8fi85+p711qep9pja8glk765ngYF/FcNfX0gqLg68iw0FTB+Psw1iPg2lcCWzK7h0JITCUud1rxCyJVzBVrVkjWo2TcI6cUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560722; c=relaxed/simple;
	bh=w9cnIu+knTgg65YCw5dht36ngdUu2Y2zhB3WJV8QGBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf3LxfMkwu4hjD5uZMI/O0g20pgpBcOgJpQvX5SOXeM53dEcXmlvxiPDGYC21rEDFS+tyMRIQZQi21QbsZ3Lp5WJztipPEAGaHdsJE7RE9ydTZVZUfPyj934tFPW7sLcgK5IaKV+SfjBtArwUrzTlMQEXoyVH+pXB6sOzQ1beQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ae9PeUV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gp4LqTY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376bxDE3536852
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3lOjc0t4VF0qA7I7ug+FZIFW2JOa5qp1tmA8m6o8bY=; b=ae9PeUV8ezUyTDLq
	ndqzM3OLFwVVyCHrNPszhJlk4nWmHAZaFddWbfDuMMzNTENmYYpQe8KQKuD28RjY
	PAzCvAv1OsFA010dFiKc+07R38hjiFOty6gmEk/j22h1CUVxSnJHhUNM73omZylw
	3N65elgWlpaQTUSm+EIKJ1+ErE9ohfm0g98yyaDT4QOIYzhi1wjoddhc7BNdxuBL
	U5oBEz7PMwDuFpJlX5hUiyh/wROP3Y3mxndIfhWqzzN66/YULPOdv+GLTjFQkAIi
	O1mLzfLrrHwJDb0s2IhL1dXKN8awUttelsubrDiv4URVyoIDC0w+S7s/+FH/3D0t
	pklBpA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2f1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:18:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso18811821cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775560719; x=1776165519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3lOjc0t4VF0qA7I7ug+FZIFW2JOa5qp1tmA8m6o8bY=;
        b=gp4LqTY3ctRU2KCCBJibvcA8cMh14yBnoU7AKvKC0v+oFHDsNPQz+L07Rvv48M8M7T
         +UD+Cak9cUFQJwFFwm9PNgxHOPIbCdDnhD/h94dNA/x+CgHQ5qcDQGc7Ek80O4TJ33Aa
         3SAkudaT/IgXadP53fPTdsKyKtUPP5MvXMEArA/eJoFRl2z0B453euLUghlgjFkSBU5q
         +ukEvLThs96GqjFTLF7WWYeZCiyPA4tq/lq2k10nMzPRQVoTrsYH6AxU7OK1mS1KwLc2
         Ab32Whge+tqhKHGfVCJrf5dQDF/vLsXA3JxD7I6u1T5Gz2hYMnL3D4v5TUvkwjAZcaqL
         diRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560719; x=1776165519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3lOjc0t4VF0qA7I7ug+FZIFW2JOa5qp1tmA8m6o8bY=;
        b=e1MwPfE44gckLUpBr7iJSIA5TjJSM/0VEqOOjA7eyszRYBthqG3AjkX8RmEphvoxcA
         i+77QVr75qpIUJnoUkKSlaZJ78D2+QoTrwa3eXqO4605MbhrLighmA+FVxGmiKliiEb1
         IjxW5gyELewa6kKHOICqpQLxdcjtRVS3rDq5ANWsZUy+QdJYSsLVssK9yKGys2OJlWsy
         q1uGg7VmJwKVEuGLF3yds7B4/8eFW2EVBGz3IMncdWklyQ/0WV7am0bKk7/lQxMgjFEF
         vJEiIRPO/j5ahgl4fJLrdHQSfEPukL2uApmR8bNQlwYy0jZznNHYRFCrHOodDEIW4Snj
         1irA==
X-Gm-Message-State: AOJu0YwFQM9qY2Iexb7ewhz/sCXQIrTxo4g3mFCEV8avpafqlJfLW2lX
	9QswLLrvXXJyZgSBjhf8OI4g88Nmv9POY9Da51e4G//DzNErn35WuzrzVJmCTc+/stfdAk/Ex5Q
	lFZuvNfdBIJBFVw32PKIHg+SJKE0h7ZmBnPNEyrGE4ok4jOXDcVjzWmHDoMKjfo/gr9Sp
X-Gm-Gg: AeBDievbg3jKE7N+e6ddK3XELTUOwK902gfFuaYHd0wf/K6sQBkXPj2Az8blLAOGY2Y
	zm6qDLmlziu1Qz4y/HQcRJzv5ti4OmPBj8fSbzNTH2c8xGYYpe77Gi5U9EMja5CtZaZNL1Kpymg
	QRnPIilUM8w/H/aXyTIEwyVjH0seeyKiw3jRN8Oq4E4Fy6kDICyA6zkbu13px4f0MmSlLoNlfrI
	7kxSIWGKG9Y9RfmT4CV7FJDLOIoPpyxALrrksCZz2rdtsov+QH770dRILbqEe1KLMeOwz0gHHqk
	9BrQW2pDJwrgzmJGnJ/difDJQoRtZ3bI1covB9GMHv4U3AnDR2pqQ7ufec+XtPwPhPTQjl7rowk
	tDuem3RsnCjdrhqLYt4AoiyxdeQhBRs31NxlNxeNyDehZ71f2HTZGe67y6KZmA5AkHumVMgxLYl
	83NGA=
X-Received: by 2002:a05:622a:260b:b0:50b:5286:f756 with SMTP id d75a77b69052e-50d62c83682mr180228701cf.6.1775560718866;
        Tue, 07 Apr 2026 04:18:38 -0700 (PDT)
X-Received: by 2002:a05:622a:260b:b0:50b:5286:f756 with SMTP id d75a77b69052e-50d62c83682mr180228531cf.6.1775560718435;
        Tue, 07 Apr 2026 04:18:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034bb78esm4545183a12.24.2026.04.07.04.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:18:37 -0700 (PDT)
Message-ID: <a940926f-901d-4907-b029-e4c6fc62625f@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:18:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
 <8ea92c00-56ca-47cd-95aa-dbf49ecf4118@oss.qualcomm.com>
 <a2e2df62-42f7-464d-8833-8eabc7d92ecb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a2e2df62-42f7-464d-8833-8eabc7d92ecb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HAsjCm0CJcT6QvebO_6KI0O5ZKk5qff8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNSBTYWx0ZWRfXzqFjcXHj2GOm
 tiDPxA2rDRWzBkyFiTQ2YIHlQnZtg7RRKq57VOvULYq90baot43JwJ1Eon+fiQZ15wZAKXi6m94
 aTIJlS6wKIkEWjK17eVVxLSZjO8q1wAh5SnJCw7IIZjRNR5TB1w36+vrFKIG9bDfILfi8HtvAYK
 sWEIo0ARO8G7CavPwBZtWK1mDZDWDZGSFaodU1WqLgvDK9+Zde8M2uXbW5iCGlsy39bxpH/8Aa5
 1bZB7oy6Uh1S4UdI3KzvIN/K1AqwevewNdBrC0kn+UwcOFwOxXx0Z6YFl0EOuYIN6v2LcFMIQ2g
 eMFqRAJO4vWFSYp7G3ztOQbNw3jF29TsjEgPhkTKRz8WvuFjmSrBXIYaHPa3cA1iDsPim+NMA6l
 NEiyPn1jzgVxMkcBXvXTeBNk1jeKE9FDrefCNMPoCkikiTLHqYpm/pBrC+t/Pfdq6ZqjDqzYQZh
 gkGMM+tU0B+AI4WhCgQ==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4e810 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=yFPsli0tPFyAm-MtiuoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: HAsjCm0CJcT6QvebO_6KI0O5ZKk5qff8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,7c8000:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102143-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55E093AD9C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 1:09 PM, Kuldeep Singh wrote:
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> index dda4697a61b7..5e6b659e8719 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>>>  			compatible = "qcom,sc7280-inline-crypto-engine",
>>>  				     "qcom,inline-crypto-engine";
>>>  			reg = <0x0 0x007c8000 0x0 0x18000>;
>>> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>>> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>>> +			clock-names = "core", "iface";
>>
>> nit: one a line would be preferred, please fix that up as you seemingly
>> need a v2 anyway
> 
> Hi Konrad, Didn't get your comment completely.
> 
> Do I need to send v2 to just fix clock entries in 2 lines?
> Or some other comment to address and send v2 for that?
> I don't see any other comment on patchset to address.

I didn't see your reply to Dmitry's initial comment about the DT bindings
requiring an update.

I'd prefer if you sent a v2 with that formatting change. Patches will not be
merged for some ~3 weeks now, due to the kernel release cycle so it'll have
to wait a bit anyway

Konrad

