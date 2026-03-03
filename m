Return-Path: <linux-arm-msm+bounces-95089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFTwLRuxpmn9SgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:59:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F71EC354
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 839723012206
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8392538E5E1;
	Tue,  3 Mar 2026 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYzhd9CJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5+gEPSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559838C404
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531992; cv=none; b=iV1KZmHjq6GydEQRy0N1thmY2Y7ZVBzRNDBoHfww67Rx1uAS3TglbodRj//n1V/G/EJDw0GOLlZ3f+CvEdhcB0naEXhfPpON0tq9COOQtRy4qn62XiHvwa/vqMYCiQW7xjjtXZWflMm5PptNlZUBoooOs6VHdBRAYL8zWFpsAx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531992; c=relaxed/simple;
	bh=ePB4O0cHZOkJ8sxUasVgN7NjMlfCT3xvscGOSXGGH3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rc7WUZAL5o1WZv7Mxp0csaFoGEguYzeot4mmZzJeJ+YcQIEkKIua1i2uvD8OIbfllv9JuINotOxOmJgE9ErwY75tEXLbGGBgIsfDrClPslKY8TMUk8clkEYTiBA3PREsvzz1KkXOg0pW8aAOqm9+fHu2bJhH4xuNCCBoe/jQomY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYzhd9CJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5+gEPSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mnxd3995397
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 09:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TwxJC6emLtx5stvMjt7gbB6pxCpwjXNj9mK+8qHg7So=; b=lYzhd9CJkqWwC2ol
	RcCth8srmwAofDk1oBO2sbGhkVbMPkEMkS7CBqMxRksquVlFfX2wucMS+pxALoRW
	e6tGTlHrVd3fLJA6dIak5qI79oR1iHWOrLcKlRix8sBZkXFnRCZSHW5/haN8lXRf
	5yiMxwhqOCj+/RrKkH2a7vsed9b15zY03CdiQaGBXRZ03volEGXlj+Kds3hdU55G
	pbpn5r8fS8Hn+/RYMeKrDVU2t4Bzdt5zGQRS5u/39Dba4S+hATn3mS0M40Ql8a/l
	RBb+cDkaP4823qBVqwxd2uE2FBAFISPcnaWMTU/5e0J8LBu7S6T1+OSL1bGa6h0p
	izsvzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fs09s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 09:59:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb45a6b860so364079485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772531990; x=1773136790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TwxJC6emLtx5stvMjt7gbB6pxCpwjXNj9mK+8qHg7So=;
        b=M5+gEPSjq3gmvbK/2gbb0MRJ2ti4VGDSXYT8VoF40AmTvTVA0bakzqgAPuyIXSDCdu
         ggXYriy7VyfHXgEDaEGbQj0YW4H9+DjvzNHw0nsN/PBrj0m5sHn8soCeTpPwP9Ir5cTr
         HMoA4MY7+uPy4pZ7l56bkEOByZAhH884L0sMqGwMQS8FrKAQRGYEpblzuCMJAxPgY7VJ
         0SlbEu736gitkmx06PGp7Y21C+L5Biyy2YLWxtEXAt5Ct62x9bMffm4hQTmuBqWXMzT2
         8jlFUTJaUa3Zjq8QUifBL8nNbYR2P188uLyjX4fwXP+Wgjgi6TWHmFxPV51g54QVbaVg
         3Dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531990; x=1773136790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwxJC6emLtx5stvMjt7gbB6pxCpwjXNj9mK+8qHg7So=;
        b=KcjBYV6W/v3Jp3UO7dgbQ1PjXjSP1KSMrcYe8ASxCyx8a3zu2YQoi+Ucxfa7RzYRJ/
         2DcFSYQqa99gPMRLxY5Ca1b15c+P2wEtUaQFa7sqAiQWklL9rRigzkTJlo1ma+m97Qg4
         ULrgu6wkWrkV1hMl5gdjO9KbZuxNrJ9nehYo8UEmI23Nvb+P+6bW4dyvUN/kUvRiYoOt
         bZUrwSzftQbRjsF/Y/TP9EKxy1NefsRT0Xf7Nsv1frPUBZsOZu9UgkX20PT9S691zZN7
         2K019AG8G1KKQJea4SRS9NoHKfZyyGvd3tXslL+LkAZ6XFdWqEjzEzqnUg7EXHPZxLsG
         X55g==
