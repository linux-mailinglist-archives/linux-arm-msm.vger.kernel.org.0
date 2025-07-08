Return-Path: <linux-arm-msm+bounces-63970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE8AFC249
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92E663A67D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 05:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55FD21B91D;
	Tue,  8 Jul 2025 05:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EU6Dt2Iw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067DA219A97
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 05:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751954051; cv=none; b=T25X6tc4uaY4ivx5uG9mp68a7nKCtwcgxbY+S2kejkjEoPmvvHLjlMwc/8VdeEfWByIHc4JHjaN/WaU18DCDICmANU7q+xoJq2RChKayCVBmfr3/tR0NGmDr35oPkogBje8rO7K2XMA/8shaRQqBYIiczTEXKDjMR4zDYjGZsbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751954051; c=relaxed/simple;
	bh=Ts/erfI/1U95juCnNCnHSS+t4688tJmeinxH2Afpx9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmu2NwRkk/cyNwk17DnlEGipotEx0325NEZAmCbjny6frpgz6SaWzkRpqzVb/90Bnh8NMeSapxKbsZXDpVVX02DC+g9/Zc+wtI/ICTBz41S6vHynkS7rRUJ1Sj5kyGYPl933EedE6eSX7b18ebnEp1OUvIvkaZuUf6o2dnV0UW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EU6Dt2Iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567KDvH8010872
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 05:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GmNWG+f9cfzqdcMMSlVKHfNJeTBBI9yl9OtdiG/Ptg=; b=EU6Dt2Iw39reaJ9o
	JeBZHeaE+aHBIAWsOnsMtTCfrXUfBe6NnjyjDhcWPloxGShENUaXZicEalIbUgds
	tn0OlKGBsV+eKnEyQOsbc7JPV2teRdPmhHEvGjEfj93WNNpzjqhldga88XrBg3se
	jkq+rOyhjTwiXvICusrUK8awrfzYhy+j1aHIckrHafxgANGfUjOT7cyOsRiMeAHh
	FvjxhidYG2NzzWcrcHp0q3dL31fHg3wPsvmTXq53BqMn7N8VC34H+xuoQnItYbfh
	QT0WY0NDW/eV5s/SyS+yWhILu6RmcXAlXeEl43+4xcr9TcoxJ4Pi3setmFbcuCny
	HKry8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefb97h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:54:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a819c5fe7bso81179921cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 22:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751954048; x=1752558848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GmNWG+f9cfzqdcMMSlVKHfNJeTBBI9yl9OtdiG/Ptg=;
        b=wQppmnLi8eU11/1YtJ3IemqEnzEC4kVqcprh6lRO+2XVQrHky4B6dz23CydLRu/bGz
         UJGRdgURD4Pyb6aYweajAGjuKD2NNIzClAE+qtyXRKxIYokugMhX1xOh/rlo9zuFmI04
         tUlgLH5E8gyZ0sKsDvoe2BS5P9eHeaXKt6iDs5irPr0igCZC5cn9zqkOKXs/JTuB4k9M
         bfO738jX0tc/BSmIkJhRFYrCD/naAL3pbO8+MB5K0QxRsDHuj+CCHKvIdTzDD2+Lamxh
         EtZLwnW5iPm2sp8vMs6QHovj59AgBEcVZfRuu4MpctOWTzNt61NO8Ql4cgXUhQQJpJs2
         hbEA==
X-Gm-Message-State: AOJu0YwZNQnEYttdr9MTON85dKswRHFU3ijTmXmddWTdwBnP1MXjFad2
	rxHggjEIam8pJNt5MuMv7Z+VIw5HiXU2UARk8E7YXBkQXHsUgTEDUVkbYjpCPI/uwcKI4wG7p3i
	OXrhiUbA9EdJ6/8Xm8K/3KrwMMKUDs6C0F3nqvuQNnX2YCdbRdvDS7YClqVUgij28DRUl2gNrRt
	zvuASrQCg4ES0SrhS0fHupAfCfE9n287ZgQKLoAULHvL0=
X-Gm-Gg: ASbGncvU0JkfDOPKTJ8rLj67u7HG4i51nFDzfUWeLpLLxu1jXjf46G+muyPbzeb1aSY
	xgwukYKClF3XxOum6go6BPZL1ENDsZwF/aMO70eCGA2VgdHR2dFmY9R7syBvTaJsoLiYXiMBbTK
	cUb/+VRA==
X-Received: by 2002:a05:622a:11d3:b0:4a9:a8fd:e9b6 with SMTP id d75a77b69052e-4a9ccde0c6dmr28981661cf.43.1751954047885;
        Mon, 07 Jul 2025 22:54:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkG1/PSmURffRz+0DyrY9TkdVduj7SqUgcOww7V+BMUeR9MlSOMnFuQ7oVlpqf/7eAZK6d7px/g5X1y38kNsY=
X-Received: by 2002:a05:622a:11d3:b0:4a9:a8fd:e9b6 with SMTP id
 d75a77b69052e-4a9ccde0c6dmr28981421cf.43.1751954047335; Mon, 07 Jul 2025
 22:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com> <2025062812-passive-untracked-1231@gregkh>
