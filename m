Return-Path: <linux-arm-msm+bounces-32848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85D98B6D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 10:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A2F1F2182B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 08:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5EB19ABC6;
	Tue,  1 Oct 2024 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gjK9ZxBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C08919ABAE
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 08:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771064; cv=none; b=SWmsgr1NWFfFqEVGWAlgQ3Hn2w5x/qgS9ucgXf3zKbU1/6WSwnNf5wDJhpPn3IiWVP43+CIE/SSB6AoeKLw+SEvihORfOcvlsX0PWXKOr1kNR7sMqyYrr+TMU+dio5UhR3FoO7oVINYVFnicP4AAYQQLTunVRntZzO/jNRJinn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771064; c=relaxed/simple;
	bh=8AJMW8Z3b9wJetqkBgaR2aftrmfyvbru3456YvuWlM0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gt0YScdfsF8sLtvCRZrTfhcclcvrPLk3vlTX8rTXDj933jZlgaMymVueq9F7nfgTtpUoxAmw+u/B0GbUZu0GUURyO4z8IM9/LRS/iwrQ5sCCIhw2jcfgeepUGFiiGwk1c4o1EuKae0bOzNDpvQjfnRpcUrXB6JNVuUmqBB9OlDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gjK9ZxBO; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8b155b5e9eso817545366b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 01:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1727771061; x=1728375861; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AJMW8Z3b9wJetqkBgaR2aftrmfyvbru3456YvuWlM0=;
        b=gjK9ZxBOKt2DXyjXzXanLq52+5dfGxlBMZ6lpb1J4cmMIzHPxYlLcjqnyaNJV/p/Gb
         ePuT/9i95AkOsdHxjggqUIo+7b7szxEriTBEeYQ54jk4fkhKrJvpVeNfwOHIVnspXUP0
         zdMGQUYg8tWIBamq9MIR+sS0o9lo1lxG2tjJZsGyALwjwaqOvSZVuhSzI3x40XVRpBfg
         gvokcRUs0MQgyaQI/dC/vwVHJWQo4kg1eWrCyB9yoNRpn2aDXRU6xiCu9ffAVLkInpLS
         AF1E2KObXB34CK41ZooVGvr9wtiPMvI+bbW3t4sNEsHQNon7mNGbeAebbkhe6FKRG9oY
         WgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771061; x=1728375861;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8AJMW8Z3b9wJetqkBgaR2aftrmfyvbru3456YvuWlM0=;
        b=rcszT9sJGBjFUgxVw5JT2D6rMzAV0sQEb80j/wZSs1Tbxma9xrv3TTQHmtmzLlL1zU
         4+U7n2OLrOfMrfl9TgCw1i8YmzR1QEtafrwWmke7iHDv5WJ/MkHnsg2ShEcHoSD5csho
         w8CXPuFwHZRKKxjH88IoGiSpi5ge3+97tIsPOY5l4sidm7Mmt70QEQ9JXcfCGQZf/4gu
         di4UGwbBIoyxsUfWzbyAkGdq5qRovVOuWNC0Cm9ZCnbfPg/g4xAAHCBqD578jE4R7ewN
         ZpAGwMeO9fHLkbs7Hv2eiKDzvCKQt6CPgddCnzWpfSzBX/MvIrF9Ix2FnL49JvWrDb12
         cTYA==
X-Gm-Message-State: AOJu0YzUptlWE3eWlyqnyDxmbgdPY0UtE42Ezaa76y7c//vhQUZjCaFU
	+PbkOUvjs1eoUiKtePzoi36cxZCyW7ensvZrPG8xDRcJ1DQNP23602YzHiIM4Mw=
X-Google-Smtp-Source: AGHT+IFdMH1/s+U1Oar448DJMRPdY0HO+iMivk6aBcjMowrJwubM44U3KXpO6X+6VBpy2DswJlUdNA==
X-Received: by 2002:a17:907:7e85:b0:a77:f2c5:84b3 with SMTP id a640c23a62f3a-a93c491f380mr1305042666b.22.1727771060815;
        Tue, 01 Oct 2024 01:24:20 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27758dcsm667920866b.37.2024.10.01.01.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 01:24:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Oct 2024 10:24:19 +0200
