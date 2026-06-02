Return-Path: <linux-arm-msm+bounces-110795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBryEEuiHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:28:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B4062B8EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 549A5301EE1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C522E3CAA3C;
	Tue,  2 Jun 2026 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwxFHEsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpu5r88+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5D63C9EE6
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392487; cv=none; b=btZZ6J9VbfVnZCN6a392tWJdLfXGCpgDABiBf7US6j/nE0o+TKfoB9mVULNSw6N4xdQ7zpZOx4LgmuGFapIMHM8s1sTSVJN4BkqWLok/H0rfsC477HIOqUIqVCgqoeSZ8DRhJcLgS75Pope3/5IR6NQipcR61isXcrw6cSyMFpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392487; c=relaxed/simple;
	bh=KOv9YH+3FUbVV6ZbzGnVEusvGbPURLmC4FhUS4K2pMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isdq2qfpa7RBST0tF2CB7juMG4zn2Dudgrmn1LKps7REWzL/v+XSReDkNOcmcxxsqmRegA4krulEHd0SLTOMgrHdJScO2EPYt8NQ/GqlxHERH9dObjOBV1i4pOqwwuclxzlBHuKj7Ko2B7MFHw+gFMyWw4zx3N/xN0MYz7rRB4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwxFHEsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpu5r88+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tk2m1855067
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvkSp804GhdyyZxMLRn3wWP/E8RApPPQQ9Kgdfsxspw=; b=YwxFHEsg44bedKWL
	GumsKAuUMyork49N72gk66HyaeoAg9nAmhZIequaFKa/ySrtHRWHFHEMszXDKksA
	3WiImZS14pa1B0HgA71AX4S+J8ds0w3IXBDgFb3KkBiUEnlkIoIFy5QhIisWd1Sp
	hj1uU4JRZ/QHuo9TZQUV0H5Ax4JLbdBYkAE28tN6M2mqbxarttAGEChnZXOlNXqS
	r0t7vbFu3SKRQZc3HXAsB3DDIV5OGd3wIn1f66qKItL12Y5X+1plsW75oPZitXrW
	EHb0bs/NzLRl8kVWYdQEB4WC1fd9FQPAEs4ZMoyK6NgdvfQKe0SG7C6sx0kPyOPL
	aggZwA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf78uvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:28:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2c665easo2285929a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392485; x=1780997285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NvkSp804GhdyyZxMLRn3wWP/E8RApPPQQ9Kgdfsxspw=;
        b=jpu5r88+TxdJ7JY0v2W/iDf2BpMDHQFS+y9jTrvP9E9fdzKZt2fDDpSsW+XKM3IKG5
         9viqUuPmP+SdoWk5hPaa83beg6t9dNIQFS3PcMLhdGJ1fJuY6COUuOFJZ7qHDmE62c1O
         SOHYHlxFRpa01deHmcRqbZ+2ElYbKr9eMVJC2msA9DN+kj61+fpl4ENexdYE4huptmQu
         dk+E7YfySSLPRcUreBVejRcOtnykfTxHR+RGYadMu3lskeXEVylnH4Sw5765UULS5ImL
         aipxdUnsNGlFdKefZCsJ7Vd2/mQ5oqD3DnMvW/3EKgRhTXMzhjsQeOVehUZSXhwPXnWW
         LqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392485; x=1780997285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvkSp804GhdyyZxMLRn3wWP/E8RApPPQQ9Kgdfsxspw=;
        b=iL3BSuj6mwwZDJx4Yw1msn3vybsV6druNmX3n8FG8Zc0ai7KgAaIVyPxH9KzsMwEfI
         S8qvZjLKyJtVDn1FzLqc5ubGL4jbtBlczl8FmKm76hnDbyRS5wV5tM6urbPDA+YbznUa
         N0a92kxumny4LTnVuLzoZ4mYopP51QUsybFOBsYcfjMYcibtDIkJP/KR2/XX5z+8AhQO
         iptPHuM4+LpruCfN4qcgKgOPSbg+T0foW7pHXP2faUWoFXroQTS/r5nP/D4mDh8zKsOA
         IBViVa4ARL3i4DSOfkuO97uuCF0KWeQSCHViz0ceXXBbHqPATMZjArf+lI7YyDTY2KeN
         u6XQ==
X-Forwarded-Encrypted: i=1; AFNElJ8T/eNsVuEGm0izd2IU3ICVEPl3LOrmlVNNrCjp3O4qQeGal0GGgk6H9wu2HLvof1aTv119Yv2g8xwzEHA5@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGpxaydMm3m1ppeJovtrN8A21Dn9UqEN3lIu7wDV9rgOIebY3
	AUg5df+o0cearI0yGzL0Y25g1ubXymn3I8vRruEDqMK04oVTERAG8koA9OfzEDP1Cn5RdJd0qlM
	HNJ5VLibSPH8/FA5dqVQHa4a/lrO5jSZ9hOHeMmlV9szxahp0cgoMXelt/CRf7sfMoZFB
