Return-Path: <linux-arm-msm+bounces-79307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EEAC173DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 23:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 393573AAA0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9DF369998;
	Tue, 28 Oct 2025 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhoYPg1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2DmbOXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1132E36999F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761692118; cv=none; b=ed9s/lQ+4/gobMCYQsmKJlvIo1HTdJxV1F8ZyV2v0ktI1KIym4rcNwBBKRWMVsaa6qJNycOHS03ozlQJrtilVfwHbCaDLGGRh8H6AzZUGo8i+DOER4sEH+tXd0LOvCHGrh3wPXDWFl+lRVWJ9FuPYFEOdN9uDL72uITfGc5+9sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761692118; c=relaxed/simple;
	bh=yzwDfwQsi48OmO7FMHn21UWUKfUVcr9ew/gPai8Jm58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CM0KiRaQQ1eUdIHi085dazayCAT9rPOWQZLUyDAphffxyylD6bxU8gcL8siiCEbmVR8cBPThhB0F9B6ecbXzznQ5uXc1T4C2Sqz5M0RtnuwhxK3UXEijs/Mn+dVyz3JJpA5uA2C3617CDC2h1fqvhyNb8OusxuD7jP4jUo21FVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhoYPg1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2DmbOXP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlMTB2539303
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWH5Yb4kYBWyOt0Ev0V2vzZdJPpepgJJhZOsAYCisGo=; b=YhoYPg1EgXm2WHsV
	mWbWSk+UtDDbawHTC3JcbcHgk2C9uKVwr+93/RRtt6o5oJNOEgzv4U1q5Xq8du1L
	lUw1OoIMVyAUBwE5aRRqMv80eeNtYmUK7JMfLPvffTj8PyRKugBPfSRyUAuycpcn
	ZA9oUtTvITzbszjuelqynzsbn5ZN+LNJLpC/gU3khwsSVbf/bPwatjI2gcwzRQuA
	ayZTUBMpzYstCn3jd5g1Co1PEk3TF2pqbcZvX34FAqMf64DT4YMnWTlShv6J1nje
	MTmcjWSa3KcZiBaBx6IX2vVPm7ryrzSSiTwGtkSK+11AuTZqAauO3zOUA6ygWG+m
	c73Ydw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1gf36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:55:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6097ca315bso13383409a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761692115; x=1762296915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWH5Yb4kYBWyOt0Ev0V2vzZdJPpepgJJhZOsAYCisGo=;
        b=d2DmbOXPQQ9wfHuCaBYBSXSit/zG0Ee8jbGJ8vsw/IcT8Fc8a9tIS3oqvVTdtD3C4N
         8N45l9M040XBklVKIqUqj9xka/cTvMApwY8tsf8qjMMYdbvc2Dww3w97hpDesavG/Dfc
         sSBYIB+VHrXb+3Zm4fuR/ijt1R6QBvCwn5wRZZ/gINzWoQ49+rc0DlU0GzrM1YlqHiZk
         sc1LNUUT9k+kmY7FBjHER2JJvm5q8uPzDAwbwalrT8lCtB1Pgl7MWw8xALIWBr3di7wW
         drmKmOqJ4+av/FCz1HHfu0+dCKqIi6Fingk0mAA5HMPSqL+o1btGI+VKS7nLpVNyj9/f
         e7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761692115; x=1762296915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IWH5Yb4kYBWyOt0Ev0V2vzZdJPpepgJJhZOsAYCisGo=;
        b=IXnZ6jXMDicEvG2V3sm5u0wRSCq9B698nRVSQRq4/uxxHypkEbz0K/Ni9M/wl92S/X
         GwizoZfNVhKBprgUv+Dgm+zaN69fpwtKsNHsPw45B3GJVCvHg66ouXOEVVsSB9NYyvis
         EJ5HgvpN46mgvyz1QnEEnpz5OWtg0vZNqoIPFHrG2A7IK2qfOOW57LjzcuG6FmHeHU+8
         lgnmIKTJyNZAtvTWT4V9tYjgGwJar82+66t2gxxS0uUm4xZTHIVupGm4gQiWUstm+ijQ
         JGer8NJ8MZZhg+3pd9ZYVB++K9zYTklyYHoziqoYg/dr9+TtZ72rqbr/j7PvEnS2Rmj6
         1tnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTaUlkqtQzJxwpeaAjCi48M238uSdFycCq4MNKWsimifHCYNEiDAUKVd9dseqcfdL7ld7CuqR+fwIDlhmq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwtwl7JECvyWT3ziiQ3VGetOTXxBGZwJPiF68AaKKuRprlE+ri
	qkGdsklYMtyyaVja9exBxAk274l9NixfA81UEoISt81nd4iKLB8WYDSFoY+Hpf6KspV/1twDac4
	XVLuLPXQZyB8UvBnTauNa456Mb+Z7u/vNWns1R/vhGe9GwUQqJYTGWyelwf9DHrFC/UVa
