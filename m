Return-Path: <linux-arm-msm+bounces-16320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469E89748C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 17:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A9FC294B01
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 15:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C98814A631;
	Wed,  3 Apr 2024 15:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wh0JsEq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6C314A61C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712159590; cv=none; b=lktM7fGXM0c71UK8wYKhJ72VOXjI8Nv75p1VHZYBVxRhq0OoUNvGJKpTuJx3g1cuoRmzFA+bK3XnyIz+GWyb3Aa3Hxsovk5kWevQuXydJtGLF3tWebd6ZrGhJujKRIW4RjOf0wk7fDm4I58RxE7VOgqS95gJMgRGjSp2t/ZL8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712159590; c=relaxed/simple;
	bh=ZDg0KQ0iWZU2ZGWemXowPBB9KN1D2XkPEqdi22YbXzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbm+sCpPslAj1HpcslbdcfNDCgvlY/uhgVserkSJsSJjOO0oVg6zXsdVqRPTyNJHEOqAdq7xW3A+F0tRWQqxdpMDULOX6xwykY0wNXJJTaHBs7lP56LU86GSzQ91FNmqme/gIuXDj+xoK4CLidBbMr/pjZUfzVFzLZaWkWQxb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wh0JsEq+; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso31076276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 08:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712159586; x=1712764386; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/yiMC5R+kTJY6W41EC/ZaB+VdKDo+c8x7WrU9W465mY=;
        b=Wh0JsEq+OFVG3C54nTcPrinCXF0Sl//GcG52gfP+W6HgPvQT9I69hgWDBhUHvGxPbC
         GZNxtqNVzN0ri3mao7TwkRleubRkao+3LFJcDplllvKSuIE9eItKcrwJeopNqEcilIX5
         K/6krrlLs0otfK5mhpig+Axg6N6wUlbUF9IK0OeWoeKSMmMD+ShpiDq5OvBBF1E6ZFzF
         CyfKR16CGqo/SHq78DgIAkI7r0uWHdPflviGHWGaeVFObT2mJNtePkgqX7VMIdSQa8Cx
         9x9avxB6ZEkrr84lhuZiDTJZBfH72QpGc3Lx3suHQ/AasaDiSeLu4STeIkRUyxFiJZFz
         TNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712159586; x=1712764386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yiMC5R+kTJY6W41EC/ZaB+VdKDo+c8x7WrU9W465mY=;
        b=HgIysjWffQYx31pNyFG4Uciq7qOwyizvq/n30kB679Yoom/gvi5BAcky4/YmTzgNiH
         IfT9Kbj9xFTEvydu8Ao8GKtLYcjQYbHcKwlJdToUrc5Z0g77Exiz69JVtKsHbvACrUAe
         /0DmGhy/Y6E8bUNluXT5eIaGdVXCnOaHvHcUMsIKdBXBnB5T8pouHxS7dn9oSRLi/vWA
         C6ZibcBn8m1o+dmXn5GaL7hHPdwlQJMpRdHAwEUlJMcAvbqwtvtdA0r6WlYCRpQhz78l
         lVW0KgiQo8QjpydLQl/PDsPpJjUreVCw/ICXQcxOXa0WfGEVW4QlUMsOWDaEYYrEK2s2
         dwxg==
X-Forwarded-Encrypted: i=1; AJvYcCVenOzPWviOK5EGlTQ3853Sfo1ASHmztsqQlMFAbporskX4ZyhvxrJp336YPTYdjgm0UOd2ariHpoA8oOs9K5v7N58x/6c83aB0LvkGTw==
X-Gm-Message-State: AOJu0YxGfntapr8UPRDNo9MAM1uChuq44tGFJkrGNjXL7FeIgyWgBzs9
	9A/j+AYFkfzsM8dEty5FSOJ2WbwxvhPgUscjEHQ0FR/tgyXQ8gXioX3MWF7hmNrvXdljxaCCMyf
	tzoEgj0ym0k0FLNkY4AUgth79IQiRSugmRoheaA==
X-Google-Smtp-Source: AGHT+IFYYTj23BFPwhBEl3t/Qa3q2nRotj6Lz3gJyO4nsNuTMND7tLhJ6hpSru3fI59jMNl2QnjPzHz6m9ynV88kfR4=
X-Received: by 2002:a5b:6cd:0:b0:dcf:c7ef:e4e0 with SMTP id
 r13-20020a5b06cd000000b00dcfc7efe4e0mr2821320ybq.1.1712159585683; Wed, 03 Apr
 2024 08:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319091020.15137-1-quic_kbajaj@quicinc.com>
 <20240319091020.15137-3-quic_kbajaj@quicinc.com> <CAA8EJprXPvji8TgZu1idH7y4GtHtD4VmQABFBcRt-9BQaCberg@mail.gmail.com>
 <Zgs7Yau1/jYvys4i@hu-bjorande-lv.qualcomm.com> <5354493b-63de-43bb-9871-73918f123661@quicinc.com>
