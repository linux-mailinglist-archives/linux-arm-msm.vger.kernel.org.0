Return-Path: <linux-arm-msm+bounces-25473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E38E929FB1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 11:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC429287B8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 09:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E6873514;
	Mon,  8 Jul 2024 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiTlp5YE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F37345B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720432640; cv=none; b=iQj1dHqS0U1z0ezccPJgy1J1EAechQmBfMu50BGDB3CWVJExLdjgWuH31DYrGPK97XGLl0Fl8Rr2cWKtFOJJkQ4JBg0DJpOgueY8rBeSEx88W2DC3jibEXZq6f6Vgw9AykO+lTlkUIHe2fPa8cS4/hFpMXMJ4VXZkz7FrJGeZ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720432640; c=relaxed/simple;
	bh=kzpWgPQ+AXdJhpF4uskYQiVLH0Y4/sXVd8yVxupMt1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5YrBbFSV+dFjqg0AE91wXn9xT6aOIKOVYJRuorYQKpOlOigtfod99d4QmxfFwN9c9wVSQP0OmLaHTiXFxyHvr8mbZf9FAA2kT2+3zDmq3UcX1hj7Yl1pM+GllV4pZDGHchZttdZ+1F5Ou8Y0E4IvqU5w1OvN/NcV06jtXDiXRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiTlp5YE; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4f2da6cbe7bso1215121e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720432638; x=1721037438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugUUhsmVNYwQtoTbN64bwPW2B/pPcC78bhF0bEn6TGc=;
        b=ZiTlp5YE4gRSn1RssO0HgGeGl0wqB+Iqn/RtNYenKqaoNfASMBU49KISEXd+qpNR64
         an1mfPUpdnDGI4XZcZxUUpavURz6Vt5ANw7ssWSqroaodnNpmClUXhCMQfL5e8xnKSXz
         tmIojhrS4p5jXkUyXKNtUt5AHUl62KYjHh3Tmz+xeoo8XthDM+we2Pc2ZOJ8a8FLvX8o
         +UIwQIyot8y6lQG8F+eB5M2y4q+pKpRN4LxiVx1biqgEbD/myM9jf4x9n4wxFSFvNeDZ
         EfDum90IEEhptwJcQ5/7Xsptxq7EbZiyNW9koQuM8DhGIEjIeC0Ou6GhiB0I1JFVycJ+
         OipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720432638; x=1721037438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugUUhsmVNYwQtoTbN64bwPW2B/pPcC78bhF0bEn6TGc=;
        b=A881s/uKlGD/uofwn2gUoHqASz7GL8JWYRNApYjH2ImWmqvTnfFn2Arf46sRkTCs9H
         BesE08L8v56OCmPtFObQdl4GqDkdX3CBXwUvwy/Emaw+XTKlOQs0gH/UIwOn5lIEAa8R
         KCMgaGU4L2wUaeUW+vrwmY6dKdME5C3eS8aZk9smIWBdNnWBxEkDAG27yhE2QasjGRn6
         +HPUQ0gDQYRuv+GlWRv2yJsQx4qfEdc8Zh27dUK8ivEzuXNa4Qh/Io/z5yQWVN6Eacj8
         t6K1LlTccgMFAtCJaq4y1hXuKLj1q5SqnToS+OWZ3JNMWTcQIUS7BDLPaN6YWk7cCVIK
         1wLA==
X-Forwarded-Encrypted: i=1; AJvYcCUyod7wID8d2Liwzuy2jXqEGDohHx0sV9mMBbMHlAnF4l/vTCPMKueisBbexwvLk2RjHYuWtIm9rE3mDqTc2tbc5inOL01qH20n3fnFkg==
X-Gm-Message-State: AOJu0Yz1DBXA1oyJse/7swxUibHXhl7Kf/q+uY5b4fOgvopzNqxXFMl+
	JnG7VxiD268tJEx1LjJHFNLNn7epHOSZ4u0TxEJ/1ywB7m8TX4H+Ors9tAyopcMghjjGBPo3AI1
	W+swSdAj67z2tWVg+jr33OS12toQ=
