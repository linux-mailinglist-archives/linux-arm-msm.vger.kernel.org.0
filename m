Return-Path: <linux-arm-msm+bounces-105056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q84CGiju8GkvbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:28:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28379489F1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16FA4308F205
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A723C1979;
	Tue, 28 Apr 2026 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GswPjRkI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sn46VDh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F59B1A6806
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396899; cv=none; b=fYKiEkIMpDTTcSudv5xILx2QwIOL5n4fi8cWbTht0sblgx/96UtfxuDKsDEtGYocBLMQgP2CDml58rU5iW4FjIJ4p2XkSjjN2KCNMtFM23CtPpRQ48YmVKp+STK7b4d7Wvz7O5VZF+cwPVJ6RDQzT5/yMQiZcrT356NWznbi670=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396899; c=relaxed/simple;
	bh=mIEJYPrP9BAaq5bbd0ByDxLbcdSgNJ/pySrTIxlF65c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bz7YCUJasNKrEwTpodrRvsyZy3aHMJJVNIjYj+WVmed5VXelJFJ6HTNdtkt6+5EaXJwSWrneaOV66ybgiNqrlopS/ybLM7ZOL6BB6Y9zynEMS7/uc8HBnnZGjQLmgA4oqbPpCpOUBkuwyr75BJN/1z/uSboqBd7bp7GPPSz+sgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GswPjRkI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sn46VDh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsZAg4070700
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVxM21h68QTpwQXVjlYvOOa0sB7Iufc3PjwXa+JQJ6E=; b=GswPjRkIwjKvVCJP
	rJazszKlY5U4navRZKH8a6Htm/QZGz/H59RcccgiXtN1ZPa8Vs+4UnVhr/uCxdnQ
	2CKaswymZ3u+ZoMsoL1DLN1g2P8P43UkINwa/SRs5Idnenb9/hhwxtIGKI8jBjNI
	YSmcaULRuS2wdgxHvrSA6J8W0s3zbBXYLpBu3N9YfB3z3wvVZv7UZt279XCmTlhe
	e/ssUGmciqXJBxn3fCh2rRRqfIB/hlnn8hqzo6Rr+CnzejP9yh84I0rdx45HIon9
	ighDN5Uk40XJ5LmoG7EQG7M564ftlD7CSPDlwa5AGmZ9MLQmVUBJgydorRVWjOT8
	PwxTSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjhqcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:21:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so481665ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777396896; x=1778001696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVxM21h68QTpwQXVjlYvOOa0sB7Iufc3PjwXa+JQJ6E=;
        b=Sn46VDh7+X7xuT39zdc+MznO6A0pRFAo3iFgKqc8pTVDqduG3v4uQWrwfFrE8VGn/c
         IlP+XIXOUteU3IivDu+bIY1nv77Co+SEvp88EWTgW08sqvP7cIk7QWciiZIl1SuWxzLV
         vmWGJREdQI9mG4b0yxiKmS5oeh4B4r3XNntnkYiWez0GW0FdTH4MCikQCBjAWVAdrVAu
         QakUW1wCA1Wo8hY43JZ7Qg66acWRCAbTMK+ta31NYxADjzYVmKcx6nAlqU8wBXao/exi
         S6CgsSrLXbBrYwBFq9zmoiX3dCb6pDoyRvtqru+hpdr1s/qDfq3Oat3TMLzTCqMfujiy
         hDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396896; x=1778001696;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVxM21h68QTpwQXVjlYvOOa0sB7Iufc3PjwXa+JQJ6E=;
        b=LP+8l1bn9qnglZvlSIh1poZcLFQD8Uw7Kh57FoLJxf0iwFxkmznxTrDh6Aw4Xy6HIX
         KWqQzgK6NSj8Sskjy5Hi1CJ6DgmHDL3g3FZIWq2mZr5HKSaY1hYqBYv6MHFKipHy0j4X
         bF9/fgoVbkPXu+tYvfxxZtT+QOMRFAMGDgHStGDltcvchK3YOIsXeIHWoRB3O9c+nTZK
         XcvWh60yPHYGpasQc181S4PJZX/zhFy4A5yZPZO1MHTRTVecizAftWi6OXHzUAOYvq/C
         31ox8pb351lCEQIqCWSI8F4EyUzz5MZOxmgfrrqyt2J9tV+Fk8NpRSjjRvkXUa5zPsYv
         ouvA==
X-Forwarded-Encrypted: i=1; AFNElJ/ilR7mIjKAc1y83cRs94+zRhurMchVSC1q+5oIFvENcpz9ZPJj9urnUJWYSjfoEVpElilIhHvMxw+fi2mg@vger.kernel.org
X-Gm-Message-State: AOJu0YziwTuD8z68wWQe5RRu2IISVw1y+N13DkrxKSqhCCGLQ1LVDa1P
	T5lqkb0QAeT3WDcWN3/jDglTM9tO5HnO3Puj/I+jJUqY+O+MDBSNq+Ua1LOq4EgI35B5rRK/Q1u
	QRbM54XDx0ZvjPTuZsKeAb7xL0Au6cYt65w58HuR0hruROCJVxknQMKsvZl5bQhBfsQgHZBPPMu
	Q0
