Return-Path: <linux-arm-msm+bounces-28898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA89955EEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2ECC1F2134E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA273154439;
	Sun, 18 Aug 2024 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="a46S0UYp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB26154444
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Aug 2024 20:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724013007; cv=none; b=kyXJ/72Locc20jKeIMLWNnfGdtyI0qqABUFxJf/1OHGIWpO8foZqYet+LTukoVpXeZOKEPWSDUloe1XvUxoYUQJAkHWjtc+IaRbtKd/hw7/ZuScZGrgfBMjGKWxOHqma4co7SuI01uQA/zC8juSaOsY5MDjKPZ/SytHYUG8JGVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724013007; c=relaxed/simple;
	bh=kIUPODz3cbQ5gt+8r9evwbR04C/aEv/J2gHXEvX3crA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=T8mGyKzfuXVM4Lzg93VTxvQyZ9OVw79d+TwzP+ZK6VZ8Xyhhm9KDkZ8ioc7oyJpoH8SBQ3k6aFVtK4LOr3uUVaGD3wm9+JFzG2dkhD/FR5WSPOwGBSPsOcYJHiu+Cwb70ua+u7xPV3vGwNzUp7dgf+vflGc+q0NA7R++TqYXwJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=a46S0UYp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428ec6c190eso30454855e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Aug 2024 13:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1724013003; x=1724617803; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKuSjcunVmOP4VZx33TMXhdaxHVXIr/vpkFcjKrBzpY=;
        b=a46S0UYpmonx/q9TaFzkBHbQXj1ecnM8WhiAhDs72Dv3Oy87Iz36/rFHqjpnZ3OKTQ
         H14R6091zId0K0JLYDcXTvuHZ+Q62sdJAG0s1dGEcy17AQ2rUOxG+b1F1idWH+PcTJNq
         ySk8O3+C7kewo+IXaJm/I7sO8JHH6fCRhYiPgQNYOIXsKPlqAz6Rk6AlcBHeQD5ZjUmb
         xtNfuqU2USDkws4npkahh0R/Eq8y8YS+3nx9Tq7h17gqCli9Frzvvl6efmWsmm7Srmk2
         ctCa/lpe3lh2SDZGAUlebZx0LbLONYle6zwMMdLAM5K6HR/oyIgjQQUVaPNtAVzTC6rd
         wYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724013003; x=1724617803;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BKuSjcunVmOP4VZx33TMXhdaxHVXIr/vpkFcjKrBzpY=;
        b=bkEeG3CjpZhFLED2R2LYqpLEs4JK2Vt+0j4rGOhCsEYU5/hrVAmzBZmfdOZEgG+Fo8
         0/f9OyDczEc29KJQVvvqKEHLV//LYznG/MFwGfI7U9INUIj3TpiuflkI9uf+PtHfASam
         4pD0c667wADcq+j4njNJaEkRNZZTJHuk0jB9QnC0iQnOF7Oc4asrzNbNHXyf/fEXBexT
         XS0MEiPiwmVvlhRki62MumU0F4/unlWTEgkS+WrID9OQJ1jaZPndTP8FMzYdcKTqG5YX
         T8troP3EF7/f80lZcEq2cyX6jLWZrcxyuPthzw/S0kLIYozVp5hrYzPR5v1akBB5WR6u
         tWsg==
X-Forwarded-Encrypted: i=1; AJvYcCUmvQYeiVqJmwZtoKwOlU+s0KhCMoN09gQUkMozTZ0ixz81N8h6BllDgpcLpr+ce8oJjKMRQOYEYNFIRZ2NBE5jZp0EXFDPmQUT0vqAaA==
X-Gm-Message-State: AOJu0YydO+sbuDyQnuPbM8SITfdDPpHpMQfTJCQESph6orWzdw014wLB
	1hdZKjfllNUfles14UtcDveT9LzdNwLq1sHhzRIyb4pF49juBHisuY1pD19Pzlk=
X-Google-Smtp-Source: AGHT+IGdjsfegB8yke+aoiRcnbr1T/5MJGCjCQl1jxLBjE8tUqmY1ED2da6ecMdVTHRwtGSIHNZ+CA==
X-Received: by 2002:a05:600c:1e15:b0:426:5b21:9801 with SMTP id 5b1f17b1804b1-42aa826510fmr31755565e9.27.1724013003127;
        Sun, 18 Aug 2024 13:30:03 -0700 (PDT)
Received: from localhost (ip-185-104-138-79.ptr.icomera.net. [185.104.138.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded72524sm142052615e9.34.2024.08.18.13.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 13:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Aug 2024 22:30:00 +0200
Message-Id: <D3JBLQVFQ7KB.6CGONK66O4XE@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Caleb Connolly"
 <caleb.connolly@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: fsa4480: Relax CHIP_ID check
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240818-fsa4480-chipid-fix-v1-1-17c239435cf7@fairphone.com>
In-Reply-To: <20240818-fsa4480-chipid-fix-v1-1-17c239435cf7@fairphone.com>

On Sun Aug 18, 2024 at 10:21 PM CEST, Luca Weiss wrote:
> Some FSA4480-compatible chips like the OCP96011 used on Fairphone 5
> return 0x00 from the CHIP_ID register. Handle that gracefully and only
> fail probe when the I2C read has failed.
>
> With this the dev_dbg will print 0 but otherwise continue working.
>
>   [    0.251581] fsa4480 1-0042: Found FSA4480 v0.0 (Vendor ID =3D 0)

Short appendix: just checked the OCP96011 datasheet and it does mention
register 00H being "Device ID" and "Reset Value" being 0x00 so that's
expected behavior on this specific chip.

Regards
Luca

>
> Cc: stable@vger.kernel.org
> Fixes: e885f5f1f2b4 ("usb: typec: fsa4480: Check if the chip is really th=
ere")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/usb/typec/mux/fsa4480.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4=
480.c
> index cd235339834b..f71dba8bf07c 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -274,7 +274,7 @@ static int fsa4480_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(fsa->regmap), "failed to initialize =
regmap\n");
> =20
>  	ret =3D regmap_read(fsa->regmap, FSA4480_DEVICE_ID, &val);
> -	if (ret || !val)
> +	if (ret)
>  		return dev_err_probe(dev, -ENODEV, "FSA4480 not found\n");
> =20
>  	dev_dbg(dev, "Found FSA4480 v%lu.%lu (Vendor ID =3D %lu)\n",
>
> ---
> base-commit: ccdbf91fdf5a71881ef32b41797382c4edd6f670
> change-id: 20240818-fsa4480-chipid-fix-2c7cf5810135
>
> Best regards,


