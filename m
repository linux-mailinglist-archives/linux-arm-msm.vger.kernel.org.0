Return-Path: <linux-arm-msm+bounces-84090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF7C9BC8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 15:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81D594E301D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 14:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCAB202C48;
	Tue,  2 Dec 2025 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIqgzVZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F2F18BC3D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764685870; cv=none; b=LV/3Mar5IGRmqWlBrQeNzkrQ521wDg09ufmE0eZgXY0otVUeFekjpDP/f4/tGEwYbrTWEHXnmGXER1KbC9CLldGXmFvBOMP3Yl9CcNf3Bj2RX2SD7YcKCYaMGvxxdBeTkFEmVo/Ebz1qBGHAyozcZQ5q1/d2Szon4/Y5agNp17o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764685870; c=relaxed/simple;
	bh=pcqt4XdjF+CDytCzwvAyGUFPa5+W/Fdo3rdQgQfLPh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezM6q4wzkkzJa523TBzKfT7xfwZ8u7gjH/yhA9+hZvH6LAvEvkXKzCrIJlctCqOwaD+3K6Z25hGKlgqoyPwr9L8utrpf3mQ2y6gpEYfZoByxmnLtxlHoli2wxzlAgy+WmPo0gVzXSG3mMROMlTBYfWFly43Fdu0Ai8Iqf0b2N6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIqgzVZP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37b96cbd875so45465761fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764685867; x=1765290667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0PCMs54UXzZSdH1jgNNXPaRPg4CaAgu9x8m2HqMwp4=;
        b=bIqgzVZPVBGAP5NKddiABgDiBrDEMeGNYELasWpm4LeVX8tmzHCHOnlgHMgAS9Wvre
         BotdXkRIiFC3KT9E3IwSNktvJ4Kk9dvuVoXhm6X0gL/zgRbggSEnv2mBrxXyyY/GR6oy
         f8Ia1gdWgdK4XBJg3ixE4oUtQDfwaxA32ZycaST4TvL5Wk5ITc5qn+++FTlqi1f/x/c7
         iFRf7GBaZTKVr8/i/a7/N18vVN1Q5ddcE+/wiCa8gMT9hcET2oKuF4lloxFrjYAOj4f4
         tA5jzilI0e+I08HA9JS8nxb9fm9uUArWkgs/p2VbDR7vE7IqmXXkBwtsgPMwpCadZEFz
         4m3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764685867; x=1765290667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r0PCMs54UXzZSdH1jgNNXPaRPg4CaAgu9x8m2HqMwp4=;
        b=BU7BE8SW6qOgdvHcaN7rCI3v7h2uqT5XaPYlTXzcv8LaRqROYBXP0K8tePwKKGtsW0
         d6qoOY71pb4fkm5yFfF7CQdeNMtl5q7zTWnGVUcGztmVu+vW4FI31H/kbpqrNVYd94eA
         nE5yToB7GJvIzJINmJn3LvoKIFSXavsxELofDne/2H0QXWrzM//r3g6BJ6gqHWEhE8KF
         xHqOBuPN4jYJvqZmCdjaFbr2HAT94dfp1O1ilwAWQlbt1vM6kBGblPtnT8PSxeJgazuG
         c5DTNYuys4E9bzn3KZn3oT8Epa9l7lYwmF6vB/mdnwLKnfSZhtv+7NTX1gv4ZXbzSHkY
         uuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjVldDr3FaQrkpidE1HUiRACVnwSdPCh/OXI5GLvSPPorUrm+/Q9cvtSY9o6ebNmQuAkSOq2ZVNjhIv92j@vger.kernel.org
X-Gm-Message-State: AOJu0YwBqfeROARi3nrhVg+rezsT4IXy47edf4cuvJOYK2nPackxsrZN
	MODtyrMm853FdNbH/b0t006yeHczf++RiW8ic4YaDrH7kLMZ9fxCsOaRGhBHFGtoE6nb4xqT7NC
	mMkV2qSp01JmxSLDppFMjHk/FGVjtCvE=
X-Gm-Gg: ASbGnctTIiawdtYRDSXfziDFjRr1SUcuOg3p0oyH/b/rILHzQgeayUcwa4IVjpy5SqV
	Tr8eKfuKV+WCpSGlcHBEznYp9vzZppfgKMj32BDP4nbHgn3HUM3x6FHujmJylSiIp8uEwfdgKYv
	G/QDoIFcif2/eXuRHwktqKTj0swVfbbyhh6+mWkYsZwhpPgIoxIXWlcpikVvD09YKK6WcjtmVgG
	ruOPoZvRZBZ2tzpVan3O+NFac3E0B/dxQ4tcIlY2s0CszfcKNYOi0PbVh0wjFt1MlDN3tgNTPnR
	d+Jg