X-Gm-Gg: Acq92OHUGIRKsLOULexdyWXagLbXBXi0mlOwkumXEctn9yu1nZXz8SUTiLAWwIBWAGM
	OvFXMLdCq6KB1K4dB+qIRGt5OV8dqH6m65bxoRngM4OkxoHPgZwdwAYi1/vmomVSsWqcVCHIL9+
	zBMSGvffJN4MZUt9AoEnZdFxSU5UjA255BCkrGPGOZ+p0mHDwVcTIfNxsuPDm0lWoxNDwJIIl9z
	HJgLGQxBBbuZiABJTi9fbO6aUenXyQsYvVnnumNw88RGTPYIF7tWOD2FgD/7j3f/HrcV7hMdB8v
	7bOdtF8p5utxzWDuKVIhkV//xcYv1FWhjm7YBcX9rlbOTKkIcyMFcUEf3puZ+NpEo7Q5AWVXN3W
	GfEVV9iQjkgnTHgdr3sjiA3piFIiZjF1EjssoQLIDejNTGSODqI4tth1mFY6mcf9EsBChHlTYC0
	19jecMHqJxiH7e3VdgFdcSeYpocc6+k27p
X-Received: by 2002:a05:6a00:91e7:b0:842:277d:f72a with SMTP id d2e1a72fcca58-842277e030emr12603224b3a.33.1780392485062;
        Tue, 02 Jun 2026 02:28:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:91e7:b0:842:277d:f72a with SMTP id d2e1a72fcca58-842277e030emr12603205b3a.33.1780392484581;
        Tue, 02 Jun 2026 02:28:04 -0700 (PDT)
Received: from ?IPV6:2405:201:c416:5052:81a2:4375:a071:12a2? ([2405:201:c416:5052:81a2:4375:a071:12a2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8421bfec5cbsm11760197b3a.41.2026.06.02.02.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 02:28:04 -0700 (PDT)
Message-ID: <afeab8fd-6951-46a3-8b92-9c3b7075949e@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 14:57:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom,shikra-epss-l3: Add
 EPSS L3 DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
 <20260524-shikra_epss_l3-v1-1-b1528a436134@oss.qualcomm.com>
 <20260530-victorious-resourceful-muskox-cdeadb@quoll>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <20260530-victorious-resourceful-muskox-cdeadb@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1ea225 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NjHEnLPE2D3hUEva9SUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 8PLFr8r7HiaSp0_9qq7Xh-cuJ0qqOzGl
X-Proofpoint-ORIG-GUID: 8PLFr8r7HiaSp0_9qq7Xh-cuJ0qqOzGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4OCBTYWx0ZWRfXx/4Pi7dWnrkr
 exwM+e1ctMK+c5k1zZnTqAzCC4NE33/tbgxK4HO26hK6pYDE4ElU/FpZb4maxJnEaVRFIs35WVh
 Rs0Q22bBMuM4OYEnxksDsNnfg9pg63WyIwS87TMfcB/2smCcBgML2KGLwdOKGKy0MPVWvDin7Rq
 UU/u/KIOsEQoda4xqS31s+gsB0RChNnIxcF2D1JrtnCaLQKObF25Ydv2e44Ziw3Zupd1SIaZN7l
 FKbzXzATa0XZRSZxBDCJ5gN7zLbZf93CXnwLjg7wY1G9AwFASHCSTxC16bgf4cac4tFKLyOHiWd
 oEDLwmUD7TDU65ITbbfYcljfshBDe/nHNGLZL9uHESVAY1n1pDycUIdOUBcPTCKX1DcHcKP8+Gc
 PN/GPx0mClTxHbGjR2jPwP0oI1HbwGXNE6/4aLVGvQVV1UJF2SjGHpvzsR6k1bZCM+kBed8Dxa7
 KrY2NPgGCXSy9d+GTbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020088
X-Rspamd-Queue-Id: E5B4062B8EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-110795-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/30/2026 4:38 PM, Krzysztof Kozlowski wrote:
> On Sun, May 24, 2026 at 06:03:35PM +0000, Raviteja Laggyshetty wrote:
>> +  '#interconnect-cells':
>> +    const: 1
>> +
> 
> I do not see any differences against OSM L3 binding. Why isn't this
> device there?
>

The EPSS L3 on Shikra is similar to EPSS/OSM L3 on other Qualcomm SoCs,
but supports only twelve LUT entries. Due to this hardware difference,
the generic compatibles are not applicable, so a new SoC specific
binding is introduced.

Thanks,
Raviteja
 
> Best regards,
> Krzysztof
> 


