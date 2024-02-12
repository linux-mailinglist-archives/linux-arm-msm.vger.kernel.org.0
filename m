Return-Path: <linux-arm-msm+bounces-10608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6685D8511D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 12:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DAB528304F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 11:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BA72BAE7;
	Mon, 12 Feb 2024 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LCJ+gD7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB44439852
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707736130; cv=none; b=j+ORjTRFFhv4Jsry5zMCE267mJht1ixGzYCcdZxh5EjqWxeycjNO8oAB5rwi+swj9wxnKJgUwrxVgqd+kPxEHm4Z3JTVZ4K4imgheDYk8Jw8FTiCC986Wmq5cynMQ82qO9q6uwTFDM5PKp3e5+US1eU5LC9nlwiOPmeHuLz/r+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707736130; c=relaxed/simple;
	bh=n92GkiDReL8CCFyA3rCLlkcAeLujOh9qBwWHph2XbTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rYtkXF7+LzDrGZnrpf/VZAjcyT6IghQ6TzsvmO8LUHSxclUgjK/oJl0Ck83Ekp9p9tJVWTen61kpyggVz6us+TfOJxAnviOO17t2nA+Edr8U9R+eUjTP4wNufe06/zxkGDdBxlzCMqH5/au5HZ6qfKYFjaBNWVPH5Z4+FOhN47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LCJ+gD7l; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5116ec49081so3267709e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 03:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707736126; x=1708340926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAU4w67BrRTiADQwdhUXbRvbzOayyMCDZnY+MbnEgTY=;
        b=LCJ+gD7lHxydGP+kUI1aWZHdrjSVX+pgLfnAoaCqmV+7Lt6sfmv+4hMsH5UNYEJBQx
         CIKR/JDNqhpgnUP+qaBeII5K7YIVeWR8PevTysxVwo7ojv6MREJJPqbSRCAf9RPVqpQu
         RK7PMiblrsA5nDfmUNSjDk0Z4RhckFotkqkOAtudkDcKVQDhsSIpOb3X3pRD4NV3ERnv
         vo9VqsHLPbJeDt+OdrWCLHrf33a8eUFc58b2dQnVG/PSbvxsgyAUCExXSDV9TL/VjIhi
         1o1+NxHp9+ShCaYc//M3GfHO69WPWcmTl/Oo5fe/iIlCIzgnieGF5mQfAXYF/V+mBzme
         BUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707736126; x=1708340926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAU4w67BrRTiADQwdhUXbRvbzOayyMCDZnY+MbnEgTY=;
        b=DELbWxuoLYlgJRc7A4RfPZ2g+K1ueGjmVDXOHVxgA1ClONhi1n4wYc/byk4nvl8lQz
         j06sY9QVNCORZuAwUgiewX79rQqKCbH0mnDD7ZVhXKKrUSybY/qM6cjPvbL+cr2JwpyL
         MzvTPTHwHgfuwmmKQfh6Hlroo50aw9ylDUGQX+F0+nKeX4rrow3mQdIhGnGrT/MVAKqN
         o/cqcs4RmObhdlitSSeb5WOBLkm13KBfav/m5p6GXrE0EXYM9zlf+YnPFQ7gTl7sXaGq
         f0K+FgPuQZnT6EF+K3GuCwMnvq4joqg/l58n+lVJ6bM94JplmUUzcA9UrQXIcCnNER8M
         co6A==
X-Gm-Message-State: AOJu0YzAC87ya/FNsu/pVnJ99TTxkLO33+gQ+Y0Wqjb6Q14dqjGETwtn
	0mYk9FgvV91vaFhV8lZah/sQ+bQFT89uMCWfB24i2QIhEmnt4LJXzx8JkgGu4rE=
X-Google-Smtp-Source: AGHT+IESxLd5VM7+jgajUm8Zu+3qzVE4/h+95oxkCBZcRTVcRBuuk98MWbO9kmYxTzIhXZ4eAoZEDQ==
X-Received: by 2002:a05:6512:783:b0:511:8f67:352a with SMTP id x3-20020a056512078300b005118f67352amr1110465lfr.60.1707736126024;
        Mon, 12 Feb 2024 03:08:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEweCbwn1TTwTfpcyTzNt8p5xkXTd54bQBZeRJEQmh8i0vDvY82+lsbU9uo9HGvBS9cR956R4yTTvAIDpRol/U0XVh8tNtPR/aI3mqetO5RkiywknMqXZXF2sfq3JU2geA0M18YHMFeRPhKZu0+JYUZ36PXPMXVhmIfEVake+vqj0ayIEV03a3l+ic9xlNr+vHj/01m2wI+WGND2dymlJOM2wLqB4xudaUuJuJmWOEc6gmd0Y3ZBcTyqp9wcvkA76lyP4vHMjpqDUY9R3MenbfT+rNQmPk4qRD
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id z11-20020a170906074b00b00a3a40b7ecdbsm99569ejb.69.2024.02.12.03.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 03:08:45 -0800 (PST)
Message-ID: <9baba05e-6000-4697-ae7e-e423c392f9eb@linaro.org>
Date: Mon, 12 Feb 2024 12:08:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-pmics: Define adc for
 temp-alarms
Content-Language: en-US
To: quic_bjorande@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240210-sc8280xp-pmic-thermal-v1-0-a1c215a17d10@quicinc.com>
 <20240210-sc8280xp-pmic-thermal-v1-2-a1c215a17d10@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240210-sc8280xp-pmic-thermal-v1-2-a1c215a17d10@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.02.2024 05:42, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> sc8280xp-pmics define the two thermal zones "pm8280-1-thermal" and
> "pm8280-2-thermal", but the related temp-alarm instances are not tied to
> any adc channels, and as such continuously report the bogus temperature
> of 37C.
> 
> After previously defining these adc channels across all boards using
> sc8280xp-pmics.dtsi, we can now add these references.
> 
> This does however mean that we have a non-disabled node referencing
> default-disabled nodes, requiring each board to enable the pmk8280_vadc.
> Avoid this by marking pmk8280_vadc okay.

Thanks for addressing my P1 review comments in a way that indicates time
travel has been achieved ;)

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

