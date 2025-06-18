Return-Path: <linux-arm-msm+bounces-61710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D80AADE829
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 12:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C869189B66C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 10:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4EF286D5F;
	Wed, 18 Jun 2025 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VeRWDszD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D52F286D62
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241332; cv=none; b=EoqHZ98n9uJouSO7otQjm6h0ZwDMwVE2YjUDOgkTbz3GgSOE0bX757xAlECwo7nkJU8pPFOHs++lEih24ETKhXktR+oZ2sO0dWQmEreIxZWuAX9Z5xfrs4Cq3diA6CKYxW4z2TIxr6pdEXiuck+Af5kxwep13ct+7dyIlgn1674=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241332; c=relaxed/simple;
	bh=j3LmGpuLinBOOisNliZ1REifD1qpXjaHaC2z7QzKPbI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIs6kUVsuF3jrH5rDJy+Ms4bolzbLAtMt8uZxV6/lg2hdXqjqBsOW+E+OyOb4mHQ7eSCAwP3S8r7PVx2b2GQ+G7cPuT1qPsbkXs9kpv6uoLWvny/7UADTsb1Sk1HuX/MI4BSEB4KuYg+VRxvOFQjwAkKJ/Ydy72VUxphnn8tWpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VeRWDszD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b16a0e38so6261813e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 03:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750241328; x=1750846128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBBnBFuo97eVPKNi0/6hOTdEWfgAEZkRO54pBO14yjo=;
        b=VeRWDszDhmPobjmRJtlV+T7ZdlPnVD5OeGDHzBvWlcHZS1AX8yFpl3xi1fTHpbQ9Ew
         HZ1UwFhCV9E3cDo31FIibncuuoziZqHgsw202mvkxF+94sQ+c0z4klaC7olsSshZCDmT
         und6LHcatdMGlUXl54j7wcSl5DE+omU9TLGxnCgyalIIwfipWjua7fObLPH/A+uJmnhb
         PN2mrg3U4p558mvDYu16P3KGQ/mQd2YO4LdlMZqaqaKAYBQo2zugaLKLEga0v4Zk0Inw
         clR3tJWh5KO82O83FqeWDXsFsY7goIG47f86SpuxRRmP1nHS5IUxwB46X51c8Dfrg/Yp
         FBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750241328; x=1750846128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uBBnBFuo97eVPKNi0/6hOTdEWfgAEZkRO54pBO14yjo=;
        b=jL2KGJm0fmlRY2WW79/URGBK/5eGIzH95dXdlBkOZmqMEYdM9oMlIbuAF7AZubOW4r
         brEbgSMyTftDyl6juuTYLCiUSYk3tIbVfX+SqsEOxvMUBxNGzzY5rd/DprAxxHCIHmPa
         uL8chBvrU6H+eO1UVL7wdt+sFkBgmzWz8s02iY2G7TtqvbiuH5LuopneVBV1nnuM5kED
         uc5NgZN7lNztFLFWAk1OiiUYBnxTcgj3ZlfwbCHXX7a7yOqsFEW0bCpzLvqzOvSoe3w+
         cFQiBhOC4YG4AZ6xiv6iLnjMGeRx0BCQESiT9GGZ/LUY3hzZEB/+vtg9TUbyJ7FBKFfm
         Heyw==
X-Forwarded-Encrypted: i=1; AJvYcCW637RfPHuG/4WMU4ujuoIeAtHzHuOX4RXJIFhnpX1qORVS4fvbM1D/7/ldNgUUkxCs7kl7DcpOPiaE5IJJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8LPz+jTPCan4ZPXWg16ZnZCJcI0J72suhElPUJ6+mJ1O8Uy9B
	k2QCotFZlI+5kPOyatixO0ob8xB2sWiDM/zI0HTiSpi2vP90ln74PTWzj5JbwWepT4sIs9+XJE6
	i3KEZzmpnl5yfBQ3meYeecmKA/ZHbb/vEIDRVHuCRpbdLw6nga1vLjW8=
X-Gm-Gg: ASbGnctJkdoKEWsiIXiC2rLEeQyEWaDoMhTulibdncQlsHP4EYefq9Kbd5VxrmqgM3G
	cMkH14MH0FbePqhv8Cl9pVc8luBkQcCV8dlEhekVIikKZCOl52fh+Z/ENlNl7tnvJZPDK3/qmT9
	2BXQeksu+yAmmLXJ4gCFaycXaoeaMHvNuJmNYFAxYz0ThtHbfx9Ubm51QQxMQi4CBtQSTelNcS+
	Q==
X-Google-Smtp-Source: AGHT+IHojWs9ewmmbTXyI3d7ehaXuASwREwS94656w0ibfKkK8SMr5fKycoZ4i06qEq80ZcwPD5KAKdfsHdS/P8044w=
X-Received: by 2002:a05:6512:3d03:b0:553:35f5:7aac with SMTP id
 2adb3069b0e04-553b6f4cd1amr4194333e87.48.1750241327991; Wed, 18 Jun 2025
 03:08:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Jun 2025 03:08:46 -0700
