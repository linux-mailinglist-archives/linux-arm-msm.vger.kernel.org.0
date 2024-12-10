Return-Path: <linux-arm-msm+bounces-41351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F18539EB876
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 18:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9AFC18887C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 17:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DBF23ED65;
	Tue, 10 Dec 2024 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ifDDz1nn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F012423ED70
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 17:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733852571; cv=none; b=knEEIv7Z0tXJu0+WN1SdMGiyQeAJn88XTa2wWnh5Bjpywn8dVLKcLzQ70caL+TxRWlFcAX40kVMBl0g96gN/kRER4hoOi+PgGyRMogI/uVtuP3PQygilfkdLjMjkWJ3MmMixLU3G6emJzHmRObrMa3HBHvP/2ZEZSLQHkgP/MYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733852571; c=relaxed/simple;
	bh=zyY+LvfKIlfyAiCLJWS7+1JGxiO0FEIr6sylV/Xgzzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngmWhlE466eNrTBRkdl5IoGx493iCbGw4a4hB8sEa+sQbyLLH0Zk/c8z0Mn3Yy22hY6FtETHBDsd0vBP4cigBYgRaniX0/uLqszOD8HOSl+7+gCPE+P25VS2OfXJCPcx74GZ8/p2mU3br2YaWFnbKxUMVKd5VZB0u5fmh24mQHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ifDDz1nn; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30036310158so33862381fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733852566; x=1734457366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjuuFtemyP+DI+76rQdawmoZ3eTqeNEd2wfGxX97PdQ=;
        b=ifDDz1nn0UTC5RhCmSfkz25Ai7nokfmLf9HTISfDqX0UqTX/NIurQbmATt/llB2rFF
         b9mLksWHiluQczPKmEOm+gh+25sy//zVrNMapdSOLex9UGADq7Djw3cVfnur7EAcDeJi
         fXVnsteTXuE+cnivI/t52V8RT3T4gzPTR9O04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733852566; x=1734457366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjuuFtemyP+DI+76rQdawmoZ3eTqeNEd2wfGxX97PdQ=;
        b=VGxa5Cxo1Bk1HWzdB/UgQmvUXJ/08kxLvWPwnMgBzC/7OkFU+AgA1VW3woGai1Z6Qu
         PCi4HP2Lavewgw0pKTbZUfBZhcjuRVB1H4cgYuDwt5WtENxwVL+KbT9I2H/hlDvYzJFf
         4pd8M4mO9Njoy6wgHrWEB4HmU7oin6OFhzDGvKKA3GqL0wZZb+tHefI3UAm+Q6fnPdKh
         DmxqmLOcjaCWEVaNEIId+P+2r5823JlscW8cgLvsLbrvWvSdtoNBGMtiOjaRK+NNCF3c
         9tYRhGMJpFx+42hVlItB/HMgwrZtGjBm1hWDjrFfqAQdwXCzkJks6YlFkvuyW//vIxZR
         fAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Gnqk4Q7VefEnnTxIF4u/uAgh4jVW5dCsUuXcafXHZ4yy3ng+CGXzGBBacHivmh4JsWrE7bPugo4l94rm@vger.kernel.org
X-Gm-Message-State: AOJu0YzaSS6iNYlKuCWFI9R8bA5TaV0bZ1Z69jvAOzBi9HgPxWdokGYB
	PLB6D7jw1o/QyYDWLzSG7k24phbrPvAQS8fUH+143HWuTuRwY2zx6iVbrGMTuzi9Trfu74PskxV
	c8Q==
X-Gm-Gg: ASbGncuFEKByokDaihlV3R9mRsfH+ctKUn97/V1wjuVZZ0AKQCVViBpd+84tMxcds+r
	Sm0PROZXgxodRLLSW/By0KGx9nmHJ1t/VEmXEbXtq1il8w5CoER4j9/qrSjU2XQQSMowQ/Ee+xi
	AkAyHcxXViDRAtVkFdd1jHmjYLGRIg3JGtrczsUMZR4T5lsA/D839uMvC39tj2/SvNIf0CTgLre
	HoL3iMAeIpPSJIJdFb6Dqwbutnbk/UCpsXHtzRzRWJfrd1TdFTyD96SbW22k5SrQbX9nVm8CyS1
	/U9ARAwg0cdAAQLxZLhe/A==
