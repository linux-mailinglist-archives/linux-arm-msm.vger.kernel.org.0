Return-Path: <linux-arm-msm+bounces-34704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E0A9A1D22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 10:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77F3BB263E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 08:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5431C32EB;
	Thu, 17 Oct 2024 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lbrvH+rp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9A1D3198
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729153527; cv=none; b=ic+LGIFKfMdOkkHF+NU9tWX/3gWtWW1R+41yQomxC2sP0KCipVVjDfVkNDzO8A36qKvVJtxJOhhd31ZCfPpJhyXTlaV30jNl9oPFBUCnknE6LQnqk/Xwdg8d4/fW0dcmTNtxITPcVhJFUA6LAA2upHQwSf8zJgWgjz/Rkok8KNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729153527; c=relaxed/simple;
	bh=vJ2850YIw9zpwQnAlJ8fY5Et9RKyR/1CaGV9cj3t/+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qy9SBBmgkRRqWZ+xpcBi5J5ANuspK9uhocQWbfgWgHKkwyOKgfbCK09jXbfQOzjzPV8YndTRfeuZJxuHVmNONzhieDOLi4l0v0LgOceTbMdWt/wZfnON3CoVEabs3UrN3xiqakj9crOpc3s6RZnnW1xVRD3xb46YS8G6eshuV14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lbrvH+rp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43115887867so4424055e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 01:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729153523; x=1729758323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAuFaAoN6imciO1GAfvwo3YeafFUyaqgjhJYaOHMfWk=;
        b=lbrvH+rpbL1NIfj2Wc8ZikubmKm+9m/c3dZ1S8/HvkFqDsqhzn+OciyWJsLBDIaKoj
         ezUKJ/UJn2mSgfxuJbES95JLwTt2HdDsnOQjsclS9crnYRyF0kS5iLbzlQHp/adVSxNp
         wMcW6o89FFv9qmvn+gkqngL+hyaEBXP2aPxp4Vm3q+kxdjI0mV5PingdozBEHOUHR1f4
         aDSkFJeDvcvEpmzpVcWNdFS1pE/yQ/nEJurG9DJJpmULvc8IbIC4vY7rVHNHUzaFAiwK
         TNrNsLY19Ua29OGwXkU0i7eBgYCsxvfzFXk7AloYsdun4bQ63ZoIoe1jHp836DT0jusD
         5KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729153523; x=1729758323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAuFaAoN6imciO1GAfvwo3YeafFUyaqgjhJYaOHMfWk=;
        b=ruSKvjq0l4c3dgSTqz/qkX2Ga39QUydMRVvzIwBYxz22V2C+Whnb+5TL3Ah4HjkXiM
         pI2Qu83bkaIuR9JarJp/9nnHaVwMnsePNgJ+1wTAw+RcALCJ3WuE2+wC/hA4psa1FRJe
         0n+Vn3VQjs++XDASb1dbY4GxiNO7dBnNDTovBRBDKJLFKUezbuB1nMjQaksV75npf4Cs
         /jbU4oGwwRw4rU4XqQqv7Wo0uyUR9YtDCamNXJke79Ni7InjVR+Xw91moonpXZwwZJi/
         40baGDsSZcKJ89IDWbh3cSc5a3wPa/+K2F9EDjixc0mg5XoL+7oZY6DvnfR9qx9+t+TV
         aLiA==
X-Forwarded-Encrypted: i=1; AJvYcCUCMnDRZ7G+S9Qizn6dibNgv0Cmn3I5PCxlGEvzqxZKbL/Z0WxmERD9IDQZv5defjHsoG1X9ADq8gIMUeGN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1AnR1SN6ekRDO9iFDr1Fvp9D7vuzUCJB990PouwKRA0Qreq9x
	jFQTtWPdNp98+ZtCDj2OBIBetfn7W7UafWFEQQNNxVONnoKVK/d470AM1dMJJKQ=