Message-Id: <D4KBQ3ENKF5Y.3D2AK81PELAEZ@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Suresh Vankadara"
 <quic_svankada@quicinc.com>, "Trishansh Bhardwaj"
 <quic_tbhardwa@quicinc.com>, <stable@vger.kernel.org>, "Hariram
 Purushothaman" <quic_hariramp@quicinc.com>
Subject: Re: [PATCH 00/10] (no cover subject)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Vikram Sharma"
 <quic_vikramsa@quicinc.com>, "Robert Foss" <rfoss@kernel.org>, "Todor
 Tomov" <todor.too@gmail.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Kapatrala
 Syed" <akapatra@quicinc.com>, "Hariram Purushothaman"
 <hariramp@quicinc.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Hans Verkuil"
 <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com> <D4JK8TRL7XBL.3TBA1FBF32RXL@fairphone.com> <fc0ce5cd-e42a-432b-ad74-01de67ec0d5c@linaro.org>
In-Reply-To: <fc0ce5cd-e42a-432b-ad74-01de67ec0d5c@linaro.org>

On Mon Sep 30, 2024 at 1:54 PM CEST, Bryan O'Donoghue wrote:
> On 30/09/2024 11:52, Luca Weiss wrote:
> > On Wed Sep 4, 2024 at 1:10 PM CEST, Vikram Sharma wrote:
> >> SC7280 is a Qualcomm SoC. This series adds support to
> >> bring up the CSIPHY, CSID, VFE/RDI interfaces in SC7280.
> >>
> >> SC7280 provides
> >>
> >> - 3 x VFE, 3 RDI per VFE
> >> - 2 x VFE Lite, 4 RDI per VFE
> >> - 3 x CSID
> >> - 2 x CSID Lite
> >> - 5 x CSI PHY
> >=20
> > Hi Vikram,
> >=20
> > I tried this on my QCM6490 Fairphone 5 smartphone.
> >=20
> > Unfortunately I couldn't get e.g. CSID test pattern out of camss. I've
> > tested this patchset on v6.11.
> >=20
> > These commands did work on an older sc7280 camss patchset (which was
> > never sent to the lists). Can you please take a look?
> >=20
> > v4l2-ctl -d /dev/v4l-subdev5 -c test_pattern=3D1
> > media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> > media-ctl -d /dev/media0 -V '"msm_csid0":1[fmt:UYVY8_2X8/1920x1080 fiel=
d:none],"msm_vfe0_rdi0":0[fmt:UYVY8_2X8/1920x1080 field:none]'
> > gst-launch-1.0 v4l2src device=3D/dev/video0 num-buffers=3D1 ! 'video/x-=
raw,format=3DUYVY,width=3D1920,height=3D1080' ! jpegenc ! filesink location=
=3Dimage01.jpg
>
> Here's what I have for rb5
>
> # CSID0 TPG RB5
> media-ctl --reset
> yavta --no-query -w '0x009f0903 2' /dev/v4l-subdev6
> yavta --list /dev/v4l-subdev6
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> media-ctl -d /dev/media0 -p
>
> Maybe on FP5 ...
>
> media-ctl --reset
> yavta --no-query -w '0x009f0903 2' /dev/v4l-subdev5
> yavta --list /dev/v4l-subdev5
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> media-ctl -d /dev/media0 -p

Hi Bryan!

These commands are to set up the pipeline, and what then to grab an
image from it?

I tried this, but it also just hangs:

$ yavta -B capture-mplane --capture=3D3 -n 3 -f SRGGB10P -s 4056x3040 /dev/=
video0 --file=3Dfoo-#.bin
Device /dev/video0 opened.
Device `Qualcomm Camera Subsystem' on `platform:acb3000.camss' (driver 'qco=
m-camss') supports video, capture, with mplanes.
Video format set: SRGGB10P (41415270) 4056x3040 field none, 1 planes:=20
 * Stride 5072, buffer size 15418880
Video format: SRGGB10P (41415270) 4056x3040 field none, 1 planes:=20
 * Stride 5072, buffer size 15418880
3 buffers requested.
length: 1 offset: 3326519176 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffa0c00000.
length: 1 offset: 3326519176 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffff9fc08000.
length: 1 offset: 3326519176 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffff9ec10000.

Regards
Luca



>
> ?
>
> ---
> bod


