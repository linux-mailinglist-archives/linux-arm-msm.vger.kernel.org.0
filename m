Return-Path: <linux-arm-msm+bounces-38925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDAC9D6A24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66FC12818F8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CD828E0F;
	Sat, 23 Nov 2024 16:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="khstgrlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE023774
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 16:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732379535; cv=none; b=E91MHbU2lBzAAclSpwPJqUX5rCNsAqm0ZRpzyT1/Izon6tQclUwl1/LQhdNa1rurb7zQSgxUKqON9Ccw1WO1kkZtufgzAJQimWGmtHBcaR5EmRD7ult0SPV+EcPT8yFzLNn/Etn6iA0qlYy4e9Nxv+89WrY2KNmfI4ofqciTtEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732379535; c=relaxed/simple;
	bh=dIpO4kbW8cyJ+9JZaFOjMBIi6VHmtHYF7j+sMn9wMmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dtk5cXpDgmgUeA20akHPiEV+iYEzZ1ZIGfgXJUD3g7ZoPLFnSes1SMKGSqwzSO3BDP0aqzEVrdVVYaqRbxOk2i3VYLCqSKtXeQbU89aMS9o7mH9COYiknVLZ+2nsFGvogKbtNAOjM8jk8PeTIAy53m6vrNKV3zwRP4x9UKCrT8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=khstgrlT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53d9ff92edaso3622512e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 08:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732379531; x=1732984331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MxevDa9VlZfQk/6diKJ/RQ0XTFV8JaAse1FnOzuzGI=;
        b=khstgrlTdWjxJ9rZW/n6fyrhgyGDDHumwa9Tf17Pbf8tLGgx+SvyIjV1byesXOVh2+
         mc4waXQNz7CCtCZsG3R+VdBInpyksGSfCV8Mwn2kxA5/lmjyJzomWXoMX+3KxVzRmbG2
         MqO3JmaLfwwS8hKg5HKsvclC80CV5yagcvC9+zHTotFIWZW42/z+PiNhAELNb1jVZ70/
         yAnbIrmaRIPnKyvWDRCV9LOdUhjsYrqEY1tJKDSKjqV3rBTNL5gMKC8DULjXRbQkH8XJ
         EYbAVTrteMQpwaRfBfJSdvzXr/d2wZ1+H+l7uutn7I7zaFWlJN3CRewiovY0oTPtffne
         gyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732379531; x=1732984331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MxevDa9VlZfQk/6diKJ/RQ0XTFV8JaAse1FnOzuzGI=;
        b=P1pMLmxzrVBnXPP7rrKJVF7IFpy4Kdphgnsrts/VStSER3aeS5MOGucAK0tRRCYrj9
         6xbd/UE8huL7WtElR2x9HrlIW5xSvdD7MtXXJtywVjpaOMCCiPGx7s1+CBPR9+I+U4k9
         eTblRtbCP9HfrS2Ww9vfBD6k/lMqo3fQ/nvcQIRWRDm4UKZSKOErWn6jsPx1zh8RWq0P
         ieQb4tfEARrBOO6rPrRvdIvdokWzmB3YBEGjUst9/N68vBi8YFcUhdX03UfiS5QSUPkC
         33uJFdrMC2pz/h/j3aFtnJ8bi9WFo8lpmg6pHI0FL4iGLBg3s3WKcur4w+1+PdKkfJYX
         TdNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXuP14bJzXFjq8AADZa5J2fV8tVeBJMBLAnTDYCQWoKZXjRkEB9dnVALfTKsnnPIQ5lpIfoWzcbEY3szs4@vger.kernel.org
X-Gm-Message-State: AOJu0YwCa9J+ZTlRkYTiWoFuuAEBX1DOZscK9ujPexXm1EtRxcnbFS5p
	+98k95q0UdJYg6V7zlwJEizmS6AwgjyovVXID+3WROsznHdzHYSIOFRIZzy2bbI=
X-Gm-Gg: ASbGnctfwZYxmy4yaTo2M//TvfnVjk7wHOrKfQRl6wPzCpIsatwoNAWpdQrran+Y8A5
	uTCJT5An2CEeex9FPT6pXo5a29kkISYTeNc5VToxRcGd2p5O1Zgw7C8jBTcnyiXMeDgkzopKCp7
	YMFFzOqx2L4tKlLmFDi/W0t9Tsnyi2nIX403BpQJPBNSySmJNnz8eh2IHp0V2JZhwcpMyc0IWjF
	0lXdeNiG03gEP72m6J0NBB7a9J6zCIpa8xOA/dFioXNqT/g/aAzl9Uv8HgkYJX8J2lf908KNFJ4
	i5l0iw9WiTNWHnw85/uHC9MwTOaOtg==
