Return-Path: <linux-arm-msm+bounces-57274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F454AAFD6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580211C2566E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2DC27511C;
	Thu,  8 May 2025 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dn/X2QHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEADF26FA42
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715324; cv=none; b=jNs5R261Cm6EKjXtFDqD7V9H2aiUH1D54O9rd+SsGfKYpox1ZWH6635VX1RFeHz+usjYRRgHp34fSvcdDMg7WRVJWzZqtPcIy9dUPofNOM2+TqT9xyxduY/Jx8LmJlVaCufFUKlcRNFts3nrSK5QYGA9Y+b/kraHExc/rfwnzjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715324; c=relaxed/simple;
	bh=w4HQEETo+9J0h4a6Dg9A6D3uA03G0mI8l95GvwbBBeM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BNa9lgLatVLMWCSobiyt9jNgkzPxU6aM0muEdEh1aCppUmhjyo+xWCTIUrTH7gTsTFqnVeMYtIMMaoIC7ZJzpyxJxqY54b1sxTIrpp2tMfirA/3X0J+tU4wFHx/H3whHXJEVxG3ffZRkCKeTs9O2y6Wn1JQqpRGpnryWyBrd/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dn/X2QHh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so7449965e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746715321; x=1747320121; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrBaAc5FQu6qVDHDFOOHefs7wZaeQLwFmmPALPSgPQc=;
        b=dn/X2QHh0svRlgo2TkaJA3jKsVZxqfLiLD/2B68gQuPA0tnXgtSM8vbsveCgYt1se+
         agP3BHa+VCnXRNy2lc75OToHuskbhL4avmzXkD5TTy0/hTn3VWThGo1RwY4rB0g+f+e0
         uc0Kl2Ox9fo3ANZpSSExHh62tnfWvAEfeStNk6wLM2UsWboSjjGgZYMO7H9FzKYBJtq2
         BLM/50+7DoBy/5YmonOFWsbrIClPngqNSooaPHLH70uLHTslcjMH63auTYIByOunIMEL
         oKv4iqB0bAkREEDqfh0yPE1LluubJTdF8T6reUZTmrJbeKHtseJEjW8ZDhyNuZOVCCPD
         xZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715321; x=1747320121;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrBaAc5FQu6qVDHDFOOHefs7wZaeQLwFmmPALPSgPQc=;
        b=G5TH/2K6BftHSK90ordjFyK6AfB3wqjA3kAb2+Lls12nZSzpyrHFlBg8AoQhOIznLu
         HIuYQqZMAu/82EwkxT/szdbBdUMSJhmDrrMK98s/9Eb8zjVlSKDdb/pAMca1eHFsMFTl
         bWUlKXmw3xhDwpvZt5EjCJB+fjx5Rdw6cwLxvcVegO/yx+eqviO0wlxN/ZS/PNUAvrar
         6PELSTg6Ccq2Avatx9CRFQXILbYq/Pg8VGe/2T1BOMXjkGIb0MlMO3PwpNvGJb5pnFTr
         cG/jXNEb6AWf0owJtbI+GJZSIVSlW5wq9wJwEX6Q2Q4ncDpiYcf6JmCiBzhtQjigmJci
         nAvg==
X-Forwarded-Encrypted: i=1; AJvYcCWa0+yovVz7uKsKDel4xtFRL7mex6eSvBGfDX7xE5tKo6Pg2QWLmGlMNMf2SNeThK+uAzvKgjUlHZy81iLO@vger.kernel.org
X-Gm-Message-State: AOJu0YxrIz7oeWET0w/n3q5vc1LjEgk+puu0wXCS8htF6d9qaf+DJdCz
	evsA6C3yja0chCdiPhcWwPkuorAk5++zLswh3zLPYoTIx7mAWDWxNwxwntV0YVo=
X-Gm-Gg: ASbGncuhEkDWMe4il9TKlFg9FyyBHfUOuA9W8AUGIHBNE/jr5GV1xYu8BEjJxP8lEzQ
	BDQ+Wxtvr7TetFQQalV9n1viyiZ9+oRCbcbJ1j/oUUdvCkcY3CsvLjGxhUOo+Gor2G9rgsmKJaq
	fexL5XTlDzABjmCxmwP2iGUro+1n8h4wyqxt2OqktfsKD8J9uy82xbXEpm7+/izbtBkYqebNYB/
	PfCwotG/AZf1r5d1dt5jtvP6k/5tOX8cmxtoStRmVK2EjOxffagX7OfX+wzD84MQ7AtnmQDic95
	DDvQWnY5kYlFpoV7CXCEG0xlTHrKhYQouGHukMvE8IwMSg==
X-Google-Smtp-Source: AGHT+IEb3dVDFDkl4lU+FypjQEa7HUN4YGkquPGjrQFN+u1Dw3oq/2dd+jM5c24OSKfMwdJVv9cw8Q==
X-Received: by 2002:a05:600c:5491:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-441d44dc05amr64615065e9.24.1746715321230;
        Thu, 08 May 2025 07:42:01 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f331sm40128285e9.13.2025.05.08.07.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:42:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 May 2025 15:42:00 +0100
Message-Id: <D9QUWKCQSNF0.87YLTECWRI3X@linaro.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Prasad Kumpatla" <quic_pkumpatl@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
In-Reply-To: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>

On Tue Apr 29, 2025 at 10:24 AM BST, Prasad Kumpatla wrote:
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp board=
s.
> The updates include adding the necessary audio device tree support and th=
e required
> dependencies.
>
> Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same=
 SoC=20
> platform. Therefore, the audio support changes are included in a single p=
atch=20
> set for consistency and ease of maintenance.
>
> Changes in [v2]:
> 	- Created dtsi file to handle common audio nodes to support Audioreach.
> 	- Addressed the review comments.
> 	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250317054151.6095=
-2-quic_pkumpatl@quicinc.com/
>
> Mohammad Rafi Shaik (7):
>   arm64: dts: qcom: qcs6490-audioreach: Add gpr node
>   arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
>   arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock
>     settings for audioreach
>   arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
>   arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
>   arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
>     headset codec
>   arm64: dts: qcom: qcm6490-idp: Add sound card

Do you have topology file and mixers commands (or UCM profile)
to test this?

Thanks,
Alexey


