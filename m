Return-Path: <linux-arm-msm+bounces-12645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 405DE868995
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 08:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49AD51C21440
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 07:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72D254656;
	Tue, 27 Feb 2024 07:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L4vVIGI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E816D52F9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709017697; cv=none; b=I1Zo2sKp7CJRX6LPDa68MIMMeC+xDGzfULyo89QjYBNlqHkvpr9kLNdinMqQpSaYHHrAUMvQrK/NJ+A7amhLcAWNXZshCibg4OcpYYhVDSP+CerAt2lUCi2u327wuufzhS8yu4XMZO34MEfhCd/5qfZ1C4I1fUZ6vKjESYHbcro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709017697; c=relaxed/simple;
	bh=bIFsVwQL46DjEIP2AR+ecrmAXcqU+ECDUo5rkzgTBVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/Hdyse9IlPutSnInkxvLPDChuF7NFgp9OKRxE/2oDsyzIdPCh3RbTF/B3aqdUuzau6SMHWDaZKNhhHRnvZiQlzU7EP1lIsBs6tIuVWaEeCv3ESoBZT/VRpWDN/sqF8u4M+eF0SLe4uV1ca2E4Lu4MbsPKbQmHw3hXrTgqFb6xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L4vVIGI/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-564fc495d83so4482679a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 23:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709017694; x=1709622494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIFsVwQL46DjEIP2AR+ecrmAXcqU+ECDUo5rkzgTBVY=;
        b=L4vVIGI/OunC83D1V/6Hmrx3hPG22hFXzu16Ia6ijyyAafNhhXsy2bgpBeQ266huJb
         lbc3cxz5QSyVb4DncbF/9wZhjB/MOcDuZ6X6CGSzpxlRhoStTCwhLcrzhq7R7ZhsRvx4
         pL9UdAYyxelzBpLVpW1xdlNDoPQvbpi93Oikqkd3nGubSf7hRXQpAvvXHlW3kuKDPfWi
         4QCDPqkt/K3JeCq09mi04C+NPNz2XkZoTy6sXE4+nO3c83ktfduKJ+vfP3EEDGMyIzbG
         WrcNi27DjqRgCd5HGraxist0HL+/kHKkkuH2PtpBAAyPDj2qF9EO5DQK8ugxXXoOVMEE
         3hCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709017694; x=1709622494;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIFsVwQL46DjEIP2AR+ecrmAXcqU+ECDUo5rkzgTBVY=;
        b=UpNR3H/0tg0zSwPk3ZN5SCg3flAhnWGuLFz/uaTKw1TsNqGgLV5zqAjjB4xGycPGWY
         QhsBwAOcktpPJ7j7+dG3HvJP8TD8PyiNvWKcVgJCf0d/5uu5KeJ4b6mvBOvOPjjV2Be/
         aJusDG8wd1EGqv7U7e156+J/JLJYmZ+c78JdS/Vybzvt156EoalqHtHBCJoD8iaP6Cux
         YqkD9d8L0K34mKKiZPMiv6BMYgOHlqyXiQN+8l0YFmQnRvLzk53fHyKSpmJxnq2pLCp4
         e6Os/Saeh+UR2jmwFkueRdA3vxBH/RreilxgYx/RKcXgs9tYDCPAkzWRDvl+bjWVksSO
         iM0g==
X-Forwarded-Encrypted: i=1; AJvYcCUKkKkLBsWz++I88CIBIl4GFsLhQlb2pmct6l4Ho3T+1rXz40qrCREl6Z3b2uApm147CyEy7zBpN1FGnIOWE8oFnlpxtsWb3kz6FpRGUA==
X-Gm-Message-State: AOJu0YwLDhlbVqL5NEoESRn32HrFe7Qvd9OWdZHCTD43yUtAGdGlRmBz
	oF/tHuzr7c2SKdRqBznX5G1lS+UKo8gLsyrtwF9sSRPMMxmlEXg3aX1ghwPykn4=
X-Google-Smtp-Source: AGHT+IG/wu9NFnuu+eGSL1p6GKOF1Rc4jlFzdIeH0RLpcJn2wVrJRCtXGpBFW6tDWDhylWbUXlPmoQ==
X-Received: by 2002:aa7:c898:0:b0:566:1745:162d with SMTP id p24-20020aa7c898000000b005661745162dmr2105988eds.24.1709017694308;
        Mon, 26 Feb 2024 23:08:14 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id ek26-20020a056402371a00b0056605d7e9a7sm473951edb.29.2024.02.26.23.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 23:08:13 -0800 (PST)
Message-ID: <a13fe273-8b5f-4099-85b6-b185ce106cba@linaro.org>
Date: Tue, 27 Feb 2024 08:08:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8953-lenovo-kuntao: Add initial
 device tree
Content-Language: en-US
To: Raihan Ahamed <raihan1999ahamed@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org
References: <20240226055615.79195-1-raihan1999ahamed@gmail.com>
 <170896502279.859050.12118817690939109079.robh@kernel.org>
 <CANt1HJsbYJS5p5i+WWmfMWkD5aBU67gNx9_Fi838w9x3CUPZZQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CANt1HJsbYJS5p5i+WWmfMWkD5aBU67gNx9_Fi838w9x3CUPZZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/02/2024 05:33, Raihan Ahamed wrote:
> I have checked again with latest dtschema before sending version 3 it
> doesn't give anything related to gpu and iommu

At least the second warning looks real, but the error was already there
- in the DTSI.



Best regards,
Krzysztof


