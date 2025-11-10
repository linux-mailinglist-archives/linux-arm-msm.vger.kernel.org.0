Return-Path: <linux-arm-msm+bounces-80955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F56C45E53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0125A188E730
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5853054CE;
	Mon, 10 Nov 2025 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ekezcl0q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPHspo++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99179301010
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770125; cv=none; b=N9h9AOmukYzuw+19nvF16G5neq44Pb0c0QaPHrv17YPFxv17FQIzSBQsLCxP9rv1dJC0uM49yRQnaV4UkswU7PkzLGJfvyBguGPxy7zx4LjkF3VT3jLfxOR3MCRM7bkS2UBdAm5E6v2jn3PIz6SyRcqo94noLCKli4dzpNNPrVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770125; c=relaxed/simple;
	bh=BYFGMXA/UXxp1mCIzOizUs/qzKuKUPoAJ3Q6wLSw51I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lK+6Ir9WiU2BkMm5vuFLHU3cXAotoDjqy+y05ZDfcO0cAabexxtc4RuDScfr9sPATGPoGeOJ7ymQeOAoxL2D5VATMoT3tmzJ1cnmpP8plMgTSh3OyzSbZZ+BeaDKaf/h/eJB04ShxcF6GRnxKTjZGsVCll8dAkGcCatVoljS+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ekezcl0q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPHspo++; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8GgpY1354723
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vgVa6+vfpuHHyT/6RavB+XSFElugjvayi2iI6sahjk=; b=Ekezcl0q9Lbj91vq
	kjEzJYMIIXuYpcKx88PQMDaK/dx5fmdm5SictKhofLHzdU33P3G/HB7E9hrn+wR3
	c5OcZXvuMG7C1U7gWs5fSMSfQfs02OqVoWaJZ4HJAz+nazUoCODEI2coYTaF5rvH
	EQXfS89a+4MoNpaVDTrWs79/0BCxbvdK8uX4prncAES82CayO+sjNIuJm4tm8jJw
	FQmhr/CTykqh2JdY0ubyaSI8oKov8DiPyPLpVoJodBQE+iW1vud9f76Ojbu5z9PJ
	lAOOEFiqlUCO9HNn6lKmo3rmPb8P6cM8d6qx82i5AoCAcn6az8sHBR69TRJaPqzE
	m0M46g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xs7cdb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:22:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso7803561cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762770121; x=1763374921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vgVa6+vfpuHHyT/6RavB+XSFElugjvayi2iI6sahjk=;
        b=NPHspo++FFQX9XYCPVjZCGTMDBKQh+JbLr4dy1LpGqaPY05zB6/on/lCnj4LudMGS7
         y2JbP+pKX0vl1mS0H983c6XbVPBCod1XUuAaIeYLACCEAVbvnhET1wKz4TIwDQo27FqE
         Cet4k56+Y+ibO68njmemV7bro04wYJyY7fnNVOBuLHrzcDvVZFGPPcXbQO1iIsUcX9Xc
         AlRZRhO5fbD3jmVOhoJyMxtdvKpNnMtZEs4EQ3fzqLv5cxf1rIpKfkxQjr7Bb3kAlABB
         2Mr80OcPsSeh1sArhjsJMHRHQ5O9lOht/OAnUsEBCzxRYVMl7Z54DBV6SVa4dMp9Y5Q4
         NkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770121; x=1763374921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vgVa6+vfpuHHyT/6RavB+XSFElugjvayi2iI6sahjk=;
        b=QAyLPcMhHgY7hueuz1a3aIf9OF8Losfx6CgHwe3IkCeBR/gS02DkLjr4RkT67y8xPA
         CTSHMwnxGb97xMZ28D/NVSzYl8o5kx0IA4jreLdk0XPQ8JAyQaBlYf82vu509jK49c19
         Wm28H+ZH0bK3t75hJMelKrGU/FhKLOuNL2rsOpvkGCpd7h0KOIop0XlR6j1N9YqaZ4o0
         RZsBOkIsHQ0yyv0yX8MPXEZylegRn/GPafbRXr+BsVmdBdWjkS0Xp30sI3IQydcncZo/
         +zt5kHgU83JP8y/u7hajCPKLqwAFJAA31SkJEDCUo7UwYO5O56IfsIaMPVj2BczlIpfW
         es4A==
