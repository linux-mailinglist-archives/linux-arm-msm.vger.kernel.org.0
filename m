Return-Path: <linux-arm-msm+bounces-110705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGvNI6RiHmrCiwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:57:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F196A6283F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D43D43056607
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 04:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DEA2DC78C;
	Tue,  2 Jun 2026 04:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMSq5qHi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8672DB78C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 04:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376029; cv=pass; b=Kjc9Y44ad8pmxd93bP1JfiB/TTR/0os1O0qbetRZQDNDkWVb0MQUo9wpgj/mslQJ0CpWlfEdb62sABJ7QBPotcOupbV0MgjlTBwwH/pDR5Av7UdpvR/UCVcjE6vkra/Tk1AbDIwxBV63JP3bVzZEKGAbZ1uFl1CNuTwRKb3T6jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376029; c=relaxed/simple;
	bh=+g9u+TubkywUHekxS11qDKNi0RpRAXGuXqJT9m66I94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzatOtajsuvEQLftTlUsxXfOYltAGcAxRo9lEy+BWxStaHvdWzdrouNbaF70RGG3BbzFUs1+wO7qyLtAAzd5S7xd/vCJLPF8oUTea49r3GPqFAEx+Js9SbcKzuffezQR84gGuGcLzNfbBvGljbsUg5IjTvqMoKDwTGJrF395SRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMSq5qHi; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39661ba5d7eso29971481fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 21:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780376027; cv=none;
        d=google.com; s=arc-20240605;
        b=hsPgjOoE4PdVQ4zVooy0Lk3OB/0IZkqBnS7jwd5Pm6C0N28DJrylvxg+W61yZ6pYP+
         u1uXVsJ5G6q9Nm6anlqQPIOownYb7TZ/RriwySRUT9tQ+a9UJzIh9sPXvygCQWam4KfN
         B2VfXXu437k8yakwpBWNo1lnXbKaBXqIzprs4JUVLVxImPatBK+BwxvdF82mkZI9BRN1
         NoY8oEn7ZAM/G37wBc27crDA3ZhMRJDMAs4GX0Fm6VNAHWA2EMqpgjCmKGCKp1XFQZ4y
         ECl0O3/22yCuhihSHXAWsjjByQkHC+7MK5AXAYOH2OzKaYPucw3XLQEEOcHMLJQHWHWr
         u8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DzcleAmV5w1y7JF/G8eR6YBhK1L7hto1eyE5epBS/Gs=;
        fh=mq84yfqDmfz9X7/cHtm+arIMd3n59xrLZapq9eFIFiA=;
        b=XvahH1m/YTyQXnTkFOPZYtK160t/4xuJSmT3cvYxRGirP+sK9U0krDXB3Zup05Lmvh
         SYF/TIlb/2HY5sB/W5/SUuNfgkf9t5vW2WrLCsKcKVcuOMLciir0wqQyN9SBdvmMAgTk
         JO9LUZPs60oKlB1I+GyMuK4kVIRwoPCJeec7Ys3/qNWjc2AD6I34XjIZIDjOLi9VNmeL
         96J2TlvWDvJrf7HmGkQwhImYmOO2e4ZoKpbG39JxTSQCgPA4K3CEoynONRHfYRZLCzLv
         XyVeH//M63QZEGKlo9teYpw29PI2FaC8WJ4m6sqBhiCuJGBdkvJdl9AtK1FJdVGz7duY
         7unw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376027; x=1780980827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzcleAmV5w1y7JF/G8eR6YBhK1L7hto1eyE5epBS/Gs=;
        b=bMSq5qHikbYbm8fIPw3X8GLguRaW4wNvWDlXqLUl+cSZWbH1EIM7WujGJ1EOuYW40X
         3VXvfZzY5FmV7nFthlAMqx8ucc6M9w2ru0H6TFRXITLCRyiYVpND+b6hPNtHhOZi1VsE
         oCzzzn999B+TdZrK0DY4FYXG2e+Opc7iIO00yNZM4CigvY/lUa1ZzJPsduEycyv3v/kS
         jfhUgO0QvLqp2UPOkoPKjXfE0bfI1Q1/I3gbGiqwz5WWIR+t5nEtEfGLSwSG3OvRB16d
         PEYaJXyjEXUqowaS26bI8eaeXJ95j8TUaZHOT+ZfGfzoOrAo3YBTgS7S41lN2vfl89yu
         000w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376027; x=1780980827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DzcleAmV5w1y7JF/G8eR6YBhK1L7hto1eyE5epBS/Gs=;
        b=N2BCWGuIpqG8Ac/MrzmW2Kf7FoY8Ae7evHvEa99knKkAkFfyuOX5xVzQ5YRPnKxbHQ
         yXsD3lIsJzrBdU0iIqYhhF3R3wbRHcF1xuj3izoy0beZftHZkzoO+Q7DfJeNjlUMd2P1
         0wZsOYL/+e1Kq1NhFyJUqPJykSqXKTz3Ri/CVIW04UZQRvERjZPCEzTRHK3UTKPo1mZp
         dczQ0vbwjrFf4C6dcYnndk5xho+YzWOBBknQk/XFCQCZclSaGNzL4PqYLuEoIUAX+lXd
         8OUXxymP4YW0ROZfGXqL7+Xrz+WTGLr3vXf+PDKgYMDWa9Dd/xyTg8P1+bYBGenaWr1D
         q7NQ==
