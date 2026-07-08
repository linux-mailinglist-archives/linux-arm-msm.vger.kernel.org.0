Return-Path: <linux-arm-msm+bounces-117776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id etBeDKaATmoBOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:53:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBED6728EC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:53:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VFIIdveV;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117776-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117776-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A524307EB8D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 16:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7815443F4D9;
	Wed,  8 Jul 2026 16:46:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1FC43803D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 16:46:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529195; cv=pass; b=Qh0qDok65skc0HLWScJ8nihGTVcOD1rKd+lGys7TVo5dpJH1XVl0RJyg6RuM5BS9C7UtCJdQcQaz33/CsSUxr4t7vEVscMNGmxjhcc+4qJ49ZGVktp8SJ7ENaenAihMbKvtUw0Lbnuezpz3wtiDAXGAZNhgN7qAmVcz1GGOXdF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529195; c=relaxed/simple;
	bh=YVC7US2aV60pnlAH0IP8o4x3u6M1gcnkpWx5x8uEzuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQzmFjKMaZW7d8xVl0QDp+4s+kpmVKRhm5033SHNqoixJYBG7iNWv+5fP3BGSsO0PIZMYxSRHiglp9Q9NmbYyK7t/xTRUJg28RU9Yiu4OOQ7qiRBrqz+PkfJ4aDlwJU7uhkIvYQsVvxWz76iIQ7xUaGfg/i4YeJV5IcUwWGMyBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFIIdveV; arc=pass smtp.client-ip=209.85.167.50
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so973294e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783529191; cv=none;
        d=google.com; s=arc-20260327;
        b=ZtkBqwlP53XlOcKcOFEcoECCssFk4wA6Mw6YvyQuAuFb/Zn4b6mKHcFlAayPm+w75T
         crMGvyJivcMKvV8WJPR+V/o4sNAz0jGUlqSfo/A4mqNvZOpuCH3fv6GCkEWLLq1kmtos
         PbEUllWDEhG/fVaPxhOX1bAMGZ73rmMU2qZQQPrz3rMKDbMU4WE4aMkl5jZRoQxaXoO3
         g7VHrEYsJJdKAh+UMP7TTjFEvKd3P4p7X8T86WkEjTMvuIK1bAi1oNwYx05WiCJQjnNn
         pBUMEatF/cveM7xDC+TvhyvShcgj3L+Xi7Oih1R8qL5CtBvJ/SoDk2sBI7hVPXiNrMiF
         uApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0B8IpGQETbsDt2QSoVxK+0KtGpKAy/A/fPRvO+p/8A=;
        fh=mE4ffOfY1CoigHHk7ZI82vsJyETaazbMMsH/iReW+TU=;
        b=l9osSpmIAHF66+h2kce0YIjI1w5MRcfyf55InGIysfTdjfYEIxjNmjtAjm6iyIBKAo
         2WAiI4yXw9tR5/Ti/b9zW0bmCTZI6UMsTcJCk8TuJuIsdfWPrdpwBYOMYmJ0qJafkikD
         cd3TYQlMV5gduUt+Hm3Pfjf2ScGLjrXRNCZ/jprwZi+2lcvRzX9tdzc+M2ry+ZhRUhjl
         GspVlaYJRyiSkNeUWHnA+pbsScZyE3EhLloDptmPoRtbX0eL3xxveKsT2kLkYHEctg/q
         1Tw6ubZThM3WPLpTBXQqk1SofOhbwHEeVFNQP2o0s2cxci+06up+Nx4IfPWdgPHeO2Si
         /85Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529191; x=1784133991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q0B8IpGQETbsDt2QSoVxK+0KtGpKAy/A/fPRvO+p/8A=;
        b=VFIIdveVJuZOw+2Rxgo2w6Jl7IwxTe0tdn3UxcpI9i/V2DNz5lbXn3IYyHmgM4OAen
         dCoT8uQgL/Q3D6Pd7othbYGYeZnvZhK09EwqZbmeOgINoPZ15vJS1rTf410nS9KfQqV/
         Haf/euYQ8qO/WeB9T6Ns5U/PVCbJQ6YAHdKVGltbyopY0eOCGRw3HtOO24OKTkXJoZ4g
         cyHy19AySDiRTlXPN3/5KJnI431RFDZnarz0kJmfUoQbKH+3tLqTnRyj8OVMlffPQf9e
         I/apprU5zHrTWXqyWZhsJt45nV6rHU0zCEnxhnu7QqXJd8/gK3NMT+DkvythO7+wrUbv
         0fSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529191; x=1784133991;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0B8IpGQETbsDt2QSoVxK+0KtGpKAy/A/fPRvO+p/8A=;
        b=CD7KDWwwgPLkrKVNd3wvQYZRwbE/lGr3seD5w2VRt6t+f5q5W1sv4i+33ESPNTDti9
         accyZQTTdZO9jNduZhXAbmIa01UttNSuo+lvBdN76ZoANQNE57+9eg0ipy+wFVnrJSLJ
         dDEVtPhznZWq/ZSxWAAHyyeLVMrsojCOfnlMmRVEyzI4Xc1Aif5PCby1lQ3KB8CUUhxJ
         XuJKVnb7TwFYW4eaYrKMXQNHTOJqeETFc+FR896UuP7t6j7g3L/ezMMZ1mA0/rbe1HpA
         i7DbJQQO/O7IUupe2oZT4aOur+hUT2gNL+qhL0+D/AYgnGZbWWJvLx/bBdK6TUwK0KVI
         v12A==
