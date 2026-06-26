Return-Path: <linux-arm-msm+bounces-114657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1uYJBxB9Pmq+GwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:22:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 864546CD64D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:22:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="B/Qw5rP6";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114657-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114657-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78003303C7D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F40F3F7897;
	Fri, 26 Jun 2026 13:21:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565683F6C39
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 13:21:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480105; cv=none; b=MhK9/ryMO/pFWHNQVAsKRdAzCdLdxgXhbm/eP4GYi4eap+S44Q3G/QwQ1yKmbKZc8B2ghaAn0t+nPhLMDmdzDkHM19ot1HiOIo1ZfFVs9Vus0tfwkR3RO880gMjipMQCkWKv7el7xHcndSt84KHIMI+HN8tZiptZuSWVDyhHUf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480105; c=relaxed/simple;
	bh=pDPGZpvd3IfjOFyuEjSQA4JA6xmoXsUV/fcdGa6NUG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3Ss8Z5j3CUzYmGDOd5qshIfUXKZ555UGK3lsf+Ufw6DnnIxrlnHPXdayRXRNr3zGGU20jT3PKwPmlVTI2vFot8Ct42FWvxFyLRbxXoRke5vctx7ZdFw1ApazAHdo/4T5vadCWRTvy1vFMRx3ErxeszmmOv74f8NRMVYqrgBKXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/Qw5rP6; arc=none smtp.client-ip=209.85.208.174
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39ad8dbe947so388491fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480099; x=1783084899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=;
        b=B/Qw5rP6P9E6vM8O7H5+9+I55m+myjGt97X7hm3aQv+YJIVxJiW/ss5TV+REMIC/u9
         XeQIxLgXiPqER7xHieH8EoLAnDQHPl/a53LrSm5vvOB4NyYn++7Wc+3SRyJjCitTeE1k
         WJg5+Kh4VCWE0pVL6/LuDVQlIWZbS/ggFD4IJK0d4z9RwkGsoCNB+pHbqnPhiJWqNxZy
         CCVzYzvxZFIJ+oAWwr2I5T3nEch+GqxTu2g552VQtIBSG5qe23Mjcq7nU+7i7lQ6sBm3
         gOD30L7a6LJ8kqSxoGZWJCz6HiyLeu8XqG8BNMhy+iKjj40bTcE//+P8w6pFCubmgCq2
         P0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480099; x=1783084899;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=;
        b=gAUXsKUcFxlQDcPrP1ezf0LT8vHsTbNij7SYZTZP9enY4jlojebeEQQJPNxMXx+jxs
         lPaKHG4ybtPLJtN6aRDu3ryqqiLg1kozOMMYKAct9s6JVC6cWafwqbaoB08YziivwDTo
         JX26jOYzKMPFfvbfYkgh/fHdDI7iIWFvi7nBcHgWgco3v+qlP1Nw/8zGCN7vvpDz5U9P
         ldxIbxqOf8G5Vge6clSMtQEN1BvAJ7uZx8h9P5l5ZJrMNEyj8m68+JbhF0yQ+a/8KENK
         vGVr44Ke2HwkiwPSOgkAGrlkvcsIBEpB/WLGO1wKrwW2zpgSmIFqgXf9UCyyY4IuY1wm
         P7Bg==
X-Forwarded-Encrypted: i=1; AHgh+RrZk46dapVhs/tY52nauIuw7qGHTq++6nxLMhHLFckujbuvP4xLF3dxEqbZUlQNuQxMJw8yHdRXXQL84eRU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1dSzl/oW9aMHsLmrieAKYCFmtPWAjbh3Z6Cs2ueDdQHx7UfFK
	v2d0liiknFqyC6aP9ix+1DJokWTZVtERK1p5CbNrN1FZlaYGxqqX1Zo4SDPQvf4TWrw=
X-Gm-Gg: AfdE7cnF2YZQSEGzOziw0y+oWIlrSuaisiskckUOvfCo2TJ1roRxQwSWuYHAXQv9Yol
	DtyIxF4QIF3iNYaJT64KY1FrSUYF2LrzZno73l25AtlSQTT356ZCeTeLYNQx15Dxic5C28Ho3C9
	tLdXivQrw/3tXeWn6yQuobAEpqN3ZOyewxjg2WdIP/k5Z7VbyOqrHg5YYL9Zkx3ffp4BOG8xFJ6
	GIhtF5t17NDARoVn5OjFV8vTe0NTV9URrtHqSvSf2yushyojLqzdwbFhOhX4w6PCoBQgL8ofHuj
	jILjHZVneMTqfp4W5quwRsa8rTqSyFPyyRLJuOrglFWyEtW8AAXfObfGnZq+L4438nP3vNvKula
	r65DzvCQW3FRD7nGVJ/ItQX74QcifWF33TL54rkHKW5mpVfxOVyUR+TvIZUs0OEnnq/xsO82lcV
	exJ+1Pwc9iwgEBqVs6OFP7SE9Mo7dXjJKx1MCRfvINSNEwtb6YyDcsBnLeHbPQP599VPSgQzwHq
	Ubb0Q==
X-Received: by 2002:a05:651c:1511:b0:39a:c9d5:3c65 with SMTP id 38308e7fff4ca-39acb97be3emr7979051fa.8.1782480099479;
        Fri, 26 Jun 2026 06:21:39 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ae2613f76sm460481fa.30.2026.06.26.06.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:21:38 -0700 (PDT)
Message-ID: <2f238823-d340-4cad-b6f0-24ff86ff969b@linaro.org>
Date: Fri, 26 Jun 2026 16:21:37 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: dt-bindings: video-interface-devices: add
 video-interface-devices.h references
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114657-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org
 ,m:linux@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,ideasonboard.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 864546CD64D

On 6/26/26 15:07, Kieran Bingham wrote:
> Expand the documentation of the video-interface-devices orientation to
> reference the include/dt-bindings/media/video-interface-devices.h header
> which provides human readable defines for the orientation enum, to help
> avoid hardcoding values in dts.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index a81d2a155fe6..c9c3f4f16719 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -392,17 +392,22 @@ properties:
>         The orientation of a device (typically an image sensor or a flash LED)
>         describing its mounting position relative to the usage orientation of the
>         system where the device is installed on.
> +      See include/dt-bindings/media/video-interface-devices.h.
> +
>       $ref: /schemas/types.yaml#/definitions/uint32
>       enum:
> -        # Front. The device is mounted on the front facing side of the system. For
> -        # mobile devices such as smartphones, tablets and laptops the front side
> -        # is the user facing side.
> +        # MEDIA_ORIENTATION_FRONT
> +        # The device is mounted on the front facing side of the system. For
> +        # mobile devices such as smartphones, tablets and laptops the front
> +        # side is the user facing side.
>         - 0
> -        # Back. The device is mounted on the back side of the system, which is
> +        # MEDIA_ORIENTATION_BACK
> +        # The device is mounted on the back side of the system, which is
>           # defined as the opposite side of the front facing one.
>         - 1
> -        # External. The device is not attached directly to the system but is
> -        # attached in a way that allows it to move freely.
> +        # MEDIA_ORIENTATION_EXTERNAL
> +        # The device is not attached directly to the system but is attached in
> +        # a way that allows it to move freely.
>         - 2
>   
>   additionalProperties: true
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

