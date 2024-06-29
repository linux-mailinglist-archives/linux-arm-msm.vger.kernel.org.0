Return-Path: <linux-arm-msm+bounces-24715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF23D91CC9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 14:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2F35B2187C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 12:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D0A78C91;
	Sat, 29 Jun 2024 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7OC6870"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3C54278
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 12:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719662616; cv=none; b=lFv6eUSq7fReRELPJwSGqMR3iX8B++HbvdaJSglOWjV7ltNl1e33V3RTcBn8kMxw5pr0+rYOeDTZA8g8PRj871hqsTNNGP3Xcoxieth8WoSJpdvSz3LbSCGQhEvV59NmAw/DKzWbcgNct/yG1rcIUBVH/e1aVluZ6fkTae4fpM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719662616; c=relaxed/simple;
	bh=lArdPUADyKpjxHUN7n/CvkIS4KCsOhDeYHy/KXPHHIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rq2HQP3kuVKzen0ujdzxXrZVMZYM76hUzB4xNMTmVz6MPQ5WRdQub+sVnx4Mk0rhsWpkEyavTlwf5hj8+thcmleZc92V/mJYE1vQGBr/OCnofw3btf0RQt0nCfWPfigBRrOi5U41hMQMfqlD9XdCsQcPmC+yyJ2W3Dpj4vxem/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w7OC6870; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7226821ad86so978974a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719662614; x=1720267414; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPg9SKSgYNPb6kLAYzvHmB3z47IH8SpApe8V8/ZdD0s=;
        b=w7OC6870ThhhOY8D0zsBhKAs1Hlo5vKdVPpCsmZwtyvwxhuUQZt2MdIKfah4+fdSAv
         tzeFEziMvTuzLbzHBPyg5yoTDmtxVazwIN6bIuBht9doVKoItB9tKaDQ7DvxKBJ9RJ0c
         B1V0nrkPUCiw8ZAGZTuzIlrNLOaLGHQi4tolhXIyqFrsu5EisBhEIg4qXMek+4v2t1vS
         PBHSn9QK8CpyUs71S+7Qf4VRX9uxfrJLI0vmVIQsjPxhkC98wGNKpkbN+e2k2sjmGOi0
         ip1s9Njz485qyNstNvs3gKunfbLWDuStcrcPIHYFSakZL/pg542/wwseRJmiK+cheCMH
         806g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719662614; x=1720267414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPg9SKSgYNPb6kLAYzvHmB3z47IH8SpApe8V8/ZdD0s=;
        b=A0talL77wHZwShzG8mj21xqAmRlOZ/sFpRG5GTvjDolx4YQx2dB142ke2Efkwcjbog
         gywz0LskbC918lK79PtiQUt8cGPBa9gJxX2LWsFQUFdR9YQAFnIU7xuoLo/Y5F9oiqJM
         +/3hd9fosOoyJQe5Ps1TBPQHjhzL23lkHWgPxVPI7JUQkOYTo+LlW+PiPpsOygaZF6hv
         e6+bE+M7K5zci6hRus/YIsvX0Sy0ECAJJvgeJkZWUHqjrgEfxdkVCddAD7vKYb6riJzZ
         TtE87+OCmMqzPqS6GAbKHu5j1lcqLqdaTAjeKzhmoZuMNxbe+tpugdyM1oVmChJ8S2QE
         GaSA==
X-Forwarded-Encrypted: i=1; AJvYcCVmBBXkwMMNgNUfTXBrO0meZAe9VugyWF4ZP/cmUSiGIaExYF0b/oAVr3yKKVhYjfovQqu+P3BONVWenTW+dMAya6rC05lhGfNHdQ+SRA==
X-Gm-Message-State: AOJu0Yxp5irb2ZqqE/oFyu180jANV3jTaVGt8J6CeBNNjJna9dYDoMWk
	ie/35L38oB4cQrd3CpMBV/UCQebWfzdDEvOl8PquXZWNLD4ti0gbZoNJQUqphg==