X-Gm-Gg: AeBDiesQEnEVs7vZUtAAqh+JBfqLq36y/t8qUzkr9Hlk4P+a1fcCA/9/EbaI3Nw9OZZ
	fGsxJJxu/eGXjHYwgY3ujQjTmBdXwwkxvbbSeSR3Kv7pLvCDgbm4qpz60wmvkxaytTn5QuJwMdp
	S4Fu0u23k/jat5tBaTfO3gxHyYE6MOTrzxmKZRIqJFP7bsrrJKGUStPI/bBhT+xP77zR3OTF5ZE
	o2Mya5cDmGSmoeqSwD3wfPDNIQ5vVCU3SD+aDYioarSVTwtODmsss+0aGvpwAhnUcOYV/sYtCAV
	1gnjKrYxdfXK/0ZTpLFdeTuWUB7SgLPz//x0N85kW4H7RhOGHJxdgJltdcIYzomYq60t0IunWWm
	WPPMoKa8uPwCa0xtt+HQtzQJSItQ3C4IOXxxrJUf3M3MI49X8YIQHbUyuq9cAu3/F
X-Received: by 2002:a17:903:1a86:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b97bfc3323mr31903865ad.2.1777396895627;
        Tue, 28 Apr 2026 10:21:35 -0700 (PDT)
X-Received: by 2002:a17:903:1a86:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b97bfc3323mr31903665ad.2.1777396895084;
        Tue, 28 Apr 2026 10:21:35 -0700 (PDT)
Received: from [192.168.1.4] ([122.177.243.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac7858csm34088535ad.49.2026.04.28.10.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 10:21:34 -0700 (PDT)
Message-ID: <3938070f-5be7-466c-8967-6dc32b5ef372@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:51:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add display
 CESTA support on SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
 <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe>
Content-Language: en-US
In-Reply-To: <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2NyBTYWx0ZWRfXzdu/SCSZcurv
 xQlW5PSFOPo/QuSpK/Y64grk2/2qMkxdfYjDxBcze84o0iGOquDfPy7pcooS065lnJlJLbOWPEJ
 Mx3myPDARNlJomsP1IporXP+YdI8US22hnDE0pxo03uqjuv2wnpIxr5jhA2plXpBBjddzC8H2nE
 g1oMdGv3OhxN09T+c3trNRGGaWwzIWHNNLjNWvCGMihlJ2yOHWsoWm5LxNIgZ8aIuN14Yg8035G
 E3SPCv2Pf6W53DDym3jBRtRQfFNc+drcI1IbZ0J7SsPXOCHggyUPBov2FgKm6Cz+L0XX/74ZYpa
 Qax3Jfdd2zXlQTJSa0Bdw59mzXi5SQwp7gwcdcHfi4noDBKRSpVGXrIDgtcax9mnvpLAGiyjXte
 x7RPw7PIRjHsQ3UGTOsiQaKpabTVW06ozJ2UChsOnZ2IeIChWV/SjQZls4BKjnimrkXC6YVrzbx
 3gqMo9sPHFpnm1+rP1g==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0eca1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=EwI1ikYXukqkrg4G3Narhw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uCKRraC37LqDOxPyBRsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: EgvzQ1Fgmpzh3XIutNSugKDdMe7hmvIm
X-Proofpoint-ORIG-GUID: EgvzQ1Fgmpzh3XIutNSugKDdMe7hmvIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280167
X-Rspamd-Queue-Id: 28379489F1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105056-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/20/2026 11:15 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
>> On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
>> (Client State Aggregator) hardware. These clocks can be scaled to the
>> desired frequency by sending votes to the display CRM(CESTA Resource
>> manager) instead of programming DISPCC registers directly.
>>
>> Add bindings to allow the DISPCC node to reference the display CRM node
>> for sending votes to CESTA hardware and the CRMC syscon regmap node
>> which is used to read the frequency look up tables provided by CRM and
>> populate this data in RCG's frequency tables for CESTA controlled clocks.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 ++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
>> index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb30b29f0da5c9e156b61 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
>> @@ -60,6 +60,18 @@ properties:
>>        A phandle to an OPP node describing required MMCX performance point.
>>      maxItems: 1
>>  
>> +  qcom,crm:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the display CRM (CESTA Resource Manager) node, used to communicate
>> +      with the display CESTA (Client State Aggregator) hardware.
> 
> Is it going to be shared by several entities? If not, can be make a part
> of the dispcc and get rid of the extra CC <-> CRM API?
> 

Thanks Dmitry for your review.

Yes, clock is one of the consumer of CRM, but CRM can be used by interconnect drivers also
for BW voting via CESTA.

>> +
>> +  qcom,crmc-regmap:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the syscon providing the CRMC (CRM clock) regmap used
>> +      to read frequency LUTs (lookup tables) populated by the CRM.
> 
> Why is this coming as a syscon? Why isn't it just a register region of
> the dispcc?
> 

The CRMC block is not part of the DISPCC register region; it is a separate sub‑block within the
CRM(CESTA) address space. It contains clocks frequency lookup tables that the clock driver reads
to populate RCG frequency tables. Since CRMC block is outside of DISPCC region and DISPCC driver
doesn't own or manage the CRMC block and uses it just to read CRM controlled RCG's frequency
tables, marked it as a syscon device.

Thanks,
Jagadeesh