X-Google-Smtp-Source: AGHT+IFfIfvHFvZvSnDz88SSVKPDmG+uAYroMIj26eKL0gxtWcOY/3Fx2VLOqafkZFfrJlCYQ43rwQ==
X-Received: by 2002:a05:651c:555:b0:2ff:cc65:68aa with SMTP id 38308e7fff4ca-30240d5da38mr307761fa.31.1733852565585;
        Tue, 10 Dec 2024 09:42:45 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-302223d581asm7044741fa.89.2024.12.10.09.42.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:42:45 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ffa8df8850so59790071fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 09:42:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrzhCdcJ2mJw01Ucw9mw3zIuFYg2agT/Z0wsaMQtYWGRWGDeC/R4PxRv3eIZ4SV+20eCAbg6VlsnwKh+d2@vger.kernel.org
X-Received: by 2002:a2e:800a:0:b0:302:1c90:58d9 with SMTP id
 38308e7fff4ca-30240ced962mr314001fa.16.1733852563643; Tue, 10 Dec 2024
 09:42:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-2-quic_vdadhani@quicinc.com> <CAD=FV=XF+9wxZ5xNtO3Uy8QW9UY4tb+KR46jkondvBeQuVLsrA@mail.gmail.com>
 <6736db20-127b-45c3-ac90-3e3e359c343b@quicinc.com>
In-Reply-To: <6736db20-127b-45c3-ac90-3e3e359c343b@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Dec 2024 09:42:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VReNQ3nw+wfZizL7JjxEX9z=GwDEJAFzheNkW7rSrB5Q@mail.gmail.com>
X-Gm-Features: AZHOrDkKw2FmHmZQUJPUfL4ELobjfrjI9icl10Uq0FkzH_2PdMnaEbBKyuOx5E0
Message-ID: <CAD=FV=VReNQ3nw+wfZizL7JjxEX9z=GwDEJAFzheNkW7rSrB5Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, quic_anupkulk@quicinc.com, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 9, 2024 at 9:28=E2=80=AFPM Viken Dadhaniya
<quic_vdadhani@quicinc.com> wrote:
>
> On 12/4/2024 10:55 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Dec 4, 2024 at 7:03=E2=80=AFAM Viken Dadhaniya
> > <quic_vdadhani@quicinc.com> wrote:
> >>
> >> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
> >> support SE(Serial Engine) firmware loading from the protocol driver an=
d to
> >> select the data transfer mode, either GPI DMA (Generic Packet Interfac=
e)
> >> or non-GPI mode (PIO/CPU DMA).
> >>
> >> I2C controller can operate in one of two modes based on the
> >> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
> >>
> >> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> >> ---
> >>   .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++=
++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.=
yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> >> index 9f66a3bb1f80..a26f34fce1bb 100644
> >> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> >> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> >> @@ -66,6 +66,15 @@ properties:
> >>     required-opps:
> >>       maxItems: 1
> >>
> >> +  qcom,load-firmware:
> >> +    type: boolean
> >> +    description: Optional property to load SE (serial engine) Firmwar=
e from protocol driver.
> >> +
> >> +  qcom,xfer-mode:
> >> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA=
 mode respectively.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    enum: [1, 2, 3]
> >
> > I'm a little confused about this. I'll admit I haven't fully analyzed
> > your patch with actual code in it, but in the past "CPU DMA" mode and
> > "FIFO" mode were compatible with each other and then it was up to the
> > driver to decide which of the two modes made sense in any given
> > situation. For instance, last I looked at the i2c driver it tried to
> > use DMA for large transfers and FIFO for small transfers. The SPI
> > driver also has some cases where it will use DMA mode and then
> > fallback to FIFO mode.
> >
> > ...so what exactly is the point of differentiating between "FIFO" and
> > "CPU DMA" mode here?
>
> Yes, correct, Will update in V2.
> I plan to add 2 modes, GSI and non-GSI(PIO or DMA based on length).
>
> >
> > Then when it comes to "GSI DMA" mode, my understanding is that the
> > firmware for "GSI DMA" mode is always loaded by Trustzone because the
> > whole point is that the GSI mode arbitrates between multiple clients.
> > Presumably if the firmware already loaded the GSI firmware then the
> > code would just detect that case. ...so there shouldn't need to be any
> > reason to specify GSI mode here either, right?
> >
> > -Doug
>
> GSI firmware is loaded from TZ per QUP, but to use GSI mode,
> we need to configure the SE to use GSI mode by writing into SE register
> QUPV3_SE_GENI_DMA_MODE_EN and SE_GSI_EVENT_EN. This register is
> used to configure data transfer mode for Serial Engine.

Can't you detect it's in GSI mode without any device tree property
like the code does today?

-Doug