X-Google-Smtp-Source: AGHT+IGOwZkzIdsHmSn2gpBjqwrDNfc/MzCaS7PmviqdeiZnZ71DelU/4q3Fv5ydrP/RTxp4VEUkETh4E6PuIjrFBo4=
X-Received: by 2002:a2e:9604:0:b0:37a:3123:fd9a with SMTP id
 38308e7fff4ca-37cd928dee4mr83694971fa.42.1764685866823; Tue, 02 Dec 2025
 06:31:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916140259.400285-1-quic_shuaz@quicinc.com>
 <vipw44g3fmaf7yhv5xtaf74zbgbkwhjgyjtguwdxgkkk7pimy6@eauo3cuq3bgi> <c87533fc-768d-4b70-a1aa-2639e5329058@quicinc.com>
In-Reply-To: <c87533fc-768d-4b70-a1aa-2639e5329058@quicinc.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 2 Dec 2025 09:30:54 -0500
X-Gm-Features: AWmQ_bkO_gk7n3itmkPSV3EaCnil9GDPcWHRKQKKXaQMjQaimc77N6c5fmhHKig
Message-ID: <CABBYNZJ=C3fYy=SXQyv9x-49vGSjXd-06MsQJ2N3Ps0egMRCuQ@mail.gmail.com>
Subject: Re: [PATCH v12] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail
 when BT_EN is pulled up by hw
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, stable@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_chejiang@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuai,

On Tue, Dec 2, 2025 at 4:08=E2=80=AFAM Shuai Zhang <quic_shuaz@quicinc.com>=
 wrote:
>
> Hi Luiz
>
> On 9/16/2025 11:01 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 16, 2025 at 10:02:59PM +0800, Shuai Zhang wrote:
> >> On QCS9075 and QCA8275 platforms, the BT_EN pin is always pulled up by=
 hw
> >> and cannot be controlled by the host. As a result, in case of a firmwa=
re
> >> crash, the host cannot trigger a cold reset. Instead, the BT controlle=
r
> >> performs a warm restart on its own, without reloading the firmware.
> >>
> >> This leads to the controller remaining in IBS_WAKE state, while the ho=
st
> >> expects it to be in sleep mode. The mismatch causes HCI reset commands
> >> to time out. Additionally, the driver does not clear internal flags
> >> QCA_SSR_TRIGGERED and QCA_IBS_DISABLED, which blocks the reset sequenc=
e.
> >> If the SSR duration exceeds 2 seconds, the host may enter TX sleep mod=
e
> >> due to tx_idle_timeout, further preventing recovery. Also, memcoredump=
_flag
> >> is not cleared, so only the first SSR generates a coredump.
> >>
> >> Tell driver that BT controller has undergone a proper restart sequence=
:
> >>
> >> - Clear QCA_SSR_TRIGGERED and QCA_IBS_DISABLED flags after SSR.
> >> - Add a 50ms delay to allow the controller to complete its warm reset.
> >> - Reset tx_idle_timer to prevent the host from entering TX sleep mode.
> >> - Clear memcoredump_flag to allow multiple coredump captures.
> >>
> >> Apply these steps only when HCI_QUIRK_NON_PERSISTENT_SETUP is not set,
> >> which indicates that BT_EN is defined in DTS and cannot be toggled.
> >>
> >> Refer to the comment in include/net/bluetooth/hci.h for details on
> >> HCI_QUIRK_NON_PERSISTENT_SETUP.
> >>
> >> Changes in v12:
> >> - Rewrote commit to clarify the actual issue and affected platforms.
> >> - Used imperative language to describe the fix.
> >> - Explained the role of HCI_QUIRK_NON_PERSISTENT_SETUP.
> >
> > I'll leave having the changelog inside the commit message to the
> > maintainer's discretion.
> >
> > Otherwise:
> >
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> >
>
> I noticed that this upstream patch has already been reviewed,
> but it still seems not to have been accepted. Is there anything else I ne=
ed to do?

My bad, please resend it so CI can pick it up for testing.

> >
> >>
> >> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> >> ---
> >>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
> >>  1 file changed, 33 insertions(+)
> >>
> >
>
> Thanks,
> Shuai



--=20
Luiz Augusto von Dentz

