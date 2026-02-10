Return-Path: <linux-arm-msm+bounces-92473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDNOCW8Ei2kMPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:11:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD64A1197C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30A063014FFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A1434B183;
	Tue, 10 Feb 2026 10:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QShNMkXA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzCBRAhs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A084234A786
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770718314; cv=none; b=UTMkIzsYL8ktUQeKZbjptvn3527FCdWynYBX6Jpi5U+cFL1Ei4J0URunC9YE/Du116mM2PzJWGIl05hgvw/7Wqr9/AtCf7vXgvu4ijjiv+QqOcbR/dqrqgklArNlQ4+aiD+uzeO5YhOzjHc7ZEEdCUKXld1IAa8UWhPnWpsWtHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770718314; c=relaxed/simple;
	bh=1ooT1a6DMdzy5U3N9t8SsUUtpoDwghzB/aF3B9avClM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byTK0ptmXINjbNYPtTkkXy8lJI4KmrnnXT6l9cqLzYK1P3Iiv84fFMR+yPvH3D1AxbAW61EvXu+FVItKjo5F3Nf6zaOQgow9k7OFU8BtV0F2drgk+P3KqHYjLsO1LHruWSWDs+9Ch3l20rwpQmpWDei4UouoRL6sucyjrzFOcDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QShNMkXA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzCBRAhs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A756Pq3436801
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4fT2VUVvtqHiuDAd1sXDf6Ry+o8nCMzOicBMUFTINE=; b=QShNMkXApXA6nJ0z
	VZwZgJWc5KXl81RQ5BUrM77ywPaCigd31dUboWTRBuv4r0ZVB95nr33cQeoFWEi3
	UUAYcl5ok845xkg913bDIE8O2PY5Poi09D5soVw//vm8G9Tm/47YzJdAmf11DSke
	16MVZU/eHuaqpa5yGLabqsVdkqgOQiTbDEA3qmro79EOTl7ceSRr61v20Nb2u12o
	MNTBlYedv8x+eltzRz8wc7bQcTTwegzXd15ogWjWhXsx2LJNMGGEIt/YpMx1lISh
	G5ActcUe58YKae+yipJrm5ZAoxIhhQACALurcJMeW70dDoTDge+Chn7beGMedFzs
	S8IYzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7fevbxdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:11:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7701b6353so45525495ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770718312; x=1771323112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4fT2VUVvtqHiuDAd1sXDf6Ry+o8nCMzOicBMUFTINE=;
        b=TzCBRAhsqiorhvH1enRPcKU4EromPGO4Q5gpDvuar1iQ2QYmKY7bgEjAygHDa1lRGO
         ZTGnpy9ihCc9+GMJzsI9Z6h7b7oG+J5SH+ZLP3KTE/wWtB/Es9mQaPR5lLJ0TJY6wulx
         p08BtHthSB0FFLOjuqCRXR1RJMnBKq70WN5ozidKuCPmw9D8KF1zU9NnElxc1NOy1LRb
         Lhqr3FZ9sJ6q9D1v+IbzSh0ifXDVkcix12zh0F5DSSH8L68KsoIIhZxr75TgsqkTNkQz
         5zUVfMDWXknJ5arffo1GRfapSfpKCNRTBmlq75eETvlzQ1u/sQ+FzJt9AEwfMnaidCXA
         EuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770718312; x=1771323112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4fT2VUVvtqHiuDAd1sXDf6Ry+o8nCMzOicBMUFTINE=;
        b=ZgjdCTDcBtI/sn9eIPPy3Rb5KmDCy6HGIBfex8JqdGnR2RemA5P/FiLqXVblZkIFsT
         HvTonGcrfchONYbUtoLZGFAckx1IeMIzvoK56jTBskCZiDJqNNaxADyge1K5Gxt/q2Qg
         BwhUL+RdKBzrVrUrxAnmfkXbmRFM13KAg/aXkmzNkt0tbLj+odEQMJp8wU+bDTQlE/hL
         HV/QV99/5IQibq38OC0TEDzvOgSCaqS5u/yt2uXPmYbX3/0tXimW3yzpp9TIFLZLS7V6
         FIenrLWF7lg3LHDxTrDxQ82qV9j5K9bUQGE2OdgfBJn0Br2dMd+WsHIGhyOU1PzQV5nX
         wSGQ==
X-Gm-Message-State: AOJu0YxXQ3R2rjheoDGY3gmeBAEvsCzw5BgjPCKsVy0nGNDLNxqgSsEf
	3qFsVedrn980s8TVseHqxyo5KEe9qUmkcHUfY2ZncD99TmbWJFCB4tfhLW6XPW6+RXly11JxSEE
	XCoZAzwPtLKLNcXwtUSBJSz4ETvGDUkhQpRrEeU2VQfV1Fff2pvdEtCDVamABvT4yxDsaCrFy0s
	O8
