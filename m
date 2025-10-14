Return-Path: <linux-arm-msm+bounces-77126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434CBD86B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C1391897E2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F922877CB;
	Tue, 14 Oct 2025 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQW0d/3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159292E7635
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433778; cv=none; b=HCpdYsQRJ44eG45S/C+trB3nXXaoTI4qOQnup/HNb+JS2yKlLHMKf1YMEpQxFQp1PIjuqIbCQpps/ZMIJzNJ2F/W7fYAeMCROVF6MRv0Edxu7cfS71NLUkabQ5EdUHyxJ25SdQ6+YDlt2BQZm7WBuuHbhcpOyPTFuyHLkFL7KQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433778; c=relaxed/simple;
	bh=4kdH9JwWn5BUz8jMj6r/TaxLP/NSVJU/tJpy1sBaGwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/U94b9RKyFnP+CirKWYMrCNJAAPn3G+kaqZwoHebLR9JzMGY2Ju9dras+Cq+r3SPMOLmmk0xlErrVD1Gp9YPT7cZnBpha/YwvdoSTwW0132g7183JB8JZpT8TJnImF5wLLMkGqJB6/AVFLlBzljI3RiEf5hPHlZYjI+pbk/sew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQW0d/3+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87HT4001472
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBRR5H2TkKxKF7H4pKihb9Oc+NcrIbt0tfqa5n/nEGc=; b=QQW0d/3+8jWCiqK9
	aXFu4NReDnyno1hQnDd9X1Jx11vJXCyQNNBumCgDiKLY0VZq6lJdEpMTmqI6cQRM
	uU/vTq3EwIHSOWzJj//TDDADPs5EtVlvLL7uyRRYkmvRv9hDI4qf2QyanIPc+S3p
	PP+n9huZ3z6atcPsfZS7gpelklaTApv4fjkZf4OKKEyE9j5k8GsSndCw0R9fcPOG
	Lgdam1Fl81MDIF3bSFYnnJIjdk5b4Oux7IVOvSEhUnjcSgZNygKhi0jhyGokAsxW
	Re/i48Izy0xnUje6crVmv+HE5mSiJdwZqZFpTD+WpOR06Q7qOmS8bm9kgr0xsER/
	ZSUiCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa87wv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:22:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8649a8dbff8so225704885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760433773; x=1761038573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBRR5H2TkKxKF7H4pKihb9Oc+NcrIbt0tfqa5n/nEGc=;
        b=f2xe9FC9+urN5bEMizSk3qIoweuHG0Up/SC6kPjPaWB12B6F5Bn6+hmbmZTG4Gqijo
         AdZeEM9Aq0HyW4rdE9VNF8Rgu/HbZcO2pez67YsXiot803tv3TwUhZwRxM3gMbmdcCiL
         k2RGSpnGi2PG78PUVC2/hCgqAhnFItbMr9R42ON00Rjq0XOYVz6NHHuWMLzcdmGN0pXb
         sBGBECEGVTcrHqMxmYQtSqotSLVapZzf+qBjAIyMySUd9Hhg8TuLCrLq6UvgFPW9K1UX
         KOl2dnkDezk0Dim7KC6zhPfiW0AY8cbgLAksRVXIc4LyMDhJvlH0JV9OMtuPr+yfAlMT
         dWqw==
X-Forwarded-Encrypted: i=1; AJvYcCWml1UR9acQunuGG1ACwsoDOhozxKw/bwHWtyY5zbcJnw8uYlbe7dXS0R9lRcOUlwqiV7Z2xndfDhTALzG8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3hpVPdAF5s/v/mW1KzEg3374lFT3H24/T/SOeHYSB7EmbqUP
	nQM1Vk/UyAtWMdogEPBl429lLrTxoyd9dkrTHsCmMv48CkNEymTZAQAe//+thPwgOFs74BoKa/j
	cyvP+2d5+uIwXvvsBejtEwCdzB+IF90tNx8FKuaN6kUcPRBRl7hW6DcHtgBm1tBXi487R
X-Gm-Gg: ASbGncvr1ga07lXK6EnaRHZEm+libTsKT0K368UcMgS1KRfe5V8p5Z6ehxz5/3N/4mS
	fToJFFHXUUjOw/8KFOX/QMg4W7R3NMcZ72wUp6fK4NR87695yMAiItvIjVTtAFWDQp+H4SC90rr
	dLagNErcshJMu5NBRbQMKsX8DZuXpoJmXiF4Db8HD1s7L9dn657lw2ZfbBbih6bwpp5UmazQuqY
	wHc6GjtSvkiygRm6vNqRsQjw485ADHm5wl3Gg/QDP5d1yaIb7s10SCba5O1BXtG9aqGpknnyUux
	ptm3/MnFfxbjFhqmjD+sbahkbEUbVKV7c0ANhEM/Nx31Fbaee+F1wZfCWp4pHLLwkku0qBKa8km
	WVVNJgxJqrDUHa+BeHWjQjg==
X-Received: by 2002:a05:620a:bca:b0:862:dc6c:e7f3 with SMTP id af79cd13be357-88352e8e8eamr2066567785a.5.1760433773142;
        Tue, 14 Oct 2025 02:22:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6lBPtCjgj5B0ks8xM4dqV/qBR4R1q23vBYNJs1dE8aUXN8FmTT9yYWz5xoRUNmm6qC74jzw==
X-Received: by 2002:a05:620a:bca:b0:862:dc6c:e7f3 with SMTP id af79cd13be357-88352e8e8eamr2066565785a.5.1760433772666;
        Tue, 14 Oct 2025 02:22:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d63c9a3csm1127034066b.23.2025.10.14.02.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:22:51 -0700 (PDT)
Message-ID: <87650853-3b4e-4a05-b3f3-4fcb8820ea9f@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:22:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: sdm845-oneplus: Correct gpio
 used for slider
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Gergo Koteles <soyer@irl.hu>
References: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
 <20251014-op6-tri-state-v7-2-938a6367197b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-op6-tri-state-v7-2-938a6367197b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7W5LH9LE3zBQhAk-QonKyxTwlWaDN4Db
X-Proofpoint-ORIG-GUID: 7W5LH9LE3zBQhAk-QonKyxTwlWaDN4Db
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX6MwUgwrLtdXj
 hWZCDTfjEucLxgvJxCcbBCCEN1t0popIOzg3KEtYHxjWzBR81u33Kbml8zsIh6z2jr+3hi1IhKh
 LE9aWKRp2uxkiIwr7HQjdXLBSKTxHC1MliSYkxvEoYZmwYM+Cm2GLe5Usa3rAnE5E92B3eJz7tA
 EQBmaRCNuoOEYo0M7BhH5ECtmJAGliPMUwzyk/BB/0g+D51yH/LG3NedVKuzPoZ1IBSvSQglatd
 7CyfBlJXQHqBPGlgmA3/Kc/HyP39i+D9uP9BHQIbfRZ7PgVElqSgXgDAet6t67X0Ut5EV931RU3
 6De2lOEM7VAVLcrdpARFqJOXBzVujqZ1Bpc+uUGFAqNYIKILzNjpVUUSzTMDKCJhSkH/+HVGuFC
 enloJOVXUmJOlqKNMCtLw4DJTcoflQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ee166e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=b_3gLtI3ev4ASzC4froA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On 10/14/25 11:20 AM, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> The previous GPIO numbers were wrong. Update them to the correct
> ones and fix the label.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

