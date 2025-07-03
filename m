Return-Path: <linux-arm-msm+bounces-63541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1DEAF7779
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 16:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7776A544640
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0551429B789;
	Thu,  3 Jul 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFx1j7yj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04572EBB95
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552920; cv=none; b=oY/raey5ijIWcN0M7t8nytcsP267AHfJAUosUckQxBiSUvdL3Zo7rcpuEgXZbruMtYGAiuJ8q5szEy2Wpa6Iu52fFqgst1jlrLV6xIJApakzpYSLMXmAW1kUEbK3FCxXaSx9kLpNedQ7Qg6AnyFfjbFi/xSEbWjIx0DC3A5Fw58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552920; c=relaxed/simple;
	bh=+9JP73xuImAECbCH/I7OUvnPo7FfdAXNWIVD4e6oZqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5Eb1TWnZKiIXfLhT9XSNGottn+VKXO+nxyGe7VxALJ2p4GipjC+9PkK2CNco/umMg6fw3XmHgTtVZ9WCuE2zpzyvRPGpALJEuvyzehWhTKrMyhfAaZr+4VeNvgHJOaBiVR8an65Wq4Fs0040N2AbNsztNkw6Co3w5MrvM0ndPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFx1j7yj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563ALPUV025164
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 14:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aPQxTypkDSifWXr1kKb5YoV+sU4Et63WdriVs3pvSJk=; b=UFx1j7yjt7VtX1vf
	rZk4F/lhAvk2Zig6Ux2YGfDZtX/T549PlaPUYr3+cf9lVZMjt/Nq+gLTd50Tv4Sk
	TchvAD3U+ijhGb4RN2SCTVyibdVO9NVpbzdUmNUTHmNrYYE5q6XcIbtYSlo1BPSs
	AVrXwHN8J6c0ovDa/5CqpuNdq9gdaR4lQl5MUicrH9w6//D6bex9F2n9WV2gXe1i
	cAU4Ig6dd7Ku+IuHJUVGoOJIMs6ZyqTD3qejP8GFEeI68iir7GCMgRhlzfxVkgDy
	jziOm4hb/lEy57t2IkD/0Z9Zcs2d3YKHu/7WJI710zHS4AUgqKnGBRS0k/wkadMV
	DklyIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64wv3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 14:28:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ff81086f57so63286886d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 07:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751552914; x=1752157714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPQxTypkDSifWXr1kKb5YoV+sU4Et63WdriVs3pvSJk=;
        b=wQxPx42sa8W0+XtrLel8ckft0pjNV8Z1AYPFaBT1p9/DtTED2KaCWzvYahkLFsuj1D
         J4Di1g5I31+I6FT4dUnkSxaiXAPkC3/DWHe43tJLuRv8WWSDX+LWW+ZRm7AHIKkmBZPg
         jEhN6hYkVEo48gQ5z/G8jXlGaSVqeIYwg6onigqNdPGnzHjOLOaKtp1nGiHKQ3/NF2DQ
         VJSNahz+X7iDoWF2URD6czF0weq4EEq1uQF/EYITBZ5yTmvi8uoXx8GS+EMZ0+lkA7nB
         55w0EG8T/adpBiB6k72elIX4Zj7QhDTaQsn5vsvZZ1T3QfVTSdzGDJ8rq/F244NPgDyb
         UFWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDFhkWMODRkQF11M6PJm91UCvwYfG0Ts10MIWRfy6ZFXz959pWj5nj3RHZQOmh9SKlbMnKY2eUGFNWk9YX@vger.kernel.org
X-Gm-Message-State: AOJu0YxZEuPZBvdhMqsErF78M1OMP+Q1BDRsk3sfeKx1Pyz5v9inq7a/
	mw72GH1ao7FyKNDdp+OkW7FofT458V5goU/2Bl6Pl2R06H+d9JWmpugArlL/UmQEXTI3zMMklVb
	ePIBXOJGitc7VGmAlk/Xe1/nuyU2W1QhgcreDeYFMPMnYQiQGfPTTFefc5xB3FYmpBxwd+tRkpZ
	h2oqz68K9tFJvObccb98CXNzZWrztiUIoMSMbS1L7yD7U=
X-Gm-Gg: ASbGncsGSXnV67dNdwaMBGb2+XxAkdu8jNmx+oH1fZBurEN3cOrbXYGUjfsp/oeLtPd
	du+RPdHO4aU9Vq2yGfOa4nlV1LMNFDOzXyFYtn4AJT4rSg8Ru58LTPWqbHjSKnNv90lU5lwV8t6
	+WzPId1Q==
