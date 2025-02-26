Return-Path: <linux-arm-msm+bounces-49564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B8A46E62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 23:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5DB71888CAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 22:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648D425BAD6;
	Wed, 26 Feb 2025 22:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="CqdwBf3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E5A25BACE;
	Wed, 26 Feb 2025 22:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608335; cv=none; b=CUJ/9v1ie62wOUcDxK/oio0Ul6rl12ldIljtDVjlybc4sxD63EAw//9G+865CoMKIIkuUIY7FQlRqm8p3R3U0DDq72D0Bn/RcsdiT/m8/jGwAlcYJaQF5l0G1h2GJNHLJ0rzE0BENrBnpf0Og7sB9HBSlvAeAGyrmXCzlY+6P5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608335; c=relaxed/simple;
	bh=6+ds0fDE230uGEJmCn7EW1JKMdx4MNGD35GrH5IvopU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIwAFWmQH4oHXjeVp4SDeJmPcwQniCNJ+OzjnasJV6KMUE8kQ9TMyL5BqRKmsle6D/T1xlqsyHsRk1PtFo4GgrTYuB8JWARA0EX2ehpmMTWiXVSR/rmUuJs24ZfhuacUb1jnUUJt5lM3AtgSAC55DotSVVNREyQ69HTTq2q4D6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=CqdwBf3U; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740608325; bh=6+ds0fDE230uGEJmCn7EW1JKMdx4MNGD35GrH5IvopU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CqdwBf3UB1FYG6uHtww+aGb8/5OdgV02krxsyJZcuVQLjOzTnKnYfOuYkR1VXs7Ct
	 fZDxUrIVkjl1mUzDYTvsB8Oc6I6Ys5P/i3jX4tU8q/vCgDR4RMaJZmxmSGWlbGYbZh
	 BAiGNnPn9VpMhKhVsPuNO2/BjwTi3BESUE8Bfd8o=
Message-ID: <ebb3d366-05a2-4ae8-9b50-4b6a76d108a0@lucaweiss.eu>
Date: Wed, 26 Feb 2025 23:18:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] dt-bindings: display: panel: Add Himax HX83112B
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-2-0b1f05915fae@lucaweiss.eu>
 <20250226-speedy-dark-mushroom-5d7c4b@krzk-bin>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250226-speedy-dark-mushroom-5d7c4b@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-02-2025 8:46 a.m., Krzysztof Kozlowski wrote:
> On Tue, Feb 25, 2025 at 10:14:30PM +0100, Luca Weiss wrote:
>> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
>> Describe it and the Fairphone 3 panel (98-03057-6598B-I) from DJN using
>> it.
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>
> 
> Discussion is still going. Sending v2 after two days is hiding that
> previous talk, so that makes me sad.
> 
> I am still at v1 and I am not going to review this one here.

Sorry about that. I'm going to be away/not have time for kernel dev for 
the next ~1.5 weeks so I thought I'd send v2 with the updated compatible 
string already.

Regards
Luca

> 
> Best regards,
> Krzysztof
> 