X-Gm-Message-State: AOJu0YxnW5MoacEuwHxiX4bgZDkbE3RSNSlbQsVRtMnLRz6LZqoZSYHr
	ExszXlaDPF/Nb+vznj1dPhXhsaRyK7IUU+bXCXRe4wAP9lEJV4H8tv6MdTVG96vMkHldHCW8HGS
	hGuJTnjJB08bgwBI/ft3AwY6Gc3fpHQhqdi3mqwsy4pg5v62+hJJx9J79N0bLla2aDCyI
X-Gm-Gg: ATEYQzxFuFQe9eo/k2TaE3G/xYV6ZtBRMjbrvFkuQ0wVD9WE+xDTKb48gXFbc07X0C0
	oixyU3I08j2MQ5lFsHlOZGNEsEuBk5B5LkgNfuB4TSfj5vRxZyesx9OuF+JtvvGnpl3acstJTt7
	5jFAnc2pgOk0vnn9rpOR2UpO31BrvSmsB4kglMPNG/VVyTLzaj8v86GEToqWfy1i4aPhZIcxPUQ
	ofZrwrrf10IRWwvpMcL7foTDswKLpNc05BdYGk7BsnhjcLM+1MDiKcM83a2bb7DafQNjYaDmAyr
	B7q8W/vJ8XM4AJCZOLS4VvmgKary5LWBduTbj2wixQYAWueAC3yCwkxl2LHRgeA0ITwgysIQsIA
	I6KraX7A1LXn+ImDNP/7oxQt4+4co9FlNcgq9s9/4W1bPVuzjwr5n6c+yU1uyCdQGg7wFbR4dFn
	NVXQQ=
X-Received: by 2002:a05:620a:25c7:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cbc8f5a1aamr1520368985a.10.1772531989648;
        Tue, 03 Mar 2026 01:59:49 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cbc8f5a1aamr1520368285a.10.1772531989273;
        Tue, 03 Mar 2026 01:59:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae93357sm565124766b.48.2026.03.03.01.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:59:48 -0800 (PST)
Message-ID: <dea48c89-6718-49b0-ac4e-840e596d0166@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 10:59:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: monaco-evk: Enable GPIO expander
 interrupt for Monaco EVK
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
 <20260303082157.523847-2-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303082157.523847-2-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6b116 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zpL89gEUk4Dp0vX_MV4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: dvJIbpVD64AF26taB-1KnsopsbO9DitK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3NiBTYWx0ZWRfX56/Cq/TeND5W
 RckZMNAnLSuFaHmcLs6PJHJn29KisV9F5qk6bmLe+bvVIsUVXyralcpAurDuhdP5noqVoCb3cs7
 f7Kpu3YGyB0Tb/mo4g7yf5Hh1nRYLxpHvMWKP7St7eFobFK24jvOwCqX+l6XLf8Y30oL9R7MIpJ
 h2Q1gcxUp5fxUlRlRHYzYE5O+jrMHQOfag+0LGjVVRpoh8oMpNJAaTF3rV+bPsMrBRZS11odyF3
 IyeRDRuBtSuL7+yPw+m4mCqDtiyhKN+dMliI4kLtyLEjxg8+Vd1Yk3Dq/KDWwu6JPX3amxGug58
 HJv1+Q+ZFp3ERrohP/D2LTN8khKC8mkaq8iiRx789ofKjcx5633pvvl8KQ9ALFioD4Ud5lvVRMS
 9XOxOyGV940R3eWxUZPMwDvYoPxjtzgFJt8eaq1vSJBEd3J8BhdRjywlKGfiOAbXUf1KVWMKQiP
 vZzRIaZnMmNoUS2biEQ==
X-Proofpoint-GUID: dvJIbpVD64AF26taB-1KnsopsbO9DitK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030076
X-Rspamd-Queue-Id: 5C5F71EC354
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95089-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Action: no action

On 3/3/26 9:21 AM, Swati Agarwal wrote:
> Enable PCA9538 expander as interrupt controller on Monaco EVK and configure
> the corresponding TLMM pins via pinctrl to operate as GPIO inputs with
> internal pull-ups.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

[...]

>  &tlmm {
>  
> +
Stray \n above

	expander0_int: expander0-int-state {
> +		pins = "gpio56";

The TLMM entries are currently ordered by the pin index - please retain
that.

Otherwise, this looks good

Konrad

