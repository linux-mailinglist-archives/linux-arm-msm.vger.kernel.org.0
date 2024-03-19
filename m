Return-Path: <linux-arm-msm+bounces-14572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECDA88020D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 406A81C22F65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD1981AD6;
	Tue, 19 Mar 2024 16:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F7qhuycy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A608657D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864960; cv=none; b=YD9TPxKXVkXb4SuWiT9rXgYFVZ7n+F2USZdou9F3dJP2gIheDHuLDBjUxkNAPmQMzcKoNO8HeBCMJKpbAxhLIj7HcNkwLFAAeiLy/jz8ojnQV93/rkDe68ZWylA4QbIxJuRnJRFcMpnxyx53M3gVy2HyoVFesS6vY59vVhuG7aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864960; c=relaxed/simple;
	bh=fKSF8pzEMf4QAy0lGBTclAV9vz3vznJXW70/aPT4oU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dd3zh7Exo/Ty4Dc8wBlPnhndkf7Uehc3TTqCQLmnVWClPxJrusw2ZzooUdrl4CKKjo+k58q7qmFcIMUsZhlsZzihgIyXZyeVgbAW+RarEiSwh7ChFiHk0DUh5S4GxqcLlYWqXGw2cK1Vo0hQ4/6lr44pz5u5cAQjGE6bpkWZX9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F7qhuycy; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-789d76ad270so333555685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710864957; x=1711469757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfOND8/B1sy+/Pxonj2Y99N5MbJN54ZzelPtBRESoQk=;
        b=F7qhuycyqEM07GcSjZVwHJw+iya/hg/y2wQlIpPk282CaDpyA0J6ckUv7AaT11hKO7
         xME8D29pT/6749oi43QqDA6Kl7yxbFEi9c6rBKuKwNArvtXzmSwB4SLPXRsgrJjRqp0c
         mKEk9kwXJUblykj3/hx/VBIiGd5gTq84C6vo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864957; x=1711469757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfOND8/B1sy+/Pxonj2Y99N5MbJN54ZzelPtBRESoQk=;
        b=WdanHpic+JRId/rAMG/uyv1pqKT+oDxjk++BfMUqR4N+XHOVIhtcqUv3Cw7WWCJwDn
         zOld3OQFLMWqk5FMMzR15oWUr6dTeGdMhGefIFHIpD6iIp0Tu/bXC839elRjC0GU9KLY
         r4c9CvNjqWxvpHWOJb/UJxmL/ZuOs2JDL74Y8xk4Q12ztp3BCxeya5p4AOVc0pyNiml0
         J8jTQbSxK0KtfVTKNEgNwEwew23xXurbmPHel3dmA9dvJ2bh344JN4G+//2n2DsssfnY
         OhMM08JUiEe8/SX1yXhLoetrs9z/ei6xhLgMNrmEeDOFHZhzZV11gq4OfC62/b0I5miQ
         OCWg==
X-Forwarded-Encrypted: i=1; AJvYcCU4k6WQs12Udf93WYB5nPVJPO/mb+/K/YZit003ZugjrYgUAJ4OxCKHAUB7WlFAlhgGI465sgqIKquv7O2J16wIYfA/p4j/1GTKRiRkTA==
X-Gm-Message-State: AOJu0YxDRTHR/XI0dO7RoZR9tTMo4WgqHcMe079uNUIkF7oBRfMqHFkf
	5LkExWVnltPX8f6ZRaRqNiF+AOcKcKnR2aKWyBRZ5yp7gSaquIyolBK4GBNspLAlUZkMSrj6nv0
	=
X-Google-Smtp-Source: AGHT+IHoPzVMqPbH87eOItC8Sx5imO3nyHX7hs0KfIcu6CxInp7jus1x5Fh6VTiJzX8M3gb5a8KJ8Q==
X-Received: by 2002:a05:620a:124d:b0:789:e26b:50c with SMTP id a13-20020a05620a124d00b00789e26b050cmr15005263qkl.77.1710864957534;
        Tue, 19 Mar 2024 09:15:57 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id y12-20020a37e30c000000b00789e72b27fbsm4023255qki.120.2024.03.19.09.15.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 09:15:57 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-430e1e06e75so437741cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:15:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiIZmG1ZIWpyuJC5Ns4JcgQGaF53KzTF727tSX6qcFc838eCgDkd1WQgsZ25r0mhmkdNxYQhLuTbhH3MXsSh+GEBgAyY2RTZUGKRNJ+g==
X-Received: by 2002:a05:622a:1648:b0:430:e26f:4bfb with SMTP id
 y8-20020a05622a164800b00430e26f4bfbmr262803qtj.19.1710864653792; Tue, 19 Mar
 2024 09:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319152926.1288-1-johan+linaro@kernel.org> <20240319152926.1288-4-johan+linaro@kernel.org>
In-Reply-To: <20240319152926.1288-4-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Mar 2024 09:10:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqwY07fMV-TuO8QMRnk555BJYEysv4urcugsELufHr4A@mail.gmail.com>
Message-ID: <CAD=FV=WqwY07fMV-TuO8QMRnk555BJYEysv4urcugsELufHr4A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] Bluetooth: qca: fix device-address endianness
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 19, 2024 at 8:30=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> The WCN6855 firmware on the Lenovo ThinkPad X13s expects the Bluetooth
> device address in big-endian order when setting it using the
> EDL_WRITE_BD_ADDR_OPCODE command.
>
> Presumably, this is the case for all non-ROME devices which all use the
> EDL_WRITE_BD_ADDR_OPCODE command for this (unlike the ROME devices which
> use a different command and expect the address in little-endian order).
>
> Reverse the little-endian address before setting it to make sure that
> the address can be configured using tools like btmgmt or using the
> 'local-bd-address' devicetree property.
>
> Note that this can potentially break systems with boot firmware which
> has started relying on the broken behaviour and is incorrectly passing
> the address via devicetree in big-endian order.
>
> Fixes: 5c0a1001c8be ("Bluetooth: hci_qca: Add helper to set device addres=
s")
> Cc: stable@vger.kernel.org      # 5.1
> Cc: Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Tested-by: Nikita Travkin <nikita@trvn.ru> # sc7180
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/bluetooth/btqca.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Personally, I'd prefer it if you didn't break bisectability with your
series. As it is, if someone applies just the first 3 patches they'll
end up with broken Bluetooth.

IMO the order should be:
1. Binding (currently patch #1)
2. Trogdor dt patch, which won't hurt on its own (currently patch #5)
3. Bluetooth subsystem patch handling the quirk (currently patch #2)
4. Qualcomm change to fix the endianness and handle the quirk squashed
into 1 patch (currently patch #3 + #4)

...and the patch that changes the Qualcomm driver should make it
obvious that it depends on the trogdor DT patch in the change
description.

With patches #3 and #4 combined, feel free to add my Reviewed-by tag
as both patches look fine to me.

-Doug

