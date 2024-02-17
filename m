Return-Path: <linux-arm-msm+bounces-11513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BF9858C78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 02:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E3E4280CA2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 01:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEC71947E;
	Sat, 17 Feb 2024 01:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+TJZHRZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F31CA8E
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 01:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708131704; cv=none; b=uEVcrpP5Spv0MDd9dFx5idYXdHPojcBkDlPYl+hTl3Q4ZYcyxuY0ooolWR396ni6Hsjzp1WPJPS76+Nqt+nKqCKkhdSB9sNYp9v3UQ2ozjdWQwR/2+1+kFqMorvLle/ER53vdMnMLJ41fRW2lfil+Wrb+rJuIy4S4cZ2vu/bRhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708131704; c=relaxed/simple;
	bh=3fOi1RpEFfGtHQFy2nY0FxbZDHwiclU4pVgSPHtzLqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ft5K/V1z2aoOVHVb/mdCIWuWBR2n+D8c/4I4OlKxcZebcHZ18v4Qr0W68DmFjwHqhTy7IdUFyScSuKecp2rRHbbXZqVfLnm7tK+TsvZZm5dtjfpjBBhMlkVWfCWOnZu8EUK5tvrJM8T6rucKuVp2NS9KXgvcvEMTQGi/DEkOLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+TJZHRZ; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60802b329c4so10427737b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 17:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708131701; x=1708736501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HT931xXHpjEVVCsIg8ym8dsdNr3qjjA3Pmduj1s/d8k=;
        b=q+TJZHRZVcjXo2+Ctqgxz+iV99kkYlBizvXr9x1eSwvJhHxcx675kKrCPUIkPDieWx
         lDrnBbNXXY1Q6YHTAEg/ahkU5oUltX07dxpeWfrdowocayoYkvYMSSlJBhn4MDwOnVHk
         jLpGlZ29m3f6+qTZHqNY8hjD2906b9WVKXkSED03owyUgdY5w5tKH5OeQuX2csG4nryZ
         K5LuEkuSyr9fbUBAAQ+pXFl5ARaqqlQr3lr4iaw7EZwH6LF4en4kasOlh6xpt3OFaaXv
         Ub/55xseomWQnyEXlW3o6VoV8pZUVxgQo5uAF7q9PL5lLbgJ+I40kG8cOwVfj9qhxIEZ
         HrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131701; x=1708736501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HT931xXHpjEVVCsIg8ym8dsdNr3qjjA3Pmduj1s/d8k=;
        b=LRbKALqafNE7DOgUmjDuuefLNf86J3L1EQ4Mvkh49zFGn96fbDdT4hQoo2k+yK69KW
         nw8MRL5AsuPj9IDvDTb48bKDMm0fiexZiQ2T67RvL9JSvjagrIW4d/QhdoEWPOBfdxOy
         OVoNGPEftboY9hbSs/NJzv67D2gClThOVKi4XsulUGJVivQu6y/mxolY2SzV6ovAmWrf
         3E8/78GfGXt/tw0ttlpMfuqBBVBYUCLQjR+ORX1PR87Uan0jQ/dcXeBeteW9AnWIQR+T
         VD+eisThO5RrreEfnPj7bVzhH9zIvwkCZjrFm1oAIGN0uFhokyekYWdaSjcZaH1LyzUF
         scTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKzSn17VvU40wXzvqXNHutUzbPho7/MoSWHLTZxIWwi2gPVYV7Rh4YuyuunPyGwcZUewyef9iV0Jh6anBaNeFcPKMvzEQvnFy+K6Ql7A==
X-Gm-Message-State: AOJu0YyOt9poHag/K1vWV1OqwN/2Zuq9eqGwLb4DlMcK0CZ9dFB0U7Al
	PznZeIzyltwC3L0K9FencBoDy27lNBBXbcVlixjf8VuCZ0wNQqqFuFUzJ46MOFpt3D0B6wNJPvb
	qu9cSfX+gNu6NJ/sRmW02BfpFHrWJkQanWe30Ww==
X-Google-Smtp-Source: AGHT+IFV8GlXxO0L+LPYuQ2jPN3/yZ2gKgHdpBVfLSqkAI6BM+J5M3u4PlGgMObe5C5CeFXhA6U4RiwdZf6XK1XP/os=
X-Received: by 2002:a81:7b43:0:b0:605:a557:6b47 with SMTP id
 w64-20020a817b43000000b00605a5576b47mr6835757ywc.12.1708131700957; Fri, 16
 Feb 2024 17:01:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213082724.1789096-1-quic_kriskura@quicinc.com>
 <20240213082724.1789096-3-quic_kriskura@quicinc.com> <efbd57e8-6cbb-480e-b2d5-1d064a27b3a4@linaro.org>
 <mko2tdjrc4fbpbuig7o4jbznzxr7y6fsw42synu6yur4qzjgtt@nd7eyojiruvd>
 <1a033944-9361-4576-8807-35a68c1e8548@linaro.org> <bwy4gpmhjkrumow6yjas6rww3eqzjheondafoenyvh3ugsp7oo@6jlpt5cx6zty>
