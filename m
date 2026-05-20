Return-Path: <linux-arm-msm+bounces-108736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIBJLlimDWpr1AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:17:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D458D796
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78B90308389B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47E42BD0B;
	Wed, 20 May 2026 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bfDJqHLB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEDC30C35C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278989; cv=none; b=NCHgprx5+kGGvqbEA1oqCV6E2acpgANN4FvMTHFkJ/XD6N0L6p40v4RoIGETVlRduCXRJVKjViVcx4MFjZO7I98/StRfPRspU3/rxM775ptRp6VhZYRIYE5/p9t4SGMwirYErglYfeZIcHyN1Lb8VhhengZBaaSynxvYyNztffA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278989; c=relaxed/simple;
	bh=apP4bHK9o8kKM1AATKJRJEhNmgYIjEwrlA6dPIL2hwE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qsr/ajSJnQ5nFzBJXw31Aucky7Jjf1D9Op6iFPiGVcOYz/vWDF8lbnasZj/XBcupNWgkdCgsMz6IcgCV5yKkcSbfv6eUD8DIEKPHlYIIEs/xolZO0FwHwdmoVPT7vG/C48BMVN6hORZCRmRDWFhYeC9bz5QNu43sW7VEnHv/NCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bfDJqHLB; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bcd0111ea98so722730466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779278986; x=1779883786; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0f3m0GIe6VwwygrGPUchXC8YWWLmWU3POOz3A5MK3WQ=;
        b=bfDJqHLBaUClsr6ITOpH0RLPvxZawuXlCbnb3Kdl58qw5pJnicJInvFLshHyiMNEUF
         JsGgOWUrOLznYJ8vDXG7mhahqq+RkJb4EMsVptGLvE7BLl0nzpHjck1wb767kW7ILRLp
         c2F4u5eh6niNCNVJi72NWi6rBUGA4opgoIuljbhWvelqDGGjcKLePEImc4cQQ0y3kPnZ
         6K1GQMi9hNcEfBjcmAMzb93QSLXzfj/I3JYjijOF80i46GUfWHuozx5wPbi/MUAXe4WI
         DGcQxF0pDG1R72bYp5Vm9gPSeSD39FxCYMZNQIEEhI5rqNbfL5JM2qM6mhR34KRNLqu/
         c/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278986; x=1779883786;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0f3m0GIe6VwwygrGPUchXC8YWWLmWU3POOz3A5MK3WQ=;
        b=jw6b7Ifens6akWeV9j8MncenzljwZaGA+1PEYXYI89IyTxPP+W+gUo9M17r0avdU3i
         NRf/5yNCGSySF82igsK3/Ezd7VTqjRQpdrycFcFztHDaFCTaZBmOwyW9G4DlH/iAjqTm
         C3Cg/9T/BK4LuE3fXheVCr1KllziNoydLM1hNrGY/PjgAmPi3qohFD5JSoG0nS9KgSbl
         0C6bc0bDtr+1/xPzLKXqLNAPM9dm7btSSN4kIVsby8M4LIED4VHCjhUlI05mubDtywWq
         JVsrt+A3JqDQ2+lt1k6jeLScJ4VkuEiGGytKOaGhRABLNaUfqOXGe/jkLzzSzlJhQAzV
         njZw==
X-Forwarded-Encrypted: i=1; AFNElJ88HF0cfvz8GhZ1XI5vZNySJ1qiuhrpzvS1FCm+Yscvnz5tn6f9Wd23vmzkDftag+c4QPsP+IF1rv8hGif5@vger.kernel.org
X-Gm-Message-State: AOJu0YzUsimAWzvKMrAvL5pZ5Nb1Mhg2XH7HgImoibNlKJsZU4lrgxgV
	k37BKegrV7VU/pkHr6XZUfiHopFqUh5ypRB1Wkv5w9+rH0APho0EB8ZnUODqSuzwn5g=