X-Forwarded-Encrypted: i=1; AFNElJ81Mb0GEitOq5hYU8EZ877Jr37kze5ZgHaw2dVfDoQNY+arOM/VCWRpsWpTwAom6m8fTl24sP5H7XprVtAj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04u9p3onR3Fvwn0bvlWPoSQQtNjp74zfYDxo1pIIQPzaTz5/q
	oMTmy4pM8FeyBnOm37huP7vFDz3E21jswWIqAHXKtZBkWEIygjxeMhHJW6aMSn1vTaH0iS2e10D
	SL4falxHcnxrVkmvDqZKJporo0ukiKAY=
X-Gm-Gg: Acq92OF4tukglJbBuhyU6gce+dwZayulCUH11SRIvbJW0OdrSZ4xoMLI8LebAVNlBd5
	huktqI5fP6eMEsX2bMmnIL1720a4PuPlC19uTKs9G9vhV37KyTOKpOrehhXnW/IzuLDnnXRHQ6+
	UfBP0XwRbDtFzFzKOZkLTZ9xDKLVY7+vWNt1/GI+t3pZ0oFsHqClggNGTzQfXD3+azskNikz9yj
	iprLx31yYBGHiLqeqL/ewkDXATHsRUY4jPBntcPgOmZlhZBivClv8ltWH2u4aUaoHwb3meQXtl4
	20bTW2q8O24jpKhy1M2d7yrigBaWYQ4b027asTRN5mzpapV/Fby4xSbbgQhexs26VO2YoaOrikq
	NJ4g=
X-Received: by 2002:a2e:a581:0:b0:396:9b1f:a8b9 with SMTP id
 38308e7fff4ca-3969b1fb305mr8272821fa.6.1780376026322; Mon, 01 Jun 2026
 21:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
