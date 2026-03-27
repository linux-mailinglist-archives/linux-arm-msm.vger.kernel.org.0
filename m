Return-Path: <linux-arm-msm+bounces-100393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLkhEn7Cxmm8OQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:46:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6391348911
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8485B300E25F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306713FA5DD;
	Fri, 27 Mar 2026 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLELYUxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A06B31A07B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633340; cv=none; b=slQdG5Z2urqVXlrEik227X8f7LrYYsVJ5T4caGTtepmn74JUjsQ0h9OQNlEFB/TLhna179NqNBMEeHERlaAGiWuf4M5rZ7HqzRXhdWOb+ydr7yhRKzVqtXc2BbPmIqC687EKOPrKCXTcpN8/a1pSyU1gJ5weQBXWV3ulhoIRAJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633340; c=relaxed/simple;
	bh=ETJq2PPi48JVsLsmWI9PZOd4lZiQNUeAf8BRU0YBYTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlnY8RmXPoA83aNVHhKrJ391HX81ZlBY+0Y8iBp5DBMXX4qhvIxNjyN7VofBuWX1msasr01P3IvoX1My0DQwvmjI8SSBu3/ZXYcLA5VVpyH7A+Dt0roXCH3NGE4+wMPQICjSGGxqtZl4YeFlhmiSXH2KLzXODVI2y4gkhs9rNv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wLELYUxH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b7481f9d3so1389656f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774633337; x=1775238137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yfu/d6+o0zctQTHLu2MWPdnz/JwccY9dTbonya9Zlio=;
        b=wLELYUxHX7osQKoxO2CZUd96lWlg7qNF6VR5x0ztPGEAMyIunRJ+4MKieRHjCrx1eK
         VXW1LA8N4N2cqsh8XrwyuABjr6EmzONiim988HhXPeCemSA7W8XdZ1/iSeK4uA0I2JtE
         2XdOpOfvXTdbz8w1q/+/w1apPYzp+myboRxfbKB59z4QtwKlWJUd7LH7LGLdIzh5w6Jp
         dgutxT2S7uJNyJcuwSlt8lB224+ddNRDj81ltdWjWdFT6ueMSC1ISb6vjdAn3eiJhyy1
         3qgPJZWguLiqshgA/Aa7PFeXq4q1GbyA4raQ9cHB622HitwoW0DIhpJjrGM7/yoWlAh1
         yX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633337; x=1775238137;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yfu/d6+o0zctQTHLu2MWPdnz/JwccY9dTbonya9Zlio=;
        b=b0HhUjqSQuwj2LJHifVwwj3I5hOQytkvCZFT5nNRp3fxcPpznQsabSI1i+UEsDDYWc
         L+TqgU7nmHJYeXc3y9Tu3gdrYTcB+jIExI//HGl5eZJewQ4AiICqF8YioWSF1xY2YL7C
         OfuvDbcjFn0tJAfXFHWJtc5pvWTPSJMYojSIplsYZ5knCeqqArzubwCHvVudZbBSkPqU
         hywMSBce1yffXjPOrX82z5WSiOHoYIufq5Xbu+iYfQ8EG6+/GNhJzq2HVbG+ahaTFMeN
         QH89qFpZPEyN8yaXzC8K3HUhjJhuQqs5MNU2XAKJeRtt5dtyr32h7luSXIGcJ8TZV1as
         5/2A==
X-Forwarded-Encrypted: i=1; AJvYcCUUiaRiTSkIHPvuYIpnWha18t66etPZ66ZAn1mOhOvL4X2238ogd2OLEhj1tpJYZArBtoXx4hQZ3TJMutD/@vger.kernel.org
X-Gm-Message-State: AOJu0YzPitV7b1o8XbKKGxQC4j+kVhco7CTzelMWgzWAaEAfKVWzu1BP
	hgKmf6R04wpH1c4kILdwSCQSbptAy75y2sVOoRNMgtruJteLsL91B1HBjZW8IsW4DCg=
X-Gm-Gg: ATEYQzxLP0oSk8We7nQRyA6QzXqUB+r/QADMC/0r1xnk9Kb7oypjwi0FJ+7L2ieD/ka
	7WAI6OiBKkECyeNqp77UgLh9OmYQ1eK3efEweKUvvdm49GWbDx/SMjPOavKg1r8mgMkjkgk2+C/
	7bLugG4BCWdwGUarDHELt0sgO/1H5iLvCkZsYCgtwgPFPoQSFZqFPQr9RP6zC9IF46eHWE7fpz0
	NHdnuiE1yxrYH/Agkfn+1obhTT7nj75fR5q0lAOyUZ4EeOdyBuNcCBBjiG/2HOGsPtsS0aOu/Py
	nmaNQaapH/2tTdb1TiYI6XCsQcoa6O1YYRs1mQyTZn9BNYS2NRmZ3tTfeXJDj4P25HqeBMCnNU/
	iygEXWlYZah4Kd9HHi3g52Js6JUfpwDeaHhvcZPydBK9oi1JLhlYUhgfGrSgqICK6IlurD2VO8L
	NxQa2HpENQY8GUZX0QDnBvBWfw13Z890qbdECf
X-Received: by 2002:a05:6000:2006:b0:43b:41df:705e with SMTP id ffacd0b85a97d-43b9ea77850mr5911220f8f.49.1774633336801;
        Fri, 27 Mar 2026 10:42:16 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.214.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919432f0sm17358844f8f.13.2026.03.27.10.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:42:15 -0700 (PDT)
Message-ID: <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
Date: Fri, 27 Mar 2026 17:42:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100393-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: B6391348911
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 15:28, Neil Armstrong wrote:
>> To be frankly honest you can make an argument for it either way. 
>> However my honestly held position is analysing other upstream 
>> implementations connecting to the PHY means we can't make the PHY 
>> device a drivers/phy device - it would have to be a V4L2 device and 
>> then for me the question is why is that even required ?
> 
> This is plain wrong, DT definition is different from software 
> implementation, you can do whatever you want if you describe HW accurately.

I'm not sure what point it is you are trying to make here. Are you 
trying to say drivers/phy is OK with you but you want an endpoint ? If 
so, please just say so.

I can see an argument for that hence my response to Konrad, I just don't 
see why its a Qualcomm specific argument and of course understood stuff 
bubbles up in review, we have a public debate and come to a consensus - 
that's a good thing.

However, I'd want wider buy-in and understanding that endpoints in the 
PHYs is a more accurate description of the data-flow.

We've been applying DT bindings aplenty without that so far. So we would 
establish new CSI2 PHY bindings should represent the sensor endpoints.

Is that what you want ?

> The CSIPHYs are not tied to a single "consumer" block, they can be 
> connected to different consumers at runtime, which is not something 
> classic PHY devices are designed for. So they are de facto a media 
> element in the dynamic camera pipeline.

The existing CAMSS binding and media graph are not changed by this series.

> And actually Rob Herring asked use to define the complete data flow, it 
> was a strong requirement. I don't see why we wouldn't here.

I'm implementing feedback from Rob.

https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/

To me, here is where we stand:

- Individual nodes - we all agree that
- As sub-nodes - I think the majority agrees this Krzsztof, Dmitry
   I'm fine with it too.
- drivers/phy - I think we are accepting this is also fine ?
- endpoints should flow into the PHY and then back to the controller

I get that argument. In fact I _like_ that argument at least I like my 
conception of that argument.

I'll stipulate to that argument meaning then that, new CSI2 PHYs shall 
include endpoints for this purpose globally.

As I've said before, there's nothing Qualcomm specific about this 
discussion, really.

---
bod

