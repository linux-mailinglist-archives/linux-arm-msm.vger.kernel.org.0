Return-Path: <linux-arm-msm+bounces-15680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C9891552
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 10:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F1FCB21D25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 09:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE302D622;
	Fri, 29 Mar 2024 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aQlaMaCh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB9C2554B
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711702963; cv=none; b=LiCisgwahBG2X+1pSO7JWyU+Fq2Vg1cvHNOMy/spRQ9o58LEXyf2e8FFI0Y4qi+SWATyYgu0ATjAo5UwP2ap+jLjBi4kPMhYG8kpWkcX5fuKCpsf5vk6nuSbu0u/6hrCZzs23IBUyjXkC538/s8qhkUOsuosndiQ9x2cfcTOWzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711702963; c=relaxed/simple;
	bh=2Zf6R6CkxmywhczgQqEZn7MwHGL6FseyM974DXmnTHk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=heOH0Q2z1irh6IUFeJm4dD2IAKyXWUdHBK6cVr5l6eK1D+3qGKJ7l8R+bvOZIwdyGpjTqIzVVmAJn12pr70y7WcHwWUxtSQR+P+SzO3h5BgsQOgvghDz2FEd13BZ+QOhP/YOZbIsej4h5/FyKclDqw24BiPBCSTbwJHgtbiprXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aQlaMaCh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56d7a0cf96cso214695a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 02:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711702960; x=1712307760; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kJ07VpxBwuIm+C747GAvreUMoyvQyj4KBvI0bB+Uzs=;
        b=aQlaMaChlqZLgNMrRR//nqXZA339Pk95vx19E3iAhym81R4Tzhv9dvj1L0Otd1Q9jo
         IJFqSIb6h9HOjECNUJCA1f9tt4buUCfsL8wsUTXhXsizJMKIHYgSGvY4vQXdbAVPmA51
         zBk9eKhdDN1OhvXdF548yIMTVyUdsTtepEC4Z9PcVtRLWFICwgUXHhGfBOYctfZlpSvv
         veXAlK12PZBUao5czn4Qf5x9AIquQYkqRCDMfWCYJz4mAbDv8jHkGCRapcc2E9dP6aFW
         ryUcVC8999Jl8lGBHzr0t8uy38YGTV6zaicrAhVqVy8z057j6NJKGRnbq833Lp1bMM/5
         DVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711702960; x=1712307760;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/kJ07VpxBwuIm+C747GAvreUMoyvQyj4KBvI0bB+Uzs=;
        b=Uepokbl3Tj3o92rKeFftrGqtPMq+8ssIecJnU7n5Qc+6Qacv6BFoHrg+IBsE66obDF
         U6pytnHWDpwUfSI08P9IWnI+dAcCdHvxNyrLTG3qXfX+0lEP/1J1ScrSU+EToRCiPpJw
         or9GhLO6jgOuKVgqkI+EF9nOqyg8CtsXVBv1zPvURwn8xDSlC8yycQ044E90DlFu5D1T
         OCiyS4c2N1nsqWuCDA4IqnZdC+8QSlQj0Ztb5yjb9oZ/uOzG2HjjLYnA9gE3djHZ0s5U
         n3xafyZok8lBrpNEUrWmm+exlekWmXt5YUcVxHSs77K1e1klbMcKOmCkDF81u0tACODW
         ZuzA==
X-Forwarded-Encrypted: i=1; AJvYcCXKJLXR3bL7dBcy+poddiJlsyzKSvJvcY0yHeiOakyjwQ5WHJSgjktmZepMai9hlzuKRtvdVU7L82XT45+SlgVC9WeVDRR+jvu8pEHmdw==
X-Gm-Message-State: AOJu0Yy7s8A3MBT/9dN4R7bJk8VuHRmkskFMYMRgkHQkKR3K6OhFE/pW
	zs6RrvXdPsboJYtbOVtJSuh8vdTZobg3woB4FL5GOZ5YvrSTY8oCC5lPWkhmG7w=
X-Google-Smtp-Source: AGHT+IEtXOU314+1cqrx8WlAN41P0sJaaz6HVv7Pvuse+LMvU2V1oey2adNfDS+zVoFYLe2kFcwhTw==
X-Received: by 2002:a50:c351:0:b0:567:56a4:3940 with SMTP id q17-20020a50c351000000b0056756a43940mr1190062edb.19.1711702960448;
        Fri, 29 Mar 2024 02:02:40 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id b20-20020aa7cd14000000b0056bf9b4ec32sm1816243edw.78.2024.03.29.02.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 02:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Mar 2024 10:02:39 +0100
