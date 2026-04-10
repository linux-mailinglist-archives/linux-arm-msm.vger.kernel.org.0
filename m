Return-Path: <linux-arm-msm+bounces-102605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGVHM/Gx2Gk8hAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:16:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E90D3D3E00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A924730285DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335DC3AC0F8;
	Fri, 10 Apr 2026 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BowBnNN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B4639DBC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808998; cv=none; b=MkF1b4NjuxyepoDXZ/GcqDMbfpSG/Tz+Vo/DwyevX3Ct+zE+1wEwPg7ogcst7Nplftmpbpz53ThNvc0llon2BWno64ld0Qikl2vbmrB9MO5jDOpQG/xo2EN+TSASO9x8G0MmQj4F7gI/i2VV/j5Sm8hYShEAC4eSBJZB+uH7oyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808998; c=relaxed/simple;
	bh=XtXGqPzWh8q9HgVc0vdy2c3tHF1YZZdgyN9U6qjhzX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2jTrNU3xk8s4Ay9jIRChEjY2RnSalZXRUSSBQPM+7ICFdZErfZx1DEqGbaZHBQwivuhoIJZ8qJ0Zle1Ntei37GyQvj0i1c0C1Hp66mAwfYFuSl7eoys6HsHyY3cQpjJAacH1T2dJTM+Bd89XzW29wF62I6C3Qhh0L9mROQwCYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BowBnNN/; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so2208449a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775808994; x=1776413794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OR2OsOoHo0XEMTeQrZ4vaIui9J4CKX4eq9R2pcadAuU=;
        b=BowBnNN/xuEmHWc7iPzfEQqXJyj0IxKbh61YS6ruiOmgOhe3BZuvVGyIOHQZu8HfyL
         2QbK6SQlADJZuwN4S6ZGkFMhiB/c8qFYJFNBNcO3e2m/D3ZjQosAfn00m2ikh5DrcV1j
         duw54GA3AWTvh1CSWtXXhz9uZYbTu8LU6K85vHe9hCb4tiWadZq4ky9nxsllewMh76vn
         bIFQs9s7ggaPxBx5sVPxUO43VD11hUXMbH2f7iqBykQ/TWoJE0cTHj0A/dVJS9fVXb0J
         TSEJlMpZ7h00yXBMUJIlaSmoc5J8alXBXWOT5tvQDcn8OQG+IBnjHz0gizRwjy42pYv1
         rPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808994; x=1776413794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OR2OsOoHo0XEMTeQrZ4vaIui9J4CKX4eq9R2pcadAuU=;
        b=DQCCFGYlnDD8IALHod4r8nGI6ZmAfuHkty7HaVyxyiVdXehJwtr3vqBo6w1G+P60LN
         Am6qcY7wn+9TztjuM47fAZOmK+yTLCuQBT+irlJdZdDcUzfxRQxxJos1ymYcFgRVNOe7
         EIKP8ekZNHuX7GhEsgzpkcHhYLkyZpobAyG6SUTkzap05zqwXi5bNNIxa4rQLWzbKHdT
         EXzyFFC8vMY6QBEgcK1X48OCWQe8WaFeL4iVyiPznqrC7kHftF91O+At8GaogHwjE1L0
         m8Cl7cju+tkjswM33XVI512t/I7C6Knt385/r08bd/jYAnEtyfwUBCKGgMqghyzXD2kK
         oLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEd4pJ3Ixhoz4vOcrhZCNu/q5PwQaAPT3aVKWvjd+p3IY83XXiyDF2+qBQGyylH+pSI6qqR9pjAZ8jKgxh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk4z5j9opThWjrubJsQHt/6EPnjTD0RmeKTmb+g+YHAoZY6czM
	KIHz6LE7drbPoZX1b01ym+oCk/N4QNc1gUcjrCHoXbV7nDQzLbce5xdbftnWEsO69JY=
X-Gm-Gg: AeBDievNodBSNMGfS/eiCM7mnYY544ETAFg8zzJd433gocVirbWKpv4ZEcGlFJutTu9
	QTYvAFYDxbg9DadDt3hknDSz9gjiw9+twgSNb8sLI5dmaQTv030SR88dnrHypQpS7aWvzB65hwr
	gdGMtSOuwRolIWDhYgtA3Gg9uCPPPKDN9gqCBrniEMu9z0xVIqkvjE8LzFGtNhVRhjCQVFaP8bZ
	CHPp3xbT6OLhEZszkbS+qZj8zLf9ugr3ycSoryckbmZOV8vkK6fSUQjDrCZAISrLDg2BCNQXYaT
	qIWE2Bxhcrn7WSX6W/CMeba/k62YeUvySa/iAqxdjM1+hqkfmR1ieo904xBX/ge53D5etWIdMlC
	3QVoz2Dneun4GJdtSzqfO2dDSY7HqIr3dpXyZ+9FyM8N+DZYu9gIB72RMZ+mJVtKFjLDpRUcsqc
	8F2tDCni1dfaD58rhV2UMLry95HUHCv0I8W2VelMOkJMwB2TmkMnEO5/PWzytnTkamiSEB27ozA
	8GAM5gHeFVDvDLI777mBSjBxjJWbtdncEi/QIe2OXMfP36LCBxCGp2sKQfV1VkoB141Eqvck54m
	x1Lw25ijN8+OJg==
X-Received: by 2002:a17:907:9801:b0:b9b:207c:f7ca with SMTP id a640c23a62f3a-b9d724f0008mr130116766b.5.1775808994189;
        Fri, 10 Apr 2026 01:16:34 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e36sm60770166b.10.2026.04.10.01.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:16:33 -0700 (PDT)
Message-ID: <765e4740-cf13-4d4e-ab69-c1abe1c39d34@linaro.org>
Date: Fri, 10 Apr 2026 09:16:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: purwa-iot-evk: Add camss node
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
 <20260410-purwa_camss-v1-4-eedcf6d9d8ee@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260410-purwa_camss-v1-4-eedcf6d9d8ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102605-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 8E90D3D3E00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 05:25, Wenmeng Liu wrote:
> nable camss node for purwa iot evk board camss tpg support.
> 
> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3d8c671d3564942a74c484de762d0..eef03f1eb2a950c06294159be3f97169fb487265 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> @@ -734,6 +734,10 @@ retimer_ss2_con_sbu_out: endpoint {
>   	};
>   };
>   
> +&camss {
> +	status = "okay";
> +};

Hmm.

I don't agree with this. Enabling the CAMSS node with just the TPG is of 
very low value to an end-user and doesn't "prove out" the CSIPHY, TPG 
and RDI path - which is the minimum entry point in upstream right now.

I don't support less than a sensor at minimum.

You guys must have a sensor you've used with this board ?

---
bod

