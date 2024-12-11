Return-Path: <linux-arm-msm+bounces-41566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FD09ED848
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADCDF16401A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138EE86326;
	Wed, 11 Dec 2024 21:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZtY+Gpko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AFE1D63F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733951869; cv=none; b=c46jCFD7fKlKpxsN2OL0Y0x5lPKb6voHZDlRb0Nz6n37Ts/cjY7uacmcq2VG30hRV4CXWJp5bedcg1wCmewbGBAwwfaBiU7qgOzX+7n3qcSbQ17rttL++tCxwzOThuAM0ykcZ0k4wrh339EF9CywYKNWpnI06BJuTjexV7U2S1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733951869; c=relaxed/simple;
	bh=NLLIVPFkvrmcvJBHZr+3gnlNPWzVakxJWnGXHrKeUDI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=e6sylYuTWVHXw8sms+yHV0nYCyeAKkyIWds2PiQnNl9HS1mT+UbpK5Yh3QgHXUHzGQ3heYtM2DqrsctVnhGno7DgzdWvhFadfcw3ac8SIX78dP6qYZAtMGfXHg2JWVooS7pfjKKEYK6FdrpJp0K0fNWO4c/kPr7jGwUcMNjhMGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZtY+Gpko; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e3621518so4529318f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733951865; x=1734556665; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu9W5rLRLveyKjB8JDBAIK7fwfcOOf2kFwcU8a9GQFw=;
        b=ZtY+GpkoWwwi+YbsJJW7WNb5F57L98mbMm2bWNqAm+6HYN7wNveivGfOv0wgsBr84u
         J4IGG0CKazA2K9IZ9kg0OIsZAL1fM1inf6DE8kRxAy9SbsNtlfZcjL/yim1j3DyRXRu2
         haFvMTfHwcKzhYaOTOD2/1KuFfJbLC2jOMXhbKHG2JklYAG9dcqNSnreQOZ3FdO85GHN
         ViFY5VMeGBhz4SK7EbQ5F3cE2vu28fc4szP1A+2BKYvxVe6/wFxz0Ot9O0CdEhKB0hNY
         hBjkl0Se8vEm4K4d32hoNbEFLU714CdrmIY7AqWm5QffLxUEs0DqmWzRLIzd+4zakX+t
         G2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733951865; x=1734556665;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gu9W5rLRLveyKjB8JDBAIK7fwfcOOf2kFwcU8a9GQFw=;
        b=WqTv3b//qLiIA4LGCkofn3JvR87pbZVTKCFosDoiC/m7HMWYIbT54BsPe2BEI4keH0
         mMU8QhH48V47u9OOMGWD5Ysg8pcLClUaxAOTlk1CFLcsGqiYmlROQTOuX3cWDs2o2tVY
         KHAPhFAlBQRgbkGwa0dKyYftnFmJj0ZO+mwESTfNP3QAMR/wNGBfOpcASp357o8VHXAH
         cGmsc8zSJE2H28OYVP4dFFmuGqfGwsbYCib9Q3ANPi5shb7Kh1WrR11qtKezrfk9WAby
         bnOdrHNVUeEkHGsZ+L5rwFJbCkJY8LHRhG1WppXKrSkBQnlGctTw+TMJZmI3SC20niwW
         Ua3w==
X-Forwarded-Encrypted: i=1; AJvYcCVMekcItXiKVcllaAYo2EyIqkL6L+oXBOs5rqyFpc2X5tp8arCx5D4XBNcrA8xLZBqjkm9OGSrRiZ+9zKMu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+kkAMARh8lNnyPiyK1clQkNws4+tYK4MDoTOKaak1UvNWpVBI
	GiemM/LvVbhhqQAoqa9zxnH/K0AhsoLygtfP+ogUD6pSuh8SaL2L0azuT/ickXk=
X-Gm-Gg: ASbGncsqkNXu5FLFqRBQty76BAwcnF9yX7WHogGWO+bM2arVJ30EHQ7hOtF/26/1JdW
	DTch76yPdZg6JrJyxBh4zm5CFYcnEhTMXrVBddh6O6Zf4oxxQ11u79mGt3VAmGfkcZQfZW64m/k
	54RrCzfViYJxsT8f5yNnS8BvDbEgKab19hz0xFm9GinDmctHbV+Hzen6SRqf2MOz3QeqYt9cee0
	ScetQNUtwfNTC8mWQul95wbFQ2BefKHScNM2ShyrFkyqeC9vcyBfv2D
X-Google-Smtp-Source: AGHT+IEHmLv8L1dBsbuMcUIu7bMmHwCG7Qb7cnnUXWL0/aeB0rj/zBLMa9c3AQt3KXFc5jwS+RRTcw==
X-Received: by 2002:a5d:6487:0:b0:385:fc32:1ec6 with SMTP id ffacd0b85a97d-387876c37abmr846125f8f.50.1733951865400;
        Wed, 11 Dec 2024 13:17:45 -0800 (PST)
