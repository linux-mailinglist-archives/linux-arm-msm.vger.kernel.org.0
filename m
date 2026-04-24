Return-Path: <linux-arm-msm+bounces-104463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLfBDDFg62kCMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:21:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2926245E541
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34C3A300185D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5545A3BED33;
	Fri, 24 Apr 2026 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xb9stAXS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnVovGtd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A743BAD85
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033258; cv=none; b=XdOxyOG6h21uTCx2FRerWTtHf4PJeZ30HJRFntdySomeL1KiMSTrXfK6aK2FnLKwH7hz0fsheVjmU5tnh/2vKQX80IFNxXyC0FBXBYnGRMjDo93y7eoMZfsWGpETOOfFnEOpCRKb4TpuA6nzg1hkImzkUQOdm1e7Qu44GpppqfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033258; c=relaxed/simple;
	bh=yA8ziDbiiuDYXL/uNT3NuacIBGDQl5QA1yM4wel4tRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqPRu3jy08O9oRD7CBU1FJr8SWauDGImeoqbS64PrvnB6wdkYvPgNpSUri9ip32WDppGSipDMuIFRnkMnFZ2GjuP8ZBD7JG9kTJv/YYI9r+dIC8xfY3l5TIdmMN5TeYuieK7vycOPvrQh2JUR/zAtbEZXmoY55tN/2Ed6VPvKxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xb9stAXS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnVovGtd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8DPCJ4012128
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMMw4YsypbgdcdXsMiXryhtFIOmYWDOgJ2k0IZlBLls=; b=Xb9stAXSdOD25ISX
	8T0bNeqeyxKc5cY2LFlOuz/jjHIQZLxjpo5cVDNXfcda9rJ/nnMroYJ7tSIL8Sl2
	GwRPN7MASEVX2E//7nHgoJRx1GFy5KhOEgb6C2TxKS1epmNmiXgQWWHFtY8vgkbV
	nY5HL0fgu+jpBTzgNPr+bSKJIMvLQaPTiJdMJEBo3z64nxsqKEghAjRF2Yyr9AQ4
	CY9uhm5dXz+1fkXvlASWj3FW5Wb9VI3skFW5iG2RXQNxoIh6oZon092l4mKkzx4K
	VOZQUCWEi0plDxqamCWkrDJ3moQQsSSbvACPagjmFOODC065knZfVCAzq7ek/Zky
	7WLo6Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9ve22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:20:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so12942581cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777033255; x=1777638055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMMw4YsypbgdcdXsMiXryhtFIOmYWDOgJ2k0IZlBLls=;
        b=EnVovGtdphi8R7DHJ8upPfYBjiKVA7QNFMjxtPWGjKsH6oWE/8rbjSO2XFwn2e2itb
         Aw1RuA3oDSlAx47rvoakDpedpNXZ5bOeFt31DuVRozPzHcwGnlHfMEDR39vkEyPnDxQJ
         Ks5P38i3es2UInRzKMTxK3za/emIljgn8emdk+f8OiF1NiIh0+nZZZr5B2PXFqUQL9FW
         tsveCR2NM8QYHqybeZrAHmwoz73VM6LmxZ0sEGM4P1Ys9dkVbPyPshS87vq86GmiW+dq
         dzmTaRk0kNhDzd/9EmManQ9QaXP2jLIReDDckLsxRGXetd0BVuHoD9BKjFzZH0nQgY6Q
         4qMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033255; x=1777638055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMMw4YsypbgdcdXsMiXryhtFIOmYWDOgJ2k0IZlBLls=;
        b=ihInl0wJWECUNoLjQDPgC2cjhSSAnA+8dWcArtZ4MxoQeaS9pufifOKiQd2sZ61fbX
         bBhSeQBPbFkqhBePYBuFDaWjcw5qM2hgWExQEeyrmh0ZbwRB4Q04lARBwpu36hVmdG6w
         XejUzsqRFDJdS6CSg7x5UzTJBq05RVt+nye6fxY4ffszqwWrGORu6nUZiaEI6GVlfj7z
         PV8ZYZ870aikAeaZencHFYDxYa+D5CSTqLtulAEnv8Hwr+KZL/X5UdncXq0rswPb3m5I
         8N9kpOteVcjx2jjcmD5yno4kkfb4bGpulrU6AZgumZitSn20BnSqJ+ixjrAjAYMlMQLt
         knMw==
