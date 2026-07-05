Return-Path: <linux-arm-msm+bounces-116550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XaTPKqB5SmoaDwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 17:34:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E907D70A75F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 17:34:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OuVK7ctZ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116550-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116550-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95C9A3008229
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 15:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A603806D9;
	Sun,  5 Jul 2026 15:34:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8FC283FCE
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 15:34:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783265694; cv=none; b=UQH1VmPzUk8KYAJAKZaH1vcSMiPLaxaSNpZJpAac+bQ02HwAJRJeNiU13dtrZyPpPAukZ4/hokuFyvzy9cETL7hCRQcUJ747exGFu7pQyxU+2dmgF1IJRiWy/uRkmrOTf9+yXPmfGJGpFMH2Rsx4nXOIXE+NQE6j4LG6jjXJUWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783265694; c=relaxed/simple;
	bh=2Yc2IMD0mgTkF39SyRHg6q3EK+7fbcohsK/5Wz6q898=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZdE/96+xLZEAbpQ6x5vXypUSFmw6JlTpvdwWTh85zg//MoIVS1f9fZ/acJ6Ic8XmZ1DusSeNk/MutEStgPQK0ZKXu90KuLAolxtPYFYFlgTqw3d+V/cExN8qVMz7juWRAMYVSYJGDGXyML/LitziITSHfBAwIqymVKYzXo0mmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuVK7ctZ; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cace91f112so16809695ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783265692; x=1783870492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPm/HN4GUNTi7jMto5jqjALmE4rLy5csX5siSaTYK+Q=;
        b=OuVK7ctZpjf4W8wbXOGHLD8m7MevTq1rZcAL52EoyQF1kaRyTGE5ljbawcs/cAYtps
         wkra1OME/NgilTSPXM5iY7ZiyM9TOpLwN4l0VVZNWFq5lVcxIXAmMtl66cGeHHk2VrLN
         UFvljSV4pIPASSFglVUsBefT47qj/LMVyWcKQvEhehrrIMm+KkqatTDWvzYZV6OPxH6g
         GHa+7D1vcEjpN0LrFAzB/WKIuBx9YQOXOSNFMd59koSV1boh9+72FnaId9+93zoHsB3q
         HDp5AOsXxjIVwmsH7ZpvNC1++4ggxyrxXQu0t+cEj5z5Mf9uv4/F0OC9yg2TEEL8O+kx
         F8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783265692; x=1783870492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPm/HN4GUNTi7jMto5jqjALmE4rLy5csX5siSaTYK+Q=;
        b=q0O5fh7crbt0khWUmfQ5cP/ro28KwTBD4036Hv4v/xFjxbB8ocmIOqKSjmzaJNRSFR
         kOcTZjx0eaiQPECqP7zo/3srofgQ9vP4MtsXy4RE+YQC0VwFEs5j782CGmorXoFlQOZ9
         0N6HRZx9xwq8JZu/fJS+7GkefYUsatQV1w7jz5BJq89Lr9tUBiP2vo+nHyLmq7E+d+GM
         hTQ54LHj9f9zpq4/w3yvntJw4NnNKQUoF0RaFxE17lP9pHmiLlLp0hj0Lik623yAx8T6
         SmLZASGt3eA2MJEkwPU2Mk8sRv+mh6rrXijgLKbJMNYRkgCzbfeYPk9zXfuQY0JRjMr/
         GzOQ==
X-Gm-Message-State: AOJu0YyZ2zK2lNEFmUq/soAMtG/RLEYmgNn0OT4+rs+0QCJbt4rjMzEB
	FEcKRZSkfNq0rOuthuY8KRkrHjnxiqqc9Xu2DiXDFgkRoSQL2S+MfAUw