X-Forwarded-Encrypted: i=1; AHgh+RohewulnK5hnOalWV8BMq/XJRkooaDnyYaK+dWbLj3Zm48u7ZM5jEgoR0FYuuP+egZAkhx6IP73qiNhAmmE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3lMyOdMRH2hK/f2rAVhmz8xGHJiV2OFtDs2rQOLqtLLX9orbZ
	llRtCJeKlyT5xIC0AyU4Q32Wac56c4EnSjD9p5JQnoc3hy0IDCXX9PNp4FVFyfC98jGBGTeeC8o
	1jkgW0vWORO6ZU2ZvXTZL4xnZkYkoyf4=
X-Gm-Gg: AfdE7cnS+Qu5BxmGPQS2bIIZMW35V1lZPEbzsxqR/+bsoPJP3FqFxE4G5emFPqxv4py
	PIi6wGW4E1cuJy7wExRZdkGkrzEfNmMfD+D2ZalIL3hhEaEG6vp7Ep+A5rvmUdka7G+CTtnHyQ2
	SdTOnf1DWqOsK2tTpJvY8tAsOGz3zPlMqbhQp3DRpGhna3IxVa1LaizkjbbLXKaJEpVVpjaovJI
	kRqEAHqwG0+iVn9j6hj8YG91WN5edQvfFNERnt9CElpmzEIbhMb7cJZa5yuReU1nkWt1XmhwJQI
	if1uChYYbt13ytGnjUJs5wXDPdRY1booVfTcaUv9/sV/4NoNEm+3XQJh5RgCtqMzRoHd
X-Received: by 2002:ac2:4549:0:b0:5ae:b99e:4c39 with SMTP id
 2adb3069b0e04-5b0114790dfmr566950e87.61.1783529190753; Wed, 08 Jul 2026
 09:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com> <CALHNRZ-pTNGjm4S22VwAbwSyUw7+_LkE48QnssVDLALYi5Mx6g@mail.gmail.com>
In-Reply-To: <CALHNRZ-pTNGjm4S22VwAbwSyUw7+_LkE48QnssVDLALYi5Mx6g@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 8 Jul 2026 11:46:19 -0500
X-Gm-Features: AVVi8CeXVSsQQ4AYvmpaDNnr8CDxTLJczUfq-hCJxq5fQBESfMkATeuugJc1mhQ
Message-ID: <CALHNRZ9KT_cBhRo41NbnzPxHvRaBTdFNL2b7rcQP1brQfkbvzA@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Teguh Sobirin <teguh@sobir.in>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wuxilin123@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:teguh@sobir.in,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117776-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com,sobir.in];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBED6728EC4

