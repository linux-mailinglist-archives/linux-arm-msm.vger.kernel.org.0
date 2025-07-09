Return-Path: <linux-arm-msm+bounces-64254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E87E4AFEC1E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B0E21C42D04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BA12E0930;
	Wed,  9 Jul 2025 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPavAYeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1C61A841E
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071792; cv=none; b=CmWmpo+O5hBet0tp/oAobjPAawTzGh/pjA0BhyGm7ApyjBDXSM5A2RLRrliGGh0Wv7HNu8/AJBMs8I3ole1zTTStj4a+VbDoOx0RQyZdcdvx6e84nSGldrshVLWlpET3woYyhdJIVxef263qSIXeiPAH7+01vhiMxTo8SwLPB7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071792; c=relaxed/simple;
	bh=sv/H/HyWNkZZmZDvxOBObirCr13ethXeQqHLTtwYGC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=En2vy2Qa0VspbLX8VcAy7h8AFhDVl1ITlx9XfY7in0QDdhZsif8nrndx0+odQit0Lu7oQuGg3umg+x+9IdFkGoZF/1MBuPXYEBSb618U1Q5LEr2I8kjCpOab1Y6s1ikQtqAX1bmf4xInpAfUdzZYgP31Hos/gdFD2M/Vp428JX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPavAYeI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Coi2L012548
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 14:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GH/ico9gvqryEnV/YdeaNNNe3tHOcfG/8CWf6ZjZbSo=; b=RPavAYeIgxXBuFhr
	hQMOOytkGv0fzgzpeow88+4/SXnF6wIckztMsucC/SG48eTn1wWZgN4sbQdIK9ib
	ouMI1Zd0rm/5OGMlf2OeopArI5RJ/hPGtFUhauqKJsCpCTWmf1/VnB/NLG00QIcv
	Qna3OrWU9rVcqdcrxrThtjIp9Bt5nHf2LkHYm8HVrwI/T1i9+BW925P7jBFbRNwI
	YwNxRjyU+oi0mr8i52TBzy58Ul0cNsmeTYBhajVCn2rYtp+Dvxvs0DMidNhNCj4U
	RrjOT0qnnuLfMFBCCJ+MNrBuXwXIPxkAeee3I/azEUX+a4Z4Mh/2MRia6QCaW2KC
	VN9o9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn4xd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 14:36:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a44e608379so178051291cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071788; x=1752676588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH/ico9gvqryEnV/YdeaNNNe3tHOcfG/8CWf6ZjZbSo=;
        b=QNBl2KUL+pI72ikL4kwXVKlNXiPkOFN94jZthk+YJz2OZ/gyh0NqyI3E7IEVp1ikCl
         AVJG1YtmSNmbBtrjrKry2wX3f3d8k+r/jFrymCTjhf6vXzqAoOHO265LmH2vwxqFwDhU
         rBH/7FfmCkPFu39MD8egv3ALSl5vWEmWMNtUzrMGaK4r33/8uQr5nWFQn7LKbVBYXBoP
         XIyitkEkVx0J8Ns5oQSd82NcrFGy45AYWsj6U0t8P17ftkZIwUzjI0Aw1HfhGcYQOr+A
         oarddPdQpnkuT5W6zwE5STwr1KZStGvo23bI9eHzA85xIUTD+EwmtlR2QWSDfinxeDGs
         1fsQ==
X-Gm-Message-State: AOJu0YzDmTES3sBWmEE4kIMDiK2mi9tWJtHx67BEIuagM9QIKDyAZz5k
	nNF0UVWwt+qDSbg0bSVDa5dncvJuox/YbqiGhU5RMIO0Gr6YmO3Udw9re7AmO2+OVI+xWnu2cmM
	YmJJqajsXKM/SkE76kDmdyvUpD2k9Bnsm0gwJmRCIptLYyrEN07HEa5iAK6WOL4boQn15j1TgbQ
	2Fp8U7SNiBvDHvzJZoGI/5Wtd8IQ5SECxY5/FMYX1XZU4=
X-Gm-Gg: ASbGncs0B87mBPIE8LOKoWBb3HzgPE16F8cXIitS7ExDLzT+PUfgFC0EtZm4dZV6+Ly
	LANXtp5QumlRgVWO3xVLNrhAlSUdYKMjdanhn7yjr6T9tn4/yEsWS407087PvMzXCovxceFe4Zt
	dlOR9Q