X-Gm-Message-State: AOJu0Yx8Lagu9lkC7PRPU/0xR/+bBLIwMzcHuyyzKSh5dGRhA/glqWsu
	isTNM+yX+5u9yEDhkO4JEpis+JVj68pJWIg+D/NRWmn9TMtHtuW2yXBoC8SKydcqzPg8TFRMubV
	e2fO43MA65VOmsrIw79TB4kFGiWoSjDMMvnJVkGhjjkWzqi2S4IcodH6r7mmmK/JbXobN
X-Gm-Gg: AeBDietdYnhV9FRmXwC9z8V64hO8f34YbNpLfzumO0j0rM1zlBBciiJZvoOuDg7Oc2s
	xoxe5uMQ0n/3hd9BWQuyP0S4f2UEvyaqHNHZoJ+4QxftoOsSnziQASMouyOycEuPAaTbtPQJe1S
	WC/ri5nxAv0C5Z/ryeCk2A297Mbbpw/xvtscGojyfGPMHob2ImzSr5IxI/qsr1oO/maDTdycJbS
	BFzQN7bNQFM0ShFJywhlKDVf712IbOyYLboj5C5/8sjhxKEQ033SyBg3cOD3GogyPXdyVaNXxLb
	ovLUg94Z1d6E8YZ9wcFHa5+atJxTXg0lmIyz/Qnjae94fBJ3orqI8eY9CeBOVzdtIwX2wcMwL2A
	ovh/gMu86ZwdXjtrkKkqNAqecO6kbEyr6bnzJIRC1F/Pwm6oV8A40DqjVvwi3Hg/HCDVGixxeN1
	qM7hNZCSLSCvBe6g==
X-Received: by 2002:ac8:5f0c:0:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-50e5e6ace9dmr212489101cf.1.1777033255242;
        Fri, 24 Apr 2026 05:20:55 -0700 (PDT)
X-Received: by 2002:ac8:5f0c:0:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-50e5e6ace9dmr212488771cf.1.1777033254745;
        Fri, 24 Apr 2026 05:20:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e49sm793905666b.10.2026.04.24.05.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:20:53 -0700 (PDT)
Message-ID: <0c7ddcb1-306a-4afe-a026-930b647d8b2f@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:20:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
To: jsandom@axon.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
 <20260420-rb5gen2-dts-v4-5-b461909c2de8@axon.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-rb5gen2-dts-v4-5-b461909c2de8@axon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfX+OSARdsqG/O6
 QXL4sf4Hy/2IxKRlvBoQOgsX4yK+42yC6BhIvfoJPztNOJscNKGu1/Bj+PsiKjDToKSfYpu2N8X
 lPgd76CRBqqdpC3y2dSYGWDRb8DtwDiE7AJLzzIT7exNtt3z216IXJS5+DRwHuUqmI/lCehbrOL
 YdMzWwJBHhO0MU8ZTUoxZC7y8GNBpC5ljuzq9DXqCBiZqLE8xIHyq8SJ3WP+fP+19Tmgny6UURc
 YF+ON8eT2ac6Jz9/FfNwROuukKa+bL3XoIwspNvqych6vJAFC8hbg4xHoeTAU1Wj6DMjlK4NJsn
 oAiByp9pN8iPXe0dDGqTaO2QVqo6b47j6V/PeVh54e/twrqtu9+A0QyHGPaBmKt6XMAisqEPcbI
 I0Q1om1o1Yztku7FjYTBvWXfbRyNgEqjOBAn/tfJuEvoxEFB1BKuq+30GltmuycvXRjEa5L7f51
 oAHxFRmPa7A1z/OplBQ==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb6028 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h77gEMGJAAAA:8 a=2a3GcjfFp_zg-3xO9c4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-GUID: wHbrgmTNqKFv-wL128MCJ6ykpd6C6ZbH
X-Proofpoint-ORIG-GUID: wHbrgmTNqKFv-wL128MCJ6ykpd6C6ZbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240117
X-Rspamd-Queue-Id: 2926245E541
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,axon.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104463-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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

On 4/20/26 11:13 AM, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> The RB5gen2 is an embedded development platform for the
> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).

[...]
> +	upd_ponrst: upd-ponrst-state {
> +		pins = "gpio182";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		output-high;
> +	};

This should be made to mirror:

https://lore.kernel.org/linux-arm-msm/20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com/

Other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

