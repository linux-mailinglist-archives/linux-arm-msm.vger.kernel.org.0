Return-Path: <linux-arm-msm+bounces-31924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A4197B1F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 17:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5007A1F222C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 15:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA56F17A918;
	Tue, 17 Sep 2024 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yStfJrlM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8317C23D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726586003; cv=none; b=AzMC4HpGuBaNvkXdlZeQRm17aqWvRji6sB3ix/Fuzcr8fGJOAi+wpdzfis3W31f4MrkgcG+NF1/ah7tOFBLs4E1CvcjjsOFRTg6TND9wLmLmmP0oIilMwQL+/2TtMdqE2q3N4oeL4inpcoo/rjitdv2qY2oExa08Ph7ystait6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726586003; c=relaxed/simple;
	bh=C6BIJE5gYeC/g2Oak4zV9l7IfmZQnQtGYVUJTeQWod0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7GVmhy5XQud+QdVgOD+Ff6ziSyprj5wN4PZyk6/sDYHpCsfxkLMR9jOvkvIELVFAL/rHEs05EU0u2QWpZTZwx9nk7RkjmwcIgPx2CDQ8mnBQefmjx2kVYaEfiWx67q/AJT+QkJXoBHYI6o7tqtBOd1l2CJZp3hflUIJ7BbELEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yStfJrlM; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f7528f4658so41178781fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726585999; x=1727190799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9QCqlRh9eT2CMbCDWw6auXzAwjAo/ozmjDpAB5cjRo=;
        b=yStfJrlMhN4gbrtmJKgz2O1MF4AD9CH88Hy2nqW1pq8ElVywcJ9EWqGDOdgYxXttK3
         bpwNR7HMVpke9eioC5kp4efzUPDBtbLw/zwKnyiwwVTAUtoc+MnnWa/Bxdgmh/hA44HT
         BHGIcFBfWSANWEvCNbEIUIlgPA0j4hRcZKBaIr8Cc5ol4CGb5cAjzT7KNzezLATyMX+c
         V9FSbsT3RqhDYQgR65gGd6NEEakSeeB55APgcKITHi9TYhWNxuCYEfS/99nmVCfbM7Ra
         fv3smgOYTpVcrx0MNpN3lNBkS/txwcAoq6MUCn9iDgRrr08mWSWix2kSc8OyzXPobYka
         GWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726585999; x=1727190799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9QCqlRh9eT2CMbCDWw6auXzAwjAo/ozmjDpAB5cjRo=;
        b=inzYgXWFXcuIm79Eww88XixQaLyklURhstCKrAkN5pyVm08WrEvCdxAzBXzQig1kL0
         V0fzh6D1FkdxIgpBkAMLr4EfsjFUi4MeNVTCw9au5eVf0/t+2W56RRT3+WVSsfO8EzSv
         pW7MM/+Zdm2JWQuP3Sa2udxjEwCvHI34CUoXW3ht+yYrgdex1TVTMhmv4q7vaYPo+kwu
         1vi+99NNYl+hDxbbXjp0LNl0OH1HpIdwmu1yvsWj21QdApyiJ02Cm5cmKHhfoW5vCwJd
         ydmQCkxTQAvGxxuAsUj4bPRr6xkas8R555WwfzznXRe7oDjgBqQnK0ejdyN1tdEizQ71
         M85Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/hyRIdpLBk+Ol3YJMNfHX73VY2WmhjzcTKB2Boi8xaCOE21BHXe0rIgBjWkymIKuxP/GIq56X9Z9waLBn@vger.kernel.org
X-Gm-Message-State: AOJu0YwNr5IuOv6hLaszXQVxXaMB2yCs+yCjO6/tIVRoqE728lv4lMlb
	9ObW8t7ED+vG8cMaag+jtfTp8sZDnifVo0kQIlOqPmDnmc9NFilMtqYag8f8yvVcmkFXb22jC4M
	CzihZRWqHQXiYe572/I6ozsVqbIECNk+d5pg6kA==
X-Google-Smtp-Source: AGHT+IEjk8ZHjlHyyFFjPJuCGwJFKhZ0kGO8bejy0WGDuXef54JZ6Xsqkq0B58+CUBKCRRCNpr78RpMazH22iNaAcZ8=
X-Received: by 2002:a2e:bc19:0:b0:2f7:5e7f:b4e1 with SMTP id
 38308e7fff4ca-2f791b4d3fcmr82055101fa.30.1726585998980; Tue, 17 Sep 2024
 08:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916172642.7814-1-johan+linaro@kernel.org> <20240916172642.7814-3-johan+linaro@kernel.org>
In-Reply-To: <20240916172642.7814-3-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Sep 2024 17:13:07 +0200
Message-ID: <CAMRc=Md-B3MCdjBA6Z03Tn09Qdq_O=2Gij=0kr8HiLtpp11kVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: qcom-geni: fix shutdown race
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	stable@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 7:27=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> A commit adding back the stopping of tx on port shutdown failed to add
> back the locking which had also been removed by commit e83766334f96
> ("tty: serial: qcom_geni_serial: No need to stop tx/rx on UART
> shutdown").
>
> Holding the port lock is needed to serialise against the console code,
> which may update the interrupt enable register and access the port
> state.
>
> The call to stop rx that was added by the same commit is redundant as
> serial core will already have taken care of that and can thus be
> removed.
>
> Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in p=
rogress at shutdown")
> Fixes: 947cc4ecc06c ("serial: qcom-geni: fix soft lockup on sw flow contr=
ol and suspend")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 9ea6bd09e665..88ad5a6e7de2 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1096,10 +1096,10 @@ static void qcom_geni_serial_shutdown(struct uart=
_port *uport)
>  {
>         disable_irq(uport->irq);
>
> +       uart_port_lock_irq(uport);
>         qcom_geni_serial_stop_tx(uport);
> -       qcom_geni_serial_stop_rx(uport);
> -
>         qcom_geni_serial_cancel_tx_cmd(uport);
> +       uart_port_unlock_irq(uport);
>  }
>
>  static void qcom_geni_serial_flush_buffer(struct uart_port *uport)
> --
> 2.44.2
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

