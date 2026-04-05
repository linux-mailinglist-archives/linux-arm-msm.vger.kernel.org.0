Return-Path: <linux-arm-msm+bounces-101827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKJKFpyp0WkhMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 02:15:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0269F39CEBE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 02:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 816AE300B11E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 00:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C25919DFAB;
	Sun,  5 Apr 2026 00:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y3nQGDc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E6517C69
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 00:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775348118; cv=none; b=tIaP4I4BKoqYJlDI6BpLfEf1xmj7ET1eYeFVuOTPtgsqKq8by84J1dOV6ELZs+AvBhQr8NF5nELcHwKOx8XYJs1UyinYM0r1r8O1uw6cElEjHHU1wQsW8Optm7RP5eXdCQKEp4SPuKgtuLWVhiSr8X9MOmk5jxBhiDBBiJ9x9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775348118; c=relaxed/simple;
	bh=BqF5Ej2M5OJWzngrc4HxVEbLJx8wJq7qVUOlYU9Jnj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OuIsTn0WCvtTLFgONrOQl8rQuYxSQtALSvi1gvsPgXhh+s43R7Z8o/VJd70EqcKIMfJvBnd2GvJmjNPZ4CJ134WtBCLpHTdaH/m6safS34F5qLE92I78voFWFcQIkMrBfQy7TjLPsAlgIbZ1bs9WRRYKF2eCcknU0PPY9PSR+Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y3nQGDc5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b983bb07eso1660944f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 17:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775348115; x=1775952915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tyH1td2yG3Lr3A+EaOSUNG+8Njer1sxg1R+RRdpnOs0=;
        b=Y3nQGDc57odxB0UXDTnPxuBw5c65qOfFZHmsm2o3VInrSZxPoBpyKo85iReSCEoioW
         UgyNG0N6ua4jEvRytolbhK70uoiX3L9qk6Tcf2kVAW7+CUsNIlK+mGRD61QkJv1BnUH3
         Ufdmt9u3Bal2/q4UhDKFOUct9+DZr3HlCbwEkMU5C3502b5mAerMwMTbvEZVHn1IRwRU
         wfYBP2akHJ5SzrES8DfkOd8lhOyDyIkGcJjAZJq3Rpnt6umAqJ0dyyIcynJGPHfurhOs
         MlXJAEzea9g7FfENWLb3wkFaOpcITT/ayKo7Jwh9TCVf6CWlLSIrXgyx8VzN391oWT+W
         evmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775348115; x=1775952915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyH1td2yG3Lr3A+EaOSUNG+8Njer1sxg1R+RRdpnOs0=;
        b=Br+PIS1d4WhiLuXgV0lOUbW27lE6OatyM6TkUmQfHFejLDTmi3qq8oeq2ZPi3/12qt
         oCWnUHAAgRRY4U+Pq3a42j9MdtZNDnKI/BU2esePJ/nRDGjGi+5isq6PjsehWyrBzEf/
         oJgExhwgzUZj9hStPrYVfUcKVvYTdTw3sJrCvLviasxD8I/367djptg56P0gsBjmAAMd
         z19CXDotEWZcf8jUYnoiZH7ViF1CUqwrVCKN2aujDDei9Nnf1ZNoa0os9bJYH0uhHOd3
         QufLZbCPhyhJ4vP5SHW2QxvrTMhKC6m3W2YL2PPoC4IU3O2GmNCX9QISF/aUAhC1tDvf
         1Saw==
X-Gm-Message-State: AOJu0Yy3mHlNHaEMmUg+5M0kEpflRgyuSbF4sqx70msRB6McKlfc+VjH
	vkWUSjVLF6mjvKLjK5wFx++9z3BCSREG1oQ05qGFHVNkfPZ4HEngLUqU5B3AXcP6ecM=
X-Gm-Gg: AeBDiet/tvI16UwUUtdwydDC1GCd+j/c5U+DpFapcFAW4ki9+72HqzRxhM+Iq1YZ+rS
	bxI0XsW91ob0A1ki72Uz+SCxL0/+rL7ckhrmo+hajL1rhA3Pax6qiA1Ggi9UmpqEeuFK8/uJUtH
	gXlekWyYMxIbTcb/zDFUl95FLs6HWHslAkvI9z7KNeNm7BUzyc66nAq7ljwhBj4wmzJ2YIUWqb5
	NAhPHhjje+MNBSE7lZEMcAaOK6sJ4Q8ZPNSnbaEpsGRIYVmD2jEOlTgywJ8N6CcF2ntuD2XpJwv
	b3xQ+ga+6R+ijFd7SeqQymbGcv2zMW9lKCEUxTZ4xUG3Iml4yd4DBmwi4u+Cir3hmIcY/4CsrA2
	axosBW5bkZHK7I6IUEnmJRlNwlmt+g/sNmioOiVxBnr/CleVGnydwBnTp7iHO/DstFk/aNHNB3s
	3dHZjK2hKUdC+GyW2Zxqh6F3EVQ4BWNlllWT4=
X-Received: by 2002:a5d:5d0f:0:b0:43b:3d54:3154 with SMTP id ffacd0b85a97d-43d29277113mr11674528f8f.7.1775348114416;
        Sat, 04 Apr 2026 17:15:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.125.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm28453399f8f.4.2026.04.04.17.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:15:13 -0700 (PDT)
Message-ID: <c0cb35d7-3fcf-477a-9268-70f379a76637@linaro.org>
Date: Sun, 5 Apr 2026 01:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101827-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0269F39CEBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> +    items:
> +      - description: ADC channel for sys_therm0
> +      - description: ADC channel for sys_therm1
> +      - description: ADC channel for sys_therm2
> +      - description: ADC channel for sys_therm3
> +      - description: ADC channel for sys_therm4
> +      - description: ADC channel for sys_therm5
> +      - description: ADC channel for sys_therm6
> +
> +  io-channel-names:
> +    items:
> +      - const: sys_therm0
> +      - const: sys_therm1
> +      - const: sys_therm2
> +      - const: sys_therm3
> +      - const: sys_therm4
> +      - const: sys_therm5
> +      - const: sys_therm6

I agree with the number of io-channels but, having fixed names is I feel 
not correct.

io-channel-names:
   minItems: 7
   maxItems: 7

Does the same thing but lets you name the channels at the source and the 
sync wrt what they do.

