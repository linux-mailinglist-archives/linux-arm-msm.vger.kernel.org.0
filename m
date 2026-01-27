Return-Path: <linux-arm-msm+bounces-90812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDyoAg/eeGn7tgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:47:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D019709A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1978930B6B4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB48D303A18;
	Tue, 27 Jan 2026 15:41:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB783033DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528491; cv=none; b=m+2GKAcp+npgzAxlv2KGFC1PBSMcOY7rfxdmymcMVH9wkF7Q/o6SE72pw+fIEgXMAbl1nbzfovttjbCQNZlnCLTkWmaAlMTW9i06UgdeIMjkvoMpGv/ZZ0wKRdi2wNshwx7fvllXJQipKsqKftPKWAqp1NM4v07N+Uj78eSqSEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528491; c=relaxed/simple;
	bh=QPF7Zu2r+fCfqNyJkt1Bte+V+ziLRm+jV4lSeXPHZEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4hYXilRRo+5q0pSbd0kjHSytZ8DmqHSbcaUESAoNEiK+2lVkEt6GkF2rBD+ixPUaIG8aK0dtjtQdZSrohhOLTuf5RAvvVRBSl0YxuBG2yGWJM8ITri4q0ytmUISekvmPEX+xY8yxrGlnq5qy8Z61pU1b0fXB3hWobBFPnH9MQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-5665171836cso2474938e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:41:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528489; x=1770133289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3iP0W+rICWiFtIz9Lnj4u7VRlu+Bycye5GdS1BEDSM=;
        b=A4t4lJrBoCCXhBp3LTUmFgxtW1AQFekhYj+j/3qjxVDy5/ktcz6RvIYb3LA+S17Hoi
         vXhh5YxT5YjdHvzM5WQpYE1uH7ri89huzsQz60OLn/NmLbEbo45hkFp3uX2xCV9wD+In
         CO2PqFkiC/TykP9YRara/WwPVTn7lOq38qaAu4cpTiENSCTv82vLHsm2dqcAQI9P0ss7
         ibIHttOz/l2gweBZYO9cHmq9jL/NvgFJMtQ2ZExfJeWIb2XC7JUEflmCpKGAG+SHS3+2
         kKdDGA7fmhk0O2QBKqHptGhnp1A59vqiW8bhV5Ek4bjSpVQmZ3/Lr8u7M14fWIYUw/bc
         D0/g==
X-Forwarded-Encrypted: i=1; AJvYcCXedhznuoa8T6TT1OGoDPzaS1tjaJvpHAisKwWzoPTGHHVs6x7GnZAJy+mY44SBmfy5y+OPec0rvgU/gvjC@vger.kernel.org
X-Gm-Message-State: AOJu0YxFtp4NRrlEsiWtdd+yvXQLznB2ofzrvVM+RPF0ng1YuvgxD/SO
	1G6NBZpWRWqLmA4QmDo8aIrJH/JnzV2pm+UXzuzT2T8O1B9mtP55vX4ZsjyAVLM+Cw8qTA==
X-Gm-Gg: AZuq6aLdtHrMHcnl8Ls2dKgQOGFAR6CTI2x+MbwEExOta5zkz2AGkGXPHcaQeYXDg/G
	QhcD5JS8NHYQELPzm7llzllnyMb0+8lP/B64edGTMczEYdRJJm+dMoSvYJ/J7Jqz6qSUa9j0TVg
	xE+RoBHjY9WnPNlBWpoHVSQqRApSXMcnQfl7Bhyc1w5TlPxAeUTQqAUxs2cMCK5tHLJ5z1vxnb/
	F0cSEj5JqjEeppNiu2d3HfcqabOo7OgIDICRH+/DmtmljVAXejvo10mD3VDHobPOy55rUEJOaGh
	6iiqASIMpfc9WTIhNbnjtqstcK+hihQVn95GZ+C9/YwoXKmxDvQYB2wxuVVhLZuQnMeaBliGBZa
	5TZjSobAUucYF2wYDg7UcmKUH4C/lxO4KCcjb+NvjxfuRg9AfPqo5/9yItWm2WLPCzJi7gmoiqk
	K7oMln1NZiuy85d06uysfk7U3Tf4hRdTa+u7d3xtrKTwXMXRyi
X-Received: by 2002:a05:6102:3746:b0:5f5:514f:e03d with SMTP id ada2fe7eead31-5f7237dbdebmr979133137.24.1769522555388;
        Tue, 27 Jan 2026 06:02:35 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d40f866sm2443171137.4.2026.01.27.06.02.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 06:02:31 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9480ad20274so4381982241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:02:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEe0vS5uPZxDzA3ckocDAtdYPLMNLoNSxxwa7jjEVqwK5hVS85sECZa6SfmokDFrSXybKIY8Dcrx4K0x0C@vger.kernel.org
X-Received: by 2002:a05:6122:340e:b0:566:2568:df1b with SMTP id
 71dfb90a1353d-566794c0a54mr742458e0c.2.1769522547250; Tue, 27 Jan 2026
 06:02:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
 <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com> <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
In-Reply-To: <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 15:02:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
X-Gm-Features: AZwV_QhN9K-WsMdmqL2nfJrvZ40lsYIN6kZoo7JRPE4M6cKNWw4lsg30FvWZJqY
Message-ID: <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-90812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,linaro.org:email,mail.gmail.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: 57D019709A
X-Rspamd-Action: no action

Hi Neil,

On Tue, 27 Jan 2026 at 14:55, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> On 1/27/26 11:20, Geert Uytterhoeven wrote:
> > On Tue, 27 Jan 2026 at 10:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> >> which connects over PCIe and requires specific power supplies to
> >
> > Here: "requires"...
>
> Sorry I don't understand

Please read below the continuations ("...") below...

>
> >
> >> start up.
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> >> @@ -0,0 +1,55 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
> >> +
> >> +maintainers:
> >> +  - Neil Armstrong <neil.armstrong@linaro.org>
> >> +
> >> +description:
> >> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
> >> +  The UPD720202 up to two downstream ports, while UPD720201 supports up to
> >> +  four downstream USB 3.0 rev1.0 ports.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: pci1912,0014
> >
> > Just wondering: how does having a new driver
> > drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c matching against this
> > compatible play well with normal PCI discovery and probing of
> > drivers/usb/host/xhci-pci-renesas.c?
>
> In Linux, power control is implemented as a platform device driver,
> so it doesn't collide with the pci driver.
>
> The pci driver won't probe until the device shows up on the bus anyway,
> so he power control will attach as platform for this purpose.

OK.

> >> +  avdd33-supply:
> >> +    description: +3.3 V power supply for analog circuit
> >> +
> >> +  vdd10-supply:
> >> +    description: +1.05 V power supply
> >> +
> >> +  vdd33-supply:
> >> +    description: +3.3 V power supply
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >
> > ... but no power supplies are listed here? ...
>
> None are stricly required, they can be supplied directly without
> a passive regulator. Not sure they should be required

So the goal of this binding is to document the required power supplies
which are not required? I am confused (but that could just be me ;-)...

> >> +examples:
> >> +  - |
> >> +    pcie@0 {
> >> +        reg = <0x0 0x1000>;
> >> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
> >> +        #address-cells = <3>;
> >> +        #size-cells = <2>;
> >> +        device_type = "pci";
> >> +
> >> +        usb@0 {
> >
> > The actual DTS uses "usb-controller".
> >
> >> +            compatible = "pci1912,0014";
> >> +            reg = <0x0 0x0 0x0 0x0 0x0>;
> >
> > ... also not in the example?
> >
> >> +        };
> >> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