X-Gm-Gg: AfdE7cmD1HrEZUTREmE+vHIwgHucUwukJDJtjSMrRr9BQAJ6Ed1YWvF74a4zC9l66zR
	wPhvu2n6aFcAQo4IVgBxylPqBRrNjPYlBloZCJgw0e70oLvwDMIfzWcWvUn0qaEO8IGCSTuoQ5v
	zFKSG/pcYGX6EfAQotcQcXbPEvOVrl/Bp2vWps+xfSzkLqwooegAyADoEdyNAyePJviNpbyp1Zk
	kaXUXByw47Rvg4zeyrBQmb5lKRQHEN8C3+u46wFzY+LRff60aoS45WeHY2QqdPxiuerjroE6H+G
	S1NvOC9rhQUqJbKR/8oZpjsDgSWqR8NVP/uwTruFe7ff/7XlVC+KuZdQNeZIH7MAr4SmAy7KZPH
	slq8XWpwsa1M9B8+1J7QgmsH8oJrCIYihCPV+TgS7AFQF/L2MuMi/wYY+hNNxVcyJ2n0S9Gs9fz
	P6upAl2VbyJEdV4aU/HzdRhdObycf/
X-Received: by 2002:a17:90b:134b:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-3829f5e8447mr5859302a91.30.1783265692223;
        Sun, 05 Jul 2026 08:34:52 -0700 (PDT)
Received: from [192.168.1.91] (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3c8b19c7sm25398486eec.4.2026.07.05.08.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 08:34:51 -0700 (PDT)
Message-ID: <68b83361-42a5-45ac-8441-f0661b005f85@gmail.com>
Date: Sun, 5 Jul 2026 23:34:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI
 (SFA14-11)
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-2-kaipeng94@gmail.com>
 <9d9645e5-2e63-4c22-8b5f-b0f4368c581f@kernel.org>
 <bdac77fc-41a2-4c89-9f60-3a8eefc9b9a4@oss.qualcomm.com>
 <a15ae7ec-4a83-4d14-b187-738f5006008a@kernel.org>
Content-Language: en-US
From: Kaipeng Zeng <kaipeng94@gmail.com>
In-Reply-To: <a15ae7ec-4a83-4d14-b187-738f5006008a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116550-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kaipeng94@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kaipeng94@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E907D70A75F



On 7/2/26 17:32, Krzysztof Kozlowski wrote:
> On 02/07/2026 11:29, Konrad Dybcio wrote:
>> On 7/2/26 8:27 AM, Krzysztof Kozlowski wrote:
>>> On 02/07/2026 08:31, Kaipeng Zeng wrote:
>>>> Add compatible values for the Acer Swift Go Pro AI (SFA14-11),
>>>> using "acer,sfa14-11".
>>>
>>> "Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
>>> Elite (X1E78100) SoC."
>>>
>>> That's it. Don't add unnecessary boilerplate.
>>>
>>>
>>>>
>>>> The laptop is based on the Snapdragon X Elite (X1E78100) SoC.
>>>>
>>>> Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index 50cc18a6ec5e..6b997d615bad 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -1142,6 +1142,7 @@ properties:
>>>>   
>>>>         - items:
>>>>             - enum:
>>>> +              - acer,sfa14-11
>>>
>>> Why no user-recognizable name is used? Look at other consumer products:
>>> lenovo,thinkpad-x13s, lenovo,flex-5g, microsoft,surface-prox,
>>> lenovo,thinkpad-t14s-lcd, tuxedo,elite14gen1, microsoft,denali,
>>> asus,vivobook-s15... and so on.
>>
>> We have a good mix of both. I tend to dislike relying on marketing
>> names, as they may be similar (or identical) across wholly different
>> products.
>>
>> e.g. microsoft,denali that you mentioned is a MS codename for the
>> Surface Pro something something
> 
> I am fine with mixing (swift-go-sfa14-11), but the model number alone is
> very hard to parse by humans.
> 
> Best regards,
> Krzysztof

Initially, I chose the model number because Acer has several QCOM 
powered laptops with similar product names:
  - Acer Swift Go Pro AI (SFA14-11)
  - Acer Swift Go 14 AI (SFG14-*)
  - Acer Swift Spin 14 AI (SFSP14-Q51T)
  - Acer Swift 14 AI (SF14-11*)

Using the product name directly here can be confusing.
I think using a mixed name (swift-go-sfa14-11) is better, too.


