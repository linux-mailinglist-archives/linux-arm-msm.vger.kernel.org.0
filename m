Return-Path: <linux-arm-msm+bounces-17316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE398A288B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 09:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 617051C2302A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 07:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321334DA1B;
	Fri, 12 Apr 2024 07:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dfw51veW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556114D9FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908437; cv=none; b=UZblzmz5jvZTTscF8QpBl58pE6ksjCJb5KfvuN8fY1NU5r2CbD6nwD48fCUxqk6pt3KA3OHGsQ9gHpszukpNz3UrmKPzybgfj9kkYwvZ0Dx4JTr+qlfcbSg2wftSDPhvCxvGTyyjrZVZ1RNszSZg9PxlnBZzIVLcM7jQSGhtKfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908437; c=relaxed/simple;
	bh=+BIRz40w1PCKmMO2wtU7DDFRbUrYoEXEr9tRma336A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4S4/UVtiPajSgsxgp+fjJKm2wLfiJ6oAaL7JfOZa6CnYhFu+dfCUk3uy9kQ+zJXkUdvAn+tRoxYsDs9/1rfeOucCVFppuW8Z1MBBBtdLCnuR/+fZxvc5QEH7MlWApgL/i6ustTZXJxG/2N1gJXn+2AH5/6FOghpuANYqH3dNLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dfw51veW; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56fffd131a8so118508a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 00:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712908433; x=1713513233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RzM6dFST6MTowNeFATbCFv+juTS+kCT2d3nPXhzUOJc=;
        b=Dfw51veWuu0iob6nylNAghEPZzhHVJB1JrvEbMJk/IH0l0Ilj9EFyY0KqLuyhBaWRA
         NygyRw4jW68lIZLNheoRep72tdK31oysA1Q5AtlDKBUR076xfECABvvM73Z8Weahjd1n
         OsFqkDbLED6U/+PQkOkkfOsfbRy8CjkmtI5b9F5g9fEPoATOOLXX5GD7NjBixTjxU+cc
         zCvNrKfXgtZHtlyQuQcdwSgkVSDRIpizZ99s/pAeWl0ELY3IjeRgvit/5bn3i2FgGQtC
         DnAukD11fVciZqCc/V3PGH2vaLedEEORje0/8quK9ef4RBWqY7AgD+qUgTmmllzzDPI3
         mQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908433; x=1713513233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzM6dFST6MTowNeFATbCFv+juTS+kCT2d3nPXhzUOJc=;
        b=DDlsHECoguAi0shNP8EfQBJCp96M8b0sV+udgdLG8gv710ASlm11gUgTnxb/eIbGxC
         /Fcx8ZSZRpRvxmbwQhATGBgx87Ku4Jd3FaKWW+spgSkPifFx2bJH9kig4J8vYcvwW5+S
         ef0JikfqeqcV0EjnyvjkRKPc1QoB2KeqbpjfjHX2gmWDmYwUJJcM6Q2bgvUXAMyeEE73
         cDiB33iQ+5cOY3ONCwOGjXp1ki0hMgRW9+W/KQAFRxFbIzh22UVvskJYEj1ovVuqO1+M
         eMOAAGk5A6srcusYkRkIzn0jiImEG0Tasi/OwZ9M9JYWkUCfy234c/+QC0FtIhhQ4Tc+
         SliQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo8pFTuwTSqznN3osqFNXHLxn6V9UEANXpHSAmML0u4x533JIHUFGM3pfW6TDusBeG50X1dgvFGA6NeLPp0kIPmQ+EY6WdhssdN1/dRA==
X-Gm-Message-State: AOJu0Yyt56daXFx3nOKcw1MHeULnnB9Eqfba2AFE4GAgwKOEHKK7qy+a
	N3uiG8Zn6NTqJIow988NeLUSBPpoti1SatPa0G11BT84L23xISWk4MfbxxDxmPE=
X-Google-Smtp-Source: AGHT+IHJo9Noj1BumEXH5oWny29fKEvKgw2utImwVpfaNDH8ddjvz9U+Ue1Q8sPDVqAZNqEYjELC0A==
X-Received: by 2002:a50:a455:0:b0:56d:fc89:ecf8 with SMTP id v21-20020a50a455000000b0056dfc89ecf8mr1552881edb.10.1712908433531;
        Fri, 12 Apr 2024 00:53:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id g29-20020a056402321d00b00570020fbedfsm69375eda.37.2024.04.12.00.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 00:53:53 -0700 (PDT)
Message-ID: <becac82e-aa5a-4ee3-83c7-17b8478439d0@linaro.org>
Date: Fri, 12 Apr 2024 09:53:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/16] dt-bindings: net: wireless: qcom,ath11k:
 describe the ath11k on QCA6390
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Saravana Kannan <saravanak@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Alex Elder <elder@linaro.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Abel Vesa <abel.vesa@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Lukas Wunner <lukas@wunner.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Pundir <amit.pundir@linaro.org>, Xilin Wu <wuxilin123@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240410124628.171783-1-brgl@bgdev.pl>
 <20240410124628.171783-5-brgl@bgdev.pl>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240410124628.171783-5-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2024 14:46, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a PCI compatible for the ATH11K module on QCA6390 and describe the
> power inputs from the PMU that it consumes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


