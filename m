Return-Path: <linux-arm-msm+bounces-30806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAC796C9C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 23:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A51FB1F27DAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F4017ADE0;
	Wed,  4 Sep 2024 21:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DlszaVA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E4216BE15
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725486686; cv=none; b=ZpRwaAyY7AlKEezCbBPT+PrqhmX+QcTaPSYz2+brqm3yvfanXWgrZtSDUths848PaK7dkkD/JZnlXAFWozUrwv31/4v1EqJ/QdHUVzt6dJZ8axrfnVMoob8fAXb8i1T8IjLZF14TjIbTzhNN8z1p3K83FRFTfRxmgtCtwqPmwFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725486686; c=relaxed/simple;
	bh=knUk5g8ScG6jaMqCjtTQXGlVYSsfYw20xNj43ODq8mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYL83zwCUme1cvG1Vxaa6/d3r92g0cJn4JZErHXjtw4EZvFeOdUP5uDmEQ++wQLacCg7FqLhSzMosxZ+1uL2EwoaaDRzsrQ68htj9iwbfU7ltZLLwKyiP4TCl1Pn7Y9p2ZN8Mgm76TCSzyRd/O+tDjfIirgqnVQrqUgd1T/LqnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DlszaVA3; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-457d46ea04dso644911cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 14:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725486682; x=1726091482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXSA8W0aVMFFsXPo/UPncBkp5lzvV+GsF0QFk8bga9s=;
        b=DlszaVA3pc39dP3y6svZw5AbMh28YA+4knB6wXI01V1q60JaAToWfPIx4x3SxhV3wo
         AjxTN7QcZb3V6TikS6UQrso/elfzS8/zKBsK3ldocCDZetDv3sbNO7KVjvYCEN/PN1oD
         vw8UuyZiVYUwQKtsRKsxKnTBJncIuXIvjwMiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725486682; x=1726091482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXSA8W0aVMFFsXPo/UPncBkp5lzvV+GsF0QFk8bga9s=;
        b=CVHmcemVs3dVzqiWrCXEwXqGynVAC8DLBn6KhiyW2HvQeXDU7/tXFmrGc5i9GxYNLr
         PodjknufAnWm+wjivx6CLeuAeEFPC0a339fFpewlaBk5wMe5BupSpzuqh0BcQueCYEBZ
         pB9gXWra2i2iDw5S5mXpXpCOAivmsGM+iTCJqADar2/KMYbhblAS1T9nTbzeAcbKAmpk
         90L+gk+h1As6ZbPt1ZyqPCbUtv3UX79DLi6CWKdvG//HmXYuqZZ12vYe6LNVV78Ax8w+
         ls23TL9Z4MAQ60/PrPEJkfA3+ORT0MYWuD6a1/w0VNs8SBqS5Odp9Npo/818YcxM1fSe
         XTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWcVIxFhlp+l+Gwiv2ft2YbFOQ/8en2uE1yxVWm9ymlTWFCgYONlsI5Dxm2pjK55UHskBEWD3DIY0RKcUj@vger.kernel.org
X-Gm-Message-State: AOJu0YzPMvK/9IQTl5m+7jFLRixXJ0ppnehGF0nz6gVfQzVbLMcl25Ln
	WqxuS3TJ2T9ygS8MDF55j9oI9JUUyHo8cbnhQ2T5U7RFRO/5YPCVfbsaxtOgKkqpub7j+/RN4n0
	=
X-Google-Smtp-Source: AGHT+IHsdIY2iVIHL2hsx5Zn4DW+C3s9+Z7/Ow+rZv2l2JarcI42kE23N606OZqV5V7B5yBUwY9y2A==
X-Received: by 2002:a05:622a:228d:b0:456:847d:47a4 with SMTP id d75a77b69052e-4570ec51ef5mr169567041cf.31.1725486681618;
        Wed, 04 Sep 2024 14:51:21 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45801919415sm2202381cf.0.2024.09.04.14.51.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 14:51:20 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6bf9ddfc2dcso534536d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 14:51:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8B3jnrqQL27h0De1NxL5Bt3ybmTq1Lx5hl8LHBNqwSsMVCJi/rVP6O6sE+nWynYn9UiGp4+JrKNEbYCxs@vger.kernel.org
X-Received: by 2002:a05:6214:5d0c:b0:6c3:5aec:4504 with SMTP id
 6a1803df08f44-6c35aec461emr191088526d6.28.1725486680181; Wed, 04 Sep 2024
 14:51:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902152451.862-1-johan+linaro@kernel.org> <20240902152451.862-3-johan+linaro@kernel.org>
In-Reply-To: <20240902152451.862-3-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 14:51:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UH8dLB6ebCXGeF2t5Bi5EhYrumLDnSV68fg7qzdPCQMg@mail.gmail.com>
Message-ID: <CAD=FV=UH8dLB6ebCXGeF2t5Bi5EhYrumLDnSV68fg7qzdPCQMg@mail.gmail.com>
Subject: Re: [PATCH 2/8] serial: qcom-geni: fix false console tx restart
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 2, 2024 at 8:26=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> Commit 663abb1a7a7f ("tty: serial: qcom_geni_serial: Fix UART hang")
> addressed an issue with stalled tx after the console code interrupted
> the last bytes of a tx command by reenabling the watermark interrupt if
> there is data in write buffer. This can however break software flow
> control by re-enabling tx after the user has stopped it.
>
> Address the original issue by not clearing the CMD_DONE flag after
> polling for command completion. This allows the interrupt handler to
> start another transfer when the CMD_DONE interrupt has not been disabled
> due to flow control.
>
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver sup=
port for GENI based QUP")
> Fixes: 663abb1a7a7f ("tty: serial: qcom_geni_serial: Fix UART hang")
> Cc: stable@vger.kernel.org      # 4.17
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)

This seems reasonable. I guess this can end up causing a spurious
"done" interrupt to sometimes occur but that looks to be harmless.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

