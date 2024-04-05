Return-Path: <linux-arm-msm+bounces-16511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7722899A94
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 12:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15FF61C213E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 10:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C3A16192B;
	Fri,  5 Apr 2024 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kMZ3ZPK+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE989161931
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712312390; cv=none; b=Q4FskroWGhxGbxVdtf+88F1hQr7QNMx+Xm+Ceu3LmjGQMM40UGsl4qkcVL6x3Qvp6tzs/VANie28C5xvEajVrwyxwXX4LBvQboyZHJiwoKq6YS9sSyEDfdGkh7PwjERXx1UOqvp5zAlkiu78+GOi8ijDiKM3Ys+t7kRClHpotk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712312390; c=relaxed/simple;
	bh=0OI2ryIMCXvO8K9vutx7EIqbESyjJfJ3MkE47w6lRgQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=aJ1eG8tnQ/7MyRIrmkqVev/0vdurANJTQW3MUCGJbvDogOfOpzGauUv7sze5ZXGzgbqYyD/fQV1fhyObtiW89uzWKSAvEgIq51tBb2Wh99NzEQK7uj5lJPNCZiH8ewgROnz7LHCUptx2Zo+Z+f591krVCelQ6U2BUzynnnVnicQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kMZ3ZPK+; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a5199906493so138401166b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 03:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712312387; x=1712917187; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7wBknhXnwsdUBBqfoshvbTdHyCPt+Ehzl1Q7shB3pk=;
        b=kMZ3ZPK+sPR9UEoin6D/sgvVaZO85XByUatjMvsQDWCSkUAWA4cpOFHMkefjnj/nq3
         NvMWxhLYvfcrBia5ixw8ndE4s/KMhJ3jjSFDtkRwSYg0P1bsmv5Y/4P46pXoFUY0PUxe
         ginzIYX1dXxUYAE/kXXNGH8lTOlJXK1XMwNnadzKxOGfopIVDpgybs/+i+ufD5hb7jol
         AYVl3dk+Wqk6BO505JF6+8maVQwHpe+PyMhEcbHIcXVAl+HquiAaIh8QlNzSPiKDk1Fi
         X3TuijLwCmbkdXmwETzNt8RCIaFWTtfUdTG1aqbMVLj0EtD/fn+i8H9xH1lz2twZB7tA
         MbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712312387; x=1712917187;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/7wBknhXnwsdUBBqfoshvbTdHyCPt+Ehzl1Q7shB3pk=;
        b=RkAoEVLUPIsAlX5a6H746y8thkedcsdoJ4zm5fw0EgC0m1AwwX/FrJq/4j4eLNM/l7
         8IEbZQw51HtYt54MzSZiitZTbjCvFF53W8DlYgDA8krENe1JzziAXg19t8xhjf9pnwgQ
         mhvcj+Pjl631ePpXXyD/Qt/WQVu3F2nftKedenG8y1VsoE2/htrK5L65Vt5zerO+ejOi
         0GH1ynUGfpyUBD9L1mYdB/FTj23xxVTuorNg81Jog7RWUGDVX/zJc9CAsF4zXif0LImF
         bmzWJVea9DZQyE3pdNRhxbE1ES1MXmoI26PVhO/s4lf7/9iYMRYKFDaTptkOUFDthsUM
         SYvA==
X-Forwarded-Encrypted: i=1; AJvYcCWK+QbicTSjWIN72EMM05rAXJ7JCrSIeOQ2/TIDPL1dih7cSKorKysZTRa2L1av9Bkingk5dvv0xgSg0VXMz4WrB05CXcnntqRTP0vObw==
X-Gm-Message-State: AOJu0YxuPbfOxE1t1b+aJGhdbHwQA+nnwaGP6EOzYBqBzYMGk1bJtUbF
	1rg5XqfpE3oFjub0FonPvfp81lzQQQrykeDLhAAiKKrT57/ntLBcEGl2Jbplar0=
X-Google-Smtp-Source: AGHT+IEb6UquOirryxNCdTbMBwQSxXMSkSkdEgWggO43HlcRkq+10Oy8opxJEoC4UC+X+wGb7hJvGQ==
X-Received: by 2002:a17:906:38f:b0:a47:2036:dbc4 with SMTP id b15-20020a170906038f00b00a472036dbc4mr541798eja.25.1712312387218;
        Fri, 05 Apr 2024 03:19:47 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id gx26-20020a1709068a5a00b00a46b4c09670sm670330ejc.131.2024.04.05.03.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 03:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Apr 2024 12:19:46 +0200
Message-Id: <D0C42YR1270X.23P9WCWWNB8XF@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <neil.armstrong@linaro.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Kishon Vijay Abraham I"
 <kishon@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFT 0/7] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
X-Mailer: aerc 0.15.2
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org> <CZUHV429NTF7.1GW9TN9NXB4J1@fairphone.com> <7a7aa05f-9ae6-4ca0-a423-224fc78fbd0c@linaro.org> <liah4xvkfattlen7s2zi3vt2bl5pbbxqgig3k5ljqpveoao656@iacnommxkjkt> <236a104c-fc16-4b3d-9a00-e16517c00e3a@linaro.org> <D064242SMIVM.1GUC1I9GE9IGC@fairphone.com> <963b60e5-6ab7-4d9f-885a-ba744c2b7991@linaro.org>
In-Reply-To: <963b60e5-6ab7-4d9f-885a-ba744c2b7991@linaro.org>