X-Gm-Gg: AZuq6aJRdnL9HzAz4p9f0zx7Ku7nEQkFoJdYCkuvvyBsDlaL5/woxYpflGAoW42lMyB
	g7nVsgY9NboCmVUs9mvA/Imh8Tddvp20AejzY5K6WHdIG92PlcTdPAs85WRrtaK+YZtqvsq7Ph9
	ruy5LKf8m/jLAkYzHlzmWcBL0vhtTPnpY5cBWvCbgmqoT0zffGEkU8lrM1fhgUYHrDYXqLlQpDO
	0vv8eeYWCyZ5p+LGZO1wC6UhwZ6UfdOZZ6a6lWLZHOF8beVJfcjZLhcziX166MwVysVetKbbH6t
	GNw3k6iaiz5tbdlNTxdd8BbgUzJGhZ9cI0TiRPJx5KTLQNbYBI/JvS4oqkkoOEYnF5y4gi0Mw8w
	clhmpZl38zQLEJQQGr3GTfpo7Bfwe9e9nB2U5cFJPibF2T0Y/5ZSCLCeh9nmqprkuxsdpH6jLzw
	dkkEnryMvQOlWjvV2GdabWiAi3PZ1A7Uga6+SIRbLF
X-Received: by 2002:a17:903:2343:b0:2aa:e570:6e6d with SMTP id d9443c01a7336-2aae57070d8mr66571895ad.40.1770718311915;
        Tue, 10 Feb 2026 02:11:51 -0800 (PST)
X-Received: by 2002:a17:903:2343:b0:2aa:e570:6e6d with SMTP id d9443c01a7336-2aae57070d8mr66571615ad.40.1770718311280;
        Tue, 10 Feb 2026 02:11:51 -0800 (PST)
Received: from [10.190.200.191] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c782desm140623395ad.25.2026.02.10.02.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:11:50 -0800 (PST)
Message-ID: <61a38ef6-a9e5-4122-8057-6fcadeefd16b@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 15:41:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] dt-bindings: arm: qcom: Document Glymur SoC and
 board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260205-upstream_v3_glymur_introduction-v7-0-849e7a9e6888@oss.qualcomm.com>
 <20260205-upstream_v3_glymur_introduction-v7-1-849e7a9e6888@oss.qualcomm.com>
 <d4ad8281-c9ca-4473-b7d2-f4a0955542f7@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <d4ad8281-c9ca-4473-b7d2-f4a0955542f7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TOsDpne3v6xbMowuWxEgIYVi8G2Jfj08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4NCBTYWx0ZWRfX2b1CT8k16kdJ
 9kiw424cjfDAMsTVgo1V0fs8b5GahyViNBeAlUOUxILAk3V2X/s/1drfqOz41emcrtaM+6IwdSN
 gI/92ChS+9aCcovozDGedizkB6Vt/yMBZeAA/vn9V0/pVkoqEd9RWsI1mhyCMfLDq5gaR1T9XzP
 A7qMr3midY+R6b09LoIqp+qPmNiic5OWNvjd0I4vYKzK1aJfTMny4iZKcKao7l30mZTxjeIg3iQ
 FlZZrC+hVwKOSJrjrwZXvAIfDgUJORHDT4UgJs5wGDBFzZbqHuRfoojVdY0t/GqfIX9cW4G1/Ex
 ypWNwNtlHo7iIGhSzogRtr0XeFvELd9NFysVv1wCYq9DYin2r+v+cA5UJVZWdw/o/iGBMHGGPAh
 7tOhx9VrBK7UG5SL2rJr29fojzOQ3D5avRp6EEYopt4HxSO92bjv+dLdqQ9qGTGMCgJ54y5AMvt
 FvN/tXAwjs9sYcuNMYg==
X-Authority-Analysis: v=2.4 cv=F6Rat6hN c=1 sm=1 tr=0 ts=698b0469 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=nv_02UBeiWaNQ7srDM8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: TOsDpne3v6xbMowuWxEgIYVi8G2Jfj08
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92473-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD64A1197C2
X-Rspamd-Action: no action

On 2/6/2026 9:56 PM, Krzysztof Kozlowski wrote:
> On 05/02/2026 13:20, Pankaj Patil wrote:
>> Document Glymur SoC bindings and Compute Reference Device
>> (CRD) board id
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Drop my tag

Sure

> 
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index d48c625d3fc4..5be53b50f5ad 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -66,6 +66,11 @@ properties:
>>                - fairphone,fp6
>>            - const: qcom,milos
>>  
>> +      - items:
>> +          - enum:
>> +              - qcom,glymur-crd
>> +          - const: qcom,glymur
> 
> g < m.
> 
> This is just mess that I need to keep looking for such issues and
> repeating such feedback.
> 
> Best regards,
> Krzysztof

Apologies for the repeated incorrect sorting,
Will update in next revision


