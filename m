Return-Path: <linux-arm-msm+bounces-101280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG3REtDmzGk/XwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:35:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98818377BC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49E9C30F3BA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E531339D6E5;
	Wed,  1 Apr 2026 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNC61BQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SxzWc/Zj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C4B3806D4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035295; cv=none; b=qqxEt9+4FRt86WNzC2onZjXDpViwrmKv6ZccufnjAo7ciu+1Kts5q5c0jv7Cz7XHyMwRCEneXvt02x9Ggwxa6YZ5pDdpjwVnh4EyPYcR3Fug97WXVJo75uMmE6d7H60Pgx41mmo9tg1x78P5WsHCAeex9uC0EmgdiW9LozS0eUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035295; c=relaxed/simple;
	bh=g7mTCaNy+qXAYxV5j5ONa70Z2PoLfxCg80HoTtjWOgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qh8X/3S7sjlCgoMgme+HtFW9MRY3fzR33nRwD5pzhzPv2OlzTA1H/2aW0P1MVtPINGtknkIibHWOi0p16/7QeUDMZIu50BK4/HqavsrLwT07u7w3AJ8Tyq/OYSbDDH+WN0fFwXrx32VaOnCNJgzOxbUdYG6sYTPyftDfcj+5OCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNC61BQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SxzWc/Zj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318256Y1006550
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWmGZ7CZcJb3X90qICYay41hOsfqZ5P1zWycST4heJ4=; b=nNC61BQ24hkqlOFz
	4FnjbxUUaAv3GSHKXxbEgbGfRwsjrR1PBxpmo8WQyGmc0+wbkuY607T64Sg+Ra5n
	pAT/o1/a+fGvZg1MqXYTuHgdIeFK/NQR4y8uEwQpHhN6P0QsKTRp/z/4cO+CcUNR
	ZFE9Tq7rsdZlFdcrpTQyH6lRFUapKwnODAwXHo9omcs3gGInlPRUQQegiR8y9qm3
	/pKsFGPgsVGa/SBodtSS3AL5vRD0eRwYvawpF5UIMfjHsW9KUqRAUp6+hR1tGvtB
	EBC48VKX/UwY/83seQuEoUxZT3diTFPVwieRcoObIB3YIvGHLbQU96fHlZKCjbCH
	Cl/R5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhjb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:21:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8dc8b434so203499785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035293; x=1775640093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TWmGZ7CZcJb3X90qICYay41hOsfqZ5P1zWycST4heJ4=;
        b=SxzWc/ZjSrRK+4AUsxrUo/cBgfRySw5h7kA9UzdYUh5//I1du5zRnCPtZXpIWZI0GJ
         wPFj7MEb8fXhd9ji54u9WQOvi6zRfjigFlH+1RU0fo+89spyBjtir5OsoJle+uaBXWaN
         6SL9m5WB6Y506oLUSSIATy3s8zlVZvNOshEUjr5QkPGnMCthPa9+k6q806Ndc9ls/Pux
         7+n+gPzTZXF//wlOZ1BtvZyUJfBlmfHricR1DX/XmpSiZ1Vuksc3REZXzPwpmra2ydjH
         5eBGCr9cJSWHkf/bx7r75/slVRDNCCr8bz1SDhrMeYRtahlLGRylDU/E+una/ljIYMl3
         jzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035293; x=1775640093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWmGZ7CZcJb3X90qICYay41hOsfqZ5P1zWycST4heJ4=;
        b=TDPZ7JiD5oo50FPLrMZW57Q0qvvPi8unZmTmwphR7dJaceCHo7gnqLm7ZxNGGE/8u8
         qqahZj0719rBahTo7rkXYOncrp70NFexbad3+AkhfqzkQw3q/FfNFHQ79FmYrcT0N/eP
         pYiz0cgrEISD2b8hDtm2mRNHaZK5AtxHDfp8LlbM+ztZUK0s+4zVqGrZLJso2BPN6O6I
         xFyHk1r8CV6Cw2VGfS9uoLnlBqocxqFvRRZYVdRTy79o8fPqJcQWbj9d2OSSkJ3LeHvz
         +mZzxpzwLuakk98CPSI7eXcZLFJ3tlWs3Cg4qD+TFSMZHgAMf4jO0x5Sr3NSiBaiN2ii
         Qx+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+tWSe7nkPDcT12QbMA7HBHIJHh3GJMGfIz7GlhMh5TZlcDsl4ZKFTU+f02kJEUj3zNpPuIVj3rRJF6Ilf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcq0r7pP8+ovI8qNszfGkgcHEJlzJO0d6xvbDC6I77+vc1+UFF
	r1zgX1DfTSpg4Kwq5Cv3kVJ+6+LSjpA8iUflQKltFHxAAqy95YsePjWIkpja89EqfQe/P/+mJTd
	78BjP14qBLFTfK6AWtPsBMMaXTmtdo4xo/4MNGRfAlzJaQyMmSOPlcL5AMdBv8v+Xj6NT
