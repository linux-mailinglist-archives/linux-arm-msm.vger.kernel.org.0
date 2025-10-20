Return-Path: <linux-arm-msm+bounces-78043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AECBF25B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD182464D11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6DE283682;
	Mon, 20 Oct 2025 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IdUH978P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50989286402
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976910; cv=none; b=Ly5kQEwIoRw1m6csafZrRvs2Zz+IpE2GUpfHfLSN7R2WHgEtePNwWAGkr9xhohUZ068dIdJiOeWV3qeQ661MyYWHiN2j96ljYxvgbMvNct6lK4zOpAldNSNYthU4V/9by1N+DqHza2wqxkikCl34wmaiRAoGxSeyhSqpcJLlpeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976910; c=relaxed/simple;
	bh=Jua4BIwx1wftC9YUkccQgpopg9gTW50dQgVx8gQLv7k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Olr12WgcKsSUhAA1ecci2Jx1ALOIZje2mAuqjMl0tamORJFY+80dp5Kl92kwDsAkKQVYEE3kQwIHaCAhDpax9MWmXohHI1oSiUqQwph6o79WudiRLFeIHjetoOVCsITBXnilUEIb9wQiyDH4KBrRCaOfv859nP8RA1+Y8EL0HNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IdUH978P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47118259fd8so26550705e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760976904; x=1761581704; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sni5/6MbmNzQeyCmE1PCgBk84A0B0wyk3qAYIl/S1Js=;
        b=IdUH978PtIEnPcNnfYf0AbosmOVgeSuiNE/sUZIoNV6/30qFzPSYmIC/rRKylImZuA
         ZUdw+e918WMlo9nGKTYgh20oqbI7wqsqRcnSQXEqmk4cUY7OSTLy7s1TjFao78dFdwjS
         uRQw7xMznsVtXcLGdHwWWXwTdr0v1YL7Wu99dLqsqyPHfdB4vbPLks6FNQoZpk/nNdGp
         DoNy56o5dTxZI/YG5MpQCfbnFursh2lPhN+VU6Gp/UpBft9A7S7iQGUmOz7XRz0f4UoL
         hJZpYHziIRol4jidLH96XiFQfcIhciyBtfqkRIE0s/IJlsIQIoVBC65YiXhnR6pu2xeq
         l/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760976904; x=1761581704;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sni5/6MbmNzQeyCmE1PCgBk84A0B0wyk3qAYIl/S1Js=;
        b=soxxilzrv0KUa5jSFA1AI6i9WdRgYIUdGtoQjcCxxcSov2xJ67AZaQyHks7PiIrWG7
         sv2EV7pVUK2C4Grnf0jxprqFib0kVgb9hrras/ZluUMmd4aA7IcOgB9YdrFKZWbWSzug
         eqSqpjFYzWAwDnOyPKKpwT1Epp5CNiVlcSHBMUHwxq2P3aK41/cY7bV6dfFHdOdxbnoy
         VgsV3F3DUa4jZ0TItgemzuib6E3xMpUv8MUQ/2XL2jLOhgIGdmgpsRm+wfMo6F3piLEl
         mZT0w0TyCDZDUsoPDAfym8idI1ck7kW2omKaYmp11eMll3veVV1lKGR9MciT6C/0pOBg
         jwDA==
X-Forwarded-Encrypted: i=1; AJvYcCWoO7yrsYpdFNMjpeZtRmszPcRJF5BaJunwfW2bT/EdDhqwVQAEGBcsXnjnRaNQkUMaHPl0pGTN6Ply+1W6@vger.kernel.org
X-Gm-Message-State: AOJu0YxjWTf9VvibUbOfgMBE1jrCERbm1K2yPTYM4PDZ2B7RmzRyINkZ
	Hmlj94KVRISLJutkwOFrWLZYGX+MM0UWk4BaS4OKZ9fxsoiaABqkYL7L1xrmtbZoeHw=
X-Gm-Gg: ASbGnctSRaKmlZYA1TCXVl5ToIjzHutRDvsN6qt6yAVN6tgkapPpMeDviqtF0zRntM5
	zG1yz+44M8Vt4lC41Ru7WiQrYyjyFwgeiW9rcxepx47SjV0NvEHhsVz/LSmy2vPOW3b/fKegJfZ
	qH1HoHW3eu10/EOEKHqQssP15CWTWwQa8nc5SpqnG02+W3J/LKUrRpbb46UrY1+CmmOqI8mrGqY
	kwCT7qsuGJEMPA2GTkZ3hZqDRN3+chVrTrdzzTqSdMqw49IcgRILxDi0LWjpwPmilMF5KZEiHyu
	TP220AzRqVBMd+UQyxNmF+OsXX5fPjMnP26APJSSby4wLi3x4s8e+mKe+kjdOFMKjN2Kiyh7Bo0
	BWaTUeOz3YvyFSR9C/ELSYQdwRDh9UDYX6auKmfjKru6tCWMUvhidkYLfwn4xJZGblIc6XCdBUP
	gdW9G6O80+yLvUf4CwpzIIRcZU
X-Google-Smtp-Source: AGHT+IH+gc9K2IC1kig15CAHz3blcIpeF1+MZI8wwLj0FCfsFcBo1OSzfR+iD09YwCtZptUMS2gWQA==
X-Received: by 2002:a05:600c:670a:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-471179017f3mr85002415e9.21.1760976904492;
        Mon, 20 Oct 2025 09:15:04 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:9f99:cf6:2e6a:c11f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ba070sm16146014f8f.42.2025.10.20.09.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 09:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 17:15:02 +0100
Message-Id: <DDNA7OTLQ0GF.2YAUOG3GYV50A@linaro.org>
Cc: <perex@perex.cz>, <tiwai@suse.com>, <srini@kernel.org>,
 <linux-sound@vger.kernel.org>, <m.facchin@arduino.cc>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 0/9] ASoC: qcom: q6dsp: fixes and updates
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
> This patchset has 4 fixes and some enhancements to the Elite DSP driver
> support.
> Fixes includes=20
> 	- setting correct flags for expected behaviour of appl_ptr
> 	- fix closing of copp instances
> 	- fix buffer alignment.
> 	- fix state checks before closing asm stream
> Enhancements include:
> 	- adding q6asm_get_hw_pointer and ack callback support
>
> There is another set of updates comming soon, which will add support
> for early memory mapping and few more modules support in audioreach.
>
> Srinivas Kandagatla (9):
>   ASoC: qcom: q6apm-dai: set flags to reflect correct operation of
>     appl_ptr
>   ASoC: qcom: q6adm: the the copp device only during last instance
>   ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
>   ASoC: qcom: q6asm-dai: perform correct state check before closing
>   ASoC: qcom: q6asm: handle the responses after closing
>   ASoC: qcom: q6asm-dai: schedule all available frames to avoid dsp
>     under-runs
>   ASoC: qcom: q6asm: add q6asm_get_hw_pointer
>   ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
>   ASoC: qcom: q6asm: set runtime correctly for each stream

I tested this series on RB5 and RB3 boards and it seems to work.

It becomes a real pain to verify things on RB3. There is a regression
related to slimbus regmap and linux-next is broken on RB3 starting
with next-20251017.
The tag next-20251016 works just fine (after applying slimbus regmap
fix).

For the whole series:

Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3