X-Google-Smtp-Source: AGHT+IE/kpuKX9Z55uF4fzpcyiUmNjnR2bVsf+7KIIGnKThLK7KcQSqBM0gFxYOZnj/rPZs2stSn0Q==
X-Received: by 2002:a05:6512:3b97:b0:53d:c37d:3378 with SMTP id 2adb3069b0e04-53dd35a5531mr3263454e87.5.1732379531348;
        Sat, 23 Nov 2024 08:32:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2450a7dsm970118e87.59.2024.11.23.08.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 08:32:09 -0800 (PST)
Date: Sat, 23 Nov 2024 18:32:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Song Xue <quic_songxue@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Manu Gautam <mgautam@codeaurora.org>, 
	Vivek Gautam <vivek.gautam@codeaurora.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom-qusb2: Add regulator_set_load to Qualcomm
 usb phy
Message-ID: <3zvstdxhgobn64ttcggmk44ejsroxmwe7y25rraebh3p4evsy6@3g64a5tuvt7w>
References: <20241121-add_set_load_to_qusb_phy-v2-1-1c5da1befec0@quicinc.com>
 <7qj4szkw365ve45hm5w475xs2vlfsfg5pcpc44bo3s5vhrcmuu@bh5swbug4ywi>
 <b8cd1434-8096-4d52-8499-9d25cf3805b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8cd1434-8096-4d52-8499-9d25cf3805b8@quicinc.com>

On Sat, Nov 23, 2024 at 01:07:06PM +0800, Song Xue wrote:
> 
> 
> On 11/22/2024 6:24 AM, Dmitry Baryshkov wrote:
> > On Thu, Nov 21, 2024 at 04:09:27PM +0800, Song Xue wrote:
> > > Set the current load before enable regulator supplies at QUSB phy.
> > > 
> > > Encountered one issue where the board powered down instantly once the UVC
> > > camera was attached to USB port while adding host mode on usb port and
> > > testing a UVC camera with the driver on QCS615 platform. The extensible
> > > boot loader mentioned that OCP(Over Current Protection) occurred at LDO12
> > > from regulators-0 upon powered on board again. That indicates that the
> > > current load set for QUSB phy, which use the regulator supply, is lower
> > > than expected.
> > > 
> > > As per QUSB spec, set the maximum current load at 30mA to avoid overcurrent
> > > load when attach a device to the USB port.
> > > 
> > > Fixes: 937e17f36a32 ("phy: qcom-qusb2: Power-on PHY before initialization")
> > > Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> > > ---
> > > Changes in v2:
> > > - Removed "---" above the Fixes.
> > > - Link to v1: https://lore.kernel.org/r/20241121-add_set_load_to_qusb_phy-v1-1-0f44f3a3290e@quicinc.com
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qusb2.c | 13 ++++++++++++-
> > >   1 file changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > index c52655a383cef008552ed4533b9f31d1cbf34a13..80f0d17c42717e843937255a9a780bbae5998535 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > @@ -722,16 +722,27 @@ static int __maybe_unused qusb2_phy_runtime_resume(struct device *dev)
> > >   	return ret;
> > >   }
> > > +#define QUSB2PHY_HPM_LOAD 30000 /*uA*/
> > > +
> > >   static int qusb2_phy_init(struct phy *phy)
> > >   {
> > >   	struct qusb2_phy *qphy = phy_get_drvdata(phy);
> > >   	const struct qusb2_phy_cfg *cfg = qphy->cfg;
> > >   	unsigned int val = 0;
> > >   	unsigned int clk_scheme;
> > > -	int ret;
> > > +	int ret, i;
> > >   	dev_vdbg(&phy->dev, "%s(): Initializing QUSB2 phy\n", __func__);
> > > +	/* set the current load */
> > > +	for (i = 0; i < ARRAY_SIZE(qphy->vregs); i++) {
> > > +		ret = regulator_set_load(qphy->vregs[i].consumer, QUSB2PHY_HPM_LOAD);
> > 
> > Please use regulator_set_mode() instead. Or just fix the mode in the
> > device tree, if the device can not operate if the regulator is in
> > non-HPM mode.
> > 
> Thanks for comment.
> 
> From my point, regulator_set_mode() will change the regulator's operating
> mode including current and voltage, which will also influence the other
> shared consumers. Meanwhile it is unacceptable to fix mode in the device
> tree because it is determined by regulator's device tree.
> 
> According to the required fix, regulator_set_load() simply aggregates the
> current load for the regulator and does not affect other shared consumers.
> Setting the current load is relevant to the issue.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Regards,
> Song
> > > +		if (ret) {
> > > +			dev_err(&phy->dev, "failed to set load at %s\n", qphy->vregs[i].supply);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > >   	/* turn on regulator supplies */
> > >   	ret = regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
> > >   	if (ret)
> > > 
> > > ---
> > > base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
> > > change-id: 20241121-add_set_load_to_qusb_phy-d1327c797ffe
> > > 
> > > Best regards,
> > > -- 
> > > Song Xue <quic_songxue@quicinc.com>
> > > 
> > 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

