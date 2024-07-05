Return-Path: <linux-arm-msm+bounces-25392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C0928BEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 17:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D118E1C23A46
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 15:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525E216CD11;
	Fri,  5 Jul 2024 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NKoskVbb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E616C842
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720194013; cv=none; b=QGfpG6QyVoxr3mbH4psdQhxmVtN3xATZKxgY83oRvQ7oVfrasC6Py8UWi+mjdCxTUTtq08aVySEeHOA818dA//1QjUaoSqEngX0Q9gG+Yz07V+i4P7n4Etwf/AscrPcUoXnlue8qycsMjFrwkxYXFbfLyvujf8AGv97endK2IVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720194013; c=relaxed/simple;
	bh=lvk3fb6EH5rw6dp1DOnJCL3dq9tQI3MOZD7gcFF+qDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGq2HMzud9SU7/Gk5BWJVXt8GhO6KxGgpgODsPw9Ua8qdBiR4wfW/z5rk1TT7hplgaPPsXlUL2r+jUDrzB6gAzyuEV8+B6N2xjitEmGyx3PE3aZF7Q8Ydp/y5DodmqDb2lSntxFpGw6/aAMQeU4p1JhrQ5VjUJ3/4Jy8I44gUTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NKoskVbb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-367ac08f80fso389311f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720194010; x=1720798810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
        b=NKoskVbboCs15opK/u8G0ePgBYosmRGjKGCHS/WSYb5wNVrWjJ4EX2lGolUGCOPdB9
         0uQaIWeVLcyyqRkl0aDLiC0M22BQfSsWudXssBVXP3pxhsgp2pHVNeCJJ6pFb0ysOvku
         csxvRFZtHVu2Riz/jqwBzAfHZ5pM4k4APkaTzbOevLhvQsW6500bwwj0ndhPXjErmehh
         +i751M0SzL+icns0EEBvjcXD6QpV1PfdYxsBePfojkYHuOO8lnW0oE7zvqH7TvCPxW5U
         dkeyRnYpatAZTpYE+qHY+vGIlRIQn6i3NQk7nUNyPXFA2dJHiPpf6KfsSmBx3SHxxs5u
         bJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720194010; x=1720798810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
        b=E7/bwDVChGKDmCZ8hb97BKzx40nWT791twH9pzllw4Rp/0QGgqU0zjD4+xNJDbHt5V
         ZI68hlIwWvQVND4AYmq4lf3yWYdHAGAlFCdR8JJVFbP55nuyAuN3Mjz3kolwhaQrRbHF
         1kOqZJjPYf040VHbP/oOgITmidk+sAouHSnS4AmR8wK105/EAeynCA3UOU9vzsL0Pal0
         D49iI07ZCEMgOt4AVnIGOMYboHejNXAjoPiuMwoWaESfxKXCP8JDcB8scHUjACrhdsMt
         ABS0YbjoQeRipLEnY5gHKcr8BIQ8Irdlo9cFY2Xxp6C8vYfCtTssPTyZSAwwBUmTuWyI
         M8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUrKJ1LZksyHhRAtAdLthYv9AfK5daTJPk91Ve0TFdqqeglzlBw7vafpiJnhB1svqwKYY6TrWgN39VomdhHAMgiFxNOeauKO8BlZ9djAw==
X-Gm-Message-State: AOJu0Yz4vUyko/jYSwhbG2sLFPsDlXiRWuULVCabwOr+AAVg95psGEdE
	EzvIvnNGs884KwHPLjnW8Af9WCLoDKCnNKBhc4x2Ne6Wl5dDNBVAj4xi4slcIPw=
X-Google-Smtp-Source: AGHT+IFZ5tZcHjh9afQQV6N+UDpsdiCgwUbQuOPcHUbDQTq2FuqnU3hsZXAXDh/UpS3fDJuMgQV8qw==
X-Received: by 2002:adf:a18f:0:b0:366:f469:a8d with SMTP id ffacd0b85a97d-3679dd35e71mr3543623f8f.35.1720194009828;
        Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36795d1fc9csm6559538f8f.83.2024.07.05.08.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Message-ID: <c7c78d7d-c920-415f-b97b-c3b7c61eb9fe@linaro.org>
Date: Fri, 5 Jul 2024 17:40:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/22] dt-bindings: thermal: few cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2024 11:51, Krzysztof Kozlowski wrote:
> Hi,
> 
> Resending (with added tags) because patchset was still not applied.
> Daniel, can you pick it up?

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


