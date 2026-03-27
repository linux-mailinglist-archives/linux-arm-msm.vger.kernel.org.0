Return-Path: <linux-arm-msm+bounces-100349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ3GMYaWxmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:39:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A15346362
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81CD0302B828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9193F7E9D;
	Fri, 27 Mar 2026 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+YDmp8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C7E3F7E99
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622299; cv=none; b=h603DXQR03K0WfJfhRhjwCQ2kAkwuT6X9tZePc87sxlqQxzcW/71Jr6JS32hJfhKX9ZPEVUDwla/JAs7Q2rxcO1/4oYvwiMup9kAo6fFYpOU90Ygwjng8QH05a/r3LkP3drp4hSjfB66eKMqFFH6EpDnu0CA/B6+AA+10Cws98E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622299; c=relaxed/simple;
	bh=cJvQjfP9254ZxGBTE+ZydM3eM349poCVeRdu7qw4XpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HeTsDNaLWowuOa9AVxTq1CFdcpmlcf3dNsBdYwnw3dBRmLStpRoTOpgK6zYg6ewdMg+Am4td38YhccUEp1nyhMftlJpqscFuONZ5mOQnq6jcS/PTkwshBym55co7mnSX07moHozFhY9Jlgh16J+nEzd+7XeBIkWp9tJahkinRKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+YDmp8B; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b9b190easo1538475f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774622294; x=1775227094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0Jo0aFxcF9Ybb4MoHJTFDiEvjw/5Yz1myZV3Vc0n1c=;
        b=E+YDmp8BHGANo7DY3weMTDKZSpEWWcjnKwl/quOmHP9lgiWEJ0amXyhfR6JQnv5ANJ
         r7519bnU2pw77pkZQ93qC/lz3p9q6RzKHz+NSlEfe+IbICpkL9Ut9bwHuifCYeijVdJR
         QvoXA6uVAS2bhG2TqbBBAkOLq2L8iTvsVAGmkBcTTRJBJnnAt6WtE3RMze1iiKyS3Zoi
         cE3dtNuDW6812Gn+oQKLnQ67zQPPo645trDxihBFIOp9BqhfKfCWgZq73Jb8QLSJpS8p
         7Y0e86pAccV/v3hzmqgxbJB9o+EYaJk8zk3YEye2lYVDT0ilZdReVW8wjIFO6/lnJrrE
         HHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774622294; x=1775227094;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0Jo0aFxcF9Ybb4MoHJTFDiEvjw/5Yz1myZV3Vc0n1c=;
        b=KZaY/OaUko2V8CJxLFulPNdCjObmR7OkH1DyMpLT1twyOLlv7HLWYwGxfpXnoGa9xU
         DrPLvZJ0+P//UZb1/uhxrJxISzL+W0iy3lwdRg9teg+Y8xzFYrLDUh6tQsNqaEp5JmVW
         L3B8lgsFn3w+gUM1ZHR9cUaYqT3h4MeOHcrbT8weCrOckXTGqrC71l84gWf8SX2ggeq9
         z8pcJ88giCFdyOHQmOtMDiI7uB3Ex+WNqcBVLfz55/VdqiA23VBdv11N/Jpsa1r9i2Ea
         xbAvJtGj5dJ6rnp3x2fo5n2UOyhyjoVWfxemje4lxoCc41UiV++5ayJNTYChTI4tybF0
         5Org==
X-Forwarded-Encrypted: i=1; AJvYcCVueoOYdpSlpGH238ERBdY4yxP9fGDDvd2odBnS/D8GDbqG+w+zcH2B1JtNgxO5ck9O0YtG44m+VRKUu0aA@vger.kernel.org
X-Gm-Message-State: AOJu0YzhJZC8lgstEn2187Ccia8So9PY6wdudzpT5MIEjMhpCT0GtLLJ
	6pObeoS2rkiZJPyIQsUkn+val5wxTS0gnJyZH6MLdiF26Q0YuYbn0/wdBcCHy30A5HI=
