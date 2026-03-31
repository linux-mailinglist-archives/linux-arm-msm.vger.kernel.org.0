Return-Path: <linux-arm-msm+bounces-101015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHKmCFeXy2mYJQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:43:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D013136740C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAF3E3099C91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C363EDAA2;
	Tue, 31 Mar 2026 09:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="labxpXx4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdzHmQgO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848863EDAD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950041; cv=none; b=VVaXk1G68yJJyVrYfnVIl9bdq1140ZKXk8DGCSlu+DGencsT2OEy1+w8pvnNPlwyPejQCUi9pv4PrMauxEQMW5a6wZsrminOAiDcNFFmDpC3u9RDHmW7KCqxFrIocODqRAiHIxHZqm1OZnNHxlh5phVJS+4bmCB8P8GZXzJ/sgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950041; c=relaxed/simple;
	bh=6TtXtGHuwbeOGc43RV1ox/wCKy7dGy+cBU/v5F7GGuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwoaQPE8O0wTnOhuxXzRcW4/oyDc2JcbPJsX4nYcPtsuB7Eo37W/CyD9xjAoc+C8uwBj6wk6cWNrtVBhQ63pOVtlCXl4Ab9862CRs4uvE22GxbR13W9vfYi2MC66FA74MGMwBdEK4+kwWe8PGxdNnelZhzUibE5IntKNmide7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=labxpXx4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdzHmQgO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6TOpi2391401
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oO9fj8VnemesVNw4Kd4kvPTyxIt0YprBH9NBYs6VYwU=; b=labxpXx4emFwd9Yw
	YA7lhLzAwsnly1/7QCm/HoKB4VvxJk5Kd+9ioBAV7C+Q1bSWsvFm8NGPdb7IPM1F
	s7gYkJu+AJTSPV6gPZlURLmaRK5BoJJDFI7oXaAfVBQqNTYiuppLjohFJwODGIcQ
	JM3rfwvQRshKKTeUV06sbxM89gBJLxVaJL9KIM1GqT6DvH+/iNUNsgCV8PS5Hud8
	nugOPtJl3acxB4J+FYMqejbVL235iFwAi561ZOq2YfL6GWECeWw+YunfjAMccSUr
	ktG+r/tV2m7yVXFNV92+i7eHQooqF8TLpLOhMBQsHDRrhMjEtlp/uHfvSPwfJV3/
	vcri9g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7kvt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:40:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2523e0299so64915365ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774950033; x=1775554833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oO9fj8VnemesVNw4Kd4kvPTyxIt0YprBH9NBYs6VYwU=;
        b=OdzHmQgOyB4myKofD7Sd+W3RDBvUMbFZX2FQWPlSNdapC6RPoXxzBswgb75zxyMlpi
         cmKlJVCd81eO7hrciagYFaIACfE92SZYoB8O+C0TSfbFZych+b3nISFtERp3ZteiXbF/
         NPJWLfZKNTcNo+1qhmm2ee67NOxLRbjRlgVCtRLTqFwJrNLSnkNZ+KyFcbCCDBG/NDqZ
         yAYMCXBLSoroO6e0UwP2vSeyyi2+tgU5omRXzIRFIdA8W+GqcM6qfLq+nuqOtVX8nsOn
         2ZPj2MYXyOZsxKKEqoh2CXaHE/Tm1dIL7rWMk0atSOGJXYoupolVXKVuWGzUZIyTZZRN
         Aauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950033; x=1775554833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oO9fj8VnemesVNw4Kd4kvPTyxIt0YprBH9NBYs6VYwU=;
        b=dW8ZMpRUeU7T1fm6He74PDVH0/0AmEtSM03Let6qvox/7/4cBIQW+b0ZZrRK+VhcVU
         UVqjtvw1s0nKcQF2VS6KrHR6MjCVDsKivV+xJ/gfAWAOOqj25ef5dPEAVlrZYlM5+WVa
         NRchbRs6HJEsZMJm3mLogQRopCSnp6jydYI+uyri4vvovO94lKMud7dHJAMP7B+Ra/FB
         pqFBw6bJYctQjURLzXnUMgF6tgCYeIp4pECUr3mCN+xD714WIvW85nqUDvPO36yF7kR4
         8V1DlgOrlLtBgXu2iWs6f8KU04VSg20kraeeWjqByvSgT3zxgjbOzhNHumiuwiEBwREe
         PgNg==
X-Forwarded-Encrypted: i=1; AJvYcCV9vR8XgE9FGd2VZKgr9UXSG8T5pQh5BOGTqnRtd1925/srDYyu2V0Ea85i7zrEKS8ccYMoUOdww6ZZr87l@vger.kernel.org
X-Gm-Message-State: AOJu0YzqyzEUbHJj0CjYYIDbaeoecTObxogh22+rO3dMd0t0MHp3oFsr
	H/pjLDhnOJVSyO4jDzgX2CAsy68WG8Hh6aByOlTTsu4As4CzCVNyhgn20fhQ/pwtmjiIffn4/Kx
	PyGkoAMDTJVtJYzcEuxYYJUDkOrpK5MEk9C5sgHewmPzHfx1FDkz9TxaV1uSabo9DkfJE