X-Received: by 2002:ac8:5a13:0:b0:48a:e2ec:a3b4 with SMTP id d75a77b69052e-4a97690de8fmr114049991cf.17.1751552914176;
        Thu, 03 Jul 2025 07:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhT0FsD7uVl5phvxFI/cNiRm8hqsPWi3kG29UqR5qXmGXlI/kuvyqMq4P1GkE5QfKubdQnQD4c3Jw0sIygX1w=
X-Received: by 2002:ac8:5a13:0:b0:48a:e2ec:a3b4 with SMTP id
 d75a77b69052e-4a97690de8fmr114049331cf.17.1751552913522; Thu, 03 Jul 2025
 07:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629085036.765397-1-loic.poulain@oss.qualcomm.com> <yafvivvzvcuyopyisxbkb4cqa3cmv4uzn7df34pwk4kqg2r55n@wx6spgecaw6d>
In-Reply-To: <yafvivvzvcuyopyisxbkb4cqa3cmv4uzn7df34pwk4kqg2r55n@wx6spgecaw6d>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 16:28:21 +0200
X-Gm-Features: Ac12FXzaTzx9YfkCK84DA6YQHyPZZJRo6PMlwTGV2tIPqFEY4q9HMpAmvGKrPXw
Message-ID: <CAFEp6-2Z2CLD8AW475AH7FkBrtysXpfnAtWryHWRN+Noh2DZGg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68669393 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=ae2ZjgFDbcS0OE6Il88A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyMiBTYWx0ZWRfX3B835UYLWEnI
 c1xy/0z3welwckE+siRBdS9JX0ZVtbnzYMZrpRATXmGah1pWZwcQtBPVixENIgXqIZxGW87rfAl
 ihfMEVMAsQ/ahbZ4qLGwgRxXB9mJsXp15AVEROuHIgLTH+LyyPcFfObV/GPDRMWaZYfLK6++pBe
 uXo9a0vpE4N+ZtZFpavCyLRr7sDIVKOUxq0I0Ko9vB0Uu12aYC8NtJ8wuqF36A1GZDovFpQjyiB
 b7tK/E7KxkI7ynHVHJwpaoVKxHhBsO8zDB05qEOJpbT3pGfWuOAPupCRJxeD9dKDZTIYwhVbGoH
 BjpcJp7wV+vdHMXI+4e5j7irzxVMjh6xVKZ+U7o+KdUmab56SgbZ/wZtAbtyNKT5zn1i0B5p3J4
 YN9U/1d7DOTNCZPawZzg+q/nJQbVn3FgEU9+fosBT+c9RzcoZoBWEQv1yyVHVZ0ZJ8imIt0Z
X-Proofpoint-GUID: yXUJ7dU6tdJfQF-zVAYQpcVa8qFUtmXY
X-Proofpoint-ORIG-GUID: yXUJ7dU6tdJfQF-zVAYQpcVa8qFUtmXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030122

Hi Dmitry,

