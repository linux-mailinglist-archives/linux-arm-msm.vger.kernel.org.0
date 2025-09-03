Return-Path: <linux-arm-msm+bounces-71862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BEAB41F6B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87994200D1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B303209;
	Wed,  3 Sep 2025 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPvTAbyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6382ECE83
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903329; cv=none; b=qzjEu+5R8F70qpMr24mRF1D0yW2slgY9a5rSEwhojNyQdUcsqME1k9SCssOvRJDHRIxgiM7ZkcxbGhXfT5J3zqdgC2dU4aNycOSCltPitm54H2nJIV5xdDNwvbnKoNS0o96P3in9xXY1n97J02v/fS2JUsCZpjKDiwTgf7zq51I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903329; c=relaxed/simple;
	bh=E1Cna2N6t9JI+222gYwxRIEMiszhSQiq7OVsmw0ymsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EagaTxhdZkDw+xR9XI63chENb/fjB2/yxQOwgzBS0KPvfoHERC5fRT5SqHiKWI5NpEFXJlKEYwuTirvYglaUBISsn/B9DzZteDy5ta0Vf/7trKZnG4LQ53HqSnwvGtl8F3vQJETLcSFbR4hTOmTkqbxkYR4Dg7Q3L28R3JqT3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPvTAbyx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BZuk7024810
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 12:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyKqXw+ysFsFYLn6dUcHiY+1la1eKIWGJlMEPy3Xe1g=; b=KPvTAbyxdOAR12ei
	60xecrPb+TPyiRkSD0snqlxUlWPHcUjFg+H7+9e/NY+3CbtQGIYpB4SUyrivMvXD
	mbVDZrMl/Dyq9FQvNxH/MvuLhT3y7oefheUXcplUlgiNn6ak7+EVxa/2tOlOZRXO
	ieQTIBmI7YCIXXNP+DjYp9sEiLOjzWX1jRccygpo8I6Y4PoMLDIvfOYeaCej4V+L
	fhudvYGhNSJsbiaQ91ibNbCx9SwT/QlKkZhgFn6YBUOtCOty1dL5FmUo7T5NWVMr
	VOg5+1WzMxU0JhTwukeWO0CdxEM0LYz61pn0rqDY9NtNyA6oN9vdTXMlqYPnUGE1
	wdLVhQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj078d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 12:42:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b48f648249so2854021cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 05:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756903326; x=1757508126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UyKqXw+ysFsFYLn6dUcHiY+1la1eKIWGJlMEPy3Xe1g=;
        b=n2cHZKbsoES74QOiZV4zvOaC7AFeX9ZJPknTD8NASks02k+ctvX5nMymk4rdelU+3N
         ROpuPO0Lu10dwI9cbv8dbjq+buqteuzXxQfMBG2159ae0koxHx9Hc9nNTvER5pnQhHBH
         ytQEg11Gz26HQl59l/65Kvk/vda++BlqxYDdLKR3OrENQDPs+F8CZPq5aT3ll5v48efY
         6qsypATdJyesv6/NV6gHUC5Tuf0pQcZbHdg3uAv5pKIDLhy5w/QTKI8+GgMuG5+T3zjl
         PvALcWlguIFNRRjgC4pQDj11i5U4I8OcW6O+1Ri904IYPJMXamkGdVtvHNezNyXurUMJ
         e7zA==
X-Forwarded-Encrypted: i=1; AJvYcCXQCg53LIQxMEjYWS8G9xDteFBzo+xkabYf4/3X2X9XdDNs2R10FsGqW+SCmgJfzejfwkSpf/rP5Fw0S26t@vger.kernel.org
X-Gm-Message-State: AOJu0YybLV7v5CvRbXSbwpmckwSjsw67I0UZByI28zhV26ZrcsEFTFoF
	jYfp4ZKiAQ7zWoA9Ubt1dp7VaY5TCpTfii0A9mRniEfINryjC1KVfte/aS89H4vMXjY/bSM/QPU
	DeX5/FfynjZnGWmPJDGzOJFzOTbrnQsoRBXaqHXa4WC7T0xlJj9YcH9FBdvUIlI9bXK39
X-Gm-Gg: ASbGncs0faMpF+lcp7CCo3ll2ekZUr/pQuc4+45QACexIeam08kLFrd5R/hMwi/+m0O
	XHTz7riZd37Skr4mYUYytfkTR217KrXvryFt9o3uMGhrEbndz8aXCXYWx5F7/EfAHvzEsPToW0F
	xgKk8xGXf8JKxMWegBNwoNe51SYlw/Udww52EWc3gl3/PiayNCLV1uFc40MTu1Zs+MbA4i2CxGu
	JaWSz3Fqib6gHYpuRoeklTT9fbMTzlbeuZXPxWaGptEpygI1kb8/iCFVzgoA5+flv8wFMqhPDv0
	nFigj/MTnPba4i1P+xV77ZEkNxZbv3Qg+oDo9/mzF9rrmmlUjaCIHm+vSs9TSdlLLRu3+Al3iUq
	ATmphFHfovpZqayWtFlms2A==
