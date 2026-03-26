Return-Path: <linux-arm-msm+bounces-99989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNrUB7mWxGnn1AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:15:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F87B32E44A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4EA530297AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B3930DECC;
	Thu, 26 Mar 2026 02:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u11lRW6y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC6F2EA72A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490876; cv=none; b=UmwD/dPY1CvtUt0xGZxS0Kri2REJwpv7uLyqxPueNYDHs8lCK1ktwzgE1H0EjsGy5x/QT8MN8nls1DS9dBhlJ5oc7HRxnWzfjHF/TGgxNzWWfPKLoY2XQNQA6geMVh97JkPM5oLhGlydbDAIk7PNO8/CfD1TOHrzCnTaqux7yw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490876; c=relaxed/simple;
	bh=fP5ca+wleAv365iglFP1lOZ6n8fv/yloi+JcxBej+bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FHOCgQ39yIBVc+npSBXLw4lLntCbeDOJWxoP9AYhfgVNyj+qCgAWx0tVb2y2iy8Y+mQF1S9bTj1m5eSgH2yfFgL3vjLnl8zPBgQFDJZdXV5zNr9CEgP4A+79xwhhC5sl6dHoCF2nu6pU5eydOhAFDuDKRdLGK44idyKUissF0xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u11lRW6y; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439bcec8613so275185f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 19:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774490873; x=1775095673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQBV0aIbBMoDV/It9TWPuN/5h+uJKLUgF07SUqXfhYk=;
        b=u11lRW6yTU9igaZ2Yps0O7OWHzDAggN1vfYCEJe3jUvgAEWXFx2FLmsdAZ41cfHEEa
         qwUyD6/4JCm/yti5ttjf8yONy4HtY6RAj/mGsqI24HTNmoGgi7HQ8s6821i5kxU5iems
         eJQU6EFARhixfbBJe6zK1747JUvgpAYMfLoOEftdtW3gMVPtgMnwNnJpGgzopQBwBFiV
         0N7gPVnHcAv/iAd2dIn4L2es/tfcfk9Px+0QQSRgG9/pQ28e3TU1wAbJ5DySJBDp+y3/
         ucrawWKu1ShFtTQ8A0VNWj6952+tTIPBEYIFvB3YPZByWS8pg9upiTofan9Q8mBKNm79
         aU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490873; x=1775095673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQBV0aIbBMoDV/It9TWPuN/5h+uJKLUgF07SUqXfhYk=;
        b=DwjYfY60kYh3/0n/DgUqBCuIAS2bv5xddsmFCGX12c3Z9NGE1bqzPSXRvUttaVkvot
         xL3s29VVQXdYKxCyx0xMuQbTu6UuXk/cyU2tZ855wB81KmPqlTR2giaZnR+evHJNx2B7
         RSa2HRQiNJ/YU+kpk49XSApszYqJ73fECZVoO1TPyuag6NqEuUpwA8Xnqa4hwadLM8N1
         4WvRiki8ow6VLpknESy1x5RiaG3e5JzAVVFU9HC/L4nmalwNTJZmcj5j2B7UqBIwJEB/
         mpJVWSV7J/UbUW/ceLPvwETO0MFpAT/sKDw0i7r5sFqgg/Lsaz/DfliyRRF5j+RbkIDs
         j+Ng==
X-Gm-Message-State: AOJu0YzaksAf4GnPQshXsf1gNNkCHgolnEkjcYXvlzHOMVQtw/KnKMnr
	Gx0TxK+hcdVjtEPb8iL+GOjZMA7/Mwnp8+Ykw/uTZZFWvwN+G+JIAbENWV4CVJuzlEI=
