Return-Path: <linux-arm-msm+bounces-92851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Go5BVZzkGmxZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 14:06:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3213113C0A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 14:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42E773009E19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 13:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3465D2EAB6B;
	Sat, 14 Feb 2026 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNsCXtl1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC4C2868A7;
	Sat, 14 Feb 2026 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771074343; cv=none; b=Z2rzNKNq1YGQ/ZTvx4gYlZ1hqVEiiwJ5nhzfH13A6iePcLm4bE9A/YOWly0BMJ3GdArHhxhqi9dP6QGxIyq0+3Lawl1Ryb443Tn3niMJZ57mqNGwuzgqcMm7mahoTSYXjfhf7utpA0k8g1o0tBvUHgkmQy9t83oOAl9Qq0Mg3ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771074343; c=relaxed/simple;
	bh=cg4LpuguQ/h/G8yLLQsj1m9APnyjaloYov77nAppJHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6EpoLmlv/wE2gCu+K3t8YKJx45guhqy+SNlwSgtkH4yZ+Hr9/fduTLc8f2tDAaohCqmNY9an/C7xx1X9rryrMF3M66lHoqW3+AWVYCZ7+s90sFL827ADGlIHfDIaCrvy6eLeFHcDyEoO8agR5WzJJRrqqRwVJkiGJnhh4M8l1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNsCXtl1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B73C16AAE;
	Sat, 14 Feb 2026 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771074342;
	bh=cg4LpuguQ/h/G8yLLQsj1m9APnyjaloYov77nAppJHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iNsCXtl17O//g29MKDscTp9eC2Y1cH6W+t4RLQgpVKM9iAfeVj/cmsX0dJ4O/TLdI
	 TMOEK3RjpMi/29aRcDyEbh80dgR7dm4wFMQvtxJmchj0vSbtPXryz8ZXbCsxRlrsY5
	 XPqWr6BpGuIynxuvf+DMb6C2P0F34kTkBXZBO7nafVAyGT13zO0VMaDzpsXcBiOxgZ
	 GK/kW+DqFRU7eU87D0NydGNXj5ZZ3MO1Kvl+glrZa+8xyKewHAXiGNdFxNC8dTBtSv
	 kPgDPdWz0n36XdDdNt/JHRcudKczpT2V6X5N46pG5KI4EZriKFj6bn12WnEwZ0jOKT
	 Y6M0QrDe0rdEg==
Message-ID: <f5869002-1b42-4164-9f14-2ee41f5b1496@kernel.org>
Date: Sat, 14 Feb 2026 13:05:37 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <20260213-sm6350-camss-v3-1-30a845b0b7cc@fairphone.com>
 <W3evhxwcLQLbkKftGpGmJ5LaEO_h3nxsWSSzrthlfatPfO60KrPpbyaq7yAu1vKbQc0RLqsaCQhTPzRruNTg_Q==@protonmail.internalid>
 <20260214-slick-ringtail-of-innovation-d8eecd@quoll>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260214-slick-ringtail-of-innovation-d8eecd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92851-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,lists.sr.ht,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3213113C0A2
X-Rspamd-Action: no action

On 14/02/2026 08:37, Krzysztof Kozlowski wrote:
> On Fri, Feb 13, 2026 at 02:15:01PM +0100, Luca Weiss wrote:
>> +  power-domains:
>> +    maxItems: 6
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: bps
>> +      - const: ife0
>> +      - const: ife1
> 
> ife0, ife1, ife2, top, bps, ipe like in sm6150 or sm8650.
> 
>> +      - const: ife2
>> +      - const: ipe
>> +      - const: top
>> +
>> +  vdd-csiphy0-0p9-supply:
>> +    description:
>> +      Phandle to a 0.9V regulator supply to CSIPHY0.
>> +
>> +  vdd-csiphy0-1p25-supply:
>> +    description:
>> +      Phandle to a 1.25V regulator supply to CSIPHY0.
>> +
>> +  vdd-csiphy1-0p9-supply:
>> +    description:
>> +      Phandle to a 0.9V regulator supply to CSIPHY1.
>> +
>> +  vdd-csiphy1-1p25-supply:
>> +    description:
>> +      Phandle to a 1.25V regulator supply to CSIPHY1.
>> +
>> +  vdd-csiphy2-0p9-supply:
>> +    description:
>> +      Phandle to a 0.9V regulator supply to CSIPHY2.
>> +
>> +  vdd-csiphy2-1p25-supply:
>> +    description:
>> +      Phandle to a 1.25V regulator supply to CSIPHY2.
>> +
>> +  vdd-csiphy3-0p9-supply:
>> +    description:
>> +      Phandle to a 0.9V regulator supply to CSIPHY3.
>> +
>> +  vdd-csiphy3-1p25-supply:
>> +    description:
>> +      Phandle to a 1.25V regulator supply to CSIPHY3.
> 
> I assume that we abandon the idea of separate CSI PHY devices. It was
> discssed way too long time ago.

No just waiting for 6.20/7.0 to drop however, I think its fine to add 
new definitions until we merge that series.
> With domains changed:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 



