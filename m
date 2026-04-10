Return-Path: <linux-arm-msm+bounces-102604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBFFDPaw2GljgwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:12:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8553E3D3D3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EF9B30053E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8B63328E6;
	Fri, 10 Apr 2026 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xWtgbwQm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBCC32FA18
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808405; cv=none; b=XyvR8kwtEqJV7T+er6SJEypLLPLHhyWyrORdx7O2WQcz2PIVeX0pGgxa8Qb8uRCVy9d1zZGMkRRjBDkjkPiAwQFUDgRoGCfTPfgQWqZUs9Bfl14tUsItC71LsvIadk71V4vtr+CNEc/89sexhvyOuZXCpghR96Mk7m6OPl90wZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808405; c=relaxed/simple;
	bh=GBGCIVS5N+RaJ7icTp4wgwTB79qWgs2D2v5gmbrA8bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=or/sXXHX351YzjbF5B1kWyykH7tLM/xAjfVs2hXLCJ7si6aFqqYBjOzexDxDVXZHM48UQL9a2UChDBzEmI0nhWKQeH8zGbkgakyBixliAa+XV8Pp9igJrJ5V899fQ6B18+hnDQwbVQOg5wyc1kaR/5lL2fQNE5QrQ0T2zSA5dew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xWtgbwQm; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b941762394aso204326266b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775808402; x=1776413202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxA5detxxijNUecQFSx43HHyt88jXCieq2fj6pzLvOQ=;
        b=xWtgbwQmactRlBEr6xGCmlUiSfkEDvUfPzy/cocsyfyeIEmDiUBpY8vOM1Mgo4zilo
         +mCirrmxzV3z3pZk7KGk14DKlFocDelc2pHCi55IqKDn8WzJsw+6x56qahHzCRaZFqm2
         ozJqLXHlux19IAInOjaJS4zBFuzI7Mmo0559StKCNcpY5DZd+fODsMnB3UOity6qxeT2
         HWwOWevjmRhBFyI+xHfvLJqZcuCHpW7J6SBbCu9tbazdaQfdLeEgGyIXsPfiuFOWVYys
         6Edn3ZHfTy56DP1NOk9NMFyqupCT0iKEfBwypz4nO/Y8n5KmtUeZa/dckDvTNbFnEtmo
         x23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808402; x=1776413202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxA5detxxijNUecQFSx43HHyt88jXCieq2fj6pzLvOQ=;
        b=cKldeC6NrCxMOZASJQN0gXFj+Q4pCOLngOSKXR9FaOwnCVJL63v8lmFKlsHwhCnkVt
         TDJ4hd19L6FFMiPyPXM1u82+UkWGq0qZ1NMc/XHVhBn0/GDUJzncd17RHZDBGZkTjzLc
         fYaUXRsoMYFw5DLfxjZiW+Esg972XTEuFJPW8z29DMmttBD5l1wZdT79NG5YSvUmkV3P
         zeP8BM89tuU8m8a0gDOso+oRb1CQGc3tYy5T3jO3cfWHbRvZ0LOciI3jHAPzb5sB9BDj
         ZhMEq6oSXPzZ2IpgTxjOz/Rf77DDcssvf7FkDlUvj+QPYQezf7+Gb0HvxS6WRZ5/0f2O
         YzmA==
X-Forwarded-Encrypted: i=1; AJvYcCXq6eBzrWL44gybCmt6WT3Tnu/2fL4ejy4SzyFC3BWgd3VJ9lsLI2N1Y3Hl6y7p0YJ7k9mD1qDgDuaCcGDK@vger.kernel.org
X-Gm-Message-State: AOJu0YwxrCx976okR01tYV/72Z2PWhA0La85ilxCd0Lzc4Worl1II5c6
	/pI/jCEckiXZiINgZq3Xm7aUVam08gtBpYEC+XujcUqpHb/sERZW1re47JFfzLgJ6V8=
X-Gm-Gg: AeBDiettJc3p4igktAoZMqrBaGR5AaVG2L7VvaWrMX/Ua25azZ3/4cnKC+a6hdsAMnn
	0dJlG5n7p9fy67YfPsinkzNSI/FifGi+oNaOp/j1Os5vXu/uYx/C291u4mSK71mtR7czgLauAel
	OXrL2hXY+ScpomcQf1UxzacBvRExNnTg+GwtNzjmEckOMAJCLJVe1cAGv3JOxMZ8avmfISHUxXf
	vegbig7kxBnQ+FTfYMNmkDvzyha4+dqSzyqvtSV8Am8Yfsuwm6WfbhSdkpoMeBKMpzbNWIWnO3J
	zt8jQ27E0+zDmaOGxJp51OdjrU7pB/oFgFC9WKlkmHz8m/zkdQDDs7lb4OjsGuPsME/zBxfavLD
	kXMN1Xy56gG2qHL2W8qG+nzlHzDXFJ9C8+m9PJx7Ub21vqgX4AsHclGdEH9v3+FBMPeYNYWJcf8
	ccQ25A2LOBJ7BCuuKCBaufaNuZAg8SnhXmDalcsNx4YL5Bo/e4Y7jy6Ov1vBVigX3PhHAa/Ng8i
	l4QTdJhRJrJQTZLoStaguty1MyLg5cBo15QTRQ39Il3B7nruwplGOFkDHd2txmsZLm0wTcOob4D
	0j+6jeRT3nI15A==
X-Received: by 2002:a17:907:a0d3:b0:b98:132e:ca97 with SMTP id a640c23a62f3a-b9d72815099mr138971466b.47.1775808402011;
        Fri, 10 Apr 2026 01:06:42 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm357147a12.24.2026.04.10.01.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:06:40 -0700 (PDT)
Message-ID: <2959855a-3448-4d98-99ab-eb0e36bbecbd@linaro.org>
Date: Fri, 10 Apr 2026 09:06:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
 <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102604-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 8553E3D3D3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 05:25, Wenmeng Liu wrote:
> +  vdd-csiphy-0p8-supply:
> +    description:
> +      0.8V supply to a PHY.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      1.2V supply to a PHY.
> +
> +  phys:
> +    maxItems: 2
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy4
> +

So if we still can't agree to get phys = in in the next kernel cycle, 
then this scheme is acceptable but with the huge caveat that one 
power-rail for each PHY is known to be wrong.

And I absolutely hate to continue to knowingly do the wrong thing...

---
bod

