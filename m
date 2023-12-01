Return-Path: <linux-arm-msm+bounces-2880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F8800B1B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 13:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2267CB20D25
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 12:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0622554F;
	Fri,  1 Dec 2023 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="w/yzXKoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A925393
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 04:38:35 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a02cc476581so301590466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 04:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701434314; x=1702039114; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=az44X/DHnaKe9VkbMNpGhucyUC5HNmK1uzaoKr0MmNU=;
        b=w/yzXKoy1AtUxtKTRZu6MBg5prmZY1nCMbrT3nz9gapiaROSMiDxzhaeRonnVAg4J0
         dtPTHxsBlwi2X/McFRzKPqUfV+X1GsFPFcnsACgNLVyJeNFtm9M0Kgv7CP2sdby9kjeA
         bmrPDCkmjvhZyCXzIdA6rjSq2vGDfUxc5xyWyuPZhgKAKOOZo3aRf/VE/vHW4eoRBG2i
         m0gJW1OCxQS7U0QKzwprcCvtAmSxHTdHvq23O7N4drn5P1DM9cis6xKHqMMB5ksAhdo7
         A9PrKa+4VJjVPMfU+IgxBW1lmc7YMHk/YfYmfyWd5BhHK4eNL8mGmV85VChq/U79IGIk
         j4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701434314; x=1702039114;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=az44X/DHnaKe9VkbMNpGhucyUC5HNmK1uzaoKr0MmNU=;
        b=sUqDoE3dPwemGJuUgPtGbP5A1T3rBUxAdbKtu+JSWkDeKkQ0TktnYyQ0ZmldsWoOlm
         xEKQFFQ4QowIa6BOArZ7Io5BCH/ticbSamLBAkQAPGVPE4Cl2YSyALcmzEg2CTlCUSDh
         UX08LZxuGrptI/WMtoExJWySa++irv6saiQlup1WyDkxR9LfXn0RVpB5oD9jSm11+vut
         k5F9Nigd+Xj441ucVG/kAlSLFfAmKNOeMxmsG31P/vF8g9PRbpzXeAAgrAOxPbp8hSTN
         68+g+E7mRnYHNJOtdDPF7AGt20k9AtRfQ3NYWgvdtHS25vIb+FCKuy3Hat97U2g13jrI
         4Pqg==
X-Gm-Message-State: AOJu0YzrfTyqI8FEc9fDjQ7HrcA08K1b2vhjTyeVU6WqORESzhXWL731
	ZA7b6AkG1Oc4egkeCktHedTfoA==
X-Google-Smtp-Source: AGHT+IEOlry0S4IzZTFWEsz5ymUp1GCSv7ioMhnHVG2/2wVbV8iiu7g/h3yWkFX5QRB+8JTr1sakAw==
X-Received: by 2002:a17:906:c793:b0:a19:a1ba:da66 with SMTP id cw19-20020a170906c79300b00a19a1bada66mr827162ejb.141.1701434313876;
        Fri, 01 Dec 2023 04:38:33 -0800 (PST)
Received: from localhost (dhcp-089-099-055-216.chello.nl. [89.99.55.216])
        by smtp.gmail.com with ESMTPSA id e19-20020a17090681d300b009fcb5fcfbe6sm1836386ejx.220.2023.12.01.04.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 04:38:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Dec 2023 13:38:32 +0100
Message-Id: <CXD04KUO3VGZ.2LIIQLUL33AVH@fairphone.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Johan Hovold" <johan@kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, "Banajit Goswami" <bgoswami@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: Issues bringing up WCD9385 codec on SC7280/QCM6490
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.15.2
References: <CXCXIAY8RBVK.2Y9W66THN9QH2@fairphone.com>
 <268bda81-d5e4-4e34-8cc0-da1c4825444c@linaro.org>
In-Reply-To: <268bda81-d5e4-4e34-8cc0-da1c4825444c@linaro.org>

On Fri Dec 1, 2023 at 1:02 PM CET, Krzysztof Kozlowski wrote:
> On 01/12/2023 11:35, Luca Weiss wrote:
> > Hi all,
> >=20
> > I'm trying to get audio working on qcm6490-fairphone-fp5 (the SoC is
> > sc7280.dtsi-based).
> > Unfortunately the current sc7280.dtsi only supports directly interfacin=
g
> > with the hw blocks (lpass_aon/lpass_hm/lpass_audiocc) and not using
> > q6afecc, but I think I've done this "conversion" correctly, based on
> > other mainline SoCs and downstream dts.
>
> Eh, you probably duplicated a lot of existing work. Here it is:
> https://lore.kernel.org/all/20230526113258.1467276-1-quic_mohs@quicinc.co=
m/

Well, at least this patch[0] seems to be reasonably helpful, but even
this one uses q6prmcc and not q6afecc but apart from that I will double
check if it matches what I have, but looks rather similar.

