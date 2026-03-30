Return-Path: <linux-arm-msm+bounces-100749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DnNFKZPymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:25:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C13D93592FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C76283077CF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D6B3ACA48;
	Mon, 30 Mar 2026 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqrUEkoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNyh6xNw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34818390C98
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866099; cv=none; b=MzOorrg1Oyu6DVwbWb3dmVmlfoJCAE8UkAhog6auMEKqPWz/cZRmBIZLwRRKNsKKDFgAv/K5Jit9F/FjtHgvj9DVXY+BLpK5CpNxmIyNaZxJGFS19RI7SDLJmyCogoMDu2hmYtE/G8Wv65pXu3xV8N3WPDiyWUAW74eeRTcccOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866099; c=relaxed/simple;
	bh=4OBfFkP2MR5rRsAuPGckpZyAxiwK6hDrBhXT2Zor774=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uOYZRfOuuU81hRb7DJIvJrGg4y5EyC0N7tAbxFJlxwR7mePO3GFR3NYyWfXBQHHggNx+UZmXUpDSWYTGr+aYvR5c9kQ+BNoz+6UGH66i/g1mgCBhZ9rA3S4TX5iKdj5PWBqM8evu5MPJbuwgL4PMipXiIIH0DeXtNxyi3pM+Bcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqrUEkoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNyh6xNw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9iqa54008353
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJpcZ1xXPK3O3he194ASU4hAMZEwCVNlpL8m3IxrHxQ=; b=RqrUEkoj+timjdrw
	IywQYX9btrS8DcFXbWDvulGWZmC/7IA4zp/8bW28dEwYvIY/E00DTnCyG9aty3nN
	IiR9V+Kp5Cfsqk6+h6dl6IDyjm8aG2CjPuFJA3d/kokgZ5hQz/aUurt1uFDU5F8p
	vkLBKKR54tzh1D//sTV8AMh5EovQZL6CsSBMXXsbFq1ADY7BRxOee9g9oo4zGF8x
	Pn3mq7/lbwKBzm8wrwaeMVa8J4g0+lYpzTfDKJlh1ajUT48rGKRAmmiICNNPXmP/
	LJYjmeyV9LA9zOFkN9V3RV0RpsLC2mgqg7dWJq1O7KRRVPiS878rW7CxguQ32qIx
	D2+onQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm64b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:21:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24f112e0cso3254645ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774866096; x=1775470896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJpcZ1xXPK3O3he194ASU4hAMZEwCVNlpL8m3IxrHxQ=;
        b=YNyh6xNwUUrFcDbcrRxO0nQZTxvsvbqA0uZg3LisOEMP96E16fSkNtjVkCBGt9iCrb
         7vZjhPSBUDmUDL/7mE+0ebVip6/kmB+XETcXt3tDTJZHlMovZO8cVKriQyrcIGQYjpF3
         OgCN5PXjnCRjBWgeDaqwiDiy223IFUGekHu8u5DDOPC4gfsrFeqLcuIh8duPWgTYgqTw
         XIQI0sPHLbW4hOBljM5AHHR3aNnbRDMfv0f6MVC2S0fIm/tUfWBOUZythwOYoe8sjCmo
         ugWuDSdA+xzKRwdhyKJeEQblOu0J9TlmRzwHifeciDpjeqUfJCuWywewqkoTZV/pyoBQ
         PD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866096; x=1775470896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJpcZ1xXPK3O3he194ASU4hAMZEwCVNlpL8m3IxrHxQ=;
        b=ebrRB5v7BoU5sT0JmjHZyCRa0R791PFzV10EqzaRDh30OZqX8/XNXvHLMmpBxlQCiO
         Oh4+C2N/tGovuwMYP00bpXLc4+uuz59ZUloqwM3pqfijg9mrOQ6MGCY9yzYjKp5tHeuK
         TXdiXVk+wpCvXYf8W1M4n1gJYK2VJwwx9FkAbleYHzcSbo5UhnyHEvDhY7vvtIu2mHaC
         cDfoYIf0igUKcOmRmIOcQP31Na5Cf+dznRKYjMxxrEXrDvU77QvE9SDiWycNOHdx4Rja
         IK/RnUhb+RK3Hz/nqPdk/vC59wgHuBb3InKp/B/uj9SH6C4IlMn2lVWC1aCZl4EGF3r4
         B13w==
