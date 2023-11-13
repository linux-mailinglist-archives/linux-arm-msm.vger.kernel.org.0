Return-Path: <linux-arm-msm+bounces-586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4757EA094
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 16:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F1801F21968
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 15:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233981D69A;
	Mon, 13 Nov 2023 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dlw+DE7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988B22136A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 15:52:03 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B922D52
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 07:52:01 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9e5dd91b0acso517774166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 07:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699890720; x=1700495520; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VBQq/GNmlMl4OZYSkNgPQl89PzdV47b+mg6x2mJ9GY=;
        b=dlw+DE7qtuJ2pa+JbircufOEVcIDBm+EEW8c10ounTCvx4nmRCtVz/FvLKVgp4OTts
         z0bXyZPlyUJ2e2rFO1cwSZ/vjwNrom3bxpzoOwdR2YkxOd/rDr+m6yBP9dfIYjZ+xXoo
         KG7c7g09E3ao+9VUMdRIM33x2ooueQGXGXFMr8TsOTugKwkrt4LHgYQmPoE3wc4yi0vA
         vzQM9zKTFNrIXwbW/KqbaMHoO87KtYraCEowFYXJJMaIYhd2VyLnREWxRxAbD+D3+Tdg
         Qd9MutwCaFmAmM1Vbp4ZeCJGd6EUEuuqUcUmk8ojZ+6DmGZhLmbI9z4PrkLdeL7be7qH
         WI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699890720; x=1700495520;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1VBQq/GNmlMl4OZYSkNgPQl89PzdV47b+mg6x2mJ9GY=;
        b=fYclUq9dDmWZdxQOXCtdbIvJYbEfWNGQ8SEZoDbZuhbIyLynEutgZRTdEU1F5t+Xhl
         BVlEQwDjgrykMGOd+oVNqQmMImcMe9VABbSxwQ+i7N3ZbandU7sOTfQGu5Qy9TsGhmUl
         RxAsFx9a45U2yZF2wWpiyu/F8KtGju2LJjalE/CU13DfRhIAzslceDCIdHnLZXK1/uUm
         S0zIYzb7ro1QO43gNcpZDwiBel5ISPy0cawreyfnLvTVkePPv3RKoIets2Ql/gfOdGTD
         VAh28JytlMFBnqJvqXz/MWDodWjUBOjqDY5tT16yVsSKiXtTDNYZYJStJ8VMgXjvd47/
         9oSA==
X-Gm-Message-State: AOJu0Ywa1VYkWZDZky+4MUTuUnPf4ijh9PwjqSQkYe2zYINZooNTUT06
	IXPYetjIZQh8IYCAqlm/yfU9bA==
X-Google-Smtp-Source: AGHT+IGU8psV8YYpBrak+k84CjH7qUglA4kvuDZoFMtyh0eqWtgwK8A9z5Nv2VCQrwy+5QSmAsj9Zw==
X-Received: by 2002:a17:906:cc53:b0:9d5:9065:90a9 with SMTP id mm19-20020a170906cc5300b009d5906590a9mr4772835ejb.45.1699890720078;
        Mon, 13 Nov 2023 07:52:00 -0800 (PST)
