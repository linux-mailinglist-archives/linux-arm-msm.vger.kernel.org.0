Return-Path: <linux-arm-msm+bounces-25379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C79949288E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 14:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31957B216FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 12:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6D914A61B;
	Fri,  5 Jul 2024 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CWx6Qxyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E05143C79
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720183478; cv=none; b=OW0FrpwLE+PmiwVF8utp6cQwpp/eayF9hd3EZd+CSyI3fakPMQYPljEh/7ZWYlzS3RDuxxa6YUEtvhviqB4YacfDAIK7D1tFwS8/IRy3RjWu+u3DNsdlShj7cpMPugJg6WD+/9VNFj7+JpmBn29f5+5cdFMwV/DM2sKF0oJ6mKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720183478; c=relaxed/simple;
	bh=2VnZjseBtDW5O0hq1vK9Aj6FUxApMUCPPIzZyJbs9+0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IEtkv39dtxaRZxFBSsC0S/Y/0KJWb6wTLB0Xa0e/mjlkOpej1SNZ1YjrX0z3ypjLeT3261c8QYP8Rnnwcorf10Lmr52x9uXMSSBwV8WBqthEcRZPCLMorknTHHDy/axjVxLlgxUOBDk2pg6Q2F5daP8M75SZH+ZPeJjMoq8oSoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CWx6Qxyk; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57cbc2a2496so2002306a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 05:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1720183475; x=1720788275; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKZB2Fgn4uFU68w4TD9tZKFRvd41j+1ZrAavfWI0H/M=;
        b=CWx6Qxyk+Am94MeP3yeyvze3aj5KCLQhfz7iZ8fx0T9m01ouujxyP1juBvJe3LEmVm
         0cxvKh9a2KrvQB0S5K0Z850NOWYb+93iHCN+UV8nkuU7jo1yVisWDoZLUe6EBH09Kg89
         ZEizm8BoQMbzI6wOied3di/9s7STbqZOKFeh8BXJyQRGzAyXXkaD7vkMo3LQ0scbvRf8
         OntNaiN/XOBgKl5+5uwk0SX77/Gu7EtyiQmfTR2TLQKrjFpPbCmEBKIh7WlHB9tcLNAz
         v29nQX6kyCDKNrIwnk9FvULS2wC6OQsafy0psiYh/iddZXGn8Y/XSyRz/8KSWZ7ZoWlz
         hpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720183475; x=1720788275;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hKZB2Fgn4uFU68w4TD9tZKFRvd41j+1ZrAavfWI0H/M=;
        b=k+XxMyGCiTpcCVhsRk/P2zU2myvgfs3tCRLPnHu5UbnvgEeWAEJDmGxYgmLYp4lONX
         aYLloFQRqKrqRW/U2iFQ/kNSd3/V6FfFl7Cz1HZ/G2+BNLNzYs6VZuUA503QZaPHUu/o
         ixXTIbcIIXauh2zDOGZMT9ycRT/cWpg5+LF78Nyjgcq9hIcrjqdqbCMI/2XBuGjNmbXG
         FV1mQSDcsXqZeu3zhiQnaLHhLes2bPLOQ7TNUHtJWv6ypvs6fCDKVlGmUU8oqHou/YLG
         33Gq5AyIdgw2S0r/MXxdjLVxVH7BxCVEFp/2+g+HvN5+eYwyHdE8cFp04RRtFOHni12+
         XOag==
X-Forwarded-Encrypted: i=1; AJvYcCXK9YzPM5M8ybmrRTjVL6yhZBAXI66e06/RFp04e0f9FSc3/h8XBeU4BTvz7RBC6Pok4C+0AiirRgomfd3rBGrlRQvuNgUzL7ZVEYsnlw==
X-Gm-Message-State: AOJu0YwwMYjExjGc3jvBP5RaGIq7VOdCT87Ajan1h/U69ciFOTxBWhu4
	rcfZPIaIzJHGSMaaxJ4n9s5xKi3ciH6G8jCnYC3URx2EpzsvaYvak9QUHOtCtw0=
