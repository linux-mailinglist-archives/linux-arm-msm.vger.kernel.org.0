Return-Path: <linux-arm-msm+bounces-43670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E879FE905
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 17:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7900018825CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42181AAA1D;
	Mon, 30 Dec 2024 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA8vzfn+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3649919ABA3;
	Mon, 30 Dec 2024 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735575803; cv=none; b=X0E8hALFEvvLmBGdd06mg5RCCWq8/pf/MNLevDpCmad4WsEUDgkLRFclERPrOypcq4Sf/EqISxmOBb5ae9OOgch3bRmuIInAcgoLBNeF1q4ImMFBBnbpClRMctKhpGs6jefevTqDXVcdnRYF6d33+1xNzVZx0+vc5uYBFHCPl+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735575803; c=relaxed/simple;
	bh=WCDd1WFvb0By3z4kEVfAfGMFgCJKdxQTdHM6nF0i27U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FXFK7jm0jjTu53Zs0VgQx+T4ierFbcoPTKmjZbHHkRwjbdNPno6z2xyL0kTZW1T2NQKB4Vpr5bU2Fg8Yw3YXrywtMe/uv3o9BGbjHgZEV5OBOzRTdwhF79jPSIQ17FXW5ziVEPE6DvAZWGZFiUbs4KzBQcg9GvbCKdM01Ner15E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA8vzfn+; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21675fd60feso160926185ad.2;
        Mon, 30 Dec 2024 08:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735575801; x=1736180601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQYiqjijoXv8UNTxSWkMBDgGIXf88c4tiPOnipcOFPA=;
        b=BA8vzfn+zKGx9YHdpI3tWH8FG3EdTcJTgbg22HAz72Upbbv7aa8byRq+vvjR0Xzfeo
         ur+KaT22zcpzEvJbiulrMwWh8+SpJKRNrL3SCJ3TUupoFWvLGG0PAdgA4ruxHXe5i5/v
         Iqxo+SI6I8GsxmQUI9f4o5oPCB+Bk0vf2rfnFPr24DQnHjAYTvYSkmDPnzRNFibwxhQN
         eLnBmVB/PJ22mcsuOLjZpEmJzTPFQ4Fipz02ZJXrS6m2VlnVzEu0SsB1qerT/Swgyynl
         QDOAkiZu5Sl+Dy8BHaRN3T8RBq4AVhWiuIrjcgX2BFlSjmfhUL5vP32uJ+UJj23ol/Ai
         j1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735575801; x=1736180601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQYiqjijoXv8UNTxSWkMBDgGIXf88c4tiPOnipcOFPA=;
        b=cic2tcG0UfnCxBzQDhoGEwnx9s0UeA9hqXuhBc9f2KXrUbwWMU1oZPDpQKtf6WEsmJ
         QSweTXxGA+E4PxGlz7Ou+o4wE/HYlSTxpTcD0CTCMwaDJBAlov2U36C9vNjwSwyeXwt2
         rs/iggLCP1Zaj8iXCXuQf5DWPRLRF3TJRvqTjfsBzuUlTgZVQn/yQQHgDJdjKmLngXQv
         OdIBrpffHh2tg5IqOiHskNU8oHdIHjG+GVkqw43yJYqUSpQzlaMovNNVuIfoenMO3MT+
         5qi3ZT/Sch0xKQ/XSlCrw+RuPoOsEoOetGK3O9JoTrK4hZ54s6GZw3p9XR9rvx6zKEah
         W3wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwb5+acj72TERgANPy+WYNsKU7jm/PdIPE2UYP7wGZmBYQWwCwjIzq7ds00LRGl46KN9PeJrPGkHVac2SG@vger.kernel.org, AJvYcCV/5f2i24pL3uy6Ct4Tgc/6CyoENvt1Cw0X5wQnkVbiPUf3CtcQEZ4vrmlL71lS9WGlsClXdb+Dg31aadnTJg==@vger.kernel.org, AJvYcCVcGojwvQNSPtRGyq73cMssiw2pad3x4QUe5MOcjxIYjLu9LE6u0oYyi2wxx2gGXynadfQFWazlSenw@vger.kernel.org
X-Gm-Message-State: AOJu0YzERyph9WomdKgULWa5UYw5itBd0FSoGxcr6C9UObkjgMIvSzrk
	LWN+kxpZ8tLVSC1jxp26VzN+MLxNAX/N5d/IIB5LRJjUG3QJfspH