In-Reply-To: <2025062812-passive-untracked-1231@gregkh>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 11:23:56 +0530
X-Gm-Features: Ac12FXwC05pfIP0vuicV5_xxuQYsfA7JDBPhIFqXwHeQhoKpkWFA1t07QrroD6g
Message-ID: <CAPHGfUOUR=m2rq-rFbUbWjF93qwY5ikHc+M0_KuHOut86z+Mqg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0NSBTYWx0ZWRfX+vJ+dYX10ZcQ
 5WqOQxg23/USrWlrF2UH+NZz2klIdYHxPsJSs1kDVV33DxwO/3JFiHECbkbPiKM5ykVqToWSC5/
 4qSfdsv3et56+hYWBM/pRo9V/KSGvONMpTCsTxk6FNsZXVuALx6u/iSh5BP2wk1yfhSQ0lPdsL3
 7f7z9uRR/Ch+YTgVNw7shpSbX7JWTOjlReKtdWd5ykeBbQkj2D1dwos1aVb/9lxkCjfoiVtwKkm
 6L3YYhSSgVwqDvn0HrAy02rzDF07Ekk6B3NihlpzGN42WeyCwccw7lrJ3PBWwV6JPxrsFa48g6Z
 Fu3GDphGWyrk6h+GMbxpx5Ai6+PBfpNlIMaMdurZhLEnJa5kFru+taXvY3VnLQjHclbLvoocr/O
 eKkD18G7WqByJ7C9tiwcXLAR8M69k9ZJyeB34VRdRFzYA3Qb0mv01HkcDlmfxmmFbY174VvJ
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686cb280 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8
 a=3Jk0H8i_qCR-h2oskiIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: zhjb-pLSEeaIPh7vLuBjA7ij31Ci7bB4
X-Proofpoint-ORIG-GUID: zhjb-pLSEeaIPh7vLuBjA7ij31Ci7bB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080045

On Sat, Jun 28, 2025 at 8:06=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jun 27, 2025 at 06:21:31PM +0530, Komal Bajaj wrote:
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
> > Changes in v2:
> > * Drop separate compatible to be added for secure eud
> > * Use secure call to access EUD mode manager register
> > * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_=
molvera@quicinc.com/
> >
> >  drivers/usb/misc/qcom_eud.c | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> > index 83079c414b4f..30c999c49eb0 100644
> > --- a/drivers/usb/misc/qcom_eud.c
> > +++ b/drivers/usb/misc/qcom_eud.c
> > @@ -16,6 +16,8 @@
> >  #include <linux/sysfs.h>
> >  #include <linux/usb/role.h>
> >
> > +#include <linux/firmware/qcom/qcom_scm.h>
>
> Why the blank line before this #include line?

The qcom_scm.h header has been placed in a distinct paragraph to clearly
differentiate it from generic subsystem headers, with a blank line included
for visual distinction

>
> > +
> >  #define EUD_REG_INT1_EN_MASK 0x0024
> >  #define EUD_REG_INT_STATUS_1 0x0044
> >  #define EUD_REG_CTL_OUT_1    0x0074
> > @@ -34,7 +36,7 @@ struct eud_chip {
> >       struct device                   *dev;
> >       struct usb_role_switch          *role_sw;
> >       void __iomem                    *base;
> > -     void __iomem                    *mode_mgr;
> > +     phys_addr_t                     mode_mgr;
> >       unsigned int                    int_status;
> >       int                             irq;
> >       bool                            enabled;
> > @@ -43,10 +45,14 @@ struct eud_chip {
> >
> >  static int enable_eud(struct eud_chip *priv)
> >  {
> > +     int ret;
> > +
> >       writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
> >       writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
> >                       priv->base + EUD_REG_INT1_EN_MASK);
> > -     writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
> > +     ret =3D qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> > +     if (ret)
> > +             return ret;
>
> So the previous writes are ok, but this one could fail?  And if it does
> fail, what did the previous writes cause to happen to the chip / system?

Thanks for pointing that out. I will move the SCM write before the direct
register writes to avoid any inconsistent state if the SCM call fails

>
> >       return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
> >  }
> > @@ -54,7 +60,7 @@ static int enable_eud(struct eud_chip *priv)
> >  static void disable_eud(struct eud_chip *priv)
> >  {
> >       writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> > -     writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
> > +     qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
>
> No error checking needed?

ACK

>
>
> >  }
> >
> >  static ssize_t enable_show(struct device *dev,
> > @@ -178,6 +184,7 @@ static void eud_role_switch_release(void *data)
> >  static int eud_probe(struct platform_device *pdev)
> >  {
> >       struct eud_chip *chip;
> > +     struct resource *res;
> >       int ret;
> >
> >       chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> > @@ -200,9 +207,10 @@ static int eud_probe(struct platform_device *pdev)
> >       if (IS_ERR(chip->base))
> >               return PTR_ERR(chip->base);
> >
> > -     chip->mode_mgr =3D devm_platform_ioremap_resource(pdev, 1);
> > -     if (IS_ERR(chip->mode_mgr))
> > -             return PTR_ERR(chip->mode_mgr);
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +     if (!res)
> > +             return -ENODEV;
>
> -ENOMEM perhaps?

ACK

>
> thanks,
>
> greg k-h