From: brgl@bgdev.pl
In-Reply-To: <iuqppo7k6qp7v4pm4xtllqkqdtnarlkr2ey7s3fp3g2jd5dynz@oanc7zlfod7m>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616143341.51944-1-brgl@bgdev.pl> <713cd518-935f-4501-9753-d33c9ea6aef7@oss.qualcomm.com>
 <CAMRc=MceV-HgyFFvqytXAiuY+y10PQbdPBxuvd57NCeSLVLXCg@mail.gmail.com>
 <vyr6s4wzw5jc5gt7mywu4s4xob6aeca5aclbe5tdr4v3yng2tn@yb7rn2b2btb7>
 <CAMRc=MccuJe144NcwapPPRXtQOZbPW8qmybuEA2O9EtfKzs7oQ@mail.gmail.com> <iuqppo7k6qp7v4pm4xtllqkqdtnarlkr2ey7s3fp3g2jd5dynz@oanc7zlfod7m>
Date: Wed, 18 Jun 2025 03:08:46 -0700
X-Gm-Features: AX0GCFujqBFBkEMRSldzaIW8AP2PK4RrOY49khUHZq4DSFM-4sjy8X1X0XmOx8I
Message-ID: <CAMRc=MdTuL9K4etfqM=BEkHy+KKWpT+JKHCo4iRdCX48gs8M8Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: add debug UART pins to reserved GPIO
 ranges on RB2
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Jun 2025 04:33:31 +0200, Bjorn Andersson <andersson@kernel.org> =
said:
> On Tue, Jun 17, 2025 at 01:28:41PM +0200, Bartosz Golaszewski wrote:
>> On Tue, Jun 17, 2025 at 5:18=E2=80=AFAM Bjorn Andersson <andersson@kerne=
l.org> wrote:
>> >
>> > On Mon, Jun 16, 2025 at 06:43:16PM +0200, Bartosz Golaszewski wrote:
>> > > On Mon, Jun 16, 2025 at 6:20=E2=80=AFPM Konrad Dybcio
>> > > <konrad.dybcio@oss.qualcomm.com> wrote:
>> > > >
>> > > > On 6/16/25 4:33 PM, Bartosz Golaszewski wrote:
>> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> > > > >
>> > > > > GPIO12 and GPIO13 are used for the debug UART and must not be av=
ailable
>> > > > > to drivers or user-space. Add them to the gpio-reserved-ranges.
>> > > > >
>> > > > > Fixes: 8d58a8c0d930c ("arm64: dts: qcom: Add base qrb4210-rb2 bo=
ard dts")
>> > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.o=
rg>
>> > > > > ---
>> > > >
>> > > > That also makes them unavailable to the kernel though, no?
>> > > >
>> > >
>> > > Yes. They could only be used by QUP - I2C or SPI #4 - on sm6115 but
>> > > none of these are used on RB2. I just noticed that my console froze
>> > > when I accidentally requested GPIO12 and figured that it makes sense
>> > > to make them unavailable. Let me know if this should be dropped.
>> > >
>> >
>> > I'm guessing that this would be a problem for any pin that is used for
>> > some other function. Should we instead prevent userspace from being ab=
le
>> > to request pins that are not in "gpio" pinmux state?
>> >
>>
>> That's supported by the "strict" flag in struct pinmux_ops. However
>> the two pins in question are muxed to GPIOs as far as the msm pinctrl
>> driver is concerned so it wouldn't help.
>
> This doesn't sound correct, the pins needs to be muxed to the qup in
> order for UART to work, so how can they show as "gpio" function?
>

There's no pinctrl-0 property in the uart4 node. But if we do the following=
:

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi
b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index c8865779173ec..8c29440e9f43c 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -672,6 +672,18 @@ qup_i2c4_default: qup-i2c4-default-state {
                                bias-pull-up;
                        };

+                       qup_uart4_default: qup-uart4-default-state {
+                               qup_uart4_tx: tx-pins {
+                                       pins =3D "gpio12";
+                                       function =3D "qup4";
+                               };
+
+                               qup_uart4_rx: rx-pins {
+                                       pins =3D "gpio13";
+                                       function =3D "qup4";
+                               };
+                       };
+
                        qup_i2c5_default: qup-i2c5-default-state {
                                pins =3D "gpio14", "gpio15";
                                function =3D "qup5";
@@ -1565,6 +1577,8 @@ uart4: serial@4a90000 {
                                reg =3D <0x0 0x04a90000 0x0 0x4000>;
                                clock-names =3D "se";
                                clocks =3D <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+                               pinctrl-names =3D "default";
+                               pinctrl-0 =3D <&qup_uart4_default>;
                                interrupts =3D <GIC_SPI 331 IRQ_TYPE_LEVEL_=
HIGH>;
                                interconnects =3D <&clk_virt
MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
                                                 &clk_virt
SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c
b/drivers/pinctrl/qcom/pinctrl-msm.c
index 5c4687de1464a..e5c85d21e13c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -293,6 +293,7 @@ static const struct pinmux_ops msm_pinmux_ops =3D {
        .get_function_groups    =3D msm_get_function_groups,
        .gpio_request_enable    =3D msm_pinmux_request_gpio,
        .set_mux                =3D msm_pinmux_set_mux,
+       .strict                 =3D true,
 };

 static int msm_config_reg(struct msm_pinctrl *pctrl,

Then the problem on RB2 goes away.

>> Turning on the strict flag at
>> the global level of the pinctrl-msm driver would be risky though as it
>> would affect so many platforms, I'm sure it would break things. So IMO
>> it's either this change or let's drop it and leave it as is.
>>
>
> I share your concern, but the benefit sounds desirable. I think
> protecting the UART pins would set a precedence for filling that list
> with all kinds of pins, for all platforms, so lets give this some more
> thought,
>

I can only test this change on so many boards. We could give it a try, it's
early into the cycle so if we get this change into next now, we'd have some
time to see if anything breaks. I can send patches with the above changes
if you're alright with it.

Bart