X-Forwarded-Encrypted: i=1; AJvYcCV9EooUMtCS+mC7uSopk/4OREpbIe6xOo3XtH7iezTX3/M5qLNI287JRhfhMvr8WhdSXmxS4McoDyHsg2Wr@vger.kernel.org
X-Gm-Message-State: AOJu0YxGvwl+k7+USxVpsv4ty/bLaStr7dqHWV+srrZlsk8MvliSKXKR
	2w2IR5N4dZbQ9xE5RQMYMobspHexJJowz2ur3D+ibvCyobvUBd0+yVoaYF0fdN/dBzxNJwg2J5n
	o5nYZHfsdlW/x3wesOS6V90FUoOHbywR3PxpaFU9TMLLG3j3NFc5W4XS1Dqu59X/WxqjZ
X-Gm-Gg: ASbGncsD+5Fgl1WsHQQeqn/RyXInT7tXW8UED2c6cUnpBHPa2v5hqEXbcRkJqU0eeDa
	aM4/ZdTsk71Gp4FzMKAF+dHfPsPx1rqoVS9QqMsrG8sNmhuIEIjJW+/XCs1BsCKdkbFFnAJEyet
	EQwc8EMY91ii8auMTB7fDE+T6U2pD299u7tcF4QxeB+k2ClvRrRfPJwnGpHBOloUE83E51AZ2AQ
	gY55qLn+2+tktmOER4a0A2qvvcXz0/mtDS8nzZU2gKqsysTOtcVPtxWNTFEFZdEe96swCsL3k4p
	6RVw6HH1BTPkvrZWBHIo5BEDKRmrNLmKVu0f5gKunLHQYqOlqcQjzkYMCrSgW+OuSoZTV6x7F2y
	9pEYyK/SRtpE7JZLZLy+ssEUs7rEmpQH8563JgIztynRiMAXxMloNh0LO
X-Received: by 2002:a05:622a:24a:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4eda4f9ab05mr68489191cf.10.1762770121017;
        Mon, 10 Nov 2025 02:22:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMZeSyWG1kpIQ0TUH1bX2pG4Eapv1I51CVFEMZ6ksXeC/t9idk6nZNtkUGmJLq10rhDDTVBA==
X-Received: by 2002:a05:622a:24a:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4eda4f9ab05mr68489031cf.10.1762770120650;
        Mon, 10 Nov 2025 02:22:00 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d461sm1104993766b.47.2025.11.10.02.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 02:22:00 -0800 (PST)
Message-ID: <55870352-eb6d-4cc2-840f-9de1a59ead93@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 11:21:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm6350: Add clocks for aggre1 &
 aggre2 NoC
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
 <20251107-sm6350-icc-qos-v1-5-8275e5fc3f61@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-sm6350-icc-qos-v1-5-8275e5fc3f61@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cFwlWtddD8BssjfIWBsT7VLrQ2D7OXKF
X-Proofpoint-ORIG-GUID: cFwlWtddD8BssjfIWBsT7VLrQ2D7OXKF
X-Authority-Analysis: v=2.4 cv=LtifC3dc c=1 sm=1 tr=0 ts=6911bcc9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5MCBTYWx0ZWRfX7w7S4YiBZ+8f
 adkeNnonAA+9yldAvRPIS/b218gvszxUtLgD7BEsttvmPCBoIjwA8ZpH3MldD9JLMT+PiPcIrFi
 j+hC/KxdeYZDnkn3ZViUMu27LSGpixgq0ZJ4fzVOAlQH4mksiW0wZNytFk7KkzSnkQcSQBIvhIj
 8bv7gm7daRJesA0wbJb0Ex7bKRT6sdPGRMFCnbC/g29Htii+DGNA5IzmS7ietEgReHiiELQzZZB
 K6SWGbx+rU/Q6ty8z3J40ToAHDY1gUpmPz2xPIQs+kl7hqcPxqF0LhLWq+Z9k06d6nJxRACh193
 aP0r3HjvBs2J/9GDiyCu4jQ6SMpe/B/GmQz7yaBPmTuZysWLm1i4UcwyPVQB7sC3fiqqxx9Uj2D
 uJpS19NYuw1Hz7g8dcX8v5/6ke1zcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100090

On 11/7/25 5:08 PM, Luca Weiss wrote:
> As per updated bindings, add the clocks for those two interconnects,
> which are required to set up QoS correctly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