[0] https://lore.kernel.org/all/20230526113258.1467276-7-quic_mohs@quicinc.=
com/

>
> >=20
> > So, to the problem: I've added the nodes for the WCD9385 codec found on
> > this device which is handling the microphones (and analog audio over
> > USB-C). But I can't get it to work. I believe the first problem I saw
> > was the error "soundwire device init timeout" where I saw that the wcd
> > tx & rx devices (on the soundwire bus) only appeared after the timeout
> > of 2 seconds expired and wcd938x driver probe failed. After bumping thi=
s
> > to something higher (20 seconds) this was resolved.
>
> Please describe the tree you are working on. This was fixed some time ago=
.

Currently v6.7-rc2 plus some patches for general device support.
Unfortunately the fix you had for v6.6 or something and mentioned on IRC
is already in there..

>
> >=20
> > But now I'm having these errors in the initialization of the wcd
> > devices.
> >=20
> > [   45.651156] qcom-soundwire 3230000.soundwire: swrm_wait_for_rd_fifo_=
avail err read underflow
> > [   45.651173] soundwire sdw-master-1: trf on Slave 1 failed:-5 read ad=
dr 41 count 1
> > [   45.651182] wcd9380-codec sdw:0:0217:010d:00:3: SDW_SCP_INTMASK1 wri=
te failed:-5
> > [   45.651186] wcd9380-codec sdw:0:0217:010d:00:3: Slave 1 initializati=
on failed: -5
> >=20
> > After some more debugging and changing some timeouts I'm noticing that
> > the swr devices appear immediately after pm_runtime puts the driver to
> > sleep, qcom_swrm_irq_handler is called and then we get this:
> >=20
> > [   45.531863] qcom-soundwire 3230000.soundwire: SWR new slave attached
> >=20
> > The same also happens for the other soundwire controller
> >=20
> > [   47.581067] qcom-soundwire 3210000.soundwire: SWR new slave attached
>
> There were similar reports on the IRC, so I wonder if this is the same
> issue?
>
> Maybe wrong interrupt flag (like falling instead of rising)? I collected
> over time also several ideas of fixes from Srini, not always ready to
> upstream, but maybe they fix your issue? Did you try some of my audio
> branches like n/audio-sm8450-sm8550-on-next?

I didn't yet. I'll check out[1] then and dig around if I see anything
else.

[1] https://github.com/krzk/linux/commits/n/audio-sm8450-sm8550-on-next

>
> Or maybe sc7280 needs to toggle the same CSR reset/clock bits as
> sc8280xp (lpass-csr-sc8280xp.c)?

Assuming you mean lpasscc-sc8280xp.c the resets defined in [2] do seem
to be represented in my downstream yupik-audio-overlay.dtsi. There's
* qcom,swrm-hctl-reg =3D <0x032a90a8>; for TX macro SWR
* qcom,swrm-hctl-reg =3D <0x032a90a0>; for RX macro SWR
* qcom,swrm-hctl-reg =3D <0x032a90b0>; for WSA macro SWR

And the latter two have the same value as in the sc8280xp patch. And the
property is used in techpack/audio in some runtime_resume code under a
lot of if's but also with "SW workaround to gate hw_ctl for SWR
version >=3D1.6" and this SoC has controller v1.6.0.

This might be promising, I think?

[2] https://lore.kernel.org/linux-arm-msm/20230608125315.11454-5-srinivas.k=
andagatla@linaro.org/

>
> >=20
> > And this is currently where I'm stuck and can't really think of why thi=
s
> > is happening.. I've double checked nearly all of the properties I've
> > added/modified incl. wcd reset GPIO, wcd *-supply, lpi pinctrl settings=
.
> > I believe the "read underflow" error here is because the whole driver
> > stack is already trying to suspend so then communication fails. The rea=
l
> > question for me is why the swr 'slaves' only appear exactly when
> > pm_runtime is suspending everything.
>
> Yeah, good question.

Too bad you don't have an amazing idea why this is happening ;)

Thanks for your advise, let's see if it gets me any further!

Regards
Luca

>
> >=20
> > The only thing I've not really checked yet is qcom,rx-port-mapping &
> > qcom,tx-port-mapping, there I've just tried the two different values
> > found on the various devices but I don't think this is causing these
> > issues. I will try to look further into this property at some point but
> > with msm-5.4 downstream it's quite tricky to find where these values ar=
e
> > represented (I got some hints from Krzysztof though where to look so
> > I'll try to do that soon)
> >=20
> > I'm attaching my current diff to the email, just note that it's based o=
n
> > one of my dev branches and is manually edited to remove some debug
> > prints etc so it will probably not apply anywhere. I can also push the
> > git tree somewhere in case that's helpful.
> >=20
> > Regards
> > Luca
> >=20
>
>
> Best regards,
> Krzysztof