X-Google-Smtp-Source: AGHT+IFp4auOO4BodaikUjGRGE5fVC/hx+jcDg3d/sgxwdAsN92x6H6rtbPNzyYvgobkI6VUu7jopw==
X-Received: by 2002:a05:600c:4fd2:b0:431:15f1:421d with SMTP id 5b1f17b1804b1-43158760531mr12843015e9.16.1729153523217;
        Thu, 17 Oct 2024 01:25:23 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158bd0f45sm18549795e9.0.2024.10.17.01.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:25:22 -0700 (PDT)
Date: Thu, 17 Oct 2024 11:25:20 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: typec: Add new driver for Parade PS8830
 Type-C Retimer
Message-ID: <ZxDJ8I6ZXOLv/KbR@linaro.org>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <Zw5i9dcSMOG4n3PW@hovoldconsulting.com>
 <Zw5oOUeN/v+tz+SY@linaro.org>
 <ZxCoDHq871x_0Nbm@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxCoDHq871x_0Nbm@hovoldconsulting.com>

On 24-10-17 08:00:44, Johan Hovold wrote:
> On Tue, Oct 15, 2024 at 04:03:53PM +0300, Abel Vesa wrote:
> > On 24-10-15 14:41:25, Johan Hovold wrote:
> > > On Fri, Oct 04, 2024 at 04:57:36PM +0300, Abel Vesa wrote:
> > > > The Parade PS8830 is a Type-C multi-protocol retimer that is controlled
> > > > via I2C. It provides altmode and orientation handling and usually sits
> > > > between the Type-C port and the PHY.
> 
> > > > This retimer is a LTTPR (Link-Training Tunable PHY Repeater) which means
> > > > it can support link training from source to itself. This means that the
> > > > DP driver needs to be aware of the repeater presence and to handle
> > > > the link training accordingly. This is currently missing from msm dp
> > > > driver, but there is already effort going on to add it. Once done,
> > > > full external DP will be working on all X1E laptops that make use of
> > > > this retimer.
> > > 
> > > I was gonna ask you to include the devicetree changes that enables the
> > > retimers as part of this series (to facilitate review and testing), but
> > > perhaps you should indeed not post them again until LTTPR support is in
> > > place.
> > 
> > I was thinking maybe we should not wait for LTTPR support as this series
> > brings orientation support as is. I still need to figure out how to
> > strip out the DP parts of it in such a way that orientation should still
> > be working but DP should not (until LTTPR is in).
> 
> Yeah, possible, or you can at least include the DT patches here but mark
> them as do-not-merge-yet or similar.

Sure, will do that. Will have to split the DP part of it into separate
patches and mark only those as do-not-merge-yet. 

> 
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > > Changes in v2:
> 
> > > > - Fixed coldplug (on boot) orientation detection.
> > > 
> > > Coldplug orientation detection still does not work here with this series
> > > applied.
> > > 
> > > I'm not entirely sure this whether worked better with v1, but with v2
> > > my SuperSpeed ethernet device shows up as a HighSpeed device in one
> > > orientation. It is also not disconnected an re-enumerated as SS as is
> > > the case on the X13s (and possibly with v1):
> > > 
> > > 	usb 1-1: new high-speed USB device number 2 using xhci-hcd
> > 
> > For coldplug, this series does the right thing as it leaves the retimer
> > initialized if it was left enabled at boot. There is a second part
> > needed for the coldplug to work. That is the regulator-boot-on property
> > in retimer's vregs nodes. That will ensure that the regulator is not
> > disabled until retimer driver probes and will keep the retimer initialized
> > until USB device is enumerated.
> 
> I can confirm that marking the regulators as having been left on by the
> bootloader so that they are not disabled temporarily during boot indeed
> fixes the coldplug issue here.
> 
> That however makes me wonder whether something is missing in the driver
> so that it still relies on setup having been done by the boot firmware.
> 
> Have you tried actually asserting reset during probe to verify that
> driver can configure the retimers itself without relying on the boot
> firmware?

We do not want to reset the retimers on probe because we won't be able
to figure out the orientation config until next pmic glink notify comes.
The pmic glink notify only triggers on USB event, which never comes
until you replug the device. So in order to have coldplug orientation
configured correctly in the retimer, we need to make sure the retimer
holds state until unplug.

> 
> Johan