In-Reply-To: <bwy4gpmhjkrumow6yjas6rww3eqzjheondafoenyvh3ugsp7oo@6jlpt5cx6zty>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 17 Feb 2024 03:01:29 +0200
Message-ID: <CAA8EJppf+j6H8vPOrer1Oj6SuM=qHKXoBahtCaCr7an-cbpyOQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8295p: Enable tertiary
 controller and its 4 USB ports
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Krishna Kurapati <quic_kriskura@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 01:33, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Thu, Feb 15, 2024 at 09:19:39AM +0100, Krzysztof Kozlowski wrote:
> > On 15/02/2024 03:41, Bjorn Andersson wrote:
> > > On Tue, Feb 13, 2024 at 09:39:51AM +0100, Krzysztof Kozlowski wrote:
> > >> On 13/02/2024 09:27, Krishna Kurapati wrote:
> > >>> Multiport USB controller (host-only) of SA8295 ADP has 4 Type-A ports
> > >>> exposed for connecting peripherals. The VBUS to these peripherals is
> > >>> provided by TPS2559QWDRCTQ1 regulators connected to these ports. Each
> > >>> regulator has an enable pin controlled by PMM8540. Since these regulators
> > >>> are GPIO controlled regulators, model them as fixed regulators and keep
> > >>> them Always-On at boot since we are wakeup capable and we don't need to
> > >>> turn them off on suspend. Also since we don't enter device mode, these
> > >>> regulators can be kept on.
> > >>>
> > >>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > >>> ---
> > >>>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 83 ++++++++++++++++++++++++
> > >>>  1 file changed, 83 insertions(+)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> > >>> index fd253942e5e5..49418843c214 100644
> > >>> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> > >>> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> > >>> @@ -9,6 +9,7 @@
> > >>>  #include <dt-bindings/gpio/gpio.h>
> > >>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > >>>  #include <dt-bindings/spmi/spmi.h>
> > >>> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > >>>
> > >>>  #include "sa8540p.dtsi"
> > >>>  #include "sa8540p-pmics.dtsi"
> > >>> @@ -108,6 +109,46 @@ edp3_connector_in: endpoint {
> > >>>                   };
> > >>>           };
> > >>>   };
> > >>> +
> > >>> + regulator-usb2-vbus {
> > >>> +         compatible = "regulator-fixed";
> > >>> +         regulator-name = "USB2_VBUS";
> > >>> +         gpio = <&pmm8540c_gpios 9 GPIO_ACTIVE_HIGH>;
> > >>> +         pinctrl-0 = <&usb2_en>;
> > >>> +         pinctrl-names = "default";
> > >>> +         enable-active-high;
> > >>> +         regulator-always-on;
> > >>> + };
> > >>> +
> > >>> + regulator-usb3-vbus {
> > >>> +         compatible = "regulator-fixed";
> > >>> +         regulator-name = "USB3_VBUS";
> > >>> +         gpio = <&pmm8540e_gpios 5 GPIO_ACTIVE_HIGH>;
> > >>> +         pinctrl-0 = <&usb3_en>;
> > >>> +         pinctrl-names = "default";
> > >>> +         enable-active-high;
> > >>> +         regulator-always-on;
> > >>> + };
> > >>> +
> > >>> + regulator-usb4-vbus {
> > >>> +         compatible = "regulator-fixed";
> > >>> +         regulator-name = "USB4_VBUS";
> > >>> +         gpio = <&pmm8540g_gpios 5 GPIO_ACTIVE_HIGH>;
> > >>> +         pinctrl-0 = <&usb4_en>;
> > >>> +         pinctrl-names = "default";
> > >>> +         enable-active-high;
> > >>> +         regulator-always-on;
> > >>> + };
> > >>> +
> > >>> + regulator-usb5-vbus {
> > >>> +         compatible = "regulator-fixed";
> > >>> +         regulator-name = "USB5_VBUS";
> > >>> +         gpio = <&pmm8540g_gpios 9 GPIO_ACTIVE_HIGH>;
> > >>> +         pinctrl-0 = <&usb5_en>;
> > >>> +         pinctrl-names = "default";
> > >>> +         enable-active-high;
> > >>> +         regulator-always-on;
> > >>
> > >> Why all these regulators are always on? If USB controller does not probe
> > >> for any reason, why keeping them enabled? These must not be always-on,
> > >> but instead used by connector as VBUS supply (or by whatever you have
> > >> there for USB).
> > >>
> > >
> > > I'm not too concerned about keeping the lights on in this scenario, but
> > > if we can describe this properly let's do so (and let's do so on other
> > > boards with connectors as well).
> > >
> > > We'd have a set of usb-a-connector nodes, that we can tie to the nodes
> > > in the USB/phy, and the supply. But so far we've associated a connector
> > > with a port manager, here we don't have one of those, so where would the
> > > node reside and who should acquire and drive the vbus-supply?
> >
> > usb-connector binding has vbus-supply and its node could be top-level.
>
> Introducing usb-connector nodes toplevel, with vbus-supply sounds
> reasonable. But to my knowledge there's today no way to acquire a
> handle to that regulator, unless you have a struct device for the
> connector node.
>
> > However don't some USB phys also take that regulator?
> >
>
> I don't think it's appropriate to add the supply to any of the phys,
> some of the connectors has 2 phys others has 1 phy.
>
> Representing the vbus in the connector but driving it from the phy
> (we will need to figure out which one) sounds reasonable. We just need
> to make sure this doesn't conflict with the fact that some TCPM
> implementations also seems to drive vbus.

I think vbus can be toggled from the dwc3 controller itself rather
than from the PHY.

>
>
> I would like this to be properly modelled, but it seems reasonable to
> punt that to the todo list for now.



-- 
With best wishes
Dmitry