X-Gm-Gg: ATEYQzzzHzEIa5jMPQ4qyoGpxDSGRlWY140mIW0+soWwpVuTehD55t/oYtWt9cqLK1h
	/uGOQ1zblZWqEJe/2ouZoULefnaflT1sOjoEMirHQG34C+S1dzymiOsnIq1njLa7p9xgDmYVso4
	kFNIbOM3bkbSgVS4Ub/dn9lIIb9+4+J8c++Wd1FXGniW1tJF+K195TaheFsHwaayiTSHMFnscIc
	ltg8tzldsZFIWwwDfvDXXwtlcj90wI7YoqtgNG2HRNnZIP0kZ9NUIEECZpvtj5imm4uKciRB6ab
	IwmtRl9dQBnsi5b7SXobhKJWF8CRjOgS3F7Qc3yqjW466bBig80ADGOe/KUFUukAwLIylvNmGsM
	ymARhehS2u/LsGnPB2cz2zGNQdt9JDSTYd4pFPabiOF/fYOfb6fM=
X-Received: by 2002:a17:902:ef4f:b0:2b0:b1e7:8841 with SMTP id d9443c01a7336-2b0cdcb0990mr168484645ad.32.1774950033391;
        Tue, 31 Mar 2026 02:40:33 -0700 (PDT)
X-Received: by 2002:a17:902:ef4f:b0:2b0:b1e7:8841 with SMTP id d9443c01a7336-2b0cdcb0990mr168484325ad.32.1774950032814;
        Tue, 31 Mar 2026 02:40:32 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427660c7sm106046705ad.44.2026.03.31.02.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:40:32 -0700 (PDT)
Message-ID: <2b71dd68-ff35-411e-905d-3ffa2ea3efe4@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 15:10:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
 <873e8ad2-50cd-4c09-9a51-20ad745fe8dc@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <873e8ad2-50cd-4c09-9a51-20ad745fe8dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5MiBTYWx0ZWRfX60pvimdLKF/8
 be+JudLMlauEk3QUNdPRqWd2rVVE41a5idz3cbqECXf8a/uS5YDeOPB0oybUgmoZF5z3n6XjZNT
 qSbMhjgEGlYWqceIrudza9qYDNndX2H//15Le483hfbNuS3u2FRmGR5Jb7ZHQP/1LeTbYR+iica
 CSZw4BiIXUIhlUaeuNA7So8E8qJPAyAfB4P8SH4lBFgzxXUtkWuRo7qWZcnGBAetOltEk5HQbHE
 S+R6ok6bSOW69S8cSnzDol0mIKNBrVhqeBVIfGijMRD5GdT7MDk/kPSkZIbOcpYTrrRsJiFeB9s
 8nRHxgWlVChNrsHmAzlGh+4v7ZB9z02xN9mYG8XFxzKJD2xGdiQ0rYSoszSCsmNQ+VtRITKu+4G
 qu3ZdsKkYUYJA2wTrn8013Fue1OcliM9NYC2Ujc2tbmjBgYLL+2WmnXEYdJ11gbSqT6248g9Az0
 Ch1hNsjktX8MWBKKM1w==
X-Proofpoint-GUID: 9EkBZWUl2tAJjSB9jXZNvQ3nYYvJ6CyX
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb9692 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=11eJxmzFO3uqpiRjfBAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 9EkBZWUl2tAJjSB9jXZNvQ3nYYvJ6CyX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101015-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.934];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D013136740C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuldeep,

On 3/24/2026 4:16 PM, Kuldeep Singh wrote:
> 
> On 3/23/2026 2:47 PM, Harshal Dev wrote:
>> The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
>> power-domain and iface clock. Without enabling the iface clock and the
>> associated power-domain the ICE hardware cannot function correctly and
>> leads to unclocked hardware accesses being observed during probe.
>>
>> Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
>> power-domain and iface clock for new devices (Eliza and Milos) introduced
>> in the current release (7.0) with yet-to-stabilize ABI, while preserving
>> backward compatibility for older devices.
>>
>> Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
>> Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
>>  1 file changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> index 876bf90ed96e..ccb6b8dd8e11 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> @@ -30,6 +30,16 @@ properties:
>>      maxItems: 1
>>  
>>    clocks:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: core
>> +      - const: iface
>> +
>> +  power-domains:
>>      maxItems: 1
>>  
>>    operating-points-v2: true
>> @@ -44,6 +54,25 @@ required:
>>  
>>  additionalProperties: false
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,eliza-inline-crypto-engine
>> +              - qcom,milos-inline-crypto-engine
>> +
>> +    then:
>> +      required:
>> +        - power-domains
>> +        - clock-names
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +        clock-names:
>> +          minItems: 2
>> +
> 
> Hi Krzysztof,
> 
> As motive here is to enforce 2 clocks for upcoming targets and keep
> minItems as 1 for already merged ones for ensuring backward
> compatibility. Can we do like below?
> 
> allOf:
>   - if:
>       not:
>         properties:
>           compatible:
>             contains:
>               enum:
>                 - qcom,kaanapali-inline-crypto-engine
>                 - qcom,qcs8300-inline-crypto-engine
>                 - qcom,sa8775p-inline-crypto-engine
>                 - qcom,sc7180-inline-crypto-engine
>                 - qcom,sc7280-inline-crypto-engine
>                 - qcom,sm8450-inline-crypto-engine
>                 - qcom,sm8550-inline-crypto-engine
>                 - qcom,sm8650-inline-crypto-engine
>                 - qcom,sm8750-inline-crypto-engine
> 
>     then:
>       required:
>         - power-domains
>         - clock-names
>       properties:
>         clocks:
>           minItems: 2
>         clock-names:
>           minItems: 2
> 
> This will ensure for every new target addition, default clock count is
> enforced as 2 default.
> Please share your thoughts as well.
> 

I don't really have any particular objections to this proposal, but I can
see that other bindings where the need for an additional clock was realized
later on use a similar pattern as this patchset does:
https://elixir.bootlin.com/linux/v7.0-rc2/source/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml

I'll wait for Krzysztof to take a final call on this.

Regards,
Harshal


