Return-Path: <linux-arm-msm+bounces-81014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE15C46C98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FAEF188690E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EDB310647;
	Mon, 10 Nov 2025 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZL2NNoAa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581FA30BB95
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780270; cv=none; b=OoIpc3Rux65FlptYHtIMVtr7nXpAMWMcDMKs0ZM2uTzmS0wxroEPQZXfgoIi9suDdWZP7X4WUKQUUOnG25q0pzxO1L7RkNlNB7rqir00fhc1iC2C2LFLzx80uJQVKKLRyvpHNFpWfsYtP+gcsuhmUKwNubslEiuHawk9y+J/xXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780270; c=relaxed/simple;
	bh=qJ9dEuHA7QP47k8+mFjKN7aiDkO2eEnpi3eRdL/AdNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJShGI7SjutqWbh5/mBQn/Kcu21T6px5+p/je9VipzgT5TsIaFQgW2icSFbV6vABFb6nGqVjXK1svy6+9qZYBVVIMzMjS+XNnTDuFP0O4nXifp2vHSzlNH4j3t4LEzOjUcIcO/89Ti0pt2gcZi1hae2FICUCR5V0/IuYFgpacEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZL2NNoAa; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b72b495aa81so341802466b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762780265; x=1763385065; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ9dEuHA7QP47k8+mFjKN7aiDkO2eEnpi3eRdL/AdNc=;
        b=ZL2NNoAa6FDc5JSFqbGFn6U12ghvC4doozDf5JzOQHf6N4qwwQq4sJOP2QK1vyhIzG
         eav8UGyaAgttIb0IhXsY/VDVQ7HM3Z08KAcr82MQSC8OEiUvyKMkb9v8zyGdwcVJvNWd
         AAzdR+kktaqfQd9fXuIAfQa25VtEg7+piAJ1Exd2WoRhwYHEl4VSLHtIlsRR13JL0Eyx
         My5xA9FKxwqTrD+wFQ1mfpDn1lYwnAnkki3fXBA/w52GnYbIVQ88bWtRC1Ccopemp7DH
         2HqhJP9MfxZdCHkOWMGFgLqHxfci+IQCDah0uJA2CH+3tSyTWg/3d6YbpgyxFGWY8xdC
         ftIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780265; x=1763385065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ9dEuHA7QP47k8+mFjKN7aiDkO2eEnpi3eRdL/AdNc=;
        b=mUcHesqiu97cJOVysPH12tRUWuRbEbkKBrfEcTI2YibT//m0gvdRN1BNmrxolHN5Jf
         1JXjFTgoG4Euwy0yIxkvNXawkH6ti/dVk3uaqYijPDt7/ZyTZOOziRt6G4Spi8aptcFD
         p0fRk8nJhl0tnPmmzmc3B1m5eKInOyLt3R1RXy8C48RQ8qH7LRQY5CVSzNAeUWKfHCp8
         VeV8L1AdzYvJwLKCwlHC2KXx2Ome8J+ci0IBLesHBYiN/nKJDhgcH04YE7z3TGUAO2nG
         4BKZtDZwaW6um+J0i8EusaaWM0JLFWGFLm0bzvWVtr39hWCuifcTxVoTt1VkM0pqaT69
         0JJA==
X-Forwarded-Encrypted: i=1; AJvYcCWlM6OLjq3MJsBW7DrsOEvYJqFfxYK5iAXhw07ywG2ugS51+6udEKQdYiEiV8FfY0qfSkILvfbkCDzJjmj1@vger.kernel.org
X-Gm-Message-State: AOJu0YyIU78RKALkdu/Bptr9u8yL895mumF94BQKhtu5gdaWwAdNmfkd
	SBbu8zHFY2xwfLyxftMRdUH4CgAF3FSoYv/PL3c60fQtwpV/8OP7kpxDzZnzcpOTM9Ze2VETsIe
	QPcg2lbVD5Zd1h+skkiR40s+I+iW60+403veudGcQtw==
X-Gm-Gg: ASbGnctWnufJjv6a90qQxNQsWJinrhK2FODfMJ/XvveWrhpbNhg9Qlfz+UNedizf0E2
	SMfCMlvT1PYcomPcFn3hikYyKLORpHwt7P+cIXX+rILCB6npE4G9ff+2gYnQMZAyytOphS9Yhdl
	1UDHp6Au4y4umUsqSVbZRBbcFj3q/N5gmxPzMZxZ9WvT82Vv60+AjBcl7ydm6k67aJacxotI29I
	VSAJPQEMEV5LyhsIxudmowxiJPr/miClxQiu+vd1z57a06bIXJHzIayyaJhauz90xqPrUinrY89
	iwVWX58RzhqKNhUb
X-Google-Smtp-Source: AGHT+IGPitg7K5XoZgRQkP9FaImCQLO1InXFpXMUt4u6tDzxq2I7G9KRZEGJLJgmks99vhYut7CnjxNMlDxBUQ3PjRE=
X-Received: by 2002:a17:907:3f26:b0:b3d:9261:ff1b with SMTP id
 a640c23a62f3a-b72e029316emr763218866b.5.1762780265467; Mon, 10 Nov 2025
 05:11:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 10 Nov 2025 14:10:53 +0100
X-Gm-Features: AWmQ_blKnASBsaS7hJ2XpHrQ-4sRSj2u5D16heHa45ya298_aUcuoaggfc-rRk8
Message-ID: <CACMJSevoC3xYoeodGYnY4_EFSexqbNLqT_7UbRu9DxDRx8_gzA@mail.gmail.com>
Subject: Re: [PATCH v17 01/12] power: reset: reboot-mode: Remove devres based allocations
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, John Stultz <john.stultz@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Xin Liu <xin.liu@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Nov 2025 at 15:38, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Devres APIs are intended for use in drivers, and they should be
> avoided in shared subsystem code which is being used by multiple
> drivers. Avoid using devres based allocations in the reboot-mode
> subsystem and manually free the resources.
>

You're making it sound as if there's some race condition going on.
That's not the reason. They should be avoided in subsystem code
because you have no guarantee that the function will be called after
the driver is attached to the device nor that it will not be
referenced after the managed resources were released after a driver
detach. It's about life-times not synchronization.

Bart