X-Google-Smtp-Source: AGHT+IH+9WK0Botsjtq1BFzZXkU/n60QSw0IfXpvtq4tv7jxq5yAzdzaUCgwA9ITyxlvi6sLnyzRsA==
X-Received: by 2002:a05:6402:358e:b0:58b:2d93:ad83 with SMTP id 4fb4d7f45d1cf-58e5b4a138bmr4156561a12.21.1720183475349;
        Fri, 05 Jul 2024 05:44:35 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58fefca76d0sm541054a12.2.2024.07.05.05.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 05:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jul 2024 14:44:34 +0200
Message-Id: <D2HM5EVCMBIU.1WTR6DUJH3GB6@fairphone.com>
Cc: "Andy Gross" <agross@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bhupesh Sharma" <bhupesh.linux@gmail.com>, "David
 Heidelberg" <david@ixit.cz>, "Stephan Gerhold" <stephan@gerhold.net>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm8350: Reenable crypto &
 cryptobam
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240108-sm8350-qce-v1-1-b7d586ff38af@fairphone.com>
 <a5923bf7-0a05-43bd-b282-b45e5653ac4d@linaro.org>
 <CY9E4ZCHOMWU.C18NR0H7V1QX@fairphone.com>
 <CAA8EJppCAMXds5F4bgeb9VJSwph-+4ekVsJ=rGib5=RR5m0DPg@mail.gmail.com>
 <CZ6FR855VPP7.3GHX4EO9WEZIH@fairphone.com>
 <8eb45771-096a-443f-b017-3ec8bc4940ba@linaro.org>
In-Reply-To: <8eb45771-096a-443f-b017-3ec8bc4940ba@linaro.org>