X-Gm-Gg: Acq92OF7kr/55s7xe0K++j5MlslCv08nfOjSLIV9kQ1/ocxjgHiRQszZ2SmV0qAGnkF
	oVJgE2m9d6zBsmEu62myUGqrIhk5C5Hd6wJ1w2skdVj8D/4cASXAClkLqENMXmLxyZorYMG2IVi
	V302DgbeTqBQJ55yAwGiFtsY0XruXdu3/san+bYHVsWICVCvLoVaSrrFetIYpAU78ISSn5wTikg
	HcX7450b54DY/oUkZdPUEc3nw22pRcGyTzwkUidRGngT8RmqI6VdUa4n9ewUked8I3lf42Nw1Mb
	1oF99ZMRWPhD5WlqyP9Y7+gh47DnskNCqdx8Qn4gLHYk81/3NOQrreLOuHSl3+iiG2AqN8y640g
	aIHAG4EmUiW4bt0NiCC/11YxrfBnvhonhDJvOEUfWsKiETCnSOaYjIGx5+VyuQviA3HLsTDktUe
	qzlV79UyoXLtoyxhKx/1SvrO3deWsSRKTzhLgA2vshQhPzXYbjSm4xn3UAPs7p2su/Xnc6
X-Received: by 2002:a17:906:eece:b0:bd8:5ef9:9b38 with SMTP id a640c23a62f3a-bd85ef9a0b5mr744077666b.33.1779278985602;
        Wed, 20 May 2026 05:09:45 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e5eef9sm836855066b.51.2026.05.20.05.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 05:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 14:09:44 +0200
Message-Id: <DINHRDC35RER.Q143U5P4ZV9O@fairphone.com>
Cc: "Hardevsinh Palaniya" <hardevsinh.palaniya@siliconsignals.io>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Elgin Perumbilly"
 <elgin.perumbilly@siliconsignals.io>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Xiaolei Wang"
 <xiaolei.wang@windriver.com>, "Walter Werner Schneider"
 <contact@schnwalter.eu>, "Kate Hsuan" <hpa@redhat.com>, "Svyatoslav Ryhel"
 <clamor95@gmail.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add imx576 sensor
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Himanshu Bhavani" <himanshu.bhavani@siliconsignals.io>,
 <sakari.ailus@linux.intel.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108736-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,ideasonboard.com,windriver.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,0.0.0.10:email,devicetree.org:url,siliconsignals.io:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4B5D458D796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Himanshu,

On Wed May 20, 2026 at 1:56 PM CEST, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
>
> Add bindings for Sony IMX576 sensor
>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>

This patch is missing your Signed-off-by I believe since you sent the
patch.

> ---
>  .../bindings/media/i2c/sony,imx576.yaml       | 111 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx5=
76.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> new file mode 100644
> index 000000000000..b74253004fae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx576.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX576 Image Sensor
> +
> +maintainers:
> +  - Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> +
> +description:
> +  IMX576 sensor is a Sony CMOS active pixel digital image sensor with an=
 active
> +  array size of 5760(H) =C3=97 4312(V). It is programmable through an I2=
C interface.
> +  Image data is transmitted through MIPI CSI-2. It supports RAW10/RAW8, =
COMP8
> +  output formats.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx576
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: INCLK clock
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply (2.8v)
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply (1.05v)
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply (1.8v)

Sony calls them vana, vdig and vif.

Regards
Luca

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active low)
> +
> +  port:
> +    description: MIPI CSI-2 transmitter port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dovdd-supply
> +  - dvdd-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera-sensor@10 {
> +            compatible =3D "sony,imx576";
> +            reg =3D <0x10>;
> +            clocks =3D <&imx576_clk>;
> +            reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply =3D <&vreg_l3p>;
> +            dovdd-supply =3D <&vreg_l6p>;
> +            dvdd-supply =3D <&vreg_32m_cam_dvdd_1p05>;
> +
> +            orientation =3D <0>;
> +            rotation =3D <90>;
> +
> +            port {
> +                cam_out: endpoint {
> +                   remote-endpoint =3D <&csiphy3_ep>;
> +                   data-lanes =3D <1 2 3 4>;
> +                   link-frequencies =3D /bits/ 64 <600000000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ff935e197c21..1b15fa355e8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24856,6 +24856,13 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:	drivers/media/i2c/imx415.c
>
> +SONY IMX576 SENSOR DRIVER
> +M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> +M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>
> --
> 2.34.1


