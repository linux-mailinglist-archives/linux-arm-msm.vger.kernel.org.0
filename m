Return-Path: <linux-arm-msm+bounces-111273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pIjjMQHtIWp+QgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 23:24:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 495E764396B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 23:24:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=OKHDnqq0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111273-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111273-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 945E5304A7B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 21:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCF93FE342;
	Thu,  4 Jun 2026 21:23:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044AA3C3791
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 21:23:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608229; cv=none; b=Q5Cl6zhAqBl2U0BlNOG6x5g9SqBHgnEwwjEIHQwo2/wAqRCqoZg2qBqiGZ3MgRxqwdf2B1PKYEwJHhz+G5hXlGEAesimdodie27j6OUAINXiv5upyVmcX8tWZjub3ilpOv5S5eJplywyDXahToAYfbkKRPJAvMd8d3TgeWX+GpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608229; c=relaxed/simple;
	bh=56DCBwbBpEWN7ab0NGz3+vg6p3n+Q+puRjJ0XIHeC9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxDl8cxwfPNYWRI/nLY9t8EIsDyfoEhBF7KGOQFgVKNEdUSmGYmMEJXpsEbX2egAY0zsG4CiAC4/ppPhy8tUVQlXqG4s8XxRmcPbelR+I0JCF/fUfFFhZCXo8gZgS3fLc3GDWjHEpdAHCKn8r9Tq993KfPLIRtyYckyqJKqf28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OKHDnqq0; arc=none smtp.client-ip=209.85.221.179
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5a46be4862fso327699e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 14:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780608227; x=1781213027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ywNOCiZbOBaXvTwi0yahMBNcZD2OXLAw/3rJV8izSk=;
        b=OKHDnqq0vXErq0ABZ2lfHKXI0mnzwOxzgYZqTjRwXDWz3Lhv7VQqwk/3m9WPAFDinp
         MTf1qblSF8eseZ+9do8bKmwqCR50hTKnV6l/vGfFmMM7R2ktOJSHYIZXMWdVkN12eKY/
         J/B8Kno6TaiEk7URUHOe4TiepdUD45LEvP1DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780608227; x=1781213027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ywNOCiZbOBaXvTwi0yahMBNcZD2OXLAw/3rJV8izSk=;
        b=dJAGfFgO12MTsXBIeFNMERfL3qfTWVNP6XMuSLQ8KadL9m2eYwkkoEcDqIcETprVXh
         3tSVqtq3y0BkXixrJRNGOeMZDQfHApGe44H8CVz2tUJsx8HR9X455JCK48zTNf28afI+
         yMFsBgRY/tnlDU4FXFvHQZX4Bh0rq7AkY/DU3R289bS4ZtH2oKzQvhweG/kRACsay5ja
         CcmV4JCBZM3yo6DEGmQXoZPdJSgOtCkqDGAOhnjtSmQnI2oCLzLXSFgrpc/+NLXL0xpO
         x0xyXCK4l89nMx9Hd2iuD9mm2aLdMkuHCfzVJsRXG7iL99mYr32n/1sL4gDhXJiInzx9
         hTTw==
X-Forwarded-Encrypted: i=1; AFNElJ/BkvaiuFJkWMee0HT/JD51D/xK2hZT1J6rQI8PWJcU6wnZ0THe85NsKtquXuh92B6q5PoSu7kUwt5ii1I0@vger.kernel.org
X-Gm-Message-State: AOJu0YxCG3j4x8h2tOPRpDhSFnyvYFoWys7Hl0mNCb56fICsMPPLjoPh
	oAwB0p0RDVav6mU5wWTF2J6LMnHlePon8lGGl5PY7Ac4HLIrynlWZSTGRoLdA0jsby3MsVb/bjo
	nQRg=