X-Gm-Gg: ASbGncv3HlCeaOj4fbl8Fgv+btje6PDSPgsP3DIcJecgvoPIAgIHMfqai9BA9kBHlp1
	sTHJ9nR7RVT507kFkla78Zfzp8cUgxKqJBWcLPagPhB/cGQhKvNwgn8A6Y+8bIUcqQq1LS+tuD3
	uasz5F1R3Uo/Quk476bfFLV1bBp85xI49ZFnaMLjqD5F0Ifqhe9xGQXLzM26IhZ9CV78tWCJNbv
	VkowJ/r+3OrDQlxh2+JIscptrN6R3YE6cyQglsZx3oBDescVkPkRRngiwsK2SCt3NVF64gOtLXq
	B5AtK9SyWAsqCAkCdlshrpB+ikcm1YGwI92HADtSlPQrk8VbepUfXaKkgEg3yNGpgARElgnYHYu
	3Dt17Peujv2MF0vFGE7thHmlq34e0idbbJQ828dBQnjcXB+CNOY7VlK2NBVkglKQ=
X-Received: by 2002:a05:6a20:6a23:b0:334:8d1f:fa8d with SMTP id adf61e73a8af0-34657f5b867mr750128637.18.1761692114713;
        Tue, 28 Oct 2025 15:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEW5reh+w5hgD74kbP2DyxqWnhWvQGt5/x/EERIqxSbt5YqENq8fvwnso1YY6Zz4H4MxyCZg==
X-Received: by 2002:a05:6a20:6a23:b0:334:8d1f:fa8d with SMTP id adf61e73a8af0-34657f5b867mr750104637.18.1761692114233;
        Tue, 28 Oct 2025 15:55:14 -0700 (PDT)
Received: from [10.71.115.47] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bd810sm11701618a12.6.2025.10.28.15.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 15:55:13 -0700 (PDT)
Message-ID: <481ec137-87cf-4448-99e9-4a1477f4854d@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 15:55:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>
 <20251028-private-chirpy-earthworm-6fccfe@kuoka>
 <4cb41e69-fb32-4331-a989-529b5af0081c@kernel.org>
 <918fc9d3-2cd5-4442-8bc6-b930596d95c1@oss.qualcomm.com>
 <ba760468-ac41-48e0-a56e-a675c3c0d5b7@kernel.org>
 <2676d88f-89a9-4b1f-895b-3bdc048f6fbf@oss.qualcomm.com>
 <4e7f4211-3194-409a-b33c-e47bfdfdb203@kernel.org>
 <01f419cc-3236-48b9-bd51-e7db07d1e6fe@kernel.org>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <01f419cc-3236-48b9-bd51-e7db07d1e6fe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=690149d3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-iQ0l0JE6UEMKG4t3oYA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: obe8Ss1P8YuuFPn46gQAGvYWNfo2ngvN
X-Proofpoint-ORIG-GUID: obe8Ss1P8YuuFPn46gQAGvYWNfo2ngvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE5MyBTYWx0ZWRfX/PxGyOq8rCP0
 cZAubz9y+AvReFJwV3xnlfzTOSTgWg1YMY7zwLYXd1T5HlV/V8dJRj6aGKTpND6G3veOGRNTP4b
 8BEZJ/M5L3Tr1WtUJdPctJ5ivqTg+xNkcRuFA5Zp5PyautVWatfPTzohHqGPLFXwclbtTH1n2oB
 LPRZcccY6p0tp5c6m4HYjIdjaTRcGqKNKzDctvW30NxRKYOHihfkERyoYab6yvGwssochOgxXPA
 XRJqkq2Om5lyrpzw8U7ojR1LQScwf/fFKxWpXYe1ZoSrD3loxJ+6gIdX+8/dxh8lQ6zWptFbsm9
 DCjyiPxqmiw862b7SMcZpi0FxV/iqdXgdL4bBsCpAoEV3f3I6963erO1HDTqVbbqfgxDOp7uwuU
 NCmeRK8msQafblC9zeI3ve4HRDCC2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280193



