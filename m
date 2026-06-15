Return-Path: <linux-arm-msm+bounces-113090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WJi5BxyYL2oADAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:13:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 793C8683B03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:13:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="fj/r2Oki";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FQopCJ6t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113090-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113090-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90EB83009F9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA423AB5DC;
	Mon, 15 Jun 2026 06:12:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B26388393
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:12:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503938; cv=none; b=SHTKdW8KL3vy12aAEiidywOJANSW1YLVuxqPeWEyvgepDa8gHd1TeVmZaaMFRZl1p1kU2t0GqJfHJujWoO9xOdjhMxQ+7E+PO48Cnk4IxdSZ/+1A6UlkTeT3SN8v/deMulopDTHu6Hfu3Gih/5xGSlhIKhc31FtVUvjktcVyV4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503938; c=relaxed/simple;
	bh=tSmedz+Oh3jsgXRS7vmeVV/V32mqeZtZmMWPq9oxuyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrmdWmuxH8qMKS4lrf11QBxl76wa1gddfScZmDTk3ZpDeZdjD6nRhM1x4StiD2Zjy/eJ7omvDCA10zzCzmtXWicY78i0/2BSD64ha1pgdQM3vQ9FA2/VDcGriacT/RM45WGx7s0pDndDMIOvtPZmusRhENs57OWbePIWma3yMYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fj/r2Oki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQopCJ6t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1iSVb2739642
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7gViC5SQ5ULIBq1coSdam39lZ/15XA8vuP7rC+uGlI=; b=fj/r2Okiyd2UR6wZ
	Y1rcqwZr8omOQmyljZnvOAe9QblheLc0csC6sEcR0R55StY4JVtT+4zisDd3eIGP
	TCkwvQaMYXya84TiaIYNR5AJ0HiL2S+mShZ0OXR3XbB3ogncQd7aBJnxcAAGxFAu
	l1aC3+zuWTQy2p9QTCPMzzlq0ZC/zqsdcxrvyqm+YJHIBbcGXm9LC1/3SwUJ9OMR
	oWLZJPvq37v4B26bDAQBkpsq2LOGZ8qyRCZk8/enVWH9Qx9GZw8vAeZZ8Iirl/sY
	fYbbzbr310w59E01f5VV/RKYJD38nRyAEd5CLrB/Hawb6RTnB6xLoamiHrGTjSGY
	Vc41WQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9fdtn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:12:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8421ffff8a3so4040465b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 23:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781503936; x=1782108736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7gViC5SQ5ULIBq1coSdam39lZ/15XA8vuP7rC+uGlI=;
        b=FQopCJ6tw9sJ45cmpjSgiYXxwTTrEAiSP/62knX1LuPnY34S67+Row7biGS6uwrM4r
         kMq9uGk01yLdrrhGNaLTSoBeTueE3veSBJPcgYxWKc0dDxdmFgLIG7NaIbvo1f5JiaR7
         UAh0ilL63jJ028IvtNH2UsH2enJGSejP4UUmAjaZF21A8EsaGUrcSFEpzaICtIpaC8wx
         5R280g2+DTsUu83U2hbyqcXGcaGXVEJHYlwmNbKPmRtqM5YULN8T5+71121RJAIexE1/
         0N7p6UnEIr28h/8E115ZiLdWPjPJc9iD5RcCaS5sAJNgj9WlNU7zR7r90x0fRKiinyLO
         M5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503936; x=1782108736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7gViC5SQ5ULIBq1coSdam39lZ/15XA8vuP7rC+uGlI=;
        b=cU0vgQQ9fP7yLqPeOi+DgtCRTwLu1/jYhZqroFnoDgtM0hVxwKZtP+8NJskF8ybNnC
         tTiFK64a6f9eQlGkXCOiyY2CQ3BGOGudUr2gTfG+VaVavuJjEV83p2Vcf0FhNt4IMf/z
         +++5Cj6c+uRjJnVxyPgGqL2qqxFH/ccy5+hI4gLLJ5g3cBEFZI3mH6IZrgxCwOPnYKmr
         iDwm/kBPhPpwc5xlxKK96P4LT9LI/xdjpXTqeFgV3iPSlg5CUMF5Ct4IslwzQyyB7gQv
         JVCJ37esMZoyvWiX0AB7QhoTXAWARZDExQ0qD1vhMAN5ujO2m7tQBk0Y/5k5J9LEeHdY
         r1QQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BE1tbt6EXjnWafuft2fk8EmD/n02iO5vtYs3FnKCuCENNl4UC8+5xAGDZi8WN/SuvFwfdLEM5WliHqflY@vger.kernel.org
X-Gm-Message-State: AOJu0YzVDyFzO+kgL1Ifgo5w0xhc3geLz4bbEHKohqk9LZbm+KHKvkp8
	WMp4/OsA1Gu4uos7Sf8AepzBsdTfZkTy/19USgR16CAj44N/4feP1IXfAZHNFoeVBJIKdI/jKPC
	WYOeqPUuHPb/WDdQEyWqbd7/hjK8elu3MGnr40onFEqL+kNpS9FXLPGZlhQ+en9mFJAq/