X-Gm-Gg: Acq92OEvAG7NChwRYkRSwKk/1B16Tlq3Tvf2aN7gj5HDit01nvhQgOcPt7mIEw4jtrj
	vboeiI8GwryIuqQ7SmT0Ny96OmQmgciSrCtlEZ654iY7iVtmfyrrRErn6CXgFVeVWW3KpbkYPoP
	BXgLDyRPAEMtavkpbhGG7vCo4FUCxieBSHUuqeCNEmfaHiPKuBvXCiFHdLgd+Yhl7uEJJGM5+KD
	tNAHjtmWTLLiKSeTU6xhXO+Uffjc3FIIsdyNWItVtjGAhboAQZGZCMA7UmP7RE0buni0Dk2iFvB
	lEUk+KjwIRkJueNRsyH8QXgGXhx9BBDbi1ypaAlVhF2VrAqSJz+9eapWqoUhKVBVr+TLyKmRItA
	ULLcdJBmc1OrlZBd/AoeAPkRqySNgoA/YoGH/8J3N7P7XWwLjQpuzMLOmbrbQoJDID4b8YWZuMC
	TISpfftxBY9yln97XI1kWV9HDCTL116FC87NlYwCe4j5SaWcM1prNVHlp3zCFXarWiyder3VEC
X-Received: by 2002:a05:6122:134f:b0:575:e9eb:d879 with SMTP id 71dfb90a1353d-5ac48699ccdmr527366e0c.0.1780608226963;
        Thu, 04 Jun 2026 14:23:46 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6ddacc48bsm6190828e0c.18.2026.06.04.14.23.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 14:23:38 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6cfd9f4d6f5so477898137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 14:23:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Ik3bPDl7zEGbc6pDdoTJpTvJTG7qSEizfYVLQg/Nw7PEo8HSTLolRlrD//p8HDRDCdP1nCM2JV92Ml9ge@vger.kernel.org
X-Received: by 2002:a05:6102:5e87:b0:6a2:cf9a:a5f3 with SMTP id
 ada2fe7eead31-6fef26ce86amr349440137.0.1780608217159; Thu, 04 Jun 2026
 14:23:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
In-Reply-To: <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Jun 2026 14:23:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
X-Gm-Features: AVVi8Cc4MG7c0lW6-0qjcdQ-D0zLqfcs-TS6nz5hMf5r8Kr4Mvblgg-anJYVP1A
Message-ID: <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111273-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 495E764396B

Hi,

On Thu, Jun 4, 2026 at 1:07=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> Some variants of the Qualcomm Snapdragon X2 Elite-based Lenovo Yoga
> Slim 7x Gen11 laptop ship with a Samsung ATNA40HQ08-0 2880x1800 120 Hz
> OLED panel which seems to be compatible with the other ATNAxxx panels,
> document it.
>
> Note that I stripped the -0 suffix from the compatible, as it seems to
> be of little importance and some sources omit it.
>
> EDID:
> 0000000 ff00 ffff ffff 00ff 834c 422f 002f 0000
> 0000010 2300 0401 1eb5 7813 6603 ae85 3851 24b9
> 0000020 500a 0054 0000 0101 0101 0101 0101 0101
> 0000030 0101 0101 0101 0000 0000 0000 0000 0000
> 0000040 0000 0000 0000 0000 0000 fd00 1e00 e678
> 0000050 47e6 0a01 2020 2020 2020 0000 fe00 5300
> 0000060 4344 2020 2020 2020 2020 2020 0000 fc00
> 0000070 4100 4e54 3441 4830 3051 2d38 2030 c402
> 0000080 2070 0279 2000 1800 1200 2ffb 0042 0000
> 0000090 0000 0c23 5441 414e 3034 5148 3830 302d
> 00000a0 0021 ca1d 5e0b 4007 080b 0007 7ae5 8551
> 00000b0 b9a3 024a 020a 5445 5fd0 644c 4400 7823
> 00000c0 0026 0609 0000 0000 5000 0000 0022 0014
> 00000d0 0ad4 3f85 c70b 0700 1f00 0700 7707 4f00
> 00000e0 0f00 2e00 0600 4500 5fd0 644c 002b 270c
> 00000f0 1e00 0077 2700 1e00 003b 0000 0000 9085
> 0000100 2070 0079 2200 1400 d400 050a 0b3f 00c7
> 0000110 0007 001f 0707 07f7 07cf 000f 0081 731f
> 0000120 001a 0300 1e5b 0078 8fa0 6a02 7802 0000
> 0000130 0000 e38d 8005 e600 0506 8f01 016a 0000
> 0000140 0000 0000 0000 0000 0000 0000 0000 0000
> 0000150 0000 0000 0000 0000 0000 0000 0000 0000
> 0000160 0000 0000 0000 0000 0000 0000 0000 0000
> 0000170 0000 0000 0000 0000 0000 0000 0000 900f