In-Reply-To: <5354493b-63de-43bb-9871-73918f123661@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 18:52:54 +0300
Message-ID: <CAA8EJppNZrLzT=vGS0NXnKJT_wL+bMB9jFhJ9K7b7FPgFQbcig@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qdu1000-idp: enable USB nodes
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Komal Bajaj <quic_kbajaj@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amrit Anand <quic_amrianan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 10:50, Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 4/2/2024 4:25 AM, Bjorn Andersson wrote:
> > On Tue, Mar 19, 2024 at 11:52:15AM +0200, Dmitry Baryshkov wrote:
> >> On Tue, 19 Mar 2024 at 11:11, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
> >>>
> >>> Enable both USB controllers and associated hsphy and qmp phy
> >>> nodes on QDU1000 IDP. Add the usb type B port linked with the
> >>> DWC3 USB controller switched to OTG mode and tagged with
> >>> usb-role-switch.
> >>>
> >>> Co-developed-by: Amrit Anand <quic_amrianan@quicinc.com>
> >>> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
> >>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> >>> ---
> >>>   arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 65 ++++++++++++++++++++++++
> >>>   1 file changed, 65 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> >>> index 89b84fb0f70a..26442e707b5e 100644
> >>> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> >>> @@ -46,6 +46,33 @@ ppvar_sys: ppvar-sys-regulator {
> >>>                  regulator-boot-on;
> >>>          };
> >>>
> >>> +       usb_conn_gpio: usb-conn-gpio {
> >>> +               compatible = "gpio-usb-b-connector";
> >>
> >> If this board has only a USB-B connector, can it really handle USB 3.0?
> >>
> >
> > Here's a USB 3.0 Type-B cable, so no problem there:
> > https://en.wikipedia.org/wiki/USB_hardware#/media/File:USB_3.0_plug,_type_B_-_1709.jpg
> >
> >
> > @Komal, please confirm that this is the connector you have on the IDP?
> >
>
> Hi Bjorn,
>
>   Sorry for the confusion. The QDU1000 IDP has a Type-C connector. The
> type-c switch present between SoC and the connector is HD3SS3220 (from TI).
>
>   I think Dmitry's comment was that if it is 3.0, is it Type-C ? and if
> it is Type-C, then the compatible written in the being
> "gpio-usb-b-connector" would mean that there is a Type-B connector for
> someone who looks at the DT. (Dmitry, Please correct me if I understood
> the comment wrong).
>
>   I tried to push a series for adding a compatible to gpio conn driver
> [1] to resolve this and explained the connection specifics to Dmitry [2]
> and he suggested me to add a compatible for just the switch present on
> qdu1000 idp.
>
> Dmitry, Krzysztof,
>
> I was looking into the code again and it turns out there is a driver
> specific to HD3SS3220 switch [3] in linux already. I tried to check if
> it can be reused here but that driver relies on I2C communication
> between the SoC and the HD3SS3220 chip to get information on role
> switch. But in QDU1000 IDP board, there is no I2C communication present
> between SoC and the switch. Those lines have been cut off. The SoC only
> knows about VBUS/ID pins (other than DM/DP/SS Lanes) and no other I2C
> connections between the switch and the SoC. We still need to make use of
> vbus/id pins to decide which role we need to shift into. Can we still go
> ahead with using usb-conn-gpio driver by adding the compatible
> (qcom,qdu1000-hd3ss3220) and using it in DT ?

Is Qualcomm a manufacturer of the device? It is not.
Is qdu1000 a part of the device? It is not.

So the compatible string should be "ti,hd3ss3220". Which is fine to be
used in the platform driver. Just describe the differences in the
schema.


>
> Let me know your thoughts on this.
>
> [1]:
> https://lore.kernel.org/all/6f2df222-36d4-468e-99a7-9c48fae85aa9@quicinc.com/
>
> [2]:
> https://lore.kernel.org/all/6f2df222-36d4-468e-99a7-9c48fae85aa9@quicinc.com/
>
> [3]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/typec/hd3ss3220.c?h=v6.9-rc2
>
> Regards,
> Krishna,
>
>
>


-- 
With best wishes
Dmitry