X-Gm-Gg: Acq92OGO+eDKnRsR7Jm0vvx7pbLD/sjcJB4WDFrj8I5Oq/EA7f2uDMWY0WwLXBaAZGA
	YMBaXbLHqey4nr2zhQnkoJPdTfUH1l4GjAlTrcS2nQC4i8ldEvGcE4iM+9weQHR4/gs85O4o/7W
	cqW44AIwO4sPhjkKPc9b+Lh6h+xgAEjmb34Rum9OW4zk9JnWcnUKwCpvoKtJQWaIJuJvKJbNMVK
	AYL1BOwICEu9r/2xuJDwA9utPKciqDwjgXHOEsLPyY/pnpIn8xMoTGzvDgnslT4bMW1F6cDrtPm
	LMF+i0KGNTZS6pZ+e379/sxT9cVHfiOOGwULqIKDqURaLM0yPQe4vmguUdAFeemCKl3s9dRN0RC
	oHTujYYwmYWQgiUIcH3SBTbhCjaOg1S15+4+X71Umz6rvSYz1DjrcMzDizHZnSKdc9Pn+5K6Cnc
	3KXOjtSY+7OAPnfUA=
X-Received: by 2002:a05:6a00:b43:b0:83e:e897:a394 with SMTP id d2e1a72fcca58-8434cc16b90mr14124638b3a.7.1781503936447;
        Sun, 14 Jun 2026 23:12:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:b43:b0:83e:e897:a394 with SMTP id d2e1a72fcca58-8434cc16b90mr14124600b3a.7.1781503936008;
        Sun, 14 Jun 2026 23:12:16 -0700 (PDT)
Received: from [10.133.33.21] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434a934a97sm9132161b3a.0.2026.06.14.23.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:12:15 -0700 (PDT)
Message-ID: <06529f97-1b41-4fb4-8953-8496a3663ce3@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:12:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Maili ICE
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
 <20260609-maili-crypto-v1-2-0f577df56a61@oss.qualcomm.com>
 <20260610-mighty-dalmatian-of-piety-2fa184@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260610-mighty-dalmatian-of-piety-2fa184@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX8mvNRIFCN2/0
 0lMhlfWJJwyfFpJ0HvMU9DMFcF9lNGn0kApFylyWqDRITczuj11YSgNWiyZrU7gsg8IU+AzcTOK
 0RJ7xuLFx2YXwDYhn/YVt8iXV4WDy594GIbO5ZrP34sChrLXOiJcWlrBHbHcun+71WG+HRmDNZP
 P30irgfR9ldpCMnKm9HN3WngTva6YJ7ZxgdGSaTZcUMqd2nKP/bCSsEIAQH3ettaFU7yzmIBejt
 eKU+9q1+wuQ8NM2ttb7IFxV0yTuEM/fKiE1SOs+qTTsIGIYCGw7XfvddO7RfQzXeAElMQIvO9vT
 7INV0L74+H//elFxWU3HvtkKluOTlJKLevNblvUIKcuJ7/Vc4DIZKm0dRqLlwHIx/bvUbJ3NAJ/
 qWDM/655hD1CgKvufG5y0NYhL+iEk78keUTQADFFcZ7BP9nS39NWOG3aVaUef9yb3yFQ6I0jdEG
 cZ463QeFiFxhZCKSEeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX67IkS4slg9K8
 ZpJ2X1nvReS7brFBqUW18TYdsu41+ngqhNA8mPc1DcHmRAcfzowh3jRFS5vSq1SCBUq28oP4fYf
 3ZEkRLti2NheJuOBRRDEK4ytCaW2n5k=
X-Proofpoint-GUID: swKlUk56f0gW8pLe4l1PtWNWmxWTm6Mu
X-Proofpoint-ORIG-GUID: swKlUk56f0gW8pLe4l1PtWNWmxWTm6Mu
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2f97c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1TaJruIST0psWsyvLVoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113090-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 793C8683B03



On 6/10/2026 4:55 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 02:08:57AM -0700, Jingyi Wang wrote:
>> The Inline Crypto Engine found on Maili SoC is compatible with the common
>> baseline IP 'qcom,inline-crypto-engine'. Hence, document the compatible as
>> such.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> index db895c50e2d2..c9489f6b8081 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> @@ -16,6 +16,7 @@ properties:
>>             - qcom,eliza-inline-crypto-engine
>>             - qcom,hawi-inline-crypto-engine
>>             - qcom,kaanapali-inline-crypto-engine
>> +          - qcom,maili-inline-crypto-engine
> 
> Why clocks are flexible?

I have just noticed that this patch has been merged:
https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com/

Will add qcom,maili-inline-crypto-engine to the eliza/milos list in next version.
( Maybe hawi should also be added together? )

Thanks,
Jingyi

> 
> Best regards,
> Krzysztof
> 