I'm not a fan of the EDID being presented in 16-bit words. :-/
Changing it to this when applying:

00 ff ff ff ff ff ff 00 4c 83 2f 42 2f 00 00 00
00 23 01 04 b5 1e 13 78 03 66 85 ae 51 38 b9 24
0a 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 fd 00 1e 78 e6
e6 47 01 0a 20 20 20 20 20 20 00 00 00 fe 00 53
44 43 20 20 20 20 20 20 20 20 20 20 00 00 00 fc
00 41 54 4e 41 34 30 48 51 30 38 2d 30 20 02 c4
70 20 79 02 00 20 00 18 00 12 fb 2f 42 00 00 00
00 00 23 0c 41 54 4e 41 34 30 48 51 30 38 2d 30
21 00 1d ca 0b 5e 07 40 0b 08 07 00 e5 7a 51 85
a3 b9 4a 02 0a 02 45 54 d0 5f 4c 64 00 44 23 78
26 00 09 06 00 00 00 00 00 50 00 00 22 00 14 00
d4 0a 85 3f 0b c7 00 07 00 1f 00 07 07 77 00 4f
00 0f 00 2e 00 06 00 45 d0 5f 4c 64 2b 00 0c 27
00 1e 77 00 00 27 00 1e 3b 00 00 00 00 00 85 90
70 20 79 00 00 22 00 14 00 d4 0a 05 3f 0b c7 00
07 00 1f 00 07 07 f7 07 cf 07 0f 00 81 00 1f 73
1a 00 00 03 5b 1e 78 00 a0 8f 02 6a 02 78 00 00
00 00 8d e3 05 80 00 e6 06 05 01 8f 6a 01 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 0f 90


> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml =
| 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna=
33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> index 1bbe0da3997c3b06eccd18fe8980b58a6c05d963..27536eeaed8594c047dd0fa1c=
f425912be189508 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> @@ -25,6 +25,8 @@ properties:
>                - samsung,atna40ct06
>                # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
>                - samsung,atna40cu11
> +              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> +              - samsung,atna40hq08

Sure. I'll repeat the same comment I made the last time someone landed
a change to this file [1] in the hopes that maybe someone will post a
patch one day:

<repeat>
Given how many of these we're up to now, I'm starting to wonder if we
should come up with a generic compatible like we did with "edp-panel"
and then we can stop having to merge CLs like this. All of these
Samsung OLED eDP panels have the same power up sequence and once we do
that then we can read them via EDID or via DP AUX bus to identify
which specific panel we have and if they need additional tweaking,
just like we do with "edp-panel". Do DT folks have any opinion about
that? Coming up with a name would be a pain since I wouldn't want to
assert that all future Samsung OLED eDP panels will have the same
powerup sequence. Maybe "samsung,amoled-edp-panel-v1" even though that
sounds terrible and there's no known need for a "-v2"?
</repeat>

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/4] dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
      commit: 6f7565f2fc85e9dc0d9d7594bdfc2b03c4e11205


[1] http://lore.kernel.org/r/CAD=3DFV=3DXvHu_NnahFOcfLV4XQm_mQkO5cG3YP+acRg=
C9AE2m6Jw@mail.gmail.com

