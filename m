Return-Path: <linux-arm-msm+bounces-7093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E81B82BC97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 10:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B14B4285EA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 09:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CC354FB1;
	Fri, 12 Jan 2024 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HO4cMldz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA5A54BC3
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so5259822a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 01:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1705050018; x=1705654818; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SkiM1CyhiqOdeyM++a6lT4rbKePEx/F9YY5NzKazuE=;
        b=HO4cMldzwLhwY7Oms8X7gJSko/PvJ4uHJdPKmtax1Jjav3mLLFbpii/sscAzPnEuKf
         SxrSCAJgKZxNvWyBYvuZlvp7hldHlp9bjk0b8CZZmCbjsddlY0tu/qgs5sLrmlK7Ykra
         DNUzHWjemDfbcUraqpRr3EXuMOC3jwIJRF3nuTGySMB5/ETg7U3JwTjXLoSbfzeKAso1
         EQJH9gVgZTTXF6mafvs9ahBeXu9MFUQ9w7BEprftFUTGHr92iY+BmX/xTrzLfmlnfnDr
         AmebHBYnJgEw8mFLRJOHk1jR6572g3U+z01gL7Uqm+ZiT/5LQIEERvehH7VhvmX+6rcI
         Sp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705050018; x=1705654818;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9SkiM1CyhiqOdeyM++a6lT4rbKePEx/F9YY5NzKazuE=;
        b=PbQxWJVv8tcJnupCXzyA4VwdN+A1HdxFmdFe8F+/1/c+tLVH9rPBuZB6LdA62V/Obv
         sEandOGajaZO5xnJ+U/CD65AIpwQ1FDi+SnXELyijO1qG6d0tU7lLkCptcobJB9sKoCW
         NZePrDac87r9PgS+DH33HW9FR5/eGevEnlEAbKoBOzZ50e5J5q0ZxhJhtc7liaNr7abk
         JKEWmTWveuQsQDCwArIRlMzZv9sirs8iXK5MgZBTFOeZQ3IA/JJT1AL6IEGrIq6Dyad1
         /MFJ0iuG43k6JvAGy3Tf8fMwYSaovzKNhbwxFHEuFnWuSnmGU30VgG7a2iBxSOC/kUV/
         eLdg==
X-Gm-Message-State: AOJu0YzHCmfGIl9jmjk9qXOq3TUwn6qorgzGa2eVOBcblNGC1QlGNd+q
	sqCvREtY0xcCEDKxyRK603CqyxA8Inpmnw==
X-Google-Smtp-Source: AGHT+IE4lqCuCcBKUQKcGYBXm2hn5tLGot0ekhVA4EDWlovNg76g03laNX/Vn5Sk4TgseAUkA74dQQ==
X-Received: by 2002:a50:fa94:0:b0:54c:60f0:7511 with SMTP id w20-20020a50fa94000000b0054c60f07511mr480176edr.35.1705050018310;
        Fri, 12 Jan 2024 01:00:18 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id j14-20020a50ed0e000000b005550192159bsm1555191eds.62.2024.01.12.01.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 01:00:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jan 2024 10:00:17 +0100
Message-Id: <CYCLSCKPPBOC.1B1MP3VOOC0Q8@fairphone.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <quic_jesszhan@quicinc.com>, "Sam Ravnborg" <sam@ravnborg.org>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Andy Gross" <agross@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Linus Walleij" <linus.walleij@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
 <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
 <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
In-Reply-To: <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>

On Thu Jan 11, 2024 at 8:05 PM CET, Linus Walleij wrote:
> On Thu, Jan 11, 2024 at 4:28=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.=
com> wrote:
>
> > In some internal documentation it says "LCD Driver IC" "HX83112A" and I
> > don't see any reference to Truly 5P65 anywhere.
>
> In the Android directory I pointed to I see this file:
> HX83112_Android_Driver/Truly_5p65_module_fw/UpdateFW.bat
>
> (Notice the 5p65 fw dir is *inside* the HX82112 dir)
>
> And in that file:
> adb push TRULY_5P65_1080_2160_HX83112A_D01C01.bin
> /system/etc/firmware/Himax_firmware.bin
>
> Clearly indicating that they are pushing a Truly 5P65 firmware into
> the Himax display firmware directory.
>
> To be fair, that is the driver for the touchscreen part of HX83112A,
> but ... Truly is a well known manufacturer of display controllers?
>
> But... given that you have a @fairphone.com mal address and
> a working relationship with them, can't you just ask?
>
> > On their website they have this sentence:
>
> All OEMs want to look like everything is their own product. It is
> business as usual.

I can't tell you anything there that I don't know, sorry.

>
> Further on the same note since I guess you have a datasheet)
> please bring in #defines for the commands (the first byte in the
> write sequences, for examples:
>
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd8,
> +                              0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, =
0xff,
> +                              0xff, 0xff, 0xff, 0xff);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x03);
>
> Clearly 0xbd is HX83112_CMD_SETREGBANK?
> (This is easily spotted from the similar structure in the
> existing panel-himax-hx8394.c.) So please add #defines
> for all commands you know, especially if you have a datasheet
> because we reviewers don't have them and "it's just magic
> bytes" isn't very compelling. It adds a lot to understanding.

Right, the register names seem to match more or less the ones from that
driver, plus some new ones and some differently named ones. Will send a
v3 with that.

>
> I strongly suspect other Himax displays such as HX8394 to
> be using a Truly controller as well, hence the similarities.
>
> In a datasheet for their TFT800480-84-V1-E display controller
> Truly kept the init sequence name of void LCD_INIT_HX8290(void)
> for example.

In that datasheet (assuming I'm looking at the same one?) it says
"Driver IC" "HX8290-A[...]" so there the display driver is manufactured
by Himax and not Truly to my understanding. Truly is assembling together
Driver + all the other parts that go into an LCD.

For the panel used on Fairphone 4 that part is done by the company DJN.

Regards
Luca

>
> Yours,
> Linus Walleij