On Mon, Jun 1, 2026 at 11:53=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Sun, May 3, 2026 at 4:49=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > This specifically includes:
> > * Odin 2 Mini
> > * Odin 2 Portal
> > * Thor
> >
> > The original Odin 2 dts is not currently included as it has not yet
> > been verified.
> >
> > The initial port was done by Teguh Sobirin for ROCKNIX and was made
> > available on the AYN github [0].
> >
> > Support has been removed for things not yet supported by the upstream
> > kernel, these will be added later when the related drivers are submitte=
d
> > and picked up. Such includes:
> >
> > * All panels
> > * The Odin 2 Mini backlight and touch
> > * All rgb leds
> > * The built-in uart gamepad
> >
> > [0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v8:
> > - Properly order and format amplifier properties
> > - Set amplifiers name prefix to Amplifier L/R
> > - Link to v7: https://lore.kernel.org/r/20260430-ayn-qcs8550-v7-0-591a9=
6735fa3@gmail.com
> >
> > Changes in v7:
> > - Add back pinmuxes dropped last revision, but without output-low
> > - Link to v6: https://lore.kernel.org/r/20260430-ayn-qcs8550-v6-0-06a7e=
7b54aaa@gmail.com
> >
> > Changes in v6:
> > - Fix comment style in patch 3
> > - Drop a pair of unnecessary pinmuxes in patch 3
> > - Lower usb sbu pins drive strength in patch 3
> > - Link to v5: https://lore.kernel.org/r/20260408-ayn-qcs8550-v5-0-c90ab=
eb7a152@gmail.com
> >
> > Changes in v5:
> > - Fix some style reviews in patch 6 which required matching labels in
> >   patch 3
> > - Drop hdmi support in patch 4, since it doesn't work
> > - Link to v4: https://lore.kernel.org/r/20260323-ayn-qcs8550-v4-0-33a8a=
c3d53fa@gmail.com
> >
> > Changes in v4:
> > - Fold vendor description patch into the series
> > - Link to v3: https://lore.kernel.org/r/20260322-ayn-qcs8550-v3-0-4afa8=
9c20888@gmail.com
> >
> > Changes in v3:
> > - Drop unused backlight regulator in patch 3
> > - Move zap shader firmware to standalone reference
> > - Move i2c controller enables from common to devices
> > - Add ABL dtbo workarounds to patch 2 as per:
> >   https://lore.kernel.org/linux-arm-msm/dczz4uvcq4hc6p3zb6xnrsgmfeomwli=
agwhf36tewdz4z6mndp@afbxzhjziiwv/
> > - Fix multiple property alphabetical order issues in patch 2
> > - Use interrupts-extended for pwm-fan in patch 2
> > - Ensure blank line before status in patches 2-5
> > - Rename spk_amp_l/r to amplifier in patch 2
> > - Remove a few properties that are already in the soc dtsi in patch 2
> > - Order tlmm nodes by pin index in patch 2
> > - Drop qcom,dll-config from sdhc node in patch 2
> > - Drop dtbo support, convert common to dtsi, and include it directly in
> >   device specific dts'
> > - Link to v2: https://lore.kernel.org/r/20260311-ayn-qcs8550-v2-0-e6698=
6e0f0cb@gmail.com
> >
> > Changes in v2:
> > - Drop awinic bindings dep as a duplicated patch already exists
> > - Change Co-authored-by tags to Co-developed-by
> > - Drop alias to currently unused uart15 in patch 2
> > - Link to v1: https://lore.kernel.org/r/20260311-ayn-qcs8550-v1-0-fe8b2=
faad1ea@gmail.com
> >
> > ---
> > Aaron Kling (1):
> >       dt-bindings: arm: qcom: Add AYN QCS8550 Devices
> >
> > Teguh Sobirin (4):
> >       arm64: dts: qcom: Add AYN QCS8550 Common
> >       arm64: dts: qcom: Add AYN Odin 2 Mini
> >       arm64: dts: qcom: Add AYN Odin 2 Portal
> >       arm64: dts: qcom: Add AYN Thor
> >
> > Xilin Wu (1):
> >       dt-bindings: vendor-prefixes: Add AYN Technologies
> >
> >  Documentation/devicetree/bindings/arm/qcom.yaml    |    9 +
> >  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
> >  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
> >  .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1764 ++++++++++++=
++++++++
> >  .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
> >  .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   84 +
> >  arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  227 +++
> >  7 files changed, 2133 insertions(+)
> > ---
> > base-commit: b9303e6bff706758c167af686b5315ad00233bf8
> > change-id: 20260217-ayn-qcs8550-16c07b63de26
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
>
> Is there anything else I need to do for this series? Or is it just
> waiting to be picked up now?

I see other stuff getting picked up now, is there anything preventing
this series from going? The one outstanding comment is about things
that could be fixed up during apply.

Aaron