On Fri Apr 5, 2024 at 10:08 AM CEST, Neil Armstrong wrote:
> Hi Luca,
>
> On 29/03/2024 10:02, Luca Weiss wrote:
> > On Tue Mar 26, 2024 at 10:02 PM CET, Konrad Dybcio wrote:
> >> On 16.03.2024 5:01 PM, Bjorn Andersson wrote:
> >>> On Fri, Mar 15, 2024 at 06:35:15PM +0100, Neil Armstrong wrote:
> >>>> On 15/03/2024 18:19, Luca Weiss wrote:
> >>>>> On Thu Feb 29, 2024 at 2:07 PM CET, Neil Armstrong wrote:
> >>>>>> Register a typec mux in order to change the PHY mode on the Type-C
> >>>>>> mux events depending on the mode and the svid when in Altmode setu=
p.
> >>>>>>
> >>>>>> The DisplayPort phy should be left enabled if is still powered on
> >>>>>> by the DRM DisplayPort controller, so bail out until the DisplayPo=
rt
> >>>>>> PHY is not powered off.
> >>>>>>
> >>>>>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE sta=
tes
> >>>>>> will be set in between of USB-Only, Combo and DisplayPort Only so
> >>>>>> this will leave enough time to the DRM DisplayPort controller to
> >>>>>> turn of the DisplayPort PHY.
> >>>>>>
> >>>>>> The patchset also includes bindings changes and DT changes.
> >>>>>>
> >>>>>> This has been successfully tested on an SM8550 board, but the
> >>>>>> Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayP=
ort,
> >>>>>> PD USB Hubs and PD Altmode Dongles to make sure the switch works
> >>>>>> as expected.
> >>>>>>
> >>>>>> The DisplayPort 4 lanes setup can be check with:
> >>>>>> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_deb=
ug
> >>>>>> 	name =3D msm_dp
> >>>>>> 	drm_dp_link
> >>>>>> 		rate =3D 540000
> >>>>>> 		num_lanes =3D 4
> >>>>>
> >>>>> Hi Neil,
> >>>>>
> >>>>> I tried this on QCM6490/SC7280 which should also support 4-lane DP =
but I
> >>>>> haven't had any success so far.
> >>>>>
> >>> [..]
> >>>>> [ 1775.563969] [drm:dp_ctrl_link_train] *ERROR* max v_level reached
> >>>>> [ 1775.564031] [drm:dp_ctrl_link_train] *ERROR* link training #1 fa=
iled. ret=3D-11
> >>>>
> >>>> Interesting #1 means the 4 lanes are not physically connected to the=
 other side,
> >>>> perhaps QCM6490/SC7280 requires a specific way to enable the 4 lanes=
 in the PHY,
> >>>> or some fixups in the init tables.
> >>>>
> >>>
> >>> I tested the same on rb3gen2 (qcs6490) a couple of weeks ago, with th=
e
> >>> same outcome. Looking at the AUX reads, after switching to 4-lane the
> >>> link training is failing on all 4 lanes, in contrast to succeeding on=
ly
> >>> on the first 2 if you e.g. forget to mux the other two.
> >>>
> >>> As such, my expectation is that there's something wrong in the QMP PH=
Y
> >>> (or possibly redriver) for this platform.
> >>
> >> Do we have any downstream tag where 4lane dp works? I'm willing to bel=
ieve
> >> the PHY story..
> >=20
> > Just tested on Fairphone 5 downstream and 4 lane appears to work there.
> > This is with an USB-C to HDMI adapter that only does HDMI.
> >=20
> > FP5:/ # cat /sys/kernel/debug/drm_dp/dp_debug
> >          state=3D0x20a5
> >          link_rate=3D270000
> >          num_lanes=3D4
> >          resolution=3D2560x1440@60Hz
> >          pclock=3D241500KHz
> >          bpp=3D24
> >          test_req=3DDP_LINK_STATUS_UPDATED
> >          lane_count=3D4
> >          bw_code=3D10
> >          v_level=3D0
> >          p_level=3D0
> >=20
> > Sources are here:
> > https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-5.4=
/+/refs/heads/odm/rc/target/13/fp5
> > And probably more importantly techpack/display:
> > https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendo=
r/opensource/display-drivers/+/refs/heads/odm/rc/target/13/fp5
> > Dts if useful:
> > https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-ext=
ra/devicetree/+/refs/heads/kernel/13/fp5
>
> Could you retry with this applied ?
>
> https://lore.kernel.org/all/20240405000111.1450598-1-swboyd@chromium.org/

Unfortunately I do not see any change with this on QCM6490 Fairphone 5
and 4-lane DP.

Regards
Luca

>
> Thanks,
> Neil
>
> >=20
> > Regards
> > Luca
> >=20
> >>
> >> Konrad
> >=20


