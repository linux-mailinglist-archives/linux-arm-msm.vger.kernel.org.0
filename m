Return-Path: <linux-arm-msm+bounces-108443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHPvOQg/DGqqawUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:44:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 952B857CB05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0872D30A5A2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34532233955;
	Tue, 19 May 2026 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXSF9Nqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F6015A85A;
	Tue, 19 May 2026 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186769; cv=none; b=fPPV+GmXGMUQSmgdVZVl9d9mTGG0OSpg2aftcx6yWBkd9bPSYhJAaSUKeTf9qN2B8ptRxzXHS/DE+HePpxXAB3xb/zIAy76lNSh/alcPAbK7HHfGza0IE43R7wT8Movgt7Du3SDIENraP0fF4ns/yUC6eaZAb8laAjvZZueO3Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186769; c=relaxed/simple;
	bh=jSyJNicMC5VYbDSkFlXbaNoXQqirR+ROzcl62pQ/Qgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqrCD11te2z0g7sAvmtL9TjgAlxLpwTgnbmrhJVMzcaiJ7jotgAKHeMzQiY8HoEsCJnJ1dVr1wwNSjE/0VQShuXsytLS7lBQoD2Rm8B6dWEvy14KN2RTrDE2z0oFl/Bv13egDluwBhr5FtecZXtTeeJFnKzu82gs+gpgBExqfGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXSF9Nqv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D53C2BCB3;
	Tue, 19 May 2026 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779186768;
	bh=jSyJNicMC5VYbDSkFlXbaNoXQqirR+ROzcl62pQ/Qgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXSF9NqvfHsj1gioynRfekK/yxQutw6jAnWaxblyYMTSys/OFXrvCcyjjwsybtwrw
	 94qM3/X6+AltqdtJU9TUktoS4Fy9BYDZNGmafkamyL1mRhVZZFh7VzDf21lXSAlBy7
	 75pDLOgbKgztrBMugPA/GAQMfBYgNr6CMifgZrZ7StWWZCba//3kfdeFWkOvkaiJBN
	 y28sufZvQ7qCf3WeKS4m6uzd5Kzbs0gqtSmOYKupsxOpgmC00qku1PJRxLbOK2umx/
	 z0mugUBdGJBd0cRpXE7ZPg0VQTO2kQf8ZEFUpBukOKwXGigDZeTVL1f3QuQ3yYRvH5
	 mlu9amSEA5ERA==
Date: Tue, 19 May 2026 12:32:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <20260519-curly-courageous-sturgeon-2facfe@quoll>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108443-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gitlab.freedesktop.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: 952B857CB05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> 
> The panel requires a reset GPIO, backlight enable GPIO, I/O voltage

If panel requires it, so should the binding.

...

> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios: true
> +
> +  backlight-en-gpios:
> +    description: Backlight enable GPIO (active high)

What is the name of the pin in ili7807s device?

> +
> +  vddi-supply:
> +    description: I/O voltage supply (1.8V)
> +
> +  avdd-supply:
> +    description: Positive LCD bias supply (AVDD), typically +5.5V
> +      (range 4.5V to 6.3V)
> +
> +  avee-supply:
> +    description: Negative LCD bias supply (AVEE), typically -5.5V
> +      (range -6.3V to -4.5V)
> +
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vddi-supply
> +  - avdd-supply
> +  - avee-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "dlc,dlc0697", "ilitek,ili7807s";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +            backlight-en-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +
> +            vddi-supply = <&pm4125_l15>;
> +            avdd-supply = <&avdd>;
> +            avee-supply = <&avee>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26060e51c067..529aed669401 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7941,6 +7941,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
>  F:	drivers/gpu/drm/bridge/chipone-icn6211.c
>  
> +DRM DRIVER FOR ILITEK ILI7807S DSI PANEL
> +M:	Arpit Saini <arpit.saini@oss.qualcomm.com>
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Drop, unless you handle patches for this driver.

> +F:	Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> +F:	drivers/gpu/drm/panel/panel-ilitek-ili7807s.c

Drop, no such file at this point.

Best regards,
Krzysztof


