Return-Path: <linux-arm-msm+bounces-92157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4gnBGlloiGn+pAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 11:41:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A829C108652
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 11:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D623E300874F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 10:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7595F346797;
	Sun,  8 Feb 2026 10:41:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3535520DE3
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770547286; cv=none; b=ALHwrGNUNBH+QkMQoGLBLeYetFqsTBzckS6ELeMHEQMyrSfp0Pe6F6o3rTu90oLhSLC0wOiTcm2LUVIGQpuVj97RiovNRsMuK3EvpRpYy67uK19ZAAR7QXjA7dn4Ca783hmWfPUc4SumYlKGrl8ACuDw3TRiRafmorsbpnCvQU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770547286; c=relaxed/simple;
	bh=aZZzfxoP/OAR63tqh89B9La0YY1hyXKXoHsZ/sLOQ6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvXyxnmI/7uy/MIptqP0QWBg/dePahQmNT+30ZrUKCGhkxvhTU/WzyQzvuyGXJZA7DTeSdfR4G3vuTtqPC5IZ+B+t0jCi/K/iWj/xfPKp87qvlw8rWLl2Hnj211L8Rh6Gbb2y8NCKfCAGFMAbMtTAofLzNhkt0skym9spQaQn7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b785801c93so5493415eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 02:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770547285; x=1771152085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=haeg3n1GXO743Ijog6kKrEyqSkcsBt7foGPftVqFxYs=;
        b=BX/bGjxQCqSSKpGy7plJK6LxfuL0GOwzZD3XB06ThIFQkozz4QjumzWzj3Kym6SDJR
         XRh6Yd87ghRb34yn8JO03TvGV2rIXUw8YBK98oTAeK2s8bqi/97wwI6ljcqP9ZFBklMM
         0IpYHl6yk9Reg7xIvfBA0q3vmBIooBgcAjmYJvTsAAgq7a58fSw866kVDvw9nD5FGVOw
         0bt640zyXGg3Jl70Ka/09v5QRO/STccbk3gz4kvb4WS0+JxSUiccTJueAAU4o6IX8RVa
         85vfiV7ffKO8oKwhSeJmx2VrxSTkVrlTduEOOl66klSkn6vAUWimLYuZpwcLnbofV9Wn
         ZWhA==
X-Forwarded-Encrypted: i=1; AJvYcCUSEtPfyw9JkVrmCOrVVtnll5FVBSuzMfw/yo1BYqyIGlOm3X/LGFoaF9rJPaTGC28rv7mAPM3JJOoTRTwZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3GoKf65473ujL5FMKzcKSxyKQa808I7S+PfIQ+P0kOFE88iM4
	3BJtxsDGonGC2RCtiuaqJ3Y0S00fbUoIF839W1ArQQDcCAfE7HLu6VnBUiOrzA==
X-Gm-Gg: AZuq6aK1YhDsWk6MOjaDmvU87baeZhX1Z9XeVktmGlSqRTo835pW5iDw+efBLDmK2It
	qo6bn0vU4qzKtbsmbudhZA4Fcr9vuDCbFUQM6zgaiiD9glzAEC81sskMeJ2dCsrP23M+n6t41wg
	cAAjcNs7y9GKCJ5jSoHTr0Ec8KhM7GpxBD2W9XeC+t14nGVcs0LwXiIAuOLAeW9CQJ6DFVvN+Qt
	x7sgYFNQXzUsJM1FBip6/rSRFukyNJ7+/0e1M9NBWaeR3uYzcPVQsKqyDCPo+Faw4tnLlichg9Q
	VWgSKW+vxfVuJQGtJjnCeHguaBbNgz9d1Sq+Y8F+22DKk7WE+FddtsrEeP+yBbrO/5DVaSShy0c
	MNWjv9yRE60cw8Wyo77RjVvVzkpC0mLOe5tUDv/g373M7N9LXXICVY6enhWzr6EeduYqdKMWjRf
	0P/3TANRLfXnkMFE7rQDrIaz+D3FqfbjG7l1XJWn6hgD1n1A==
