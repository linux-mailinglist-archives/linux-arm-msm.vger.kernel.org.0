Return-Path: <linux-arm-msm+bounces-94539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL0fLl0Uomk0zAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:02:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 606161BE5DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD9E83065E63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 22:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986D347A0BA;
	Fri, 27 Feb 2026 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fEUsjCDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117183A1A38
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 22:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229709; cv=none; b=mSNGUmTXsjzz8m6WNLNgDGCd7ykLD1lr/8fxf+t7ZIk0B+m0A1wQvi/s+v3pltNBP+vk9v2jDtEeb68SnWWRiZFF2v1ABokJCUQbterLy5CH7VD4k5LKwx7VflrW9mkzj0Cm8IhjivRTjsKotPC+K/xgNDqCyr7U0+aAamnDl/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229709; c=relaxed/simple;
	bh=CYiYTnwNeylMM0HbpSCJXpVAz606/Y7ZTGFMvbESAo8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gnfeqOKeCt42+1yeqB/Yf4vhlgiWJOP/x0wHITtlZvHz9O6XcbHitwca63kH9nFGaJs5r3zIFWKWBq/FhVsiQoJbPvXYWTGVmENpzDXasMFvx3yJnDJtLyp81pE/3/sK/OL8xi2X4MZ9lFTgf2Bf8Ubz7gparFkekF+hWKfm/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fEUsjCDK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483703e4b08so22368945e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229705; x=1772834505; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NEj5z+HJgfkEBXGLmrIy+Ao12OFPZ4vXhdTKA40MjjI=;
        b=fEUsjCDKdQd+A9YGjFXnYtJ91HQavAA0C5DBCIaWLTyEvM3pWBVGAmjDe+YEyscQfP
         YbolqM7YZF85dxd09M8Ym6jLAJlIPOVuKijBcf8pExpZu0ExWewsbHiH1oVVV0XTqFGQ
         FFhcXk2ldOuzIKYPo1FJEF4BU/pnkCO8uFRbPXolYOA4pyNJtjCEDFL93KuKkqGA4G4g
         YdMvqXvuDio5DqluqupVnpIoZGTurETOPQPh9zrlnM6ZRFkFUPvSBOdtiWv4VwvP6wS1
         AmcHiRHIfAiPI124JUQIT3+6Q5+dhlaxgpXPUBlzPSuga/6rlI8AEulX8thw2XQxlkxq
         uuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229705; x=1772834505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEj5z+HJgfkEBXGLmrIy+Ao12OFPZ4vXhdTKA40MjjI=;
        b=Qje6TImGAJUP4IIna0+qONR/Rze0LwwyDO7v8SOrTClzb+n+95IJLtN8FhDDs1GcOg
         OfVxsDRGds16qSbZiiwNm1qVJxLC/9BoIdOe+aZJ/ErPG/hLt8MKfV5SYHdT7YEVN/Ta
         3hoAc6A3M9wPe5aJIjCelVGxOYpX2bkawXAZMPKvC3oelo4W9dMAzfYtm3yX2XrNQmKf
         GhJ1x1YgvG20jQGpV1zJHsnBWyTyc+o8bNf7O6JPtglPk9lWp7g68g+yM96dv8fs9SZp
         lb6MdRigizRgUonWT26Z5s0/Zo5GUirFXXHRnUjGkBNNB10AR7Ss+lhCPdpnZ9ICAH14
         o9UA==
X-Gm-Message-State: AOJu0YyRPHdxGFtwnQVRz9RFKRFXCHmBMc6BNjtFeiK+TNA9xOe/az3n
	rQpEAP5fBfCA9WnuFGRCr13UNcfzsQJu2Zsq7OltpoNDsPMAokGYuMfiKtZqrExaiTU=
