Return-Path: <linux-arm-msm+bounces-49064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 991ECA40F70
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 16:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E83FC3B67F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 15:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4C520A5E5;
	Sun, 23 Feb 2025 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="dla8E8dk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF326AF3;
	Sun, 23 Feb 2025 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740324568; cv=none; b=hyQueAA2eTP3tyzXVZcmyiumfPabBpImpjU5sxWnXaBMH2DbwFc95s4AxChL1zQWAc8hCdtQBw7JLzfeAt1dxZwqWfx1FdxkdDGwfnJZe0wj6/4//hS2YnQIGVCfLwTzF4T6OxUTuWRR/Bhz0+dRo6t6bUn+uF3uY1KVq3fmYfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740324568; c=relaxed/simple;
	bh=hN7DZ9oLfkraNLNI5u4MTj4WoyJjFliLGCQi+3yJ2kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fp/YXzXW4BZ16A3E6aa9rFf0LTVLeM0eocsrG3Bv+R5/KeIQMWqiFdSULL04MD3lPha959nPPzXZVd+DwNqaPP1M5CF7DgsgqqKDpmXMQl7ibutT/3+rHyEdSZMnXuXW7eLfz20ObbUF4/nmAgAkFELo0KKC/jyQWzTc7RIMPyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=dla8E8dk; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740324557; bh=hN7DZ9oLfkraNLNI5u4MTj4WoyJjFliLGCQi+3yJ2kc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dla8E8dkJPoZDFQlxhvpcCJvubg+X44jV2yRz9wQ267cH9CqTMsMT/UTyKLQGm25t
	 eW8zwFE7QkVVpZ0d06dMd4Ty6sg+CvHQbINoQJ5ELCFD4ftaaLMx08WWqYwVlyi6RD
	 YRPMxtazghT9NvVxiViyHjE6dlCppgtE4ErlsMU4=
Message-ID: <89cbb27e-414a-472f-8664-db5b4d37ddc1@lucaweiss.eu>
Date: Sun, 23 Feb 2025 16:29:16 +0100
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
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250223-tricky-saffron-rattlesnake-aaad63@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 23-02-2025 12:54 p.m., Krzysztof Kozlowski wrote:
> On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
>> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
>> Describe it and the Fairphone 3 panel from DJN using it.
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Himax HX83112B-based DSI display panels
>> +
>> +maintainers:
>> +  - Luca Weiss <luca@lucaweiss.eu>
>> +
>> +description:
>> +  The Himax HX83112B is a generic DSI Panel IC used to control
>> +  LCD panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: djn,fairphone-fp3-panel
> 
> Why no himax,hx83112b fallback?

While this is the driver IC for this panel, I don't think there's any 
"generic" init sequence that can successfully configure this panel, so 
generic hx83112b driver could work I'd say.

Regards
Luca

> 
> Best regards,
> Krzysztof
> 


