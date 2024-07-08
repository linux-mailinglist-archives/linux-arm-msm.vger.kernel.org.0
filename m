Return-Path: <linux-arm-msm+bounces-25493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322192A32E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 14:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53F281C20AA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 12:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0385781728;
	Mon,  8 Jul 2024 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZF0ww9qy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A707E0EA
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720442977; cv=none; b=bAkEm1MITBmd13cECisR1KRVWREuKgU7fQQfMTgyN24eo2eoIg8F+JbaOZSkbV6/003eRFSnYZU16QRlC9yD3TymdfQsPVXVNfBOibg0EF5I86ZLzqytulmFVbKo/Uc0nPj0Ynt5F8UN13h6wyKz7RyD709q5f5RTnq3w6I0fbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720442977; c=relaxed/simple;
	bh=p/+Q3KCGTxyiImtQLqTBIrwv3NgvjSi5vKpjHp3sj0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bE66pbdEeQuy82xMXmR6PPxlQtfatTQsDvtM5ndEf/+u3ax0L4cgA82/6cuBzYmQW3MQBMKDRteybytheO70UHAO9s6CyEEf0b1tNipJIgCajoIyjAkFOxeJl6O0m0dbUXbalbqu4ypUm6PFk6GFPDxabGnIrv+TPNhIBWeQPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZF0ww9qy; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7201cb6cae1so1796536a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720442976; x=1721047776; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gwJfqVEIoVdfoTsztHNlaZf6K08VAN240cdWOXUU17s=;
        b=ZF0ww9qyW4Pn2RMYTsGV5UJ+jV81+LiiWy0Nz2QLt42oanXtRX0zcmNiq8dsHkd2iY
         kS0/8gQTNPFbk16OS2FFAs8nls8qzq6DDECBLPUaMmxNBcNSeaCNmZo5nkFpRyqdvLTT
         BDRSgrQoJ2wIAN4UGfFmDffZP2IljLOgb7SMLhqC0JPndd8sZ79ehwZCI6GA/H69dQGW
         WhfMiQWeyIaVhMwVjDN64hepiFqFx01Xa/DA2I6mVIgyiqZREZ+9MuFdb+ucM+wAZYmX
         AFZ6cfacZJFbILi+4Qnw+6qKFmmut4aM3ERWdP5UuNZiXrgpAUF5jJ4b7QiWRKJbRGEm
         AX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720442976; x=1721047776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwJfqVEIoVdfoTsztHNlaZf6K08VAN240cdWOXUU17s=;
        b=sdXUWqgjjTkTOCmbBWH5tI5bZ5CuTaotmpPAw6LyDNyUhNeunJaM/i5NiSLxXptHqj
         35R5yir8MFtZo0JD3+C1OzqTnxCihbsfnMP0Ok2U8chzoYYAa2ugagPP29LmiAoIVpRB
         Pe00wQgvLr/pWbyj0xImY9BESR1fEUeLgAmjtBkYFyQRyXdc1DM637dUzSolObHisoFx
         tEuMs6U4QmbVmLrv2BnG5DW46K+KY+e9nTlVkOt6UzqqvqCVu/jsJTTULtRDYeeDOXxk
         Nrq7cE31KEthdhsP6s1e46guWJefcLj1WGHOCiQJQtLGDHjhuu76an+yNqWT/pHGSES+
         KLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKs6K/xPKBnnWHGzqh5CNeNMJWXZ5G0v9Wg93ES2KwIQdhrT/1DujmO3tJldEUG87r+9c0u/5X0gxacfP4j+MscIm+TlVu+4rgLQF6SA==
X-Gm-Message-State: AOJu0YzTfltpdssvKGNdrBvRYObqGPpuzIQMkDhx8QHXveOEKeKPfvJh
	wzGSB7ZATN3qsxs2BhHEaKQzhln3TLuE+8dYY+woiBU9gywo3ffGHdchjaxYon3PCqKeX+4heSg
	2VBSFd+K4yCQcBIxRUi/c3JVKCdvqWrUAXkNRuw==
X-Google-Smtp-Source: AGHT+IFh+8rVNSdILFoJSTAPdcM4HawcWPM/1UUqpARio3DoOIhOeIUZ96MzfeyAZxWq+ws/d6HRKhGtmB30W5rYgpQ=
X-Received: by 2002:a17:90b:a4a:b0:2c9:6751:7539 with SMTP id
 98e67ed59e1d1-2c99c6ba8cemr6298715a91.44.1720442975629; Mon, 08 Jul 2024
 05:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
 <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm> <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
In-Reply-To: <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Jul 2024 15:49:23 +0300
Message-ID: <CAA8EJpqz1SiUdTMpx5hmnax_rBqtpVAtOZsaL8UfHnZ5vZZFHQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jul 2024 at 14:07, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 05/07/2024 16:34, Dmitry Baryshkov wrote:
>
> > On Thu, Jul 04, 2024 at 06:45:36PM GMT, Marc Gonzalez wrote:
> >
> >> From: Arnaud Vrac <avrac@freebox.fr>
> >>
> >> Ported from the downstream driver.
> >
> > Please write some sensible commit message.
>
> Here's an attempt at expanding the commit message:
>
> """
> This code adds support for the HDMI PHY block in the MSM8998.
> It is a copy & paste of the vendor driver downstream:
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/clk/msm/mdss/mdss-hdmi-pll-8998.c
> """

Add support for the HDMI PHY as present on the Qualcomm MSM8998
platform. The code is mostly c&p of the vendor code from msm-4.4,
kernel.lnx.4.4.r38-rel.

>
>
> >>  drivers/gpu/drm/msm/Makefile                   |   1 +
> >>  drivers/gpu/drm/msm/hdmi/hdmi.c                |   1 +
> >>  drivers/gpu/drm/msm/hdmi/hdmi.h                |   8 +
> >>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c            |   5 +
> >>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c       | 789 +++++++++++++++++++++++++
> >>  drivers/gpu/drm/msm/registers/display/hdmi.xml |  89 +++
> >>  6 files changed, 893 insertions(+)
> >
> > - Missing changelog
>
> - Rebase onto v6.10
> - Move drivers/gpu/drm/msm/hdmi/hdmi.xml.h to drivers/gpu/drm/msm/registers/display/hdmi.xml
> - Add copyright attribution
> - Remove all dead/debug/temporary code
>
> > - Missing a pointer to bindings. Ideally bindings should come together with the driver.
>
> "qcom,hdmi-phy-8998" is defined in "HDMI TX support in msm8998" series (Acked by Rob Herring & Vinod Koul)

This (and the link to lore) ideally should be a part of the cover
letter or the comment below '---' in the patch.

>
> > I'm not going to check the math, but it looks pretty close to what we
> > have for msm8996.
>
> What is the consequence of this?

That I won't check the math :-D

>
>
> >> +static const char * const hdmi_phy_8998_reg_names[] = {
> >> +    "vdda-pll",
> >> +    "vdda-phy",
> >
> > Unless you have a strong reason to, please use vcca and vddio here, so
> > that we don't have unnecessary conditionals in schema.
>
> The vendor code uses vddio & vcca for msm8996;
> vdda-pll & vdda-phy for msm8998.
>
> Which is vcca? Which is vddio?

vddio = vdda-phy (1.8V)
vcca = vdda-pll (lower voltage)

> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8996-mdss-pll.dtsi
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-mdss-pll.dtsi#L121-172

-- 
With best wishes
Dmitry