On 10/28/2025 2:30 AM, Krzysztof Kozlowski wrote:
> On 28/10/2025 10:21, Krzysztof Kozlowski wrote:
>> On 28/10/2025 10:19, Konrad Dybcio wrote:
>>>>>
>>>>>>>>
>>>>>>>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>   .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 7 +++++++
>>>>>>>>   1 file changed, 7 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>>>>>> index 7085bf88afab..c57022109419 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>>>>>>>> @@ -37,12 +37,19 @@ properties:
>>>>>>>>             - const: qcom,pmic-glink
>>>>>>>>         - items:
>>>>>>>>             - enum:
>>>>>>>> +              - qcom,kaanapali-pmic-glink
>>>>>>>>                 - qcom,milos-pmic-glink
>>>>>>>>                 - qcom,sm8650-pmic-glink
>>>>>>>>                 - qcom,sm8750-pmic-glink
>>>>>>>
>>>>>>> Why qcom,kaanapali-pmic-glink is not compatible with
>>>>>>> qcom,sm8750-pmic-glink? If Glymur is compatible with previous
>>>>>>> generation, I would expect that here too.
>>>>>>
>>>>>> And again to re-iterate:
>>>>>>
>>>>>> If X1E is compatible with SM8550 AND:
>>>>>> SM8750 is compatible with SM8550 THEN
>>>>>> WHY Glymur is compatible with previous generation but Kaanapali is not
>>>>>> compatible with previous generation?
>>>>>
>>>>> The announcement date does not directly correlate to 'generation'
>>>> I don't know exactly this IP block/component, but in general these SoCs
>>>> follow some sort of previous design, thus term "generation" is correct
>>>> in many cases. Anyway don't be picky about wording.
>>>>
>>>> You can remove the generation and statement will be the same.
>>>>
>>>> If A is compatible with B AND
>>>> C is compatible with B
>>>> THEN
>>>>
>>>> WHY D is compatible with (A and B) but E is not
>>>> compatible with (C and B)?

I think some of the confusion is relating to both UCSI and battmngr aux 
drivers using SM8550 as compatible strings...

Really we should be thinking about this as:

	SM8750 is compatible with SM8550 UCSI and SM8550 BATTMGR
	X1E is compatible with SM8550 UCSI and X1E BATTMGR

or
	A is compatible with B and C
	E is compatible with B and D


More specifically:

SM8750 has the same UCSI quirks (UCSI_DELAY_DEVICE_PDOS) as SM8550, so 
we would want to use SM8550 compatible string in UCSI driver.
SM8750 also exposes the same features, state of health and charge 
control, in battmgr driver, so should use the SM8550 compatible string 
for battmgr driver as well.

Like SM8750, X1E has the same UCSI quirks (UCSI_DELAY_DEVICE_PDOS) as 
SM8550, so will use the SM8550 compatible.
BUT X1E only wants to have charge control exposed in battmngr driver. So 
instead of using the SM8550 compatible, we should use the X1E compatible 
in battmgr driver [1]



Now we have Kaanapali and Glymur being introduced...

Kaanapali IS compatible with SM8750, however since SM8750 did not 
introduce any new "quirks" or features that Kaanapali should inherit, we 
can simply define Kaanapali as compatible as SM8550 as well.

Glymur IS compatible with X1E and since X1E introduces a new "feature" 
that we would like Glymur to inherit, we need to explicitly defined 
Glymur as compatible to X1E.



If the reuse of SM8550 as compatible in both drivers is causing 
confusion, perhaps we instead add an X1E compatible string to the UCSI 
driver. i.e.

--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -319,6 +319,7 @@ static const struct of_device_id 
pmic_glink_ucsi_of_quirks[] = {
     {.compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
     {.compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
     {.compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
+   {.compatible = "qcom,x1e80100-pmic-glink", .data = &quirk_sm8450, },
     {}
  };



Then we can have the bindings like:

--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -29,6 +29,7 @@ properties:
                - qcom,sm8350-pmic-glink
                - qcom,sm8450-pmic-glink
                - qcom,sm8550-pmic-glink
+              - qcom,x1e80100-pmic-glink
            - const: qcom,pmic-glink
        - items:
            - enum:
@@ -37,12 +38,17 @@ properties:
            - const: qcom,pmic-glink
        - items:
            - enum:
+              - qcom,kaanapali-pmic-glink
                - qcom,milos-pmic-glink
                - qcom,sm8650-pmic-glink
                - qcom,sm8750-pmic-glink
-              - qcom,x1e80100-pmic-glink
            - const: qcom,sm8550-pmic-glink
            - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,glymur-pmic-glink
+          - const: qcom,x1e80100-pmic-glink
+          - const: qcom,pmic-glink


[1] 
https://lore.kernel.org/all/20250917-qcom_battmgr_update-v5-5-270ade9ffe13@oss.qualcomm.com/
> 
> 
> Heh, and don't get me started on driver...
> 
> { .compatible = "qcom,glymur-pmic-glink", .data =
> &pmic_glink_kaanapali_data },
> { .compatible = "qcom,kaanapali-pmic-glink", .data =
> &pmic_glink_kaanapali_data },
> 
> So how is now Glymur using Kaanapali, so basically compatible with it?
> 
> Even more questions I did not consider.
> 
> 

Both Kaanapali and Glymur are running on SOCCP, so we should not define 
PDR paths. Since both platforms have will have the same pmic_glink 
services running(i.e. altmode, ucsi, and battmgr),we can reuse the 
pmic_glink_data for both. I have no problem with instead defining 
pmic_glink_kaanapali_data and pmic_glink_glymur_data separately but I 
figured upstream would not like code reuse.


> 
> Best regards,
> Krzysztof


