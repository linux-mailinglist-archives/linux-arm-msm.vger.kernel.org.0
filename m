Return-Path: <linux-arm-msm+bounces-14289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8D887DA11
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Mar 2024 13:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81AF11C20B02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Mar 2024 12:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD08F18AF8;
	Sat, 16 Mar 2024 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NcotFaW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90AE18AED
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Mar 2024 12:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710590893; cv=none; b=M6hL9iv6K8eAZ9cvy7WHZE8eH+V5YIpjdB1ItnVPNmdOu6K3AZIEmhlIC9LPz6+jc8+OFHJNOm0ZbWWA7yVPxviSoeZ9Tc330hLRQtpQwdNQfuf8uuuNW8fwrXdqjImzT/RZPK1UYcEZ27SlSjX36/t+ytH35fOSf3g6XoRgGWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710590893; c=relaxed/simple;
	bh=lOLo/MNfzxLJ6WfvIA5d9qx+T0I5n1LR8XctpmkR9ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NpQZpeue5OO0Z7ExDx80PT4P3RtWi+j9wCTzkGsr26NBsKconH4q0EU5MRbaDfG9NA+WYKN8Cg1z+zTliPwgbzjiv4FhEQcathCoiCxqmMZTb5kA+WCMCdKYSaTO8oGXPlSAPgRlLhY2iKQ4EcTfTk4XzQliaZBp3ueRL/tB0pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NcotFaW+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513b022a238so3607594e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Mar 2024 05:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710590890; x=1711195690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gBQn+4o33fa3usgQAoaNIQyP/sacMzy6onFIQRcXAHA=;
        b=NcotFaW+G94GjGNVkaWkCZowO6sJj2gkN2YMVr9CeF41mGQosp9pUY+g4oVnecetz5
         pJc3IxCVxTN15FUuTEb7Rcs0Lb83FD08R6zEiHpJ1JjgvuwuGzvI8fDuxtHMLst/jdOu
         vRLOOddnYvCJUwgtfQ3Hj4Id1Ct2cfGwpMtqbZyMRC7ZDdz1dwQ32+dTtrG4nmABhRKu
         kiSy/gR3hgGSm83kC9Fa/f31xU8zDOw6QKkzGbPPdJa4+sZcIt2CtyxWZujrmZvtNG5q
         jAzAB4JZDoQHG7uU0oVwDzHJ5uhnIU78Z5ZSBj5BkahCgW0Cgf0O9Y8kW8Pn2YTqvONl
         Wg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710590890; x=1711195690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBQn+4o33fa3usgQAoaNIQyP/sacMzy6onFIQRcXAHA=;
        b=Wy3xbYJvXec+pYxoiq1c6aB5n/H8zDyL17UZptw3tohWMKWBhrnx5u2e3pGVHXLguE
         BSwWzwHdvyxn4TZERU9eu67635eXau59R6sIDuOrIYGEGPvLs4Dtqr02fFVCfafDkMBC
         uXptiLfQmFi+Pg7cm3rjP7EeYVRYHlzk1XNHail3y2B0wAl4nEEQIsXQ+/kEkvVo6Oih
         bj5SVtKkK3q4p0uI2AgjG7ykox6G2tmX7gaRA/59VqcR4prYEYOhz0Jh0ewvwnPQji84
         F2k5Z11eKurXaFHj6Sh2oyTFr4Tdkb8vfvdJ+Q1ieDe2CuhSRd1Q1G+1eUhZM5lb7y6u
         K/cA==
X-Forwarded-Encrypted: i=1; AJvYcCXslDODle1Le4uCCzdUmHZriZDgAXsbWG4qxGP8vENSgNCFZuoyPLbrDO8GXU8i1llg6rN3J7/86dK3NM7g8zYIaJY+JRsDi5yqaEedDQ==
X-Gm-Message-State: AOJu0Yw3Flofb58aY+0h2lZCDxbRlBCf2bz9hzvL5J39Uzxkni62lag9
	SeycXufOAjUB34vIPkbpafoK198m4gLC59vRxVdnET0dv766Ib5kVQ7AsXznEFo=
X-Google-Smtp-Source: AGHT+IETHhE2krTe+L4sEOdBQlVRhR0BCKoPhwiB4W8KP8W6cMoFtA095QgnuHEnxphTSkhsDSmAAA==
X-Received: by 2002:a19:9142:0:b0:513:d5b5:78e9 with SMTP id y2-20020a199142000000b00513d5b578e9mr3793878lfj.26.1710590889797;
        Sat, 16 Mar 2024 05:08:09 -0700 (PDT)
Received: from [192.168.223.169] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id fb17-20020a056512125100b005135cdcf4a4sm950755lfb.32.2024.03.16.05.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Mar 2024 05:08:09 -0700 (PDT)
Message-ID: <a201b559-473c-4020-88da-2ab0589723b0@linaro.org>
Date: Sat, 16 Mar 2024 13:08:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8998-yoshino: fix volume-up key
To: Sebastian Raase <linux@sraa.de>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240315225237.1616550-1-linux@sraa.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240315225237.1616550-1-linux@sraa.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 23:52, Sebastian Raase wrote:
> The volume-up key is connected to gpio6 on yoshino.
> Fix button node ordering while at it.
> Disable pm8998_resin, since it is now unused.
> 
> Tested on maple and lilac.
> 
> Fixes: 390883af89d2e ("arm64: dts: qcom: msm8998: Introduce support for Sony Yoshino platform")
> Signed-off-by: Sebastian Raase <linux@sraa.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