X-Received: by 2002:ac8:5f8f:0:b0:494:5805:c2b9 with SMTP id d75a77b69052e-4a9decfa987mr37257091cf.31.1752071787925;
        Wed, 09 Jul 2025 07:36:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDu0dcoZtXKGCF/d9TGz4O49NrlC4vyEc4o94yqcgexOyu9zx6O6XVFZJfpYZI0LVYto2NUEJndHgIujg1rjk=
X-Received: by 2002:ac8:5f8f:0:b0:494:5805:c2b9 with SMTP id
 d75a77b69052e-4a9decfa987mr37256441cf.31.1752071787309; Wed, 09 Jul 2025
 07:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709065533.25724-1-komal.bajaj@oss.qualcomm.com> <2025070924-wilt-dreamt-fb25@gregkh>
In-Reply-To: <2025070924-wilt-dreamt-fb25@gregkh>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 20:06:16 +0530
X-Gm-Features: Ac12FXy8WkTNVHPUAdigdIeD1NVFTXRsrAlyhx4EcH1ohwyzfYFh1LevtGM-yXY
Message-ID: <CAPHGfUN7k_oLrjvXPJj84Q5NayXFab2QSQ+g4iYjrAsPqO_KnA@mail.gmail.com>
Subject: Re: [PATCH v4] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686e7e6c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ag1SF4gXAAAA:8
 a=aoTH-x754zP81mJImO0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: YajoBSb5FRc6WePDTMuo32HB7CdgbPzT
X-Proofpoint-ORIG-GUID: YajoBSb5FRc6WePDTMuo32HB7CdgbPzT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEzMiBTYWx0ZWRfXzGS1p4KmvraZ
 flLTHzBG1SjjrV9pGfw2UzdN1QVmpg7+yfCo85EgafifLkZhJxsClgsUT4MQZubwDhbfh42fQkg
 ULzErOasjgn0bIzTR27yh8sCsacbqfKSpnOmXe5SUH5MySJzq41j88BPgkQ7jvYy97JaltIOfPl
 D7buZ0Cc5JgnTs+HsvQKKqZlVS4A03G0AoQumX+5pqh0K6cHUqInFW+V9Ya7Yh4LSmqFEoR0CrU
 9V1UTOgj//dxDqFF5rp0N2Zh55Pjwkvi2MhwC4Dk2eEm574MhLB3Gb+H7q81R4CqoG82sE79on3
 +HQaMvEh4KcHKUIlg28E/oxhlRCIiSs6ZQfaz2Es/FzEYm8XmBSrmfyofA+EBvZzvxK9K4fq8JE
 k9ae/RB1L3mdDlIeLufrhjoyzPrMTYG3Fs/iAnXZ/O8hc4YLmvmGM5bo79lO+C5VEkjrGh1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090132

On Wed, Jul 9, 2025 at 2:14=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 09, 2025 at 12:25:14PM +0530, Komal Bajaj wrote:
> > EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> > as read-only for HLOS, enforcing access restrictions that prohibit
> > direct memory-mapped writes via writel().
> >
> > Attempts to write to this region from HLOS can result in silent failure=
s
> > or memory access violations, particularly when toggling EUD (Embedded
> > USB Debugger) state. To ensure secure register access, modify the drive=
r
> > to use qcom_scm_io_writel(), which routes the write operation to Qualco=
mm
> > Secure Channel Monitor (SCM). SCM has the necessary permissions to acce=
ss
> > protected memory regions, enabling reliable control over EUD state.
> >
> > SC7280, the only user of EUD is also affected, indicating that this cou=
ld
> > never have worked on a properly fused device.
> >
> > Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded U=
SB Debugger(EUD)")
> > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> > Changes in v4:
> > * Added error logging in disable_eud() for SCM write failures, per Konr=
ad=E2=80=99s suggestion
> > * Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.=
bajaj@oss.qualcomm.com/
> >
> > Changes in v3:
> > * Moved secure write before normal writes
> > * Added error checking in disable_eud()
> > * Use ENOMEM error code if platform_get_resource() fails
> > * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> > * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.=
bajaj@oss.qualcomm.com/
> >
> > Changes in v2:
> > * Drop separate compatible to be added for secure eud
> > * Use secure call to access EUD mode manager register
> > * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_=
molvera@quicinc.com/
> >
> >  drivers/usb/misc/Kconfig    |  1 +
> >  drivers/usb/misc/qcom_eud.c | 27 +++++++++++++++++++++------
> >  2 files changed, 22 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > index 6497c4e81e95..f49d5ac0e957 100644
> > --- a/drivers/usb/misc/Kconfig
> > +++ b/drivers/usb/misc/Kconfig
> > @@ -148,6 +148,7 @@ config USB_QCOM_EUD
> >       tristate "QCOM Embedded USB Debugger(EUD) Driver"
> >       depends on ARCH_QCOM || COMPILE_TEST
> >       select USB_ROLE_SWITCH
> > +     select QCOM_SCM
>
> How is this select going to work if COMPILE_TEST is enabled on
> non-ARCH_QCOM configs?
>
> Please don't use select if at all possible, use "depends" properly.

