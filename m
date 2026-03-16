Return-Path: <linux-arm-msm+bounces-97932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK4ILzbxt2mfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:01:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 553CB299130
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91772302DE63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306A93939AB;
	Mon, 16 Mar 2026 12:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJOK22kS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FD43939B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662469; cv=none; b=XhjWvsPGghvkapcBLkndxAn6oUgI9/7JphgsWHPIq3JxcclVAjD2ndslJXqMvbgUQieqmOKDp9LNqxlJ9uEZGokT3Z4/AR2P/abwGbWX/XAOAmUm26xGDs1fZBkxDrWlL0STui2321bMjsQXyq/hPrgGrJtBAhm6xdunwX0o4m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662469; c=relaxed/simple;
	bh=ov15GdvYy951odfmmRTBgQ4znCL6jfkGH42MKPY2g/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ap0ICeQwp0Up4bTEi6zkuO4TzsEFcux+bp64v481h5SDjfWZOhnZXKc9sCFTt9IbZxqpBgauzVxbe0pweWdcCf+o2WOKqtsabbwwy2o/VWMl9g48Bi9xtfExcSvrWd63lvhrDMCVtS4V1YOgJsJCAx0YDNrLzWW+n1EOaJ6/C3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJOK22kS; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8d7f22d405so564056466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773662464; x=1774267264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LxnU6r03Dj0WN1v8lkXQvcdKFfXZuVCRVsfNOysEAw=;
        b=wJOK22kSGqsj9dy8LlRokkx6W/AR5Ca7iNbOcQYupIpiOIia0vlz90K+oCBE0Sa+mB
         j8RyqbbTZnStQeOvToTSekOvPMKE+rN4fvwMxMLazV9D/IQ/TF8YXV4Q/AMp+0myKSrP
         v1wbf0pJI9xWPAOwQOMl3GMDAJNJOLZK9LZcHFmvrheTd7tMhZZTIejt0lmfPzQDjNfT
         RkrU3iXICpxI9YwqIQxCzkLVFREADtjIqjiiYHjPttfq87m9zVf2NlK4SpWFuAhDUzwc
         gJi8Waml6UwcU2rPYO+mS4M/2TeL85MJWby5W1jRBRnEl1mWToECPOnPdWVJtf0KdjTW
         mC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662464; x=1774267264;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LxnU6r03Dj0WN1v8lkXQvcdKFfXZuVCRVsfNOysEAw=;
        b=iRrn6lJbfgUCYdLXNbRf14Q8LXKgbzIobTXay2y0E8f7GwolCVFopMXQxbTWbhZEfu
         IkGgp1HX2t3uWbWOAKLwMXkK50CcKS/z9B9CQVGikho3LuHcAbDSWM76Nh7WcZ+N29fU
         SXKRHOEBIsBkh5agWxxLKTnp3LSBhqhzKL4uv/Ey0/8ThkoqtTUW75g7S0nib525Qmid
         rkuIGgkRJLVCzFhOAZx+x4sVgZu+J0yHWV2Hk9w2+cXSY81i0g0Ex3vrBi/N1Ise3JJ5
         +b8YkrXOz0KEjrZazcf7xgWinDSVWOJgHiXbsIl092w1i95yu4dv7uHitDCtIoOOoUOF
         HL0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWIGl9f47A5kMO4X/trHo1XAI8KxIbgBecNlaVhbTA/vaR5ygZ2jUBsnEMcLZBppfUknRp55m+0S79uu1E@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa5TriPBqUdky9KMy6xPZ0dHqrovILfgVQ9oRs1SafxJbVANOK
	1amUocYLvWOQAVF9wkTVewDPInSa0lbgmITR+3K7KodKgOUOtK3Yfu/ukC2ZjzKsiF4=
X-Gm-Gg: ATEYQzxgEgjvO6BP/cFdUsDvl8aq+95Aab5yAaY+v2BhyYhMKlAbsbVDyYrPLJb+OJn
	oIIaKFP0M5BhI+wEdvG5J1MM8oM5iXE9EF3sgd0JwjE1ZMTAWbgv4xZsNACFpUAGwjYPN6/+b9m
	lUPSaAr3WrBtiYClhSWrjM9zJn7t0LYG/jHvWSL0PZ5d+ItIoIufjC2laEL3YVTWsdMtX8hxGZv
	8ts5Tw0wPvZMyIDDdvuOK5ndjHof7Fox1vKhXCniEfK3s2dkrTcvRwKpDRfiE6l0ENdc0Xd/jbM
	RqQpXy192q7oP6juvNs46o1OaRoi/gIAn1N1PqqXMO4tN2tyL7feUnmywJ53c+t6nuXEfEYg1m3
	qMAhAV7d+LsuOemWiJaBJ0uuQ139FtCWpqWfcDpq5bX7SQZusBrJsgGUYI7yJqxx136u6piTRnG
	yHvy7v3dQX6wKOw9ixiicr8pcc7yjAV92e7EHANxpHcxbDiX0=
X-Received: by 2002:a17:907:84e:b0:b96:e11e:97c4 with SMTP id a640c23a62f3a-b97650e63cfmr727417066b.20.1773662463825;
        Mon, 16 Mar 2026 05:01:03 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.226.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978b8625d3sm457168766b.52.2026.03.16.05.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:01:03 -0700 (PDT)
Message-ID: <94f4fda4-504e-44eb-87f0-e34e557402f8@linaro.org>
Date: Mon, 16 Mar 2026 12:01:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97932-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,acb7000:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 553CB299130
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 07:29, Krzysztof Kozlowski wrote:
> On Mon, Mar 16, 2026 at 01:02:01AM +0000, Bryan O'Donoghue wrote:
>> Add "simple-mfd" as a second compatible string to allow child nodes
>> within the CAMSS block to probe as individual platform devices.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> index 2d1662ef522b7..b5654ef71bd89 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> @@ -14,7 +14,11 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,x1e80100-camss
>> +    oneOf:
>> +      - const: qcom,x1e80100-camss
>> +      - items:
>> +          - const: qcom,x1e80100-camss
>> +          - const: simple-mfd
>>   
>>     reg:
>>       maxItems: 17
>> @@ -191,7 +195,7 @@ examples:
>>           #size-cells = <2>;
>>   
>>           camss: isp@acb7000 {
>> -            compatible = "qcom,x1e80100-camss";
>> +            compatible = "qcom,x1e80100-camss", "simple-mfd";
> 
> You do not have any children here. And if you checked the DTS, you
> would see this does not work.
> 
> Please post complete example and bindings.
> 
> I suspect that after posting complete picture we will see this is not a
> simple-mfd device (child depends on parent).
> 
> Best regards,
> Krzysztof
> 

This is it:

https://lore.kernel.org/r/20260316-x1e-camss-csi2-phy-dtsi-v2-3-859f3fa55790@linaro.org

Just broke up the series so that drivers/bindings could go through 
linux-media and the dtsi stuff through Bjorn.

I actually got the idea from:

commit fe6a952b567f6a771d087d2e969914f31574d6ab
Author: Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri Jan 27 20:40:50 2023 +0100

     dt-bindings: soc: samsung: exynos-pmu: allow phys as child

     The MIPI and DisplayPort phys are actually part of the Power Management
     Unit system controller, thus allow them as its children, instead of
     specifying as separate device nodes with syscon phandle.

Seems like a similar thing to me - its not a discoverable bus so not 
"simple-bus" but we do have a bunch of devices which exist inside of the 
CAMSS block.

I'm not very emotionally invested in sub-nodes - what do you think 
yourself ?

---
bod