X-Gm-Gg: ASbGnctpkaCcMrcb4wSjbOwAmdfoGAp48r8bQBZqMcJLLyTrtti9g7U7sF87Yeo52q/
	xBOMQA55tOzzIVqVCNQfFm8yvF6rEe76k7z+VwNfOJxSS8BxstGP4CgLVto0vCMbeJWFPlFl5Qi
	9Zi4CRSzA8oTVX8uQFI/M1/gzOMDD3RiZLdXUMSteIXd3kZ37E4/WYdaf+kRieKb12t8X0y7DtJ
	opz7eLpgO7qwGxjNaAmxddWapPYVt7SkZbCBgw7TwI=
X-Google-Smtp-Source: AGHT+IE48QVyDFLeW86PUtRo7/jyP+zksegKf+r5HNmFUREC7vOKXtPWXgGakIwHzViIbo16+OiwjA==
X-Received: by 2002:a17:902:e892:b0:216:73f0:ef63 with SMTP id d9443c01a7336-219e6f284e4mr540882685ad.49.1735575801349;
        Mon, 30 Dec 2024 08:23:21 -0800 (PST)
Received: from nuvole.. ([2a09:bac1:76a0:dd10::2e9:e5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f7e49sm181011685ad.217.2024.12.30.08.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 08:23:20 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	chenxuecong2009@outlook.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	johan+linaro@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: gaokun3: Add Embedded Controller node
Date: Tue, 31 Dec 2024 00:22:05 +0800
Message-ID: <20241230162206.215196-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <480eddca-97f1-4bc0-ab1f-22b14407e0d9@oss.qualcomm.com>
References: <480eddca-97f1-4bc0-ab1f-22b14407e0d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Dec 30, 2024 at 10:53 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 27.12.2024 6:13 PM, Pengyu Luo wrote:
> > The Embedded Controller in the Huawei Matebook E Go (s8280xp)
> > is accessible on &i2c15 and provides battery and adapter status,
> > port orientation status, as well as HPD event notifications for
> > two USB Type-C port, etc.
> >
> > Add the EC to the device tree and describe the relationship among
> > the type-c ports, orientation switches and the QMP combo PHY.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 139 ++++++++++++++++++
> >  1 file changed, 139 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> > index 09b95f89e..09ca9a560 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> > @@ -28,6 +28,7 @@ / {
> >
> >       aliases {
> >               i2c4 = &i2c4;
> > +             i2c15 = &i2c15;
> >               serial1 = &uart2;
> >       };
> >
> > @@ -216,6 +217,40 @@ map1 {
> >               };
> >       };
> >
> > +     usb0-sbu-mux {
> > +                     compatible = "pericom,pi3usb102", "gpio-sbu-mux";
> > +
> > +                     select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
> > +
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&usb0_sbu_default>;
>
> Please preserve this order:
>
> property-n
> property-names
>
> > +
> > +                     orientation-switch;
>
> This
>
> > +
> > +                     port {
> > +                             usb0_sbu_mux: endpoint {
> > +                                             remote-endpoint = <&ucsi0_sbu>;
>
> And this section have incorrect whitespacing (one tab too many, make
> sure you set your tab width to 8 spaces)
>
> Same for usb1-sbu-mux
>
> [...]
>
> > +     i2c15_default: i2c15-default-state {
> > +             pins = "gpio36", "gpio37";
> > +             function = "qup15";
> > +             drive-strength = <2>;
> > +             bias-pull-up;
> > +     };
> > +
> >       mode_pin_active: mode-pin-state {
> >               pins = "gpio26";
> >               function = "gpio";
> > @@ -1301,6 +1426,20 @@ tx-pins {
> >               };
> >       };
> >
> > +     usb0_sbu_default: usb0-sbu-state {
> > +             pins = "gpio164";
> > +             function = "gpio";
> > +             bias-disable;
> > +             drive-strength = <16>;
> > +     };
> > +
> > +     usb1_sbu_default: usb1-sbu-state {
> > +             pins = "gpio47";
> > +             function = "gpio";
> > +             bias-disable;
> > +             drive-strength = <16>;
> > +     };
>
> Similarly, please keep drive-strength above bias for consistency
>
> lgtm otherwise
>

Totaly agree, I was in a hurry, I will fix it in v2.

Best wishes,
Pengyu