Received: from localhost ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361b6d6ea0sm40805885e9.16.2024.12.11.13.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 13:17:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Dec 2024 21:17:43 +0000
Message-Id: <D696MX61IL6R.1AU1HXYUNH9LI@linaro.org>
Cc: <broonie@kernel.org>, <konradybcio@kernel.org>,
 <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
 <perex@perex.cz>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 07/10] ASoC: codecs: add wsa881x-i2c amplifier codec
 driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.18.2
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-8-alexey.klimov@linaro.org>
 <jqsa7lsypf62uqjydqbyspvtnt7iuwxclfwuyatgee2zgduwvd@4wwagvovam4k>
In-Reply-To: <jqsa7lsypf62uqjydqbyspvtnt7iuwxclfwuyatgee2zgduwvd@4wwagvovam4k>

On Fri Nov 1, 2024 at 8:12 AM GMT, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 05:31:51AM +0000, Alexey Klimov wrote:
> > Add support to analog mode of WSA8810/WSA8815 Class-D Smart Speaker
> > family of amplifiers. Such amplifiers is primarily interfaced with
> > SoundWire but they also support analog mode which is configurable
> > by setting one of the pins to high/low. In such case the WSA881X
> > amplifier is configurable only using i2c.
> >=20
> > To have stereo two WSA881X amplifiers are required but mono
> > configurations are also possible.
> >=20
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  sound/soc/codecs/Kconfig          |   11 +
> >  sound/soc/codecs/Makefile         |    2 +
> >  sound/soc/codecs/wsa881x-common.h |   19 +
> >  sound/soc/codecs/wsa881x-i2c.c    | 1454 +++++++++++++++++++++++++++++
> >  4 files changed, 1486 insertions(+)
> >  create mode 100644 sound/soc/codecs/wsa881x-i2c.c

> > +++ b/sound/soc/codecs/wsa881x-i2c.c

[...]

> > +struct reg_default wsa881x_ana_reg_defaults[] =3D {
>
> Not const?
>
> Same question everywhere further.

Here it doesn't work:

sound/soc/codecs/wsa881x-i2c.c: In function =E2=80=98wsa881x_update_reg_def=
aults_2_0=E2=80=99:
sound/soc/codecs/wsa881x-i2c.c:421:65: error: assignment of member =E2=80=
=98def=E2=80=99 in read-only object
  421 |                                 wsa881x_ana_reg_defaults[j].def =3D
      |                                                                 ^
sound/soc/codecs/wsa881x-i2c.c:428:65: error: assignment of member =E2=80=
=98def=E2=80=99 in read-only object
  428 |                                 wsa881x_ana_reg_defaults[j].def =3D
      |                                                                 ^

but I updated it other places.

> > +	{WSA881X_CHIP_ID0, 0x00},
> > +	{WSA881X_CHIP_ID1, 0x00},

[...]

> > +static void wsa881x_clk_ctrl(struct snd_soc_component *component, bool=
 enable)
> > +{
> > +	struct wsa881x_priv *wsa881x =3D
> > +				snd_soc_component_get_drvdata(component);
> > +
> > +	dev_dbg(component->dev, "%s:ss enable:%d\n", __func__, enable);
>
> Please drop all tracing-like debugs from final code.

With a pleasure.

> > +static int wsa881x_i2c_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev =3D &client->dev;
> > +	struct wsa881x_priv *wsa881x;
> > +	int wsa881x_index =3D 0;
> > +	int ret;
> > +
> > +	ret =3D wsa881x_probe_common(&wsa881x, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D wsa881x_i2c_get_client_index(client, &wsa881x_index);
> > +	if (ret) {
> > +		dev_err(dev, "get codec I2C client failed\n");
> > +		return ret;
> > +	}
> > +	wsa881x->index =3D wsa881x_index;
>
> I cannot find how this is used. Your entire I2C address detection seems
> odd and not used at all. None of the I2C drivers are supposed to do
> this.

This is used to differentiate between two amplifiers, mostly in sound
component names. I found another way to implement this and it will be
present in version 2.

[..]

> > +	wsa881x->driver =3D devm_kzalloc(dev, sizeof(*wsa881x->driver),
> > +				       GFP_KERNEL);
> > +	if (!wsa881x->driver)
> > +		return -ENOMEM;
> > +
> > +	memcpy(wsa881x->driver, &soc_codec_dev_wsa881x,
> > +	       sizeof(*wsa881x->driver));
>
> Why not devm_kmemdump?

Because it doesn't yet exist in kernel.
But there is another nice thingy -- devm_kmemdup that can be used. Thanks!

> > +	wsa881x->dai_driver =3D devm_kzalloc(dev,

[...]

> Why this is just not module_i2c_driver?

Thank you for the review. I was aware that initialisation is not perfect,
it is inherited from downstream code.
I reworked a lot of these parts of wsa881x-i2c.c driver and will share it
in version 2.

Best regards,
Alexey


