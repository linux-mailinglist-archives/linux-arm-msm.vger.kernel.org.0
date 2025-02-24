Return-Path: <linux-arm-msm+bounces-49202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC4DA42E23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 21:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B565D177D85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 20:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C573245021;
	Mon, 24 Feb 2025 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="vitKRRCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76030245006;
	Mon, 24 Feb 2025 20:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740429635; cv=none; b=cotJhuvR7Wa8ymcqre2JQpYwnUsa7VGbAhwnjJzufs9/B3bkRDiqci6DCZ9szgcUaq8RR43XGax6L38auk24F/Kqf0KmdepDaRM/gqobl9XxggJifmIFit41ceBI5MuHHixzZ1sbldK1jdDY5yRkJAJdn8/NfS/PhmtM3/2SAmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740429635; c=relaxed/simple;
	bh=YCBdJbUx0eezkgiS7e5oa20MNmUQMvngyjUjEqpjLTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLeLhnQAyHGtnlXUgOntUu5Bfj3I+RuhHsICyQRpg8jeWcaqM2bhcDIx7jcHMDGfLUioYWdL0UsPQipKvRI7pj5Me76DQ/5crHfREFsuh9KQTvguhlLEXVYk1s/VGjgw5SQ/5FwAQCXz/UI3mZjxbLdCxXB0hCG41t8AypnKLDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=vitKRRCT; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740429624; bh=YCBdJbUx0eezkgiS7e5oa20MNmUQMvngyjUjEqpjLTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=vitKRRCT0FDO+MFCpM+oNGOuuzlj4/oKKiebkE8stMHaxMzf27bAxxqur33AcvwDI
	 jc8GJxIppGPasCEOD/Poo5P0RmXlMxZ+GB2EMrSDEOeG41CiydyeaUxipL0012T3rz
	 hweWP6i1Qg6AYnNs2JH26YtOcVVIXuoO1tAnzHtQ=
Message-ID: <8b67cea3-82f7-47f8-b026-fd26cfbf94b4@lucaweiss.eu>
Date: Mon, 24 Feb 2025 21:40:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <77wat26ggsfqwssgt5wfq6yz6w3ccqz3pmn727a4aphqv4ljhx@vrzneg2rvzfj>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <77wat26ggsfqwssgt5wfq6yz6w3ccqz3pmn727a4aphqv4ljhx@vrzneg2rvzfj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-02-2025 7:25 p.m., Dmitry Baryshkov wrote:
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
> Would you know a better name or ID for a panel?

Initially no, as mentioned on the cover letter.

But I dug a bit more in some other documents and found this number now: 
"98-03057-6598B-I"

This also somewhat matches the format of the Fairphone 4 panel from DJN: 
("djn,9a-3r063-1102b").

So I'll change the compatible to "djn,98-03057-6598b-i" in the next 
revision.

Regards
Luca

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  iovcc-supply:
>> +    description: I/O voltage rail
>> +
>> +  vsn-supply:
>> +    description: Positive source voltage rail
>> +
>> +  vsp-supply:
>> +    description: Negative source voltage rail
>> +
>> +  port: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
>> +  - iovcc-supply
>> +  - vsn-supply
>> +  - vsp-supply
>> +  - port
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    dsi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        panel@0 {
>> +            compatible = "djn,fairphone-fp3-panel";
>> +            reg = <0>;
>> +
>> +            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
>> +
>> +            iovcc-supply = <&pm8953_l6>;
>> +            vsn-supply = <&pmi632_lcdb_ncp>;
>> +            vsp-supply = <&pmi632_lcdb_ldo>;
>> +
>> +            port {
>> +                panel_in_0: endpoint {
>> +                    remote-endpoint = <&dsi0_out>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
>>
>> -- 
>> 2.48.1
>>
> 


