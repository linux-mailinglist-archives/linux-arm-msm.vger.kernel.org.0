Return-Path: <linux-arm-msm+bounces-5754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB481B8E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 14:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68E4A1C24199
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 13:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AD353A14;
	Thu, 21 Dec 2023 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I6x0h0NA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1594253A10
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2339262835so86531166b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 05:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1703166328; x=1703771128; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G4IpIXZDkNfAYijfdIEK2DiPVk5MoCvUYEoHZOpo58=;
        b=I6x0h0NA4VQ7j/UCkYIZLUEn2Duij5YT6h0yMS9xnMoqNIeM01XvH1vNuhD52A2AeF
         9XXHpqHQIbLqh9myfDmaCdU2gyzDQonXswnDBMWR59w4gIosmhfvn2rdnS5mbE+CyBdG
         KHo/LE99RzxcGPxbn1rzP4lK23uvEo713ErsjztVVg5CPbzmd/cQb2vF+SDNZiiiLKhi
         +ZWJ5qpNEgJlaqNt/+gjbMCE0erazwV8CCV7AbiIC3wHb5tDIkYUo0XMA/WnNSscXVOY
         XSkVLrEUTKRO3K9bqlpvZFQvkNAJ2fujUGb9Ond49g+R+NBEJ8Q0WW6YSXVjps1BiDXb
         EwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166328; x=1703771128;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+G4IpIXZDkNfAYijfdIEK2DiPVk5MoCvUYEoHZOpo58=;
        b=SaqGpmXCzF89UhmDnws95bFe8+b8Eo6UDyQLWvQFlk5kExe/NUaTykc7vlQx0ok+YE
         +WKNxc4jCjMrdcpdPoorY8Lx6XhYy9ZhdWfE0QJ1efi0Tepy/wYlsDPChIgMayjOEOK2
         7uJaM6+nVdDZ00UUBtRyUercwog+/zgQJS/zrfWwJWeNwg+UB/Il3Ty1k+oFX8rDVGP0
         3XWmk6ZpnQFO5qOKKA5wQBx6gVM62rpOIG47MIpHsSxCyfuoOrUUI+nkLaQFQYH+h7ON
         fkSzSKLG9NbgJ7dfSYWmr8n4bwRFVOeUU2m6KEYQJeXkXAAbb6Jcuvz9laFHeDEt6BPQ
         Upvg==
X-Gm-Message-State: AOJu0YxF7DDBbLvcUoU1YMSd4A99IB7Zn/fRiDEqBfCfTAApTh6Q7GRh
	/AAOhBC2mmiDL2Z+SRQLOJNTkQ==
X-Google-Smtp-Source: AGHT+IF1TcSpVDLsYPf8/142epHuA4cop9nrJVeB7PlkoBnM74MGiYYVSrMXXjB9nFz1R9UGMaRlmg==
X-Received: by 2002:a17:906:4116:b0:a26:8aeb:c363 with SMTP id j22-20020a170906411600b00a268aebc363mr1742055ejk.60.1703166328044;
        Thu, 21 Dec 2023 05:45:28 -0800 (PST)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id kx26-20020a170907775a00b00a1f65433d08sm982553ejc.172.2023.12.21.05.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 05:45:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Dec 2023 14:45:26 +0100
Message-Id: <CXU22OZNAH2H.24YIQWBA4KE3C@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fairphone 5 PMIC-GLINK support (USB-C, charger,
 fuel gauge)
X-Mailer: aerc 0.15.2
References: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
 <8d042095-1e09-45cc-9762-909fe8d663a9@linaro.org>
 <CXTU5MLN0YDS.29PPV8KZF8G9R@fairphone.com>
 <CAA8EJpoD3x=kVLu4x2yLtAqCp=wmGSU4ssq5Oj_SD5VQ=GyAYQ@mail.gmail.com>
 <d2007240-2779-4881-8e9d-1c4f5daa55e5@linaro.org>
In-Reply-To: <d2007240-2779-4881-8e9d-1c4f5daa55e5@linaro.org>

On Thu Dec 21, 2023 at 1:53 PM CET, Konrad Dybcio wrote:
> On 21.12.2023 11:34, Dmitry Baryshkov wrote:
> > On Thu, 21 Dec 2023 at 09:33, Luca Weiss <luca.weiss@fairphone.com> wro=
te:
> >>
> >> On Wed Dec 20, 2023 at 1:32 PM CET, Konrad Dybcio wrote:
> >>> On 20.12.2023 11:02, Luca Weiss wrote:
> >>>> This series adds all the necessary bits to enable USB-C role switchi=
ng,
> >>>> charger and fuel gauge (all via pmic-glink) on Fairphone 5.
> >>>>
> >>>> One thing that could be made different is the pmic-glink compatible.
> >>>> I've chosen to use qcm6490 compatible for it and not sc7280 since
> >>>> there's plenty of firmware variety on sc7280-based platforms and the=
y
> >>>> might require different quirks in the future, so limit this PDOS qui=
rk
> >>>> to just qcm6490 for now.
> >>>>
> >>>> If someone thinks it should be qcom,sc7280-pmic-glink, please let me
> >>>> know :)
> >>> IMO it's best to continue using the "base soc" (which just so happene=
d
> >>> to fall onto sc7280 this time around) for all compatibles, unless the
> >>> derivatives actually had changes
> >>
> >> Hi Konrad,
> >>
> >> I think at some point I asked Dmitry what he thought and he mentioned
> >> qcm6490. Even found the message again:
> >>
> >>> well, since it is a firmware thing, you might want to emphasise that.
> >>> So from my POV qcm6490 makes more sense
> >>
> >> But yeah since it's likely that sc7280 firmware behaves the same as
> >> qcm6490 firmware it's probably okay to use sc7280 compatible, worst ca=
se
> >> we change it later :) I'll send a v2 with those changes.
> >=20
> > Worst case we end up with sc7280 which has yet another slightly
> > different UCSI / PMIC GLINK implementation, but the compatible string
> > is already taken.
> > I still suppose that this should be a qcm6490-related string.
> Right, let's keep qcm then

Ack from my side also. Thanks for the feedback!

>
> Konrad


