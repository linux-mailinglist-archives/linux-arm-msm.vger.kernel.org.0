Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A253104BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 06:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhBEFsF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 00:48:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhBEFsF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 00:48:05 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9944C061786
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 21:47:24 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id t25so5851010otc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 21:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rrj20D7a53wrOzeKZZKSNUikqq6xnexSDHxUpV51KT8=;
        b=Fbnuh06jpfffd5wEvn2YSS9D7wKguxWNAPENLLEFQuEqaSV6riOlAX7706JEf8OUEb
         cwoaZKTro/agmwYmyqrn0Of8tMSwmFXQDTfgIumk/Tl7wU7d/rLAopYnUSiAK2TTSxM5
         59wzuQVblMQwlzeEWbc3DS6Lo6Y9kIcto1iafxlsZTKS5sDwNCvOMpVDfusoSE7e1tW/
         cQsxfpXbRxEFExNTiaOIVlyKP/Nh06JUwD+FrVVOWkn2fklWD8SwwNfcj+qkE5LjjDXM
         +wdD/i1kEhaF9rTTHjda9RK3pl4Qw/yM8EcYt8ewJ/FTp+vBsgL8MhHm2bJaZPkFjV9Q
         O4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rrj20D7a53wrOzeKZZKSNUikqq6xnexSDHxUpV51KT8=;
        b=B+eYCVG3rxISqtaM2tgos8qoiUlNs9b3GorBVw6mPbMEK+0zkdqxygShNzr0z6tIuw
         tCXoHEx2RcEsvqbIzYj8NenlndBOL1HjD57udYZAek+jyZLwwI8boWtzAWdQTMTz0QxV
         UnDzALgDnBt6+q9kuTiygMGnKcqbjmHXhd7cj1K3faaA40SRfOM5MJ2SoD5szkCx3EyJ
         n2VPPoehDyFZ8/aPFn0l0Bg2MvhQyMvDg/il62QdJsVso/BDnCrkkxzKSkv7TOhF888y
         j1iRrtf0JP+Jmd5GF7lTn0U31gS97reUlsdk1tl4Sjk74bBBq8AbsT44pHH5mP/kWZKM
         OHQw==
X-Gm-Message-State: AOAM531J6f/FiQ2UD96VxzSu2hUwJCwrnCPLGAcEpi8wDIcRZOJ8rHtn
        +dA7z+yOdV753ayrItNWopK7zg==
X-Google-Smtp-Source: ABdhPJz9xij+gLz0CwnaxC20p0yxQoBcNW7MsLZMGld4VXUPQto8ViHwTWsQ5HTeh0hLeBB7iIylDw==
X-Received: by 2002:a9d:b85:: with SMTP id 5mr2307683oth.281.1612504043704;
        Thu, 04 Feb 2021 21:47:23 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o25sm1612254oie.57.2021.02.04.21.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 21:47:23 -0800 (PST)
Date:   Thu, 4 Feb 2021 23:47:21 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: pm8994: Add resin node to PON
Message-ID: <YBzb6eDm34Be9Q4A@builder.lan>
References: <8WhEzfSgoSe_f8OT9eH_6hLGTqY9k_Cy9ZLr84OJsFctROAlbUEz552XibQxt684Um8E5NS1_0qxIn3tRVSs0ui1mVUKhBFmUjJ_dannvrQ=@protonmail.com>
 <YBnYi2eMl0xtMcfq@builder.lan>
 <qlZLjlncIG-fOtti8ZUSOF9ct71-oaDKMJQmDUYXvUoCJMkstc1Gjyuigwo6uK5Q4E2ZKCv70No663d-_qqD0HOnNYEKuWjOByYbG_g4jqE=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qlZLjlncIG-fOtti8ZUSOF9ct71-oaDKMJQmDUYXvUoCJMkstc1Gjyuigwo6uK5Q4E2ZKCv70No663d-_qqD0HOnNYEKuWjOByYbG_g4jqE=@protonmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 04 Feb 22:51 CST 2021, Yassine Oudjana wrote:

> On Wednesday, February 3, 2021 2:56 AM, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> 
> > On Tue 29 Dec 06:47 CST 2020, Yassine Oudjana wrote:
> >
> > > From: Yassine Oudjana y.oudjana@protonmail.com
> > > Date: Sun, 27 Dec 2020 21:23:40 +0400
> > > Add resin as a child node of PON.
> > >
> > > Signed-off-by: Yassine Oudjana y.oudjana@protonmail.com
> > >
> > > --------------------------------------------------------
> > >
> > > arch/arm64/boot/dts/qcom/pm8994.dtsi | 8 ++++++++
> > > 1 file changed, 8 insertions(+)
> > > diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
> > > index 5ffdf37d8e31..334774a38602 100644
> > > --- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
> > > @@ -58,6 +58,14 @@ pwrkey {
> > > linux,code = <KEY_POWER>;
> > > };
> > >
> > > -       	resin {
> > >
> > >
> > > -       		compatible = "qcom,pm8941-resin";
> > >
> > >
> > > -       		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> > >
> > >
> > > -       		debounce = <15625>;
> > >
> > >
> > > -       		bias-pull-up;
> > >
> > >
> > > -       		linux,code = <KEY_VOLUMEDOWN>;
> > >
> > >
> >
> > Is resin always volume down?
> 
> I'm not sure, but I haven't found a device that uses it and sets it as anything else.
> 
> > Also this node is already defined in apq8096-db820c.dtsi, so how about
> > moving the common properties here, but leave it status = "disabled" and
> > then in the device specific file make it status = okay?
> 
> Sounds good. So have everything other than linux,code defined there, then
> add status = "disabled" and a label to it?
> 

Sounds good to me.

Thanks,
Bjorn

> > Regards,
> > Bjorn
> >
> > > -       	};
> > >
> > >
> > > -       };
> > >
> > >         pm8994_temp: temp-alarm@2400 {
> > >
> > >
> > >
> > > --
> > > 2.29.2