X-Received: by 2002:a05:6870:3d8c:b0:3f9:f6ca:738b with SMTP id 586e51a60fabf-40a96dc6fc3mr4184430fac.19.1770540674441;
        Sun, 08 Feb 2026 00:51:14 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40a99355b7fsm5269406fac.8.2026.02.08.00.51.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 00:51:14 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45c7c841904so1444881b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 00:51:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVn75ziAo2BeWlibqZyPkJADsDy+UdDc4zoVRRGX5xbKcLm3iA7idwss/DJ5PdkK5nuSXUX5oygDlgdV30G@vger.kernel.org
X-Received: by 2002:a05:690e:4192:b0:64a:d1bd:8c65 with SMTP id
 956f58d0204a3-64ad1bd9100mr3953663d50.95.1770540244041; Sun, 08 Feb 2026
 00:44:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
In-Reply-To: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
From: Roger Shimizu <rosh@debian.org>
Date: Sun, 8 Feb 2026 00:43:52 -0800
X-Gmail-Original-Message-ID: <CAEQ9gE=9xV7i3afybmWvE+W9aLgYWSo1X=gC4cWRMkTJYBLo3A@mail.gmail.com>
X-Gm-Features: AZwV_QhVsL319mpFfmBVf16B05oxLi4h6s2zjEvcVQi8QHoXqqVnbGWDOb-EoSo
Message-ID: <CAEQ9gE=9xV7i3afybmWvE+W9aLgYWSo1X=gC4cWRMkTJYBLo3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add DSI Port B input support for LT9611 HDMI bridge
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Christopher Obbard <christopher.obbard@linaro.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92157-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.935];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,0.0.0.0:email,msgid.link:url,0.0.0.1:email]
X-Rspamd-Queue-Id: A829C108652
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 11:33=E2=80=AFPM Hongyang Zhao
<hongyang.zhao@thundersoft.com> wrote:
>
> The LT9611 HDMI bridge has two DSI input ports (Port A and Port B).
> The current driver only supports Port A or dual-port (A+B) mode, but
> some boards like RubikPi3 connect DSI to Port B only.
>
> This series adds support for using DSI Port B as the input source by
> utilizing the existing ports mechanism in devicetree:
>
> - port@0 corresponds to LT9611 DSI Port A input
> - port@1 corresponds to LT9611 DSI Port B input
>
> The driver detects which ports are populated and configures the hardware
> accordingly. When only port@1 is present, it configures port swap
> (register 0x8303 bit 6) and byte_clk source (register 0x8250 bit 3:2)
> for Port B operation.
>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
> Changes in v3:
> - v2 incorporates significant changes based on Neil's review of v1,
>   so remove Roger=E2=80=99s Reviewed-by tag from the v2 commit message.
> - Link to v2: https://patch.msgid.link/20260128-rubikpi-next-20260116-v2-=
0-ba51ce8d2bd2@thundersoft.com
>
> Changes in v2:
> - Use ports mechanism instead of boolean property
> - port@0 corresponds to LT9611 Port A, port@1 to Port B
> - Driver detects which port is populated and configures accordingly
> - Link to v1: https://lore.kernel.org/r/20260127-rubikpi-next-20260116-v1=
-0-0286c75150c5@thundersoft.com
>
> ---
> Hongyang Zhao (3):
>       dt-bindings: display: lt9611: Support single Port B input
>       drm/bridge: lt9611: Add support for single Port B input
>       arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI Port B
>
>  .../bindings/display/bridge/lontium,lt9611.yaml    | 15 +++++--
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  8 ++--
>  drivers/gpu/drm/bridge/lontium-lt9611.c            | 46 +++++++++++++++-=
------
>  3 files changed, 47 insertions(+), 22 deletions(-)
> ---
> base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
> change-id: 20260127-rubikpi-next-20260116-99c1dbea50e4

Reviewed-by: Roger Shimizu <rosh@debian.org>
Tested-by: Roger Shimizu <rosh@debian.org>

-Roger

