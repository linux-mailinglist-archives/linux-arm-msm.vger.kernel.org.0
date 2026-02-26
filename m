Return-Path: <linux-arm-msm+bounces-94265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HT3H0kXoGlifgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:50:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FA81A3BD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 529FB300CA2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978EA314D0E;
	Thu, 26 Feb 2026 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BEJsCcJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420CF314B61
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099397; cv=none; b=KdapsgURTkgIyqrYkujIeOAaBCltN5zfq7jKqRg1kveviWoH1TMS/PP4cBkm+2Mly0zrrRt8jWxufLzL4e40FHApr3a3iSuQsaCDLnQ5ifVJMKQSOrpdjJtmO0MDNi0F9MdPRvFjZgCW5JifuYF36zr3KKl6DoB0du6262A9DJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099397; c=relaxed/simple;
	bh=0VLKb0yi2wmg8HmVprc6SZDCPaIePTHOT5RF/nosdlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVsPApajnRVfg9n1yRpXIwbNHctvy91smIbqRqug6Xjd7vCVvSfo1zQsYTXfDLIxKfIpsUhPVzeitwLzwFws+AYUVxqlGeeVe/UOkv1LuFYo7cXFJ/Fv4RqLXtrJRiOWA7aI6aFxCFDXbbJsKA2da2ZQCJRxsMioOQi0DChrQxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BEJsCcJp; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4398d9a12c6so473982f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 01:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772099395; x=1772704195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ACrGoewzoYGRbbsm9o100sXJ5ajI581hmZz0uIYUic=;
        b=BEJsCcJpbn0rZefI+x0qXtlzFynEIuTfR5bpCRgJCN+JigKjtCM9Os5wi02gKWQtWC
         L3gebfx8rZssFS1V/IqZ7oKW5/d9VtwWfQIBQqWtCZdtmoWsGrqgJOYnw/wSl4nvKu9f
         PxN6pCtC6gZSI55fl+jEgX29RlzKbTl2p/KhXVM/yBJm8AaFxQ9G2r6mbz++sac2zLIU
         azsWJuAyyivWszqkek45/YHndN8plNEEwc9+XBY+5OGsDNNF/Ovs1PCVntMpNzO8RdHj
         ve8O5yVlV/oViio9Ml06FdsvCOxncmeNdEMFessAWSDQvdWjLCgrHH/CKTC5xRP+B40c
         Zv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772099395; x=1772704195;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ACrGoewzoYGRbbsm9o100sXJ5ajI581hmZz0uIYUic=;
        b=BI/9lYcubt6HNvqPbkjiic3+Mte6l4RLNAY3fy7mX2wyD8q/to+uVF2AW7Ilyx0HIt
         7ob6FDcdcXAabNm/pvzV/sMv00Qjz6c25NnHmqj8MP41wrkFAKfWECQgVGlmFOCmc/Nk
         zxqkN+kmElvG7B/VzJE50VeUSrKNFfFTW0iY3VheG6Ar653CGM2pNcj9tkiUOVFz4m8J
         AQaUcW/D+B0LllxvkqiwSBdCPPfo6j/4PByYfgIcYt0a43gUQp+FZAE+xS/1tLHEz3LZ
         IqPeld61wiW4NvAsvqAywsuSgMIZ8auzp6goBhL/ODhFs0U38N81oQcTMnQuae7It8u8
         kMcg==
X-Forwarded-Encrypted: i=1; AJvYcCVZZHLE74X50R/NIFPQ1qIGiogtO1xFpVTHC7/Q+fz5AjKsQra1dtdmpWWDghcJ2ricJMCg+xDjyGHxw5YK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz156crRKS69DFFEgQr7i/+R2zTYg91X3SVOtkApPS3FjZe9QKm
	8QkMqZTs51dbXNsEWYWrpU+Qdrhs5XaMoK6lA9YsAB2qU4lxBl5i10aCGU32CzDY0sM=
X-Gm-Gg: ATEYQzwg5Nf2aPTpxAByfK5+WEvfm6pmmZCgi7FSY0de0ZIfWorDtXkZTL+iPpy83SX
	nVsXo8kwOj5kERRW3zOCsqrRP6ntSKOWUb53MStKkUyZ92g0MFjEm5GG9eMCFbFjI4tWfTJidcS
	N+IWPBkx5bJYmdtmp+jfJxSK8JrNWUmKM8D/ZrtVfxgf94e/qwi4NPGqjisH95FyUb3CkeRkt5S
	6PMbYQVRfV8ffTTVzGa2pCZDeC8PVL9WoOO0C826vLjrD03BllZn0E0XSdNQTfLiUqr4rwBzNcC
	5LGsEFIS4Z1NlS8ch5XNNdCTGlvQFy+PK6RSqJFrJAPs026Nqb0coPeKUWxG6Sj/rySlxh/FlS3
	AT/sFUk4IlGTtBDznhp/NqWJs9OMA3V1af26EDspGjvklQTrLoMbZtxchRiYk4VCgUwp1HXUg7V
	1c8cdqJm1e6xVACNxz67mZjychcCtRk6Y8Z9oDCfKbqxmADSZD029d+smTjNxcX9p2
X-Received: by 2002:a05:6000:24c1:b0:439:5bfe:18ce with SMTP id ffacd0b85a97d-4396f15ccdemr36782242f8f.8.1772099394691;
        Thu, 26 Feb 2026 01:49:54 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439927c3e01sm8948031f8f.11.2026.02.26.01.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 01:49:54 -0800 (PST)
Message-ID: <5e595b6f-ec3b-43d9-9963-f4b594f93b86@linaro.org>
Date: Thu, 26 Feb 2026 09:49:49 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/18] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-1-95517393bcb2@linaro.org>
 <6JLP5a_yJmhmmwSmtFoMmzlT3Gh5yhHVpVSRTqDb93I2_KFB6-p_6mKmGKaqtStt2bbVPqQ16j0Sfp2Z-LvhlQ==@protonmail.internalid>
 <20260226-resourceful-pelican-of-defense-437c7e@quoll>
 <13853dc8-1a54-4cfd-b801-f23d88be4a88@kernel.org>
 <5QUAno5rJaSIXrCTC1Y9QJOrrx2Pt1GGVJspvhutMHgSh6mcu5S6gsZHu3lOEVXjG7pqSyJjH6RB1wXRszZ-Mg==@protonmail.internalid>
 <860cb545-8283-4f2b-9f21-19d207ed7da3@kernel.org>
 <f9242e8f-95bc-4b2b-9b7d-2ad80bea1e46@kernel.org>
 <df38ac48-a472-4f0d-84c0-1f108aa13229@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <df38ac48-a472-4f0d-84c0-1f108aa13229@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94265-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 12FA81A3BD7
X-Rspamd-Action: no action

On 26/02/2026 09:38, Krzysztof Kozlowski wrote:
> I just told you - there is actual mainline user in v6.16 - so whatever
> you claim here is incorrect in first assumption.

I thought we had discussed @ Amsterdam or perhaps Tokyo that if you 
could show there was no external user - i.e. prove no dependency then 
you could change the YAML ?

Specifically check u-boot, FreeBSD etc.

---
bod

