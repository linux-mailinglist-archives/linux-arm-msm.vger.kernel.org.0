Return-Path: <linux-arm-msm+bounces-33049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 413D898F7E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 22:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04E241C21637
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 20:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39062149C41;
	Thu,  3 Oct 2024 20:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D9l/LxIN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1D17BA3
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 20:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727986257; cv=none; b=S5kDYnmyea5vGB+JJzb82k4G6BVMG66RVMK5HcLkNed+6Z9ckhdcGPtpmsdL4OJkQlsQaKJWgA3A4OvYL/t70AMaJlMH9NEUUviQ/RAtxmE1hiaELYuGIM1C4XywXKBw2H4tcHfY9FLOFDQBv5FZEs7TrxnV5+wAXgPA4de7fUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727986257; c=relaxed/simple;
	bh=5mClyvmoE8/T4i63r9o6eFa9xXDQuoJ3ToU1moxvGuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3rMrihb1q3gDm04ILrdi+UwmtEUCN/CBbN+ItmH1s0T1vr/P7p9yhPzDr2qz3ViiY5rNYfOBSkyFOL8QPKUcFVMSmb4NStbNmFpagN4gchOkOqU0Tk+yVLGkJVz5MXw2PFIkFph2FERG5GuAbrBHBr//n3ic4E6q713/vwHaPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D9l/LxIN; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5398b589032so2284388e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 13:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727986253; x=1728591053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OT7NXgiXezelCOBUF+N5L8bbD4enjmEO6qRhbNzjnk=;
        b=D9l/LxIN8usEpBIQfFHJquDzJ1AOQ10/IE2HHrWzAcYi52b7v97FlA+OBFnK2oEAKQ
         dBBeZNdqgJFwHGwHsh63ruE0DBGyIs20eSoqXsPJ59VhksrlxKxeQWQzzpvuXnQt/wYp
         xPzgKsb/IbM1yzVMsZGU6DVkRxAn5j+a1jd+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727986253; x=1728591053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OT7NXgiXezelCOBUF+N5L8bbD4enjmEO6qRhbNzjnk=;
        b=CymRAGkSt/3Zuv/5cnaXwTlQf5ExOZfmQse+S8+E9Su0HOC8OdhiMMaKBBxKuMeeGT
         Q0kH0JsxQB10Z2s+DJ1WWQla+ySWJ1tKKCEuEDpJvY1OXLVxOLvDv2YgD5rPxf/1B/UD
         zed8IzNzrMzRgOVcgQDFUMNGVFyQWmjgAGfMkjcRTV8OKffCkq3lBISJKX9EBOLP0GDh
         kmI38MAh826aIPiA9K/RN8vW+d4BlRGUYgV0xtbSuOkQj05fJuP3qcK2bxGru/LzgBPc
         cSGYhYJvEEUSB0m3ITe9RKw7Up1X8ehMHOCh4WU3OaUYdthx/p132xMdcsnOcjecZF5A
         XU3g==
X-Forwarded-Encrypted: i=1; AJvYcCWcuQlORwVge1PYLFyWuF/NQoMQdfveL71Ltk9sv4yWRV+yTqU0QhneH9UJeHHMWAqpkwzlWvMhsyOi+T6P@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4gb069R9pENgr2G/K3hZ3fQtF5kIbLg/tTGdr/DXlZKQjSDCw
	i/9hYzRMNM2x8hMqAR80uBbV1NfRcF0dYhXQ27GpJmMuZhgbBEu1otW7YVR725l1kdvqGNrQHOQ
	r4A==
X-Google-Smtp-Source: AGHT+IEj71ZaiGi29/o4i5uaIphJvoY7tim0I6ObakA3vF+6rtn9DfzwqU5sT2CQMJlKuA4pTQRsig==
X-Received: by 2002:a05:6512:2315:b0:539:9767:903d with SMTP id 2adb3069b0e04-539ab9ec629mr321480e87.60.1727986252797;
        Thu, 03 Oct 2024 13:10:52 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a825681dsm250198e87.85.2024.10.03.13.10.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 13:10:51 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so21351451fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 13:10:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoPfWriX0Lhofaii3zlcFHF+23DtyWOcRvB9BAcKJ8XnRyGYAnhZbdqj3lach43GO/ER0lNkRkppNaeHtV@vger.kernel.org
X-Received: by 2002:a05:6512:3087:b0:539:8f68:e036 with SMTP id
 2adb3069b0e04-539ab87df04mr503870e87.34.1727986251309; Thu, 03 Oct 2024
 13:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001125033.10625-1-johan+linaro@kernel.org> <20241001125033.10625-8-johan+linaro@kernel.org>
In-Reply-To: <20241001125033.10625-8-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Oct 2024 13:10:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXu79-HOhWuwumJNkpNCup5EHND1nPk5SHyc7Kx9iX+Q@mail.gmail.com>
Message-ID: <CAD=FV=UXu79-HOhWuwumJNkpNCup5EHND1nPk5SHyc7Kx9iX+Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] serial: qcom-geni: drop unused receive parameter
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 1, 2024 at 5:51=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> Serial drivers should not be dropping characters themselves, but at
> least drop the unused 'drop' parameter from the receive handler for now.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Sure. I haven't spent any time figuring out what serial drivers are
supposed to do with parity errors occur (I don't think I've ever used
a UART that enabled the parity bit in all my years), but at least I
agree that getting rid of this useless parameter makes sense.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I guess while reviewing this patch I can also see that, indeed, parity
errors seem to be "GP0" and break seems to be (strangely) GP2 and GP3.
I guess that answers some of the questions I had on patch #5.

