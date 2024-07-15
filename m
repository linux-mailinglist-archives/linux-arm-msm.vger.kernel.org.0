Return-Path: <linux-arm-msm+bounces-26107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D3930DDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 08:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B455B20B92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 06:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842F64C61B;
	Mon, 15 Jul 2024 06:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vG/aomAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF88E1DFF8
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721024231; cv=none; b=boAAZSbWuFOp+KQarB2MVmm3AoS87K0K1ekZQDDaFc99ws9KqWcobQiOVVP0/HlRSGDvE9LysplRR1A+fR9jWIlMbF5gT+7cxP7AZiGcsA8HiY5zxNHjkv4RvT5NMKOXKj2ZmvD3txleCGZpOTy2LCReA+Fw5HHUmhiY3r2NKRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721024231; c=relaxed/simple;
	bh=OeWl2lZDTcX/Q1v/hR8TKfjOISBqUu6pjpymsVk96g8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2trPAwKnnrYQPRc7K3dzYAU3JlmNNVZWkUs9hrFerCBFloLBDabRUbV8xCd/g/FgfJRA+tf9qwNCNbvfDEaIktHFdYnpLvLmZhU9iA27GzybVWLvWZqmrrMBQgkRNOFhB5FolBM0Ptu065watCX7stqv+FUXTzVO6KcDXzTxLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vG/aomAC; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-64b05fab14eso37039767b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jul 2024 23:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721024229; x=1721629029; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7FUtQN9vDTiJfzF98mzhNDDsAK+z6KOdfiJ7WqBKQ68=;
        b=vG/aomACrRGRKysuYCLrxfHU2uDVh0HhycAQR9nyK9H7Wwzv82TUEin3re9qYUMCXn
         UpPlEe8eCDy/7JX1XmqhZJRiyATtTmi7e6uha43tIffEgWOZt5o9Bx+G71gCKr62t8Rv
         0E6p1flglHlmqTpIG9gZzWySzMoBCbW/pb6GzeSouCbkBLz9mteqTRDA52fUXE4JMZER
         JO1ou7Cq3LUMSTBeP9Wn3GKWvALIh7hO3Y5FedSdY/7A39X/4ItK+EwmQFDP0LcuDwGg
         M88I6TQzcAwice48c0jO6dFu4X2luVbDqXB4eTI/hYBUVN7zM1CbzWZUiVK0WAMN5f4x
         dMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721024229; x=1721629029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FUtQN9vDTiJfzF98mzhNDDsAK+z6KOdfiJ7WqBKQ68=;
        b=cGYnC89vcVIsnC8Whd+mvznmzHdrfWx0VtN1fLd4STWoWdg8ge9WVGX7TJzbH76SJ1
         5S1aNzQpjqiRCZEVPdaGTNraKnlOx9fDTW3y+mFzXJ0wjB05knOiM8muB9xPu11JKSOA
         StOnGsglfmzOz4Fzch+q6oTm69H6+t8VwnA2gsWCfV3vJtlWE9Pm6eD6zqA1tYY5KvEE
         0AlW6yekIvF5fE0dlAbp8qZWoPUDCy0Ypojn807WDFTtOaSPk/dtjwBysnPzixC83zd8
         Dk6id0FFKz7PNYNgaJmhmiHdsP/iZiZpTEr/9ITVee4EUcjGF6HE4uXfSvlrYvZVoIRs
         +p/w==
X-Forwarded-Encrypted: i=1; AJvYcCVOLtcvFd8eMEGzFDFTq177ifiYiSMHxDjIxS9ZZJH48eSlqx+rcE2Ge8C183Y4Bg6nOUum98WdJ1P+HO8lsATYWFJ4FWF/47uThLiB4A==
X-Gm-Message-State: AOJu0YwC+wBhpPDN2Ew9p8dRYQMuX6XEYow/vNuWiOjjKONNTX4SXFEP
	eDLTXsXMsreD7VaisnPKV5DRrUZoPV6LMJL09dmWi0F0z5TcvndNFRx4Opu37HUWu4/vaxCPIm+
	RuP14v+/3ZFNZF4LBf/IFKb7xevHrnLRu4nO4eQ==
X-Google-Smtp-Source: AGHT+IEZ2fRaW1s1xcwj4sECWbiwAvItL2nhiFv/Zq2IkJKf/c1TVSPGYiSNR5FSCCEHISuTNCaYJAorF0BXVc72vOQ=
X-Received: by 2002:a0d:c686:0:b0:61b:3304:b702 with SMTP id
 00721157ae682-658ee790e5bmr187202967b3.5.1721024228628; Sun, 14 Jul 2024
 23:17:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709015818.110384-1-slark_xiao@163.com> <dduv77mdqe633m7amyljhqas7nomrtjrrimvmyqidymy3qjvfa@biepierrz5p3>
 <17f0f426.4faf.190b4edaadd.Coremail.slark_xiao@163.com>