Message-Id: <D064242SMIVM.1GUC1I9GE9IGC@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Kishon Vijay Abraham I"
 <kishon@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFT 0/7] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
X-Mailer: aerc 0.15.2
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org> <CZUHV429NTF7.1GW9TN9NXB4J1@fairphone.com> <7a7aa05f-9ae6-4ca0-a423-224fc78fbd0c@linaro.org> <liah4xvkfattlen7s2zi3vt2bl5pbbxqgig3k5ljqpveoao656@iacnommxkjkt> <236a104c-fc16-4b3d-9a00-e16517c00e3a@linaro.org>
In-Reply-To: <236a104c-fc16-4b3d-9a00-e16517c00e3a@linaro.org>

On Tue Mar 26, 2024 at 10:02 PM CET, Konrad Dybcio wrote:
> On 16.03.2024 5:01 PM, Bjorn Andersson wrote:
> > On Fri, Mar 15, 2024 at 06:35:15PM +0100, Neil Armstrong wrote:
> >> On 15/03/2024 18:19, Luca Weiss wrote:
> >>> On Thu Feb 29, 2024 at 2:07 PM CET, Neil Armstrong wrote:
> >>>> Register a typec mux in order to change the PHY mode on the Type-C
> >>>> mux events depending on the mode and the svid when in Altmode setup.
> >>>>
> >>>> The DisplayPort phy should be left enabled if is still powered on
> >>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
> >>>> PHY is not powered off.
> >>>>
> >>>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE state=
s
> >>>> will be set in between of USB-Only, Combo and DisplayPort Only so
> >>>> this will leave enough time to the DRM DisplayPort controller to
> >>>> turn of the DisplayPort PHY.
> >>>>
> >>>> The patchset also includes bindings changes and DT changes.
> >>>>
> >>>> This has been successfully tested on an SM8550 board, but the
> >>>> Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPor=
t,
> >>>> PD USB Hubs and PD Altmode Dongles to make sure the switch works
> >>>> as expected.
> >>>>
> >>>> The DisplayPort 4 lanes setup can be check with:
> >>>> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
> >>>> 	name =3D msm_dp
> >>>> 	drm_dp_link
> >>>> 		rate =3D 540000
> >>>> 		num_lanes =3D 4
> >>>
> >>> Hi Neil,
> >>>
> >>> I tried this on QCM6490/SC7280 which should also support 4-lane DP bu=
t I
> >>> haven't had any success so far.
> >>>
> > [..]
> >>> [ 1775.563969] [drm:dp_ctrl_link_train] *ERROR* max v_level reached
> >>> [ 1775.564031] [drm:dp_ctrl_link_train] *ERROR* link training #1 fail=
ed. ret=3D-11
> >>
> >> Interesting #1 means the 4 lanes are not physically connected to the o=
ther side,
> >> perhaps QCM6490/SC7280 requires a specific way to enable the 4 lanes i=
n the PHY,
> >> or some fixups in the init tables.
> >>
> >=20
> > I tested the same on rb3gen2 (qcs6490) a couple of weeks ago, with the
> > same outcome. Looking at the AUX reads, after switching to 4-lane the
> > link training is failing on all 4 lanes, in contrast to succeeding only
> > on the first 2 if you e.g. forget to mux the other two.
> >=20
> > As such, my expectation is that there's something wrong in the QMP PHY
> > (or possibly redriver) for this platform.
>
> Do we have any downstream tag where 4lane dp works? I'm willing to believ=
e
> the PHY story..

Just tested on Fairphone 5 downstream and 4 lane appears to work there.
This is with an USB-C to HDMI adapter that only does HDMI.

FP5:/ # cat /sys/kernel/debug/drm_dp/dp_debug
        state=3D0x20a5
        link_rate=3D270000
        num_lanes=3D4
        resolution=3D2560x1440@60Hz
        pclock=3D241500KHz
        bpp=3D24
        test_req=3DDP_LINK_STATUS_UPDATED
        lane_count=3D4
        bw_code=3D10
        v_level=3D0
        p_level=3D0

Sources are here:
https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-5.4/+/r=
efs/heads/odm/rc/target/13/fp5
And probably more importantly techpack/display:
https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/op=
ensource/display-drivers/+/refs/heads/odm/rc/target/13/fp5
Dts if useful:
https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/d=
evicetree/+/refs/heads/kernel/13/fp5

Regards
Luca

>
> Konrad