In-Reply-To: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 1 Jun 2026 23:53:34 -0500
X-Gm-Features: AVHnY4KOzXuQ2WwXnqwu7y8wMADauWr4edG7ap6TzZFhdLtizRu9gamU-oya8Lc
Message-ID: <CALHNRZ-pTNGjm4S22VwAbwSyUw7+_LkE48QnssVDLALYi5Mx6g@mail.gmail.com>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110705-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com,sobir.in];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F196A6283F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 3, 2026 at 4:49=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> This specifically includes:
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
>
> The original Odin 2 dts is not currently included as it has not yet
> been verified.
>
> The initial port was done by Teguh Sobirin for ROCKNIX and was made
> available on the AYN github [0].
>
> Support has been removed for things not yet supported by the upstream
> kernel, these will be added later when the related drivers are submitted
> and picked up. Such includes:
>
> * All panels
> * The Odin 2 Mini backlight and touch
> * All rgb leds
> * The built-in uart gamepad
>
> [0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v8:
> - Properly order and format amplifier properties
> - Set amplifiers name prefix to Amplifier L/R
> - Link to v7: https://lore.kernel.org/r/20260430-ayn-qcs8550-v7-0-591a967=
35fa3@gmail.com
>
> Changes in v7:
> - Add back pinmuxes dropped last revision, but without output-low
> - Link to v6: https://lore.kernel.org/r/20260430-ayn-qcs8550-v6-0-06a7e7b=
54aaa@gmail.com
>
> Changes in v6:
> - Fix comment style in patch 3
> - Drop a pair of unnecessary pinmuxes in patch 3
> - Lower usb sbu pins drive strength in patch 3
> - Link to v5: https://lore.kernel.org/r/20260408-ayn-qcs8550-v5-0-c90abeb=
7a152@gmail.com
>
> Changes in v5:
> - Fix some style reviews in patch 6 which required matching labels in
>   patch 3
> - Drop hdmi support in patch 4, since it doesn't work
> - Link to v4: https://lore.kernel.org/r/20260323-ayn-qcs8550-v4-0-33a8ac3=
d53fa@gmail.com
>
> Changes in v4:
> - Fold vendor description patch into the series
> - Link to v3: https://lore.kernel.org/r/20260322-ayn-qcs8550-v3-0-4afa89c=
20888@gmail.com
>
> Changes in v3:
> - Drop unused backlight regulator in patch 3
> - Move zap shader firmware to standalone reference
> - Move i2c controller enables from common to devices
> - Add ABL dtbo workarounds to patch 2 as per:
>   https://lore.kernel.org/linux-arm-msm/dczz4uvcq4hc6p3zb6xnrsgmfeomwliag=
whf36tewdz4z6mndp@afbxzhjziiwv/
> - Fix multiple property alphabetical order issues in patch 2
> - Use interrupts-extended for pwm-fan in patch 2
> - Ensure blank line before status in patches 2-5
> - Rename spk_amp_l/r to amplifier in patch 2
> - Remove a few properties that are already in the soc dtsi in patch 2
> - Order tlmm nodes by pin index in patch 2
> - Drop qcom,dll-config from sdhc node in patch 2
> - Drop dtbo support, convert common to dtsi, and include it directly in
>   device specific dts'
> - Link to v2: https://lore.kernel.org/r/20260311-ayn-qcs8550-v2-0-e66986e=
0f0cb@gmail.com
>
> Changes in v2:
> - Drop awinic bindings dep as a duplicated patch already exists
> - Change Co-authored-by tags to Co-developed-by
> - Drop alias to currently unused uart15 in patch 2
> - Link to v1: https://lore.kernel.org/r/20260311-ayn-qcs8550-v1-0-fe8b2fa=
ad1ea@gmail.com
>
> ---
> Aaron Kling (1):
>       dt-bindings: arm: qcom: Add AYN QCS8550 Devices
>
> Teguh Sobirin (4):
>       arm64: dts: qcom: Add AYN QCS8550 Common
>       arm64: dts: qcom: Add AYN Odin 2 Mini
>       arm64: dts: qcom: Add AYN Odin 2 Portal
>       arm64: dts: qcom: Add AYN Thor
>
> Xilin Wu (1):
>       dt-bindings: vendor-prefixes: Add AYN Technologies
>
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    9 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
>  .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1764 ++++++++++++++=
++++++
>  .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
>  .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   84 +
>  arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  227 +++
>  7 files changed, 2133 insertions(+)
> ---
> base-commit: b9303e6bff706758c167af686b5315ad00233bf8
> change-id: 20260217-ayn-qcs8550-16c07b63de26
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Is there anything else I need to do for this series? Or is it just
waiting to be picked up now?

Aaron