X-Received: by 2002:a05:622a:1992:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4b313dd0295mr147827291cf.2.1756903325632;
        Wed, 03 Sep 2025 05:42:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsWMsoVz20vZMifq7gvXp5WENey2TR6INKN0I9TlYR/V7hgmuniZ60zIFTZtgxCrX1f0kK6Q==
X-Received: by 2002:a05:622a:1992:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4b313dd0295mr147827041cf.2.1756903325090;
        Wed, 03 Sep 2025 05:42:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0467f47d4csm173799466b.11.2025.09.03.05.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 05:42:04 -0700 (PDT)
Message-ID: <3c4751c3-52d5-408e-ae80-df22bcff5d8a@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 14:42:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: add clocks property to
 enable QoS on sa8775p
To: Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-2-odelu.kukatla@oss.qualcomm.com>
 <90b51e31-3217-4483-bb5b-ec328665a723@kernel.org>
 <28b97952-1b67-411f-a7fb-ddd558739839@oss.qualcomm.com>
 <ac83c453-c24d-4c4d-83bc-9ed13f2f9d1e@kernel.org>
 <7d3e5cf7-4167-4005-ba4b-c1915c254705@oss.qualcomm.com>
 <00f50d92-e4ea-4805-b771-147fa5f5ebe4@kernel.org>
 <249f8109-31b1-4cb8-a5a4-b30c27b2e987@oss.qualcomm.com>
 <6e036d6a-f2d1-43d6-bb35-54467edd7ec9@kernel.org>
 <26e5309e-3705-4d70-a2e7-3f0e9344816b@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <26e5309e-3705-4d70-a2e7-3f0e9344816b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX3vIkipiS81ak
 2RQak49MApBHgCEriLaQNrclrOxVjh7cfRWdiGIikbcO0KoPkeKLst0+q79VuDJxS/G9uudyMrC
 PkeC3W8/kppL3OvfjvjsrgeEqyI5KWMTsfaWGRS/iGdTQ96EREtlIxEzEFIj/baej/8jBJrS4cC
 3XMlEbX9QvS0bnfsngPwC6GWJhNVDgTgqrIUtPTUWLhVrtCdPBLs+iPvACLKkAoKVRnmyxY0Njf
 r1KBplBwrr3i4ywBUmL2DhGuAmhJsOnoSZmDGebdWIch4rQvaSrCu2HFhP8oCNn+M0xyryZgVvX
 ayt/rrRVqROrAF6ojj3Ahc1To0V1wXcc3N+jNdu+Un9VRSTOF2B3XMKluL2ktA2hzqhGlzTNbTZ
 RJIVI8jB
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b8379f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=XlH8FPY39J8rQsCe0dUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: JTDPKfVQ3_Epbx-pp0qZO3hS9OfnnQ4f
X-Proofpoint-ORIG-GUID: JTDPKfVQ3_Epbx-pp0qZO3hS9OfnnQ4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On 8/28/25 11:59 PM, Georgi Djakov wrote:
> On 8/28/25 9:20 PM, Krzysztof Kozlowski wrote:
>> On 28/08/2025 20:16, Odelu Kukatla wrote:
>>>
>>>>> QoS configuration is essential for managing latency and bandwidth across
>>>>> subsystems such as CPU, GPU, and multimedia engines. Without it, the
>>>>> system may experience performance degradation, especially under
>>>>
>>>> So how was it working for the last 2 years?
>>>>
>>> The system may function normally without this feature. However, enabling
>>
>>
>> Huh? So you agree but keep continuing the discussion?
>>
>> I don't understand what we are discussing in such case, but just to
>> close the topic from my side and be explicit: based on above you cannot
>> break the ABI.
> 
> To be even more specific, if we already have some DT binding without any
> clocks and reg properties, we can't just suddenly change them from now
> on to be "required". But they can still be "optional" and this will not
> break the ABI, right? The old DT is still valid and the QoS will be
> active when the new properties are present and this is handled properly
> by the driver.

Correct and this very approach was used to retrofit QoS onto an even older
sc7280 icc driver.

The icc-rpmh core already ignores QoS configuration if the clocks are not
provided.

Konrad

