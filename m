Return-Path: <linux-arm-msm+bounces-6508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1368251BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 11:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06429B21791
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 10:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400A4250F9;
	Fri,  5 Jan 2024 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMnmdFc6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC7224B35
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-556ea884968so1613163a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 02:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704449959; x=1705054759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+hknyE2eZjhSwC6c7qytx4LWJUxTBkHsXIiXR8AEB9g=;
        b=iMnmdFc6JlHQHrpsp+Mh0Jr+1IvEeWNE/12qm+PW+8I8HX4hlqpNS0FK2ikwvgCQaK
         YX/GxwiZN4qbFnLuCY4l0pSNP+XgjHHk84LWhD+rBGj4kYmUOIPONiQRZKDYl+EQ6EQk
         KG3fu7bZfZWK+1rkDArmCZ93EQJDUMlqs0y7jUz2IIhnUZw+KJnEmrIL8bs+4mSNCOz1
         Wzx+sg43X/sJFYd8rtAnpilgXoNUIg4dnTcefXVIK6WGsy1WqQb+/lt3C0svSmN6vHgT
         PivLumVLRCDnbKoyoL9qpDxZsdpHucKfJigfIL6EZPZm8Vu0JQaQgBEtfURCup+oUaxs
         Xg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704449959; x=1705054759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hknyE2eZjhSwC6c7qytx4LWJUxTBkHsXIiXR8AEB9g=;
        b=p6AWRUYvmVIr5OaVlODZw81K6+wZ8WbfhjyukqDod5/PZ8JioJ0IzmljpHo2LItCIt
         qv6dDGac3XasPrTd7msxMYX3pk3+xMlerOdkELo7lOY/3HiVd0ZJYLVKB8AdaJy41nL/
         lZQPZELksua9W1VXTotlPitlbv5r2RjrFGf1eWM0Kx86IzenH+/EhZGiKrLRrHdjB2Pa
         Fk5O1khqVlNjWkFmkS758eTU1jWgETI4sUbnxQ1f3vsc8+cjj4r102Nf3JCoQDBnTjND
         vpl7tepZUcnAYaPzWiGh3sAcxP7WtegGloQaMR8U63jbaFvuYnQJchM6U4/Bbjq+AbHT
         EYPQ==
X-Gm-Message-State: AOJu0YxT1UinBrGaWwIMCcbJ6dMtlI9EDmAXa9HqRjX2+0MF1JLdTv+y
	NHMWCYnmwz+3MxqpEGa8y856B2wuSAlpB2aT0l3HrX+z7ZQ=
X-Google-Smtp-Source: AGHT+IE3bIe0HFtRGAoE31PPV2ROxvMXnzIVTMTKatLvHoWI9px662D1ICE5geEVV4tgfp9SXYk4ig==
X-Received: by 2002:a50:d78c:0:b0:557:41c4:cbdf with SMTP id w12-20020a50d78c000000b0055741c4cbdfmr25edi.49.1704449959074;
        Fri, 05 Jan 2024 02:19:19 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id bt6-20020a0564020a4600b0055510f6527dsm799566edb.26.2024.01.05.02.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 02:19:18 -0800 (PST)
Date: Fri, 5 Jan 2024 12:19:17 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qualcomm: eusb2-repeater: Drop the redundant
 zeroing
Message-ID: <ZZfXpWpFAELlUnUT@linaro.org>
References: <20240104-phy-qcom-eusb2-repeater-fixes-v1-0-047b7b6b8333@linaro.org>
 <20240104-phy-qcom-eusb2-repeater-fixes-v1-2-047b7b6b8333@linaro.org>
 <33b32e2b-fa35-448c-8b4c-c5c51a514922@linaro.org>
 <ZZfI66Mj6v/Qjp5X@linaro.org>
 <e216c027-dc23-415d-8d00-e6b1cbbd4248@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e216c027-dc23-415d-8d00-e6b1cbbd4248@linaro.org>

On 24-01-05 11:09:33, Konrad Dybcio wrote:
> On 5.01.2024 10:16, Abel Vesa wrote:
> > On 24-01-04 23:50:48, Konrad Dybcio wrote:
> >> On 4.01.2024 15:52, Abel Vesa wrote:
> >>> The local init_tlb is already zero initialized, so the entire zeroing loop
> >>> is useless in this case, since the initial values are copied over anyway,
> >>> before being written.
> >>>
> >>> Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
> >>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >>> ---
> >>
> >> That's another good spot.. partial struct initialization of
> >> pm8550b_init_tbl zeroes out the uninitialized fields.
> >>
> >>
> >>>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 10 ----------
> >>>  1 file changed, 10 deletions(-)
> >>>
> >>> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> >>> index 5f5862a68b73..3060c0749797 100644
> >>> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> >>> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> >>> @@ -156,16 +156,6 @@ static int eusb2_repeater_init(struct phy *phy)
> >>>  
> >>>  	regmap_field_update_bits(rptr->regs[F_EN_CTL1], EUSB2_RPTR_EN, EUSB2_RPTR_EN);
> >>>  
> >>> -	for (i = 0; i < F_NUM_TUNE_FIELDS; i++) {
> >>> -		if (init_tbl[i]) {
> >>> -			regmap_field_update_bits(rptr->regs[i], init_tbl[i], init_tbl[i]);
> >>> -		} else {
> >>> -			/* Write 0 if there's no value set */
> >>> -			u32 mask = GENMASK(regfields[i].msb, regfields[i].lsb);
> >>> -
> >>> -			regmap_field_update_bits(rptr->regs[i], mask, 0);
> >>> -		}
> >>> -	}
> >>>  	memcpy(init_tbl, rptr->cfg->init_tbl, sizeof(init_tbl));
> >>
> >> I think this patchset can be made even better, this memcpy is also
> >> useless and we can simply initialize init_tbl=rptr->cfg->init_tbl.
> > 
> > Actually no. The init_tbl in cfg is a pointer to const. Plus, if you do
> > that, you will end up with the same situation like in the other patch,
> > as there are some overrides based on DT values below this.
> 
> Hm, you're right. Maybe we should simple store *base and stop
> modifying these tables then. There's not a whole lot of regmap_rw
> calls, so making the first argument "rptr->base + rptr->regs[ASDF]"
> shouldn't add much fluff. Then we can make the cfg referernce const.
> 

Oh, sorry, did not see your reply in time before sending v2.

Have a look at v2 and we can decide if we want something different then.
https://lore.kernel.org/all/20240105-phy-qcom-eusb2-repeater-fixes-v2-0-775d98e7df05@linaro.org/

Thanks for reviewing.

> Konrad
> 
> > 
> > But now that I've had another look, maybe doing the exact same thing as
> > the other patch does (kmemdup) will probably look better anyway,
> > specially if we do that on probe.
> > 
> >>
> >> Konrad

