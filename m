Return-Path: <linux-arm-msm+bounces-98072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPvPAyrtuGknlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:56:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1A2A425A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF1C93010252
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 05:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56833803F3;
	Tue, 17 Mar 2026 05:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gWwbLYod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114EC37FF65
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773726914; cv=none; b=Ffao9tUb4HK27CnZaZlUqaZeYYZAMCqBGNzqQw/Tr15ZSBhziR7CcMF0flLU86y/h4qrX+XIbq9CXpYUn2XDUHjElgV9M6cs/2YvxLXOK9saqHPn1AlyWol4kBUIR+K3J7r6pZS317AsgSFh6QgVMymZx2nt3llKHZ2xZU+hbho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773726914; c=relaxed/simple;
	bh=GMP79ITCgxv/qqTOcIGDhMjkPwlpAtEKWoKxT1QzKrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tg56OQMOtiHDnD58JY1lopv2eGD9utHWTkHLNmOo/5fMly7lPx1ggcsoJrTflYwnt3wPdDRJDPjwUDUiN5TcphXJedoruGqvXKwEE/34MaUhEQOIYaWDsysLaqAzbp4a7iRkY27kTvybRO3CszN2Nx8mI5/t7od8HGm0dZF4p2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gWwbLYod; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso47659825e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773726910; x=1774331710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcOeBnO85QXQKxiCKrlrGwovlX4gkf5w7/X9rdV9RuA=;
        b=gWwbLYod2MJtEqf29QupScfb9gpItkNGwvBMBG1+UiQNzmrCwp3qD4mNusAWvRpXTV
         vYjNt1lXqeIpRZXFQKWyz3VmpDNYTq2QheBIE3V19iFt9PCSFdlz74ABhoESa+WrIGiR
         1rCWK5f952IJ5CcX/Wn0U8u8eApmFLBDRXvkbJFv9QvShtcVx40Id67a1w2blQcn1IfH
         ez/7RduyRZEzIAuS3BS5u71L2+j96GJ8WoN/+OzkdHHyJ9ZTDNipE0g9rPHUBvAOR4v9
         9Sr9OG+Bz/fnJgcTfzG8zRtUsq6becPQzDM3zQKmx+YfdQOw12WHgLM3unIzhsC99AnC
         cM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773726910; x=1774331710;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcOeBnO85QXQKxiCKrlrGwovlX4gkf5w7/X9rdV9RuA=;
        b=BtCV/dlQtJSSoRu+7urg1fEumxe7upiKGDT0n+vKtFuBdECQpl2u8Clx2zqnS9xv3e
         0Tv9WJAlt42H3aSRBZKOE3ofv2BYXXO3eetjQPG7SKtxBFIQZ7xsYfG59Pz9v2KrqINc
         U8BMXyDPLJmnNuzmjWbk4YTA6bLMWaHFEj6D38+INhNM8jDkAjJXgpJIDLdwq3CBd50S
         K8yF8+xhMQLbysvVf0Wk2stl73eZlinOErDVa8GtBfTWSQWPtWi7iy3FQYpUCYdmV8Bl
         szt/oVlsUwVKvT9dgZGAqaY+/7TJ1FQCdj4idAwk4s0bjsxhZLduDbUhATcRS3GWkz9b
         0Wiw==
X-Forwarded-Encrypted: i=1; AJvYcCXRDrkHDc1wInVBWRQxMUP9dJE+lGNMfXuPCKPPgQtWCfpN6aKUzLQd5Zpo8fLQkJNQi7s6p/G8aoKIDTZH@vger.kernel.org
X-Gm-Message-State: AOJu0YzM3Wf5IssgfMzul97AwFa2FkE7LJanUIrTSos5KdBia2cSAOkZ
	7wjsRHiH5/wN7vI2cfod2DA72jHkP6qiKuSYUJDxaJUtvmH9wxc8N1THyOQdlaNRjZo=
X-Gm-Gg: ATEYQzwJQ4qZ402ZtGM21C653ACVXCFqQruvgs4wpMEgFwdZ80diXE4s6qbRV+vYdqC
	LD8bXjkhLKtuejVAx3OxgutfNkX7cjGshhh7kdYCkaPn45p8DvSTMGQOt4S1k9Z+lC9Ba6eIlHU
	5RiAHtsqpx4MrHxkxothurwXn2S8e79jgXHC2T7sqeq222Y5Uk448RMHV1c44Cjkc/mVxI98tnF
	sM0Zz19OCFZVxS5IMNGLyAHoMNx+CqSsEoT2mykEeSiVr41SV5lLBsgqjxPxPOT19M6tgdYwFwL
	OU0xcXLzGlDqhUEsoacb7jpQkzBuz3MbGJn86HnrHGDWbJDcCnY2ueJVuqTgk4KcbfCVcr2EZJA
	qVu4fgUXKeFptT5WNp/h5qaVnN4+vgf3g5HSP+MMg5Ci7v4o/tZpwgBe/jLMSzskOGt7JlPa6Ix
	eWRCQAPLAEv+GBlfi/Cb1ffLP313s1rYxkCyo=
X-Received: by 2002:a05:600c:c8d:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-4855671052dmr255918505e9.33.1773726910252;
        Mon, 16 Mar 2026 22:55:10 -0700 (PDT)
Received: from [192.168.0.101] ([51.37.189.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea98070sm42508625e9.6.2026.03.16.22.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 22:55:09 -0700 (PDT)
Message-ID: <d104e54d-8276-4d1e-bb7d-9c01c45a7184@linaro.org>
Date: Tue, 17 Mar 2026 05:55:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
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
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
 <20260316-papaya-mink-of-examination-6db401@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260316-papaya-mink-of-examination-6db401@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-98072-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: B7C1A2A425A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 07:31, Krzysztof Kozlowski wrote:
>> +patternProperties:
>> +  "^phy@[0-9a-f]+$":
>> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
>> +    unevaluatedProperties: false
>> +
>> +  "^opp-table(-.*)?$":
> Why do you expect multiple opp-tables?
> 
> And where are operating-points phandle? Please look how other bindings
> do it.
> 
>> +    type: object
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -175,8 +201,6 @@ required:
>>     - iommus
>>     - power-domains
>>     - power-domain-names
>> -  - vdd-csiphy-0p8-supply
>> -  - vdd-csiphy-1p2-supply
>>     - ports
>>   
>>   additionalProperties: false
>> @@ -188,6 +212,7 @@ examples:
>>       #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>       #include <dt-bindings/interconnect/qcom,icc.h>
>>       #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
>> +    #include <dt-bindings/phy/phy.h>
>>       #include <dt-bindings/power/qcom-rpmpd.h>
>>   
>>       soc {
>> @@ -233,6 +258,10 @@ examples:
>>                           "vfe_lite0",
>>                           "vfe_lite1";
>>   
>> +            #address-cells = <2>;
>> +            #size-cells = <2>;
>> +            ranges;
> Again, incomplete example. Where the the phy?

Both of these q's can be answered by adding a phys to the example, which 
I will do.

---
bod

