Return-Path: <linux-arm-msm+bounces-76790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7336BCCE5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 14:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67DC91A662C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 12:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470E32EFD8F;
	Fri, 10 Oct 2025 12:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRZMrdRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2642EF66D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099383; cv=none; b=QpmRfw1byPSZmM2a0EeKeG7jlOi+i7K2EZVoYHbIj23h2dzzQ4LKP9gQODjbwy0mA0HSyFvgwbqSFfB7ZI8y7/FN329MQZfKaQIMrl4rmRgzw3V0WLwLfg/PZsJSYxcAVJ45eiFfcjRjHJ5mR/Bm7k+WN5JULWoLHzIB0Ii7Dn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099383; c=relaxed/simple;
	bh=m1wtM/Q36F3ke3zT/mN2EGUWRd5HFQIpRI6HpOMa2zE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=rwjGuR5E/BcudpXDDZJwwHP3UzPYTuoyYissec4HMG+fU9I0Xh002IC0FbJLDZ8GVRecff9fxdWOCQBofprqXpM99BuKWcV11Pxtme5AiW8J2tM93srqJa/I1F53qP0fqeRAkpxe0ZbjMXUE++f4134P4ibKEY7LGeqUuxfPxck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRZMrdRV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso13381275e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 05:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760099379; x=1760704179; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYMGQwZbrkqXXfmRn4FZdpSz5oqSucZM1pi40huO1ec=;
        b=DRZMrdRV+Z7AOt2j3NT/pgUP4UzEXdxIMgHs7HJiAigBN8Yr//Fyi5ghKZLVI0KMr3
         vhCnf9VSuH+vryIkrv2rC77HULFvgki0QuED2mD4cExxEc4h6sOCOlofOLHEWg46sCRp
         TGl5nPoI67IHz+TmR/v4ARQo5MlUbtD+aWLjOHCWE9BfM5aht7ia+Cg9j819ea6TVC1o
         czF5uB7FK2+9iFgyoVe+MsvdILYnaANCXdbrKZXzaAgXtUAO9QWymKObPF1Mk/xLsMRB
         wI9JFgvUOf5z3i0PDsOlgmoyFA+o00csP/DY6IYojpg99CeZ0QjSoJtdDu3+vZ5UT+GK
         Rwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760099379; x=1760704179;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vYMGQwZbrkqXXfmRn4FZdpSz5oqSucZM1pi40huO1ec=;
        b=NMHy6ecLXEFBAt7Fq6zgL6zwwu7ShUIOG2hoKL1Nk7O5zcowogrRxsqWCmklp9s+g6
         ub1DAdSHshEUR5LPLACEVOpbMN+G6Q5QlrJ8Q++xRTwZjoJvegd2Xcmw/VmG52hRTgi3
         FRIor+6rkZyCOCfVQDcxlqoK2fDZRHCBg0r4hmewC/IDHrUAaHfORmbc7otpmccsC+hY
         g1plWd/pkP9Zfd2/1K0+kdyQaIUyLZ9q1ftrjlO4/Sv+dENNk4xu1LBeP2dxuKlAvMa1
         hTg0jJAnKb8OeO4gJwHk21wGXM9BWndhDNoP9GrInb/06Hk7O20Hw/TV6NUJiBZ9bWim
         6RfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc03FLBp/cFmd+rH45nbV/1iOXBnbYrMttB+VfP+Y4239AVnwVn29K53G6nl7KUSmE+9LDB9550Kog6+Xc@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVy7E+CAvoAteuUefQil3YnwZmn/iMbC2OXmFc/u3VL2solCu
	9MQ15gOBi7KMx1TOWgvZh6ze2Q2+OE5IXAY0GxnCQT7PYmMaBkL84adqfcP53tb6CIs=
X-Gm-Gg: ASbGncsSAjE7IQCj8NnVRHbCBAr47zHgIO8DuFeHUXcQDfo3Hq7SN9m1H+cuBkfMwYQ
	7Qpb3/MSpaTHxPmEN/NXYI9MuvRHO8aMC4V9RdvilR929EbTVESwOe5B3vLoyQmpAiG3s4l0UvD
	6ZiJGkL+qW/99HputBrhc/L8zezkzGJjjT+xAOEkp9mOa+VBcZ4IULM3b6fgUjLmc0BlKCJQBjs
	9sXa3IyQNZ23OF+Y/tV9Zn3IuGp1yDLuxbmpNfCFO+J60P+tUk78Q0YdUydL+3skYMVccWGL08i
	PkIqbCEimAVOLHHw2b17GZAygBkIzdhGL6nkL3bxbEk402JdaCftDuWOHPgPSfG3skQRXywIMTK
	/Xp7p44JxE+g71BXDZu7dy0UzjDGVGhJCKOfQr96WA0Dt3ar0bmNxTl9iwH98ygNLgIMzaog=
X-Google-Smtp-Source: AGHT+IGoFKx9FL3rwMgBVIjzsX+nvkrUpEkSRitHHR0xBr1fRpbwIRCWVFTLZ13CTdC6I1m0m5CVFw==
X-Received: by 2002:a05:600c:34c2:b0:46e:21c8:ad37 with SMTP id 5b1f17b1804b1-46fa9b06d3dmr72900375e9.25.1760099379460;
        Fri, 10 Oct 2025 05:29:39 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3520sm62462795e9.2.2025.10.10.05.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 05:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 13:29:38 +0100
Message-Id: <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
X-Mailer: aerc 0.20.1
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
In-Reply-To: <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>

On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
> On 10/7/25 4:03 AM, Alexey Klimov wrote:
>> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
>> controller device node required for audio subsystem on Qualcomm
>> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
>>=20
>> While at this, also add description of lpi_i2s2 pins (active state)
>> required for audio playback via HDMI/I2S.
>>=20
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>
> [...]
>
>> +			lpi_i2s2_active: lpi-i2s2-active-state {
>> +				data-pins {
>> +					pins =3D "gpio12";
>> +					function =3D "i2s2_data";
>> +					bias-disable;
>> +					drive-strength =3D <8>;
>> +					output-high;
>
> I.. doubt output-high is what you want?

Why? Or is it because of some in-kernel gpiod?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/arm64/boot/dts/qcom/sm4250.dtsi#n66

>> +				};
>> +
>> +				sck-pins {
>> +					pins =3D "gpio10";
>> +					function =3D "i2s2_clk";
>> +					bias-disable;
>> +					drive-strength =3D <8>;
>> +					output-high;
>> +				};
>> +
>> +				ws-pins {
>> +					pins =3D "gpio11";
>
> Please re-sort pin entries by the gpio index
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-o=
f-nodes

Ok.

Thanks,
Alexey.


