Return-Path: <linux-arm-msm+bounces-2916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEE3800EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 034081C20950
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943804A991;
	Fri,  1 Dec 2023 15:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Fr8y4z/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD73194
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:41:47 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-54c6896a689so618434a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701445306; x=1702050106; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgK7oTU1kxxMfvlt4/Uw4XMHt+D7+NH6E00QK32bLQ8=;
        b=Fr8y4z/ZSl9OEoiQ0yjb945vIIQ4GHXCQXAX+wZvG7QLIfnLh5ucLOB71DXbJn7+UN
         jzhkU7B+fguXmp/iVJ55MtMw0lKsQA7TUIYEzjo8oPV9Gv2t2QVB/dTmH2KYx++vmnr1
         VQK5y3tDMDVHUdtHRcldhr7QKIpulM/96BcQkiby437JH3ZGel+pU0fT+BjNPoK9WNk3
         YvyiToZQVn2GU21bHpDUf84liiQwRAvS1pQnRPi1h2hanfJxRu59LMPED0AMEhNaTbO+
         sz9TBpq/sktkyoTf+OFY9YYupRkyNpuYZ+Eu9FnOzoFBOzNGcxMeQvLsRmriczc5QsCd
         14jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701445306; x=1702050106;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HgK7oTU1kxxMfvlt4/Uw4XMHt+D7+NH6E00QK32bLQ8=;
        b=uLHAmfupAKERfysbPISy1zo12Usx3fOzC2whT3ESKvdHT7/k0Xn1kxBCgopKrgLMDx
         VDZblKZCTswQqNq8YKvecWLrFO//afoj97Srdr6FplDu69ac6tsQ/xdrO5fHTKnx+d20
         LtaJUWHrXc40JSEumuQfEkCDnQ3deGQw84cwHQByd1NHsS+XBIB86op9by3x5JMNvqnW
         Ws/V3hlCSd4z2L9z4T1C8IAi/iFzvyNY4INNY82u+ZVmDfjqIBGQg68JazRxIKfRONmH
         bbfEaMJsfCV0QBB+6wI6ISG+eKTnODT/NKjtuGUmkODIn0MyMoq7LWIoDgwRNqMr8kM3
         RBzQ==
X-Gm-Message-State: AOJu0YxB+L5tTMwcMfiN41K4pdVfDSRZXdJor2aWE8v1P0WeZoLdrINv
	AZ7FnutjF7ZfyvHVeGoLy6uIvg==
X-Google-Smtp-Source: AGHT+IEjdKzDHpylI8ZC4axvJrP+yDa37F5BLpttOag0ycagwQL1FO57I5UurOG/hBkZL5hdhmaiKA==
X-Received: by 2002:a17:906:3f0a:b0:a19:a1ba:da42 with SMTP id c10-20020a1709063f0a00b00a19a1bada42mr864748ejj.105.1701445305638;
        Fri, 01 Dec 2023 07:41:45 -0800 (PST)
Received: from localhost (dhcp-089-099-055-216.chello.nl. [89.99.55.216])
        by smtp.gmail.com with ESMTPSA id h11-20020a17090634cb00b00a0f770ae91bsm1997009ejb.89.2023.12.01.07.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 07:41:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Dec 2023 16:41:44 +0100
Message-Id: <CXD40UAOO063.YBL60Q4VPV91@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Johan Hovold" <johan@kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, "Banajit Goswami" <bgoswami@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: Issues bringing up WCD9385 codec on SC7280/QCM6490
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.15.2
References: <CXCXIAY8RBVK.2Y9W66THN9QH2@fairphone.com>
 <268bda81-d5e4-4e34-8cc0-da1c4825444c@linaro.org>
 <CXD04KUO3VGZ.2LIIQLUL33AVH@fairphone.com>
In-Reply-To: <CXD04KUO3VGZ.2LIIQLUL33AVH@fairphone.com>

