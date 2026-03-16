Return-Path: <linux-arm-msm+bounces-97877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELBnLVfNt2mDVgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:28:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 053FF296FE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F06563004D96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E4738836A;
	Mon, 16 Mar 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OoJFiU2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC98386C04
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653319; cv=none; b=EFJIKfGe+HOIJvvbxInt7f6F+1Q58EKzRv4nTelvfF3cLKwM8rtgwnZQFxkherbqO6AlcrfSSnJnP3TT4qPWwJGTHGrhiuFzWoFcmolcdfj0HD86YunEEMN9HtvZq5AexypIoQNmiTcGzSOanFN5BOkIQ+ppQAJ136HrefukDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653319; c=relaxed/simple;
	bh=9c+Cpxp1ZGW3zXQamjYhD0iRzxH3nZLhn74BuWgaiP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWKQgUA8U0BiTVzlkOqVQWfioA7SzSfRs1wI0TlhZeJlYWFBFSp2pyFN5WSTrNOtCFH5Jn27JM0H7Hmy7c7+GD+ij9ljxN3CR3ER1nVmXEAGeQWtA0QE4iAdLATKHtOiDwYtAk7QLIm4vF+P0gcn3F3el7ViO23cVUzMy+oMx54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OoJFiU2y; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a3c2261ffso2409571fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773653316; x=1774258116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q75aoBy7Ji4mItPLv1quA/8WA+tC3Zlx81nywgbhn7w=;
        b=OoJFiU2ysS8xfggD0fZWt27gi04RkJ65YpHk68DkMbrZaoY/Qe4d0sYSjP1MhnuhDq
         ZMUs/kE+WHqd6M2JJ60C/zsLWKM8Kq7Fu+WIDYUCLZe4wBeptbu5+QqC5TIWUCmRyyqb
         ZUw8CCgqvsCv+NMeR2jC+o2TTkE4m1e68b0tDeDSFotv46XgJvYW1QMKjCjgt+IdA6IY
         zjeEtoO/bqdL+t2CIFlO8WadyBAW5p6UjE1VgMtyz42nzI3eVo5+IU7jXXXgC2neEaKY
         7BzufaZ1Nxuc8gJ2NpwtpsDB0KlmqOWuutKvXMH7kAsr5iSGrW/Eonl/p5DNDtQwytnR
         05Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653316; x=1774258116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q75aoBy7Ji4mItPLv1quA/8WA+tC3Zlx81nywgbhn7w=;
        b=JF0wVQWl3sFKpEeTIyt1c3Eoreac5HHpl4lDi3mYe1nRiu4TSD87Vh7KGXNSBzLbBP
         IWy2OC4MG5ha7qXm7KfuyPz8W7FR1O0xsj/BwHN3wd0dfpSwGUIOR+Qf5/RQuiMHAgcD
         GPAO2HSfr7t0k8wpH9roRhFbccDJDhGSKScyQ20EfzBudV2VzlYd0bL8a5wshj8g582M
         h0fJOx3ia5DTVgMkgslBCBd2BwY5ZpKsGoqtE2rkI/d+sPHV+CSmofqUNZIVD6GlswKE
         h+y5jESNBDXQwSJKyj5WuNm9CIOyY6E8p5bMKxJkHoV6QkjojGgqKDqXiWxOfYt7qsJ1
         XQGg==
X-Forwarded-Encrypted: i=1; AJvYcCUOLili5kRRf/zEWli5P5CdAWencW/mqW/6b1sM/TeP8Kriwi5ErgX9AspOmbZmlvlEZHU/XjboeTY0wReK@vger.kernel.org
X-Gm-Message-State: AOJu0YwO9KOh66e9UhVfKPAtL4tIjuttsyXvedFRtvAvWgic/UAFyNH8
	ucJwRDjlQnr1/YvLBL0TE30PqhTPoZSSuyDDwEbS+3jO2oF1NNlEjODLHc/Oin1AGSQ=
X-Gm-Gg: ATEYQzwO/oT4m4ynn4NL+eJ5xQVZ0rt67pech57FrxjVlMTIXNdpqDakkwwZEtJ6Uih
	l2RkdyFLi5R17hSvXs+lHxDmJlVrDs3MPjE1cZzF5WKM0fYUv9H74U9vCmi9TqTFp9oB5RQVQH0
	mMQ5tG73AL1TO/3+rg1q3aFRrxq7A8GezXWBQx+8Q1xhruWAlHEmlDvUK/h5jGO8lzLD54YlzeF
	7LWleSfXRGzeBva6PhwT4dEgzN1ZYZ46rsWEpips3EESMdEQbuvGx89OWeNmMpzbF3pYSolDMFe
	YkPSgewwKS8/Tj942xZIEtPO9lclZvCJWYEFm37vecaUsSMUCzZVL+MrjJZyVigjLP3/k/3KVf1
	b2Pe5ZH/5dydwZ9No/u0K7aYzx/r4KSG15Uop4cWgIwyG3kU8+fjtC2hRZKh6knkAGJcjQJ/gZ5
	BIkPzQt3Yl/jguUueTGGyow2Y8Yvb5mxuDqOtWXyy88h47IDZEc8uysRgNcafLXcdxEoAyVMLTH
	PblgQ==
X-Received: by 2002:a05:651c:211a:b0:384:9158:6bcd with SMTP id 38308e7fff4ca-38a896a443dmr21270251fa.2.1773653316000;
        Mon, 16 Mar 2026 02:28:36 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm31237711fa.9.2026.03.16.02.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:28:35 -0700 (PDT)
Message-ID: <30f3ec22-c86d-4f05-b519-641fc2632c50@linaro.org>
Date: Mon, 16 Mar 2026 11:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <cca53190-ec16-40ee-ab4d-7bfbc1f082e8@linaro.org>
 <bmcxyn5bv24cmxvuyhjbbsjb2bfhq55nmoccfqxvgiwx3g44nb@xq5fsyfqdma6>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bmcxyn5bv24cmxvuyhjbbsjb2bfhq55nmoccfqxvgiwx3g44nb@xq5fsyfqdma6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97877-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 053FF296FE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 04:39, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 04:12:35AM +0200, Vladimir Zapolskiy wrote:
>> On 3/16/26 03:02, Bryan O'Donoghue wrote:
>>> Add "simple-mfd" as a second compatible string to allow child nodes
>>> within the CAMSS block to probe as individual platform devices.
>>
>> Why are there any child nodes representing platform devices?
>>
>> There is no necessity of it, please use a layout similar to CAMSS CCI
>> modelling.
>>
> 
> I'd say it differently. I think, putting CCI device outside of the CAMSS
> node is a mistake. In the hardware all those devices are a part of the
> separate block, they share the same NoC fabric, etc.
> 

A simple-mfd model could be considered and pretty often it's usage makes
great sense, but likely it's not the case here, when phys are childen of
a factual CSI decoder. So far an umbrella/container device has not been
considered to the best of my knowledge.

OTOH I see no issue in placing phandles to the same exploited resources
under multiple device tree nodes, the ultimate goal is to provide a proper
hardware description.

>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>

-- 
Best wishes,
Vladimir