On Wed Mar 27, 2024 at 10:34 PM CET, Konrad Dybcio wrote:
> On 16.02.2024 11:36 AM, Luca Weiss wrote:
> > On Mon Jan 8, 2024 at 11:45 PM CET, Dmitry Baryshkov wrote:
> >> On Mon, 8 Jan 2024 at 16:23, Luca Weiss <luca.weiss@fairphone.com> wro=
te:
> >>>
> >>> On Mon Jan 8, 2024 at 3:18 PM CET, Konrad Dybcio wrote:
> >>>> On 8.01.2024 14:49, Luca Weiss wrote:
> >>>>> When num-channels and qcom,num-ees is not provided in devicetree, t=
he
> >>>>> driver will try to read these values from the registers during prob=
e but
> >>>>> this fails if the interconnect is not on and then crashes the syste=
m.
> >>>>>
> >>>>> So we can provide these properties in devicetree (queried after pat=
ching
> >>>>> BAM driver to enable the necessary interconnect) so we can probe
> >>>>> cryptobam without reading registers and then also use the QCE as
> >>>>> expected.
> >>>>
> >>>> This really feels a bit backwards.. Enable the resource to query the
> >>>> hardware for numbers, so that said resource can be enabled, but
> >>>> slightly later :/
> >>>
> >>> If you think adding interconnect support to driver and dtsi is better=
,
> >>> let me know.
> >>
> >> I'd say, adding the proper interconnect is a better option. Otherwise
> >> we just depend on the QCE itself to set up the vote for us.
> >=20
> > Yes, currently we depend on that.
> >=20
> >>
> >>>
> >>> Stephan (+CC) mentioned it should be okay like this *shrug*
> >>>
> >>> For the record, this is the same way I got the values for sc7280[0] a=
nd
> >>> sm6350[1].
> >>>
> >>> [0] https://lore.kernel.org/linux-arm-msm/20231229-sc7280-cryptobam-f=
ixup-v1-1-bd8f68589b80@fairphone.com/
> >>> [1] https://lore.kernel.org/linux-arm-msm/20240105-sm6350-qce-v1-0-41=
6e5c7319ac@fairphone.com/
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/d=
ts/qcom/sm8350.dtsi
> >>> index b46236235b7f..cd4dd9852d9e 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> >>> @@ -1756,8 +1756,8 @@ cryptobam: dma-controller@1dc4000 {
> >>>                         qcom,controlled-remotely;
> >>>                         iommus =3D <&apps_smmu 0x594 0x0011>,
> >>>                                  <&apps_smmu 0x596 0x0011>;
> >>> -                       /* FIXME: Probing BAM DMA causes some abort a=
nd system hang */
> >>> -                       status =3D "fail";
> >>> +                       interconnects =3D <&aggre2_noc MASTER_CRYPTO =
0 &mc_virt SLAVE_EBI1 0>;
> >>> +                       interconnect-names =3D "memory";
> >>>                 };
> >>>
> >>>                 crypto: crypto@1dfa000 {
> >>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> >>> index 5e7d332731e0..9de28f615639 100644
> >>> --- a/drivers/dma/qcom/bam_dma.c
> >>> +++ b/drivers/dma/qcom/bam_dma.c
> >>> @@ -40,6 +40,7 @@
> >>>  #include <linux/circ_buf.h>
> >>>  #include <linux/clk.h>
> >>>  #include <linux/dmaengine.h>
> >>> +#include <linux/interconnect.h>
> >>>  #include <linux/pm_runtime.h>
> >>>
> >>>  #include "../dmaengine.h"
> >>> @@ -394,6 +395,7 @@ struct bam_device {
> >>>         const struct reg_offset_data *layout;
> >>>
> >>>         struct clk *bamclk;
> >>> +       struct icc_path *mem_path;
> >>>         int irq;
> >>>
> >>>         /* dma start transaction tasklet */
> >>> @@ -1206,6 +1208,7 @@ static int bam_init(struct bam_device *bdev)
> >>>                 bdev->num_channels =3D val & BAM_NUM_PIPES_MASK;
> >>>         }
> >>>
> >>> +       printk(KERN_ERR "%s:%d DBG num_ees=3D%u num_channels=3D%u\n",=
 __func__, __LINE__, bdev->num_ees, bdev->num_channels);
> >>>         /* Reset BAM now if fully controlled locally */
> >>>         if (!bdev->controlled_remotely && !bdev->powered_remotely)
> >>>                 bam_reset(bdev);
> >>> @@ -1298,6 +1301,14 @@ static int bam_dma_probe(struct platform_devic=
e *pdev)
> >>>                 return ret;
> >>>         }
> >>>
> >>> +       bdev->mem_path =3D devm_of_icc_get(bdev->dev, "memory");
> >>> +       if (IS_ERR(bdev->mem_path))
> >>> +               return PTR_ERR(bdev->mem_path);
> >>> +
> >>> +       ret =3D icc_set_bw(bdev->mem_path, 1, 1);
> >>
> >> Probably this needs some more sensible value.
> >=20
> > So downstream qcedev driver uses 384 for the interconnect. But this is
> > crypto-specific and probably different BAMs have different minimum
> > requirements?
> >=20
> > #define CRYPTO_AVG_BW			384
> > #define CRYPTO_PEAK_BW			384
> > https://github.com/xiaomi-sm8450-kernel/android_kernel_platform_msm-ker=
nel/blob/lineage-20/drivers/crypto/msm/qce.h#L57
> >=20
> > Do you have any suggestion what to use here?
>
> I'dve expected this to mean anything, but apparently not.
>
> My immediate guess is that the 384 was the lowest magic value that didn't
> result in the bus getting kicked offline.. 1 should be fine upstream due
> to commit 91e045b93db7 ("interconnect: qcom: Fix small BW votes being
> truncated to zero").
>
> >=20
> > Also I'd assume that with pm_runtime suspended we'd need to clear the
> > votes in the driver so we don't keep the interconnect alive
> > unnecessarily?
>
> My naive understanding is that the power should only be necessary when
> the thing is in use, so early probe and pm-active sounds about sane..

Bit of a late update on this, going through my inbox again:

I don't think I'll work on implementing interconnect for the BAM driver,
I neither really have the motivation to work on it, nor really any
knowledge on crypto or BAM, or about some details of the hardware.

So feel free to pick this patch to unbreak crypto on sm8350 (adding
num-channels & qcom,num-ees is what's done on many other SoCs as well,
sm8350 wouldn't be an outlier), or we wait for someone to pick up
implementing icc for BAM.

I'll remove this from my inbox now :)

Regards
Luca

>
> Konrad