On Sun, Jun 29, 2025 at 4:57=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jun 29, 2025 at 10:50:36AM +0200, Loic Poulain wrote:
> > To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
> > be active for MMIO operations. Typically, this AHB clock is enabled as
> > part of the DSI PHY interface enabling (dsi_phy_enable_resource).
> >
> > However, since these PLL clocks are registered as clock entities, they
> > can be enabled independently of the DSI PHY interface, leading to
> > enabling failures and subsequent warnings:
> >
> > ```
> > msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL=
 lock failed
> > ------------[ cut here ]------------
> > dsi0pllbyte already disabled
> > WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/=
0xac
> > CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
> > Tainted: [W]=3DWARN
> > Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
> > pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > [...]
> > ```
> >
> > This issue is particularly prevalent at boot time during the disabling =
of
> > unused clocks (clk_disable_unused()) which includes enabling the parent
> > clock(s) when CLK_OPS_PARENT_ENABLE flag is set (this is the case for t=
he
> > 14nm DSI PHY PLL consumers).
> >
> > To resolve this issue, we move the AHB clock as a PM dependency of the =
DSI
> > PHY device (via pm_clk). Since the DSI PHY device is the parent of the =
PLL
> > clocks, this resolves the PLL/AHB dependency. Now the AHB clock is enab=
led
> > prior the PLL clk_prepare callback, as part of the runtime-resume chain=
.
> >
> > We also eliminate dsi_phy_[enable|disable]_resource functions, which ar=
e
> > superseded by runtime PM.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  v2: Move AHB clock into a proper PM dep instead of manually toggling i=
t
> >      from the PLL clock driver.
> >
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 65 +++++++++++----------------
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
> >  2 files changed, 25 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/ms=
m/dsi/phy/dsi_phy.c
> > index 5973d7325699..015cb579c669 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -5,6 +5,8 @@
> >
> >  #include <linux/clk-provider.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_clock.h>
> > +#include <linux/pm_runtime.h>
> >  #include <dt-bindings/phy/phy.h>
> >
> >  #include "dsi_phy.h"
> > @@ -511,30 +513,6 @@ int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dph=
y_timing *timing,
> >       return 0;
> >  }
> >
> > -static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
> > -{
> > -     struct device *dev =3D &phy->pdev->dev;
> > -     int ret;
> > -
> > -     ret =3D pm_runtime_resume_and_get(dev);
> > -     if (ret)
> > -             return ret;
> > -
> > -     ret =3D clk_prepare_enable(phy->ahb_clk);
> > -     if (ret) {
> > -             DRM_DEV_ERROR(dev, "%s: can't enable ahb clk, %d\n", __fu=
nc__, ret);
> > -             pm_runtime_put_sync(dev);
> > -     }
> > -
> > -     return ret;
> > -}
> > -
> > -static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
> > -{
> > -     clk_disable_unprepare(phy->ahb_clk);
> > -     pm_runtime_put(&phy->pdev->dev);
> > -}
> > -
> >  static const struct of_device_id dsi_phy_dt_match[] =3D {
> >  #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
> >       { .compatible =3D "qcom,dsi-phy-28nm-hpm",
> > @@ -696,24 +674,30 @@ static int dsi_phy_driver_probe(struct platform_d=
evice *pdev)
> >       if (ret)
> >               return ret;
> >
> > -     phy->ahb_clk =3D msm_clk_get(pdev, "iface");
> > -     if (IS_ERR(phy->ahb_clk))
> > -             return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
> > -                                  "Unable to get ahb clk\n");
> > +     platform_set_drvdata(pdev, phy);
> >
> > -     ret =3D devm_pm_runtime_enable(&pdev->dev);
> > +     ret =3D devm_pm_runtime_enable(dev);
> >       if (ret)
> >               return ret;
> >
> > -     /* PLL init will call into clk_register which requires
> > -      * register access, so we need to enable power and ahb clock.
> > -      */
> > -     ret =3D dsi_phy_enable_resource(phy);
> > +     ret =3D devm_pm_clk_create(dev);
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D pm_clk_add(dev, "iface");
>
> This will break booting the kernel with some old DTS (before 6.0), where
> we had iface_clk as a DSI PHY clock. Please document it in the commit
> message.

Do we want to preserve backward compatibility and introduce some sort
of msm_pm_clk_add to handle both?

>
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "Unable to get iface clk\n=
");
> > +
> >       if (phy->cfg->ops.pll_init) {
> > +             /* PLL init will call into clk_register which requires
> > +              * register access, so we need to enable power and ahb cl=
ock.
> > +              */
>
> I think with pm_clk this is no longer reuquired. Could you please verify
> it and drop extra pm_runtime calls from probe?

Will try.

>
> > +             ret =3D pm_runtime_resume_and_get(dev);
> > +             if (ret)
> > +                     return ret;
> > +
> >               ret =3D phy->cfg->ops.pll_init(phy);
> > +             pm_runtime_put(&pdev->dev);
> >               if (ret)
> >                       return dev_err_probe(dev, ret,
> >                                            "PLL init failed; need separ=
ate clk driver\n");
> > @@ -725,18 +709,19 @@ static int dsi_phy_driver_probe(struct platform_d=
evice *pdev)
> >               return dev_err_probe(dev, ret,
> >                                    "Failed to register clk provider\n")=
;
> >
> > -     dsi_phy_disable_resource(phy);
> > -
> > -     platform_set_drvdata(pdev, phy);
> > -
> >       return 0;
> >  }
> >
> > +static const struct dev_pm_ops dsi_phy_pm_ops =3D {
> > +     SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> > +};
> > +
> >  static struct platform_driver dsi_phy_platform_driver =3D {
> >       .probe      =3D dsi_phy_driver_probe,
> >       .driver     =3D {
> >               .name   =3D "msm_dsi_phy",
> >               .of_match_table =3D dsi_phy_dt_match,
> > +             .pm =3D &dsi_phy_pm_ops,
> >       },
> >  };
> >
> > @@ -762,7 +747,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
> >
> >       dev =3D &phy->pdev->dev;
> >
> > -     ret =3D dsi_phy_enable_resource(phy);
> > +     ret =3D pm_runtime_resume_and_get(dev);
> >       if (ret) {
> >               DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",
>
> It would be nice to make error prints to follow the code changes.

Sure.

Regards,
Loic

