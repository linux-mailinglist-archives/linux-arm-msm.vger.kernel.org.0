Return-Path: <linux-arm-msm+bounces-108049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPTPEN70CWqGvgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:03:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 857DD562604
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42C033013241
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167AE3B7770;
	Sun, 17 May 2026 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPSKucqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QA8ZiHla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC70B33ADA8
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779037296; cv=none; b=M9tiE2tHvoCj5BG2Efkwjl+zud2UBjby1mXyFVZKFPemsxbwg75Tkank1eiv23U1yuQAC7Fx/BVTosVNW5Zq3h+XMN3nm7rMLg4NuISQ2oEUCFfijqUwAsF0MUjrevrzFlvhNTpO3vMI7vWheSpQ/nz9W0n7o9Yl5HML/L3Dl64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779037296; c=relaxed/simple;
	bh=97g/NdktaIsfmzcUs7B3fZAs/ud1qLpVVqapGtwmntw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Te4idU1VYO62hfGepjjdbvmpxNeuUrlouhw9CmMEWtKXBEs6+KABRX/EPb27w9dmNTaBwAEO1hyEMvm40sC6AsAL10SUvj9ohuELt8W5F/Q/pIUv9SuOA8g/p4IOEPcPE26GoUjvaDFzjBQ/XaBLUX1PxAed8aaC3XHtMXUn+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPSKucqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QA8ZiHla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GNSxVC1462932
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xRzeH96dtwyj2Z5WMwnZyLEFHICTIHnJvR10SSBCzg=; b=DPSKucqdOpkA8zhl
	f5TYHIXNv5YMsgwOibwUCJd6SE6lBZatsSAd4CQD8coNkgGneC0kxdkCCgIWxKFS
	j2zpDvOoIb8V+ha4eJfhW2bkTM6NxJ0W68Bd/Gc/6EmHA/jQBfgr1MGEQwyL99Qt
	SBWxRSlUNofr2ec1TNzbmW/1l+43Bbw+AuCoeyUuGYvKrzk+MyUs76NBP1gIJgT9
	iu+g1xp+vf3X72gQByT1rPzC3eh4S2EmpTLTZpZCqrZQIl4f8OKuVTOXE+oz/0Lz
	Jgv1HteWLh+AevDerqNcIP8HQkzjHcLr34Jhkhg1U2p2Yu3eLzksg0L99jSmGk8r
	ICyNhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g375v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:01:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4530a90fdso37115945ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779037293; x=1779642093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xRzeH96dtwyj2Z5WMwnZyLEFHICTIHnJvR10SSBCzg=;
        b=QA8ZiHla08Yxykdk5baymhBkGyn+nSsBHccjZsmlriV2cGCBqkuRrSGxvbi9uUbqZu
         ctFkBCVrRdkhnC21VFmSmnbgyrBPZSyO53FTxLX6YEo5wrJSNaeNHot2Q6Xcg9Dfz3z7
         fjbGR2cR8kTVFMrtrbRAXwVt0q4cbfDVo1FsRaMoS6tZCiaoLw2YDlZ52SY8EHnxL7ur
         wmr7ldWe22bm+vFpAgtxONiY5356etYGYhccW8yqgQVeczuiqBcidgQ1h4OgP8BT2HDc
         aYTC2VzZJZs4IeBgWrKQzPzyrwaei+9YDsFHRth6Lqh5HmSjAx4L2386oRLZ9GZqqGj7
         gN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779037293; x=1779642093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xRzeH96dtwyj2Z5WMwnZyLEFHICTIHnJvR10SSBCzg=;
        b=T6HwRtHZcW9VsGiIq2y+0ht/XeafqLVTfg16iA7alRBnQA1gYZPC1SeQIkCyjRh4Vf
         K+nCrW0AVEY3ZSQR8zLeQJKcwN0ssK6Rj1PY6IsuZHW1Ghjb4T+drKQLq01FHG4rWISn
         Wfp+0NNcaQIsQE2L7H6PeaPHI9SsRbZ2Q/TIhPePKpVhsQZVGhCHdCxST/MAPhHdqDE1
         NIO/bwqnLL18agkLBpmGMxmrOvIaRdE5EVhU74xig6G3+PEGsZKX/pCUSYhu8mS2zp/W
         05lJWkkVxBYbm/o59P5wxMjtWArFK0p9Ieb7C4wWlkubfwE0NhjYLVoRdKKWxw5361aq
         Gz/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8PIYX34Hdk0bJYa9TuwaMs2kV0MI4GZ8amOWOeOYyXGB7kKwmX6xu5rOaiCsQnP+jt6USyyKSQE//Br2sC@vger.kernel.org
X-Gm-Message-State: AOJu0YxRotMPYEKav+CH6EjoLc0gf7wR7DPODJ+Yk38PAP6moQLleumW
	gBqMX3/A7GZ/pqKI79sJauLyxpVPL4RHQxEv/nRSHVtJIhNLABrnjQXZvJ+T1lzOWGxCK/eZta3
	irLlij5fjngtIk93Z7FVXsTgGaIuKHZ7OjEfW/bcSqDF+r0do34mIK7uhnfDf5MxPMg14