Received: from localhost (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id ov3-20020a170906fc0300b00977cad140a8sm4216945ejb.218.2023.11.13.07.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 07:51:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Nov 2023 16:51:59 +0100
Message-Id: <CWXSYVQ15C8X.2RXH2M2HH62RY@fairphone.com>
Cc: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Komal Bajaj"
 <quic_kbajaj@quicinc.com>, "Andy Gross" <agross@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <quic_nainmeht@quicinc.com>
Subject: Re: [RFC PATCH 2/2] arm64: dts: qcom: qcm6490: Add qcm6490 idp and
 rb3 board
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mukesh Ojha" <quic_mojha@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231103184655.23555-1-quic_kbajaj@quicinc.com>
 <20231103184655.23555-3-quic_kbajaj@quicinc.com>
 <CAA8EJprNyu0r_mV9hbKA1fSvoEvTHuk5umxU8H64Voj_cnZcFQ@mail.gmail.com>
 <1830fc44-7bac-4db5-af59-112410d73a64@linaro.org>
 <af05dbdb-21bf-34f0-e9b3-9f6b9a0c3115@quicinc.com>
 <CAA8EJpq89g9EeyKcogU+Mt9ie6Bk-rmgi=GqyycYBm_291i1Bw@mail.gmail.com>
 <d5492e4d-6c70-7d6c-3f5b-a0b5d9266ab0@quicinc.com>
 <CAA8EJpr+8MSEHbziTJhhnkeFhPemRARL_bpWEvHmVvAcbp++Cw@mail.gmail.com>
 <62650f39-9703-fdc5-c72a-801b8e9f6470@quicinc.com>
In-Reply-To: <62650f39-9703-fdc5-c72a-801b8e9f6470@quicinc.com>

On Tue Nov 7, 2023 at 9:10 AM CET, Mukesh Ojha wrote:
>
>
> On 11/7/2023 4:02 AM, Dmitry Baryshkov wrote:
> > On Mon, 6 Nov 2023 at 16:46, Mukesh Ojha <quic_mojha@quicinc.com> wrote=
:
> >>
> >>
> >>
> >> On 11/6/2023 5:24 PM, Dmitry Baryshkov wrote:
> >>> On Mon, 6 Nov 2023 at 13:41, Mukesh Ojha <quic_mojha@quicinc.com> wro=
te:
> >>>>
> >>>>
> >>>> On 11/5/2023 6:38 PM, Krzysztof Kozlowski wrote:
> >>>>> On 03/11/2023 23:22, Dmitry Baryshkov wrote:
> >>>>>> On Fri, 3 Nov 2023 at 20:49, Komal Bajaj <quic_kbajaj@quicinc.com>=
 wrote:
> >>>>>>>
> >>>>>>> Add qcm6490 devicetree file for QCM6490 IDP and QCM6490 RB3
> >>>>>>> platform. QCM6490 is derived from SC7280 meant for various
> >>>>>>> form factor including IoT.
> >>>>>>>
> >>>>>>> Supported features are, as of now:
> >>>>>>> * Debug UART
> >>>>>>> * eMMC (only in IDP)
> >>>>>>> * USB
> >>>>>>>
> >>>>>
> >>>>> ...
> >>>>>
> >>>>>>> +
> >>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-iot-common.dtsi b/a=
rch/arm64/boot/dts/qcom/qcm6490-iot-common.dtsi
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000000..01adc97789d0
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-iot-common.dtsi
> >>>>>>
> >>>>>> I have mixed feelings towards this file. Usually we add such 'comm=
on'
> >>>>>> files only for the phone platforms where most of the devices are
> >>>>>> common.
> >>>>>> Do you expect that IDP and RB3 will have a lot of common code othe=
r
> >>>>>> than these regulator settings?
> >>>>>
> >>>>> I agree here. What exactly is common in the real hardware between I=
DP
> >>>>> and RB3? Commit msg does not explain it, so I do not see enough
> >>>>> justification for common file. Just because some DTS looks similar =
for
> >>>>> different hardware does not mean you should creat common file.
> >>>>
> >>>> @Dmitry/@Krzysztof,
> >>>>
> >>>> Thank you for reviewing the RFC, we wanted to continue the
> >>>> suggestion/discussion given on [1] , where we discussed that this
> >>>> qcm6490 is going to be targeted for IOT segment and will have differ=
ent
> >>>> memory map and it is going to use some of co-processors like adsp/cd=
sp
> >>>> which chrome does not use.
> >>>>
> >>>> So to your question what is common between RB3 and IDP, mostly they =
will
> >>>> share common memory map(similar to [2]) and regulator settings and b=
oth
> >>>> will use adsp/cdsp etc., we will be posting the memory map changes a=
s
> >>>> well in coming weeks once this RFC is acked.
> >>>
> >>> Is the memory map going to be the same as the one used on Fairphone5?
> >>
> >> No, Fairphone5 looks to be using chrome memory map and i suggested
> >> here to move them into sc7280.dtsi
> >>
> >> https://lore.kernel.org/lkml/d5d53346-ca3b-986a-e104-d87c37115b62@quic=
inc.com/
> >>
> >>>
> >>> Are ADSP and CDSP physically present on sc7280?
> >>
> >> Yes, they are present but not used.
> >=20
> > So ADSP and CDSP should go into sc7280.dtsi. They will anyway have
> > status =3D "disabled";
> >=20
> >>
> >>>
> >>> I think that your goal should be to:
> >>> - populate missing device in sc7280.dtsi
> >>> - maybe add qcm6490.dtsi which defines SoC-level common data (e.g. me=
mory map)
> >>> - push the rest to board files.
> >>
> >> Agree to all of the point.
> >> We started with the same thought at[3] but it got lost in discussion
> >> due to its differentiation with mobile counter part(fairphone) which
> >> follow chrome memory map and hence we came up with qcm6490-iot-common.
> >> Do you think, qcm6490-iot.dtsi should be good ?
> >=20
> > No. DT describes hardware, and -iot is not a hardware abstraction / uni=
fication.
> > If you consider your memory map to be generic for the qcm6490 (and FP5
> > being the only exception), add it to the qcm6490.dtsi (and let FP5
> > override it, like some of the phones do). If it can not be considered
> > generic for the SoC, then you have no other choice than to replicate
> > it to all board files.
>

Hi Mukesh,

> Thanks for the suggestion.
> Let me add @Luca here for information, if he want to share
> anything about qcm6490 fp5 memory map.

Not sure I have much to share, just probably that on FP5 the memory
setup and all the basics just come from a standard QCM6490.LA.3.0
release.
I don't see any hint that our ODM changed something in the memory map
for the device either.

I'm also aware that other phones also use QCM6490 SoC, so I'm still
wondering where the distinction between "FP5/ChromeOS memory map" vs
this new QCM6490 memory map is.
There's also e.g. this phone using QCM6490, I've not looked into this at
all, but I'm guessing that phone uses the same memory map as FP5.
https://www.crosscall.com/en_NL/core-z5-COZ5.MASTER.html

Regards
Luca

>
> -Mukesh
> >=20
> >>
> >> [3]
> >> https://lore.kernel.org/linux-arm-msm/20231003175456.14774-3-quic_kbaj=
aj@quicinc.com/
> >>
> >> -Mukesh
> >>>
> >>> I don't think that putting regulators to the common file is a good
> >>> idea. Platforms will further change and limit voltage limits and
> >>> modes, so they usually go to the board file.
> >>>
> >>>>
> >>>>
> >>>> Thanks,
> >>>> Mukesh
> >>>>
> >>>> [1]
> >>>> https://lore.kernel.org/linux-arm-msm/d97ebf74-ad03-86d6-b826-b57be2=
09b9e2@quicinc.com/
> >>>>
> >>>> [2]
> >>>> commit 90c856602e0346ce9ff234062e86a198d71fa723
> >>>> Author: Douglas Anderson <dianders@chromium.org>
> >>>> Date:   Tue Jan 25 14:44:20 2022 -0800
> >>>>
> >>>>        arm64: dts: qcom: sc7280: Factor out Chrome common fragment
> >>>>
> >>>>        This factors out a device tree fragment from some sc7280 devi=
ce
> >>>>        trees. It represents the device tree bits that should be incl=
uded for
> >>>>        "Chrome" based sc7280 boards. On these boards the bootloader =
(Coreboot
> >>>>        + Depthcharge) configures things slightly different than the
> >>>>        bootloader that Qualcomm provides. The modem firmware on thes=
e boards
> >>>>        also works differently than on other Qulacomm products and th=
us the
> >>>>        reserved memory map needs to be adjusted.
> >>>>
> >>>>        NOTES:
> >>>>        - This is _not_ quite a no-op change. The "herobrine" and "id=
p"
> >>>>          fragments here were different and it looks like someone sim=
ply
> >>>>          forgot to update the herobrine version. This updates a few =
numbers
> >>>>          to match IDP. This will also cause the `pmk8350_pon` to be =
disabled
> >>>>          on idp/crd, which I belive is a correct change.
> >>>>        - At the moment this assumes LTE skus. Once it's clearer how =
WiFi SKUs
> >>>>          will work (how much of the memory map they can reclaim) we =
may add
> >>>>          an extra fragment that will rejigger one way or the other.
> >>>>
> >>>>        Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>        Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>>>        Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> >>>>        Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>>>        Link:
> >>>> https://lore.kernel.org/r/20220125144316.v2.3.Iac012fa8d727be46448d4=
7027a1813ea716423ce@changeid
> >>>>
> >>>>
> >>>>>
> >>>>> Best regards,
> >>>>> Krzysztof
> >>>>>
> >>>
> >>>
> >>>
> >=20
> >=20
> >=20