Ack, will switch to depends on QCOM_SCM to avoid build issues with COMPILE_=
TEST

>
>
> >       help
> >         This module enables support for Qualcomm Technologies, Inc.
> >         Embedded USB Debugger (EUD). The EUD is a control peripheral
> > diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> > index 83079c414b4f..a58081f53db3 100644
> > --- a/drivers/usb/misc/qcom_eud.c
> > +++ b/drivers/usb/misc/qcom_eud.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/sysfs.h>
> >  #include <linux/usb/role.h>
> > +#include <linux/firmware/qcom/qcom_scm.h>
> >
> >  #define EUD_REG_INT1_EN_MASK 0x0024
> >  #define EUD_REG_INT_STATUS_1 0x0044
> > @@ -34,7 +35,7 @@ struct eud_chip {
> >       struct device                   *dev;
> >       struct usb_role_switch          *role_sw;
> >       void __iomem                    *base;
> > -     void __iomem                    *mode_mgr;
> > +     phys_addr_t                     mode_mgr;
> >       unsigned int                    int_status;
> >       int                             irq;
> >       bool                            enabled;
> > @@ -43,18 +44,30 @@ struct eud_chip {
> >
> >  static int enable_eud(struct eud_chip *priv)
> >  {
> > +     int ret;
> > +
> > +     ret =3D qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> > +     if (ret)
> > +             return ret;
> > +
> >       writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
>
> Nit, why is your local writel() function in backwards order of
> parameters from qcom_scm_io_writel()?  That's going to be a major pain
> to maintain over time, don't you think?

The current ordering of parameters in qcom_scm_io_writel  is the same as in
qcom_scm_io_readl, possibly to keep them consistent. However, if you believ=
e
it's more appropriate to align the parameter order with the standard writel
convention, I=E2=80=99m open to updating it accordingly.

>
>
> >       writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
> >                       priv->base + EUD_REG_INT1_EN_MASK);
> > -     writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
> >
> >       return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
> >  }
> >
> >  static void disable_eud(struct eud_chip *priv)
> >  {
> > +     int ret;
> > +
> > +     ret =3D qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
> > +     if (ret) {
> > +             dev_err(priv->dev, "failed to disable eud\n");
> > +             return;
> > +     }
> > +
> >       writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> > -     writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
> >  }
> >
> >  static ssize_t enable_show(struct device *dev,
> > @@ -178,6 +191,7 @@ static void eud_role_switch_release(void *data)
> >  static int eud_probe(struct platform_device *pdev)
> >  {
> >       struct eud_chip *chip;
> > +     struct resource *res;
> >       int ret;
> >
> >       chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> > @@ -200,9 +214,10 @@ static int eud_probe(struct platform_device *pdev)
> >       if (IS_ERR(chip->base))
> >               return PTR_ERR(chip->base);
> >
> > -     chip->mode_mgr =3D devm_platform_ioremap_resource(pdev, 1);
> > -     if (IS_ERR(chip->mode_mgr))
> > -             return PTR_ERR(chip->mode_mgr);
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +     if (!res)
> > +             return -ENODEV;
> > +     chip->mode_mgr =3D res->start;
>
> No ioremap() call needed anymore?   Why not?

We=E2=80=99re only using the address for qcom_scm_io_writel(), which operat=
es on
physical addresses and doesn=E2=80=99t require an ioremap=E2=80=99d virtual=
 address.
That=E2=80=99s why devm_ioremap_resource() isn=E2=80=99t needed here.

>
> thanks,
>
> greg k-h

