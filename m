Return-Path: <linux-arm-msm+bounces-14538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A50880184
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEE3E282227
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178B781AC3;
	Tue, 19 Mar 2024 16:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ES9j3iV2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D2208B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864643; cv=none; b=ldNt704d4tuOpF/AN30B9UOwQHUPHfnfF+I4QWPTfj5zrfOyQXjZJK8eBAhF/C7bWO5TzgRHV/CQgqx94gT+xMj3tE4xZOlk4ePGyC6q9Uk9hapzLUkUy+qpZmvXZHHnf3GhwXryb+NQR85DqtLG1u/9kBNcXmM6jK2CK6R8T3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864643; c=relaxed/simple;
	bh=4BDyA1fp80l7JzPfJ1e9Vcia9HkvY/RtUdxfuRXBrig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQthsZmLCDD+ixrtOkGGrNDy9PODWRlFnn7LTgnUpKfTxynv9vTP+8Salu3Bw0xp2+xLuwZ6IhED879h3lQPf0munZ7+LWyDgfU1QV3gEc1xqUvb772mA+L1Qn5R9E23jx8NEt5SuNooXCj0D/2QaijLC5PiJqp2ILl+0Gwq+3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ES9j3iV2; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e6775fd386so2991828a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710864640; x=1711469440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L6WBF/yO8q1qFXY+u+U+qwB52PYKW+UCvdVhNRdhUs=;
        b=ES9j3iV2JBRMkvAan48pxSiBUveza/4c9K0/dDfwc09aOzmZdkhz1smErukihYnfuj
         NOoc4XxH9Je0U6HtJWckEac3HeoMmqKcVDGP9CEe2H5MT1YtM1IJyksu6P377sGaEXrh
         GRfCrPYB1a+6U9elDBRxvJS3okcwMc4hdktyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864640; x=1711469440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/L6WBF/yO8q1qFXY+u+U+qwB52PYKW+UCvdVhNRdhUs=;
        b=Tn6KexB5DyD7PGC4iVoNNqVKPYiXhgjyBZqkxl1sUlPkSzOZC4rDpbSmwp8pwNUPq8
         XiyiUq3aLYH1Ih57vjke2GlbGPly9g97QLLmTm7169v9WCKnqvsbAN6uoVGff19QSA28
         nBQVWE7q1F7TlXq9o1htTuP+x1SBQbSpAzeCC1ZgAbfNbpSITNAaaLaFL22mXY6/4lhF
         Knk8lN36MdWKfL7tdngSRiAgmavUxSrxDe+vdNYdXLIQOhMmwQa9Ba3kyl2PJURTnltT
         HTX2YI/Pwf47bSUnGZZ5kCjhN/Gx04zJwoSU2JldD+oeCtShjWqpz6lQNGRxq6i3qd4F
         AOUg==
X-Forwarded-Encrypted: i=1; AJvYcCUonZfwAZNq/5Pd1e/wRO0WtiQ4DZ2JzQTbcCBC79A3LlS4nM62Exi/mLO1kWSVKm5ODIAkx0DXy2xGOMB+Z9K9aB6ZVXpt4/p9SxiJNA==
X-Gm-Message-State: AOJu0YyFJGOgRmMfX7PAt3WS02mHblpvLgAr4hKsk2A0UfaWcKTMO9si
	qmTzyCePRdEuUai6g4WDMVM7gaL/d+JiurOROMeh1Q0efJug07iMNVrWt6oOONEEyGGdmCHx/Qw
	=
X-Google-Smtp-Source: AGHT+IFj4xnrHOdeCA6pu1Rq6GAOR64MPNnWqTKveuciqw0a6xkH6IrsjDbRfDsYvGuIFAC2tGLvGA==
X-Received: by 2002:a9d:7851:0:b0:6e6:9783:bba9 with SMTP id c17-20020a9d7851000000b006e69783bba9mr3031842otm.22.1710864640568;
        Tue, 19 Mar 2024 09:10:40 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id x14-20020ae9e90e000000b00789ea3555acsm3548899qkf.19.2024.03.19.09.10.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 09:10:40 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-430e1e06e75so434841cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:10:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBI7W8Rbx3puLFR1Cx7Ikx7ryEyoNJPp5xqU92yoKLoyV8CPXWYkEtR+byDFh9NbOrRKTHMma953PtcPTBiQ7kvKIrY6AzDgh5QOaBYQ==
X-Received: by 2002:a05:622a:11d5:b0:42f:3b05:dc8f with SMTP id
 n21-20020a05622a11d500b0042f3b05dc8fmr390619qtk.8.1710864639829; Tue, 19 Mar
 2024 09:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319152926.1288-1-johan+linaro@kernel.org> <20240319152926.1288-3-johan+linaro@kernel.org>
In-Reply-To: <20240319152926.1288-3-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Mar 2024 09:10:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUFodCAXEJgfpSqZZdtQaw5-8n_-sX_2p6LuQ2ixLRpQ@mail.gmail.com>
Message-ID: <CAD=FV=VUFodCAXEJgfpSqZZdtQaw5-8n_-sX_2p6LuQ2ixLRpQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] Bluetooth: add quirk for broken address properties
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
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 19, 2024 at 8:29=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Some Bluetooth controllers lack persistent storage for the device
> address and instead one can be provided by the boot firmware using the
> 'local-bd-address' devicetree property.
>
> The Bluetooth devicetree bindings clearly states that the address should
> be specified in little-endian order, but due to a long-standing bug in
> the Qualcomm driver which reversed the address some boot firmware has
> been providing the address in big-endian order instead.
>
> Add a new quirk that can be set on platforms with broken firmware and
> use it to reverse the address when parsing the property so that the
> underlying driver bug can be fixed.
>
> Fixes: 5c0a1001c8be ("Bluetooth: hci_qca: Add helper to set device addres=
s")
> Cc: stable@vger.kernel.org      # 5.1
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  include/net/bluetooth/hci.h | 9 +++++++++
>  net/bluetooth/hci_sync.c    | 5 ++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index bdee5d649cc6..191077d8d578 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -176,6 +176,15 @@ enum {
>          */
>         HCI_QUIRK_USE_BDADDR_PROPERTY,
>
> +       /* When this quirk is set, the Bluetooth Device Address provided =
by
> +        * the 'local-bd-address' fwnode property is incorrectly specifie=
d in
> +        * big-endian order.
> +        *
> +        * This quirk can be set before hci_register_dev is called or
> +        * during the hdev->setup vendor callback.
> +        */
> +       HCI_QUIRK_BDADDR_PROPERTY_BROKEN,

Like with the binding, I feel like
"HCI_QUIRK_BDADDR_PROPERTY_BACKWARDS" or
"HCI_QUIRK_BDADDR_PROPERTY_SWAPPED" would be more documenting but I
don't feel strongly.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

