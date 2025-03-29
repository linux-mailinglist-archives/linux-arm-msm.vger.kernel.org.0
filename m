Return-Path: <linux-arm-msm+bounces-52823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF44A75683
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 14:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B31153A7A5D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 13:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663FB192B82;
	Sat, 29 Mar 2025 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ON2HE2nC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5874C2940F;
	Sat, 29 Mar 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743256479; cv=none; b=rO4ZrT25W03+yc/m4zgOckLmgaJVLNsXftztMWDkstB4jKp6sQp2sxyo6ZXrZJzRcGAAXD0tbmaxdkBaBWMWZI4T01OlA+0n1AZLJTPcENG2U7mqAWDGhH8+q6fU5W242yGNPexVKC7/xBR8b8GHBSuiQuULiwPcOcJjxHkaAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743256479; c=relaxed/simple;
	bh=4n6gakwcu0PhUp9+6uuyFcPnhmioTI0TXWmXpfOEzJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SaSZYJ3e6IU+H3GZ4taAI/+cCSfLSrT9YDrL8ElvkUKN+HnWD/kdVxrM3D8RGefC4etfyPjk0Yw/70PUFEgkhGLzPPr5r1Ydekp+mQupjZmk32/pmx9e7gWsigloci9yPA2ssQJ47Ygj33VIlUr8/49MwDWWR6PBTjDJQBluNyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ON2HE2nC; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1743256469; bh=4n6gakwcu0PhUp9+6uuyFcPnhmioTI0TXWmXpfOEzJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ON2HE2nCYM+IiKTjO32HjB4U+sgj1thCQr1MdtjDPy6MbDMUpCnfnWTCCi7UkvywA
	 pI+l6G+IGyzhGRGlEU8wc1In+MB9l7Qxx8xg2SbS68xoCOijadwCH/a3qq/61FLFcC
	 pLuXhAQgFOq+xsevEhkhovsBry3oRd6Idow5rqQk=
Message-ID: <ad132ebd-92f2-428c-95c2-d1986b5d060f@lucaweiss.eu>
Date: Sat, 29 Mar 2025 14:54:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
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
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
 <20250223-tricky-saffron-rattlesnake-aaad63@krzk-bin>
 <89cbb27e-414a-472f-8664-db5b4d37ddc1@lucaweiss.eu>
 <cf3a0429-0c36-426f-b9b0-ae7749877bf3@kernel.org>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <cf3a0429-0c36-426f-b9b0-ae7749877bf3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 2/24/25 9:16 AM, Krzysztof Kozlowski wrote:
> On 23/02/2025 16:29, Luca Weiss wrote:
>> Hi Krzysztof,
>>
>> On 23-02-2025 12:54 p.m., Krzysztof Kozlowski wrote:
>>> On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
>>>> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
>>>> Describe it and the Fairphone 3 panel from DJN using it.
>>>>
>>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>>> ---
>>>>    .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>>>>    1 file changed, 75 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
>>>> @@ -0,0 +1,75 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Himax HX83112B-based DSI display panels
>>>> +
>>>> +maintainers:
>>>> +  - Luca Weiss <luca@lucaweiss.eu>
>>>> +
>>>> +description:
>>>> +  The Himax HX83112B is a generic DSI Panel IC used to control
>>>> +  LCD panels.
>>>> +
>>>> +allOf:
>>>> +  - $ref: panel-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    contains:
>>>> +      const: djn,fairphone-fp3-panel
>>>
>>> Why no himax,hx83112b fallback?
>>
>> While this is the driver IC for this panel, I don't think there's any
>> "generic" init sequence that can successfully configure this panel, so
>> generic hx83112b driver could work I'd say.
> 
> 
> Hm, indeed usually this would mean no need for unusable fallback alone,
> but still drivers could use it for some common pieces of code. I imagine
> there could be a piece of init sequence which is generic. Or some piece
> of attributes.
> We already have examples of both approaches for panels - with generic
> fallback (himax,hx83102) and without (himax,hx83112a).
> 
> @Rob
> what is your generic advice? Which of above (himax,hx83102 vs
> himax,hx83112a) should be used, if the fallback compatible cannot be
> used alone?

I believe this thread is still pending of a resolution, based on the 
model number I've found, I made the compatible "djn,98-03057-6598b-i" 
for v2, but it's still a question whether himax,hx83112b should be part 
of the compatible.

Regards
Luca

> 
> Best regards,
> Krzysztof


