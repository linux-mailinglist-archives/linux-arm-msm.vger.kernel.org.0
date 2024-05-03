Return-Path: <linux-arm-msm+bounces-19164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A755D8BA7FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 09:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BE291F221F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 07:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C692147C78;
	Fri,  3 May 2024 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zh/El5T1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CB01474CF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714722057; cv=none; b=Tsnyfi0EpZHTxkvQSxqamdRLt+OEP88SCL3fOrJ7wfzzS7yiqAy3vDNwDx4GimfcL14gCUXoU5V914lmHvjEUpeWeqtMT67nJaucXMvw5phcGCt9FrTD2h0twbs/rP0VIueNT0fBSZYRPyO8h+QpAh5GS9KPM2HQgSSVg4rzB0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714722057; c=relaxed/simple;
	bh=gwHqss5RZXxGpYDwG7VlRCS9SdIL5vWAxoW0cWn/H2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OF1GWQLjf0fPhbxb2Tv/J7WcgqW5fNxtRgNenRxETu5YkhCHYSnX23DcOH+fp271mr2+9VkS4q1sP8pM6oLabzLg6cn09/Cy4Jz7/v1JDz809OCUK5dog8t8whQLV1LTEDMam+CyT9fMMXih44bkqeGJAUoak/2+x+p6N7KrSUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zh/El5T1; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-de54b28c41eso9837846276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 00:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714722055; x=1715326855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwHqss5RZXxGpYDwG7VlRCS9SdIL5vWAxoW0cWn/H2U=;
        b=zh/El5T1BqVswezu0/H71E638/RyGI5sdnHS/2bzQMCFzplcs9t8Ix4upxAW6z/EUV
         w5LJekthcxGnES/sZ/3rRtBqZh7e40rHt4QbXKYo/s+/j5n/h6Epk+G5cXV7ajlp1uEv
         9GtHm35g67Ri9zrcT9iseNmCgE6cbx2IEBz/abpolKACCbmq8JvPktEprJW3KWI6SAqo
         kyvcu+yRa4srcVzNMc6wZPVqeB23j9rpFhc00wzHu07li3U8Zpo43tyh8mnj9GtUZzUM
         RwB798TbB46ibcX8t4wdTjBLQpoAs3ZFNj8QDVHcGEt/K1VJpWM+8WUL5SowskifN/An
         GGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714722055; x=1715326855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwHqss5RZXxGpYDwG7VlRCS9SdIL5vWAxoW0cWn/H2U=;
        b=JVghPVx0AZA4jRlukXjD3TjNlQNQeJm4TJjj8YWanPDCx/Afb+WOaW+RmXx7Z46ESs
         7sdHYtE/B2M2MlAkVYXS4nAzXgIBe1qRwfp9vNI+qmXrmM3qnT7nLWJ08TY9uN/zbBEi
         VWK56gReCDs7FkRQWaQcxMib6i5I3O/llX4F7DCoLKKPP4/pvSG7KfZOkR9ydIew1BZE
         MRcaEDBQb/dDfdDLD9G1zmRLF94HzaHs6KjGR1B31R5YdYoHQKybGXfkLUa5yH4+jcdC
         UKPaNXIiA6MHf/3fv7zWAAkB1ZcZ7PZUjDdIJCAjUoa+bj9NS0Gn3Mqy2VhI5bN21BfU
         6cdw==
X-Forwarded-Encrypted: i=1; AJvYcCVox76NDxx3pEMw4Z5FMU/hFXDx6ZS+cRDtxvlaKOj1LtO5Ha59pFWE5Gvlye/e0YfZdcwSpGpe/n36oS+ESgOG6B81M7XBdMDt/aEflA==
X-Gm-Message-State: AOJu0YzdvNpY7UW9akS2NLvm2j/T4veRtEK8koCXERQpycAE0Yt16H3f
	TU+4AHvkXbGeWfPTJu7wh57rN6ZL35Y4EsEtuIrWh9YXLpTnU595v3VjqwhLblmfbB0Uf0rBGDo
	g8uF54TC+qv7fAIZFo+95y/dDGeEWOehqVJ5SXg==
X-Google-Smtp-Source: AGHT+IGKGwRhNfzN2iXJoJhXvjSPiHyUquPE3ouCPy0eWG0y0CwM0ThM2Op0QFyOEbDftKVb65DsDUY5yqJ+5H4Fyho=
X-Received: by 2002:a25:b285:0:b0:de5:5919:c9e8 with SMTP id
 k5-20020a25b285000000b00de55919c9e8mr2264670ybj.52.1714722054894; Fri, 03 May
 2024 00:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423134611.31979-1-johan+linaro@kernel.org> <20240423134611.31979-4-johan+linaro@kernel.org>
In-Reply-To: <20240423134611.31979-4-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:40:43 +0200
Message-ID: <CACRpkdYXfZwBdLSTTPbruD9qynOPuQBOZjCwA_6eE+1MUBCkgA@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: HID: i2c-hid: elan: add
 'no-reset-on-power-off' property
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

thanks for your patch!

On Tue, Apr 23, 2024 at 3:46=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:

> When the power supply is shared with other peripherals the reset line
> can be wired in such a way that it can remain deasserted regardless of
> whether the supply is on or not.
>
> This is important as it can be used to avoid holding the controller in
> reset for extended periods of time when it remains powered, something
> which can lead to increased power consumption. Leaving reset deasserted
> also avoids leaking current through the reset circuitry pull-up
> resistors.

So the reset line in this case is a GPIO as seen from the context above.

To me that means that the line should have the GPIO_OPEN_DRAIN flag
set in the device tree node for reset-gpios. As it has pull-up resistors,
setting the line to high impedance takes the device out of reset, and
thus it is effectively open drain.

> Add a new 'no-reset-on-power-off' devicetree property which can be used
> by the OS to determine when reset needs to be asserted on power down.

If the above holds true, the driver can then just check for the open drain =
flag
in the reset-gpios phandle, and if that is set, conclude that it should not
actively drive the line low in the poweroff state.

I'd like Krzysztof's input on this though, as he's been all over the reset
code recently and knows it better than me.

Yours,
Linus Walleij

