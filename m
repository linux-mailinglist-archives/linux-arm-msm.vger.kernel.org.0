Return-Path: <linux-arm-msm+bounces-74517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22922B95954
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 13:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2243F19C20AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 11:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C28C321266;
	Tue, 23 Sep 2025 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JK11uv56"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD50238C0D
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758625940; cv=none; b=t9G6WWeVJyTHA7n5fwKks3/elHy96ac5Y2qIEBBs7ABzgl0uF0tncR7eyJVLVkvNeEeDdnP2otILDdMY92C+YBK7ATZJOkaSgiYIyYOIqB9Ph5J4s8no2p/weqsKZwvWPyFQAd6vTb22Mv5KDx+RzG+ChXfQvBRaKSeelvnx1Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758625940; c=relaxed/simple;
	bh=2Mpeg4sU863P59x7ZLTz1eO3+w0YJ+zhnVaBT9TGk+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2o2V3IKrT5XpuA0XjmEtmrwJNeXXKu81wAkET4hEUBeme0SQeQE933YR9J8O8SzLx1xtZKphScwkhsK6dGPTFNk39iYFqx4LEsTJlOOAJttgnTRgcnxS0oLr9xL4o5yx/OvTiQTE0Vl2X97MS/1ADN2U1ZAfH6OFCJ8NcWAM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JK11uv56; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso4441483f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758625936; x=1759230736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NWUMDZg02Yc6pBQ+fyfcvWnx45nePbQrogG4kkah6qw=;
        b=JK11uv56f79YKmzJkFFGORlCYj/RqbiMN+ItQUEnnNbhttdV8y4ryExWZaIZS4Tzl4
         sqlBUc98sNDu9cNSyE+vnOyFgUj5VnJpVVJ469j2PaLJoz3VKdcvgf9mAaPYSNeEE6Qd
         pnaiD1S/x3mU5BLCdot3fQp2uMfk5NPIS7ZAOTJywKXYM8jp/BoNcnY+KqNQ/n8IywbW
         e7Ih7LJQOaF4oVJN59IZaOBApZ1ms8cLt6rg2kfNHnpYeEEq8s9S5Qzafsd1hzvIwN+Z
         8zDmBy9I1ycgarlphE40EvZWo/jx/8ZfrYkXDRJsMHaTNV1vQIpE6frXWLJOgdoKoeEx
         iXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625936; x=1759230736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWUMDZg02Yc6pBQ+fyfcvWnx45nePbQrogG4kkah6qw=;
        b=eHr3CTDFBoqBb/6vMegwjwGYYf8nUT/UtkWud6wmNz7lEG5/gc4NnOB2amrwQlJp4f
         7ILPuP7ZHf7YrW1d8yB03M3J8haHXLf7su5TrkoFf+WTy+S+reERL88R8rXq4dVl3YUZ
         eEPaJ+1VLDcuViywnReKA8SbSxVLCN+9U+UxMImQvKdIU63b0v0OGlq7LZFlm86+y99G
         pYZUthPEc19F8EAHQM2VWwJrhjchviJ/CsDzxrJ7xDQNB3vdPIUSLwQpzlRVwuv1aYYt
         T7QTJvXVanSQGsMuR81PpFaDqkdImh088LHDJeysSEAdVltbnhA2IjGn/nydAT2lQFV7
         S3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVHB+26F0fBdy+u+K0qb+eFVDayBkblsv5ez9Tg8K8BPz8qH23vsP2n2qLphE49c4kimvB28IH3x3A1tUWj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx71JgrwuUmilqQCa0mgzG+/6FQ5cJ9CEqrY3xdGOROuWfJ/3B5
	geHT7hHCBxQo+COZSOOG1x/mgDJw92FLVZJTPdJRy1Vk8ZqFX2ES/NlpSxWNw1UZcYQ=
X-Gm-Gg: ASbGncu9OhtZ0iC9TsC2m8BZ3HaFxe6Ss+kvCJDBsCH1u+Z4TPn7eOzUiN9VEqWNMLB
	xtBNwDiX8QDG/mBvqdjy+Q/KWtVokfvJv/aJEWvwGe6+nsbKfe07vuPTriXtzdZG9418wQacXae
	1qZtuvilZ36d14lOsOKfz/vRCdKxxuLWX1+e0TWYC1RBRVMyOfzVvTeFt7dlNYEj0jER3zdoNM8
	gcFw4O/vbs4o3PPB4SKXbRDNeWGGfceZ4+mJhNCC5v8xUJ2fBTfceKJKwY27CBb0CFLLj4zZEFV
	wQyQKHRVEh56uw5SfpL6Br/W+H5F4o5ES9AEA0xA7SZ71BEV/Lyey+8OWpmEAPiAZ918nS9LBzp
	nw6D4Xl92c0Ld2XzNq+rSPthjNztA1n3r
X-Google-Smtp-Source: AGHT+IG49iNW9kMW01dNqwivcvHhffQ3BmO4pSuUKtosLPnCt7bUnpwTPAUZSNn122slP6AcDzf+Ow==
X-Received: by 2002:a05:6000:18a5:b0:3e2:4a3e:d3e5 with SMTP id ffacd0b85a97d-405c6d117ccmr1764266f8f.22.1758625936117;
        Tue, 23 Sep 2025 04:12:16 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:947e:485e:f019:ebb3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407ccasm23587166f8f.15.2025.09.23.04.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:12:15 -0700 (PDT)
Date: Tue, 23 Sep 2025 13:12:12 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: rename x1e80100 to hamoa
Message-ID: <aNKAjIXT3ll3L0qT@linaro.org>
References: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
 <20250923-rename-dts-v1-2-21888b68c781@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-rename-dts-v1-2-21888b68c781@oss.qualcomm.com>

On Tue, Sep 23, 2025 at 02:01:55PM +0300, Dmitry Baryshkov wrote:
> The X1E80100 and several other similar names (X1E78100, X1E001DE) all
> belong to the platform now known as 'hamoa'. Follow the example of
> 'lemans' and rename the x1e80100.dtsi to hamoa.dtsi and
> x1e80100-pmics.dtsi to hamoa-pmics.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi                        | 4 ++--
>  arch/arm64/boot/dts/qcom/{x1e80100-pmics.dtsi => hamoa-pmics.dtsi} | 0
>  arch/arm64/boot/dts/qcom/{x1e80100.dtsi => hamoa.dtsi}             | 0
>  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi                  | 2 +-
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi                               | 2 +-
>  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                        | 2 +-
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                       | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi        | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts            | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts             | 2 +-
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts                          | 2 +-
>  arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts   | 2 +-
>  arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts           | 2 +-
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts              | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts              | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts           | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi           | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                          | 4 ++--
>  arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts              | 2 +-
>  arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts          | 2 +-
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi                             | 4 ++--
>  21 files changed, 29 insertions(+), 29 deletions(-)
> 
> [...]
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> index 10d26958d3c66a5a4faf2ca6065e7b661f967b4e..2cecd2dd0de8c39f0702d6983bead2bc2adccf9b 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> @@ -3,8 +3,8 @@
>   * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> -/* X1P42100 is heavily based on X1E80100, with some meaningful differences */
> -#include "x1e80100.dtsi"
> +/* X1P42100 is heavily based on hamoa, with some meaningful differences */
> +#include "hamoa.dtsi"
>  

If you're renaming X1E, please also rename X1P42100 ("X1(P) with 8
cores"(?)) for consistency. That one also covers multiple SoCs.

Thanks,
Stephan