On Fri Dec 1, 2023 at 1:38 PM CET, Luca Weiss wrote:
> On Fri Dec 1, 2023 at 1:02 PM CET, Krzysztof Kozlowski wrote:
> > On 01/12/2023 11:35, Luca Weiss wrote:
> > > Hi all,
> > >=20
> > > I'm trying to get audio working on qcm6490-fairphone-fp5 (the SoC is
> > > sc7280.dtsi-based).
> > > Unfortunately the current sc7280.dtsi only supports directly interfac=
ing
> > > with the hw blocks (lpass_aon/lpass_hm/lpass_audiocc) and not using
> > > q6afecc, but I think I've done this "conversion" correctly, based on
> > > other mainline SoCs and downstream dts.
> >
> > Eh, you probably duplicated a lot of existing work. Here it is:
> > https://lore.kernel.org/all/20230526113258.1467276-1-quic_mohs@quicinc.=
com/
>
> Well, at least this patch[0] seems to be reasonably helpful, but even
> this one uses q6prmcc and not q6afecc but apart from that I will double
> check if it matches what I have, but looks rather similar.
>
> [0] https://lore.kernel.org/all/20230526113258.1467276-7-quic_mohs@quicin=
c.com/
>
> >
> > >=20
> > > So, to the problem: I've added the nodes for the WCD9385 codec found =
on
> > > this device which is handling the microphones (and analog audio over
> > > USB-C). But I can't get it to work. I believe the first problem I saw
> > > was the error "soundwire device init timeout" where I saw that the wc=
d
> > > tx & rx devices (on the soundwire bus) only appeared after the timeou=
t
> > > of 2 seconds expired and wcd938x driver probe failed. After bumping t=
his
> > > to something higher (20 seconds) this was resolved.
> >
> > Please describe the tree you are working on. This was fixed some time a=
go.
>
> Currently v6.7-rc2 plus some patches for general device support.
> Unfortunately the fix you had for v6.6 or something and mentioned on IRC
> is already in there..
>
> >
> > >=20
> > > But now I'm having these errors in the initialization of the wcd
> > > devices.
> > >=20
> > > [   45.651156] qcom-soundwire 3230000.soundwire: swrm_wait_for_rd_fif=
o_avail err read underflow
> > > [   45.651173] soundwire sdw-master-1: trf on Slave 1 failed:-5 read =
addr 41 count 1
> > > [   45.651182] wcd9380-codec sdw:0:0217:010d:00:3: SDW_SCP_INTMASK1 w=
rite failed:-5
> > > [   45.651186] wcd9380-codec sdw:0:0217:010d:00:3: Slave 1 initializa=
tion failed: -5
> > >=20
> > > After some more debugging and changing some timeouts I'm noticing tha=
t
> > > the swr devices appear immediately after pm_runtime puts the driver t=
o
> > > sleep, qcom_swrm_irq_handler is called and then we get this:
> > >=20
> > > [   45.531863] qcom-soundwire 3230000.soundwire: SWR new slave attach=
ed
> > >=20
> > > The same also happens for the other soundwire controller
> > >=20
> > > [   47.581067] qcom-soundwire 3210000.soundwire: SWR new slave attach=
ed
> >
> > There were similar reports on the IRC, so I wonder if this is the same
> > issue?
> >
> > Maybe wrong interrupt flag (like falling instead of rising)? I collecte=
d
> > over time also several ideas of fixes from Srini, not always ready to
> > upstream, but maybe they fix your issue? Did you try some of my audio
> > branches like n/audio-sm8450-sm8550-on-next?
>
> I didn't yet. I'll check out[1] then and dig around if I see anything
> else.
>
> [1] https://github.com/krzk/linux/commits/n/audio-sm8450-sm8550-on-next
>
> >
> > Or maybe sc7280 needs to toggle the same CSR reset/clock bits as
> > sc8280xp (lpass-csr-sc8280xp.c)?
>
> Assuming you mean lpasscc-sc8280xp.c the resets defined in [2] do seem
> to be represented in my downstream yupik-audio-overlay.dtsi. There's
> * qcom,swrm-hctl-reg =3D <0x032a90a8>; for TX macro SWR
> * qcom,swrm-hctl-reg =3D <0x032a90a0>; for RX macro SWR
> * qcom,swrm-hctl-reg =3D <0x032a90b0>; for WSA macro SWR
>
> And the latter two have the same value as in the sc8280xp patch. And the
> property is used in techpack/audio in some runtime_resume code under a
> lot of if's but also with "SW workaround to gate hw_ctl for SWR
> version >=3D1.6" and this SoC has controller v1.6.0.
>
> This might be promising, I think?
>
> [2] https://lore.kernel.org/linux-arm-msm/20230608125315.11454-5-srinivas=
.kandagatla@linaro.org/

Hi,

Quick update. Re-adding qcom,sc7280-lpassaudiocc (and hacking out all
the non-reset bits from that driver) seems to make things quite a bit
better. I'll check more in the coming week(s). But I haven't gotten
actual audio out of the microphone yet.

Looking back, I shouldn've just discarded these resets, but I wasn't
aware that this driver was touching both forbidden registers but also
some registers that were still needed.

Regards
Luca

>
> >
> > >=20
> > > And this is currently where I'm stuck and can't really think of why t=
his
> > > is happening.. I've double checked nearly all of the properties I've
> > > added/modified incl. wcd reset GPIO, wcd *-supply, lpi pinctrl settin=
gs.
> > > I believe the "read underflow" error here is because the whole driver
> > > stack is already trying to suspend so then communication fails. The r=
eal
> > > question for me is why the swr 'slaves' only appear exactly when
> > > pm_runtime is suspending everything.
> >
> > Yeah, good question.
>
> Too bad you don't have an amazing idea why this is happening ;)
>
> Thanks for your advise, let's see if it gets me any further!
>
> Regards
> Luca
>
> >
> > >=20
> > > The only thing I've not really checked yet is qcom,rx-port-mapping &
> > > qcom,tx-port-mapping, there I've just tried the two different values
> > > found on the various devices but I don't think this is causing these
> > > issues. I will try to look further into this property at some point b=
ut
> > > with msm-5.4 downstream it's quite tricky to find where these values =
are
> > > represented (I got some hints from Krzysztof though where to look so
> > > I'll try to do that soon)
> > >=20
> > > I'm attaching my current diff to the email, just note that it's based=
 on
> > > one of my dev branches and is manually edited to remove some debug
> > > prints etc so it will probably not apply anywhere. I can also push th=
e
> > > git tree somewhere in case that's helpful.
> > >=20
> > > Regards
> > > Luca
> > >=20
> >
> >
> > Best regards,
> > Krzysztof