In-Reply-To: <17f0f426.4faf.190b4edaadd.Coremail.slark_xiao@163.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 09:16:57 +0300
Message-ID: <CAA8EJpoiOLYMhxyJbdrgnMVfVggL9cOWtX8L__YKd=RPQWOcSg@mail.gmail.com>
Subject: Re: Re: [PATCH] bus: mhi: host: Add firehose support for Foxconn SDX24/SDX55/SDX65
To: Slark Xiao <slark_xiao@163.com>
Cc: manivannan.sadhasivam@linaro.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 08:46, Slark Xiao <slark_xiao@163.com> wrote:
>
>
> At 2024-07-13 23:09:47, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> wrote:
> >On Tue, Jul 09, 2024 at 09:58:18AM GMT, Slark Xiao wrote:
> >> Since we implement the FIREHOSE channel support in foxconn mhi
> >> channels, that means each product which use this channel config
> >> would support FIREHOSE. But according to the trigger_edl feature,
> >> we need to enable it by adding '.edl_trigger = true' in device
> >> info struct.
> >> Also, we update all edl image path from 'qcom' to 'fox' in case of
> >> conflicting with other vendors.
> >
> >Separate patches please. Also don't use "we", just an imerative style:
> >do this and that.
> >
>
> Do you mean use 2 patches (1 for enabling trigger edl and 1 for
> modifying path)? Though these changes are aimed to make
> firehose download successfully.

Yes. "Do this. Also do that" is usually a sign that the patch should be split.

>
> >>
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >>  drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++++++------
> >>  1 file changed, 14 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> index 14a11880bcea..440609b81e57 100644
> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> @@ -433,8 +433,8 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >>
> >>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >>      .name = "foxconn-sdx55",
> >> -    .fw = "qcom/sdx55m/sbl1.mbn",
> >> -    .edl = "qcom/sdx55m/edl.mbn",
> >> +    .edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
> >
> >qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn
>
> what's your opinion?Mani
>
> >
> >> +    .edl_trigger = true,
> >>      .config = &modem_foxconn_sdx55_config,
> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >>      .dma_data_width = 32,
> >> @@ -444,8 +444,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >>
> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
> >>      .name = "foxconn-t99w175",
> >> -    .fw = "qcom/sdx55m/sbl1.mbn",
> >> -    .edl = "qcom/sdx55m/edl.mbn",
> >> +    .edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
> >
> >Is it the same file as the one mentioned in the previous chunk or is it
> >different?
> >
>
> They are same for same chip, though we have some variants.

Please excuse me, I can't fully understand. So are the files the same or not?

There is a simple mental experiment regarding the file names: you
should be able to have a single host rootfs, which supports working
with all of your modems at the same time, without modifications.
So if modem A and modem B might use file foo.bar and the file is the
same for all SDX55 modems, it's fine to have it in qcom/sdx55m/ or in
qcom/sdx55m/foxconn. If it is different depending on the end-device,
it should go to the qcom/sdx55m/foxconn/devname/ .

>
> >If they are different, then, please,
> >
> >qcom/sdx55m/foxconn/t99w175/prog_firehose_sdx55.mbn
> >
> >
> >> +    .edl_trigger = true,
> >>      .config = &modem_foxconn_sdx55_config,
> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >>      .dma_data_width = 32,
> >> @@ -455,8 +455,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
> >>
> >>  static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
> >>      .name = "foxconn-dw5930e",
> >> -    .fw = "qcom/sdx55m/sbl1.mbn",
> >> -    .edl = "qcom/sdx55m/edl.mbn",
> >> +    .edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
> >> +    .edl_trigger = true,
> >>      .config = &modem_foxconn_sdx55_config,
> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >>      .dma_data_width = 32,
> >> @@ -466,6 +466,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
> >>
> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
> >>      .name = "foxconn-t99w368",
> >> +    .edl = "fox/sdx65m/prog_firehose_lite.elf",
> >> +    .edl_trigger = true,
> >>      .config = &modem_foxconn_sdx55_config,
> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >>      .dma_data_width = 32,
> >> @@ -475,6 +477,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
> >>
> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
> >>      .name = "foxconn-t99w373",
> >> +    .edl = "fox/sdx65m/prog_firehose_lite.elf",
> >> +    .edl_trigger = true,
> >>      .config = &modem_foxconn_sdx55_config,
> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >>      .dma_data_width = 32,
> >> @@ -484,6 +488,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
> >>
> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
> >>      .name = "foxconn-t99w510",
> >> +    .edl = "fox/sdx24m/prog_firehose_sdx24.mbn",
> >> +    .edl_trigger = true,
> >>      .config = &modem_foxconn_sdx55_config,
> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >>      .dma_data_width = 32,
> >> @@ -493,6 +499,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
> >>
> >>  static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
> >>      .name = "foxconn-dw5932e",
> >> +    .edl = "fox/sdx65m/prog_firehose_lite.elf",
> >> +    .edl_trigger = true,
> >>      .config = &modem_foxconn_sdx55_config,
> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >>      .dma_data_width = 32,
> >> --
> >> 2.25.1
> >>
> >
> >--
> >With best wishes
> >Dmitry



-- 
With best wishes
Dmitry