X-Gm-Gg: Acq92OG3Zb1Z+RsZC6PZCA18b8xeDHw2sRZo6ZKpWicD3l9l8kpBI6t8QnOASOVBGY/
	aVwNfHPudOYd8Q5MfPhZ2wPjaTwQ/n9awqntUkxMlSdr2G615Ubt0RrbRERvT0oUWcepaVR3I9y
	/4uiUzSgfdyvZXAl2ZDPsGaf7T13jrGEXYINaMpgLyZFutrWWJ0z3HxMPk7afiKOB4lSKgJf2MF
	zFNti+iDjoTwUzSWpYNBAF2E3ltRU6aO7UO0aL2xDLzq4lBZW9OqwRHwQQscWQ0DXhPW4SLmhjp
	YaZtLfZWJlASZhL7G3yxU0yX+JPG+tzxvgT0qoXEpxgdwvh49O9B48oyqb5nG7hDoskx9T2Mk6+
	D2E2aywOYDb38+wUiYwQFwTqTvQXBhxAAy0Q5ZoJPa8z2vJnaiCU=
X-Received: by 2002:a17:903:240e:b0:2bd:3bfd:74f2 with SMTP id d9443c01a7336-2bd7e831c89mr127658425ad.10.1779037293135;
        Sun, 17 May 2026 10:01:33 -0700 (PDT)
X-Received: by 2002:a17:903:240e:b0:2bd:3bfd:74f2 with SMTP id d9443c01a7336-2bd7e831c89mr127657885ad.10.1779037292600;
        Sun, 17 May 2026 10:01:32 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.235.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600a4sm115580535ad.30.2026.05.17.10.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 10:01:32 -0700 (PDT)
Message-ID: <a31e27c4-b024-4377-a5c1-f02c2bf02a0d@oss.qualcomm.com>
Date: Sun, 17 May 2026 22:31:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
 <20260512-shikra-dt-v1-1-716438330dd0@oss.qualcomm.com>
 <20260515-pumpkin-cuscus-of-expression-cec1ea@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260515-pumpkin-cuscus-of-expression-cec1ea@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4NCBTYWx0ZWRfX7euNhFPb33s5
 Txf5HPoXTAiuiLGl6+sTllFj6JlLHLylhxpk6ToCNDUqniyPVnJimqiUHmig18RJ8PaTIT4l101
 wHfi8INbg+m52X547WA9ZE876CIeSrmyfZF4C0GKm8eNVC60tMX6wQx8ALpOtfnphzju+64QyBV
 q3Yc8EmQ5kZO2qop3WrCoKPL9YPppWa8QqXOBWPjiZrlWmYgzWPk9PbtjOmEUIxJfCU5bFdhbl0
 bgqVrLLFGWzGcO/tofkhR0FUHERD1HYxxF2+uEs4qVjBiVrkKaV4gLNQ2ZvygVV6rGspIYEGIdV
 xa9yEiCLsUQyAs5egTEwwGauoOs0zkyhi520RkMTq17VMyAm0CxeI172qS084DyA3KKLXlEnl2/
 5PEQEmyEkNhjg8kN6lwf6MDaG1WTdDvy1Uzkd4nbyfN5nj6htho5dKCUQmTBO39Bp7O/HRGYA5o
 ZqeYf3F4MBeO9dQm0jA==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a09f46d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=g4/7f0GlZvY0MGcqtTB0Sw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QP8ThlpALwkLgMcBQ0MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: TaClK8E7mmj_W6YZG2_NgoEYLvdJhcp6
X-Proofpoint-ORIG-GUID: TaClK8E7mmj_W6YZG2_NgoEYLvdJhcp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170184
X-Rspamd-Queue-Id: 857DD562604
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108049-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/2026 2:21 PM, Krzysztof Kozlowski wrote:
> On Tue, May 12, 2026 at 09:38:04AM +0530, Komal Bajaj wrote:
>> Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
>> form factor. The SoM integrates the Shikra SoC, PMICs, and essential
>> passives, and is designed to be mounted on carrier boards.
>>
>> One SoM variant is introduced:
>>    - CQM: retail variant with integrated modem (PM4125 PMIC)
>>
>> Two EVK boards are supported:
>>    - shikra-cqm-evk: pairs with the CQM SoM
>>    - shikra-cqs-evk: pairs with the CQM SoM, with no modem support
> s/CQM/CQS/

Right, will fix this typo.

>
> but anyway I would prefer to use full product names from
> include/dt-bindings/arm/qcom,ids.h (so CQXXXXM).

Sure, I'll update both CQM and CQS to their corresponding full name.

>
>> Each EVK provides debug UART, USB, and other peripheral interfaces.
>>
>> Add compatible strings for the CQM SoM variant and its two
>> corresponding EVK boards.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 2741c07e9f41..f041d71d7957 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -963,6 +963,13 @@ properties:
>>             - const: qcom,qcs9100
>>             - const: qcom,sa8775p
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,shikra-cqm-evk
>> +              - qcom,shikra-cqs-evk
>> +          - const: qcom,shikra-cqm-som
> This is not accurate. The SoM has physically different SoC - either CQM
> or CQS. You either need two lists, like Toradex is doing (e.g.
> toradex,verdin-imx95), or enum in the middle of the lists, like Renesas
> is doing (e.g. renesas,rzt2h-evk).
>
> I prefer the first option, so Toradex choice.
>
> But for sure you do not get the third solution... Really, you are not
> supposed to invent these things, but look at existing solutions (and I
> was mentioning Toradex during internal meetings whenever someone asked
> me how the SoM and carrier should be organized).

Sure, I’ll follow the Toradex approach and restructure this with 
separate compatible lists for each EVK/SoM combination, as below:

- items:
       - enum:
           - qcom,shikra-cqm-evk
       - const: qcom,shikra-cqm-som
       - const: qcom,shikra

   - items:
       - enum:
           - qcom,shikra-cqs-evk
       - const: qcom,shikra-cqs-som
       - const: qcom,shikra


Thanks
Komal