X-Gm-Gg: ATEYQzwzpRq6eySdk1uCAbCZHnh1tXlvFqte+cVcDSGs9L1jzhKgR9AiW6zB7iggKXw
	kIfZt2or9LZ2PvzonY7W6qZn11RTUty9m2B8+BQlVB5nXo5yumuBud9r0AGL3Ff8Y93VhAdjkYm
	mpa5F1VznEWtq7I7gmVxG7VfO7tBb57lXzOMv/4NUdz1GJRK+amwPnbxZH+Plq9vy7d1eMe+WBn
	7aMfOA0Re+DgfO1MyAcEiTohH+ev0gf7SgUCunbj6L+5UXh95XYh0Z6ADmjykEzEconUEKXKvP5
	tTKKCWi8gMFFz2QBNebZoEB3638LpSpqZmEKggYB+S2ZRHc3tmfKqIoyZ/+woO77/azI8KV5g/f
	phnaGmZRR0koiXhsQB6lROg2hKHaCfS2NS+fDNV0Y7iihT5O2sJ1IMfuHRS1KN/nOzLKlyjM4ZD
	5JTQ5dWXI+Q5KHlMZ0qHWor1eAvThoeUYx5KHM
X-Received: by 2002:a05:6000:1ac8:b0:43b:8858:1146 with SMTP id ffacd0b85a97d-43b9e9fad6dmr4533166f8f.41.1774622294053;
        Fri, 27 Mar 2026 07:38:14 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.214.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm16761200f8f.27.2026.03.27.07.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 07:38:13 -0700 (PDT)
Message-ID: <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
Date: Fri, 27 Mar 2026 14:38:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100349-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 50A15346362
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 10:07, Konrad Dybcio wrote:
> On 3/26/26 2:04 AM, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>> PHY devices.
>>
>> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
>> capture those modes as:
>>
>> - PHY_QCOM_CSI2_MODE_DPHY
>> - PHY_QCOM_CSI2_MODE_CPHY
>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> Does the_PHY_ DT node need to be aware about this upfront?

Yeah that's a fair question.

The standard model is to pass the mode via binding right now. You 
_could_ configure it @ run time in principle.

And you could even conceive of a sensor hardware that might find value 
in that - but IMO it's a 100% hypothetical use-case - you'd basically 
need an FPGA that could output CPHY, DPHY or for some reason SPLIT_MODE 
DPHY.

But that's a pretty off the wall use-case to hypothesize. Split-mode 
OTOH is a board-level physical reality which => a DT description not a 
runtime choice.

> If we have some sideband signal (e.g. the sensor driver specifically
> requesting C-PHY mode), we can simply throw all this complexity into
> phy_mode + phy_configure_opts, all at runtime

Like I say its conceivable but IMO not a real thing and unless your 
sensor is an FPGA not possible to support in real hardware.

> Further, the combo/split mode may possibly be selected through
> aggregation of requests.
> 
> The question remains whether the sensor should have a direct connection to
> the PHY itself (i.e. phys = <&csiphyN> or of_graph straight into the PHY)
> or whether it's going to be translated by the camss node (which would be
> the one holding a PHY reference) - there's probably surface for adding such
> negotiation logic in both places

To be frankly honest you can make an argument for it either way. However 
my honestly held position is analysing other upstream implementations 
connecting to the PHY means we can't make the PHY device a drivers/phy 
device - it would have to be a V4L2 device and then for me the question 
is why is that even required ?

The model we have right now, right or wrong is sensor endpoint to 
controller. Similarly the <&phy MODE_GOES_HERE> is a pattern Rob Herring 
suggested and IMO is a consistent pattern we should aim for upstream. We 
see it in latest Rockchip, Cadence.


> Note this is a question and I'm not aware of all the possible combinations
> 
> Konrad