X-Gm-Gg: ATEYQzzBcrKukujQFW+/uFN8+eQM/wg1q5lNIqE9HfgEgs2EECc0GP21W6t7mHGORxE
	7krd+Gn4RzTieHNXN2B/5cszVUHaivJyd4USGgXE6cpN6BJzkqeB6nhFDwjJgbdbBU9caB5YUH8
	DKJ05qnrAvqcE6/B6evwnjRJbgai7SVObmPyINUhLV2InsqQC2vqp7YOIEpuJ3GUHPNnRpf+y6h
	BSQONLQ87zVTTK3H+d9Eu41uStgZbwJ/KYAW9RHAZrM+xjlbjciNNy9IKAdFxxwIwpnyJ0x1qfy
	sWgxRt5xmzJckaMafxb1b15E4JUNSklTKXcPsFQ8qqy5tVQw/aw4HrygxIeWxPj3x+OWqrjnzkt
	qicvWPUMf+GTPINwP5vbWc990KGb2Vh3NjTrHifhydCYVjtAw1QxEJ+wGE7QvJQ8OV3oD7EG8y5
	1u46c=
X-Received: by 2002:a05:620a:199d:b0:8cf:e930:8a9c with SMTP id af79cd13be357-8d1b5c03f81mr278769085a.6.1775035293186;
        Wed, 01 Apr 2026 02:21:33 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:8cf:e930:8a9c with SMTP id af79cd13be357-8d1b5c03f81mr278767085a.6.1775035292757;
        Wed, 01 Apr 2026 02:21:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c074f0a49sm2535246a12.1.2026.04.01.02.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:21:31 -0700 (PDT)
Message-ID: <7b2559df-5131-4893-a28e-8d5dd909bebe@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:21:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: power: qcom,rpmhpd: Add new power
 domains and new levels
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-2-c830c79ed8f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-haw-rpmhpd-v1-2-c830c79ed8f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0Bnc4X262nCMJWSH9mMd6MB0geyKPpLN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfXwymtml5/wLR3
 L9pg9W/a1HEprgYfeRTQL1oEakx5xKI0wf2QVMSNUF5CNOIgKW0iWrwBUtqXQOqUdXpXtiXALVU
 FBEmOEvreYZuaT3ew58eqDbYDeBfgP8KsdENG3AhbIuZHh41tVSn3QlASgIVtgJslk272I7w929
 Ftcl/KCGVEnUguB/OaTA3dpBDQjjuLvOCltz0z3j7gtEmx3JhxN5CNEsT7UtVZ4daSjVwPQigQj
 YyBEemsd5Do4EEzbMmC+Rp6/7D+DkPiiTh+F4+C11G0q8hooDQhMnwBF1etX7FkeYBsugQ+k6/7
 4m+yOUFl2gdXTpq57uBCqOKz9VNm3+3Oz5w5JM9jFQjOMJyyHG61TY4Nq+v/Ts9TYHUgl/LMBI5
 /0lycf179olv2MhbEeD6Ip8ejNcT0ztD4t1wou5fZPL9miLZ8jTy64uRfXyGsj3QS4VDArPUr/n
 ag9HV1hvFX+jmQyuIgQ==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cce39e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5ybyJXMKkUk--e2QuikA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0Bnc4X262nCMJWSH9mMd6MB0geyKPpLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101280-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 98818377BC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 11:15 AM, Fenglin Wu wrote:
> Add definitions for the new power domains which present in Hawi SoC:
>  - RPMHPD_DCX (Display Core X): supplies VDD_DISP for the display
>    subsystem
>  - RPMHPD_GBX (Graphics Box): supplies VDD_GFX_BX for the GPU/graphics
>    subsystem
> 
> Also, add constants for new power domain levels that supported in Hawi
> SoC, including: LOW_SVS_D3_0, LOW_SVS_D1_0, LOW_SVS_D0_0, SVS_L2_0,
> TURBO_L1_0/1/2, TURBO_L1_0/1/2.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