X-Gm-Gg: ATEYQzzcMK6Iv30cKb3iCcpPvhfjsEyrUVvGxMAExJWDEYEcCKb30LgPkNzKP0Q6I9Y
	BM6gn7QSwWEIn7VOkPqna+GvUv6llyJ7pgasGD2CkC+tXpWyqT+M3Xqd2yg+un1QQahdQxK/fS5
	tCZn4bPCWEAJvZT+lxCFzR0s4JsVkfnZkawYXhL645FVL37q88A+lUYPUKab2z219M4XPQW4uOC
	Vwi1qqMf+GGsPrDETuwrH68AkI2eOY7E0A5CqNXrA2Uxe04YDtzQMmd6R5b8Zmzh5JPUfT4Yirv
	2R1VMde0GbvEAc/+uL6cTW+h9q0mZTea3R11+uA1bBVz4cPFEqRk4rN/o/CXGg9/dieIh0yd8Mq
	199YyYS6wXW4VdYjWiEs+057synczSjR+FnOVpV2m2WZSHHkgwNd2OI114GaoGe7kdl8JkpeiWs
	OO51SGckt8Zh3F5I+XTlOoj8c3QXWEX6Yp/oF+7psWCHn45ytbUOEvSp6/jidQD2fY59eE5uUTA
	yndfLk6/ivbQdKx3uAX0Vl4Otb9jETgwW4=
X-Received: by 2002:a05:600c:34c1:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-483c993a0e3mr73455575e9.17.1772229705329;
        Fri, 27 Feb 2026 14:01:45 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb296bfsm88147225e9.0.2026.02.27.14.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:01:44 -0800 (PST)
Message-ID: <06249a9b825de30d1fc19fac873840ab3cd7f6aa.camel@linaro.org>
Subject: Re: [PATCH v8 03/18] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert
 Foss	 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 27 Feb 2026 22:01:43 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-3-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-3-95517393bcb2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94539-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 606161BE5DF
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Qualcomm CSI2 PHYs support a mode where two sensors may be attached to th=
e
> one CSIPHY.
>=20
> When we have one endpoint we may have
> - DPHY 1, 2 or 4 data lanes + 1 clock lane
> - CPHY 3 wire data lane
>=20
> When we have two endpoints this indicates the special fixed combo-mode.
> - DPHY endpoint0 =3D> 2+1 and endpoint1 =3D> 1+1 data-lane/clock-lane com=
bination.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++++++=
++++--
>  1 file changed, 65 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index ff14a8248321e..462b1355c9fb7 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -116,7 +116,8 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/ports
> =20
>      description:
> -      CSI input ports.
> +      CSI input ports. Supports either standard single sensor mode or
> +      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, cloc=
k-lane mode.
> =20
>      patternProperties:
>        "^port@[0-3]$":
> @@ -124,26 +125,86 @@ properties:
>          unevaluatedProperties: false
> =20
>          description:
> -          Input port for receiving CSI data from a CSIPHY.
> +          Input port for receiving CSI data.
> =20
>          properties:
> -          endpoint:
> +          endpoint@0:
>              $ref: video-interfaces.yaml#
>              unevaluatedProperties: false
> =20
> +            description:
> +              Endpoint for receiving a single sensor input (or first leg=
 of combo).
> +
>              properties:
>                data-lanes:
>                  minItems: 1
> -                maxItems: 4
> +                maxItems: 4 # Base max allows 4 (for D-PHY)
> +
> +              clock-lanes:
> +                maxItems: 1
> =20
>                bus-type:
>                  enum:
>                    - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>                    - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> =20
> +          endpoint@1:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            description:
> +              Endpoint for receiving the second leg of a combo sensor in=
put.
> +
> +            properties:
> +              data-lanes:
> +                maxItems: 1
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              bus-type:
> +                const: 4 # Combo is D-PHY specific
> +
>              required:
>                - data-lanes
> =20
> +        allOf:
> +          # Case 1: Combo Mode (endpoint@1 is present)
> +          # If endpoint@1 exists, we restrict endpoint@0 to 2 lanes (D-P=
HY split)
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 2
> +                      maxItems: 2
> +                    bus-type:
> +                      const: 4
> +                endpoint@1:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 1
> +                      maxItems: 1
> +                    bus-type:
> +                      const: 4
> +
> +          # Case 2: Single Mode (endpoint@1 is missing)
> +          # We explicitly allow up to 4 lanes here to cover the D-PHY us=
e case.
> +          - if:
> +              not:
> +                required:
> +                  - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 1
> +                      maxItems: 4
> +
>  required:
>    - compatible
>    - reg

