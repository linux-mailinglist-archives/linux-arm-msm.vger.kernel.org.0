Return-Path: <linux-arm-msm+bounces-27135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E84693E0FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 22:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D5AD281C43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 20:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34722C69B;
	Sat, 27 Jul 2024 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="SsCGeMqn";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="XZU3UdwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6452570;
	Sat, 27 Jul 2024 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722113284; cv=pass; b=oB4HTEJXOv2R3VBC93Gujvlm+da2cQQquJGamyQ3D6ya2sPQueEGizMeX03DunueSbhQaQUhzv0ysSRtkd5LSOr7OqMF5fSgv6anFGbAf/mq9wVUOdAnhGwXaWI6lKaYe+yBYCawd30NvGRyDbb4gR4erhHKOAOymf2u1qCTc38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722113284; c=relaxed/simple;
	bh=Ao75NPTLWqtX2T2FoWRa/rYvNt7Mt7u2U8fa7OkFN5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FD3ePxmCfMKE4lrCKyNT49+gLB3WhdaxYlaXPVDcqvyEu9GA6MrvWQizrBt189vVntdbBLwoS2fX2QaU6AUN7IBSms60vIp7sQj/MFTGFKe43UB9E3kjf8SKA1zWUoMGwWOnFwwXfL+vgwdoiq/2chuV9eTNTzrAXRMZZCZO8Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net; spf=none smtp.mailfrom=gerhold.net; dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=SsCGeMqn; dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=XZU3UdwO; arc=pass smtp.client-ip=81.169.146.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gerhold.net
ARC-Seal: i=1; a=rsa-sha256; t=1722111832; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Mqk+klkc+fxyVY32lJdxOxdZ1uiwbUY4Ew8/Ux98tLOqYdZTkQJk6EneWYnuhkV3Nk
    JWMJPbLHExMmHyFtp7zrtb00KUE5HAImn8sFaLerX29jhTkCmmo2UYjOcph7xdO2BXPw
    HpNJZUi2gbf59WlZBvBJ+Oo/a7bv8Zab0jd2VA4vW8qNDmc9ZXcCdBNgA2m8xmwaqV3t
    GjvRSA1uZYm2+/ycy+xWsEIKdHE7Tboi9Y+vVXE4C9UjgmcIvNv6z9i/6MdMWjQXh26o
    nJEyhEci61YpIjQFmatGOX+vXVVyRDuBMrsU90GhIiLax8WCIBNA87h5j5oint8HTsCG
    CAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1722111832;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=YpxShBJRloUhGmeW7MprfQelhLb4bKBceOGSaOcp9pg=;
    b=TqRTwhiLEa9QLU4MySj8hX/iq9R4IW/as2WOOfgm0ryMY9bam6AU7TJcBkWu9bjdzZ
    qGOYX5X4/RO5qA0Pi5EGPuKAK7FXxqOFUjOSYYMD+tEuA/epH7knXXNZAJTs6kWRS54a
    n/BzPbiuYL8mTmpuaL8I4kVSHVt/SyegdO0cI9MoxHNmGLZhCglLQn6MuIPE6hnMq39E
    sSC02EBG7Gy3oyjM68N6LOhv+58zJ//DHRYatIxH6IzRpt80oNM0pxySUggffHPfpeZ+
    4mykMtfz+Zk5iaorZ0f0pM1tFdzOJQpzo3UQ/wFbaA6JECOKnwdYw/1xJw/5kA4q7wUn
    V/Cg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1722111832;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=YpxShBJRloUhGmeW7MprfQelhLb4bKBceOGSaOcp9pg=;
    b=SsCGeMqnG/7ffQLBevxW43NjStrCDL3W7KddzGamWN4rTucrNKDWbbwN+gPs1/vfrK
    VECIdK8/EjiaJxn3Er2rvuw/nmwCpiXE5wsFj/lEgWtLWQS8gDoWC9bJ3nWjgokyapzF
    ddEIJtAtsx9f0Yfs40mgnseQ3a6j4xUmFHvkGe2v2w7+obgJeuSg6KoPqIhD4uumQ03m
    J4GvIpKudkI8AvP3ATEHOH8jGD2B4foEA1NFH7cBJXhx1aUxfO5cE15m7iya1SccscqM
    5eZYj1NQiM63JZaUAP3B+ajyyUrJnYz9sZZkpQ7okN7jqQcaHchjEqLF6pISskQ6QWGg
    s5qA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1722111832;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=YpxShBJRloUhGmeW7MprfQelhLb4bKBceOGSaOcp9pg=;
    b=XZU3UdwOclmz/PUJr6H71gSl7D/TxsWxqweKTXM1pSMY0o8uSMBZJB7VQOWkeNDQbu
    5h/Xfg2+Xh0iuwTESbBA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr1eFeJ69I="
Received: from gerhold.net
    by smtp.strato.de (RZmta 51.1.0 DYNA|AUTH)
    with ESMTPSA id R5d98406RKNqV6u
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 27 Jul 2024 22:23:52 +0200 (CEST)
Date: Sat, 27 Jul 2024 22:23:44 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adam Skladowski <a39.skl@gmail.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to
 separate binding
Message-ID: <ZqVXUI37fNB5D0DM@gerhold.net>
References: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
Content-Transfer-Encoding: 7bit

On Tue, Jul 23, 2024 at 10:33:00AM +0200, Krzysztof Kozlowski wrote:
>The APQ8016 SBC and MSM8916 QDSP6 sound cards are a bit different from
>others: they have additional IO muxing address space and pin control.
>Move them to separate schema, so the original qcom,sm8250.yaml will be
>easier to manage.  New schema is going to grow for other platforms
>having more of IO muxing address spaces.
>
>Cc: Adam Skladowski <a39.skl@gmail.com>
>Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>---
> .../sound/qcom,apq8016-sbc-sndcard.yaml       | 205 ++++++++++++++++++
> .../bindings/sound/qcom,sm8250.yaml           | 137 ------------
> 2 files changed, 205 insertions(+), 137 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
>
>diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
>new file mode 100644
>index 000000000000..6ad451549036
> [...]
>diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>index c9076dcd44c1..1d3acdc0c733 100644
>--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>@@ -27,9 +27,7 @@ properties:
>               - qcom,sm8650-sndcard
>           - const: qcom,sm8450-sndcard
>       - enum:
>-          - qcom,apq8016-sbc-sndcard
>           - qcom,apq8096-sndcard
>-          - qcom,msm8916-qdsp6-sndcard
>           - qcom,qcm6490-idp-sndcard
>           - qcom,qcs6490-rb3gen2-sndcard
>           - qcom,qrb5165-rb5-sndcard
>@@ -58,18 +56,6 @@ properties:
>     $ref: /schemas/types.yaml#/definitions/string
>     description: User visible long sound card name
>
>-  pin-switches:
>-    description: List of widget names for which pin switches should be created.
>-    $ref: /schemas/types.yaml#/definitions/string-array
>-
>-  widgets:
>-    description: User specified audio sound widgets.
>-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>-

These two properties are also valid and supported on all newer
platforms, please keep them here! There are certain use cases where
these are needed independent of the platform, e.g. to control an analog
switch or mux connected to speaker or headphone outputs.

I agree that it is cleaner to move the IO muxing to a new schema though.
Perhaps we could define something like a shared qcom,sndcard-common.yaml
schema to avoid duplication for these generic properties? In the Linux
driver, these are handled for all platforms in sound/soc/qcom/common.c.

Thanks,
Stephan