X-Google-Smtp-Source: AGHT+IEM7tiXc2WC9v3MUVQR0LfIGg28NNDwkISptdBpTomakMAfCWq2f7yHwbjnHv81VCajycO06GXEQ2aAsGQJIv8=
X-Received: by 2002:a05:6122:d22:b0:4f2:d451:97da with SMTP id
 71dfb90a1353d-4f2f3ff73a1mr11538359e0c.12.1720432637678; Mon, 08 Jul 2024
 02:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHCJQqFdDRz7ZyxoeDd1FLu-yjCCHy=Y1Sq2wMDFFH12G1625Q@mail.gmail.com>
 <20240708082132.GA5745@thinkpad>
In-Reply-To: <20240708082132.GA5745@thinkpad>
From: Murithi Borona <borona.murithi@gmail.com>
Date: Mon, 8 Jul 2024 12:57:06 +0300
Message-ID: <CAHCJQqGPtSHx5LbRF69CJ78x7TwXt332-8cMwXrpVyPWURVFhw@mail.gmail.com>
Subject: Re: [PROBLEM] bus: mhi: host: pci_generic: SDX24 Channels
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, duke_xinanwen@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here's the sub-vendor/device ids.

Slot:   0003:00:00.0
Class:  PCI bridge
Vendor: MEDIATEK Corp.
Device: Device 7988
Rev:    01
ProgIf: 00

Slot:   0003:01:00.0
Class:  Unassigned class [ff00]
Vendor: Qualcomm Technologies, Inc
Device: SDX24 [Snapdragon X24 4G]
SVendor:        Qualcomm Technologies, Inc
SDevice:        SDX24 [Snapdragon X24 4G]
ProgIf: 00

Duke,

If it helps this is the modem firmware/config as seen by ModemManager.

manufacturer: quectel
model: EM120R_GL
firmware revision: EM120RGLAPR02A07M4G
carrier config: ROW_Commercial
config revision: 08010809
h/w revision: EM120R_GL

Full Firmware Version: M120RGLAPR02A07M4G_10.010.10.010

On Mon, 8 Jul 2024 at 11:21, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> + Duke Xin (who is adding Quectel modem support these days)
>
> On Sun, Jul 07, 2024 at 08:23:57PM +0300, Murithi Borona wrote:
> > Hello,
> >
> > Module: Quectel EM120R-GL
> >
> > This module does not appear to work fully with the default SDX24 config=
uration.
> > It appears to be another variant of the EM120R-GL (Also FCC-Locked by d=
efault).
> >
> > Issues:
> > - Debug ports are missing (AT)
> > - It only works over MBIM/QMI with Qualcomm's RMNET driver.
> > - In QMI mode it's really unstable and unpredictable with the QMI port
> > freezing up.
> >
> > Are there any missing channels in the SDX24 config or is this a hw/vend=
or issue.
> > When using Quectel's drivers (and blacklisting mhi_pci_generic), all
> > the ports are available.
> > The configuration for other variants of the same module brings up the
> > AT port ( with a recurring warning/error).
> >
>
> Most likely this device is a derivative product that needs a different
> configuration than EM120R-GL. Could you please share the sub-vendor/devic=
e ids?
> You can just share the output of 'lspci -vmm' command.
>
> Duke Xin: Are you aware of such derivative product?
>
> - Mani
>
> > >> [ 5074.472791] sequence number glitch prev=3D1 curr=3D0
> >
> >
> > mhi_qcom_sdx24_info
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
> > Inc SDX24 [Snapdragon X24 4G] [17cb:0304]
> >
> > ports: mhi_hwip0 (net), mhi_swip0 (net), wwan2mbim0 (mbim), wwan2qcdm0
> > (ignored), wwan2qmi0 (qmi)
> >
> >
> > mhi_quectel_em1xx_info
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
> > Inc SDX24 [Snapdragon X24 4G] [17cb:0304]
> >
> > ports: wwan0 (net), wwan0at0 (at), wwan0mbim0 (mbim), wwan0qcdm0 (ignor=
ed)
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