X-Forwarded-Encrypted: i=1; AJvYcCWUexG/ntWg3XMywSU03TjphMJnzMYDzqO4ZBmou7Mfko89Pcg3OqfZEXypZkkvU/A611YgFR5N/MigNYVq@vger.kernel.org
X-Gm-Message-State: AOJu0YxsjXUts8/TmD1vnYv4CsOo106tJZZy2K5r16/RJe6g4t2iuOR8
	WDV3il6QNaD1qnLr0zkkBWWmlQUPcXGdjpVgrcVn9/xrUv4pLD2eEtQFBfc3ibcukSWn7TTNMfk
	omnY8nH4y45xEkEjUpdIQZjVYB7blVJxJoKlQDm07/36h+nQzVzJJ3Rqvt4lCCQ9DsjpX6gBjN2
	F2
X-Gm-Gg: ATEYQzx/aaAT4EGVKbs9xyriE4OlpUZi8ZNLcVaRhMCu15U/8C9hPxR40WvzfZ3z8um
	DmHdXhE8yhCYTSdlY+EhoYbzmZXKZryUTlcLZnNR69oEVGNr3k0XavgZQ3keoOcc7X7OnxSfb/5
	Qq14ZSEL+URLyE79jXcNWq8heFGrelYwXEz5HjENGZICYujoJW7FJ2iiZpLMuQTUvJKuDVt6g0u
	xIzm0KL0032E94ko9QYzbEdmK7832m0CUxr0cyslPhUehrY7nq5gd14d9eVvW0e4HmyftzhFKN2
	gwEZ+R4Zt119bb2IV3nsr9kIogZTRfZb7KDRxKxZKDMrRZvey+wyU1EgmeNs4zSbvi4pcnTx84j
	8JmLxd3YKlNN0u2EPwomnTHG+XXeahSIVpWeRkAUHDbmHUc2+VQ==
X-Received: by 2002:a05:6a21:700b:b0:39d:7344:633e with SMTP id adf61e73a8af0-39d73447b6cmr2877940637.4.1774866096014;
        Mon, 30 Mar 2026 03:21:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:700b:b0:39d:7344:633e with SMTP id adf61e73a8af0-39d73447b6cmr2877925637.4.1774866095535;
        Mon, 30 Mar 2026 03:21:35 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917ba961sm5583852a12.25.2026.03.30.03.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:21:35 -0700 (PDT)
