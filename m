Return-Path: <linux-arm-msm+bounces-58263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2085ABAB54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7244E17A2EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8933C20D4FA;
	Sat, 17 May 2025 17:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ufi16zhk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AA4B1E5F
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 17:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502529; cv=none; b=nJEyoxikdCn9XvbErEducitPEfJEePbpri/3ZotSyy4iypTL6AWgJihcuRtURtNyqcUYHeYGMKzLXWgoYBvwk7hQnHlEv6dyscXcl0otXVR77jPNDeCFzN1Sn/odU2tISC6b+s0Od/4up1wxfMQHRidLFiubbWUTZe2m3PjxiRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502529; c=relaxed/simple;
	bh=+l9GamYZn3f+jD1UlHjWd9HA650YDn1py2CabjsIfXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+sO3WZWshYfV8QZaHZdnmB1viSCDWyztWdxjQ4Ffk8WB2KujaIDqUUkVvOp/xVFcZh/sJ6iO5MNnT2roivw84CkcA2gJMQ+/l3kyhZZOwNpKmlaaYBvwwNBOw08VUDfc4b21FE9sjAiP1yhDX9OgTnIwHUBGUWhmqV4ZTLLtFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ufi16zhk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HFVeA4017451
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 17:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaYvBTUOPMm3NmMw/KYknJOJxfamN5XhveQqTP05DK4=; b=Ufi16zhkHsdDq9kM
	293hX3xiDnBMQnxSWbYch9Ycyq1evBnBC0HqpoNBXxfO9ogvvFT72SHuNWdwUXlc
	3ldfADVZ5sos4yfaYmhabNJdGPmjFoT+U9/dOkQz3RUfijKNIjlIacYdIcyndN9n
	+WyNzZGQZnbyZLprZ0HK+Lw5SJn5xoGhmxgp4AvQPzZFxhvHd7s4dvI6P+t/WzD9
	pnNI0iIudhAzPNiqNp6I0f7J3OTvN46BLjXBvSiabkE6gPGG7veRXQcFpXqdaL3q
	+p6BybiEKRSX/1fWh7bL8TAEH+97YMNktsVRNefLMmKTiXNWlC3ro472zf23sDSc
	fHzuiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmerwu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 17:22:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476783cbdb8so8040181cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 10:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747502525; x=1748107325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaYvBTUOPMm3NmMw/KYknJOJxfamN5XhveQqTP05DK4=;
        b=d2IUKiLEzFPLzTEY8htWAq+SZkec5plp+w2pr5u1v3TnB7g+YT52YKX+mHwsQQ5dR1
         /2CBqE4wztJLI06Eed3vZVwMf8aRx8jd74VTotH8ohS7df1U/vXoUdB1RmgrTlqQsuob
         8lSAS4s5AlKdwPfkRP4h6k+imRIDTVdqsbwGQibL51v0pZ81DtVWE/HCXtco/k+vYkpG
         N7I1yaIvf8TDOr4K0JXhj79xllEILVuBjDUAQ7Q7RkCRLioHLmqmoK21BZ9iSuieluTq
         WWz3veQv2T8MG51i1f6mwcUDSNo2f4WStUVkbLvA0eZgA6nEgYivN8i+GephOn8K4LtP
         JVrA==
X-Gm-Message-State: AOJu0Yw6KWcPrzQieAFK3PocGQrsQMUa4ilPB7Vvdc0JIZtig+Uh4rfw
	v32cMn9oJWBVWU0Lwv0HpafjE93WhA8lsBKmxdplbjmbjbklve7ZTJPSS7l61io9oCrDdjzzdkf
	l8bOyrd3bEieXONg8VwVuXTL4VTJlT7UGlVpTfDhUzbvgljwQBEq5t3MooTTV8fCLJc6O
X-Gm-Gg: ASbGncto2sLqJkT1H2JwQqe0DWljgc3uxiYCBJ8xpCUurAa1rqXqSQxQm5PngVBEAzG
	THikFR1s91BM7mq9QFe+/b1VThtSkoR8GAZhmhwiJOz5Z5i3Arx1Qu8pqBldfWLpzcgaMwK17Ka
	QTLnJOjDG/j53HeTGUw8w4ouXhjX63Zp4SHL2QrPn5H8mItveJDCVNq/EqChA3lK0PdCp36AYPO
	pDN0XCYIrOhafyZGAR2uibDekCWjI3KPu3H9wmLJwMDtJC76R+5zduo8ntm6W3DAWJTtQn65ocR
	agYYrHg6eJIw919bZCR5mQm7euIwRWXILe0haT/KVB6uv/tvfxzhNUxF9UxZ9ZvoaQ==
X-Received: by 2002:ac8:5fd6:0:b0:471:f437:2973 with SMTP id d75a77b69052e-494ae420597mr38013121cf.14.1747502525100;
        Sat, 17 May 2025 10:22:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3TScCxrWI7lostxcvHuzawFN0pYwILhsszzZBg0GnufstHIE77GpV2aqiUIY/NZ9NCydikg==
X-Received: by 2002:ac8:5fd6:0:b0:471:f437:2973 with SMTP id d75a77b69052e-494ae420597mr38012971cf.14.1747502524744;
        Sat, 17 May 2025 10:22:04 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06eac2sm328191166b.63.2025.05.17.10.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 10:22:04 -0700 (PDT)
Message-ID: <e67f1ba9-ef46-4d8a-bafa-90b793a3c05d@oss.qualcomm.com>
Date: Sat, 17 May 2025 19:22:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: ipq5018: Add CMN PLL node
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
 <20250516-ipq5018-cmn-pll-v4-4-389a6b30e504@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-ipq5018-cmn-pll-v4-4-389a6b30e504@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6828c5bd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=tOIPKxuczE_Drth-FjcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: OXHUuRcV32QtFphYfGJiemgw3WuABqPP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE3MCBTYWx0ZWRfX84OGeVcg7LX0
 jALberaaPkORps5JOpivHsy0KXbJ9aCO/mm/js+1LFiPB+k8TGU4mxN8QeFSziteO+66LaXgItW
 5/pOxDqR0+S/l2DFOIzqUPW5HRGdsMrhaYDbJ3C09X0pE3GU5YpyzVsxKJZfsi0Sh5ZgcZWlf+p
 R0L092WBniey4vPPFv1r/coItywrH8/KIN+2ks0lkjF83i1HTdX964P+v0ctPZImcdZN2ewWpHo
 aAndG9kQFN7w9DwctKhT5P6x9kqEjnRILPK9TMA4UvIa5SDYs4UKXWdsM5qMI0C2MyDDIUF+Jdu
 tqagBeVMNc3CYBgxazXofR+Hp1VgT80Iv9nN1Gl1PDpMUgutAsYaMs3QooInsgLE4rHZnpyQQnl
 wfWHohQMHD+y3a1rKkDI6CvzSLm6gcwqly45BVZ5rJHAHcElG4QNfc0aK41rymp3ggjboAOB
X-Proofpoint-GUID: OXHUuRcV32QtFphYfGJiemgw3WuABqPP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=746
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170170

On 5/16/25 2:36 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add CMN PLL node for enabling output clocks to the networking
> hardware blocks on IPQ5018 devices.
> 
> The reference clock of CMN PLL is routed from XO to the CMN PLL
> through the internal WiFi block.
> .XO (48 MHZ) --> WiFi (multiplier/divider)--> 96 MHZ to CMN PLL.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Modulo the clock rates which I can't find a reference for

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