X-Google-Smtp-Source: AGHT+IGrjryHFa529FoSoLFAluhRte5/p9zjbD12bPKViAwhKmDYQNdOp+qokHPowPDgPE5GH+I3sw==
X-Received: by 2002:a05:6a20:a11f:b0:1be:c35e:d47b with SMTP id adf61e73a8af0-1bef619949emr892312637.34.1719662614188;
        Sat, 29 Jun 2024 05:03:34 -0700 (PDT)
Received: from thinkpad ([220.158.156.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1596d55sm30873885ad.277.2024.06.29.05.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 05:03:33 -0700 (PDT)
Date: Sat, 29 Jun 2024 17:33:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	netdev@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v3 2/3] bus: mhi: host: Add name for mhi_controller
Message-ID: <20240629120222.GA4905@thinkpad>
References: <20240628073626.1447288-1-slark_xiao@163.com>
 <cde35f69-4d6e-d46d-88ca-9c5d6d5e757f@quicinc.com>
 <298e9aeb.2587.190630546b9.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <298e9aeb.2587.190630546b9.Coremail.slark_xiao@163.com>

On Sat, Jun 29, 2024 at 04:03:28PM +0800, Slark Xiao wrote:
> 
> At 2024-06-28 22:38:57, "Jeffrey Hugo" <quic_jhugo@quicinc.com> wrote:
> >On 6/28/2024 1:36 AM, Slark Xiao wrote:
> >>   For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> >>   This would lead to device can't ping outside successfully.
> >>   Also MBIM side would report "bad packet session (112)".
> >
> 
> >Weird indentation
> 
> My mistake. Will be corrected in next.
> 
> >
> >>   In oder to fix this issue, we decide to use the modem name
> >
> >"order"
> >
> >> to do a match in client driver side. Then client driver could
> >> set a corresponding mux_id value for this modem product.
> >> 
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >>   drivers/bus/mhi/host/pci_generic.c | 1 +
> >>   include/linux/mhi.h                | 2 ++
> >>   2 files changed, 3 insertions(+)
> >> 
> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> index 1fb1c2f2fe12..14a11880bcea 100644
> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> @@ -1086,6 +1086,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >>   	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
> >>   	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> >>   	mhi_cntrl->mru = info->mru_default;
> >> +	mhi_cntrl->name = info->name;
> >>   
> >>   	if (info->edl_trigger)
> >>   		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
> >> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> >> index b573f15762f8..86aa4f52842c 100644
> >> --- a/include/linux/mhi.h
> >> +++ b/include/linux/mhi.h
> >> @@ -361,6 +361,7 @@ struct mhi_controller_config {
> >>    * @wake_set: Device wakeup set flag
> >>    * @irq_flags: irq flags passed to request_irq (optional)
> >>    * @mru: the default MRU for the MHI device
> >> + * @name: name of the modem
> >
> 
> >Why restrict this to modems?  There are plenty of other MHI devices
> 
> Actually all MHI devices could be called modems. I don't think this is
> a wrong name.
> 

No, not all MHI controllers are modems. This driver is a generic driver for MHI
controllers. So use below description:

	'Product or device name of the MHI controller'

> >
> >>    *
> >>    * Fields marked as (required) need to be populated by the controller driver
> >>    * before calling mhi_register_controller(). For the fields marked as (optional)
> >> @@ -445,6 +446,7 @@ struct mhi_controller {
> >>   	bool wake_set;
> >>   	unsigned long irq_flags;
> >>   	u32 mru;
> >> +	const char *name;
> >
> 
> >Please run pahole
> 
> Emm, just checked,  there are 3 holes:
>     u32                        M3;                   /*   312     4 */
>     /* XXX 4 bytes hole, try to pack */
> ...
>     bool                       wake_set;             /*   526     1 */
>     /* XXX 1 byte hole, try to pack */
> ...
>     u32                        mru;                  /*   536     4 */
>     /* XXX 4 bytes hole, try to pack */
> 
> I will put 'const char *name' above 'u32 mru' to avoid the last hole.
> Is this okay?
> 

Just put it at the top.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