Message-ID: <534c5aad-13eb-409c-91c0-b92602313331@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:51:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
 <20260328-monaco-evk-ac-sku-v1-1-79d166fa5571@oss.qualcomm.com>
 <20260329-accelerated-pigeon-of-joy-c6c903@quoll>
 <f7e63fa7-2579-4dce-974a-8c81a1aee00f@oss.qualcomm.com>
 <7f5bfeb8-7d91-419b-981d-1f0f568f01d2@kernel.org>
 <a39ca7b7-b277-4518-ad45-1f42506b615e@oss.qualcomm.com>
 <c7dcab44-68ad-48b7-9ad2-8e2b15951fa7@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <c7dcab44-68ad-48b7-9ad2-8e2b15951fa7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TX-uEvAefsQ6o9tMw_-JSpWYZXb7j3_v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MSBTYWx0ZWRfXztLd9VFS1Uks
 nfr+4xgPca4Ivax8sTNhhtt3CWK7KsqHVyZVv+zXbNoml8AONZmjsB2jcGQiDvp//apTxVvzFt0
 WG1qhiQC0gU/wzG6zcpYuJ/vMCaAiboCTgZqnjjHeHea8Nfb35j8yfN5vvdo9thXzflN6GstdRG
 xmFsHF9/hW2L/++SYGymKX2trc8HvobUbRD+aSGRrBtkNGTx8hs4HmyqTD7mkaZaZ7go0QaAevQ
 LC4zfkya4Aq3scULlD1F7LYQqJ4Zw0ecTSBzaJyP/DfO6D+2e0TozL5lkxcsqJFKWxI0So6RC2w
 zjWZKmZsBMwo7CjvfBTvfRVELRLdNPjqw58bkA8nJlbUDwbbXj2vllyfESR03lkSfcnkJRTt3Aq
 m9xttWmlTED+R3cu254CLc0PXHvnKhoFrcH/UF8EPkxAVj75EQUhM9khtoiynXg2DsiXA+yrPYA
 gjlBZSLJzA6fxgri5Rg==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69ca4eb1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=8vZeovsvqUcOHt4vsk0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: TX-uEvAefsQ6o9tMw_-JSpWYZXb7j3_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100749-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C13D93592FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 3:17 PM, Krzysztof Kozlowski wrote:
> On 30/03/2026 11:36, Umang Chheda wrote:
>> Hello Krzysztof,
>>
>> On 3/30/2026 12:24 PM, Krzysztof Kozlowski wrote:
>>> On 30/03/2026 08:50, Umang Chheda wrote:
>>>> Hello Krzysztof,
>>>>
>>>> On 3/29/2026 3:22 PM, Krzysztof Kozlowski wrote:
>>>>> On Sat, Mar 28, 2026 at 05:11:17PM +0530, Umang Chheda wrote:
>>>>>> Introduce new bindings for the monaco-evk-ac-sku,
>>>>>> an IoT board based on the QCS8300-AC variant SoC.
>>>>> Please wrap commit message according to Linux coding style / submission
>>>>> process (neither too early nor over the limit):
>>>>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>>>
>>>>
>>>> Ack
>>>>
>>>>>
>>>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> index ca880c105f3b..07053cc2ac1c 100644
>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> @@ -918,6 +918,7 @@ properties:
>>>>>>            - enum:
>>>>>>                - arduino,monza
>>>>>>                - qcom,monaco-evk
>>>>>> +              - qcom,monaco-evk-ac-sku
>>>>> Why adding name 'sku' to the compatible? What's the meaning here?
>>>>
>>>>
>>>> Monaco SoC has 2 variants  - monaco-aa and monaco-ac -- "monaco-evk" board uses monaco-aa variant of SoC and this new
>>>
>>> so ac? or ac-sku? Decide.
>>>
>>>> introduced board uses the monaco-ac variant SoC. Hence added the compatible as "monaco-evk-ac-sku" to differentiate it from
>>>> monaco-evk board.
>>>
>>> Wrap your emails.
>>
>> Ack
>>>
>>> "ac" differentiates. Why do you need to say that a variant is a
>>> "-variant"?
>>>
>>
>> The intent for using "-sku" here was to match the existing upstream
>> practice where boards that are otherwise identical but differ in H/W
>> configuration (SoC variant, storage etc) are represented as separate SKUs.
>>
>> For Example:
>>   - sc7180-trogdor-*-sku.dtsi
>>   - sc7280-herobrine-*-sku.dtsi
>>   - mt8183-kukui-jacuzzi-*-sku.dts
> 
> We talk about compatible, why any of DTS names matter? You don't
> understand the meaning of sku. It makes no sense without the number/ID.
> It's like you called it "-revision"...

Thanks for the explanation - I get it now!

I agree that encoding this as "qcom,monaco-evk-ac" is sufficient for
the compatible, and that "-sku" does not add additional compatibility
information.

I will update the binding to drop "-sku" from the compatible.

Thanks for the review.

> 
> Best regards,
> Krzysztof

Thanks,
Umang