X-Gm-Gg: ATEYQzxtJFMfw3PQXpa+Y6Fc6Y381ui07c0SA2JVWj6yfkO17RzsMTjqeVpqVy/qm2D
	nQZx4/pvvYY5ZWDkrTvuxi9uMJBep+wSMaC3hCBlRvWwhQiLcHTyKiVOL2La7aN8N+fYGawIBaL
	xg2PwxjsuQRWbE2SlCv9sD68S1ufLLnwvKzwoY8+AZGrVrjORnxo8JfzlkrEiesX+qcq2Of84qa
	CIWzI2TnahoWDX84yAIprv7AVvaxHVQr1Q205cnucQ2pUKBxvcBFI2tHV4go8IhRP3KrVyEjxmY
	WzU7DAroOzCJrN2IegQJzaLcTitWOU4Cib9nlKxmfOF/nq6DxSJ9NFcs0kMzN7tgSJvZdDtQ8r/
	L0VkA8ZOlvj1vm+Ygjmz8PUJWMlQM7qenjjhmPhtJUaIV5G2PE5I8mBrd0Cgg6g1y5mmnP+yPAT
	ALms4jL8HZrjtPWEk8yl7bMEHjbB/1onbi/cE=
X-Received: by 2002:a5d:5d07:0:b0:439:fbbc:d593 with SMTP id ffacd0b85a97d-43b88a04ff5mr8594238f8f.27.1774490872955;
        Wed, 25 Mar 2026 19:07:52 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7372sm5264843f8f.34.2026.03.25.19.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 19:07:51 -0700 (PDT)
Message-ID: <540c2a97-00ec-4358-855a-b238aab53860@linaro.org>
Date: Thu, 26 Mar 2026 02:08:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-2-5b93415be6dd@linaro.org>
 <17ab70a4-1ab8-4384-8537-44dbfe31889a@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <17ab70a4-1ab8-4384-8537-44dbfe31889a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99989-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 6F87B32E44A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/2026 01:51, Vladimir Zapolskiy wrote:
> On 3/26/26 03:28, Bryan O'Donoghue wrote:
>> Qualcomm CSI2 PHYs support a mode where two sensors may be attached to 
>> the
>> one CSIPHY.
>>
>> When we have one endpoint we may have
>> - DPHY 1, 2 or 4 data lanes + 1 clock lane
>> - CPHY 3 wire data lane
>>
>> When we have two endpoints this indicates the special fixed combo-mode.
>> - DPHY endpoint0 => 2+1 and endpoint1 => 1+1 data-lane/clock-lane 
>> combination.
>>
>> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++ 
>> ++++++++--
>>   1 file changed, 65 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100- 
>> camss.yaml
>> index c17b9757b2c86..f44138f522bba 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> @@ -148,7 +148,8 @@ properties:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>       description:
>> -      CSI input ports.
>> +      CSI input ports. Supports either standard single sensor mode or
>> +      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, 
>> clock-lane mode.
>>       patternProperties:
>>         "^port@[0-3]$":
>> @@ -156,26 +157,86 @@ properties:
>>           unevaluatedProperties: false
>>           description:
>> -          Input port for receiving CSI data from a CSIPHY.
>> +          Input port for receiving CSI data.
>>           properties:
>> -          endpoint:
>> +          endpoint@0:
>>               $ref: video-interfaces.yaml#
>>               unevaluatedProperties: false
>> +            description:
>> +              Endpoint for receiving a single sensor input (or first 
>> leg of combo).
>> +
>>               properties:
>>                 data-lanes:
>>                   minItems: 1
>> -                maxItems: 4
>> +                maxItems: 4 # Base max allows 4 (for D-PHY)
>> +
>> +              clock-lanes:
>> +                maxItems: 1
>>                 bus-type:
>>                   enum:
>>                     - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>>                     - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +          endpoint@1:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            description:
>> +              Endpoint for receiving the second leg of a combo sensor 
>> input.
>> +
>> +            properties:
>> +              data-lanes:
>> +                maxItems: 1
>> +
>> +              clock-lanes:
>> +                maxItems: 1
>> +
>> +              bus-type:
>> +                const: 4 # Combo is D-PHY specific
>> +
> 
> It's unclear why both 'bus-type' and 'phys' cell argument are needed
> at the same time, they are equal and thus one of two is redundant.
> 

bus-type lives on the CAMSS controller endpoint. It tells the V4L2 
fwnode parser (v4l2_fwnode_endpoint_parse) how to interpret the endpoint 
properties — DPHY has data-lanes + clock-lanes, CPHY has trios.

PHY phandle cell lives on the phys reference. It tells the PHY driver 
which electrical mode to configure

---
bod

